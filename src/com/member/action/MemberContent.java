package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberDAO;
import com.member.model.MemberDTO;

public class MemberContent implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.contentById(id);
		
		request.setAttribute("Dto", dto);
		return "myinformation.jsp";
	}

}
