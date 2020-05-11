<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<title>AddressList</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath() %>/css/listForm.css" rel="stylesheet" media="all">
<link href="<%=request.getContextPath() %>/css/button.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
		<form class = "search-area" id = "userOption" method = "post" action = "<%=request.getContextPath() %>/address/addressList.jsp">
		<input type="text" name="searchWord" placeholder="Search Item" title="Search Address">
    	 <button type = "submit"  id = "userOptionBtn" class = "button-3d" name="submit" title="Search">Search</button>
		</form>
	</div> 

<%
	
	//
	String searchWord = "";
	if(request.getParameter("searchWord") != null){
		searchWord = request.getParameter("searchWord");
	}
	
	//
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10;
	int beginRow = (currentPage-1) * rowPerPage;
//	
	AddressDao addressDao = new AddressDao();
	ArrayList<AddressAndCityAndCountry> list = addressDao.SelectAddress(searchWord, beginRow, rowPerPage);
%>


      <h1>Address List</h1>
      <a href="<%=request.getContextPath()%>/address/insertAddressForm.jsp"  class="button-4d">추가</a>
 
       
       <table>
         <thead>
            <tr>
               <th>AddressId</th>
               <th>CityId</th>
               <th>Country</th>
               <th>City</th>
               <th>Address</th>
               <th>Address2</th>
               <th>PostalCode</th>
               <th>수정</th>
               <th>삭제</th>
            </tr>
            
         </thead>
         <tbody>
            <%
               for(AddressAndCityAndCountry ad : list){
            %>
               <tr>
               	  <td data-column="AddressId"><%=ad.getAddress().getAddressId() %></td>
                  <td data-column="CityId"><%=ad.getCity().getCityId() %></td>
                  <td data-column="Country"><%=ad.getCountry().getCountry() %></td>
                  <td data-column="City"><%=ad.getCity().getCity() %></td>
                  <td data-column="Address"><%=ad.getAddress().getAddress() %></td>
                  <td data-column="Address2"><%=ad.getAddress().getAddress2() %></td>
                  <td data-column="PostalCode"><%=ad.getAddress().getPostalCode() %></td>
                  <td data-column="수정">
                  	<a href = "<%=request.getContextPath()%>/address/updateAddressForm.jsp?addressId=<%=ad.getAddress().getAddressId()%>">수정</a>
                  </td>
                  <td data-column="삭제">
                  	<a href = "<%=request.getContextPath()%>/address/deleteAddressAction.jsp?addressId=<%=ad.getAddress().getAddressId()%>">삭제</a>
                  </td>
                  
               </tr>
               <%   
               }
            %>
         </tbody>
      </table>     
   
            
            <%
            int totalCount = addressDao.SelectCountAddress(); 
            int lastPage = totalCount / rowPerPage;
			if(totalCount %rowPerPage !=0){
				lastPage += 1;
			}
            %>
            <%
            if (currentPage > 1){
            %>
            <a href = "<%=request.getContextPath()%>/address/addressList.jsp?currentPage=<%=currentPage - 1%>" class="button-5d">이전페이지</a>
            <%
            }
            %>
            <%
            if (currentPage <lastPage){
            %>
            <a href = "<%=request.getContextPath()%>/address/addressList.jsp?currentPage=<%=currentPage + 1%>" class="button-5d">다음페이지</a>
            <%
            }
            %>
</body>
</html>
