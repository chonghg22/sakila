<%@page import="dao.CustomerDao"%>
<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int customerId = Integer.parseInt(request.getParameter("customerId"));
	System.out.println(customerId + "/customerId/updateCustomerAction");
	
	int storeId = Integer.parseInt(request.getParameter("sotreId"));
	System.out.println(storeId + "/storeId/updateCustomerAction");
	
	String firstName = request.getParameter("firstName");
	System.out.println(firstName + "/firstName/updateCustomerAction");
	
	String lastName = request.getParameter("lastName");
	System.out.println(lastName + "/lastName/updateCustomerAction");
	
	String email = request.getParameter("email");
	System.out.println(email + "/email/updateCustomerAction");
	
	int addressId = Integer.parseInt(request.getParameter("addressId"));
	System.out.println(addressId + "/addressId/updateCustomerAction");
	
	int active = Integer.parseInt(request.getParameter("active"));
	System.out.println(active + "/active/updateCustomerAction");
	
	Customer customer = new Customer();
	customer.setCustomerId(customerId);
	customer.setStoreId(storeId);
	customer.setFirstName(firstName);
	customer.setLastName(lastName);
	customer.setEmail(email);
	customer.setAddressId(addressId);
	customer.setActive(active);
	
	CustomerDao customerDao = new CustomerDao();
	
%>