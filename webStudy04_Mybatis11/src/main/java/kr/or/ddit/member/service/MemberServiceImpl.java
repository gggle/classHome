package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.CommonException;
import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingInfoVO;

public class MemberServiceImpl implements IMemberService {
	
	// 의존 객체를 직접 생산하는 방식 : 결합력 최상
	IMemberDAO memberDAO = new MemberDAOImpl();

	@Override
	public ServiceResult registMember(MemberVO member) {
		ServiceResult result = null;
		// 아이디의 중복여부 확인을 먼저
		if(memberDAO.selectMember(member.getMem_id()) == null) {
			int rowCnt = memberDAO.insertMember(member);
			if(rowCnt >0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingInfoVO pagingVO) {
		 List<MemberVO> memberList = memberDAO.selectMemberList(pagingVO);
		 
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String mem_id) {
		MemberVO member = memberDAO.selectMember(mem_id);
		if(member == null) {
			throw new CommonException(mem_id+"에 해당하는 회원이 없음.");
		}
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		ServiceResult result = null;
		MemberVO chkMember = memberDAO.selectMember(member.getMem_id());
		
		if(chkMember.getMem_pass().equals(member.getMem_pass())) {
			int rowCnt = memberDAO.updateMember(member);
			if(rowCnt >0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		ServiceResult result = null;
		MemberVO chkMember = memberDAO.selectMember(member.getMem_id());
		
		if(chkMember.getMem_pass().equals(member.getMem_pass())) {
			int rowCnt = memberDAO.deleteMember(member.getMem_id());
			if(rowCnt >0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public long retrieveMemberCount(PagingInfoVO pagingVO) {
		return memberDAO.selectTotalRecord(pagingVO);
	}

}
