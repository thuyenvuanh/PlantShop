<%--    Document   : index
    Created on : Jul 5, 2022, 12:24:59 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="daos.PlantDAO"%>
<%@page import="dtos.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${requestScope.list == null}">
    <jsp:forward page="/MainController"/>
</c:if>
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
            <c:forEach items="${requestScope.list}" var="plant" >
                <table class='product'>
                    <td><img src="${plant.imgPath}" class="plantimg"/> <br>
                        Product ID: ${plant.id} <br>
                        Product Name: ${plant.name} <br>
                        Price: ${plant.price} <br>
                        Status: ${requestScope.tmp[plant.status]} <br>
                        Category: ${plant.cateName} <br>
                        <a href="MainController?action=addtocart&pid=${plant.id}">Add to cart</a></td>
                </table> 
            </c:forEach>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
