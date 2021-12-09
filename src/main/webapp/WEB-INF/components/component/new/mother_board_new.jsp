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
            <div class="col-12">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form id="add-component" action="<c:url value="/admin/mother_board/new"/>" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Add new motherboard</h3>

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
                                           placeholder="motherboard producer" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputModel" class="col-sm-3 col-form-label">
                                    <spring:message code="label.component.model"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="model" id="inputModel"
                                           placeholder="motherboard model" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCore" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.pciversion"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="PCIVersion" id="inputCore"
                                           placeholder="motherboard PCI version" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCoreNum" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.socket"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="socket" id="inputCoreNum"
                                           placeholder="motherboard socket" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputSocket" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.chipset"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="chipset" id="inputSocket"
                                           placeholder="motherboard chipset" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCrystalName" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.formfactor"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="formFactor" id="inputCrystalName"
                                           placeholder="motherboard form-factor" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputThermalPower" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.memorytype"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="memoryType" id="inputThermalPower"
                                           placeholder="motherboard memory type" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMinFreq" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.memoryslots"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="memorySlots" id="inputMinFreq"
                                           placeholder="motherboard memory slots number" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMaxFreq" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.mtwo"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="mTwo" id="inputMaxFreq"
                                           placeholder="motherboard M.2" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMaxFreq1" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.width"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="width" id="inputMaxFreq1"
                                           placeholder="motherboard width" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputMaxFreq2" class="col-sm-3 col-form-label">
                                    <spring:message code="label.motherboard.length"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="length" id="inputMaxFreq2"
                                           placeholder="motherboard length" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPrice" class="col-sm-3 col-form-label">Price</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="price" id="inputPrice"
                                           placeholder="motherboard price" step="any" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="formFileSm" class="form-label"></label>
                                <input class="form-control form-control-sm" name="imageFile" id="formFileSm"
                                       type="file">
                            </div>

                        </form>

                        <button form="add-component" class="btn btn-primary btn-lg btn-block" type="submit">Add</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
