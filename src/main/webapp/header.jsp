<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.model.Etudiant"  %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="headerstyle/fonts/icomoon/style.css">

    <link rel="stylesheet" href="headerstyle/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="headerstyle/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="headerstyle/css/style.css">
    <!-- drop down style -->
  <script src="headerstyle/dropdown/jquery.min.js"></script>
  <script src="headerstyle/dropdown/popper.min.js"></script>
  <script src="headerstyle/dropdown/bootstrap.min.js"></script>
  
  
	<script src="headerstyle/js/jquery-3.3.1.min.js"></script>
    <script src="headerstyle/js/popper.min.js"></script>
    <script src="headerstyle/js/bootstrap.min.js"></script>
    <script src="headerstyle/js/jquery.sticky.js"></script>
    <script src="headerstyle/js/main.js"></script>
    
  </head>
  <body>
<%
boolean exist = false;
Etudiant et = null;
HttpSession Ses = request.getSession();
if(Ses.getAttribute("Etudiant") != null){
	exist = true;
	et =(Etudiant) Ses.getAttribute("Etudiant");
}

if(request.getParameter("val") != null){
	if(request.getParameter("val").equals("dec")){
		Ses.setAttribute("Etudiant",null);
		exist = false;
	}
}

%>

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target bg-white" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-lg-4">
              <nav class="site-navigation text-right ml-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                  <li class="active"><a href="ajouter.jsp" class="nav-link">ajouter livre</a></li>
<!--                  <li><a href="listerlivres.jsp" class="nav-link">lister livres</a></li> --> 
                  <li class="nav-item dropdown">
 				     <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
 				       lister livres
  	            	    </a>
 			     		 <div class="dropdown-menu">
 			     	    <a class="dropdown-item" href="listerlivres.jsp">Par categorie</a>
 			   			<a class="dropdown-item" href="listerLivreParAut.jsp">Par auteur</a>
 			   		  </div>
  				  </li>
                </ul>
              </nav>
            </div>
            <div class="col-lg-4 text-center">
              <div class="site-logo">
                <p>FSBM</p>
              </div>


              <div class="ml-auto toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3 text-black"></span></a></div>
            </div>
            <div class="col-lg-4">
              <nav class="site-navigation text-left mr-auto " role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                <% 
                if(exist){
                %>
                <li><p class="nav-link active"><%="Bonjour "+ et.getNom()+" "+et.getPrenom() %></p></li>
                
                <li><a href="?val=dec" class="nav-link">Déconnecter</a></li>
                <%}else{ %>
                  <li><a href="inscrire.jsp" class="nav-link">s’inscrire</a></li>
                  <li><a href="authentifier.jsp" class="nav-link">s’authentifier</a></li>
				<%} %>
                </ul>
              </nav>
            </div>
            

          </div>
        </div>

      </header>
    
	<script src="headerstyle/js/jquery-3.3.1.min.js"></script>
    <script src="headerstyle/js/popper.min.js"></script>
    <script src="headerstyle/js/bootstrap.min.js"></script>
    <script src="headerstyle/js/jquery.sticky.js"></script>
    <script src="headerstyle/js/main.js"></script>

  



  </body>
</html>