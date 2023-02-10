<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/10/2023
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh Sách Khách Hàng</title>
</head>
<body>
<h1 style="text-align: center">Danh sách khách Hàng</h1>
<link rel="stylesheet" href="css/bootstrap.min.css">
<table class="table table-bordered table-striped table-success">
  <tr>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th> Địa chỉ</th>
    <th> Ảnh</th>
  </tr>
  <c:forEach var="customer" items="${customerList}">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.date}</td>
      <td>${customer.address}</td>
      <td> <img src="${customer.img}" style="height: 100px"; width="100px"></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
