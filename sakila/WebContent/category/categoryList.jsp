<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title>categoryList</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 

		<!-- 페이징 관련 비지니스 로직 -->
		<!-- CategoryDao 클래스 값 가져오기 -->
		<%
			CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryAll();
		%>

		<h1>Category List</h1>
		<a href="<%=request.getContextPath()%>/category/categoryInsertForm.jsp">추가</a>
		<table> 
			<thead>
				<tr>
					<th>CategoryId</th>
					<th>name</th>
					<th>lastUpdate</th>

				</tr>
			</thead>
			<tbody>
				<%
					for (Category c : list) {
				%>
				<tr>
					<td  data-column="CategoryId"><%=c.getCategoryId()%></td>
					<td  data-column="name"><%=c.getName()%></td>
					<td  data-column="lastUpdate"><%=c.getLastUpdate()%></td>


				</tr>
				<%
					}
				%>
			</tbody>
		</table>
</body>
</html>
