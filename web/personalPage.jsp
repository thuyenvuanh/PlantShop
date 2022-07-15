<%-- 
    Document   : personalPage
    Created on : Jul 5, 2022, 1:06:24 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>


<% if(request.getAttribute("login") == null) response.sendRedirect("UserDashboardServlet"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${requestScope.login == false}">
            <p><font color = "red">You must login to view personal page</font</p>
            <p></p>
        </c:if>

        <c:if test="${requestScope.login == true}">

            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <section>
                <h3>Welcome ${email} come back</h3>
                <h3><a href="MainController?action=logout">Logout</a></h3>
            </section>
            <c:if test="${requestScope.list.size() != 0}">
                <c:forEach items="${requestScope.list}" var="order">
                    <table class="order">
                        <tr>
                            <td>Order ID</td>
                            <td>Order Date</td>
                            <td>Ship Date</td>
                            <td>Order's status</td>
                            <td>Action</td>
                        </tr>
                        <tr>
                            <td>${order.orderID}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.shipDate}</td>
                            <td>${requestScope.status[order.status]}
                                <br> <c:if test="${order.status == 1}">
                                    <a href="#">Cancel Order</a>
                                </c:if>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=${order.orderID}">Detail</a></td>
                        </tr>
                    </table>
                </c:forEach>
            </c:if>
            <c:if test="${requestScope.list.size() == 0}">
                <p>You don't have any order</p>
            </c:if>
            <footer>
                <%@include file="footer.jsp" %>
            </footer>
        </c:if>
    </body>
</html>
