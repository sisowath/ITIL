<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    if( request.getSession().getAttribute("connected") != null ) {
%>
        <jsp:forward page="index.jsp"/>
<%
    }
%>        
        <h1>Authentification</h1>
<%
        if( request.getAttribute("error-message") != null ) {
            out.println("<h3>" + request.getAttribute("error-message") + "</h3>");
        }
%>        
        <form>
            <table border="1px solid black">
                <tr>
                    <td>Username :</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="action" value="login" /></td>
                    <td><input type="submit" formaction="./controller" formmethod="post" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>