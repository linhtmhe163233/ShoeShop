<%-- 
    Document   : index.jsp
    Created on : Feb 28, 2023, 10:07:14 AM
    Author     : choip
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Document</title>
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
            />
        <link href="./style.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />

    </head>
    <body>
        <header>
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <div class="container-fluid">
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-mdb-toggle="collapse"
                        data-mdb-target="#navbarExample01"
                        aria-controls="navbarExample01"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarExample01">
                        <ul
                            class="navbar-nav me-auto mb-2 mb-lg-0"
                            style="display: flex; align-items: center"
                            >
                            <li class="nav-item active">
                                <a
                                    class="nav-link"
                                    aria-current="page"
                                    href="list"
                                    style="font-size: 25px; font-weight: 700"
                                    >SHOES</a
                                >
                            </li>
                            <c:if test="${sessionScope.USER.role != null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="profile.jsp">profile</a>
                                </li>
                            </c:if> 

                            <c:if test="${sessionScope.USER.role == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="MainController?action=manageProducts">dashboard</a>
                                </li>
                            </c:if> 
                                   <li class="nav-item">
                                       <form action="list">
                                           <input type="text" name="txtSearch" value="${param.txtSearch}" />
                                           <input type="submit" value="Search" />
                                       </form>
        
                                    
                                </li>

                        </ul>
                        <a href="cart.jsp" style="color: #fff" class="me-3">
                            <button type="button" class="btn btn-success">
                                <i class="fa fa-cart-plus"></i> Cart
                            </button>
                        </a>
                        <c:choose>
                            <c:when test="${sessionScope.USER != null}">
                                <a href="LogoutServlet" style="color: #fff" class="me-3">  
                                    <button type="button" class="btn btn-danger">
                                        <i class="fa fa-sign-out-alt"></i> Logout
                                    </button>
                                </a>

                            </c:when> 
                            <c:otherwise>
                                <a href="login.jsp">    
                                    <button style="background-color: #66bb6a" type="button" class="btn btn-danger">
                                        <i class="fa fa-sign-out-alt"></i> Login
                                    </button>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
            <div class="p-5 text-center bg-light"></div>
        </header>
        <div class="container">
            ${requestScope.MESSAGE}
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach var="p" items="${requestScope.PList}">
                    <div class="col">
                        <div class="card">
                            <div class="content">
                                <img
                                    src="${p.imgPath}"
                                    class="card-img-top"
                                    alt="Skyscrapers"
                                    />
                                <div class="price"><fmt:formatNumber type="number" pattern="#,###,###" value="${p.price}"/> đ</div>
                                <div class="title">${p.name}</div>
                            </div>
                            <a href="AddToCartServlet?pid=${p.id}"><button>Buy now</button></a>
                        </div>
                    </div>
                </c:forEach>

                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item ${page == 1 ? 'disabled':''}">
                            <a class="page-link" href="list?page=${page-1}&txtSearch=${param.txtSearch}">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${requestScope.totalPage}" var="p" >
                            <c:choose>
                                <c:when test="${p == requestScope.page}">
                                    <li class="page-item active">
                                        <span class="page-link">
                                            ${p}
                                            <span class="sr-only">(current)</span>
                                        </span>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="list?page=${p}&txtSearch=${param.txtSearch}">${p}</a></li>    
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        <li class="page-item ${page == totalPage ? 'disabled':''}">
                            <a class="page-link" href="list?page=${page+1}&txtSearch=${param.txtSearch}">Next</a>
                        </li>
                    </ul>
                </nav>




            </div>
        </div>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
        ></script>
    </body>
</html>
