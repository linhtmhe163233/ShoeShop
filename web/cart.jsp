<%-- 
    Document   : cart
    Created on : Feb 28, 2023, 2:59:05 PM
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


    </head>
    <body>


        <section class="h-100 h-custom" style="background-color: #eee">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card">
                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="col-lg-7">
                                        <h5 class="mb-3">
                                            <a href="list" class="text-body"
                                               ><i class="fas fa-long-arrow-alt-left me-2"></i>Continue
                                                shopping</a>
                                        </h5>
                                        <hr />
                                        <div
                                            class="d-flex justify-content-between align-items-center mb-4"
                                            >
                                            <div>
                                                <p class="mb-1">Shopping cart</p>
                                                <p class="mb-0"><p id="ErrorTextMsg" class="errortxt">${requestScope.WARNING}</p></p>
                                            </div>
                                        </div>

                                        <c:if test="${sessionScope.cart != null}">  
                                            <c:forEach var="p" items="${sessionScope.cart.getCart().values()}">
                                                <c:set var="total" value="${total + (p.price * p.quantity)}" />
                                                <form action="UpdateCartServlet">
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-between">
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div>
                                                                        <img
                                                                            src="${p.imgPath}"
                                                                            class="img-fluid rounded-3"
                                                                            alt="Shopping item"
                                                                            style="width: 65px"
                                                                            />
                                                                    </div>
                                                                    <div class="ms-3">
                                                                        <h5>${p.name}</h5>
                                                                        <p class="small mb-0"><fmt:formatNumber type="number" pattern="#,###,###" value="${p.price}"/></p>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex flex-row align-items-center">
                                                                    <div style="width: 180px">
                                                                        <h5 class="fw-normal mb-0">
                                                                            <input
                                                                                type="number"
                                                                                min="1"
                                                                                max="20"
                                                                                name="quantity"
                                                                                value="${p.quantity}"
                                                                                />

                                                                        </h5>
                                                                    </div>
                                                                    <div style="width: 145px">
                                                                        <h5 class="mb-0"><fmt:formatNumber type="number" pattern="#,###,###" value="${p.price * p.quantity}"/> đ</h5>
                                                                    </div>
                                                                    <input type="hidden" name="pid" value="${p.id}" />
                                                                    <button class="me-3" style="color: #50ABC8;border: none;background-color: transparent" type="submit"><i class="fa fa-undo"></i></button>
                                                                    <a href="DeleteCartServlet?pid=${p.id}" style="color: #DC4C64"
                                                                       ><i class="fas fa-trash-alt"></i
                                                                        ></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="card bg-primary text-white rounded-3">
                                            <div class="card-body">
                                                <div
                                                    class="d-flex justify-content-between align-items-center mb-4"
                                                    >
                                                    <h5 class="mb-0">Card details</h5>
                                                </div>
                                                <c:if test="${sessionScope.USER != null}">
                                                    <c:if test="${sessionScope.cart == null}">

                                                        <a href="list">
                                                            <button
                                                                type="button"

                                                                class="btn btn-info btn-block btn-lg">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>You have no items in your inventory</span>
                                                                    <span
                                                                        >Home
                                                                        <i class="fas fa-long-arrow-alt-right ms-2"></i
                                                                        ></span>
                                                                </div>
                                                            </button></a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.cart != null}">
                                                        <a href="SaveShoppingCartServlet">
                                                            <button
                                                                type="button"

                                                                class="btn btn-info btn-block btn-lg">
                                                                <div class="d-flex justify-content-between">
                                                                    <span><fmt:formatNumber type="number" pattern="#,###,###" value="${total}"/> đ</span>
                                                                    <span
                                                                        >Checkout
                                                                        <i class="fas fa-long-arrow-alt-right ms-2"></i
                                                                        ></span>
                                                                </div>
                                                            </button></a>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${sessionScope.USER == null}">
                                                    <a href="login.jsp">
                                                        <button
                                                            type="button"
                                                            class="btn btn-info btn-block btn-lg">
                                                            <div class="d-flex justify-content-between">
                                                                <span>Please login to proceed with payment.</span>
                                                                <span
                                                                    >Login
                                                                    <i class="fas fa-long-arrow-alt-right ms-2"></i
                                                                    ></span>
                                                            </div>
                                                        </button></a>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
        ></script>

    </body>
</html>
