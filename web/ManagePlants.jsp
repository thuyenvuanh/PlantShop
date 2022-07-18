<%-- 
    Document   : ManagePlants
    Created on : Jul 18, 2022, 5:16:29 PM
    Author     : thuyn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Plants</title>
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
            <c:import url="header_loginedAdmin.jsp"/>
            <section>
                <h1>Plant List</h1>
                <section>
                    <h1>Plants List</h1>
                    <form action="MainController">
                        Name <input type="text" name="keyword" value="${requestScope.keyword}"/>
                    <input type="submit" name="action" value="Search Plants"/>
                </form>
                <table class="order">
                    <tr>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Status</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${requestScope.list}" var="plant" varStatus="loop">
                        <tr>
                            <td>${plant.name}</td>
                            <td><img src="${plant.imgPath}" class="plantimg"/></td>
                            <td>${plant.description}</td>
                            <td>${plant.cateName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${plant.status eq 0}">Inactive</c:when>
                                    <c:otherwise>Active</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber pattern="###,###,###.###" value="${plant.price}"/>
                            </td>
                            <td>
                                <a href="MainController?action=updatePlants&id=${plant.id}&status=${plant.status}">Sold in/Sold out</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </section>
            
            <footer>
                <c:import url="footer.jsp"/>
            </footer>
        </c:if>
    </body>
</html>
