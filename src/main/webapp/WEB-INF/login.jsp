<%--
  Created by IntelliJ IDEA.
  User: Vlad Lailo
  Date: 28.10.2021
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form id="login" action="/login" method="post">
    <label>
        <input type="text" name="username" placeholder="username">
    </label>
    <label>
        <input type="password" name="password" placeholder="password">
    </label>
</form>
<buttons>
    <input type="submit" form="login" value="Login">
    <a href="/registration">
        <input type="button" value="Registration">
    </a>
</buttons>
</body>
</html>
