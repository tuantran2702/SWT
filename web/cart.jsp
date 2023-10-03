<%-- 
    Document   : homepage.jsp
    Created on : Jun 7, 2022, 7:54:38 AM
    Author     : Mido
--%>

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
        <link rel="stylesheet" href="css/product.css" />
        <link rel="stylesheet" href="css/cart.css" />
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
            <form id="cart-form" method="post" action="cart">
                <input type="hidden" name="product_id">
                <input type="hidden" name="value1">
                <input type="hidden" name="value2">
                <input type="hidden" name="form_quantity">
                <input type="hidden" name="from-cart" value="hehe">
            </form>

            <!-- header -->
            <header class="header--cart">
                <nav class="header-navbar container">
                    <ul class="header-navbar__list">
                        <li class="header-navbar__item header-navbar__item--hoverable">Kênh người bán</li>
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

                <div class="header-with-search--cart">
                    <div class="container">
                        <div style="display: flex; align-items: center;">
                            <div class="cart-header">
                                <a href="/mido" class="cart-header__logo">
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

                                    <div class="cart-header__page-name">Giỏ hàng</div>
                                </a>


                            </div>

                            <div class="cart-searchbar">

                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- body -->
            <div class="cart-home-page">
                <div>
                    <div class="container">
                        <div role="main" class="cart-product-section">
                            <div class="cart-product-section__header">
                                <div class="checkbox-wrapper">
                                    <label class="stardust-checkbox">
                                        <input class="stardust-checkbox__input checkbox-for-all" type="checkbox">
                                    </label>
                                </div>
                                <div class="cart-product-section__header-title1">
                                    Sản phẩm
                                </div>
                                <div class="cart-product-section__header-title2">
                                    Đơn giá
                                </div>
                                <div class="cart-product-section__header-title3">
                                    Số Lượng
                                </div>
                                <div class="cart-product-section__header-title4">
                                    Số Tiền
                                </div>
                                <div class="cart-product-section__header-title5">
                                    Thao Tác
                                </div>

                            </div>

                            <div class="cart-product-section__content">
                                <c:forEach var="cartDetail" items="${cartDetails}" varStatus="loop">
                                    <div class="cart-product__wrapper">
                                        <div class="flex items-center">
                                            <input class="input-cartdetail_id" type="hidden" value="${cartDetail.getId()}">
                                            <div class="checkbox-wrapper">
                                                <label class="stardust-checkbox">
                                                    <input class="stardust-checkbox__input single-checkbox" type="checkbox">
                                                </label>
                                            </div>

                                            <div class="cart-product-basic-info">
                                                <div class="flex">
                                                    <a title="${productArr[loop.index].getProductName()}"
                                                       href="/mido/product?id=${productArr[loop.index].getProductId()}">
                                                        <div class="cart-product-basic-info__image"
                                                             style="background-image: url('${imageArr[loop.index]}');">

                                                        </div>
                                                    </a>
                                                    <div class="cart-product-basic-info__name">
                                                        <a title="${productArr[loop.index].getProductName()}" href="/mido/product?id=${productArr[loop.index].getProductId()}">
                                                            ${productArr[loop.index].getProductName()}
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="cart-product-subgroup-wrapper">
                                                <div class="cart-product-subgroup">
                                                    <div class="subgroup-text-wrapper">
                                                        <div class="subgroup-text">
                                                            Phân Loại Hàng
                                                        </div>
                                                        <div class="subgroup-text">
                                                            ${valueArr[loop.index]}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="cart-product-price-section">
                                                <div>
                                                    <span class="cart-old-price">₫${oldPriceStringArr[loop.index]}</span>
                                                    <span class="cart-current-price">₫${priceStringArr[loop.index]}</span>
                                                </div>
                                            </div>

                                            <div class="cart-product-quantity-section">
                                                <div class="flex items-center">
                                                    <div style="margin-right: 15px;">
                                                        <div class="input-quantity">
                                                            <button 
                                                                type="submit" form="cart-form"
                                                                class="change-quantity-button decrease-button">
                                                                <svg enable-background="new 0 0 10 10"
                                                                     viewBox="0 0 10 10" x="0" y="0"
                                                                     class="mido-svg-icon">
                                                                <polygon
                                                                    points="4.5 4.5 3.5 4.5 0 4.5 0 5.5 3.5 5.5 4.5 5.5 10 5.5 10 4.5">
                                                                </polygon>
                                                                </svg>
                                                            </button>
                                                            <input name="quantity"
                                                                   class="change-quantity-button input-product-quantity"
                                                                   type="text" role="spinbutton" aria-valuenow="1"
                                                                   value="${quantityArr[loop.index]}">
                                                            <button
                                                                type="submit" form="cart-form"
                                                                class="change-quantity-button increase-button">
                                                                <svg enable-background="new 0 0 10 10"
                                                                     viewBox="0 0 10 10" x="0" y="0"
                                                                     class="mido-svg-icon icon-plus-sign">
                                                                <polygon
                                                                    points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5">
                                                                </polygon>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div style="display: none" class="quantity">${maxQuantityArr[loop.index]}</div>
                                                </div>
                                            </div>

                                            <div class="cart-product-total-section">
                                                <span>₫${totalPriceStringArr[loop.index]}</span>
                                            </div>

                                            <div class="cart-product-delete-section">
                                                <span class="delete-item">Xóa</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="border-below-product">
                                    </div>

                                </c:forEach>

                            </div>
                        </div>

                        <div class="order-section">
                            <div class="order-section-before">

                            </div>
                            <div class="order-wrapper">
                                <div class="checkbox-wrapper">
                                    <label class="stardust-checkbox">
                                        <input class="stardust-checkbox__input checkbox-for-all" type="checkbox">
                                    </label>
                                    
                                </div>

                                <div class="flex">
                                    <div class="final-total-price-section">
                                        <div class="final-total-price-section__label">
                                            Tổng thanh toán:
                                        </div>
                                        <div class="final-total-price-section__price">
                                            ₫0
                                        </div>
                                    </div>
                                    <form action="orderconfirm" method="post">
                                        <input type="hidden" name="cartdetail_id" value="">
                                        <button type="submit" class="order-button">
                                            <span>Mua hàng</span>
                                        </button>
                                    </form>
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

        <div id="modal" style="display:none;">
            <div>
                <div class="mido-popup">
                    <div class="mid-popup__overlay">
                        <div class="mido-popup__container">
                            <div class="mido-alert-popup">
                                <div class="mido-alert-popup__message">
                                    Bạn vẫn chưa chọn sản phẩm nào để mua.
                                    <div class="mido-alert-popup__message-list">

                                    </div>
                                </div>
                                <div class="mido-alert-popup__button-horizontal-layout">
                                    <button class="mido-button-solid mido-button-solid--primary">OK</button>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            let productArrId = [];
            let index1Arr = [];
            let index2Arr = [];
            <c:forEach var="p" items="${productArr}" varStatus="loop">
            productArrId[${loop.index}] = ${p.getProductId()};
            index1Arr[${loop.index}] = ${index1Arr[loop.index]};
            index2Arr[${loop.index}] = ${index2Arr[loop.index]};
            </c:forEach>
            let decreaseButtons = document.getElementsByClassName('decrease-button');
            for (let i = 0; i < decreaseButtons.length; i++) {
                decreaseButtons[i].onclick = function (event) {
                    let item = document.getElementsByClassName('input-product-quantity')[i];
//                    if (item.value !== '1') {
                    item.value = (parseInt(item.value) - 1) + '';
                    document.getElementsByName('product_id')[0].value = productArrId[i] + '';
                    document.getElementsByName('form_quantity')[0].value = '-1';
                    document.getElementsByName('value1')[0].value = index1Arr[i] + '';
                    document.getElementsByName('value2')[0].value = index2Arr[i] + '';
//                    } else
//                        event.preventDefault();
                };
            }
            let increaseButtons = document.getElementsByClassName('increase-button');
            for (let i = 0; i < increaseButtons.length; i++) {
                increaseButtons[i].onclick = function (event) {
                    let item = document.getElementsByClassName('input-product-quantity')[i];
                    let quantity = parseInt(document.getElementsByClassName('quantity')[i].innerHTML);
                    if (parseInt(item.value) === quantity)
                        event.preventDefault();
                    else {
                        item.value = Math.min(parseInt(item.value) + 1, quantity) + '';
                        document.getElementsByName('product_id')[0].value = productArrId[i] + '';
                        document.getElementsByName('form_quantity')[0].value = '1';
                        document.getElementsByName('value1')[0].value = index1Arr[i] + '';
                        document.getElementsByName('value2')[0].value = index2Arr[i] + '';
                    }


                };
            }

            let inputQuantities = document.getElementsByClassName('input-product-quantity');
            for (let i = 0; i < inputQuantities.length; i++) {
                inputQuantities[i].oninput = function () {

                    let item = inputQuantities[i];
                    if (item.value === '') {
                        item.value = 1;
                    }
                    if (isNaN(item.value)) {
                        item.value = item.value.substring(0, item.value.length - 1);
                    }
                    let quantity = parseInt(document.getElementsByClassName('quantity')[0].innerHTML);
                    item.value = Math.min(parseInt(item.value), quantity) + '';
                };
            }

            let checkBoxForAlls = document.getElementsByClassName('checkbox-for-all');
            for (let i = 0; i < checkBoxForAlls.length; i++) {
                checkBoxForAlls[i].onclick = function () {
                    let item = document.getElementsByClassName('stardust-checkbox__input');
                    for (let j = 0; j < item.length; j++) {
                        item[j].checked = checkBoxForAlls[i].checked;
                    }
                    let checkBoxs = document.getElementsByClassName('single-checkbox');
                    let total = 0;
            <c:forEach var="price" items="${totalPriceArr}" varStatus="loop">
                    if (checkBoxs[${loop.index}].checked)
                        total += ${totalPriceArr[loop.index]};
            </c:forEach>
                    document.getElementsByClassName('final-total-price-section__price')[0].innerHTML = "₫" + getPriceString(total);

                }
                ;
            }

            let checkBoxs = document.getElementsByClassName('single-checkbox');
            for (let i = 0; i < checkBoxs.length; i++) {
                checkBoxs[i].onclick = function () {
                    if (!checkBoxs[i].checked) {
                        let item = document.getElementsByClassName('checkbox-for-all');
                        for (let j = 0; j < item.length; j++) {
                            item[j].checked = checkBoxs[i].checked;
                        }
                    }
                    let total = 0;
            <c:forEach var="price" items="${totalPriceArr}" varStatus="loop">
                    if (checkBoxs[${loop.index}].checked)
                        total += ${totalPriceArr[loop.index]};
            </c:forEach>
                    document.getElementsByClassName('final-total-price-section__price')[0].innerHTML = "₫" + getPriceString(total);
                };
            }

            var orderButton = document.getElementsByClassName('order-button')[0];
            orderButton.onclick = (e) => {
                if (document.getElementsByClassName('final-total-price-section__price')[0].innerHTML.trim() === '₫0') {
                    e.preventDefault();
                    document.getElementById('modal').style.display = 'block';
                }
                for (let i = 0; i < checkBoxs.length; i++) {
                    if (checkBoxs[i].checked) {
                        document.getElementsByName('cartdetail_id')[0].value += document.getElementsByClassName('input-cartdetail_id')[i].value + '|';
                    }
                }
            };

            function getPriceString(price) {
                let s = price + "";
                let n = s.length;
                let priceString = "";
                for (let i = 0; i < n; i++) {
                    priceString += s.charAt(i);
                    if ((n - i - 1) % 3 === 0 && i !== n - 1)
                        priceString += ".";
                }
                return priceString;
            }

            document.getElementsByClassName('mido-button-solid--primary')[0].onclick = (e) => {
                document.getElementById('modal').style.display = 'none';
            };
            var deleteitems = document.getElementsByClassName('delete-item');
            for (let i = 0; i < deleteitems.length; i++) {
                deleteitems[i].onclick = (e) => {
                    let item = document.getElementsByClassName('input-product-quantity')[i];
                    document.getElementsByName('product_id')[0].value = productArrId[i] + '';
                    document.getElementsByName('form_quantity')[0].value = '-' + item.value;
                    document.getElementsByName('value1')[0].value = index1Arr[i] + '';
                    document.getElementsByName('value2')[0].value = index2Arr[i] + '';
                    document.getElementById('cart-form').submit();
                };
            }
        </script>
    </body>

</html>
