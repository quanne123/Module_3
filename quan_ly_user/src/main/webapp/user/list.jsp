<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/14/2023
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<center>
    <h1>User Management</h1>
    <form class="d-flex" action="/users?action=search" method="post">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="name" name="name">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    <h2>
        <a href="/users?action=create">Add new User</a>
    </h2>
</center>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Country</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td> <a href="/users?action=edit&id=${user.getId()}">Edit</a> </td>
            <td> <a href="/users?action=delete&id=${user.getId()}">Delete</a> </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
