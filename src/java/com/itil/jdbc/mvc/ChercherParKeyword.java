package com.itil.jdbc.mvc;

import com.itil.dao.implementation.DocumentDao;
import com.itil.entites.Document;
import com.itil.jdbc.Connexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChercherParKeyword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String keyword = request.getParameter("keyword");
            try {
                Class.forName( request.getServletContext().getInitParameter("jdbcDriver"));
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ChercherParKeyword.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connexion.setUrl( request.getServletContext().getInitParameter("databaseURL") );
            DocumentDao unDocumentDao = new DocumentDao( Connexion.getInstance() );
            List<Document> uneListeDesDocuments = unDocumentDao.findAllByKeyword( keyword );
            request.setAttribute("wantedList", uneListeDesDocuments);
            request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}