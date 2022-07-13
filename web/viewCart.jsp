<%-- 
    Document   : viewCart
    Created on : Jul 12, 2022, 12:11:59 PM
    Author     : anhthuyn
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
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
                <table width="100%" class="shopping">
                    <tr>
                        <td>Product ID</td>
                        <td>Quantity</td>
                        <td>Action</td>
                    </tr>
                <%
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                %>
                <form action="MainController" method="post">
                    <tr>
                        <td><input type="hidden" name="pid" value="<%= pid%>"><a href="#"><%= pid%></a></td>
                        <td><input type="number" name="quantity" value="<%= quantity%>"></td>
                        <td><input type="submit" name="update" value="update">
                            <input type="submit" name="delete" value="delete">
                        </td>
                    </tr>
                </form>

                <%
                    }
                } else {

                %>
                <tr><td>Your cart is empty</td></tr>
                <% }%>
                <tr><td>Total money:</td></tr>
            </table>
        </section>
        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
