<%@page import="dao.ActorDao"%>
<%@page import="vo.Actor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int actorId = Integer.parseInt(request.getParameter("actorId"));
	System.out.println(actorId +"/actorId/deleteActor");
	

	
	ActorDao actorDao = new ActorDao();
	actorDao.deleteActor(actorId);
	
	response.sendRedirect(request.getContextPath() + "/actor/actorList.jsp");
	
%>
