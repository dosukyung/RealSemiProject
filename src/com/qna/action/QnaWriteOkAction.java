package com.qna.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.qna.model.QnaDAO;
import com.qna.model.QnaDTO;

public class QnaWriteOkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 글쓰기 폼 페이지에서 넘어온 데이터들을 board 테이블에 저장하는 비지니스 로직.

		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("UserId");
		MemberDAO mdao = MemberDAO.getInstance();
		MemberDTO mdto = mdao.contentById(member_id);
		
		String qna_head = request.getParameter("field").trim();
		int qna_writer = mdto.getMember_num();
		String qna_title = request.getParameter("title").trim();
		String qna_cont = request.getParameter("cont").trim();
		String qna_file = request.getParameter("file").trim();
		
		if(qna_head.equals("title")) {
			qna_head = "자유";
		} else if(qna_head.equals("account")) {
			qna_head = "계정";
		} else if(qna_head.equals("report")) {
			qna_head = "신고";
		} else if(qna_head.equals("else")) {
			qna_head = "기타";
		}
		
		QnaDTO dto = new QnaDTO();
		dto.setQna_head(qna_head);
		dto.setQna_writer(qna_writer);
		dto.setQna_title(qna_title);
		dto.setQna_text(qna_cont);
		dto.setQna_file(qna_file);
		
		QnaDAO dao = QnaDAO.getInstance();
		int check = dao.insertQna(dto);
		PrintWriter out = response.getWriter();
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 등록 성공')");
			out.println("location.href='qna_list.so?id="+member_id+ "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시글 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
