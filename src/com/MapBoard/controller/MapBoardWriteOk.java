package com.MapBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MapBoard.model.MapBoardDAO;
import com.MapBoard.model.MapBoardDTO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

@WebServlet("/board_write_ok.go")
public class MapBoardWriteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MapBoardWriteOk() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩 설정 작업.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 글쓰기 폼 페이지에서 넘어온 데이터들을 board 테이블에 저장하는 비지니스 로직.
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("UserId");
		MemberDAO mdao = MemberDAO.getInstance();
		MemberDTO mdto = mdao.contentById(member_id);
	
		String field = request.getParameter("field").trim();
		int writer = mdto.getMember_num();
		String title = request.getParameter("title").trim();
		String cont = request.getParameter("cont").trim();
		String file = request.getParameter("file").trim();
		
		if(field.equals("dona")) {
			field = "나눔";
		} else if(field.equals("boast")) {
			field = "자랑";
		} else if(field.equals("share")) {
			field = "정보 공유";
		} else if(field.equals("free")) {
			field = "자유글";
		}
		
		MapBoardDTO dto = new MapBoardDTO();
		
		dto.setBoard_head(field);
		dto.setBoard_writer(writer);
		dto.setBoard_title(title);
		dto.setBoard_text(cont);
		dto.setBoard_file(file);
		
		System.out.println(dto.getBoard_title());
		MapBoardDAO dao = MapBoardDAO.getInstance();
		
		int check = dao.insertMapBoard(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 등록 성공 :)')");
			out.println("location.href='board_list.go'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시글 등록 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	

}
