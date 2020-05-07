<%@page import="dao.AddressDao"%>
<%@page import="vo.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int addressId = Integer.parseInt(request.getParameter("addressId"));
	System.out.println(addressId +"/addressId/deleteActor");
	

	
	AddressDao addressDao = new AddressDao();
	addressDao.deleteAddress(addressId);
	
	response.sendRedirect(request.getContextPath() + "/address/addressList.jsp");
	
%>
