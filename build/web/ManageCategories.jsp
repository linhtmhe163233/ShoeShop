<%-- 
    Document   : ManageCategories
    Created on : Feb 25, 2023, 6:22:45 PM
    Author     : admin
--%>
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
                <form action="MainController">
                    <input type="text" name="cateName" required=""/>
                    <button type="submit" value="createCategory" name="action">
                        Create
                    </button>
                </form>
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
                            <th>ID</th>
                            <th>Name</th>
                            <th style="text-align:center;width:100px;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cate" items="${requestScope.categoryList}">
                        <form action="MainController">
                            <tr>
                                <td>${cate.cateID}</td>
                                <td><input type="text" name="cateName" value="${cate.cateName}" required="" /> </td>
                                <td>
                                    <input type="hidden" name="cateID" value="${cate.cateID}" />
                                    <button type="submit" value="updateCategory" name="action" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true">Update</span>
                                    </button>

                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <c:if test="${empty requestScope.categoryList}">
                        <p>don't have any category</p>
                    </c:if>
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
