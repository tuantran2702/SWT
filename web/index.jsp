<%-- 
    Document   : homepage.jsp
    Created on : Jun 7, 2022, 7:54:38 AM
    Author     : Mido
--%>

<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Mido</title>
        <link rel="stylesheet" href="css/base.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
    </head>
    <body>
        <div id="main">
            <!-- header -->
            <header class="header">
                <nav class="header-navbar container">
                    <ul class="header-navbar__list">
                        <li class="header-navbar__item header-navbar__item--hoverable">Kênh người bán</li>
                        <li class="header-navbar__item header__navbar-item--separate header-navbar__item--hoverable">Trở thành người bán Mido</li>
                        <li class="header-navbar__item header__navbar-item--separate header-navbar__item--hoverable">Tải ứng dụng</li>
                        <li class="header-navbar__item header__navbar-item--separate">
                            <span class="header__navbar-title">Kết nối</span>
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fa-brands fa-facebook"></i>
                            </a>
                            <a href="" class="header__navbar-icon-link">
                                <i class="header__navbar-icon fa-brands fa-instagram"></i>
                            </a>
                        </li>

                    </ul>
                    <ul class="header-navbar__list">
                        <li class="header-navbar__item header-navbar__item--hoverable">
                            <a href="#" class="header-navbar__item-link">
                                <i class="right-icon fa-solid fa-bell"></i>
                                Thông báo
                            </a>
                        </li>
                        <li class="header-navbar__item header-navbar__item--hoverable">

                            <a href="help" class="header-navbar__item-link">
                                <i class="right-icon fa-solid fa-circle-question"></i>
                                Hỗ trợ
                            </a>
                        </li>
                        <c:if test="${cookie.username.value == null}">
                            <li class="header-navbar__item header-navbar__item--hoverable">
                                <a href="signup" class="header-navbar__item-link">Đăng ký</a>
                            </li>
                            <div class="navbar__item-separator"></div>
                            <li class="header-navbar__item header-navbar__item--hoverable">
                                <a href="login" class="header-navbar__item-link">Đăng nhập</a>
                            </li>
                        </c:if>

                        <c:if test="${cookie.username.value != null}">
                            <li class="header-navbar__item header-navbar__user header-navbar__item--hoverable">
                                <img src="${cookie.image.value}"
                                     alt="" class="header__navbar-user-img">
                                <a href="profile" class="header-navbar__item-link header__navbar-user-name">${cookie.username.value}</a>
                            </li>
                            <li class="header-navbar__item header-navbar__item--hoverable">
                                <a href="logout" class="header-navbar__item-link">Đăng xuất</a>     
                            </li>
                        </c:if>
                    </ul>
                </nav>

                <div class="header-with-search container">
                    <a href="" class="header-with-search__logo-section">
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
                    <div class="header-with-search__seach-section">
                        <div class="mido-searchbar">
                            <div class="mido-searchbar__main">
                                <form id="search-form" action="search" class="mido-searchbar-input" method="get"
                                      autocomplete="off">
                                    <input name="keyword" type="text" aria-label="Tìm kiếm trên Mido" class="mido-searchbar-input__input"
                                           placeholder="Tìm kiếm trên Mido" autocomplete="off" maxlength="128" value/>
                                </form>
                            </div>

                            <button type="submit" class="search-btn" form="search-form" >
                                <i class="search-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </div>
                    <div class="header-with-search__cart-section">
                        <div class="stardust-popover">
                            <div>
                                <div class="cart-container">
                                    <a href="cart" class="cart-item">
                                        <svg viewBox="0 0 26.6 25.6" class="mido-svg-icon cart-icon"><polyline fill="none" points="2 1.7 5.5 1.7 9.6 18.3 21.2 18.3 24.6 6.1 7 6.1" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2.5"></polyline><circle cx="10.7" cy="23" r="2.2" stroke="none"></circle><circle cx="19.7" cy="23" r="2.2" stroke="none"></circle>
                                        </svg>
                                        <c:set var="numbercart" value="0"></c:set>    
                                        <c:if test="${cookie.username.value != null && cookie.cart_number.value != null && cookie.cart_number.value!=numbercart}">
                                            <div class="mido-cart-number-badge">${cookie.cart_number.value}</div>
                                        </c:if>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </header>

            <!-- body -->
            <div class="home-page">
                <div role="main" class="container">
                    <div class="main-content">

                        <div class="category-list">
                            <div class="category-list__header">
                                <div class="category-list__header__title">
                                    Danh mục
                                </div>
                            </div>

                            <div class="category-list__content">
                                <div class="image-carousel">
                                    <div class="image-carousel__item-list-wrapper">
                                        <ul class="image-carousel__item-list">
                                            <%--<c:forEach begin="1" end="13">--%>
                                            <c:forEach var="category" items="${categoryList}" varStatus="loop" step="2" end="24">

                                                <li class="image-carousel__item">
                                                    <div class="home-category-list__group">
                                                        <a href="category?id=${category.getId()}" class="home-category-list__category-grid">
                                                            <div class="category-inner-content">
                                                                <div class="category-inner-content__image-wrapper">
                                                                    <div style="height: 100%; position: relative">
                                                                        <div class="category-inner-content__image" 
                                                                             style="background-image:
                                                                             url(${category.getImage()})">

                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class='category-inner-content__name-wrapper'>
                                                                    <div class='category-inner-content__name'>
                                                                        ${category.getName()}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>
                                                        <a href="category?id=${categoryList.get(loop.index+1).getId()}" class="home-category-list__category-grid">
                                                            <div class="category-inner-content">
                                                                <div class="category-inner-content__image-wrapper">
                                                                    <div style="height: 100%; position: relative">
                                                                        <div class="category-inner-content__image" 
                                                                             style="background-image:
                                                                             url(${categoryList.get(loop.index+1).getImage()})">

                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class='category-inner-content__name-wrapper'>
                                                                    <div class='category-inner-content__name'>
                                                                        ${categoryList.get(loop.index+1).getName()}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>

                                                    </div>

                                                </li>
                                            </c:forEach>
                                            <%--</c:forEach>--%>
                                        </ul>
                                    </div>
                                    <div class="carousel-arrow carousel-arrow--prev carousel-arrow--hint" role="button" tabindex="0" style="opacity: 1; visibility: hidden; transform: translateX(calc(-50% + 0px));">
                                        <svg enable-background="new 0 0 13 20" viewBox="0 0 13 20" x="0" y="0" class="icon-arrow-left-bold">
                                        <polygon points="4.2 10 12.1 2.1 10 -.1 1 8.9 -.1 10 1 11 10 20 12.1 17.9">
                                        </polygon>
                                        </svg>
                                    </div>
                                    <div class="carousel-arrow carousel-arrow--next carousel-arrow--hint" role="button" tabindex="0" style="opacity: 1; transform: translateX(calc(50% - 0px));">
                                        <svg enable-background="new 0 0 13 21" viewBox="0 0 13 21" x="0" y="0" class="icon-arrow-right-bold">
                                        <polygon points="11.1 9.9 2.1 .9 -.1 3.1 7.9 11 -.1 18.9 2.1 21 11.1 12 12.1 11"></polygon>
                                        </svg>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="section-recommend-products-wrapper">
                            <div>
                                <div class="section-recommend-products">
                                    <div>
                                        <nav style="background-color: #fff;" class="section-recommend-products__header-wrapper">
                                            <ul class="section-recommend-products__header">
                                                <li class="section-recommend-products__header-item">
                                                    <div class="border-below-header-item">

                                                    </div>
                                                    <div class="content-above-header-item">
                                                        <span style="color: rgb(238, 77, 45);">GỢI Ý HÔM NAY</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </nav>

                                        <div class="stardust-tabs-panels">
                                            <section class="stardust-tabs-panels__panel">
                                                <div class="recommend-products-list_wrapper">
                                                    <c:forEach var="product" items="${product_list}">
                                                        <div class="recommend-product-wrapper">
                                                            <a href="product?id=${product.getProductId()}" >
                                                                <div class="recommend-product">
                                                                    <div class="product">
                                                                        <div class="item-image-wrapper">
                                                                            <img class="item-image" src="${product.getImage()}">
                                                                        </div>
                                                                        <div class="item-content-wrapper">
                                                                            <div class="item-name">
                                                                                ${product.getProductName()}
                                                                            </div>
                                                                            <div class="item-price">
                                                                                <div class="item-old-price">₫
                                                                                    ${product.getPriceString(product.getPrice() + 500000)}
                                                                                </div>
                                                                                <div class="item-new-price">₫
                                                                                    ${product.getPriceString(product.getPrice())}
                                                                                </div>
                                                                            </div>

                                                                           <div class="item-new-price">
                                                                                     Viewer: ${product.getWeight()}
                                                                                 </div><!-- comment -->

                                                                            <div class="item-place">
                                                                                Hà Nội
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- footer -->
            <footer class="footer">
                <div style="background-color: #fbfbfb;">
                    <div class="footer__top">
                        <div class="footer__top-content">

                            <div class="footer__top-item">
                                <div class="footer__top-item__title">
                                    Chăm sóc khách hàng
                                </div>
                                <ul class="SOb2n7">
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Trung tâm trợ giúp</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Mido Blog</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Mido Mall</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Hướng Dẫn Mua Hàng</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Hướng Dẫn Bán Hàng</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Thanh Toán</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Mido Xu</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Vận Chuyển</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Trả Hàng & Hoàn Tiền</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Chăm Sóc Khách Hàng</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Chính Sách Bảo Hành</a>

                                    </li>
                                </ul>
                            </div>
                            <div class="footer__top-item">
                                <div class="footer__top-item__title">
                                    VỀ MIDO
                                </div>
                                <ul class="SOb2n7">
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Giới Thiệu Về Mido Việt Nam</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Tuyển Dụng</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Điều Khoản Mido</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Chính Sách Bảo Mật</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Chính Hãng</a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Kênh Người Bán</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Flash Sales</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Chương trình Tiếp thị liên kết Mido</a>

                                    </li>
                                    <li class="yy98Or">
                                        <a href="#" class="FA0WjS" title="">Liên Hệ Với Truyền Thông</a>

                                    </li>


                                    </li>
                                </ul>
                            </div>

                            <div class="footer__top-item">
                                <div class="footer__top-item__title">
                                    THANH TOÁN
                                </div>
                                <ul class="payment"> 
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-visa-png" style="width: 55px; height: 18px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-mastercard-png" style="width: 55px; height: 29px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-jcb-png" style="width: 55px; height: 23px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-amex-png" style="width: 55px; height: 24px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-vn_cod_footer-png" style="width: 50px; height: 29px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-vn_installment_footer-png" style="width: 55px; height: 29px;"></div>
                                    </li>
                                </ul>
                                <div class="footer__top-item__title">
                                    ĐƠN VỊ VẬN CHUYỂN
                                </div>
                                <ul class="payment"> 
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-ghtk-png" style="width: 55px; height: 18px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-ghn-png" style="width: 55px; height: 29px;"></div>                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-viettel_post-png" style="width: 55px; height: 40px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-vnpost-png" style="width: 55px; height: 27px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-vn_jnt_footer-png" style="width: 55px; height: 16px;"></div>
                                    </li>
                                    <li class="payment__item">
                                        <div class="footer-vn-background footer-vn-vn_installment_footer-png" style="width: 55px; height: 29px;"></div>
                                    </li>
                                </ul>
                            </div>

                            <div class="footer__top-item">
                                <div class="footer__top-item__title">
                                    THEO DÕI CHÚNG TÔI TRÊN
                                </div>
                                <ul class="SOb2n7">
                                    <li class="yy98Or">
                                        <a href="https://facebook.com/ShopeeVN" class="FA0WjS" title="" target="_blank">
                                            <div class="footer-vn-background footer-vn-f-png _6ZyW8Y"></div>Facebook
                                        </a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="https://instagram.com/Shopee_VN" class="FA0WjS" title="" target="_blank">
                                            <div class="footer-vn-background footer-vn-ins-png _6ZyW8Y"></div>Instagram
                                        </a>
                                    </li>
                                    <li class="yy98Or">
                                        <a href="https://linkedin.com/company/shopee" class="FA0WjS" title="" target="_blank">
                                            <div class="footer-vn-background footer-vn-lin-png _6ZyW8Y"></div>LinkedIn
                                        </a>
                                    </li>



                                    </li>
                                </ul>
                            </div>

                            <div class="footer__top-item">
                                <div class="footer__top-item__title">
                                    Tải ứng dụng Mido ngay thôi
                                </div>
                                <a class="pkg67p" href="/web/" target="_blank" rel="noopener noreferrer">
                                    <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/d91264e165ed6facc6178994d5afae79.png" alt="download_qr_code" class="ebQ6br">
                                    <div class="zLPzwH"><img class="hfut4Q" src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/39f189e19764dab688d3850742f13718.png" alt="App Store"><img class="hfut4Q" src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/f4f5426ce757aea491dce94201560583.png" alt="Play Store"><img class="hfut4Q" src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg//assets/1ae215920a31f2fc75b00d4ee9ae8551.png" alt="App Gallery">
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="footer__top-footer">
                            <div class="footer__top-footer-left">© 2022 Mido. Tất cả các quyền được bảo lưu.</div>
                            <div class="footer__top-footer-right">
                                <div class="footer__top-footer-right__label">
                                    Quốc gia & Khu vực:
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Singapore
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Indonesia
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Đài Loan
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Thái Lan
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Malaysia
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Việt Nam
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Philippines
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Brazil
                                </div>
                                <div class="footer__top-footer-right__item">
                                    México  
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Colombia
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Chile
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Poland
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Spain
                                </div>
                                <div class="footer__top-footer-right__item">
                                    Argentina
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>
        </div>

        <script>
            document.getElementsByClassName("carousel-arrow--next")[0].onclick = function () {
                document.getElementsByClassName("carousel-arrow--next")[0].style.visibility = 'hidden';
                document.getElementsByClassName("carousel-arrow--prev")[0].style.visibility = 'visible';
                let item = document.getElementsByClassName("image-carousel__item-list")[0];
                item.style.transform = 'translate(-360px, 0px)';

            };
            document.getElementsByClassName("carousel-arrow--prev")[0].onclick = function () {
                document.getElementsByClassName("carousel-arrow--prev")[0].style.visibility = 'hidden';
                document.getElementsByClassName("carousel-arrow--next")[0].style.visibility = 'visible';
                let item = document.getElementsByClassName("image-carousel__item-list")[0];
                item.style.transform = 'translate(0px, 0px)';
            };
        </script>
    </body>
</html>
