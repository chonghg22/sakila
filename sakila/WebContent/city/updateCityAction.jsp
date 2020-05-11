<%@page import="dao.CityDao"%>
<%@page import="vo.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	System.out.println(cityId+"/cityId/updateCityAction");
	String city = request.getParameter("city");
	System.out.println(city+"/city/updateCityAction");
	int countryId = Integer.parseInt(request.getParameter("countryId"));
	System.out.println(countryId + "/countryId/updateCtiy");
	
	City c = new City();
	c.setCityId(cityId);
	c.setCity(city);
	c.setCountryId(countryId);
	
	CityDao cityDao = new CityDao();
	cityDao.updateCity(c);
	response.sendRedirect(request.getContextPath()+"/city/cityList.jsp");
	
%>