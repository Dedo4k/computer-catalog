<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/fontawesome.css"/>">
    <script src="<c:url value="/js/bootstrap.js"/>"></script>
</head>
<body>

<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form id="login" action="<c:url value="/sign-in"/>" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Sign in</h3>

                            <c:if test="${param['error'] != null}">
                                <h3 class="mb-5" style="color: #b02a37">Wrong login or password</h3>
                            </c:if>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="email" id="typeEmailX-2" class="form-control form-control-lg"
                                           name="email" placeholder="Email"/>
                                </label>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="password" id="typePasswordX-2" class="form-control form-control-lg"
                                           name="password" placeholder="Password"/>
                                </label>
                            </div>
                        </form>

                        <button form="login" class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

                        <hr class="my-4">

                        <a href="<c:url value="/sign-up"/>">
                            <input type="button" class="btn btn-primary btn-lg btn-block" value="Sign up">
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
