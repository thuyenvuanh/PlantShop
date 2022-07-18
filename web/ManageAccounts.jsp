<%-- 
    Document   : ManageAccounts
    Created on : Jul 18, 2022, 4:13:25 PM
    Author     : thuyn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Accounts</title>
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
                    <h1>Account List</h1>
                    <form action="MainController">
                        Email <input type="text" name="keyword" value="${requestScope.keyword}"/>
                    <input type="submit" name="action" value="Search Account"/>
                </form>
                <table class="order">
                    <tr>
                        <th>Email</th>
                        <th>Full Name</th>
                        <th>Status</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${requestScope.list}" var="account">
                        <tr >
                            <td>${account.email}</td>
                            <td>${account.fullname}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${account.status eq 0}">Inactive</c:when>
                                    <c:otherwise>Active</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${account.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${account.role eq 0}">User</c:when>
                                    <c:otherwise>Admin</c:otherwise>
                                </c:choose>
                            </td>
                            <c:if test="${account.role == 0}" >
                                <td>
                                    <c:url var="update" value="MainController">
                                        <c:param name="email" value="${account.email}"></c:param>
                                        <c:param name="status" value="${account.status}"></c:param>
                                        <c:param name="action" value="updateAccountStatus"></c:param>
                                    </c:url>

                                    <a href="${update}">Block/Unblock</a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </section>
            <footer>
                <c:import url="footer.jsp"></c:import>
                </footer>
        </c:if>
    </body>
</html>
