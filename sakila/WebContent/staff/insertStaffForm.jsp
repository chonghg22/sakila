<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">
<title>InsertForm</title>
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
<link href="/sakila/css/registerForm.css" rel="stylesheet" media="all">
</head>
<body>

	<%
	CityDao cityDao = new CityDao();
	ArrayList<City> cityList = cityDao.selectCityIdList();
	StoreDao storeDao = new StoreDao();
	ArrayList<Integer> storeId = storeDao.selectStoreIdList();
	%>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Insert Staff</h2>
				</div>
				<div class="card-body">
					<form method = "post" action="<%= request.getContextPath() %>/staff/insertStaffFormAction.jsp">				
						
					
						<fieldset>
					
							
									
						<div class="form-row">
							<div class="name">
							Address2:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text"  name="address2" >
								</div>
							</div>
						</div>	
						<div class="form-row">
							<div class="name">
							District:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="district" >
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							CityId:
							</div>
							<div class="value">
								<div class="input-group">
									<div class="row row-space">
										<div class="input-group-desc">
											<select name="cityId" class="input--style-5">		
												<option disabled="disabled" selected="selected">선택하세요.</option>
												<%
													for(City c : cityList) {
												%>
													<option value="<%= c.getCityId() %>"><%= c.getCity() %></option>
												<%
												}
												%>
											</select>
										</div>	
									</div>
								</div>
							</div>
						</div>						
						<div class="form-row">
							<div class="name">
							FirstName:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text"  name="firstName" >
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							LastName:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="lastName">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							AddressId:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="addressId" >
								</div>
							</div>
						</div>	
						<div class="form-row">
							<div class="name">
							Picture:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="file" name="picture" value = "null">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							Email:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="email">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							StoreId:
							</div>
							<div class="value">
								<div class="input-group">
									<div class="row row-space">
										<div class="input-group-desc">
											<select name="storeId" class="input--style-5">		
												<option disabled="disabled" selected="selected">선택하세요.</option>
												<%
													for(Integer s : storeId) {
												%>
													<option value="<%= s %>"><%= s %></option>
												<%
												}
												%>
											</select>
										</div>	
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							Active:
							</div>
							<div class="value">
								<div class="input-group">
									<div class="row row-space">
										<div class="input-group-desc">
											<select name="active" class="input--style-5">	
												<option disabled="disabled" selected="selected">선택하세요.</option>	
												<option value="1">재직</option>
												<option value="0">퇴직</option>
											</select>
										</div>	
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							UserName:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="userName">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							password:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="password">
								</div>
							</div>
						</div>
						</fieldset>
						<div>
							<button class="btn btn--radius-2 btn--blue" type="submit">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script src="vendor/select2/select2.min.js" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script src="vendor/datepicker/moment.min.js" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script src="vendor/datepicker/daterangepicker.js" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script src="js/global.js" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="4a061543b3ab991da7fc1126-text/javascript"></script>
	<script type="4a061543b3ab991da7fc1126-text/javascript">
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());
	gtag('config', 'UA-23581568-13');
	</script>
	<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="4a061543b3ab991da7fc1126-|49" defer=""></script>
</body>
</html>