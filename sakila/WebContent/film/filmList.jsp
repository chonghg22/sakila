<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Film List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div>
        <h1>Film List</h1>
        <a href="<%=request.getContextPath()%>/film/insertFilmForm.jsp">추가</a>
        <table >
        	<thead>
        		<tr>
        			<th>FlimId</th>
        			<th>Title</th>
        			<th>Description</th>
        			<th>ReleaseYear</th>
        			<th>LanguageId</th>
        			<th>OriginalLanguageId</th>
        			<th>RentalDuration</th>
        			<th>RentalRate</th>
        			<th>Length</th>
        			<th>ReplacementCost</th>
        			<th>Rating</th>
        			<th>SpecialFeatures</th>
        			<th>LastUpdate</th>
        		</tr>
        	</thead>
        	<tbody>
        		<%
        			FilmDao filmDao = new FilmDao();
        			ArrayList<Film> list = filmDao.selectfilm();
        			for(Film c : list){
        		%>

        		<tr>
        			<td data-column="FilmId"><%=c.getFilmId() %></td>
        			<td data-column="Title"><%=c.getTitle() %></td>
        			<td data-column="Description"><%=c.getDescription() %></td>
        			<td data-column="ReleaseYear"><%=c.getReleaseYear() %></td>
        			<td data-column="LanguageId"><%=c.getLanguageId() %></td>
        			<td data-column="OriginalLanguageId"><%=c.getOriginalLanguageId() %></td>
        			<td data-column="RentalDuration"><%=c.getRentalDuration() %></td>
        			<td data-column="RentalRate"><%=c.getRentalRate() %></td>
        			<td data-column="Length"><%=c.getLength() %></td>
        			<td data-column="ReplacementCost"><%=c.getReplacementCost()%></td>
        			<td data-column="Rating"><%=c.getRating() %></td>
        			<td data-column="SpecialFeatures"><%=c.getSpecialFeatures() %></td>
        			<td data-column="LastUpdate"><%=c.getLastUpdate() %></td>
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