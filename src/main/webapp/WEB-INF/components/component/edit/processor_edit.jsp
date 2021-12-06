<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>VVAA (ADMIN)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/bootstrap.css"/>">
    <script src="<c:url value="/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/js/script.js"/>"></script>
</head>
<body style="background-color: #508bfc;">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/main"/>">VVAA (ADMIN)</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/main"/>"><spring:message
                        code="label.page.home"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/catalog"/>"><spring:message
                        code="label.page.catalog"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/config"/>"><spring:message
                        code="label.page.config"/></a></li>
                <li class="nav-item dropdown" id="myDropdown1">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                       style="float: right"><spring:message code="label.lang"/></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value="?lang=en"/>"><spring:message
                                code="label.lang.en"/></a></li>
                        <li><a class="dropdown-item" href="<c:url value="?lang=ru"/>"><spring:message
                                code="label.lang.ru"/></a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" id="myDropdown">
                    <sec:authorize access="isAuthenticated()">
                        <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                           style="float: right"><sec:authentication property="principal.firstName"/> <sec:authentication
                                property="principal.lastName"/></a>
                        <ul class="dropdown-menu">
                            <sec:authentication property="principal.id" var="user_id"/>
                            <li><a class="dropdown-item" href="<c:url value="/user/${user_id}"/>"><spring:message
                                    code="label.page.account"/></a></li>
                            <sec:authorize access="hasAuthority('ADMIN')">
                                <li><a class="dropdown-item" href="<c:url value="/admin"/>"><spring:message
                                        code="label.page.settings"/></a></li>
                            </sec:authorize>
                            <li>
                                <form action="<c:url value="/logout"/>" method="post">
                                    <a class="dropdown-item" href="<c:url value="/logout"/>"><spring:message
                                            code="label.auth.signout"/></a>
                                </form>
                            </li>
                        </ul>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                           style="float: right"><spring:message code="label.page.profile"/></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<c:url value="/sign-in"/>"><spring:message
                                    code="label.auth.signin"/></a></li>
                            <li><a class="dropdown-item" href="<c:url value="/sign-up"/>"><spring:message
                                    code="label.auth.signup"/></a></li>
                        </ul>
                    </sec:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form id="add-component" action="<c:url value="/admin/processor/${processor.id}/edit"/>"
                              method="post" enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Edit processor</h3>

                            <div class="errors mb-5">
                                <c:if test="${error != null}">
                                    <h5 class="mb-2" style="color: #b02a37">${error}</h5>
                                </c:if>
                            </div>

                            <div class="mb-3 row">
                                <label for="inputProducer" class="col-sm-3 col-form-label">
                                    <spring:message code="label.component.producer"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="producer" id="inputProducer"
                                           placeholder="processor producer" value="${processor.producer}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputModel" class="col-sm-3 col-form-label">
                                    <spring:message code="label.component.model"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="model" id="inputModel"
                                           placeholder="processor model" value="${processor.model}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCore" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.core"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="core" id="inputCore"
                                           placeholder="processor core" value="${processor.core}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCoreNum" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.corenum"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="coreNumber" id="inputCoreNum"
                                           placeholder="processor core number" value="${processor.coreNumber}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputSocket" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.socket"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="socket" id="inputSocket"
                                           placeholder="processor socket" value="${processor.socket}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCrystalName" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.crystalname"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="crystalName" id="inputCrystalName"
                                           placeholder="processor crystal name" value="${processor.crystalName}"
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputThermalPower" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.thermalpower"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="thermalPower" id="inputThermalPower"
                                           placeholder="processor thermal power" step="any" value="${processor.thermalPower}"
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMinFreq" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.minfreq"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="minFreq" id="inputMinFreq"
                                           placeholder="processor min frequency" step="any" value="${processor.minFreq}"
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMaxFreq" class="col-sm-3 col-form-label">
                                    <spring:message code="label.processor.maxfreq"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="maxFreq" id="inputMaxFreq"
                                           placeholder="processor max frequency" step="any" value="${processor.maxFreq}"
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPrice" class="col-sm-3 col-form-label">Price</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="price" id="inputPrice"
                                           placeholder="processor price" step="any" value="${processor.price}" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="formFileSm" class="form-label"></label>
                                <input class="form-control form-control-sm" name="imageFile" id="formFileSm"
                                       type="file">
                            </div>

                        </form>

                        <button form="add-component" class="btn btn-primary btn-lg btn-block" type="submit">Edit
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
