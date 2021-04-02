package kr.or.ddit.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.member.model.MemberVo;
						// @Resource(name="memberDao")로 호출 가능
@Repository("memberDao") //설정한 이름을 service 에서 호출가능, @repository를 스캔해서 root context 에서 빈객체로 지정
public class MemberDao implements MemberDaoI {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
											// mybatis 로 바로 호출하는 역할 data source 에 선언되어 있음 
	@Resource(name="sqlSessionTemplate")	//==  SqlSession sqlSession = MybatisUtil.getSession();
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public MemberVo getMember(String userid) {
		// SqlSession sqlSession = MybatisUtil.getSession();	
		MemberVo memberVo = sqlSession.selectOne("member.getMember", userid);
		
		// sqlSession.close();
		return memberVo;
	}
	
	
	
	@Override
	public List<MemberVo> selectMemberPageList(SqlSession sqlSession, PageVo pageVo) {
		return sqlSession.selectList("member.selectMemberPageList", pageVo);
	}
	
	@Override
	public int selectMemberTotalCnt(SqlSession sqlSession) {
		return sqlSession.selectOne("member.selectMemberTotalCnt");
	}
	
	
	

	@Override
	public List<MemberVo> selectAllMember() {
		//SqlSession sqlSession = MybatisUtil.getSession();
		List<MemberVo> memberList =  sqlSession.selectList("member.selectAllMember");
		logger.debug("memberList log4jdbc {} :");
		
		//sqlSession.close();
		return memberList;
	}

	
	@Override
	public int insertMember(MemberVo memberVo) {
		//SqlSession sqlSession = MybatisUtil.getSession();
		int insertCnt = 0;

			insertCnt = sqlSession.insert("member.insertMember", memberVo);
			System.out.println("MemberDao.java insertCnt : "+insertCnt);
		
		if(insertCnt >= 1) {
			//sqlSession.commit();
		}else {
			//sqlSession.rollback();
		}
		
		//sqlSession.close();
		return insertCnt;
	}
	
	
	@Override
	public int deleteMember(String userid) {
		//SqlSession sqlSession = MybatisUtil.getSession();
		int deleteCnt = sqlSession.delete("member.deleteMember", userid);
		
		if(deleteCnt >=1){
			//sqlSession.commit();
		}else{
			//sqlSession.rollback();
		}
		//sqlSession.close();
		return deleteCnt;
	}
	

	@Override
	public int updateMember(MemberVo memberVo) {
		//SqlSession sqlSession = MybatisUtil.getSession();
		int deleteCnt = sqlSession.update("member.updateMember", memberVo);
		
		if(deleteCnt >=1){
			//sqlSession.commit();
		}else{
			//sqlSession.rollback();
		}
		//sqlSession.close();
		return deleteCnt;
	}
	  
}
