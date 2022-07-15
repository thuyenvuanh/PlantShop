<%-- 
    Document   : canceledOrdres
    Created on : Jul 5, 2022, 4:14:24 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Canceled - PlantShop</title>
    </head>
    <body>
        <c:if test="${sessionScope.name == null}">
            <p><font color = "red">You must login to view personal page</font</p>
            <p></p>
        </c:if>
        <c:if test="${sessionScope.name != null}">
            <header>
                <jsp:include page="header_loginedUser.jsp"></jsp:include>
            </header>
                <section>
                    <h3>Welcome ${sessionScope.email} come back</h3>
                    <h3><a href="MainController?action=logout">Logout</a></h3>
                </section>
            <c:if test="${requestScope.list != null}">
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
                            <td>Canceled
                                <br><a href="MainController?action=reorder&orderid=${order.orderID}&accid=${order.accID}">Re-order</a>
                            </td>
                            <td><a href="orderDetail.jsp?orderid=${order.orderID}">Detail</a></td>
                        </tr>
                    </table>
                </c:forEach>
            </c:if>
            <c:if test="${requestScope.list == null}">
                <p>You don't have any order</p>
            </c:if>

            <footer>
                <jsp:include page="footer.jsp"></jsp:include>
                </footer>
        </c:if>

    </body>
</html>
