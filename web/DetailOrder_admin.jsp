<%-- 
    Document   : DetailOrder_admin
    Created on : Jul 18, 2022, 8:12:12 PM
    Author     : thuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
    </head>
    <body>
        <c:if test="${sessionScope.account == null || sessionScope.account.role == 0}">
            <header>
                <c:import url="header.jsp"></c:import>
                </header>
                <section>
                    <h3 style="color: red;">
                        You have to login administrator account to use these features
                    </h3>
                    <a href="login.jsp">Login Now</a>
                </section>
                <footer>
                <c:import url="footer.jsp"></c:import>
                </footer>
        </c:if>
        <c:if test="${sessionScope.account != null && sessionScope.account.role == 1}">
            <c:import url="header_loginedAdmin.jsp" />
            <section>
                <table class="order">
                    <tr>
                        <td>Order ID</td>
                        <td>Plant ID</td>
                        <td>Plant Name</td>
                        <td>Image</td>
                        <td>Price</td>
                        <td>Quantity</td>
                    </tr>
                    <c:forEach items="${list}" var="od">
                        <tr>
                            <td>${od.orderID}</td>
                            <td>${od.plantID}</td>
                            <td>${od.plantName}</td>
                            <td><img src="${od.imgPath}" class="plantimg" alt="Plant image"/></td>
                            <td>${od.price}</td>
                            <td>${od.quantity}</td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td>Total</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${total}</td>
                        </tr>
                </table>
            </section>
            <footer>
                <c:import url="footer.jsp"/>
            </footer>
        </c:if>
    </body>
</html>
