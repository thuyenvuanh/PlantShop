/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.AccountDAO;
import daos.OrderDAO;
import dtos.CartItem;
import dtos.Order;
import dtos.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thuyn
 */
public class SaveShoppingCartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session != null) {
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                if (name == null || name.equals("")) {
                    request.setAttribute("WARNING", "You must login to finish the shopping");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    int accID = AccountDAO.getIdByEmail(email);
                    Order order = new Order(-1, new SimpleDateFormat("yyyy-MM-dd").format(new Date()), null, 1, accID);
                    boolean result = OrderDAO.insertOrder(order, cart);
                    if (result) {
                        session.setAttribute("cart", null);
                        request.setAttribute("WARNING", "Save your cart successfully");
                    } else {
                        request.setAttribute("WARNING", "These are plants out of stocks");
                    }
                }
            } else {
                request.setAttribute("WARNING", "Your cart is empty");
            }
            request.getRequestDispatcher("viewCart.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("index.jsp");
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
