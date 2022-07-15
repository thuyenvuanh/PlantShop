<%-- 
    Document   : header_loginedUser
    Created on : Jul 5, 2022, 12:50:31 PM
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
        <nav>
            <ul>
                <li><a href="MainController"/>Home</li>
                <li><a href="profile.jsp"/>Change profile</li>
                <li><a href="MainController?action=viewOrders&type=2"/>Completed Orders</li>
                <li><a href="MainController?action=viewOrders&type=3"/>Canceled Orders</li>
                <li><a href="MainController?action=viewOrders&type=1"/>Processing Orders</li>
                <li>
                    <div>
                        <form action="MainController" method="GET">
                            from <input type="date" name="from" value="${requestScope.from}"> <br>
                            to <input type="date" name="to" value="${requestScope.to}">
                            <input type="submit" value="filterDate" name="action">
                        </form>
                    </div>
                </li>
            </ul>
        </nav>
    </body>
</html>
