
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title>ActorList</title>
<meta charset="utf-8">
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
<link href="/sakila/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	 
	
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/actor/actorList.jsp">
		<input type="text" name="searchWord" placeholder="Search Item" title="Search Item">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
</form>
		<!-- 페이징 관련 비지니스 로직 -->
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
		<!-- 컨트롤 로직이 필요함 (메서드 호출 결과값 (model) 가지고 와야함 -->
		<%
			ActorDao actorDao = new ActorDao();
		ArrayList<Actor> list = actorDao.selectActorByPage(searchWord, beginRow, rowPerPage);
		%>
		<!-- 뷰 로직  -->
	
		<h1>Actor List</h1><a href="<%=request.getContextPath()%>/actor/insertActorForm.jsp" class="button-4d">추가</a>
		
   <!--  
   <div class="menu-btn">000000 <i class="fas fa-bars"></i> </div>
    -->
	
		<table>
			<thead>				
				<tr>
					<th>actorId</th>
					<th>firstName</th>
					<th>lastName</th>
					<th>lastUpdate</th>
					<th>수정</th>
					<th>삭제</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					for (Actor a : list) {
				%>
				<tr>
					<td data-column="actorId"><%=a.getActorId()%></td>
					<td data-column="firstName"><%=a.getFirstName()%></td>
					<td data-column="lastName"><%=a.getLastName()%></td>
					<td data-column="lastUpdate"><%=a.getLastUpdate()%></td>
					<td data-column="수정">
						<a href = "<%=request.getContextPath() %>/actor/updateActorForm.jsp?actorId=<%=a.getActorId()%>">수정</a>
					</td>
					<td data-column="삭제">
						<a href="<%=request.getContextPath()%>/actor/deleteActorAction.jsp?actorId=<%=a.getActorId()%>">삭제</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	<!-- 페이지 로직을 구성 -->
	<%
		if (currentPage > 1) {
	%>
	<a href="<%=request.getContextPath()%>/actor/actorList.jsp?currentPage=<%=currentPage - 1%>"  class="button-4d">이전페이지</a>
	<%
		}
	%>
	<%
		int totalCount = actorDao.selectTotalCount();
	int lastPage = totalCount / rowPerPage;
	if (totalCount % rowPerPage != 0) {
		lastPage += 1;
	}
	%>
	<%
		if (currentPage < lastPage) {
	%>
	<a href="<%=request.getContextPath()%>/actor/actorList.jsp?currentPage=<%=currentPage + 1%>"  class="button-4d">다음페이지</a>
	<%
		}
	%>
</body>
</html>