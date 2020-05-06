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
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
		<h1>Country List</h1>
		<a href="<%=request.getContextPath()%>/country/insertCountryForm.jsp">추가</a>

		<%
			String searchWord = "";
		if (request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		CountryDao countryDao = new CountryDao();
		ArrayList<Country> list = countryDao.selectCountryListAll(searchWord);
		%>
		<form method="post" action="<%=request.getContextPath()%>/country/countryList.jsp">
			<input type="text" name="searchWord">
			<button type="submit" name="submit">찾기</button>
		</form>
		<table>
			<thead>
				<tr>
					<th>CountryId</th>
					<th>Country</th>
					<th>LastUpdate</th>
				
				</tr>
				<%
					for (Country c : list) {
				%>
				<tr>
					<td data-column="CountryId"><%=c.getCountryId()%></td>
					<td data-column="Country"><%=c.getCountry()%></td>
					<td data-column="LastUpdate"><%=c.getLastUpdate()%></td>
					

				</tr>
				<%
					}
				%>

			</thead>
		</table>
		

</body>
</html>
