<%-- 
    Document   : ManageCategory
    Created on : Jul 18, 2022, 8:30:35 PM
    Author     : thuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <h1>Category List</h1>
            <form action="MainController">
                Name <input type="text" name="keyword" value="${requestScope.keyword}"/>
                <input type="submit" name="action" value="Search Categories"/>
            </form>
            <table class="order">
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                </tr>
                <c:forEach items="${requestScope.list}" var="cate">
                    <tr>
                        <td>${cate.id}</td>
                        <td>${cate.name}</td>
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
