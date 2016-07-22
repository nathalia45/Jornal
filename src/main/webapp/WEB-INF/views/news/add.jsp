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
				
				<form:form action="${s:mvcUrl('NC#add').build()}" method="post" commandName="news" enctype="multipart/form-data">
										
					<form:errors path="title"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="title"/>
					    <label class="mdl-textfield__label" for="title">Título</label>
					</div>					
					
					<form:errors path="subtitle"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="subtitle"/>
					    <label class="mdl-textfield__label" for="title">Subtítulo</label>
					</div>					
					
					<form:errors path="text"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:textarea cssClass="mdl-textfield__input" path="text"></form:textarea>
					    <label class="mdl-textfield__label" for="title">Texto</label>
					</div>
					
					<form:errors path="date"/>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
					    <form:input cssClass="mdl-textfield__input" path="date"/>
					    <label class="mdl-textfield__label" for="title">Data</label>
					</div>	
					
					<form:errors path="section"/>
					<form:select path="section" cssClass="mdl-button mdl-js-button mdl-js-ripple-effect">
						<form:options items="${sections}" itemValue="id" itemLabel="name"/>
					</form:select>
					
					<br/>
					
					<button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--primary" type="submit">Salvar</button>
					
				</form:form>
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>