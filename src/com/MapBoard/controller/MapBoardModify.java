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

@WebServlet("/board_modify.go")
public class MapBoardModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MapBoardModify() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 넘어온 글번호에 해당하는 게시글을 MapBoard 테이블에서 조회하여
		// 수정 폼 페이지(view page)로이동시키는 비지니스 로직.
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		MapBoardDAO dao = MapBoardDAO.getInstance();
		
		MapBoardDTO cont = dao.getContentMapBoard(no);
		
		request.setAttribute("Modify", cont);
		
		RequestDispatcher rd = request.getRequestDispatcher("board_modify.jsp");
		rd.forward(request, response);
	}

}
