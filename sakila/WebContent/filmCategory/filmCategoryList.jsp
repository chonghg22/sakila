<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>FilmCategoryList</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
		<h1>FilmCategory List</h1>
		<a href="<%=request.getContextPath()%>/film/insertFilmCategoryForm.jsp">추가</a>
		<table >
			<thead>
				<tr>
					<th>FilmId</th>
					<th>CategoryId</th>
					<th>LastUpdate</th>
				</tr>
			</thead>
			<tbody>
				<%
					FilmCategoryDao filmCategoryDao = new FilmCategoryDao();
					ArrayList<FilmCategory> list = filmCategoryDao.selectfilmCategory();
					for (FilmCategory c : list) {
				%>

				<tr>
					<td data-column="FilmId"><%=c.getFilmId()%></td>
					<td data-column="CategoryId"><%=c.getCategoryId() %></td>
					<td data-column="LastUpdate"><%=c.getLastUpdate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<div>
			
		</div>
</body>
</html>