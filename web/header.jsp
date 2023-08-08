<%-- 
    Document   : header_loginedAdmin
    Created on : Feb 22, 2023, 11:39:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="static/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <ul>
            <li><a href="FindAllProductServlet"> home </a></li>
            <li><a href="MainController?action=manageProducts"> Manage product </a></li>
            <li><a href="MainController?action=manageCategories"> Manage categories </a></li>
        </ul>
    </body>
</html>
