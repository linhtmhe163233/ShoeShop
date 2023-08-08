<%-- 
    Document   : login.jsp
    Created on : Mar 8, 2023, 9:57:13 PM
    Author     : choip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <div class="tab-pane fade show active" id="pills-login">
                    <form class="form_container" method="post" action="MainController">
                        <div  class="logo_container"></div>

                        <div class="title_container">
                            <p class="title">Login to your Account</p>
                            <span class="subtitle"
                                  >Get started with our app, just create an account and enjoy the
                                experience.</span
                            >

                        </div>
                        
                        <div class="input_container">
                            <label class="input_label" for="email_field"><p id="ErrorTextMsg" class="errortxt">${requestScope.MESSAGE}</p></label>
                            <i class="fa fa-user icon"></i>
                            <input
                                placeholder="username"
                                title="Inpit title"
                                name="userID"
                                type="text"
                                class="input_field"
                                id="email_field"
                                />
                        </div>
                        <div class="input_container">
                            <label class="input_label" for="password_field"></label>
                            <i class="fa fa-lock icon"></i>
                            <input
                                placeholder="Password"
                                title="Inpit title"
                                name="password"
                                type="password"
                                class="input_field"
                                id="password_field"
                                />
                        </div>
                        <button title="Sign In" name="action" value="login" type="submit" class="sign-in_btn">
                            <span>Sign In</span>
                        </button>
                        <div class="separator">
                            <hr class="line" />
                            <span>Or</span>
                            <hr class="line" />
                        </div>
                        <a href="./register.jsp" class="sign-in_ggl" style="width: 100%;">
                            <span>Register</span>
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
