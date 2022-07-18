<%-- 
    Document   : viewCart
    Created on : Jul 12, 2022, 12:11:59 PM
    Author     : anhthuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            <c:if test="${sessionScope.name != null}">
                <h3>Welcome ${name} come back!</h3>
                <h3><a href="MainController?action=logout">Logout</a></h3>
                <h3><a href="personalPage.jsp">Personal page</a></h3>
            </c:if>
            <table width="100%" class="order">
                <tr>
                    <td>Product ID</td>
                    <td>Name</td>
                    <td>Image</td>
                    <td>Quantity</td>
                    <td>Action</td>
                </tr>
                <c:forEach items="${cart}" var="item">
                    <form action="MainController" method="post">
                        <tr>
                            <td><input type="hidden" name="pid" value="${item.plant.id}"><a href="MainController?action=viewPlant&pid=${item.plant.id}">${item.plant.id}</a></td>
                            <td>${item.plant.name}</td>
                            <td><img src="${item.plant.imgPath}" class="plantimg"/></td>
                            <td><input type="number" name="quantity" value="${item.quantity}"></td>
                            <td><input type="submit" name="action" value="update">
                                <input type="submit" name="action" value="delete">
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
                <c:if test="${cart == null}">
                    <h3>Your cart is empty</h3>
                </c:if>
                    <p>Total money: ${total}</p>
                    <p>Order Date: ${orderDate}</p>
                    <p>Ship date: N/A</p>
        </section>
        <section>
            <form action="MainController" method="post">
                <input type="submit" name="action" value="Save Order" class="submitorder">
            </form>
            <p style="color: red;"> ${WARNING} </p>
        </section>
        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
