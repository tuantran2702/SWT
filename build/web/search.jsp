<%-- 
    Document   : search
    Created on : Jun 11, 2022, 7:06:58 PM
    Author     : Mido
--%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/base.css" />

        <link rel="stylesheet" href="css/main.css" />
        <link rel="stylesheet" href="css/search.css" />
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
            <form action="search" method="get" id="page-form">
                <input type="hidden" name="keyword" value="${param.keyword}">
                <input type="hidden" name="page_number">
                <input type="hidden" name="type" value="${param.type}">
            </form>
            <header class="header">
                <nav class="header-navbar container">
                    <ul class="header-navbar__list">
                        <li class="header-navbar__item">Kênh người bán</li>
                        <li class="header-navbar__item header__navbar-item--separate">Trở thành người bán Mido</li>
                        <li class="header-navbar__item header__navbar-item--separate">Tải ứng dụng</li>
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
                        <li class="header-navbar__item">
                            <a href="#" class="header-navbar__item-link">
                                <i class="right-icon fa-solid fa-bell"></i>
                                Thông báo
                            </a>
                        </li>
                        <li class="header-navbar__item">

                            <a href="help" class="header-navbar__item-link">
                                <i class="right-icon fa-solid fa-circle-question"></i>
                                Hỗ trợ
                            </a>
                        </li>
                        <c:if test="${cookie.username.value == null}">
                            <li class="header-navbar__item">
                                <a href="signup" class="header-navbar__item-link">Đăng ký</a>
                            </li>
                            <div class="navbar__item-separator"></div>
                            <li class="header-navbar__item">
                                <a href="login" class="header-navbar__item-link">Đăng nhập</a>
                            </li>
                        </c:if>

                        <c:if test="${cookie.username.value != null}">
                            <li class="header-navbar__item header-navbar__user">
                                <img src="${cookie.image.value}"
                                     alt="" class="header__navbar-user-img">
                                <a href="profile" class="header-navbar__item-link header__navbar-user-name">${cookie.username.value}</a>
                            </li>
                            <li class="header-navbar__item">
                                <a href="logout" class="header-navbar__item-link">Đăng xuất</a>     
                            </li>
                        </c:if>
                    </ul>
                </nav>

                <div class="header-with-search container">
                    <a href="/mido" class="header-with-search__logo-section">
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
                                <form id="search-form" action="search" class="mido-searchbar-input" method="get" autocomplete="off">
                                    <input name="keyword" type="text" aria-label="Tìm kiếm trên Mido"
                                           class="mido-searchbar-input__input" placeholder="Tìm kiếm trên Mido"
                                           autocomplete="off" maxlength="128" value="${param.keyword}" />
                                </form>
                            </div>

                            <button type="submit" class="search-btn" form="search-form">
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
                                        <c:if test="${cookie.username.value != null && cookie.cart_number.value != null}">
                                            <div class="mido-cart-number-badge">${cookie.cart_number.value}</div>
                                        </c:if>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </header>

            <div class="dYFPlI">
                <div class="content-wrapper">
                    <div class="container content">
                        <div class="filter-panel">

                        </div>

                        <div class="search-content">
                            <div class="search-item-result">
                                <h1 class="search-item-result__header">
                                    <i class="light-icon fa-solid fa-lightbulb"></i>
                                    <span class="search-item-result__header__text">
                                        Kết quả tìm kiếm cho từ khoá '${param.keyword}'
                                    </span>
                                </h1>

                                <div class="mido-sort-bar">
                                    <span class="mido-sort-bar__label">
                                        Sắp xếp theo
                                    </span>

                                    <div class="mido-sort-by-option">
                                        <c:set var="type1" value="1"></c:set>
                                        <c:set var="type2" value="2"></c:set>
                                        <c:set var="type3" value="3"></c:set>
                                        <c:set var="type0" value=""></c:set>
                                        <div class="mido-sort-by-option__option <c:if test="${param.type==null || param.type==type0 || param.type==type1}"> mido-sort-by-option__option--picked</c:if>"> 
                                            Liên quan   
                                        </div>
                                        <div class="mido-sort-by-option__option <c:if test="${param.type==type2}"> mido-sort-by-option__option--picked</c:if>">
                                            Mới nhất
                                        </div>
                                        <div class="mido-sort-by-option__option <c:if test="${param.type==type3}"> mido-sort-by-option__option--picked</c:if>">
                                            Bán chạy
                                        </div>
                                    </div>

                                    <div class="mini-page-controller">
                                        <div class="mido-mini-page-controller__state">
                                            <span class="mido-mini-page-controller__current">${pageNumber}</span>
                                            <span>/</span>
                                            <span class="mido-mini-page-controller__total">${numberOfPage}</span>
                                        </div>
                                        <button type="submit" form="page-form" class="mido-mini-page-controller__prev-btn mido-button-outline--disabled">
                                            <svg viewBox="0 0 7 11" class="icon-arrow-left-small"><path d="M4.694078 9.8185598L.2870824 5.4331785c-.1957415-.1947815-.1965198-.511363-.0017382-.7071046a.50867033.50867033 0 0 1 .000868-.0008702L4.7381375.2732784 4.73885.273991c.1411545-.127878.3284279-.205779.5338961-.205779.4393237 0 .7954659.3561422.7954659.7954659 0 .2054682-.077901.3927416-.205779.5338961l.0006632.0006632-.0226101.0226101a.80174653.80174653 0 0 1-.0105706.0105706L2.4680138 4.7933195c-.1562097.1562097-.1562097.4094757 0 .5656855a.45579485.45579485 0 0 0 .0006962.0006944l3.3930018 3.3763607-.0009482.0009529c.128869.1413647.2074484.3293723.2074484.5357331 0 .4393237-.3561422.7954659-.7954659.7954659-.2049545 0-.391805-.077512-.5328365-.2048207l-.0003877.0003896-.0097205-.0096728a.80042023.80042023 0 0 1-.0357234-.0355483z" fill-rule="nonzero"></path>
                                            </svg>
                                        </button>
                                        <button form="page-form" type="submit" class="mido-mini-page-controller__next-btn">
                                            <svg viewBox="0 0 7 11" class="icon-arrow-right-small"><path d="M2.305922 9.81856l4.4069956-4.385381c.1957415-.194782.1965198-.511364.0017382-.707105a.26384055.26384055 0 0 0-.000868-.00087L2.2618625.273278 2.26115.273991C2.1199955.146113 1.9327221.068212 1.7272539.068212c-.4393237 0-.7954659.356142-.7954659.795466 0 .205468.077901.392741.205779.533896l-.0006632.000663.0226101.02261c.0034906.003557.0070143.00708.0105706.010571L4.5319862 4.79332c.1562097.156209.1562097.409475 0 .565685-.0002318.000232-.0004639.000463-.0006962.000694L1.1382882 8.73606l.0009482.000953c-.128869.141365-.2074484.329372-.2074484.535733 0 .439324.3561422.795466.7954659.795466.2049545 0 .391805-.077512.5328365-.204821l.0003877.00039.0097205-.009673c.012278-.011471.0241922-.023327.0357234-.035548z" fill-rule="nonzero"></path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>

                                <div class="search-item-result__items">
                                    <c:forEach var="product" items="${product_list}">
                                        <div class="search-item-result__item">
                                            <a href="/mido/product?id=${product.getProductId()}">
                                                <div class="item-wrapper">
                                                    <div class="item-image-wrapper">
                                                        <img class="item-image" src="/mido/${product.getImage()}">
                                                    </div>
                                                    <div class="item-content-wrapper">
                                                        <div class="item-name">
                                                            ${product.getProductName()}
                                                        </div>
                                                        <div class="item-price">
                                                            <div class="item-old-price">₫

                                                                ${product.getPriceString(product.getPrice()*1.2)}
                                                            </div>
                                                            <div class="item-new-price">₫
                                                                ${product.getPriceString(product.getPrice() )}
                                                            </div>
                                                        </div>

                                                        <div class="item-rate">

                                                        </div>

                                                        <div class="item-place">
                                                            Hà Nội
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>

                                </div>

                                <div class="mido-page-controller-wrapper">
                                    <div class="mido-page-controller">
                                        <button type="submit" form="page-form" class="mido-icon-button mido-icon-button--left">
                                            <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="mido-svg-icon icon-arrow-left"><g><path d="m8.5 11c-.1 0-.2 0-.3-.1l-6-5c-.1-.1-.2-.3-.2-.4s.1-.3.2-.4l6-5c .2-.2.5-.1.7.1s.1.5-.1.7l-5.5 4.6 5.5 4.6c.2.2.2.5.1.7-.1.1-.3.2-.4.2z"></path></g>
                                            </svg>
                                        </button>
                                        <c:if test="${numberOfPage<8}">
                                            <button type="submit" form="page-form" class="mido-button-no-outline current-page-button">1</button>
                                            <c:forEach var="index" begin="2" end="${numberOfPage}">
                                                <button type="submit" form="page-form" class="mido-button-no-outline">${index}</button>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${numberOfPage>7}">
                                            <c:if test="${pageNumber<6}">
                                                <button type="submit" form="page-form" class="mido-button-no-outline current-page-button">1</button>
                                                <c:forEach var="index" begin="2" end="${pageNumber+2}">
                                                    <button type="submit" form="page-form" class="mido-button-no-outline">${index}</button>
                                                </c:forEach>
                                                <button class="mido-button-no-outline mido-button-no-outline--non-click">...</button>

                                            </c:if>

                                            <c:if test="${pageNumber>5}">
                                                <button type="submit" form="page-form" class="mido-button-no-outline current-page-button">1</button>
                                                <button type="submit" form="page-form" class="mido-button-no-outline">2</button>
                                                <button class="mido-button-no-outline mido-button-no-outline--non-click">...</button>
                                                <c:forEach var="index" begin="${pageNumber-2}" end="${pageNumber+2}">
                                                    <c:if test="${index<=numberOfPage}">
                                                        <button type="submit" form="page-form" class="mido-button-no-outline">${index}</button>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${pageNumber+2<numberOfPage}">
                                                    <button class="mido-button-no-outline mido-button-no-outline--non-click">...</button>

                                                </c:if>
                                            </c:if>

                                        </c:if>

                                        <button type="submit" form="page-form"  class="mido-icon-button mido-icon-button--right">
                                            <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="mido-svg-icon icon-arrow-right"><path d="m2.5 11c .1 0 .2 0 .3-.1l6-5c .1-.1.2-.3.2-.4s-.1-.3-.2-.4l-6-5c-.2-.2-.5-.1-.7.1s-.1.5.1.7l5.5 4.6-5.5 4.6c-.2.2-.2.5-.1.7.1.1.3.2.4.2z"></path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <-<!-- footer -->    
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
            let currentPage = document.getElementsByClassName('mido-mini-page-controller__current')[0];
            let maxPage = document.getElementsByClassName('mido-mini-page-controller__total')[0];
            let miniPrevButton = document.getElementsByClassName('mido-mini-page-controller__prev-btn')[0];
            let miniNextButton = document.getElementsByClassName('mido-mini-page-controller__next-btn')[0];
            let prevButton = document.getElementsByClassName('mido-icon-button mido-icon-button--left')[0];
            let nextButton = document.getElementsByClassName('mido-icon-button mido-icon-button--right')[0];
            let buttonList = document.getElementsByClassName('mido-button-no-outline');

            if (currentPage.innerHTML === '1' || currentPage.innerHTML === '0')
                miniPrevButton.classList.add('mido-button-outline--disabled');
            else
                miniPrevButton.classList.remove('mido-button-outline--disabled');

            if (currentPage.innerHTML === maxPage.innerHTML)
                miniNextButton.classList.add('mido-button-outline--disabled');
            else
                miniNextButton.classList.remove('mido-button-outline--disabled');

            miniNextButton.onclick = function (event) {
                if (miniNextButton.classList.contains('mido-button-outline--disabled'))
                    event.preventDefault();
                else {
                    document.getElementsByName('page_number')[0].value = parseInt(currentPage.innerHTML) + 1;
                }
            };
            miniPrevButton.onclick = function (event) {
                if (miniPrevButton.classList.contains('mido-button-outline--disabled'))
                    event.preventDefault();
                else {
                    document.getElementsByName('page_number')[0].value = Math.max(parseInt(currentPage.innerHTML) - 1, 1);
                }
            };

            prevButton.onclick = function (event) {
                if (miniPrevButton.classList.contains('mido-button-outline--disabled'))
                    event.preventDefault();
                else {
                    document.getElementsByName('page_number')[0].value = Math.max(parseInt(currentPage.innerHTML) - 1, 1);
                }
            };

            nextButton.onclick = function (event) {
                if (miniNextButton.classList.contains('mido-button-outline--disabled'))
                    event.preventDefault();
                else {
                    document.getElementsByName('page_number')[0].value = parseInt(currentPage.innerHTML) + 1;
                }
            };

            for (let i = 0; i < buttonList.length; i++) {
                if (buttonList[i].innerHTML === '${pageNumber}') {
                    document.getElementsByClassName('current-page-button')[0].classList.remove('current-page-button');
                    buttonList[i].classList.add('current-page-button');
                }
                buttonList[i].onclick = function (event) {
                    if (buttonList[i].innerHTML === '${pageNumber}')
                        event.preventDefault();
                    else {
                        document.getElementsByName('page_number')[0].value = parseInt(buttonList[i].innerHTML);
                    }
                };
            }
            var options = document.getElementsByClassName('mido-sort-by-option__option');
            for(let i=0;i<options.length;i++) {
                options[i].onclick = (e) => {
                    document.getElementsByName('type')[0].value = i+1+'';
                    document.getElementById('page-form').submit();
                };
            }
        </script>
    </body>

</html>
