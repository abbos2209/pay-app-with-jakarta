<%--
  Created by IntelliJ IDEA.
  User: 99890
  Date: 09.08.2024
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Login V3</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/views/login/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/views/login/css/util.css">
    <link rel="stylesheet" type="text/css" href="/views/login/css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <c:if test="${has_error}">
            <h1 style="color: red"><c:out value="${message}"/></h1>
        </c:if>
            <div id="form_div"></div>

        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>
<script>
    window.addEventListener('load', changePath);
    var page = ${state};

    function changePath() {
        let elementById = document.getElementById("form_div");
        if (page) {
            elementById.innerHTML =
               ` <form action="/auth/sign-up" method="post">
                <div class="limiter">
        <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
            <div class="wrap-login100">
               	<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

                    <span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>
<div class="wrap-input100 validate-input" data-validate = "Enter name">
                        <input class="input100" type="text" name="name" placeholder="name">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>
<div class="wrap-input100 validate-input" data-validate = "Enter surname">
                        <input class="input100" type="text" name="surname" placeholder="surname">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Enter number">
                        <input class="input100" type="number" name="number" placeholder="phone number">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <input class="input100" type="password" name="password" placeholder="password">
                        <span class="focus-input100" data-placeholder="&#xf191;"></span>
                    </div>



                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn">
                            Login
                        </button>
                    </div>

                    <div class="text-center p-t-90">
                        <a class="txt1" href="#">
                            Forgot Password?
                        </a>
                    </div>
 <div class="text-center p-t-136">
                    <button onclick="changePath()">
                        <div>go to sign up</div>
                    </button>
                </div>


            </div>
        </div>
    </div>`


        } else {
            elementById.innerHTML = `
<form action="/auth/sign-in" method="post">
                <div class="limiter">
        <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
            <div class="wrap-login100">

					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

                    <span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

                    <div class="wrap-input100 validate-input" data-validate = "Enter username">
                        <input class="input100" type="number" name="number" placeholder="phone number">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <input class="input100" type="password" name="password" placeholder="password">
                        <span class="focus-input100" data-placeholder="&#xf191;"></span>
                    </div>



                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn">
                            Login
                        </button>
                    </div>

                    <div class="text-center p-t-90">
                        <a class="txt1" href="#">
                            Forgot Password?
                        </a>
                    </div>
 <div class="text-center p-t-136">
                    <button onclick="changePath()">
                        <div>go to sign up</div>
                    </button>
                </div>

            </div>
        </div>
    </div> </form>
`
        }
        page = !page;
    }
</script>

<!--===============================================================================================-->
<script src="/views/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/views/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/views/login/vendor/bootstrap/js/popper.js"></script>
<script src="/views/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/views/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="/views/login/vendor/daterangepicker/moment.min.js"></script>
<script src="/views/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="/views/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="/views/login/js/main.js"></script>

</body>
</html>
