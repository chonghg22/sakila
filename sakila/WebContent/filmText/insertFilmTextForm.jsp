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
	LanguageDao languageDao = new LanguageDao();
	ArrayList<Language> languageList = languageDao.selectLanguageIdListAll();
	%>
	<div>	
		<jsp:include page="/inc/sidemenu.jsp"></jsp:include>
	</div> 
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Insert Film</h2>
				</div>
				<div class="card-body">
					<form method = "post" action="<%=request.getContextPath()%>/film/insertFilmAction.jsp">				
						
					
						
						<div class="form-row">
							<div class="name">
							Title:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="title" >
								</div>
							</div>
						</div>		
									
						<div class="form-row">
							<div class="name">
							Description:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text"  name="description" >
								</div>
							</div>
						</div>	
						<div class="form-row">
							<div class="name">
							ReleaseYear:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="number" name="releaseYear" >
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							LanguageId:
							</div>
							<div class="value">
								<div class="input-group">
									<div class="row row-space">
										<div class="input-group-desc">
											<select name="languageId" class="input--style-5">		
												<option disabled="disabled" selected="selected">선택하세요.</option>
												<%
												for(Language c : languageList){
												%>
													<option value="<%=c.getLanguageId()%>"><%=c.getLanguageId()%></option>
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
							RetalDuration:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="number" name="retalDuration" >
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							RentalRate:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="number" name="rentalRate" >
								</div>
							</div>
						</div>
					
						<div class="form-row">
							<div class="name">
							Length:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="number"name="length" >
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">
							ReplacementCost:
							</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="number"  name="replacementCost" >
								</div>
							</div>
						</div>

						<div class="form-row p-t-20">
							<label class="label label--block">Rating</label>
							<div class="p-t-15">
							<label class="radio-container m-r-55">G
								<input type="radio" checked="checked" name="rating" value = "G">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">PG
								<input type="radio" checked="checked" name="rating" value = "PG">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">PG-13
								<input type="radio" checked="checked" name="rating" value = "PG-13">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">R
								<input type="radio" checked="checked" name="rating" value = "R">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">NC-17
								<input type="radio" checked="checked" name="rating" value = "NC-17">
								<span class="checkmark"></span>
							</label>							
						</div>
						</div>
						<div class="form-row p-t-20">
							<label class="label label--block">SpecialFeatures:</label>
							<div class="p-t-15">
							<label class="radio-container m-r-55">Trailers
								<input type="radio" checked="checked" name="specialFeatures" value = "Trailers">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">Commentaries
								<input type="radio" checked="checked" name="specialFeatures" value = "Commentaries">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">Deleted Scenes
								<input type="radio" checked="checked" name="specialFeatures" value = "Deleted Scenes">
								<span class="checkmark"></span>
							</label>
							<label class="radio-container m-r-55">Behind the Scenes
								<input type="radio" checked="checked" name="specialFeatures" value = "Behind the Scenes">
								<span class="checkmark"></span>
							</label>											
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