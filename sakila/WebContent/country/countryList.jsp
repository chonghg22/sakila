<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Country List</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath()%>/css/listForm.css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath() %>/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>	
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/country/countryList.jsp">
		<input type="text" name="searchWord" placeholder="Search Country" title="Search Item">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
		</form>
	</div> 
		<h1>Country List</h1>
		<a href="<%=request.getContextPath()%>/country/insertCountryForm.jsp" class="button-4d">추가</a>
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
		CountryDao countryDao = new CountryDao(); 
		ArrayList<Country> list = countryDao.selectCountryListAll(searchWord, beginRow, rowPerPage);
		%>
		
		<table>
			<thead>
				<tr>
					<th>CountryId</th>
					<th>Country</th>
					<th>LastUpdate</th>
					<th>수정</th>
					<th>삭제</th>
				
				</tr>
				<%
					for (Country c : list) {
				%>
				<tr>
					<td data-column="CountryId"><%=c.getCountryId()%></td>
					<td data-column="Country"><%=c.getCountry()%></td>
					<td data-column="LastUpdate"><%=c.getLastUpdate()%></td>
					<td data-column="수정">
						<a href = "<%=request.getContextPath() %>/country/updateCountryForm.jsp?countryId=<%=c.getCountryId()%>">수정</a>
					</td>
					<td data-column="삭제">
						<a href="<%=request.getContextPath()%>/country/deleteCountryAction.jsp?countryId=<%=c.getCountryId()%>">삭제</a>
					</td>

				</tr>
				<%
					}
				%>

			</thead>
		</table>
		<%
		if (currentPage > 1) {
	%>
	<a href="<%=request.getContextPath()%>/country/countryList.jsp?currentPage=<%=currentPage - 1%>"  class="button-5d">이전페이지</a>
	<%
		}
	%>
	<%
		int totalCount = countryDao.selectTotalCount(); 
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage != 0) {
		lastPage += 1;
	}
	%>
	<%
		if (currentPage < lastPage) {
	%>
	<a href="<%=request.getContextPath()%>/country/countryList.jsp?currentPage=<%=currentPage + 1%>"  class="button-5d">다음페이지</a>
	<%
		}
	%>

</body>
</html>
