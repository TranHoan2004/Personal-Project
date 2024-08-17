<%-- 
    Document   : CustomerInformation
    Created on : Aug 16, 2024, 4:36:06 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/styleindex.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/stylecontact.css" />
        <link rel="stylesheet" href="js/mycode.js" />
        <title>Trang chủ</title>
        <style>
            .navbar-form.navbar-left {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }

            .navbar-form .btn {
                margin-left: 5px; /* Khoảng cách giữa các nút */
            }

            .navbar-form .form-group {
                margin-right: 10px; /* Khoảng cách giữa hộp tìm kiếm và nút Search */
            }
            .gian_hang {
                text-align: center;
            }
            .footer {
                margin-top: 10px; /* Tạo khoảng cách với phần phía trên */
            }

            .footer p,
            .footer h5 {
                margin: 5px 0;
            }
            .header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            .header h1 {
                margin: 0;
            }
            .profile-pic {
                width: 50px;
                height: 50px;
                background-color: #4CAF50;
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                font-size: 24px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input, .form-group select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            .form-group.gender {
                display: flex;
                align-items: center;
            }
            .form-group.gender label {
                margin-right: 10px;
            }
            .form-group.gender input {
                width: auto;
                margin-right: 5px;
            }
            .form-group.date-of-birth {
                display: flex;
                justify-content: space-between;
            }
            .form-group.date-of-birth select {
                width: 32%;
            }
            .save-button {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }
/*            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }*/
            .main {
                max-width: 800px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar navbar-inverse bg-primary" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button
                                type="button"
                                class="navbar-toggle"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                >
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="index.html">
                                        <span class="glyphicon glyphicon-home"></span> Trang chủ</a
                                    >
                                </li>
                                <li><a href="#">Thông tin</a></li>
                                <li><a href="#">Dịch vụ</a></li>
                                <li><a href="#">Tin tức</a></li>
                                <li>
                                    <a href="#"><span class="glyphicon glyphicon-envelope"></span>Contact</a>
                                </li>
                            </ul>
                            <form class="navbar-form navbar-left" role="search">
                                <div class="form-group">
                                    <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Tìm kiếm"
                                        />
                                </div>
                                <button type="submit" class="btn btn-default">Tìm kiếm</button>
                            </form>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        Tài khoản
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Thông tin cá nhân</a></li>
                                        <li><a href="#">Đơn mua</a></li> 
                                        <li><a href="Home.jsp">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>            
        </div>
        
                <%
                    if (request.getAttribute("user") != null) {
                        Account account = (Account) session.getAttribute("user"); 
                %>
                <p><%=account.getPassword()%></p> 
                <%
                    } else {
                %>
                <p>null</p> 
                <%    
                    }
                %>
        <div class="container-fluid main">
            <div class="header">
                <h1>Hồ sơ của tôi</h1>
                <div>
                    <img src="images/user.png" width="80px" alt="User"/> 
                </div>
            </div>
            <div class="form-group">
                <label for="full-name">Họ và tên</label>
                <input type="text" id="full-name" name="full-name">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="tel" id="phone" name="phone">
            </div>
            <div class="form-group gender">
                <label>Giới tính</label>
                <label><input type="radio" name="gender" value="male"> Nam</label>
                <label><input type="radio" name="gender" value="female"> Nữ</label>
            </div>
            <div class="form-group date-of-birth">
                <label for="day">Ngày sinh</label>
                <select id="day" name="day">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <!-- Thêm các tùy chọn khác -->
                </select>
                <select id="month" name="month">
                    <option value="1">Tháng 1</option>
                    <option value="2">Tháng 2</option>
                    <!-- Thêm các tùy chọn khác -->
                </select>
                <select id="year" name="year">
                    <option value="2024">2024</option>
                    <option value="2023">2023</option>
                    <!-- Thêm các tùy chọn khác -->
                </select>
            </div>
            <button class="save-button">Lưu</button>
        </div>

        <div class="container-fluid">            
            <div class="row">
                <p>text</p>
            </div>
        </div>
        
        <div class="container-fluid">            
            <div class="row">
                <p>text</p>
            </div>
        </div>
        
        <div class="container-fluid">            
            <div class="row">
                <p>text</p>
            </div>
        </div>

        <div class="container-fluid text-center footer">
            <div class="row">
                <div>
                    <p>Email : ShooesVN@gmail.com</p>
                    <p>Address: 100 Vuon Lai, Tan Phu District, HCMC</p>
                    <h5>&copy; Copyright 2021. Shoes.VN</h5>
                </div>
            </div>
        </div>

        <script>
            // JavaScript để xử lý sự kiện nhấp chuột
            document.getElementById("hamburgerMenu").addEventListener("click", function () {
                var menu = document.getElementById("menu");
                if (menu.style.display === "block") {
                    menu.style.display = "none";
                } else {
                    menu.style.display = "block";
                }
            });
        </script>                            
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/mycode.js"></script>
    </body>
</html>


