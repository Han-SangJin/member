package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.member.model.MemberVo;

public interface MemberDaoI {
	
	
	MemberVo getMember(String userId);
	
	List<MemberVo> selectAllMember();
	
	int insertMember(MemberVo memberVo);
	
	int deleteMember(String userid);
	
	int updateMember(MemberVo memberVo);
	
	List<MemberVo> selectMemberPageList(SqlSession sqlSession, PageVo pageVo);
	
	int selectMemberTotalCnt(SqlSession sqlSession);
	 
}
