<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Payment List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
	<%
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerpage = 20;
		int beginRow = (currentPage - 1) * rowPerpage;
	
		String searchWord = "";
		if (request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		
		ArrayList<PaymentAndCustomerAndStaffAndRental> list = new PaymentDao().SelectPaymentList(searchWord, beginRow, rowPerpage);
	%>

		<h1>Payment List</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/inventory/inventoryList.jsp">
			<div>
				SEARCH PAYDATE : <input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
		<a href="<%=request.getContextPath()%>/payment/insertPaymentForm.jsp">추가</a>
		<table>
			<thead>
				<tr>
					<th>PaymentId</th>
					<th>CustomerId</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Email</th>
					<th>StaffId</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>RentalId</th>
					<th>RentalDate</th>
					<th>InventoryId</th>
					<th>ReturnDate</th>
					<th>Amount</th>
					<th>PAYMENT DATE</th>
				</tr>

			</thead>
			<tbody>
				<%
					for (PaymentAndCustomerAndStaffAndRental pcsr : list) {
				%>
				<tr>
					<td data-column="PaymentId"><%=pcsr.getPayment().getPaymentId()%></td>
					<td data-column="CustomerId"><%=pcsr.getPayment().getCustomerId()%></td>
					<td data-column="FirstName"><%=pcsr.getCustomer().getFirstName()%></td>
					<td data-column="LastName"><%=pcsr.getCustomer().getLastName()%></td>
					<td data-column="Email"><%=pcsr.getCustomer().getEmail()%></td>
					<td data-column="StaffId"><%=pcsr.getPayment().getStaffId()%></td>
					<td data-column="FirstName"><%=pcsr.getStaff().getFirstName()%></td>
					<td data-column="LastName"><%=pcsr.getStaff().getLastName()%></td>
					<td data-column="RentalId"><%=pcsr.getPayment().getRentalId()%></td>
					<td data-column="RentalDate"><%=pcsr.getRental().getRentalDate()%></td>
					<td data-column="InventoryId"><%=pcsr.getRental().getInventoryId()%></td>
					<td data-column="ReturnDate"><%=pcsr.getRental().getReturnDate()%></td>
					<td data-column="Amount"><%=pcsr.getPayment().getAmount()%></td>
					<td data-column="PaymentDate"><%=pcsr.getPayment().getPaymentDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(currentPage > 1) {
		%>
			<a href="<%=request.getContextPath()%>/payment/paymentList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
		<%
			}
		%>
		<!-- 마지막 페이지를 구하는 비즈니스 로직 -->
		<%
			int totalCount = PaymentDao.selectTotalCount();
			int lastPage = totalCount / rowPerpage;
			if(totalCount % rowPerpage != 0) {
				lastPage+=1;
			}
			if(currentPage < lastPage) {
		%>
			<a href="<%=request.getContextPath()%>/payment/paymentList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
		<%
			}
		%>
</body>
</html>