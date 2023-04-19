package com.MapBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MapBoard.model.MapBoardDAO;
import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

@WebServlet("/board_update.go")
public class MapBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MapBoardUpdate() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("num").trim());
		MapBoardDAO mapdao = MapBoardDAO.getInstance();
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("UserId");
		MemberDAO mdao = MemberDAO.getInstance();
		MemberDTO dto = mdao.contentById(userId);
		int memNum = dto.getMember_num();
		
		int result = mapdao.clickAboutLike(board_num, memNum);

		if(result == 0) {
			mapdao.likeUp(board_num);
		}else {
			mapdao.likeDown(board_num);
		}
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		RequestDispatcher rd = request.getRequestDispatcher("board_content.go?no="+board_num+"&page="+page+"&check=true");
		rd.forward(request, response);

	}

}
