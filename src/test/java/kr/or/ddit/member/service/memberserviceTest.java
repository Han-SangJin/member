package kr.or.ddit.member.service;
import static org.junit.Assert.*;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.ModelTestConfig;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.member.model.MemberVo;

@WebAppConfiguration
public class memberserviceTest extends ModelTestConfig {
	
	@Resource(name="memberService")
	private MemberServiceI memberService;
	
	
	
	// MemberVo getMember(String userId);
	@Test
	public void getMember_SUCCESS_Test() {
		/***Given***/
		String userid = "hsj";
		
		/***When***/
		MemberVo memberVo = memberService.getMember(userid);
		
		/***Then***/
		assertNotEquals(null, memberVo);
	}
	
	@Test
	public void getMember_FAIL_Test() {
		/***Given***/
		String userid = "sem";
		
		/***When***/
		MemberVo memberVo = memberService.getMember(userid);
		
		/***Then***/
		assertEquals(null, memberVo);
	}
	
	
	
	// List<MemberVo> selectAllMember();
	@Test
	public void selectAllMember_SUCCESS_Test() {
		/***Given***/

		/***When***/
		List<MemberVo> memberList = (List<MemberVo>) memberService.selectAllMember();
		
		/***Then***/
		assertNotEquals(null, memberList);
	}
	
	
	
	// int insertMember(MemberVo memberVo) 
	@Test
	public void insertMember_SUCCESS_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo("temp","dditpass","대덕인재","개발원","","","","","");

		/***When***/
		int insertCnt =memberService.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test	//테스트 코드 정지
	public void insertMember_FAIL_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo("ddit","dditpass","대덕인재","개발원","","","","","");
		
		/***When***/
		int insertCnt =memberService.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	
	
	// int deleteMember(String userid);
	@Test
	public void deleteMember_SUCCESS_Test() {
		/***Given***/
		String userid = "hsj";

		/***When***/
		int deleteCnt = memberService.deleteMember(userid);

		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void deleteMember_FAIL_Test() {
		/***Given***/
		String userid = "sem";

		/***When***/
		int deleteCnt = memberService.deleteMember(userid);

		/***Then***/
		assertEquals(0, deleteCnt);
	}
	

	
	// int updateMember(MemberVo memberVo);
	@Test
	public void updateMember_SUCCESS_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo();
		memberVo.setUserid("hsj");
		memberVo.setUsernm("");
		memberVo.setPass("abc");
		memberVo.setAlias("");
		memberVo.setAddr1("");
		memberVo.setAddr2("");
		memberVo.setZipcode("");
		memberVo.setFilename("");
		memberVo.setRealFilename("");
		
		/***When***/
		int updateCnt = memberService.updateMember(memberVo);

		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	@Test
	public void updateMember_FAIL_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo();
		memberVo.setUserid("sem");
		memberVo.setUsernm("");
		memberVo.setPass("abc");
		memberVo.setAlias("");
		memberVo.setAddr1("");
		memberVo.setAddr2("");
		memberVo.setZipcode("");
		memberVo.setFilename("");
		memberVo.setRealFilename("");
		
		/***When***/
		int updateCnt = memberService.updateMember(memberVo);

		/***Then***/
		assertEquals(0, updateCnt);
	}
	
	
	
	// Map<String, Object> selectMemberPageList(PageVo pageVo);
	@Test
	public void selectMemberPageList() {
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		
		/***When***/
		Map<String, Object> map = memberService.selectMemberPageList(pageVo);
		List<MemberVo> memberList = (List<MemberVo>) map.get("memberList");
		
		/***Then***/
		assertEquals(10, memberList.size());
	}
	
	
	
	// int selectMemberTotalCnt();
	@Test
	public void selectMemberTotalCnt() {
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		
		/***When***/
		int tatalcnt = memberService.selectMemberTotalCnt();
		
		/***Then***/
		assertEquals(33, tatalcnt);
	}
}
