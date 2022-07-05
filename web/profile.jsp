<%-- 
    Document   : profile
    Created on : Jul 5, 2022, 8:35:20 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

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
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Account account = (Account) session.getAttribute("account");
            if (name == null) {
        %>
        <p><font color = "red">You must login to view personal page</font</p>
        <p></p>
        <%
        } else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= email%> come back</h3>
            <h3><a href="MainController?action=logout">Logout</a></h3>
            <form action="MainController" method="post">
                <input type="hidden" name="id" value="<%= account.getAccID()%>" />
                <table>
                    <tbody>
                        <tr>
                            <td>ID:</td>
                            <td><%= account.getAccID()%></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" value="<%= account.getEmail()%>" disabled readonly/></td>
                        </tr>
                        <tr>
                            <td>Full name: </td>
                            <td><input type="text" name="name" value="<%= account.getFullname()%>"/></td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td><input type="tel" name="phone" value="<%= account.getPhone()%>"/></td>
                        </tr>
                        <tr>
                            <td>Role: </td>
                            <td><%= (account.getRole() == 1) ? "Admin" : "User"%></td>
                        </tr>
                        <tr>
                            <td>Active: </td>
                            <td><%= (account.getStatus() == 1) ? "Yes" : "No"%>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="update" name="action"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        <%
            }
        %>
    </body>
</html>