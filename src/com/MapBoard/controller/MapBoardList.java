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

@WebServlet("/board_list.go")
public class MapBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public MapBoardList() {
		super();
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 페이징 처리 작업 진행
		
		String location = request.getParameter("location");
		System.out.println("location >>> " + location);

		// 웹페이지당 보여질 게시물의 수
		int rowsize = 5;
		
		// 아래에 보여질 페이지 최대 블럭 수
		int block = 5;
		
		// DB상의 게시물의 수
		int totalRecord = 0;
		
		// 전체 페이지 수
		int allpage = 0;
		
		// 현재 페이지 변수
		int page = 0;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		} else {
			// 처음으로 "전체 게시글 목록" a 태그를 클릭한 경우
			page = 1;
		}
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page-1) /block)*block) + 1;
		
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page-1) /block)*block) + block;
		
		MapBoardDAO dao = MapBoardDAO.getInstance();
		
		// 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = dao.getMapBoardCount();
		
		// 전체 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어 주어야 함.
		// 이 과정을 거치면 전체 페이지 수가 나오게 됨.
		// 이 때 전체 페이지 수가 나올 때 나머지가 있으면 무조건 전체 페이지 수를 하나 올려주어야 한다.
		allpage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endBlock > allpage) {
			endBlock = allpage;
		}
		
		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<MapBoardDTO> pageList = dao.getMapBoardList(page, rowsize);
		
		
		// 지금까지 페이징 처리 시 작업했던 모든 데이터들을 view page로 이동을 시키자.
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allpage", allpage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);
		
		RequestDispatcher rd = request.getRequestDispatcher("board_list.jsp");
		rd.forward(request, response);
	}

}
