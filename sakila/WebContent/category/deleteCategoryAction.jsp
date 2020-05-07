<%@page import="dao.Category"%>
<%@page import="vo.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int actorId = Integer.parseInt(request.getParameter("actorId"));
	System.out.println(actorId +"/actorId/deleteActor");
	

	
	CategoryDao actorDao = new CategoryDao();
	categoryDao.deleteActor(actorId);
	
	response.sendRedirect(request.getContextPath() + "/actor/actorList.jsp");
	
%>
