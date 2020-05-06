<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Customer List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
<%
        CustomerDao customerDao = new CustomerDao();
        ArrayList<CustomerAndStoreAndAddress> customerList = customerDao.selectCustomerListAll();
%>
        <h1>Customer List</h1>
        <div>
       		<a href="<%=request.getContextPath() %>/customer/insertCustomerForm.jsp">추가 </a>     
        </div>
        <table>
        	<thead>
        		<tr>
	        		<th>CustomerId</th>
	        		<th>StoreId</th>
	        		<th>FirstName</th>
	        		<th>LastName</th>
	        		<th>Email</th>
	        		<th>AddressId</th>
	        		<th>Address</th>
	        		<th>Phone</th>
	        		<th>Active</th>
	        		<th>CreateDate</th>
	        		<th>LastUpdate</th>
        		</tr>
        	</thead>
        	<tbody>
<%
        		for(CustomerAndStoreAndAddress c : customerList) {
%>
        			<tr>
        				<td data-column="CustomerId"><%= c.getCustomer().getCustomerId() %></td>
        				<td data-column="StoreId"><%= c.getStore().getStoreId() %></td>
        				<td data-column="FirstName"><%= c.getCustomer().getFirstName() %></td>
        				<td data-column="LastName"><%= c.getCustomer().getLastName() %></td>
        				<td data-column="Email"><%= c.getCustomer().getEmail() %></td>
        				<td data-column="AddressId"><%= c.getAddress().getAddressId() %></td>
        				<td data-column="Address"><%= c.getAddress().getAddress() %></td>
        				<td data-column="Phone"><%= c.getAddress().getPhone() %></td>
        				<td data-column="Active"><%= c.getCustomer().getActive() %></td>
        				<td data-column="CreateDate"><%= c.getCustomer().getCreateDate() %></td>
        				<td data-column="LastUpdate"><%= c.getCustomer().getLastUpdate() %></td>
        			</tr>
<%		
        		}
%>
        	</tbody>
        </table>
        
</body>
</html>
