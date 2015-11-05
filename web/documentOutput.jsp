<%@page import="com.itil.entites.Document"%>
<%@page import="com.itil.dao.implementation.DocumentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.itil.jdbc.Connexion"%>
<div>
<%
        Class.forName( request.getServletContext().getInitParameter("jdbcDriver") );
        Connexion.setUrl( request.getServletContext().getInitParameter("databaseURL") );
        DocumentDao unDocumentDao = new DocumentDao( Connexion.getInstance() );
        List<Document> uneListeDesDocuments = unDocumentDao.findAllByRole( request.getSession().getAttribute("user.role").toString() );
        
        out.println("<table border=\"1px solid black\"");
        out.println("<tr><th colspan=\"5\">La liste des documents disponibles</th</td>");
        for(int i=0; i < uneListeDesDocuments.size(); i++) {
            out.println("<tr>");
            out.println("<td>" + uneListeDesDocuments.get(i).getTitre() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getFormat() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getPath() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getKeyword() + "</td>");
            out.println("<td><a href=\"\">Ouvrir</a></td>");
            out.println("</tr>");
        }
        out.println("</table>");
%>
</div>