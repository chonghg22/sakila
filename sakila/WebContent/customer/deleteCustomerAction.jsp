<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int customerId = Integer.parseInt(request.getParameter("customerId"));
	System.out.println(customerId +"/customerId/deleteCustomer");
	

	
	CustomerDao customerDao = new CustomerDao();
	customerDao.deleteCustomer(customerId);
	
	response.sendRedirect(request.getContextPath() + "/customer/customerList.jsp");
	
%>
