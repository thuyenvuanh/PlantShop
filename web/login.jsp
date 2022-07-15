<%-- 
    Document   : login
    Created on : Jul 5, 2022, 12:29:46 PM
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
            <font style="color: red;"> ${requestScope.WARNING} </font>
            <h2>Login</h2>
            <form action="MainController" method="POST">
                <table>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="txtemail"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txtpassword"/></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="saveLogin" value="saveLogin"/></td>
                        <td>Stay signed in</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="login" name="action"/>
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
