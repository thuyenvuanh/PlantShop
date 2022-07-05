<%-- 
    Document   : registration
    Created on : Jul 5, 2022, 12:33:28 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form action="MainController">
                <h1>Register</h1>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Email:</td>
                            <td><input name="email" type="text" required/></td>
                        </tr>
                        <tr>
                            <td>Full Name:</td>
                            <td><input name="fullName" type="text" required/></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input name="password" type="password" required/></td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td><input name="phoneNumber" type="text"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="register" name="action"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
