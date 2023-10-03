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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/addproduct.css" />
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

            <div class="page">
                <div class="admin-product">
                    <div class="product-new">
                        <div class="product-edit">
                            <div class="product-edit__container">
                                <div class="product-edit__main">
                                    <form id="product-form" action="/mido/admin/updateproduct?type=1" method="post" enctype = "multipart/form-data">
                                        <input type="hidden" name="productid" value="${product.getProductId()}">
                                        <section class="product-edit__section">
                                            <h2>
                                                Thông tin cơ bản
                                            </h2>
                                            <div class="product-basic-info">
                                                <div class="container">
                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                Hình ảnh sản phẩm
                                                            </div>
                                                        </div>
                                                        <div class="mido-image-manager">
                                                            <input type="file" name="image" class="mido-upload__input">

                                                        </div>
                                                    </div>

                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                * Tên sản phẩm
                                                            </div>
                                                        </div>
                                                        <div class="edit-input">
                                                            <div class="popover-wrap">
                                                                <div class="mido-input__inner ">
                                                                    <input value="${product.getProductName()}" name="product_name" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                </div>
                                                            </div>
                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                        </div>
                                                    </div>
                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                * Mô tả sản phẩm
                                                            </div>
                                                        </div>
                                                        <div class="edit-input">
                                                            <div class="popover-wrap">
                                                                <div class="mido-input__area">
                                                                    <textarea name="product_desc" type="textarea" resize="none" rows="2" minrows="9" maxrows="26" autosize="true" 
                                                                              maxlength="Infinity" max="Infinity" min="-Infinity" 
                                                                              class="mido-input__textarea"
                                                                              style="resize: none; min-height: 210px; height: 210px;"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                        </div>
                                                    </div>

                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                * Danh mục
                                                            </div>
                                                        </div>
                                                        <div class="edit-input">
                                                            <div class="popover-wrap">
                                                                <select name="category" class="select-category" autocomplete="false" value="Thời Trang Nữ">
                                                                    <c:forEach var="category" items="${categoryList}">
                                                                        <option value="${category.getId()}" <c:if test="${product.getCategoryID() == category.getId()}">selected</c:if>>${category.getName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="product-edit__section">
                                            <h2>
                                                Thông tin chi tiết
                                            </h2>
                                            <div class="product-basic-info">
                                                <div class="container">
                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                * Thương hiệu
                                                            </div>
                                                        </div>
                                                        <div class="edit-input">
                                                            <div class="popover-wrap">
                                                                <div class="mido-input__inner ">
                                                                    <input value="${product.getBrand()}" name="brand" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                </div>
                                                            </div>
                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                        </div>
                                                    </div>


                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                * Xuất Xứ
                                                            </div>
                                                        </div>
                                                        <div class="edit-input">
                                                            <div class="popover-wrap">
                                                                <select name="country" class="select-category" autocomplete="false">
                                                                    <option value="Mỹ">Mỹ</option>
                                                                    <option value="Việt Nam">Việt Nam</option>
                                                                    <option value="Anh">Anh</option>
                                                                    <option value="Bồ Đào Nha">Bồ Đào Nha</option>
                                                                    <option value="Đức">Đức</option>
                                                                    <option value="Hàn">Hàn</option>
                                                                    <option value="Ý">Ý</option>
                                                                    <option value="Nhật">Nhật</option>
                                                                    <option value="Trung Quốc">Trung Quốc</option>

                                                                </select>
                                                            </div>
                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                        <section class="product-edit__section">
                                            <h2>
                                                Thông tin bán hàng
                                            </h2>
                                            <div class="product-sales-info">
                                                <div class="product-tier-variation">
                                                    <div class="options-panel-container">
                                                        <div class="product-basic-info__item group1">
                                                            <div class="edit-label">
                                                                <div>
                                                                    Nhóm phân loại 1
                                                                </div>
                                                            </div>
                                                            <div class="variation-edit-wrapper">
                                                                <div class="options-panel">
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>
                                                                                Tên nhóm phân loại
                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${productDetail.getSubgroupName1()}" name="subgroup_name1" type="text" placeholder="Nhập tên Nhóm phân loại hàng, ví dụ: màu sắc, kích thước v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="margin-top: 32px;" class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>
                                                                                Phân loại hàng
                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${value1[0]}" type="text" name="subgroup_value1" placeholder="Nhập phân loại hàng, ví dụ: Trắng, Đỏ v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${value1[1]}" type="text" name="subgroup_value1" placeholder="Nhập phân loại hàng, ví dụ: Trắng, Đỏ v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${value1[2]}" type="text" name="subgroup_value1" placeholder="Nhập phân loại hàng, ví dụ: Trắng, Đỏ v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${value1[3]}" type="text" name="subgroup_value1" placeholder="Nhập phân loại hàng, ví dụ: Trắng, Đỏ v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="product-basic-info__item group2">
                                                            <div class="edit-label">
                                                                <div>
                                                                    Nhóm phân loại 2
                                                                </div>
                                                            </div>
                                                            <div class="variation-edit-wrapper">
                                                                <div class="options-panel">
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>
                                                                                Tên nhóm phân loại
                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input value="${productDetail.getSubgroupName2()}" name="subgroup_name2" type="text" placeholder="Nhập tên phân loại, ví dụ: Size, v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div style="margin-top: 32px;" class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>
                                                                                Phân loại hàng
                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input type="text" name="subgroup_value2" placeholder="Nhập phân loại, ví dụ: S, M, v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input type="text" name="subgroup_value2" placeholder="Nhập phân loại, ví dụ: S, M, v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input type="text" name="subgroup_value2" placeholder="Nhập phân loại, ví dụ: S, M, v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="options-panel__item">
                                                                        <div class="edit-label">
                                                                            <div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="edit-text">
                                                                            <div class="popover-wrap">
                                                                                <div class="mido-input">
                                                                                    <div class="mido-input__inner">
                                                                                        <input type="text" name="subgroup_value2" placeholder="Nhập phân loại, ví dụ: S, M, v.v" size="large" 
                                                                                               resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" 
                                                                                               max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-basic-info__item">
                                                    <div class="edit-label">
                                                        <div>
                                                            * Kho hàng
                                                        </div>
                                                    </div>
                                                    <div class="edit-input">
                                                        <div class="popover-wrap">
                                                            <div class="mido-input__inner ">
                                                                <input value="${quantity}" name="quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                            </div>
                                                        </div>
                                                        <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                    </div>
                                                </div>
                                                <div class="product-basic-info__item">
                                                    <div class="edit-label">
                                                        <div>
                                                            * Giá
                                                        </div>
                                                    </div>
                                                    <div class="edit-input" style="
                                                         flex-basis: 540px;
                                                         width: 540px;
                                                         max-width: 540px;">
                                                        <div class="popover-wrap">
                                                            <div class="mido-input__inner ">
                                                                <input value="${price}" id="price" name="price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                            </div>
                                                        </div>
                                                        <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                    </div>
                                                    <button class="price-button" type="button">
                                                        <span>
                                                            Áp dụng cho tất cả phân loại
                                                        </span>
                                                    </button>
                                                </div>

                                                <div class="info-panel">
                                                    <div class="product-basic-info__item">
                                                        <div class="edit-label">
                                                            <div>
                                                                Danh sách phân loại hàng
                                                            </div>
                                                        </div>
                                                        <div class="edit-main">
                                                            <div class="variation-model-table">
                                                                <div class="variation-model-table-fixed-left">
                                                                    <div class="varation-model-table-header">
                                                                        <div style="display: flex;">
                                                                            <div class="table-header">

                                                                                <div id="subgroupname1" class="popover-cell-content">
                                                                                    Tên
                                                                                </div>
                                                                            </div>
                                                                            <div id="subgroupname2" class="table-header">
                                                                                <div class="popover-cell-content">
                                                                                    Tên
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="variation-model-table-body">
                                                                        <div class="table-cell-wrapper">
                                                                            <div class="first-variation subgroupvalue1">
                                                                                Loại
                                                                            </div>
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="table-cell-wrapper">
                                                                            <div class="first-variation subgroupvalue1">
                                                                                Loại
                                                                            </div>
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="table-cell-wrapper">
                                                                            <div class="first-variation subgroupvalue1">
                                                                                Loại
                                                                            </div>
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="table-cell-wrapper">
                                                                            <div class="first-variation subgroupvalue1">
                                                                                Loại
                                                                            </div>
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell subgroupvalue2">
                                                                                        Loại
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="variation-model-table-middle-scroll">
                                                                    <div class="variation-model-table-header">
                                                                        <div style="display: flex;">
                                                                            <div class="table-header">

                                                                                <div class="popover-cell-content">
                                                                                    Giá
                                                                                </div>
                                                                            </div>
                                                                            <div class="table-header">
                                                                                <div class="popover-cell-content">
                                                                                    Kho hàng
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="variation-model-table-body">
                                                                        <div class="table-cell-wrapper">
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="table-cell-wrapper">
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="table-cell-wrapper">
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input  name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input value="0" name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="table-cell-wrapper">
                                                                            <div style="flex: 1 1 0%;">
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input value="0" name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div  class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input value="0" name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input value="0" name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="data-group">
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_price" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="table-cell">
                                                                                        <div class="variation-model-table-cell">
                                                                                            <div class="popover-wrap">
                                                                                                <div class="mido-input__inner ">
                                                                                                    <input name="subgroup_quantity" type="text" placeholder="Nhập vào" size="large" resize="none" rows="2" minrows="2" maxlength="Infinity" restrictiontype="input" max="Infinity" min="-Infinity" class="mido-input__input" value="0">
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-edit-form-item-error">Không được để trống ô</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="product-basic-info__item" style="margin-bottom: 0">
                                                    <div class="edit-label label-subgroup1">
                                                        <div>
                                                            Nhóm phân loại 1
                                                        </div>
                                                    </div>
                                                    <div class="mido-image-manager">
                                                        <input type="file" name="subgroup_image1" class="mido-upload__input input-file">

                                                    </div>

                                                </div>

                                                <div style="margin-bottom: 0" class="product-basic-info__item">
                                                    <div class="edit-label">
                                                        <div>

                                                        </div>
                                                    </div>
                                                    <div class="mido-image-manager">
                                                        <input type="file" name="subgroup_image2" class="mido-upload__input input-file">

                                                    </div>

                                                </div>

                                                <div style="margin-bottom: 0" class="product-basic-info__item">
                                                    <div class="edit-label">
                                                        <div>

                                                        </div>
                                                    </div>
                                                    <div class="mido-image-manager">
                                                        <input type="file" name="subgroup_image3" class="mido-upload__input input-file">

                                                    </div>

                                                </div>

                                                <div style="margin-bottom: 0" class="product-basic-info__item">
                                                    <div class="edit-label">
                                                        <div>

                                                        </div>
                                                    </div>
                                                    <div class="mido-image-manager">
                                                        <input type="file" name="subgroup_image4" class="mido-upload__input input-file">

                                                    </div>

                                                </div>

                                            </div>
                                        </section>
                                    </form>
                                </div>
                                <div class="mido-fix-bottom-card">
                                    <div class="fix-container">
                                        <div class="container">
                                            <div class="container-right">
                                                <button form="product-form" type="submit" class="product-submit-button" >
                                                    <span>
                                                        Lưu & Hiển thị
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
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
            if (document.getElementsByName('subgroup_name1')[0].value !== '')
                document.getElementById('subgroupname1').innerHTML = document.getElementsByName('subgroup_name1')[0].value;
            if (document.getElementsByName('subgroup_name2')[0].value !== '')
                document.getElementById('subgroupname2').innerHTML = document.getElementsByName('subgroup_name2')[0].value;
            for (let i = 0; i < 4; i++) {
                if (document.getElementsByName('subgroup_value1')[i].value !== '')
                    document.getElementsByClassName('subgroupvalue1')[i].innerHTML = document.getElementsByName('subgroup_value1')[i].value;

            }
            for (let i = 0; i < 4; i++) {
                if (document.getElementsByName('subgroup_value2')[i].value !== '') {

                    document.getElementsByClassName('subgroupvalue2')[i].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 4].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 8].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 12].innerHTML = name;
                }

            }
            var item = document.getElementsByClassName("product-edit-form-item-error");
            for (let i = 0; i < item.length; i++) {
                item[i].style.display = 'none';
            }

            document.getElementsByClassName('price-button')[0].onclick = function () {
                let price = document.getElementById('price').value;
                let subgroupPrice = document.getElementsByName('subgroup_price');
                for (let i = 0; i < subgroupPrice.length; i++) {

                    subgroupPrice[i].value = price;
                }
            };

            item = document.getElementsByName("subgroup_quantity");
            for (let i = 0; i < item.length; i++) {
                item[i].value = '0';
            }

            document.getElementsByName('subgroup_name1')[0].oninput = function () {
                let name = document.getElementsByName('subgroup_name1')[0].value;
                if (name === '')
                    name = 'Tên';
                document.getElementById('subgroupname1').innerHTML = name;
                if (name === 'Tên')
                    name = 'Nhóm phân loại 1';
                document.getElementsByClassName('label-subgroup1')[0].innerHTML = name;
            };
            document.getElementsByName('subgroup_name2')[0].oninput = function () {
                let name = document.getElementsByName('subgroup_name2')[0].value;
                if (name === '')
                    name = 'Tên';
                document.getElementById('subgroupname2').innerHTML = name;
            };

            for (let i = 0; i < 4; i++) {
                document.getElementsByName('subgroup_value1')[i].oninput = function () {
                    let name = document.getElementsByName('subgroup_value1')[i].value;
                    if (name === '')
                        name = 'Loại';
                    document.getElementsByClassName('subgroupvalue1')[i].innerHTML = name;
                };
            }
            for (let i = 0; i < 4; i++) {
                document.getElementsByName('subgroup_value2')[i].oninput = function () {
                    let name = document.getElementsByName('subgroup_value2')[i].value;
                    if (name === '')
                        name = 'Loại';
                    document.getElementsByClassName('subgroupvalue2')[i].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 4].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 8].innerHTML = name;
                    document.getElementsByClassName('subgroupvalue2')[i + 12].innerHTML = name;
                };
            }
            document.getElementsByClassName('group2')[0].style.display = 'none';
            document.getElementsByName('subgroup_name1')[0].oninput = (e) => {
                if (document.getElementsByName('subgroup_name1')[0].value === '')
                    document.getElementsByClassName('group2')[0].style.display = 'none';
                else
                    document.getElementsByClassName('group2')[0].style.display = 'flex';

                let name = document.getElementsByName('subgroup_name1')[0].value;
                if (name === '')
                    name = 'Tên';
                document.getElementById('subgroupname1').innerHTML = name;
                if (name === 'Tên')
                    name = 'Nhóm phân loại 1';
                document.getElementsByClassName('label-subgroup1')[0].innerHTML = name;

            };

            if (document.getElementsByName('subgroup_name2')[0].value !== '') {
                document.getElementsByClassName('group2')[0].style.display = 'flex';
            }

            var subprice = document.getElementsByName('subgroup_price');
            var subquantity = document.getElementsByName('subgroup_quantity');
            <c:forEach begin="0" end="15" varStatus="loop">
                subprice[${loop.index}].value = '${subPrice[loop.index]}';
                subquantity[${loop.index}].value = '${subQuantity[loop.index]}';
            </c:forEach>
        </script>
    </body>
</html>
