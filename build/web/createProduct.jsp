<%-- 
    Document   : createProduct
    Created on : Mar 2, 2023, 4:02:17 PM
    Author     : choip
--%>

<%@page import="dal.CategoryDAO"%>
<%@page import="model.Categorie"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="./css/admin.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css">
    </head>
    <body>





        <div class="grid-container">
            <header class="header">
            </header>
            <aside class="sidenav">
                <ul class='sidebar-menu' id="menu">
                    <li class='' >
                    <atory.codeslab.net/admin/dashboard'> <i class= href='http://easy-inven'fa fa-dashboard'></i><span>Dashboard</span></a>
                        </li> 
                        <li class='active treeview'>
                            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class='glyphicon glyphicon-th-large'></i><span>Product</span></a>
                            <ul class="collapse list-unstyled" id="pageSubmenu">
                                <li class='active' >
                                    <a href='list'> <i class='glyphicon glyphicon-plus'></i><span>Home</span></a>
                                </li> 
                                <li class='' >
                                    <a href='createProduct.jsp'> <i class='glyphicon glyphicon-plus'></i><span>Add Product</span></a>
                                </li> 
                                <li class='' >
                                    <a href='MainController?action=manageProducts'> <i class='glyphicon glyphicon-th-list'></i><span>Manage Product</span></a>
                                </li> 
                                <li class='' >
                                    <a href='MainController?action=manageCategories'> <i class='glyphicon glyphicon-th-list'></i><span>Category</span></a>
                                </li> 
                            </ul> 
                        </li> 
                </ul> 
            </aside>
            <main class="main">

                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th style="text-align:center;width:100px;">Create</th>
                        </tr>
                    </thead>
                    <tbody>

                    <form action="MainController" method="post"  enctype="multipart/form-data" class="form">
                        <tr>
                            <td> Name</td>
                            <td><input type="text" name="name"  required="" /> </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="price"  required="" min="0"/> </td>
                        </tr>
                        <tr>
                            <td>image</td>
                            <td><input type="file" name="file" size="60" accept="image/*" required=""/></td>
                        </tr>
                        <tr>
                            <td>description</td>
                            <td>
                                <textarea style="width: 222px;height: 61px;" id="id" name="description" required="" rows="5" cols="10"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td>   
                                <select name="cateid" >
                                    <% List<Categorie> list = CategoryDAO.getCategories("");
                                        for (Categorie cate : list) {
                                    %>

                                    <option value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>

                            <td colspan="1"></td>
                            <td>  <button type="submit" value="createProduct" name="action" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true">Create</span>
                                </button></td>

                        </tr>
                    </form>

                    </tbody>
                </table>  
            </main>
            <footer class="footer"></footer>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    </body>
</html>
