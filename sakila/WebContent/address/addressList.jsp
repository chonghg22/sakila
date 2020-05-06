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
<link href="/sakila/css/listForm.css" rel="stylesheet" media="all">
</head>
<body>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 

<!-- 페이징 관련 비지니스 로직 -->
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
      <a href="<%=request.getContextPath()%>/address/insertAddressForm.jsp">추가</a>
      <form method = "post" action = "<%=request.getContextPath() %>/address/addressList.jsp">       
       <input type="text" name = "searchWord">
       <button type = "submit" name = "submit">찾기</button>
       </form>
       
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
            <a href = "<%=request.getContextPath()%>/address/addressList.jsp?currentPage=<%=currentPage - 1%>">이전페이지</a>
            <%
            }
            %>
            <%
            if (currentPage <lastPage){
            %>
            <a href = "<%=request.getContextPath()%>/address/addressList.jsp?currentPage=<%=currentPage + 1%>">다음페이지</a>
            <%
            }
            %>
</body>
</html>
