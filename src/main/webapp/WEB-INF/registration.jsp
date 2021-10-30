<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up</title>
</head>
<body>
<form id="sign-up" action="<c:url value="/sign-up"/>" method="post">
    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
    <label>
        <input type="text" name="firstName" placeholder="First name">
    </label>
    <label>
        <input type="text" name="lastName" placeholder="Last name">
    </label>
    <label>
        <input type="email" name="email" placeholder="Email">
    </label>
    <label>
        <input type="password" name="password" placeholder="password">
    </label>
</form>
<div>
    <input type="submit" form="sign-up" value="Sign up">
</div>
</body>
</html>
