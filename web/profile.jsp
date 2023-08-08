<%-- 
    Document   : profile
    Created on : Feb 28, 2023, 2:53:13 PM
    Author     : choip
--%>

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
        <link href="./style.css" rel="stylesheet"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>


        <div class="container" style="width: 35%; margin-top: 50px">
            <div class="tab-content">
                <div
                    class="tab-pane fade show active"
                    id="pills-register"
                    >
                    <form class="form_container" action="UpdateAccountServlet" method="post">
                        <div class="logo_container"></div>
                        <div class="title_container">
                            <p class="title">Change to your Account</p>
                            <span class="subtitle"
                                  >Get started with our app, just change an account and enjoy the
                                experience.</span
                            >
                        </div>
                        <p id="ErrorTextMsg" class="errortxt">${requestScope.MESSAGE}</p>
                        <div class="input_container">
                            <label class="input_label" for="email_field">Email</label>
                            <i class="fa fa-at icon"></i>
                            <input
                                placeholder="email"
                                title="Inpit title"
                                name="txtemail" 
                                value="${sessionScope.USER.email}" readonly="" 
                                type="email"
                                class="input_field"
                                id="email_field"
                                />
                        </div>
                        <div class="input_container">
                            <label class="input_label" for="email_field">fullname</label>
                            <i class="fa fa-user icon"></i>
                            <input
                                placeholder="fullname"
                                title="Inpit title"
                                name="txtfullname"
                                value="${sessionScope.USER.fullname}"
                                type="text"
                                class="input_field"
                                id="email_field"
                                />
                        </div>

                        <div class="input_container">
                            <label class="input_label" for="email_field">phone</label>
                            <i class="fa fa-phone icon"></i>
                            <input
                                placeholder="phone"
                                title="Inpit title"
                                name="txtphone"
                                value="${sessionScope.USER.phone}"
                                type="number"
                                class="input_field"
                                id="email_field"
                                />
                        </div>
                        <div class="input_container">
                            <label class="input_label" for="email_field">password</label>
                            <input
                                placeholder="password"
                                title="Inpit title"
                                name="txtpassword"
                                value="${sessionScope.USER.password}"
                                type="password"
                                class="input_field"
                                id="email_field"
                                />
                        </div>
                        <button title="Sign In"  type="submit" class="sign-in_btn">
                            <span>Change</span>
                        </button>
                        <div class="separator">
                            <hr class="line" />
                            <span>Or</span>
                            <hr class="line" />
                        </div>
                        <a href="./list" class="sign-in_ggl" style="width: 100%;">
                            <span>Home</span>
                        </a>
                    </form>
                </div>
            </div>
        </div>
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
        ></script>

    </body>
</html>
