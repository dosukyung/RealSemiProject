package com.MapBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MapBoard.model.MapBoardDAO;
import com.MapBoard.model.MapBoardDTO;
import com.member.model.MemberDAO;

@WebServlet("/board_search.go")
public class MapBoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MapBoardSearch() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 폼 창에서 넘어온 검색어를 가지고 DB에서 검색어에 해당하는
		// 모든 게시물을 가져와서 view page로 이동시키는 비지니스 로직.
		
		// 한글 처리 작업.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String field = request.getParameter("field").trim();
		String kw = request.getParameter("keyword").trim();
		String location = request.getParameter("location").trim();
		
		MapBoardDAO dao = MapBoardDAO.getInstance();
		List<MapBoardDTO> sl = dao.searchMapBoard(field, kw, location);
		
		MemberDAO mdao = MemberDAO.getInstance();
		
		for(MapBoardDTO dto : sl) {
			 dto.setNick((mdao.contentByNum(dto.getBoard_writer())).getMember_nick());
		}
		
		request.setAttribute("Search", sl);
		
		RequestDispatcher rd = request.getRequestDispatcher("board_search.jsp?location="+location);
		rd.forward(request, response);
	}

}
