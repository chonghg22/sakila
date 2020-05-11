<%@page import="dao.CountryDao"%>
<%@page import="vo.Country"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	System.out.println(countryId + "/countryId/updateCountryAction");
	
	String country = request.getParameter("country");
	System.out.println(country + "/country/updateCountryAction");
	
	Country c = new Country();
	c.setCountryId(countryId);
	c.setCountry(country);
	
	CountryDao countryDao = new CountryDao();
	countryDao.updateCountry(c);
	response.sendRedirect(request.getContextPath()+"/country/countryList.jsp");
	
	
%>