package kr.or.ddit.member.web;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.login.web.LoginController;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceI;

@MultipartConfig
@RequestMapping("/memberRegist")
@Controller
public class MemberRegistController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	ApplicationContext context;
	
	
	@Resource(name="memberService")
	MemberServiceI memberService;
	
	
	@RequestMapping(path = "/view", method = RequestMethod.GET)	
	public String getView() {
		logger.debug("memberRegist-Controller.getView()");
		return "member/memberRegist";	
	}
	
	//#{userid}, #{usernm}, #{pass}, SYSDATE, #{alias}, #{addr1}, #{addr2}, #{zipcode}, #{filename}, #{realFilename})
	//	,@RequestPart("realFilename") MultipartFile file
	
//		// 스프링 검증자  BindingResult    MemberVoValidator
//		// 검증을 통과하지 못했으므로 사용자 등록화면으로 이동
//		new MemberVoValidator().validate(memberVo, br);		// VO클래스에 어노테이션을 (@NotEmpty)을 붙이면 사용하지 않아도됨
//		
	
	
	@RequestMapping(path="/process", method = RequestMethod.POST)							
	public String process(@Valid MemberVo memberVo, BindingResult br ,@RequestPart("realFilename") MultipartFile file) { 
		
		logger.debug("memberVo : {}", memberVo );
		logger.debug("filename : {} / realFilename : {} / size : {}", file.getName(), file.getOriginalFilename(), file.getSize());
		
	
//		logger.debug("br.hasErrors() : {}", br.hasErrors() );
//		if(br.hasErrors()) {					// 왜 안될까...... 메세지는 제대로 뜨는데...
//			return "member/memberRegist";	
//		}
		
		// jsp에서 넘어오는 <input type = file name="realfilename> 이름이 겹쳐서 mapping이 값을 넣어주려고 하기 때문에 이름이 겹치지 않게 해주어야 한다.
		String Filename = "D:\\upload\\" + file.getOriginalFilename();
		File uploadFile = new File(Filename);
		
		// 파일 업로드		// 이미지 파일 realname, name 둘중 하나만 값이 있으면 오류발생 둘다 널이면 괜찮음
		try {
			file.transferTo(uploadFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		logger.debug("---------------------통과-------------------");
		
		memberVo.setFilename(Filename);
		memberVo.setRealFilename(file.getOriginalFilename());
		
//		 사용자 정보 등록   ,real_Filename,file.getOriginalFilename()     , real_Filename, file.getOriginalFilename()
//		memberVo = new MemberVo();
		
		logger.debug("memberVo : {}", memberVo);
		int insertCnt = memberService.insertMember(memberVo);
		logger.debug("insertCnt : {}", insertCnt);
		
		//try {
		if(insertCnt == 1){
			return "redirect:/memberList/view";
		//}catch() {
			
		//}
		
			
		}else {
			return "member/memberRegist";
		}
	}
	
}
