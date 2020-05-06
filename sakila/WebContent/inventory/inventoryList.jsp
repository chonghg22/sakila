<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>Inventory List</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
	<%
		String searchWord = "";
		if (request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");
		}
		
		ArrayList<InventoryAndStoreAndFilm> list = new InventoryDao().SelectInventory(searchWord);
	%>

		<h1>Inventory List</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/inventory/inventoryList.jsp">
			<div>
				SEARCH VIDIO : <input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
		<a href="<%=request.getContextPath()%>/inventory/insertInventoryForm.jsp">추가</a>
		<table >
			<thead>
				<tr>
					<th>InventoryId</th>
					<th>FilmId</th>
					<th>Title</th>
					<th>Description</th>
					<th>ReleaseYear</th>
					<th>LanguageId</th>					
					<th>RentalDuration</th>
					<th>RentalRate</th>
					<th>Length</th>
					<th>ReplacementCost</th>
					<th>Rating</th>
					<th>SpecialFeatures</th>
					<th>StoreId</th>
					<th>ManagerStaffId</th>
				</tr>

			</thead>
			<tbody>
				<%
					for (InventoryAndStoreAndFilm isf : list) {
				%>
				<tr>
					<td data-column="InventoryId"><%=isf.getInventory().getInventoryId()%></td>
					<td data-column="FilmId"><%=isf.getInventory().getFilmId()%></td>
					<td data-column="Title"><%=isf.getFilm().getTitle()%></td>
					<td data-column="Description"><%=isf.getFilm().getDescription()%></td>
					<td data-column="ReleaseYear"><%=isf.getFilm().getReleaseYear()%></td>
					<td data-column="LanguageId"><%=isf.getFilm().getLanguageId()%></td>
					<td data-column="RentalDuration"><%=isf.getFilm().getRentalDuration()%></td>
					<td data-column="RentalRate"><%=isf.getFilm().getRentalRate()%></td>
					<td data-column="Length"><%=isf.getFilm().getLength()%></td>
					<td data-column="ReplacementCost"><%=isf.getFilm().getReplacementCost()%></td>
					<td data-column="Rating"><%=isf.getFilm().getRating()%></td>
					<td data-column="SpecialFeatures"><%=isf.getFilm().getSpecialFeatures()%></td>
					<td data-column="StoreId"><%=isf.getInventory().getStoreId()%></td>
					<td data-column="ManagerStaffId"><%=isf.getStore().getManagerStaffId()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			/*
			 City city = new City();
			 int cityId = city.getCityId();
			 System.out.println(cityId);
			 city = new AddressDao().selectCityId(cityId);
			 System.out.println(city);
			*/
		%>
		
</body>
</html>
