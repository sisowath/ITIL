<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="./js/styleForIndex.css">
    </head>
    <body>
        <!-- Attention au symbole # dans C#. Il déclenche une erreur !!
        <a href="./document/Markdown.md">Ouvrir Markdown</a><br />
        <a href="./document/C Sharp Programming.pdf">Ouvrir C#</a><br />
        <a href="./document/Java EE 7 Development.pdf">Ouvrir Java</a>
        -->
<%
    if( request.getSession().getAttribute("connected") == null ) {
%>
        <jsp:forward page="login.jsp"/>
<%
    }
%>        
        <h1>Bonjour <%= request.getSession().getAttribute("user.username") %>, Bienvenue à la page d'accueil</h1>
        <a href="./controller?action=logout">Se déconnecter</a>     
        <jsp:include page="searchBar.jsp"/><hr />
<%
    if( request.getAttribute("error-message") != null ) {
        out.println("<h3>" + request.getAttribute("error-message") +"</h3>");
    }
    if( request.getAttribute("success-message") != null ) {
        out.println("<h3>" + request.getAttribute("success-message") +"</h3>");
    }
    if( request.getSession().getAttribute("user.role").equals("admin") ) {
%>
        <!--jsp:include page="fileUploadForm.jsp"/-->
<%
    }
%>        
        <jsp:include page="documentOutput.jsp"/>
    </body>
</html>
