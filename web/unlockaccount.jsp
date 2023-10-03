<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mở Khóa Tài Khoản</title>
        <link rel="stylesheet" href="../css/base.css" />
        <link rel="stylesheet" href="../css/admin.css" />
        <link rel="stylesheet" href="../css/addproduct_old.css" />
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
                                        <a href="/mido/admin/order" class="sidebar-submenu-item-link">
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
                                        <a style="color: #e84f20;" href="/mido/admin/unlock" class="sidebar-submenu-item-link">
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
                        <div class="product-info">
                            <div class="product-info__header">
                                <h2 class="title">

                                    Mở khóa tài khoản

                                </h2>

                                <p class="desc">
                                </p>
                            </div>

                            <form id="user-form" method="post">
                                <div class="product-edit product-name-edit">
                                    <label class="label-product">
                                        Tên đăng nhập:
                                    </label>
                                    <div class="input-wrap">
                                        <div class="input-wrap__inner">
                                            <input name="username" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" 
                                                   restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input" value="${username}">
                                        </div>
                                        <div class="product-edit-form-item-error"></div>
                                    </div>
                                </div>


                                <div class="flex items-center">
                                    <button type="submit" class="product-button" style="width: 115px;">
                                        <span>
                                            Mở khóa
                                        </span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- footer -->
            <footer class="">

            </footer>
        </div>

        <script>
            document.getElementsByClassName('product-edit-form-item-error')[0].style.display = 'none';
            <c:if test="${username != null}">
                document.getElementsByClassName('product-edit-form-item-error')[0].style.display = 'block';
                document.getElementsByClassName('product-edit-form-item-error')[0].innerHTML = 'Không tồn tại người dùng';
            </c:if>
            
            <c:if test="${active != null}">
                document.getElementsByClassName('product-edit-form-item-error')[0].style.display = 'block';
                document.getElementsByClassName('product-edit-form-item-error')[0].innerHTML = 'Tài khoản không bị khóa từ trước';
            </c:if>
            document.getElementById('user-form').onsubmit = (e) => {
                if (document.getElementsByName('username')[0].value === '') {
                    document.getElementsByClassName('product-edit-form-item-error')[0].style.display = 'block';
                    document.getElementsByClassName('product-edit-form-item-error')[0].innerHTML = 'Không được để trống';
                    e.preventDefault();
                } else
                    document.getElementsByClassName('product-edit-form-item-error')[0].style.display = 'none';
            };
        </script>
    </body>
</html>
