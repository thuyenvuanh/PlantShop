<%--    Document   : index
    Created on : Jul 5, 2022, 12:24:59 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@page import="daos.PlantDAO"%>
<%@page import="dtos.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.searchPlant("", "");
                } else {
                    list = PlantDAO.searchPlant(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                    for (Plant plant : list) {
            %>
            <table class='product'>
                <td><img src="<%= plant.getImgPath()%>" class="plantimg"/> <br>
                    Product ID: <%= plant.getId()%> <br>
                    Product Name: <%= plant.getName()%> <br>
                    Price: <%= plant.getPrice()%> <br>
                    Status: <%= tmp[plant.getStatus()]%> <br>
                    Category: <%= plant.getCateName()%> <br>
                    <a href="">Add to cart</a></td>
            </table>    
            <%                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
