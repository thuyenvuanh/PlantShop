<%-- 
    Document   : profile
    Created on : Jul 5, 2022, 8:35:20 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dtos.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dtos.Order"%>
<%@page import="daos.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${sessionScope.name == null}">
            <p><font color = "red">You must login to view personal page</font</p>
            <p></p>
        </c:if>
        <c:if test="${sessionScope.name != null}">
            <header>
                <%@include file="header_loginedUser.jsp" %>
            </header>
            <section>
                <h3>Welcome ${email} come back</h3>
                <h3><a href="MainController?action=logout">Logout</a></h3>
                <form action="MainController" method="post">
                    <input type="hidden" name="id" value="${account.accID}" />
                    <table>
                        <tbody>
                            <tr>
                                <td>ID:</td>
                                <td>${account.accID}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" value="${account.email}" disabled readonly/></td>
                            </tr>
                            <tr>
                                <td>Full name: </td>
                                <td><input type="text" name="name" value="${account.fullname}"/></td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td><input type="tel" name="phone" value="${account.phone}"/></td>
                            </tr>
                            <tr>
                                <td>Role: </td>
                                <td>
                                    <c:if test="${account.role == 0}">User</c:if>
                                    <c:if test="${account.role == 1}">Admin</c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td>
                                    <c:if test="${account.status == 0}">Disabled</c:if>
                                    <c:if test="${account.status == 1}">Active</c:if>
                                    </td>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="updateinfo" name="action"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </section>

                <footer>
                <%@include file="footer.jsp" %>
            </footer>
        </c:if>
    </body>
</html>