<%-- 
    Document   : ManageProduct
    Created on : Mar 2, 2023, 2:57:29 PM
    Author     : choip
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
            <header class="header"></header>
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
                            <th>Description</th>
                            <th>Name</th>
                            <th>image</th>
                            <th>Category</th>
                            <th>Amount</th>
                            <th style="text-align:center;width:100px;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="plant" items="${requestScope.plantsList}">
                        <form action="MainController" method="post"  enctype="multipart/form-data">
                            <tr>
                                <td>${plant.id}</td>
                                <td><textarea style="width: 155px;height: 61px;" id="id" name="description" required="" rows="5" cols="10">${plant.description}</textarea></td>
                                <td><input type="text" name="name" value="${plant.name}" required="" /></td>
    
                                <td><img src="${plant.imgPath}" alt="alt" style="width: 50px;height: 50px"/>
                                <input type="file" name="file" size="60" accept="image/*" />
                                </td>
                                <td>    <select name="cateid" >
                                        <c:forEach var="cate" items="${requestScope.cateList}">
                                            <option ${cate.cateID == plant.cateid ? 'selected' :'' }  value="${cate.cateID}">${cate.cateName}</option>                                 
                                        </c:forEach>
                                    </select></td>
                                <td><input type="number" name="price" value="${plant.price}" required="" min="0"/></td>
                                <td>
                                    <input type="hidden" name="txtsearch" value="${param.txtsearch}" />
                                    <input type="hidden" name="searchby" value="${param.searchby}" />
                                    <input type="hidden" name="id" value="${plant.id}" />
                                    <input type="hidden" name="imgPath" value="${plant.imgPath}" />
                                    <button type="submit" value="updateProduct" name="action" class="btn btn-primary btn-xs dt-edit" style="margin-right:16px;">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true">Update</span>
                                    </button>

                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <c:if test="${empty requestScope.plantsList}">
                        <p>don't have any product</p>
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
