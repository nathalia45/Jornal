<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate title="QQTáContesseno">

<jsp:attribute name="styles">

	<style>
		
		.mdl-card {
			padding: 48px;
		}
		
	</style>

</jsp:attribute>

	<jsp:body>
	
		<div class="mdl-grid mdl-color--grey-200">
			<div class="mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-card mdl-color--white mdl-shadow--2dp">
				<h3>Últimas notícias</h3>
				
				<security:authorize access="isAuthenticated()">
					<span>Usuário logado: <security:authentication property="principal.username"/> </span> <br/>
				</security:authorize>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/jornalNathalia/product/addForm">Adicionar Produto</a> <br/>
				</security:authorize>
				
				<a href="/jornalNathalia/product/list">Listar Produtos</a>
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>