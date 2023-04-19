package com.qna.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;
import com.qna.model.QnaDAO;
import com.qna.model.QnaDTO;

public class QnaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 검색 폼 페이지에서 넘어온 데이터를 가지고 검색어에 해당하는 게시글들을 Qna 테이블에서 조회하여 view page로 이동시키는 비지니스 로직.
		// ==> 동시에 페이징 작업 진행.
		String field = request.getParameter("field").trim();
		String keyword = request.getParameter("keyword").trim();
		String member_id = request.getParameter("id");
		MemberDAO mdao = MemberDAO.getInstance();
		MemberDTO mdto = mdao.contentById(member_id);
			
		int member_num = mdto.getMember_num();
		// 요청 : 게시물 전체 목록을 보여달라는 요청
		// 응답 : DB의 Qna 테이블의 전체 게시물 목록을 조회하여 view page로 이동시키는 비지니스 로직.
		// 비지니스 로직 진행 시 페이징 처리 작업까지 동시 진행.
		
//		QnaDAO dao = QnaDAO.getInstance();
//		List<QnaDTO> list = dao.getQnaList();
//		request.setAttribute("List", list);
		
		// 페이징 처리 작업 진행
		
		// 한 페이지당 보여질 게시물의 수
		int rowsize = 3;
		
		// 아래에 보여질 페이지 최대 블럭 수
		int block = 3;
		// 예) [1][2][3] / [4][5][6] / [7][8][9]
		
		// DB 상의 게시물의 전체 수
		int totalRecord = 0;
		
		// 전체 페이지 수
		int allPage = 0;
		
		// 현재 페이지 변수
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		
		// 해당 페이지에서 마지막 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		QnaDAO dao = QnaDAO.getInstance();
		
		// 검색 게시물의 수를 확인하는 메서드 호출
		totalRecord = dao.searchListCount(field, keyword);
		
		// 전체 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어 주어야 함.
		// 이 과정을 거치면 전체 페이지 수가 나오게 됨.
		// 이 때 전체 페이지 수가 나올 때 나머지가 있으면 무조건 전체 페이지 수를 하나 올려 주어야 함.
		// 무조건 전체 페이지 수를 하나 올려 주어야 함.
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<QnaDTO> searchList = dao.getSearchQnaList(field, keyword, page, rowsize);
		
		// 지금까지 페이징 처리 시 작업했던 모든 데이터들을 view page로 이동을 시키자.
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("field", field);
		request.setAttribute("keyword", keyword);
		request.setAttribute("List", searchList);
		request.setAttribute("Num", member_num);
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna_search.jsp");
		
		return forward;
	}

}
