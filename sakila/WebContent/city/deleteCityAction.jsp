<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	System.out.println(cityId +"/cityId/deleteActor");
	

	
	CityDao cityDao = new CityDao();
	cityDao.deleteCity(cityId);
	
	response.sendRedirect(request.getContextPath() + "/city/cityList.jsp");
	
%>
