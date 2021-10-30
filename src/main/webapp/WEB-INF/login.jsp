<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
</head>
<body>
<form id="sign-in" action="<c:url value="/sign-in"/>" method="post">
    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
    <label>
        <input type="email" name="email" placeholder="Email">
    </label>
    <label>
        <input type="password" name="password" placeholder="Password">
    </label>
</form>
<div>
    <input type="submit" form="sign-in" value="Sign in">
    <a href="<c:url value="/sign-up"/>">
        <input type="button" value="Sign up">
    </a>
</div>
</body>
</html>
