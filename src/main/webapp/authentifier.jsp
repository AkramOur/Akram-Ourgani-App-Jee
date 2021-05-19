<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s'authentifier</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="inscrire.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
</head>
<body>
<%
String etat = "";
if(request.getParameter("res") != null){
	if(Integer.parseInt(request.getParameter("cpt")) > 3) {
		etat = "disabled='disabled'";
	}
}
String et = "hidden";
if(request.getParameter("msg") != null){
	if(request.getParameter("msg").equals("successfully")) {
		et = "";
	}
}
%>
<div class="signup-form">
    <form action="Authentification" method="post">
    <h2>s'identifier</h2>
    <p <%=et %>>inscription effectuée avec succès</p>
        <div class="form-group">
          <input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
    <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>       
        
    <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block" <%= etat %>>Envoyer</button>
        </div>
    </form>
  <div class="text-center">Vous n'avez pas un compte? <a href="inscrire.jsp">inscription</a></div>
</div>
</body>
</html>