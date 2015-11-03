package com.itil.jdbc.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(name = "ControleurFrontal", urlPatterns = {"/controller"})
public class ControleurFrontal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if( action == null ) {
                request.setAttribute("error-message", "Erreur ! L'action est invalide...");
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            } else {
                if("login".equals( action ) ) {
                    request.getServletContext().getRequestDispatcher("/signin").forward(request, response);
                    return;
                }
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
