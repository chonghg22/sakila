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
<link href="<%=request.getContextPath() %>/css/listForm.css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath() %>/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
	<jsp:include page="/inc/sidemenu.jsp"></jsp:include>	
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/category/categoryList.jsp">
		<input type="text" name="searchWord" placeholder="Search Category" title="Search Category">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
		</form>
	</div> 

		<!-- 페이징 관련 비지니스 로직 -->
		<!-- CategoryDao 클래스 값 가져오기 -->
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
		CategoryDao categoryDao = new CategoryDao(); 
		ArrayList<Category> list = categoryDao.selectCategoryAll(searchWord, beginRow, rowPerPage);
		%>

		<h1>Category List</h1>
		<a href="<%=request.getContextPath()%>/category/insertCategoryForm.jsp" class="button-4d">추가</a>
		<table> 
			<thead>
				<tr>
					<th>CategoryId</th>
					<th>name</th>
					<th>lastUpdate</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<%
					for (Category c : list) {
				%>
				<tr>
					<td data-column="CategoryId"><%=c.getCategoryId()%></td>
					<td data-column="name"><%=c.getName()%></td>
					<td data-column="lastUpdate"><%=c.getLastUpdate()%></td>
					<td data-column="수정">
						<a href = "<%=request.getContextPath() %>/category/updateCategoryForm.jsp?categoryId=<%=c.getCategoryId()%>">수정</a>
					</td>
					<td data-column="삭제">
						<a href="<%=request.getContextPath()%>/category/deleteCategoryAction.jsp?categoryId=<%=c.getCategoryId()%>">삭제</a>
					</td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
		if (currentPage > 1) {
	%>
	<a href="<%=request.getContextPath()%>/category/categoryList.jsp?currentPage=<%=currentPage - 1%>"  class="button-5d">이전페이지</a>
	<%
		}
	%>
	<%
		int totalCount = categoryDao.selectTotalCount();
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage != 0) {
		lastPage += 1;
	}
	%>
	<%
		if (currentPage < lastPage) {
	%>
	<a href="<%=request.getContextPath()%>/category/categoryList.jsp?currentPage=<%=currentPage + 1%>"  class="button-5d">다음페이지</a>
	<%
		}
	%>
</body>
</html>
