<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>FilmText List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
		<h1>FilmText List</h1>
			<a href="<%=request.getContextPath()%>/film/insertFilmTextForm.jsp">추가</a>
		<table >
			<thead>
				<tr>
					<th>FlimId</th>
					<th>Title</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<%
					FilmTextDao filmTextDao = new FilmTextDao();
					ArrayList<FilmText> list = filmTextDao.selectfilmText();
					for (FilmText c : list) {
				%>

				<tr>
					<td data-column="FlimId"><%=c.getFilmId()%></td>
					<td data-column="Title"><%=c.getTitle()%></td>
					<td data-column="Description"><%=c.getDescription()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
</body>
</html>