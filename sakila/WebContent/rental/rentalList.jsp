<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*"%>
<%@ page import="dao.*" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Rental List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
        <h1>Rental List</h1>
        <div>
            <a href="<%=request.getContextPath()%>/rental/insertRentalForm.jsp">추가</a>
        </div>
        <%
        	//searchWord 메소드
        	String searchWord = "";
        	if(request.getParameter("searchWord") !=null){
        		searchWord = request.getParameter("searchWord");
        	}
        	ArrayList<RentalAndInventoryAndCustomerAndStaff>List = new RentalDao().selectRentalList(searchWord);
        %>
        <!-- 검색창 -->
        <!-- inventoryId로 검색 -->
        <form method = "post" action = "<%=request.getContextPath()%>/rental/rentalList.jsp">
        	<input type = "text" name="searchWord">
        	<button type = "submit">검색</button>
        </form>
        <br>
        	<table>
        		<thead>
        			<tr>
        				<th>RentalId</th>
        				<th>RentalDate</th>
        				<th>InventoryId</th>
        				<th>CustomerId</th>
        				<th>ReturnDate</th>
        				<th>StaffId</th>
        				<th>LastUpdate</th>
        			</tr>
        		</thead>
        		<tbody>
        			<%
        				for(RentalAndInventoryAndCustomerAndStaff rics : List){
        			%>
        			<tr>
        				<td data-column="RentalId"><%=rics.getRental().getRentalId() %></td>
        				<td data-column="RentalDate"><%=rics.getRental().getRentalDate() %></td>
        				<td data-column="InventoryId"><%=rics.getRental().getInventoryId() %></td>
        				<td data-column="CustomerId"><%=rics.getRental().getCustomerId() %></td>
        				<td data-column="ReturnDate"><%=rics.getRental().getReturnDate() %></td>
        				<td data-column="StaffId"><%=rics.getRental().getStaffId()%></td>
        				<td data-column="LastUpdate"><%=rics.getRental().getLastUpdate() %></td>

        			</tr>
        			<%
        				}
        			%>
        		</tbody>
        	</table>
        
</body>
</html>


