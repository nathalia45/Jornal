<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QQTC</title>
</head>
<body>

	<h1>QQue Tá Contesseno</h1>
	
	<form:form servletRelativeAction="/login" method="POST">
	
		<div>
			<label>Email</label>
			<input type="text" name="username" />
		</div>
		
		<div>
			<label>Password</label>
			<input type="password" name="password" />
		</div>
		
		<button type="submit">Login</button>
	
	</form:form>

</body>
</html>