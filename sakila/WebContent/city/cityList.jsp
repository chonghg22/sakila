<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>CityList</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div>
		<%
			CityDao cityDao = new CityDao();
		ArrayList<CityAndCountry> list = cityDao.selectCityList();
		%>
		<h1>City List</h1>
		
		
			<table>
				<tr>
					<th>CityId</th>
					<th>City</th>
					<th>CountryId</th>
					<th>Country</th>
					<th>LastUpdate</th>
					<th>추가</th>
			
				</tr>

				<%
					for (CityAndCountry c : list) {
				%>
				<tbody>
					<tr>
						<td data-column="CityId"><%=c.getCity().getCityId()%></td>
						<td data-column="City"><%=c.getCity().getCity()%></td>
						<td data-column="CountryId"><%=c.getCountry().getCountryId()%></td>
						<td data-column="Country"><%=c.getCountry().getCountry()%></td>
						<td data-column="LastUpdate"><%=c.getCountry().getLastUpdate()%></td>
						<td data-column="추가">
							<a href="<%=request.getContextPath()%>/city/insertCityForm.jsp?countryId=<%=c.getCountry().getCountryId()%>&&cirequest.getContextPath()()%">추가</a>
						</td>
					
					</tr>
				</tbody>
				<%
		}
		%>
			</table>

</body>
</html>
