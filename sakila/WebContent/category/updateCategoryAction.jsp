<%@page import="dao.CategoryDao"%>
<%@page import="vo.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	System.out.println(categoryId + "/categoryId/updateCategoryAction");
	String name = request.getParameter("name");
	System.out.println(name + "/name/updateCategoryAction");
	
	Category category = new Category();
	category.setCategoryId(categoryId);
	category.setName(name);
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	response.sendRedirect(request.getContextPath()+"/category/categoryList.jsp");
%>