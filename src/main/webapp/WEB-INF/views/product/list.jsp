<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QQTC</title>

</head>
<body>

	<c:forEach items="${messages}" var="msg">
		<span>${msg.text}</span>
	</c:forEach>

	<table>
		<thead>
			<tr>
				<th>Title</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="product">
				<tr>
					<td> <a href="${s:mvcUrl('PC#see').arg(0, product.id).build()}">${product.name}</a> </td>
					<td>${product.description}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${product.date.time}"></fmt:formatDate></td>
					<td>
						<c:forEach items="${product.prices}" var="price">
							<span>${price.type}: <strong>${price.value}</strong></span> <br/>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>