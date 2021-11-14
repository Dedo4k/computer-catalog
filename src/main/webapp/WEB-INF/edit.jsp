<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Sign up</title>
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
                        <form id="sign-up" action="/user/${user.id}/edit" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Edit user</h3>

                            <div class="errors mb-5">
                                <c:if test="${error != null}">
                                    <h5 class="mb-2" style="color: #b02a37">${error}</h5>
                                </c:if>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="text" id="typeTextX-2"
                                                class="form-control form-control-lg"
                                                name="firstName" placeholder="First name" value="${user.firstName}"/>
                                </label>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="text" id="typeTextX-3"
                                                class="form-control form-control-lg"
                                                name="lastName" placeholder="Last name" value="${user.lastName}"/>
                                </label>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="email" id="typeEmailX-2"
                                                class="form-control form-control-lg"
                                                name="email" placeholder="Email" value="${user.email}"/>
                                </label>
                            </div>

                        </form>

                        <button form="sign-up" class="btn btn-primary btn-lg btn-block" type="submit">Edit</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
