<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">Siêu Thị Giày Trần Hoàn</a> 
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test = "${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manageraccount">Quản lý tài khoản</a>
                    </li>
                </c:if>

                <c:if test = "${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="managerproduct">Quản lý sản phầm</a> 
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Xin chào ${sessionScope.acc.user}</a>
                    </li>
                </c:if>  
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="EditProfile.jsp">Chỉnh sửa hồ sơ</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Invoice.jsp">Hóa đơn</a>
                    </li>
                </c:if>

            </ul>

            <%@include file="Search.jsp" %>
            <form action="search" method="post" class="form-inline my-2 my-lg-0">              
                <a class="btn btn-success btn-sm ml-3" href="managerCart">
                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 14px;">Giỏ hàng</span>
                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>  
                </a>
            </form>

            <ul class="navbar-nav">
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Đăng xuất</a> 
                    </li>
                </c:if>

                <c:if test="${sessionScope.acc == null}">
                    <form action="Login.jsp" method="post">
                        <li class="nav-item">
                            <button style="background-color: #343a40!important;color: white" type="submit">Đăng nhập</button>
                        </li>
                    </form>
                </c:if>
            </ul>

        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Siêu thị giày chất lượng cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm cung cấp các sản phầm giày nhập từ Trung Quốc</p>
    </div>
</section>
<!--end of menu-->
