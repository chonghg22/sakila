<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<title>LanguageList</title>
<meta charset="utf-8">
<link href="/blog/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
     <h1>Language List</h1>
     <%
        String searchword = "";
        if(request.getParameter("searchword")!=null){
           searchword = request.getParameter("searchword");
        }
         LanguageDao languageDao = new LanguageDao();
         ArrayList<Language> list = languageDao.selectLanguageListAll(searchword);
     %>
     <form method="post" action="<%=request.getContextPath()%>/language/languageList.jsp">
        <input type="text" name="searchword">
        <button type="submit">검색</button>
     </form>
     <br>
     <table >
     <thead>
        <tr>
           <th>languageId</th>
           <th>name</th>
           <th>lastUpdate</th>
           <th>언어추가</th>
        </tr>
     </thead>
     <tbody>
        <%
           for(Language l: list){
        %>   
           <tr>
              <td data-column="languageId"><%=l.getLanguageId()%></td>
              <td data-column="name"><%=l.getName()%></td>
              <td data-column="lastUpdate"><%=l.getLastUpdate()%></td>
              <td data-column="언어추가"><a href="<%=request.getContextPath()%>/language/insertLanguageForm.jsp?languageId=<%=l.getLanguageId()%>">언어추가</a></td>
           </tr>   
        <%   
           }
        %>
     </tbody>
     </table>