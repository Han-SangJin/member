package kr.or.ddit.member.repository;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.ModelTestConfig;
import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVo;

@WebAppConfiguration
public class MemberDaoTest extends ModelTestConfig {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDaoTest.class);
	
	@Resource(name="memberDao")
	private MemberDaoI memberDao;
	

	// MemberVo getMember(String userId);
	@Test
	public void getMember_SUCCESS_Test() {
		/***Given***/
		String userid = "hsj";
		
		/***When***/
		MemberVo memberVo = memberDao.getMember(userid);
		
		/***Then***/
		assertNotEquals(null, memberVo);
	}
	
	@Test
	public void getMember_FAIL_Test() {
		/***Given***/
		String userid = "sem";
		
		/***When***/
		MemberVo memberVo = memberDao.getMember(userid);
		
		/***Then***/
		assertEquals(null, memberVo);
	}
	
	
	
	// List<MemberVo> selectAllMember();
	@Test
	public void selectAllMemberTest() {
		/***Given***/
		
		/***When***/
		List<MemberVo> memberList = memberDao.selectAllMember();
		 
		/***Then***/
		assertTrue(memberList.size() > 15);
	}
	
	
	
	// int insertMember(MemberVo memberVo) 
	@Test
	public void insertMember_SUCCESS_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo("temp","dditpass","대덕인재","개발원","","","","","");

		/***When***/
		int insertCnt =memberDao.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	 @Test	//테스트 코드 정지
	public void insertMember_FAIL_Test() {
		/***Given***/
		MemberVo memberVo = new MemberVo("ddit","dditpass","대덕인재","개발원","","","","","");
		
		/***When***/
		int insertCnt =memberDao.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	
	
	// int deleteMember(String userid);
	@Test
	public void deleteMember_SUCCESS_Test() {
		/***Given***/
		String userid = "hsj";

		/***When***/
		int deleteCnt = memberDao.deleteMember(userid);

		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void deleteMember_FAIL_Test() {
		/***Given***/
		String userid = "sem";

		/***When***/
		int deleteCnt = memberDao.deleteMember(userid);

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
		int updateCnt = memberDao.updateMember(memberVo);

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
		int updateCnt = memberDao.updateMember(memberVo);

		/***Then***/
		assertEquals(0, updateCnt);
	}
	
	
	// List<MemberVo> selectMemberPageList(SqlSession sqlSession, PageVo pageVo);
	@Test
	public void selectMemberPageList() {
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		
		/***When***/
		SqlSession sqlSession = MybatisUtil.getSession();
		List<MemberVo> memberList = (List<MemberVo>) memberDao.selectMemberPageList(sqlSession,pageVo);
		
		/***Then***/
		assertEquals(10, memberList.size());
	}
	
	
	
	// int selectMemberTotalCnt(SqlSession sqlSession);
	@Test
	public void selectMemberTotalCnt() {
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		
		/***When***/
		SqlSession sqlSession = MybatisUtil.getSession();
		int tatalcnt = memberDao.selectMemberTotalCnt(sqlSession);
		
		/***Then***/
		assertEquals(33, tatalcnt);
	}

}
