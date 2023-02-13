<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/13/2023
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1> Products</h1>
<p>
  <a href="product?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Producer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${product}" var="product">
        <tr>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td> <a href="/product?action=edit&id=${product.getId()}">edit</a> </td>
            <td> <a href="/product?action=delete&id=${product.getId()}">delete</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
