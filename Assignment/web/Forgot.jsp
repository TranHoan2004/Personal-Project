<%-- 
    Document   : Forgot
    Created on : Aug 13, 2024, 11:14:48 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Login V1</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"/>
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/util.css" />
        <link rel="stylesheet" type="text/css" href="css/main.css" />
        <style>
            .modal {
                display: none; /* Ẩn modal mặc định */
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0, 0, 0);
                background-color: rgba(0, 0, 0, 0.4); /* Nền mờ */
            }
            .modal-content {
                background-color: #333;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 400px;
                border-radius: 10px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            .role {
                text-align: center;
            }
            .error {
                text-align: center;
            }
            p {
                text-align: center;
            }
            /* CSS cho hiệu ứng trượt */
            .slide-in {
                animation: slide-in 0.5s forwards;
            }

            @keyframes slide-in {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }

            .slide-out {
                animation: slide-out 0.5s forwards;
            }

            @keyframes slide-out {
                from {
                    transform: translateX(0);
                    opacity: 1;
                }
                to {
                    transform: translateX(-100%);
                    opacity: 0;
                }
            }

            .hide {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100" id="emailForm">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/img-01.png" alt="IMG" />
                    </div>
                    <form class="login100-form validate-form" action="ForgotInformation" method="post">
                        <span class="login100-form-title">
                            Enter your account's email
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email"/>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn" id="nextButton" name="login">
                                Next
                            </button>
                        </div>
                        <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                            if (!error.equals("")) {
                        %>
                        <p style="color: red" class="error"><em><%= error%></em></p>  
                        <%
                            }
                        }
                        %>
                    </form>

                </div>
                <%
                        if (error != null) {
                            if (error.equals("")) {
                %>

                <div class="wrap-login100" id="passwordForm" class="hide">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/img-01.png" alt="IMG" />
                    </div>
                    <form class="login100-form validate-form" action="ForgotInformation" method="post">
                        <span class="login100-form-title">
                            Enter your account's new password
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password"/>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <input class="input100" type="password" name="new_password" placeholder="New Password"/>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn" name="completed">Complete</button>
                        </div>
                        <%
                            if (request.getParameter("password") != null && request.getParameter("new_password") != null) {
                                String password = request.getParameter("password");
                                String new_password = request.getParameter("new_password");
                                if (!password.equals(new_password)) {
                        %>
                        <p style="color: red" class="error"><em>Incorrect password</em></p>
                        <%            
                                }
                            }
                        %>
                    </form>
                </div>
                <%      
                        }
                    }
                %>                    
            </div>
        </div>

        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script>
            $(".js-tilt").tilt({
                scale: 1.1,
            });
            document.addEventListener("DOMContentLoaded", function () {
                const emailForm = document.getElementById("emailForm");
                const passwordForm = document.getElementById("passwordForm");
                const nextButton = document.getElementById("nextButton");

                // Đảm bảo chỉ có emailForm hiển thị ban đầu
                emailForm.classList.remove("hide");
                passwordForm.classList.add("hide");

                nextButton.addEventListener("click", function (event) {
                    event.preventDefault(); // Ngăn chặn hành vi gửi form mặc định

                    // Ẩn emailForm và hiện passwordForm với hiệu ứng trượt
                    emailForm.classList.add("hide");
                    passwordForm.classList.remove("hide");
                    passwordForm.classList.add("slide-in");
                });
            });
        </script>
        <script src="js/main.js"></script>
    </body>
</html>
