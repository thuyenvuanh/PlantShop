<%-- 
    Document   : processingOrders
    Created on : Jul 5, 2022, 4:16:58 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dtos.Order"%>
<%@page import="daos.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            if (name == null) {
        %>
        <p><font color = "red">You must login to view personal page</font</p>
        <p></p>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= email%> come back</h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
        </section>
        <%
            ArrayList<Order> list = OrderDAO.getOrders(email);
            String[] status = {"", "processing", "completed", "canceled"};
            if (list != null && !list.isEmpty()) {
                for (Order order : list) {
                    if (order.getStatus() == 1) {
        %>
        <table class="order">
            <tr>
                <td>Order ID</td>
                <td>Order Date</td>
                <td>Ship Date</td>
                <td>Order's status</td>
                <td>Action</td>
            </tr>
            <tr>
                <td><%= order.getOrderID()%></td>
                <td><%= order.getOrderDate()%></td>
                <td><%= order.getShipDate()%></td>
                <td><%= status[order.getStatus()]%>
                    <br><a href="#">Cancel</a>
                </td>
                <td><a href="orderDetail.jsp?orderid=<%= order.getOrderID() %>">Detail</a></td>
            </tr>
        </table>
        <% 
                    }
                }
            } else {
        %>
        <p>You don't have any order</p>
        <%
            }
        %>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>