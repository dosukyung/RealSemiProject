package com.MapBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MapBoard.model.MapBoardDAO;
import com.MapBoard.model.MapBoardDTO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;


@WebServlet("/board_content.go")
public class MapBoardContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MapBoardContent() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 넘어온 글 번호에 해당하는 게시글을 board 테이블에서 조회하여 게시글 상세 정보를
		// view page로 이동시키는 비지니스 로직.
		int board_no = Integer.parseInt(request.getParameter("no").trim());
		int page = Integer.parseInt(request.getParameter("page").trim());
		
		
		MapBoardDAO dao = MapBoardDAO.getInstance();
		
		if(request.getParameter("check") == null) {
			dao.mapBoardHit(board_no);
		}

		
		MapBoardDTO cont = dao.getContentMapBoard(board_no);
		
		MemberDAO mdao = MemberDAO.getInstance();
		
		MemberDTO mdto = mdao.contentByNum((dao.getContentMapBoard(board_no).getBoard_writer()));
		String nick = mdto.getMember_nick();
		cont.setNick(nick);

		request.setAttribute("content", cont);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("board_content.jsp");
		rd.forward(request, response);
	}

}
