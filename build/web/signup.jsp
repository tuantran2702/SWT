

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Đăng Ký</title>
        <link rel="stylesheet" href="css/base.css" />
        <link rel="stylesheet" href="css/signup.css" />
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
                        <div class="">Đăng ký</div>

                    </div>
                    <a href="#" target="_blank" rel="noopener noreferrer" class="header__navbar-help">Bạn
                        cần giúp đỡ?</a>
                </div>
            </div>

            <div class="form-wrapper">
                <form action="signup" method="post">
                    <div class="form__header">
                        Đăng ký
                    </div>

                    <div class="form__body">
                        <div class="input-text-container">
                            <div class="input-text-wrapper">
                                <input class="input-text" type="username" placeholder="Tên đăng nhập" autocomplete="on" name="username"
                                       value="${username}">

                            </div>
                            <div class="notify-bellow">
                                <c:if test="${username != null}">Tên đăng nhập đã tồn tại</c:if>
                                </div>
                            </div>

                            <div class="input-text-container">
                                <div class="input-text-wrapper">
                                    <input id="password" class="input-text" type="password" placeholder="Mật khẩu" autocomplete="off" name="password"
                                           value="">

                                </div>
                                <div class="notify-bellow">

                                </div>
                            </div>

                            <div class="input-text-container">
                                <div class="input-text-wrapper">
                                    <input id="confirmPassword" class="input-text" type="password" placeholder="Nhập lại mật khẩu"
                                           autocomplete="off"
                                           name="cfpassword" value="">
                                </div>
                                <div class="notify-bellow">

                                </div>
                            </div>

                            <button class="button button--signup">
                                Đăng ký
                            </button>
                            <div class="g-recaptcha" data-sitekey="6LdilFUgAAAAAIDvliQB0d8M71hK-CbAtVQWi8Ih"></div>
                            <div class="notify-bellow" style="margin-left: 16px;"></div>
                            <input type="hidden" name="captcha-response">
                            <div class="redirect-login">Bạn đã có tài khoản? <a class="login-link"
                                                                                href="login">Đăng nhập</a></div>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                //        window.onload = function() {
                //            document.getElementById('g-recaptcha-response').required = true;
                //        };


                var notifyBelows = document.getElementsByClassName('notify-bellow');
                var usernameRegex = /^[a-zA-Z0-9]{4,16}$/;
                var passwordRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
                document.querySelector('form[action="signup"]').onsubmit = (e) => {
                    document.getElementsByName('captcha-response')[0].value = document.getElementById('g-recaptcha-response').value;
                    if (document.getElementById('g-recaptcha-response').value === '') {
                        notifyBelows[3].innerHTML = 'Điền vào captcha';
                        e.preventDefault();
                    } else
                        notifyBelows[3].innerHTML = '';






                    if (document.getElementsByName('username')[0].value === '') {
                        notifyBelows[0].innerHTML = 'Không được để trống';
                        e.preventDefault();
                    } else {
                        if (!usernameRegex.test(document.getElementsByName('username')[0].value)) {
                            notifyBelows[0].innerHTML = 'Tên đăng nhập ít nhất 4 kí tự bao gồm chữ cái và chữ số';
                            e.preventDefault();
                        } else {
                            notifyBelows[0].innerHTML = '';
                        }
                    }



                    if (document.getElementsByName('password')[0].value === '') {
                        notifyBelows[1].innerHTML = 'Không được để trống';
                        e.preventDefault();
                    } else {
                        if (!passwordRegex.test(document.getElementsByName('password')[0].value)) {
                            notifyBelows[1].innerHTML = 'Mật khẩu chứa ít nhất 8 kí tự bao gồm kí tự in thường, in hoa, chữ số và kí tự đặc biệt';
                            e.preventDefault();
                        } else
                            notifyBelows[1].innerHTML = '';
                    }
                    if (document.getElementById('confirmPassword').value === '') {
                        notifyBelows[2].innerHTML = 'Không được để trống';
                        e.preventDefault();
                    } else {
                        if (document.getElementsByName('password')[0].value !== document.getElementById('confirmPassword').value) {
                            notifyBelows[2].innerHTML = 'Mật khẩu nhập lại không đúng';
                            e.preventDefault();
                        } else
                            notifyBelows[2].innerHTML = '';
                    }
                };

                function checkExist(username) {
                    let check = false;
            <c:forEach var="user" items="${userList}">
                    if ('${user.getUsername()}' === username)
                        check = true;
            </c:forEach>
                    return check;
                }
        </script>


    </body>

</html>