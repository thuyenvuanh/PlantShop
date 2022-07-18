<%-- 
    Document   : AdminIndex
    Created on : Jul 18, 2022, 3:45:26 PM
    Author     : thuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Homepage</title>
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

            </section>
            <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
        </c:if>
    </body>
</html>
