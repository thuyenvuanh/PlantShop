/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import daos.AccountDAO;
import dtos.Account;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anhthuyn
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("txtemail");
        String password = request.getParameter("txtpassword");
        String save = request.getParameter("saveLogin");
        Account account = null;
        try {
            if (email == null || email.equals("") || password == null || password.equals("")) {
                Cookie[] c = request.getCookies();
                String token = "";
                if (c != null) {
                    for (Cookie cookie : c) {
                        if (cookie.getName().equals("selector")) {
                            token = cookie.getValue();
                        }
                    }
                }
                if (token != null && !token.equals("")) {
                    response.sendRedirect("UserDashboardServlet");
                } else {
                    response.sendRedirect("errorpage.jsp");
                }
            } else {
                account = AccountDAO.getAccount(email, password);
                if (account != null) {
                    if (account.getRole() == 1) {
                        //admin

                    } else {
                        //user/customer
                        HttpSession session = request.getSession(true);
                        if (session != null) {
                            session.setAttribute("name", account.getFullname());
                            session.setAttribute("email", account.getEmail());
                            session.setAttribute("account", account);
                            if (save != null) {
                                String token  = "ABC123";
                                AccountDAO.updateToken(account.getEmail(), token);
                                Cookie cookie = new Cookie("selector", token);
                                cookie.setMaxAge(60*2);
                                response.addCookie(cookie);
                            }
                            response.sendRedirect("UserDashboardServlet");
                        }
                    }
                } else {
                    response.sendRedirect("invalid.html");
                }
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
