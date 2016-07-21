<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QQTC</title>
</head>
<body>

	<h1>QQue Tá Contesseno</h1>
	
	<security:authorize access="isAuthenticated()">
		<span>Usuário logado: <security:authentication property="principal.username"/> </span> <br/>
	</security:authorize>
	
	<security:authorize access="hasRole('ROLE_ADMIN')">
		<a href="/jornalNathalia/product/addForm">Adicionar Produto</a> <br/>
	</security:authorize>
	
	<a href="/jornalNathalia/product/list">Listar Produtos</a>

</body>
</html>