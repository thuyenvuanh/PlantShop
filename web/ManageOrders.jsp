<%-- 
    Document   : ManageOrders
    Created on : Jul 18, 2022, 7:02:01 PM
    Author     : thuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
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
        <c:import url="header_loginedAdmin.jsp"></c:import>
        <section>
            <h1>Orders List</h1>
            <form action="MainController">
                ID <input type="text" name="keyword" value="${requestScope.keyword}"/>
                <input type="submit" name="action" value="Search Orders"/>
            </form>
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
                        </td>
                        <td><a href="MainController?action=detailOrder&orderid=${order.orderID}">Detail</a></td>
                    </tr>
                </table>
            </c:forEach>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </c:if>
</body>
</html>
