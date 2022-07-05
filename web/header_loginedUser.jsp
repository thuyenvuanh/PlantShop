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
                <li><a href="index.jsp"/>Home</li>
                <li><a href="profile.jsp"/>Change profile</li>
                <li><a href="completedOrders.jsp"/>Completed Orders</li>
                <li><a href="canceledOrders.jsp"/>Canceled Orders</li>
                <li><a href="processingOrders.jsp"/>Processing Orders</li>
                <li>
                    from <input type="date" name="from"/> 
                    to <input type="date" name="to"/>
                    <input type="submit" value="search"/>
                </li>
            </ul>

        </nav>
    </body>
</html>
