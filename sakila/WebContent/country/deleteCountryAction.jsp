<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	System.out.println(countryId +"/countryId/deleteCountry");
	

	
	CountryDao countryDao = new CountryDao();
	countryDao.deleteCountry(countryId);
	
	response.sendRedirect(request.getContextPath() + "/country/countryList.jsp");
	
%>
