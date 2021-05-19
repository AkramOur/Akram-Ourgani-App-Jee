<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.DAO.LivreManager"  %>
<%@ page import = "com.model.Categorie"  %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="ajouter.css" rel="stylesheet" />

<script type="text/javascript">
    function CheckCategorie(val){
     var element=document.getElementById('categorie');
     
     if(val=='others')
       element.style.display='block';
     else  
       element.style.display='none';
    }
    
</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<%
LivreManager lm = new LivreManager();
List<Categorie> cat = lm.AllCategories();
%>
<form action="AjoutLivre" method = "post">

  <header>
    <h2>ajouter un livre.</h2>
  </header>
  
  <div>
    <label class="desc" id="title1" for="titre">Titre</label>
    <div>
      <input id="Field1" name="titre" type="text" class="field text fn" value="" size="8" tabindex="1">
    </div>
  </div>
    
  <div>
    <label class="desc" id="title3" for="auteur">
      Auteur
    </label>
    <div>
      <input id="Field3" name="auteur" type="text" spellcheck="false" value="" maxlength="255" tabindex="3"> 
   </div>
  </div>
  
  <div>
    <label class="desc" id="title106" for="Field106">
    	Categorie
    </label>
    <div>
    <select  id="Field106" class="field select medium" tabindex="11" name="categorie" onchange='CheckCategorie(this.value);'> 
        <option value="" disabled selected hidden>select categorie</option>
        <%
        for(Categorie ca : cat) {
        %>
        <option value=<%=ca.getCatName() %>><%=ca.getCatName() %></option>
        <%} %>
        <option value="others">others</option>
    </select>
    <input type="text" name="othercategorie" id="categorie" style='display:none;'/>
    </div>
  </div>
  
  <div>
		<div>
  		<input id="saveForm" name="saveForm" type="submit" value="Submit">
    </div>
	</div>
  
</form>
</body>
</html>