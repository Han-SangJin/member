package kr.or.ddit.member.web;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.login.web.LoginController;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceI;

@RequestMapping("/memberUpdate")
@Controller
@MultipartConfig
public class MemberUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	ApplicationContext context;
	
	
	@Resource(name="memberService")
	MemberServiceI memberService;
	
	
	@RequestMapping(path = "/view", method = RequestMethod.GET)	
	public String getView(Model model, String userid) {
		logger.debug("memberUpdate-Controller.getView()");
		logger.debug("Member-userid : {}", userid);
		
		MemberVo memberVo = memberService.getMember(userid);
		logger.debug("Member : {}", memberVo);
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberUpdate";	
	}
	
	
//	String userid, String usernm, String alias, String pass, String addr1, String addr2 ,String zipcode,
	@RequestMapping(path="/process", method = RequestMethod.POST)							
	public String process(Model model, MemberVo memberVo, BindingResult br ,@RequestPart("realFilename") MultipartFile file) { 
		
		logger.debug("memberUpdate - memberVo : {}", memberVo );
		logger.debug("filename : {} / realFilename : {} / size : {}", file.getName(), file.getOriginalFilename(), file.getSize());
		
		
		String Filename = "D:\\upload\\" + file.getOriginalFilename();
		File uploadFile = new File(Filename);
		
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		logger.debug("---------------------통과-------------------");
		
		memberVo.setFilename(Filename);
		memberVo.setRealFilename(file.getOriginalFilename());
		
		logger.debug("memberUpdate -memberVo : {}", memberVo );
		
		int updateCnt = memberService.updateMember(memberVo);
		System.out.println("updateCnt ::: " + updateCnt);
		
		if(updateCnt == 1){
			return "redirect:/member/view?userid="+ memberVo.getUserid();
		}else {
			return "tiles.member.memberUpdateContent";	
		}
	}

}
