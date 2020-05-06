<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	int actorId = Integer.parseInt(request.getParameter("actorId"));
	System.out.println(actorId + "/actorId/updateActorForm");
%>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Update Actor</h2>
				</div>
				<div class="card-body">
					<form method = "post" action="<%=request.getContextPath()%>/actor/updateActorAction.jsp">				
						
					
						<div class="form-row">
							<div class="name">
							ActorId:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="actorId" value = <%=actorId %>  readonly>
								</div>
							</div>
						</div>	
						<div class="form-row">
							<div class="name">
							FirstName:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="firstName" >
								</div>
							</div>
						</div>		
									
						<div class="form-row">
							<div class="name">
							LastName:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="lastName" >
								</div>
							</div>
						</div>	
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