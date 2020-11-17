package kr.or.ddit.member.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.login.web.LoginController;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping("/memberList")
@Controller
public class MemberListController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	ApplicationContext context;
	
	
	@Resource(name="memberService")
	MemberServiceI memberService;
	
	
	@RequestMapping(path = "/view", method = RequestMethod.GET)	
	public String getView() {
		logger.debug("MemberList-Controller.getView()");
		return "redirect:/memberList/process";	
	}
	
	
	@RequestMapping(path="/process")							
	public String boardSelectAll(HttpSession session, Model model, MemberVo memberVo,
			@RequestParam(name="page", required = true, defaultValue = "1") String page_str,
			@RequestParam(name="pageSize", required = true, defaultValue = "5") String pageSize_str){

			logger.debug("Board-Controller.boardselectall()");
			PageVo pageVo = new PageVo();
			pageVo.setPage(Integer.parseInt(page_str));
			pageVo.setPageSize(Integer.parseInt(pageSize_str));
			Map<String, Object> map = memberService.selectMemberPageList(pageVo);
			
			logger.debug("memberList() - map : " + map);
			session.setAttribute("memberList", map.get("memberList"));
			model.addAttribute("pages", map.get("pages"));
			model.addAttribute("page", Integer.parseInt(page_str));
			model.addAttribute("pageSize", Integer.parseInt(pageSize_str));
			
			
		return "member/memberList";	
		
	}
	
	
	
	

}
