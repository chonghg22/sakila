<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//인코딩작업
	request.setCharacterEncoding("UTF-8");
	//insertAddressForm에서 입력한 값을 받아옴
	String address = request.getParameter("address");
	System.out.println(address +"/address/insertAddressAction");
	String address2 = request.getParameter("address2");
	System.out.println(address2 + "/address2/insertAddressAction");
	String district = request.getParameter("district");
	System.out.println(district + "/district/insertAddressAction");
	int cityId = Integer.parseInt(request.getParameter("cityId"));
	System.out.println(cityId + "/cityId/insertAddressAction");
	String postalcode = request.getParameter("postalcode");
	System.out.println(postalcode + "/postalcode/insertAddressAction");
	String phone = request.getParameter("phone");
	System.out.println(phone + "/phone/insertAddressAction");
	//Address 객체 생성뒤 받아온 값을 변수에 기입
	Address a1 = new Address();
	a1.setAddress(address);
	a1.setAddress2(address2);
	a1.setDistrict(district);
	a1.setCityId(cityId);
	a1.setPostalCode(postalcode);
	a1.setPhone(phone);
	
	AddressDao a2 = new AddressDao();
	a2.insertAddress(a1);
	
	response.sendRedirect(request.getContextPath() + "/address/addressList.jsp");
%>
