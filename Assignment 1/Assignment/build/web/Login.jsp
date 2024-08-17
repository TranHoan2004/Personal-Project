<%-- 
    Document   : Login
    Created on : Aug 13, 2024, 11:11:51 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login V1</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
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
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4); /* Nền mờ */
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
        </style>
    </head>
    <body>


        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="images/img-01.png" alt="IMG">
                    </div>

                    <form class="login100-form validate-form" action="login" method="post"> 
                        <span class="login100-form-title">
                            Login in here 
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                            <input class="input100" type="text" name="email" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Password is required">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100 validate-input role"> 
                            What is your role?
                            <select class="input100", name="role">
                                <option value="1">Admin</option> 
                                <option value="2">Seller</option>
                                <option value="3">Customer</option>                                
                            </select>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" name="login"> 
                                Login
                            </button>                            
                        </div>
                        <%
                            if (request.getAttribute("error") != null) {
                                String error = (String) request.getAttribute("error");
                                if (!error.equals("")) {
                        %>
                        <p style="color: red" class="error"><em><%= error%></em></p>  
                                <%
                                        }                               
                                    }
                                %>
                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Forgot
                            </span>
                            <a class="txt2" href="Forgot.jsp" name="forgot">
                                Username / Password? (Chưa xong)
                            </a> <!
                        </div>

                        <div class="text-center p-t-136">
                            <a id="loginBtn" class="txt2 " href="#">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="loginModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 class="text-center">Sign in with us :3</h2>
                <form action="create" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Email" name="new_account_email">
                    </div>
                    <div class="form-group">
                        <label for="text">Name</label>
                        <input type="text" class="form-control" placeholder="Name" name="new_account_name">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password" name="new_account_password">
                    </div>
                    <div class="form-group">
                        <label for="text">Phone number</label>
                        <input type="text" class="form-control" placeholder="Phone number" name="new_account_phone_num">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Create account</button>
                </form>
            </div>
            <%
                if (request.getAttribute("error") != null) {
                    String error = (String) request.getAttribute("error");
            %>
            <p style="color: red"><em><%=error%></em></p> 
                    <%
                        } else {
                    %>
            <p style="color: green"><em>Successfully</em></p> 
            <%    
                }
            %>
        </div>

        <script>
            // Lấy các phần tử
            var modal = document.getElementById("loginModal");
            var btn = document.getElementById("loginBtn");
            var span = document.getElementsByClassName("close")[0];

            // Khi người dùng nhấn vào nút, mở modal
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // Khi người dùng nhấn vào <span> (x), đóng modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // Khi người dùng nhấn vào bất kỳ đâu bên ngoài modal, đóng modal
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>



        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script >
            $('.js-tilt').tilt({
                scale: 1.1
            })
        </script>
        <script src="js/main.js"></script>

    </body>
</html>

