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
        <link rel="stylesheet" href="css/orderconfirm.css" />
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

                                    <div class="cart-header__page-name">Thanh Toán</div>
                                </a>


                            </div>

                            <div class="cart-searchbar">

                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- body -->
            <div class="checkout-hompage">
                <div class="checkout-hompage__main">
                    <div class="checkout__address-section">
                        <div class="checkout__address-section__border-top">
                        </div>
                        <div class="checkout__address-wrapper">
                            <div class="checkout__address-header">
                                <div class="checkout__address-header__content">
                                    <div class="address-icon-wrapper">
                                        <svg height="16" viewBox="0 0 12 16" width="12" class="address-icon"><path d="M6 3.2c1.506 0 2.727 1.195 2.727 2.667 0 1.473-1.22 2.666-2.727 2.666S3.273 7.34 3.273 5.867C3.273 4.395 4.493 3.2 6 3.2zM0 6c0-3.315 2.686-6 6-6s6 2.685 6 6c0 2.498-1.964 5.742-6 9.933C1.613 11.743 0 8.498 0 6z" fill-rule="evenodd"></path>
                                        </svg>
                                    </div>
                                    <div>Địa chỉ nhận hàng</div>
                                </div>
                            </div>

                            <div class="checkout__address-address">

                                <div>
                                    <div class="checkout-address-wrapper">
                                        <div class="checkout-fullname">${user.getFullName()} ${user.getTelephone()}</div>
                                        <div class="checkout-address">${user.getAddress()}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="checkout__product-section">
                        <div class="checkout__product-section__header">
                            <div class="product-section__header-wrapper">
                                <div class="product-section__header1">
                                    <div class="product-section__header1-text">Sản phẩm</div>
                                </div>
                                <div class="product-section__header2">
                                </div>
                                <div class="product-section__header3">Đơn giá
                                </div>
                                <div class="product-section__header3">Số lượng
                                </div>
                                <div class="product-section__header4">Thành tiền
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="checkout__product-section__main">
                                <div>
                                    <div class="checkout__product-list">
                                        <div class="checkout__product-list-wrapper">
                                            <form id="order-form" action="order" method="post">
                                                <c:forEach var="cartdetail" items="${cartDetails}" varStatus="loop">
                                                    <input type="hidden" name="image" value="${imageArr[loop.index]}">
                                                    <input type="hidden" name="product_id" value="${productArr[loop.index].getProductId()}">
                                                    <input type="hidden" name="quantity" value="${quantityArr[loop.index]}">
                                                    <input type="hidden" name="subvalue" value="${valueArr[loop.index]}">
                                                    <input type="hidden" name="price" value="${priceArr[loop.index]}">
                   
                                                    
                                                    <div class="checkout__product-list-item">
                                                        <div class="checkout__product-basic-info">
                                                            <img class="checkout__product-image" src="${imageArr[loop.index]}" width="40" height="40">
                                                            <span class="checkout__product-name">
                                                                <span class="checkout__product-name-text">${productArr[loop.index].getProductName()}</span>
                                                            </span>
                                                        </div>

                                                        <div class="checkout__product-subgroup">
                                                            <span class="checkout__product-subgroup-text">Loại: ${valueArr[loop.index]}</span>
                                                        </div>

                                                        <div class="checkout__product-price">
                                                            ${priceStringArr[loop.index]}
                                                        </div>
                                                        <div class="checkout__product-quantity">
                                                            ${quantityArr[loop.index]}
                                                        </div>
                                                        <div class="checkout__product-total">
                                                            ${totalPriceStringArr[loop.index]}
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                            </form>


                                        </div>

                                    </div>
                                </div>

                                <div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="checkout__pay-section">
                        <div class="checkout__pay-section__method">
                            <div>
                                <div class="checkout-payment-setting">
                                    <div class="checkout-payment-method-view__current-title">Phương thức thanh toán</div>
                                    <div class="checkout-payment-setting__payment-methods-tab">
                                        <span tabindex="0">
                                            <button class="checkout__product-variation" aria-label="Thanh toán khi nhận hàng" aria-disabled="false">Thanh toán khi nhận hàng</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="checkout__pay-section__total">
                            <div class="checkout__pay-section__total-label">Tổng thanh toán:

                            </div>
                            <div class="checkout__pay-section__total-price">₫${totalString}</div>
                            <div class="checkout__pay-section__total-order">

                                <button form="order-form" type="submit" class="checkout__order-button">Đặt hàng</button>

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
                                    Bạn chưa có địa chỉ.
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
            document.getElementsByClassName('checkout__order-button')[0].onclick = (e) => {
                if (document.getElementsByClassName('checkout-address')[0].innerHTML === '') {

                    document.getElementById('modal').style.display = 'block';
                    e.preventDefault();
                }
            };

            document.getElementsByClassName('mido-button-solid--primary')[0].onclick = (e) => {
                document.getElementById('modal').style.display = 'none';
            };
        </script>
    </body>

</html>
