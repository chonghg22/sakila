<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">
<title>UpdateForm</title>
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
<link href="/sakila/css/registerForm.css" rel="stylesheet" media="all">
</head>
<body>

		<%
			StoreDao storeDao = new StoreDao();
			ArrayList<Store> list = storeDao.selectStoreIdList();
			AddressDao addressDao = new AddressDao();
			ArrayList<Address> AddressList = addressDao.SelectAddressOne();
			int customerId = Integer.parseInt(request.getParameter("customerId"));
			System.out.println(customerId + "/customerId/updatecustomerForm");
		%>

<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Update Customer</h2>
				</div>
				<div class="card-body">
					<form method = "post" action="<%=request.getContextPath()%>/customer/updateCustomerAction.jsp">
						<div class="form-row">							
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="hidden" name="customerId" value ="<%=customerId %>" readonly>
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
											<select name = "storeId" class="input--style-5">		
												<option disabled="disabled" selected="selected">선택하세요.</option>
												<%
													for (Store c : list) {
												%>
													<option value="<%=c.getStoreId()%>"><%=c.getStoreId()%></option>
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
									<input class="input--style-5" type="text" name="firstName">
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
							AddressId:
							</div>
							<div class="value">
								<div class="input-group">
									<div class="row row-space">
										<div class="input-group-desc">
											<select name = "addressId" class="input--style-5">		
												<option disabled="disabled" selected="selected">선택하세요.</option>
												<%
													for (Address a : AddressList) {
												%>
													<option value="<%=a.getAddressId()%>"><%=a.getAddress()%></option>
												<%
													}
												%>
											</select>
										</div>	
									</div>
								</div>
							</div>
						</div>
						<div class="form-row p-t-20">
						<label class="label label--block">Active</label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">0
									<input type="radio" checked="checked" name="active">
									<span class="checkmark"></span>
								</label>
								<label class="radio-container">1
									<input type="radio" name="active">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>						
						<div>
							<button class="btn btn--radius-2 btn--blue" type="submit">수정</button>
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
