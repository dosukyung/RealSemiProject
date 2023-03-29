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
		
		MapBoardDAO dao = MapBoardDAO.getInstance();
		
		dao.mapBoardHit(board_no);
		
		MapBoardDTO cont = dao.getContentMapBoard(board_no);
		
		request.setAttribute("content", cont);
		
		RequestDispatcher rd = request.getRequestDispatcher("board_content.jsp");
		rd.forward(request, response);
	}

}
