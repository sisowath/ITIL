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
    </body>
</html>
