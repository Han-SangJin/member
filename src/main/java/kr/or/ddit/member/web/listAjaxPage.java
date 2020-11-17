package kr.or.ddit.member.web;


import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.login.web.LoginController;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping("/member")
@Controller
public class listAjaxPage {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired	// ioc.xml내용 자동으로 불러옴
	
	@Resource(name="memberService")
	MemberServiceI memberService;
	
	
	@RequestMapping("/listAjaxPage")
	public String listAjaxPage() {
		return "tiles.member.listAjaxPage";
	}
	 
	
	// 페이지 요청 (/list와 다르게 page, pageSize 파라미터가 반드시 존재한다는 가정으로 작성)
	@RequestMapping("/listAjax")
	public String listAjax(PageVo pageVo, Model model) {
		logger.debug("pageVo : {}", pageVo);
		
		Map<String, Object> map = memberService.selectMemberPageList(pageVo);
		model.addAttribute("memberList", map.get("memberList"));
		
		logger.debug("listAjax map.get(\"memberList\") : {}", map.get("memberList"));
		System.out.println( map.get("memberList"));
		
		model.addAttribute("pages", map.get("pages"));
		
		return "jsonView";
	}
	
	
	// 페이지 요청 (/list와 다르게 page, pageSize 파라미터가 반드시 존재한다는 가정으로 작성)
		@RequestMapping("/listAjaxHTML")
		public String listAjaxHTML(PageVo pageVo, Model model) {
			
			logger.debug("pageVo : {}", pageVo);
			
			Map<String, Object> map = memberService.selectMemberPageList(pageVo);
			model.addAttribute("memberList", map.get("memberList"));
			model.addAttribute("pages", map.get("pages"));
			
			// 응답을 html==> jsp 로 생성
			return "member/listAjaxHTML";
		}
	
	

//	public String process(String page_str, @RequestParam(name="page", required = true, defaultValue = "1") int page
//			, String pageSize_str, @RequestParam(name="pageSize", required = true, defaultValue = "5") int pageSize
//			, Model model) { 
	
}
