<%-- 
    Document   : orderDetail
    Created on : Jul 5, 2022, 3:36:16 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>
<%@page import="dtos.OrderDetail"%>
<%@page import="daos.OrderDAO"%>
<%@page import="dtos.Order"%>
<%@page import="java.util.ArrayList"%>
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
            String orderID = request.getParameter("orderid");
            if (orderID != null) {
                ArrayList<OrderDetail> list = OrderDAO.getOrderDetails(Integer.parseInt(orderID));
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    int money = 0;
                    for (OrderDetail order : list) {
        %>
        <table class="order">
            <tr>
                <td>Order ID</td>
                <td>Plant ID</td>
                <td>Plant Name</td>
                <td>Image</td>
                <td>Price</td>
                <td>Quantity</td>
            </tr>
            <tr>
                <td><%= order.getOrderID()%></td>
                <td><%= order.getPlantID()%></td>
                <td><%= order.getPlantName()%></td>
                <td><img src="<%= order.getImgPath()%>" class="plantimg" alt="Plant image"/></td>
                <td><%= order.getPrice() %></td>
                <td><%= order.getQuantity()%></td>
                <% money = order.getPrice() * order.getQuantity(); %>
            </tr>
        </table>
        <% } %>
        <h3>Total: <%= money %></h3>
        <%
        } else {
        %>
        <p>You don't have any order</p>
        <%
                }
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
