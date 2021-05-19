<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s'inscrire</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="inscrire.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
</head>
<body>
<div class="signup-form">
    <form action="Inscription" method="post">
    <h2>S'inscrire</h2>
    <p class="hint-text">Create your account. It's free and only takes a minute.</p>
        <div class="form-group">
      <div class="row">
        <div class="col-xs-6"><input type="text" class="form-control" name="prenom" placeholder="Prenom" required="required"></div>
        <div class="col-xs-6"><input type="text" class="form-control" name="nom" placeholder="Nom" required="required"></div>
      </div>          
        </div>
        <div class="form-group">
          <input type="email" class="form-control" name="email" placeholder="Email" required="required">
        </div>
    <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>       
        
    <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Envoyer</button>
        </div>
    </form>
  <div class="text-center">Vous avez déjà un compte? <a href="authentifier.jsp">authentification</a></div>
</div>
</body>
</html>