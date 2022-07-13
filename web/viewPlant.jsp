<%-- 
    Document   : viewPlant
    Created on : Jul 13, 2022, 9:05:16 PM
    Author     : thuyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dtos.Plant" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp"></jsp:include>
            </header>
        <%
            Plant plant = (Plant) request.getAttribute("plant");
        %>
        <section>
            <table>
                <tr><td rowspan="8"><img src="<%= plant.getImgPath()%>"/></td></tr>
                <tr><td>ID:          <%= plant.getId()%></td></tr>
                <tr><td>Name:        <%= plant.getName()%></td></tr>
                <tr><td>Price:       <%= plant.getPrice()%></td></tr>
                <tr><td>Category:    <%= plant.getCateName()%></td></tr>
                <tr><td>Description: <%= plant.getDescription()%></td></tr>
                <tr><td>Status:      <%= plant.getStatus()%></td></tr>
            </table>
        </section>
        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
