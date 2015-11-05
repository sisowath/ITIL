<%@page import="com.itil.entites.Document"%>
<%@page import="com.itil.dao.implementation.DocumentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.itil.jdbc.Connexion"%>
<div>
<%
        List<Document> uneListeDesDocuments = null;
        if( request.getAttribute("wantedList") == null ) {
            Class.forName( request.getServletContext().getInitParameter("jdbcDriver") );
            Connexion.setUrl( request.getServletContext().getInitParameter("databaseURL") );
            DocumentDao unDocumentDao = new DocumentDao( Connexion.getInstance() );
            uneListeDesDocuments = unDocumentDao.findAllByRole( request.getSession().getAttribute("user.role").toString() );
        } else {
            uneListeDesDocuments = (List<Document>) request.getAttribute("wantedList");
        }
        out.println("<table border=\"1px solid black\"");
        out.println("<tr><th colspan=\"7\">La liste des documents disponibles</th</td>");
        out.println("<tr>");
        out.println("<th>Titre</th>");
        out.println("<th>Auteur</th>");
        out.println("<th>Date de création</th>");
        out.println("<th>Format / Extension</th>");
        out.println("<th>Path</th>");
        out.println("<th>Keyword(s)</th>");
        out.println("</tr>");
        for(int i=0; i < uneListeDesDocuments.size(); i++) {
            out.println("<tr>");
            out.println("<td>" + uneListeDesDocuments.get(i).getTitre() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getAuteur() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getDateDeCreation() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getFormat() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getPath() + "</td>");
            out.println("<td>" + uneListeDesDocuments.get(i).getKeyword() + "</td>");
            out.println("<td><a href=\"" + uneListeDesDocuments.get(i).getPath() + uneListeDesDocuments.get(i).getTitre() + uneListeDesDocuments.get(i).getFormat() + "\">Ouvrir</a></td>");
            out.println("</tr>");
        }
        out.println("</table>");
%>
</div>