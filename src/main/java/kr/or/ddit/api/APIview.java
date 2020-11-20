package kr.or.ddit.api;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ch.qos.logback.classic.Logger;
import kr.or.ddit.login.web.LoginController;

@RequestMapping("/APIview")
@Controller
public class APIview {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginController.class);
	
	
	
	@RequestMapping(path = "/googlemapview", method = RequestMethod.GET )	
	public String GoogleMapView() {
		logger.debug("====GoogleMapAPI====");
		return "api/googlemap";
	}
	
	
	
	
	@RequestMapping(path = "/navermapview", method = RequestMethod.GET )	
	public String NaverMapView() {
		logger.debug("====NaverMapAPI====");
		return "api/navermap";
	}
	
	
	
	
	@RequestMapping(path = "/chatbotview", method = RequestMethod.GET )	
	public String ChatBotView() {
		logger.debug("====ChatBotAPI====");
		return "api/chatbot";
	}
}
