<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>FilmActorList</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
		<h1>FilmActor List</h1>
		<a href="<%=request.getContextPath()%>/film/insertFilmActorForm.jsp">추가</a>
		<table >
			<thead>
				<tr>
					<th>ActorId</th>
					<th>FilmId</th>
					<th>LastUpdate</th>
				</tr>
			</thead>
			<tbody>
				<%
					FilmActorDao filmActorDao = new FilmActorDao();
					ArrayList<FilmActor> list = filmActorDao.selectfilmActor();
					for (FilmActor c : list) {
				%>

				<tr>
					<td data-column="ActorId"><%=c.getActorId() %></td>
					<td data-column="FilmId"><%=c.getFilmId()%></td>
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