<%@page import="dao.ActorDao"%>
<%@page import="vo.Actor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int actorId = Integer.parseInt(request.getParameter("actorId"));
	System.out.println(actorId + "/actorId/updateActor");
	
	String firstName = request.getParameter("firstName");
	System.out.println(firstName + "/firstName/updateActor");
	
	String lastName = request.getParameter("lastName");
	System.out.println(lastName + "/lastName/updateActor");
	
	Actor actor = new Actor();
	actor.setActorId(actorId);
	actor.setFirstName(firstName);
	actor.setLastName(lastName);
	
	ActorDao actorDao = new ActorDao();
	actorDao.updateActor(actor);
	response.sendRedirect(request.getContextPath()+"/actor/actorList.jsp");
	

%>