<%@page import="model.Product"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/base.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/main.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/admin.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/search.css" />
        <link rel="stylesheet" href="../css/profile.css" />
        <link rel="stylesheet" href="../css/order.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/adminorder.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="shortcut icon" href="../img/icon.png" type="image/x-icon">
    </head>
    <body>
        <div id="main">
            <!-- header -->
            <header class="admin-header-bar">
                <div class="admin-header-content">
                    <a href="/mido/admin" class="header-with-search__logo-section">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 389.26 318.9">
                        <path
                            d="M384.32,72.29,337.53,54.71l-6.95,11.53V264.15l6.95,12.13,46.79-13.51,4.94-13.12V85.85Zm-14,152.7h0a9.11,9.11,0,0,1-6.94,5.5h0a9.12,9.12,0,0,1-9.64-4.92h0a29.72,29.72,0,0,1-3.15-13.32V118.93a24.75,24.75,0,0,1,2.82-11.47h0a9.12,9.12,0,0,1,10.31-4.62l.15,0a9.16,9.16,0,0,1,6.25,5.46h0a52.47,52.47,0,0,1,3.77,19.52v79.29A46.57,46.57,0,0,1,370.34,225Z"
                            style="fill:#ffaf00;fill-rule:evenodd" />
                        <polygon
                            points="0 71.64 0 263.63 21.99 269.99 21.99 127.96 54.67 193.83 95.03 115.73 95.03 291.12 134.85 302.64 134.85 21.07 95.03 36 54.67 122.48 21.99 63.4 0 71.64"
                            style="fill:rgb(233, 57, 22);fill-rule:evenodd" />
                        <polygon points="140.58 18.92 140.58 304.3 191.03 318.9 191.03 0 140.58 18.92"
                                 style="fill:rgb(233, 57, 22);fill-rule:evenodd" />
                        <path
                            d="M316.09,46.91,191,0V318.9l125.06-36.18,7.54-16.61v-202ZM288.42,216.55h0a24.9,24.9,0,0,1-18.9,12.95l-28,3.46V90.27l29.21,6.1a24.9,24.9,0,0,1,17.06,13l.88,1.72a24.94,24.94,0,0,1,2.73,11.33v82.36A24.89,24.89,0,0,1,288.42,216.55Z"
                            style="fill:#ffaf00;fill-rule:evenodd" />
                        </svg>
                    </a>

                    <div class="header-content-box">
                        <a href="" class="header-content-text">
                            Kênh Admin
                        </a>
                    </div>

                    <div style="position: relative;">
                        <div class="admin-header-account-section">
                            <div class="admin-header-account-section__content">
                                <img src="/mido/${cookie.image.value}" class="account-avatar">
                                <span class="account-name">
                                    ${cookie.username.value}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="admin-header-action">
                        <a href="/mido/logout" class="logout">
                            Đăng xuất
                        </a>
                    </div>

                </div>
            </header>

            <div class="admin-app-container">
                <div class="admin-sidebar-container">
                    <div class="sidebar">
                        <ul class="sidebar-menu">
                            <li id="shipment" class="sidebar-menu-box">
                                <div class="sidebar-menu-item">
                                    <img src="https://cf.shopee.vn/file/c15905d5a6284687c4a6ad00d0feb511" 
                                         class="sidebar-menu-item-icon"/>
                                    <div class="sidebar-menu-item-text">
                                        Vận chuyển

                                    </div>
                                    <span class="sidebar-menu-item-space"><!----></span>
                                    <i class=" fa-solid fa-angle-up"></i>
                                </div>
                                <ul class="sidebar-submenu">
                                    <li class="sidebar-submenu-item">
                                        <a href="" class="sidebar-submenu-item-link">
                                            <span>
                                                Quản Lý Vận Chuyển
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="" class="sidebar-submenu-item-link">
                                            <span>
                                                Giao Hàng Loạt
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="" class="sidebar-submenu-item-link">
                                            <span>
                                                Cài Đặt Vận Chuyển
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li id="order" class="sidebar-menu-box">
                                <div class="sidebar-menu-item">
                                    <img src="https://cf.shopee.vn/file/f82f8ccb649afcdf4f07f1dd9c41bcb0" 
                                         class="sidebar-menu-item-icon"/>
                                    <div class="sidebar-menu-item-text">
                                        Quản Lý Đơn Hàng

                                    </div>
                                    <span class="sidebar-menu-item-space"><!----></span>
                                    <i class=" fa-solid fa-angle-up"></i>
                                </div>
                                <ul class="sidebar-submenu">
                                    <li class="sidebar-submenu-item">
                                        <a style="color: #e84f20;"  href="/mido/admin/order" class="sidebar-submenu-item-link">
                                            <span>
                                                Tất Cả
                                            </span>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <li id="product" class="sidebar-menu-box">
                                <div class="sidebar-menu-item">
                                    <img src="	https://cf.shopee.vn/file/3fa3bdb20eb201ae3f157ee8d11a39d5" 
                                         class="sidebar-menu-item-icon"/>
                                    <div class="sidebar-menu-item-text">
                                        Quản Lý Sản Phẩm

                                    </div>
                                    <span class="sidebar-menu-item-space"><!----></span>
                                    <i class=" fa-solid fa-angle-up"></i>
                                </div>
                                <ul class="sidebar-submenu">
                                    
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/addproduct" class="sidebar-submenu-item-link">
                                            <span>
                                                Thêm Sản Phẩm
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/updateproduct?type=1" class="sidebar-submenu-item-link">
                                            <span>
                                                Sửa Sản Phẩm
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/updateproduct?type=2" class="sidebar-submenu-item-link">
                                            <span>
                                                Xóa Sản Phẩm
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li id="category" class="sidebar-menu-box">
                                <div class="sidebar-menu-item">
                                    <img src="https://cf.shopee.vn/file/9f2ae273250a1a723d7d8892c9584c6d" 
                                         class="sidebar-menu-item-icon"/>
                                    <div class="sidebar-menu-item-text">
                                        Quản Lý Danh Mục

                                    </div>
                                    <span class="sidebar-menu-item-space"><!----></span>
                                    <i class=" fa-solid fa-angle-up"></i>
                                </div>
                                <ul class="sidebar-submenu">
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/addcategory" class="sidebar-submenu-item-link">
                                            <span>
                                                Thêm Danh Mục
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/updatecategory" class="sidebar-submenu-item-link">
                                            <span>
                                                Sửa Danh Mục
                                            </span>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                            <li id="user" class="sidebar-menu-box">
                                <div class="sidebar-menu-item">
                                    <img src="	https://cf.shopee.vn/file/3fa3bdb20eb201ae3f157ee8d11a39d5" 
                                         class="sidebar-menu-item-icon"/>
                                    <div class="sidebar-menu-item-text">
                                        Quản Lý User

                                    </div>
                                    <span class="sidebar-menu-item-space"><!----></span>
                                    <i class=" fa-solid fa-angle-up"></i>
                                </div>
                                <ul class="sidebar-submenu">
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/lockaccount" class="sidebar-submenu-item-link">
                                            <span>
                                                Khóa Tài Khoản
                                            </span>
                                        </a>
                                    </li>
                                    <li class="sidebar-submenu-item">
                                        <a href="/mido/admin/unlock" class="sidebar-submenu-item-link">
                                            <span>
                                                Mở Khóa Tài Khoản
                                            </span>
                                        </a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </div>
                </div>

                <div class="admin-page-content has-sidebar">
                    <div class="admin-page-content-wrapper">
                        <div class="body-right">
                            <div class="body-right__main">
                                <div class="body-right__main__header">
                                    <a class="purchase-header-item <c:if test="${param.type == null || param.type == 1}">selected-header-item</c:if>" href="/mido/admin/order?type=1">
                                            Tất cả
                                        </a>
                                        <a class="purchase-header-item <c:if test="${param.type == 2}">selected-header-item</c:if>" href="/mido/admin/order?type=2">
                                            Chờ xác nhận
                                        </a>
                                        <a class="purchase-header-item <c:if test="${param.type == 3}">selected-header-item</c:if>" href="/mido/admin/order?type=3">
                                            Đang giao
                                        </a>
                                        <a class="purchase-header-item <c:if test="${param.type == 4}">selected-header-item</c:if>" href="/mido/admin/order?type=4">
                                            Đã giao
                                        </a>
                                        <a class="purchase-header-item <c:if test="${param.type == 5}">selected-header-item</c:if>" href="/mido/admin/order?type=5">
                                            Đã Hủy
                                        </a>
                                    </div>
                                    <div>
                                    <c:forEach var="product" items="${productList}" varStatus="loop">
                                        <div class="order-product-wrapper">
                                            <div>
                                                <div class="order-product">
                                                    <div class="order-product__header">

                                                        <div class="order-product__status">
                                                            <div class="order-product__status-text">
                                                                ${orderDetails.get(loop.index).getStatus()}
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <li class="header-navbar__item header-navbar__user">
                                                                <img src="/mido/${userList.get(loop.index).getImg()}" alt=""
                                                                     class="header__navbar-user-img">
                                                                <a href="profile"
                                                                   class="header-navbar__item-link header__navbar-user-name">${userList.get(loop.index).getFullName()} | ${userList.get(loop.index).getTelephone()}</a>

                                                            </li>
                                                            <div style="display:inline-block;width: 40rem;color: black">
                                                                ${userList.get(loop.index).getAddress()}
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div style="border-bottom: 1px solid rgba(0,0,0,.09);">

                                                    </div>
                                                    <a href="/mido/product?id=${product.getProductId()}">
                                                        <div>
                                                            <span class="product-wrapper">
                                                                <div class="purchase-product-basic-info">
                                                                    <div class="purchase-product-image-wrapper">
                                                                        <div class="mido-image-wrapper">
                                                                            <div class="mido-image__content" style="background-image: url('/mido/${orderDetails.get(loop.index).getImage()}');">

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="purchase-product-basic-info__main">
                                                                        <div>
                                                                            <div class="purchase-product-name-wrapper">
                                                                                <span style="vertical-align: middle;">
                                                                                    ${product.getProductName()}
                                                                                </span>
                                                                            </div>
                                                                        </div>

                                                                        <div>
                                                                            <div class="purchase-product-subgroup">Phân loại hàng: ${orderDetails.get(loop.index).getSubValue1()}, ${orderDetails.get(loop.index).getSubValue2()}</div>
                                                                            <div class="purchase-product-quantity">
                                                                                x${orderDetails.get(loop.index).getQuantity()}
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="purchase-product-price-wrapper">
                                                                    <div>
                                                                        <span class="old-price">₫${orderDetails.get(loop.index).getPriceString(orderDetails.get(loop.index).getPrice()*1.2)}</span>
                                                                        <span class="current-price">₫${orderDetails.get(loop.index).getPriceString(orderDetails.get(loop.index).getPrice())}</span>
                                                                    </div>
                                                                </div>
                                                            </span>
                                                        </div>
                                                    </a>
                                                </div>

                                            </div>
                                            <div class="CqYika">
                                                <div class="oDBmi- n012K3"> </div>
                                                <div class="oDBmi- b-VPB8"> </div>

                                            </div>
                                            <div class="total-price-section">
                                                <div class="total-price-section__content">
                                                    <div class="total-price-section__label">Tổng số tiền:</div>
                                                    <div class="total-price-section__price">₫${orderDetails.get(loop.index).getPriceString(orderDetails.get(loop.index).getPrice()*orderDetails.get(loop.index).getQuantity())}</div>
                                                </div>
                                            </div>
                                            <div class="purchase-button-wrapper">
                                                <div class="purchase-button-wrapper__left">

                                                </div>
                                                <div class="purchase-button-wrapper__right">
                                                    <div class="_8vTqu9">
                                                        <c:set var="status1" value="chờ xác nhận"></c:set>
                                                        <c:set var="status2" value="đang giao"></c:set>
                                                        <c:set var="status3" value="đã giao"></c:set>
                                                        <c:set var="status4" value="đã hủy"></c:set>

                                                        <c:if test="${orderDetails.get(loop.index).getStatus().toLowerCase() == status1}">
                                                            <form action="/mido/updateorder" method="post">
                                                                <input type="hidden" name="check" value="${orderDetails.get(loop.index).getId()}">
                                                                <button style="margin-right: 12px" class="purchase-button">Xác nhận</button>
                                                            </form>
                                                            <form action="/mido/updateorder" method="post">
                                                                <input type="hidden" name="cancel" value="${orderDetails.get(loop.index).getId()}">
                                                                <button class="purchase-button">Hủy đơn hàng</button>
                                                            </form>
                                                        </c:if>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>

                            </div>
                        </div> 
                    </div>
                </div>
            </div>

            <!-- footer -->
            <footer class="">

            </footer>
        </div>

        <script>

        </script>
    </body>
</html>
