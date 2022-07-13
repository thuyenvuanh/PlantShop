<%-- 
    Document   : viewCart
    Created on : Jul 12, 2022, 12:11:59 PM
    Author     : anhthuyn
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="dtos.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp"></jsp:include>
            </header>
            <section>
                <%
                    String name = (String) session.getAttribute("name");
                    if (name != null) {
                %>
                <h3>Welcome ${name} come back!</h3>
                <h3><a href="MainController?action=logout">Logout</a></h3>
                <h3><a href="personalPage.jsp">Personal page</a></h3>
                <% }
                %>
                <table width="100%" class="shopping">
                    <tr>
                        <td>Product ID</td>
                        <td>Name</td>
                        <td>Image</td>
                        <td>Quantity</td>
                        <td>Action</td>
                    </tr>
                <%
                    int total = 0;
                    HashMap<String, CartItem> cart = (HashMap) session.getAttribute("cart");
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            CartItem item = cart.get(pid);
                            total += (item.getPlant().getPrice()*item.getQuantity());
                            
                %>
                <form action="MainController" method="post">
                    <tr>
                        <td><input type="hidden" name="pid" value="<%= item.getPlant().getId() %>"><a href="MainController?action=viewPlant&pid=<%= pid%>"><%= item.getPlant().getId() %></a></td>
                        <td><%= item.getPlant().getName() %></td>
                        <td><img src="<%= item.getPlant().getImgPath() %>" class="plantimg"/></td>
                        <td><input type="number" name="quantity" value="<%= item.getQuantity() %>"></td>
                        <td><input type="submit" name="action" value="update">
                            <input type="submit" name="action" value="delete">
                        </td>
                    </tr>
                </form>

                <%
                    }
                } else {

                %>
                <tr><td>Your cart is empty</td></tr>
                <% }%>
                <tr><td>Total money: <%= total %></td></tr>
                <tr><td>Order Date: <%= (new Date()).toString()%></td></tr>
                <tr><td>Ship date: N/A</td></tr>
            </table>
        </section>
        <section>
            <form action="MainController" method="post">
                <input type="submit" name="action" value="saveorder" class="submitorder">
            </form>
            <p style="color: red;"> <%= (request.getAttribute("WARNING") == null) ? "" : request.getAttribute("WARNING") %> </p>
        </section>
        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
