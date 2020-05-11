<%@page import="dao.CategoryDao"%>
<%@page import="vo.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	System.out.println(categoryId +"/category/deleteActor");
	

	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(categoryId);
	
	response.sendRedirect(request.getContextPath() + "/category/categoryList.jsp");
	
%>
