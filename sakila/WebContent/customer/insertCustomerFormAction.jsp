<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//인코딩작업
	request.setCharacterEncoding("UTF-8");
	//insertCustomerForm에서 입력한 값들 받아오기
	int storeId = Integer.parseInt(request.getParameter("storeId"));
	System.out.println(storeId +"/storeId/insertCustomer");
	
	String firstName = request.getParameter("firstName");
	System.out.println(firstName + "/firstName/insertCustomer");
	
	String lastName = request.getParameter("lastName");
	System.out.println(lastName + "/lastName/insertCustomer");
	
	int addressId = Integer.parseInt(request.getParameter("addressId"));
	System.out.println(addressId + "/addressId/insertCustomer");
	
	String email = request.getParameter("email");
	System.out.println(email + "/email/insertCustomer");
	
	int active = Integer.parseInt(request.getParameter("active"));
	System.out.println(active + "/active/insertCustomer");
	//객체 선언 후 입력한 값을 변수에 기입
	Customer customer = new Customer();
	customer.setStoreId(storeId);
	customer.setFirstName(firstName);
	customer.setLastName(lastName);
	customer.setAddressId(addressId);
	customer.setEmail(email);
	customer.setActive(active);
	
	CustomerDao cuDao = new CustomerDao();
	cuDao.insertCustomerFormAction(customer);

	response.sendRedirect(request.getContextPath()+"/customer/customerList.jsp");
%>