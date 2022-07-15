<%-- 
    Document   : viewPlant
    Created on : Jul 13, 2022, 9:05:16 PM
    Author     : thuyn
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
            <jsp:include page="header.jsp"></jsp:include>
            </header>
        <section>
                <table>
                    <tr><td rowspan="8"><img src="${plant.imgPath}"/></td></tr>
                <tr><td>ID:          ${plant.id}</td></tr>
                <tr><td>Name:        ${plant.name}</td></tr>
                <tr><td>Price:       ${plant.price}</td></tr>
                <tr><td>Category:    ${plant.cateName}</td></tr>
                <tr><td>Description: ${plant.description}</td></tr>
                <tr><td>Status:      ${plant.status}</td></tr>
            </table>
        </section>
        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
    </body>
</html>
