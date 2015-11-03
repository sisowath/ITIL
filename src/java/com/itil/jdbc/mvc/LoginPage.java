package com.itil.jdbc.mvc;

import com.itil.dao.implementation.UserDao;
import com.itil.entites.User;
import com.itil.jdbc.Connexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if(username.trim().equals("") || password.trim().equals("")) {
                request.setAttribute("error-message", "Erreur ! Authentification échouée...");
                request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            } else {
                try {
                    Class.forName( request.getServletContext().getInitParameter("jdbcDriver") );
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(LoginPage.class.getName()).log(Level.SEVERE, null, ex);
                }
                Connexion.setUrl( request.getServletContext().getInitParameter("databaseURL") );
                UserDao unUserDao = new UserDao( Connexion.getInstance() );
                User unUser = unUserDao.read( username );
                if( unUser == null ) {
                    request.setAttribute("error-message", "Erreur ! L'utilisateur " + username + " est inexistant.");
                    request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                    return;
                } else if( password.equals( unUser.getPassword() ) ) {
                    request.setAttribute("error-message", "Erreur ! Le mot de passe est incorrect.");
                    request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                    return;
                } else {
                    HttpSession objetSession = request.getSession(true);
                    objetSession.setAttribute("username", unUser.getUsername() );
                    request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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