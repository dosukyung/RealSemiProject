package com.qna.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.qna.model.QnaDAO;
import com.qna.model.QnaDTO;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// qna_board 테이블의 전체 게시물을 조회하여 view page로 이동시키는 비지니스 로직.

		String member_id = request.getParameter("id");
		MemberDAO mdao = MemberDAO.getInstance();
		MemberDTO mdto = mdao.contentById(member_id);
			
		int member_num = mdto.getMember_num();

		QnaDAO dao = QnaDAO.getInstance();
		List<QnaDTO> pageList = dao.getQnaList();
		// ArrayList<String> nickList = new ArrayList<String>();
		for(QnaDTO qdto : pageList) {
			// nickList.add((mdao.contentByNum(qdto.getQna_writer())).getMember_nick());
			qdto.setQna_nick((mdao.contentByNum(qdto.getQna_writer())).getMember_nick());
		}
		
		request.setAttribute("List", pageList);
		request.setAttribute("Num", member_num);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna_list.jsp");
		
		return forward;
	}
}