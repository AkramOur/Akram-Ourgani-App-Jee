<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.DAO.LivreManager"  %>
<%@ page import = "com.model.Categorie"  %>
<%@ page import = "com.model.Livre"  %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
LivreManager lm = new LivreManager();
List<Categorie> cat = lm.AllCategories();
List<Livre> lv = lm.Allivres();
if(request.getParameter("cat") != null){
	lv = lm.livreParCat(Integer.parseInt(request.getParameter("cat")));
}


%>
<form action="">
<label for = "cat">categorie : </label>
<select name = "cat"> 
         <option value="" disabled selected hidden>select categorie</option>
        <%
        for(Categorie ca : cat) {
        %>
        <option value=<%=ca.getId() %>><%=ca.getCatName() %></option>
        <%} %>
</select>

<input type = submit value = "chercher">
</form>

<div style="overflow-x:auto;">
  <table>
    <tr>
      <th>Id</th>
      <th>Titre</th>
      <th>Auteur</th>
      <th>Categorie</th>
    </tr>
    <%
    if(lv != null){
    for(Livre v : lv){
    %>
    <tr>
      <td><%=v.getId() %></td>
      <td><%=v.getTitre() %></td>
      <td><%=v.getAuteur() %></td>
      <td><%=v.getCat().getCatName() %></td>
    </tr>
    <%}} %>
  </table>
</div>
</body>
</html>