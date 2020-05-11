<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Customer List</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath() %>/css/listForm.css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath() %>/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	<jsp:include page="/inc/sidemenu.jsp"></jsp:include>	
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/actor/actorList.jsp">
		<input type="text" name="searchWord" placeholder="Search FirstName" title="Search FirstName">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
		</form>
		<%
		String searchWord = "";
		if(request.getParameter("searchWord") != null){
			searchWord = request.getParameter("searchWord");
		}
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;

		int beginRow = (currentPage - 1) * rowPerPage; 
		%> 
<%
        CustomerDao customerDao = new CustomerDao();
        ArrayList<CustomerAndStoreAndAddress> customerList = customerDao.selectCustomerListAll(searchWord, beginRow, rowPerPage);
%>
        <h1>Customer List</h1>
        <div>
       		<a href="<%=request.getContextPath() %>/customer/insertCustomerForm.jsp" class="button-4d">추가 </a>     
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
	        		<th>Phone</th>
	        		<th>Active</th>
	        		<th>CreateDate</th>
	        		<th>LastUpdate</th>
	        		<th>수정</th>
					<th>삭제</th>
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
        				<td data-column="Phone"><%= c.getAddress().getPhone() %></td>
        				<td data-column="Active"><%= c.getCustomer().getActive() %></td>
        				<td data-column="CreateDate"><%= c.getCustomer().getCreateDate() %></td>
        				<td data-column="LastUpdate"><%= c.getCustomer().getLastUpdate() %></td>
        				<td data-column="수정">
						<a href = "<%=request.getContextPath() %>/customer/updateCustomerForm.jsp?customerId=<%= c.getCustomer().getCustomerId() %>">수정</a>
					</td>
					<td data-column="삭제">
						<a href="<%=request.getContextPath()%>/customer/deleteCustomerAction.jsp?customerId=<%= c.getCustomer().getCustomerId() %>">삭제</a>
					</td>
        			</tr>
<%		
        		}
%>
        	</tbody>
        </table>
        <%
		if (currentPage > 1) {
	%>
	<a href="<%=request.getContextPath()%>/customer/customerList.jsp?currentPage=<%=currentPage - 1%>"  class="button-5d">이전페이지</a>
	<%
		}
	%>
	<%
		int totalCount = customerDao.selectTotalCount();
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage != 0) {
		lastPage += 1;
	}
	%>
	<%
		if (currentPage < lastPage) {
	%>
	<a href="<%=request.getContextPath()%>/customer/customerList.jsp?currentPage=<%=currentPage + 1%>"  class="button-5d">다음페이지</a>
	<%
		}
	%>
        
</body>
</html>
