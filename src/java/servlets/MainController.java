/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class MainController extends HttpServlet {

    private String url = "errorpage.jsp";

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
        String action = request.getParameter("action");
        if (action == null || action.equals("") || action.equals("search")) {
            url = "SearchServlet";
        } else if (action.equals("login")) {
            url = "LoginServlet";
        } else if (action.equals("register")) {
            url = "RegisterServlet";
        } else if (action.equals("logout")) {
            url = "LogoutServlet";
        } else if (action.equals("reorder")) {
            url = "OrderServlet";
        } else if (action.equals("updateinfo")) {
            url = "UpdateServlet";
        } else if (action.equals("addtocart")) {
            url = "AddToCartServlet";
        } else if (action.equals("viewcart")) {
            url = "viewCart.jsp";
        } else if (action.equals("update")) {
            url = "UpdateCartServlet";
        } else if (action.equals("delete")) {
            url = "DeleteCartServlet";
        } else if (action.equals("Save Order")) {
            url = "SaveShoppingCartServlet";
        } else if (action.equals("viewPlant")) {
            url = "ViewPlantDetail";
        } else if (action.equals("filterDate")) {
            url = "FilterOrderByDate";
        } else if (action.equals("viewOrders")) {
            url = "ViewOrders";
        } else if (action.equals("manageAccounts")) {
            url = "ManageAccounts";
        } else if (action.equals("updateAccountStatus")) {
            url = "UpdateAccount";
        } else if (action.equals("Search Account")) {
            url = "SearchAccount";
        } else if (action.equals("managePlants")) {
            url = "ManagePlant";
        } else if (action.equals("updatePlants")){
            url = "EditPlant";
        } else if (action.equals("Search Plants")) {
            url = "SearchPlants";
        } else if (action.equals("Search Orders")){
            url = "SearchOrders";
        } else if (action.equals("manageOrders")){
            url = "ManageOrders";
        } else if (action.equals("detailOrder")){
            url = "DetailOrder";
        } else if (action.equals("manageCategories")){
            url = "ManageCategories";
        } else if (action.equals("Search Categories")) {
            url = "SearchCategories";
        }
        request.getRequestDispatcher(url).forward(request, response);
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
