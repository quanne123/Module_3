<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/13/2023
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product details</h1>
<p>
  <a href="/product">Back to product list</a>
</p>
<table>
  <tr>
    <td>Name :</td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Price :</td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Description :</td>
    <td>${requestScope["product"].getDescription()}</td>
  </tr>
  <tr>
    <td>Producer :</td>
    <td>${requestScope["product"].getProducer()}</td>
  </tr>
</table>
</body>
</html>
