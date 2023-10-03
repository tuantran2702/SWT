<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quên mật khẩu</title>
        <link rel="stylesheet" href="css/base.css" />
        <link rel="stylesheet" href="css/forgetpassword.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>

    <body>
        <div id="main">
            <div class="header">
                <div class="header__navbar">
                    <div class="header__navbar-logo">
                        <a class="mido-svg-logo" href="http://localhost:8080/mido">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 389.26 318.9">
                            <path
                                d="M384.32,72.29,337.53,54.71l-6.95,11.53V264.15l6.95,12.13,46.79-13.51,4.94-13.12V85.85Zm-14,152.7h0a9.11,9.11,0,0,1-6.94,5.5h0a9.12,9.12,0,0,1-9.64-4.92h0a29.72,29.72,0,0,1-3.15-13.32V118.93a24.75,24.75,0,0,1,2.82-11.47h0a9.12,9.12,0,0,1,10.31-4.62l.15,0a9.16,9.16,0,0,1,6.25,5.46h0a52.47,52.47,0,0,1,3.77,19.52v79.29A46.57,46.57,0,0,1,370.34,225Z"
                                style="fill:#ffaf00;fill-rule:evenodd" />
                            <polygon
                                points="0 71.64 0 263.63 21.99 269.99 21.99 127.96 54.67 193.83 95.03 115.73 95.03 291.12 134.85 302.64 134.85 21.07 95.03 36 54.67 122.48 21.99 63.4 0 71.64"
                                style="fill:rgb(238, 78, 46);fill-rule:evenodd" />
                            <polygon points="140.58 18.92 140.58 304.3 191.03 318.9 191.03 0 140.58 18.92"
                                     style="fill:rgb(238, 78, 46);fill-rule:evenodd" />
                            <path
                                d="M316.09,46.91,191,0V318.9l125.06-36.18,7.54-16.61v-202ZM288.42,216.55h0a24.9,24.9,0,0,1-18.9,12.95l-28,3.46V90.27l29.21,6.1a24.9,24.9,0,0,1,17.06,13l.88,1.72a24.94,24.94,0,0,1,2.73,11.33v82.36A24.89,24.89,0,0,1,288.42,216.55Z"
                                style="fill:#ffaf00;fill-rule:evenodd" />
                            </svg>
                        </a>
                        <div class="">Đặt lại mật khẩu</div>


                    </div>
                    <a href="#" target="_blank" rel="noopener noreferrer" class="header__navbar-help">Bạn
                        cần giúp đỡ?</a>
                </div>
            </div>

            <div>
                <div class="form-wrapper">
                    <form id="forget-form" action="forgetpassword" method="post">
                        <div class="form-header">
                            <c:if test="${step==1}">
                                <div class="form-header__text">Đặt lại mật khẩu</div>
                            </c:if>
                            <c:if test="${step==2}">
                                <div class="form-header__text">Nhập mã xác minh</div>
                            </c:if>
                            <c:if test="${step==3}">
                                <div class="form-header__text">Nhập mật khẩu mới</div>
                            </c:if>

                        </div>
                        <div class="form-body">
                            <div class="input-text-container">
                                <div class="input-text-wrapper">

                                    <c:if test="${step==1}">
                                        <input class="input-text" type="email" placeholder="Email"
                                               autocomplete="on" name="email" required value="">
                                    </c:if>
                                    <c:if test="${step==2}">
                                        <input class="input-text" type="text" placeholder="Mã xác minh"
                                               autocomplete="on" name="otp" required value="">
                                    </c:if>
                                    <c:if test="${step==3}">
                                        <input class="input-text" type="password" placeholder="Mật khẩu mới"
                                               autocomplete="on" name="password" required value="">
                                    </c:if>      
                                </div>
                                <div class="notify-bellow"></div>
                            </div>
                            <button class="button button--next">
                                Tiếp theo
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="footer">

            </div>
        </div>

        <script>
            var passwordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
            let step = ${step};
            if (step === 1) {
                document.getElementsByName('email')[0].value = '${email}';
                if('${email}' !== '')
                    document.getElementsByClassName('notify-bellow')[0].innerHTML = 'Email này không tồn tại';
            } else if (step === 2) {
                document.getElementsByName('otp')[0].value = '${otp}';
                if(document.getElementsByName('otp')[0].value !== '')
                    document.getElementsByClassName('notify-bellow')[0].innerHTML = 'OTP không chính xác';
            } else {
                document.getElementsByName('password')[0].value = '${password}';
            }

            document.getElementById('forget-form').onsubmit = (e) => {
                if (step === 3) {
                    if(!passwordRegex.test(document.getElementsByName('password')[0].value)) {
                        document.getElementsByClassName('notify-bellow')[0].innerHTML = 'Mật khẩu chứa ít nhất 8 kí tự bao gồm kí tự in thường, in hoa, chữ số và kí tự đặc biệt';
                        e.preventDefault();
                    }
                }
            };

            
        </script>
    </body>

</html>