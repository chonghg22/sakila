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
<link href="<%=request.getContextPath() %>/css/listForm.css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath() %>/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>	
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/city/cityList.jsp">
		<input type="text" name="searchWord" placeholder="Search City" title="Search Item">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
		</form>
	</div>
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
		CityDao cityDao = new CityDao(); 
		ArrayList<CityAndCountry> list = cityDao.selectCityList(searchWord, beginRow, rowPerPage);
		%>
		<h1>City List</h1>
			<a href="<%=request.getContextPath()%>/city/insertCityForm.jsp" class="button-4d">추가</a>
		
			<table>
				<thead>
				<tr>
					<th>CityId</th>
					<th>City</th>
					<th>CountryId</th>
					<th>Country</th>
					<th>LastUpdate</th>
					<th>수정</th>
					<th>삭제</th>
			
				</tr>
				</thead>
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
						<td data-column="수정">
							<a href = "<%=request.getContextPath() %>/city/updateCityForm.jsp?cityId=<%=c.getCity().getCityId()%>">수정</a>
						</td>
						<td data-column="삭제">
							<a href="<%=request.getContextPath()%>/city/deleteCityAction.jsp?cityId=<%=c.getCity().getCityId()%>">삭제</a>
						</td>
						
						
					</tr>
				</tbody>
				<%
		}
		%>
			</table>
			<%
		if (currentPage > 1) {
	%>
	<a href="<%=request.getContextPath()%>/city/cityList.jsp?currentPage=<%=currentPage - 1%>"  class="button-5d">이전페이지</a>
	<%
		}
	%>
	<%
		int totalCount = cityDao.selectTotalCount(); 
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage != 0) {
		lastPage += 1;
	}
	%>
	<%
		if (currentPage < lastPage) {
	%>
	<a href="<%=request.getContextPath()%>/city/cityList.jsp?currentPage=<%=currentPage + 1%>"  class="button-5d">다음페이지</a>
	<%
		}
	%>

</body>
</html>
