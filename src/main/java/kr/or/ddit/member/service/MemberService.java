package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.member.dao.MemberDaoI;
import kr.or.ddit.member.model.MemberVo;

@Transactional	// 트랜젝션 어노테이션이 붙을수 있는곳은 service 뿐임, service 에서
@Service("memberService")		// @service Bean 객체 선언, web에서 @Resource(name="memberService") 로 사용가능
public class MemberService implements MemberServiceI {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Resource(name="memberDao")	// Dao 에서 @Repository로 지정한 이름
	private MemberDaoI memberDao;
	

	public void setMemberDao(MemberDaoI memberDao) {
		this.memberDao = memberDao;
	}
	
	
	// service 기본 생성자
	public MemberService() {
		
	}
	

	
	
	// 멤버 체크
	@Override
	public MemberVo getMember(String userid) {
		return memberDao.getMember(userid);
	}
	
	
	@Override
	public List<MemberVo> selectAllMember() {
		return memberDao.selectAllMember();
	}
	
	
	@Override
	public int insertMember(MemberVo memberVo) {
		return memberDao.insertMember(memberVo);
	}
		
	
	@Override
	public int deleteMember(String userid) {
		return memberDao.deleteMember(userid);
	}
		
	@Override
	public int updateMember(MemberVo memberVo) {
		return memberDao.updateMember(memberVo);
	}
	 
	
	
	@Override
	public Map<String, Object> selectMemberPageList(PageVo pageVo) {
		
		SqlSession sqlSession = MybatisUtil.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectAllBoard", memberDao.selectMemberPageList(sqlSession,pageVo));
		
		
		// 15건 ==(페이지사이즈 7)==> 3페이지
		// 15/7 ==  2.14.. ==(올림)==> 3페이지 
		int totalCnt = memberDao.selectMemberTotalCnt(sqlSession);
		int pages = (int)Math.ceil((double)totalCnt/7);
		map.put("pages", pages);
		
		sqlSession.close();
		return map;
	}
	 
	
	@Override
	public int selectMemberTotalCnt() {
		SqlSession sqlSession = MybatisUtil.getSession();
		return memberDao.selectMemberTotalCnt(sqlSession);
	}

}
