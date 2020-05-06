<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.util.*" %>
<%@ page import= "dao.*" %>
<%@ page import= "vo.*" %>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Staff List</title>
<meta charset="utf-8">
<link href="/blog/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
<%
	StaffDao sDao = new StaffDao();
	ArrayList<StaffAndAddressAndStore> list = sDao.selectStaffListAll();
%>
        <h1>Staff List</h1>
	        <div>
	            <a href="<%=request.getContextPath()%>/staff/insertStaffForm.jsp">추가</a>
	        </div>
        	<table>
        		<thead>
        			<tr>
        				<th>StaffId</th>
        				<th>FirstName</th>
        				<th>LastName</th>
        				<th>AddressId</th>
        				<th>Phone</th>
        				<th>Picture</th>
        				<th>Email</th>
        				<th>StoreId</th>
        				<th>Active</th>
        				<th>UserName</th>
        				<th>Password</th>
        				<th>LastUpdate</th>
        			</tr>
        		</thead>
        		<tbody>
<%
				for(StaffAndAddressAndStore s : list) {
%>
					<tr>
						<td data-column="StaffId"><%=s.getStaff().getStaffId() %></td>
						<td data-column="FirstName"><%=s.getStaff().getFirstName() %></td>
						<td data-column="LastName"><%=s.getStaff().getLastName() %></td>
						<td data-column="AddressId"><%=s.getAddress().getAddressId() %></td>
						<td data-column="Phone"><%=s.getAddress().getPhone() %></td>
						<td data-column="Picture"><%=s.getStaff().getPicture() %></td>
						<td data-column="Email"><%=s.getStaff().getEmail() %></td>
						<td data-column="StoreId"><%=s.getStore().getStoreId() %></td>
						<td data-column="Active"><%=s.getStaff().getActive() %></td>
						<td data-column="UserName"><%=s.getStaff().getUserName() %></td>
						<td data-column="Password"><%=s.getStaff().getPassword() %></td>
						<td data-column="LastUpdate"><%=s.getStaff().getLastUpdate() %></td>
					</tr>
<%						
					}
%>
        		</tbody>
        	
        	</table>

</body>
</html>
