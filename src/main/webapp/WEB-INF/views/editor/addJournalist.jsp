<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate title="QQTáContesseno">

<jsp:attribute name="styles">

	<style>
		
		.div-form {
			padding: 48px;
		}
		
		button {
			
			float: right;
		
		}
		
	</style>

</jsp:attribute>

	<jsp:body>
	
		<div class="mdl-grid mdl-color--grey-200">
			<div class="div-form mdl-grid--no-spacing mdl-cell mdl-cell--8-col mdl-cell--2-offset mdl-card mdl-shadow--2dp">
				<h3 class="mdl-cell--12-col mdl-layout-title">Adicionar Notícia</h3>
				
				<form:form action="${s:mvcUrl('EC#addJournalist').build()}" method="post" commandName="user" enctype="multipart/form-data">
										
					<form:errors path="name"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="name"/>
					    <label class="mdl-textfield__label" for="name">Nome</label>
					</div>					
					
					<form:errors path="email"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="email"/>
					    <label class="mdl-textfield__label" for="email">Email</label>
					</div>					

					<form:errors path="password"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="password"/>
					    <label class="mdl-textfield__label" for="password">Senha</label>
					</div>	
										
					<button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--primary" type="submit">Salvar</button>
					
				</form:form>
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>