<%-- 
    Document   : header
    Created on : Jul 5, 2022, 12:22:48 PM
    Author     : anhthuyn2412@gmail.com - Vu Anh Thuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Homepage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="mycss.css" type="text/css" />
</head>
<body>
    <nav>
        <ul>
            <li><a href="MainController"><img id="logo" src="images/logo.jpg"></a> </li>
            <li><a href="MainController">Home</a></li>
            <li><a href="registration.jsp">Register</a></li>
            <li><a href="login.jsp" >Login</a></li>
            <li><a href="MainController?action=viewcart" >View Cart</a></li>
            <li>
                <form action="MainController" method="post" class="formsearch">
                    <input type="text" name="txtsearch" value="${param.txtsearch}">
                    <select name="searchby">
                        <option value="byname">by name</option>
                        <option value="bycate">by category</option>
                    </select>
                    <input type="submit" value="search" name="action" >
                </form>
            </li>
        </ul> 
    </nav>
</body>
</html>