<%
    if( request.getSession().getAttribute("username") == null ) {
%>
        <jsp:forward page="login.jsp"/>
<%
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bienvenue à la page d'accueil</h1>
        <a href="./controller?action=logout">Se déconnecter</a>        
<%
    if( request.getAttribute("error-message") != null ) {
        out.println("<h3>" + request.getAttribute("error-message") +"</h3>");
    }
    if( request.getAttribute("success-message") != null ) {
        out.println("<h3>" + request.getAttribute("success-message") +"</h3>");
    }
    if( request.getSession().getAttribute("user.role").equals("admin") ) {
%>
        <jsp:include page="fileUploadForm.jsp"/>
<%
    }
%>        
    </body>
</html>
