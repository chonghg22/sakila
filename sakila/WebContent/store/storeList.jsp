<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Store List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
<%
        StoreDao storeDao = new StoreDao();
        ArrayList<StoreAndStaff> storeAndStaffList = storeDao.selectStoreListAll();
%>
        <h1>Store List</h1>
        <div>
        	<a href="<%= request.getContextPath() %>/store/insertStoreForm.jsp">추가</a>    
        </div>
    		<table>
    			<thead>
    				<tr>
    					<th>StoreId</th>
    					<th>ManagerStaffId</th>
    					<th>ManagerStaffFirstName</th>
    					<th>ManagerStaffLastName</th>
    				</tr>
    			</thead>
    			<tbody>
<%
    				for(StoreAndStaff s : storeAndStaffList) {
%>
    					<tr>
    						<td data-column="StoreId"><%= s.getStore().getStoreId() %></td>
    						<td data-column="ManagerStaffId"><%= s.getStaff().getStaffId()%></td>
    						<td data-column="ManagerStaffFirstName"><%= s.getStaff().getFirstName()%></td>
    						<td data-column="ManagerStaffLastName"><%= s.getStaff().getLastName()%></td>
    					</tr>
<%		
    				}
%>
    			</tbody>
    		</table>
</body>
</html>
