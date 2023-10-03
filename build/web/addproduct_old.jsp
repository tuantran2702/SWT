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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/allproduct.css" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/addproduct_old.css" />
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
                                <img src="https://cf.shopee.vn/file/9201616cc89d545ed99786917176fbed" class="account-avatar">
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

            <div class="product">
                <div class="product-info-wrapper">
                    <div class="product-info">
                        <div class="product-info__header">
                            <h2 class="title">

                                Thêm 1 sản phẩm mới

                            </h2>

                            <p class="desc">
                                Vui lòng chọn ngành hàng phù hợp cho sản phẩm của bạn.
                            </p>
                        </div>

                        <form method="post" enctype = "multipart/form-data">
                            <div class="product-edit product-name-edit">
                                <label class="label-product">
                                    Tên sản phẩm:
                                </label>
                                <div class="input-wrap">
                                    <div class="input-wrap__inner">
                                        <input name="name" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" 
                                               restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                    </div>
                                    <div class="product-edit-form-item-error">Error</div>
                                </div>
                            </div>

                            <div class="product-edit product-desc-edit">
                                <label class="label-product">
                                    Mô tả sản phẩm:
                                </label>
                                <div class="input-wrap">
                                    <div class="input-wrap__inner">
                                        <textarea name="desc" placeholder="Nhập vào" type="textarea" resize="none" rows="2" minrows="9" maxrows="26" autosize="true" maxlength="Infinity" restrictiontype="input" 
                                                  max="Infinity" min="-Infinity" class="mido-input__textarea" style="resize: none; min-height: 210px; height: 210px;"></textarea>
                                    </div>
                                    <div class="product-edit-form-item-error">Error</div>
                                </div>
                            </div>

                            <div class="product-edit product-price-edit">
                                <label class="label-product">
                                    Giá sản phẩm:
                                </label>
                                <div class="input-wrap">
                                    <div class="input-wrap__inner">
                                        <input name="price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" 
                                               restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                    </div>
                                    <div class="product-edit-form-item-error">Error</div>
                                </div>
                            </div>

                            <div class="product-edit product-image-edit">
                                <label class="label-product">
                                    Ảnh sản phẩm:
                                </label>
                                <input class="input-image" type="file" name="image">
                            </div>

                            <button type="submit" class="product-button" style="width: 115px;">
                                <span>
                                    Submit
                                </span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- footer -->
            <footer class="">

            </footer>
        </div>

        <script>
            var item = document.getElementsByClassName("product-edit-form-item-error");
            for (let i = 0; i < item.length; i++) {
                item[i].style.display = 'none';
            }
        </script>
    </body>
</html>
