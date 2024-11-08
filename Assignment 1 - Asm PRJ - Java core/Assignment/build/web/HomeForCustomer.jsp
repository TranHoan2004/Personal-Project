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
                                        <li>
                                            <%
                                                if (request.getAttribute("user") != null) {
                                                    Account account = (Account) request.getAttribute("user");
                                                    session.setAttribute("user", account);
                                                }
                                            %>
                                            <a href="CustomerInformation.jsp">
                                                Thông tin cá nhân
                                            </a>
                                        </li>
                                        <li><a href="Home.jsp">Đăng xuất</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <img src="images/Shoes_Banner.jpg" class="img-responsive" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center title">
                    <h2>Gian hàng</h2>
                </div>
            </div>
            <div class="row gian_hang">
                <div class="col-md-3">
                    <div class="display-flex">
                        <img class="img-responsive" src="images/service01.jpg" />
                        <div class="text-group relative">
                            <h3 class="text-header">Giày Thể Thao</h3>
                            <p>Chất lượng tuyệt vời</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="display-flex">
                        <img class="img-responsive" src="images/service02.jpg" />
                        <div class="text-group relative">
                            <h3 class="text-header">Giày Thời Trang</h3>
                            <p>Đi giày là đẹp</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="display-flex">
                        <img class="img-responsive" src="images/service03.jpg" />
                        <div class="text-group relative">
                            <h3 class="text-header">Giày Quân Đội</h3>
                            <p>Ngầu lòi, mạnh mẽ, nam tính</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="display-flex">
                        <img class="img-responsive" src="images/service04.jpg" />
                        <div class="text-group relative">
                            <h3 class="text-header">Giày Da</h3>
                            <p>Quyến rũ, quý tộc, đẳng cấp</p>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="row part2">
                    <div class="col-sm-12 text-center">
                        <h2>COMBO GIÀY THỂ THAO TRÊN KỆ NGÀY HÔM NAY</h2>
                        <p>Trong thời gian khuyến mại, hãy mua giày của chúng tôi!</p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo01.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del> 200.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >150.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo02.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>500.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >450.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo03.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>150.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >100.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="row part2">
                    <div class="col-sm-12 text-center">
                        <h2>COMBO GIÀY THỜI TRANG TRÊN KỆ NGÀY HÔM NAY</h2>
                        <p>Trong thời gian khuyến mại, hãy mua giày của chúng tôi!</p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo01.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del> 200.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >150.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo02.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>500.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >450.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo03.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>150.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >100.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="row part2">
                    <div class="col-sm-12 text-center">
                        <h2>COMBO GIÀY QUÂN ĐỘI TRÊN KỆ NGÀY HÔM NAY</h2>
                        <p>Trong thời gian khuyến mại, hãy mua giày của chúng tôi!</p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo01.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del> 200.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >150.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo02.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>500.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >450.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo03.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>150.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >100.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="row part2">
                    <div class="col-sm-12 text-center">
                        <h2>COMBO GIÀY DA TRÊN KỆ NGÀY HÔM NAY</h2>
                        <p>Trong thời gian khuyến mại, hãy mua giày của chúng tôi!</p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo01.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del> 200.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >150.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo02.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>500.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >450.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="display-flex">
                            <img
                                class="img-responsive"
                                src="images/combo03.PNG"
                                class="img-responsive"
                                />
                            <div class="p">
                                <p>COMBO laundry 3 get 1 free</p>
                                <p>
                                    Discount locations:<span
                                        style="font-weight: bold; margin-left: 10px"
                                        >Tan Phu District Branch</span
                                    >
                                </p>
                                <p>
                                    Price: <del>150.000 vnđ </del>
                                    <span style="color: #f72b2f; margin-left: 10px"
                                          >100.000vnđ</span
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center">
                    <h2>SPECIAL ORDER ONLINE</h2>
                    <p>Surprisingly cheap and freeship</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div>
                        <img class="img-responsive" src="images/orderOnline.jpg" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div>
                        <img class="img-responsive" src="images/sale20.png" />
                        <div class="p">
                            <p class="des-title">Order online 20% off</p>
                            <p class="des-item">
                                Discount locations:<span
                                    style="font-weight: bold; margin-left: 10px"
                                    >Tan Phu District Branch</span
                                >
                            </p>
                            <p>
                                <del>100% </del>
                                <span style="color: #f72b2f; margin-left: 10px">80%</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div>
                        <img class="img-responsive" src="images/camau.jpg" />
                        <div class="p">
                            <p class="des-title">Free shipping under 3km</p>
                            <p class="des-item">
                                Discount locations:<span
                                    style="font-weight: bold; margin-left: 10px"
                                    >Tan Phu District Branch</span
                                >
                            </p>
                            <p>
                                <del>60.000 vnđ </del>
                                <span style="color: #f72b2f; margin-left: 10px">0 vnđ</span>
                            </p>
                        </div>
                    </div>
                </div>
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

