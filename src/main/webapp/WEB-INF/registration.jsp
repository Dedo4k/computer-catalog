<%--
  Created by IntelliJ IDEA.
  User: Vlad Lailo
  Date: 28.10.2021
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registraion</title>
</head>
<body>
<form id="registration" action="/registration" method="post">
    <label>
        <input type="text" name="username" placeholder="username">
    </label>
    <label>
        <input type="text" name="first_name" placeholder="first name">
    </label>
    <label>
        <input type="text" name="last_name" placeholder="last name">
    </label>
    <label>
        <input type="password" name="password" placeholder="password">
    </label>
</form>
<div>
    <input type="submit" form="registration" value="Create">
</div>
</body>
</html>
