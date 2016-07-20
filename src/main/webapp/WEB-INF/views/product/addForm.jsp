<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>QQTC</title>

</head>
<body>

	<form:form action="${s:mvcUrl('PC#add').build()}" method="post" commandName="product" enctype="multipart/form-data">
		<div>
			<label>Product Name</label>
			<form:errors path="name" />
			<form:input path="name" />
		</div>
		
		<c:forEach items="${types}" var="type" varStatus="status">
			<div>
				<label>${type}</label>
				<form:input path="prices[${status.index}].value" />
				<form:input type="hidden" path="prices[${status.index}].type" value="${type}" />
			</div>
		</c:forEach>
		
		<div>
			<label>Description</label>
			<form:errors path="description" />
			<form:textarea rows="10" cols="20" path="description" ></form:textarea>
		</div>
		
		<div>
			<label>Date</label>
			<form:errors path="date" />
			<form:input path="date" />
		</div>
		
		<div>
			<label>Image</label>
			<form:errors path="image" />
			<input name="image" type="file"/>
		</div>
		
		<button type="submit">Send</button>
	</form:form>

</body>
</html>