<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit</title>
</head>
<body>
<jsp:include page="header.jsp" />
<c:choose>
	<c:when test="${coronaKits==null || coronaKits.isEmpty() }">
	<p>Empty Cart... Please add items to your cart and proceed</p>
	</c:when>
	<c:otherwise>
	<table border="3" cellspacing="7px" cellpadding="8px">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Description</th>
		<th>Cost</th>
		<th>Actions</th>
	</tr>
	<c:forEach items="${coronaKits}" var="coronaKit">
	<tr>
	<td>${coronaKit.id}</td>
	<td>${coronaKit.name}</td>
	<td>${coronaKit.description}</td>
	<td>${coronaKit.cost}</td>
	<td>
		<a href="deleteItem?id=${coronaKit.id}">Delete</a>
		<span>  </span>
		<a href="editItem?id=${coronaKit.id}">Edit</a>
	</td>
	</tr>
	</c:forEach>
	</table>
	</c:otherwise>
</c:choose>
</body>
</html>