<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>


<%
	//인코딩작업
	request.setCharacterEncoding("utf-8");
	//actorInsertForm에서 입력한 값을 받아옴
	String firstName = request.getParameter("firstName");
	System.out.println(firstName + "/firstName/actorInsertAction");
	
	String lastName = request.getParameter("lastName");
	System.out.println(lastName + "/lastName/actorInsertAction");
	//actor변수 지정한뒤 받아온값을 변수에 기입
	Actor actor = new Actor();
	actor.setFirstName(firstName);
	actor.setLastName(lastName);
	
	ActorDao actorDao = new ActorDao();
	actorDao.insertActor(actor);
	response.sendRedirect(request.getContextPath()+"/actor/actorList.jsp");
	
%>

