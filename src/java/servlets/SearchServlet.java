/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import daos.PlantDAO;
import dtos.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anhthuyn2412@gmail.com - Vu Anh Thuyen
 */
public class SearchServlet extends HttpServlet {

    private PlantDAO dao = new PlantDAO();

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
        String keyword = request.getParameter("txtsearch");
        String searchBy = request.getParameter("searchby");
        System.out.println(keyword);
        System.out.println(searchBy);
        try {
            PrintWriter out = response.getWriter();
            ArrayList<Plant> list = dao.searchPlant(keyword, searchBy);

            out.print("<html>");
            out.println("<head>");
            out.print("<title>Homepage</title>");
            out.print("<meta charset=\"UTF-8\">");
            out.print("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.print("<link rel=\"stylesheet\" href=\"mycss.css\" type=\"text/css\" />");
            out.print("</head>");
            out.print("<body>");
            out.print("<header>");
            out.print("<nav>");
            out.print("<ul>");
            out.print("<li><a href=\"\"><img id=\"logo\" src=\"images/logo.jpg\"></a> </li>");
            out.print("<li><a href=\"index.html\">Home</a></li>");
            out.print("<li><a href=\"registration.html\">Register</a></li>");
            out.print("<li><a href=\"login.html\" >Login</a></li>");
            out.print("<li><form action=\"SearchServlet\" method=\"post\" class=\"formsearch\">");
            out.print("<input type=\"text\" name=\"txtsearch\">");
            out.print("<select name=\"searchby\">");
            out.print("<option value=\"byname\">by name</option><option value=\"bycate\">by category</option>");
            out.print("</select>");
            out.print("<input type=\"submit\" value=\"search\" name=\"action\" >");
            out.print("</form></li>");
            out.print("</ul> ");
            out.print("</nav>");
            out.print("</header>");
            out.print("<section>");

            ServletContext context = getServletContext();
            String tmp = context.getInitParameter("countryName");
            out.print("<p>The web is deploying in " + tmp + "</p>");
            ServletConfig config = getServletConfig();
            String tmp2 = config.getInitParameter("language");
            out.print("<p>Language use in the website is " + tmp2 + "</p>");
            
            
            out.print("<table class='product table'>");
            out.print("<tr>");
            out.print("<td>PID</td>");
            out.print("<td>PName</td>");
            out.print("<td>Price</td>");
            out.print("<td>Images</td>");
            out.print("<td>Detail</td>");
            out.print("<td>Action</td>");
            out.print("</tr>");

            for (Plant plant : list) {
                out.print("<tr>");
                out.print("<td>" + plant.getId() + "</td>");
                out.print("<td>" + plant.getName() + "</td>");
                out.print("<td>" + plant.getPrice() + "</td>");
                out.print("<td><img src='" + plant.getImgPath()+ "' class='product'/></td>");
                out.print("<td><a href='#'>View Detail</a></td>");
                out.print("<td><a href='#'>Add to your cart</a></td>");
                out.print("</tr>");
            }

            out.print("</table>");

            out.print("</section>");
            out.print("<footer>");
            out.print("<p></p>");
            out.print("</footer>");
            out.print("</body>");
            out.print("</html>");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("errorpage.jsp") ;
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
