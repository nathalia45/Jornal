<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate title="QQTáContesseno">

<jsp:attribute name="styles">

	<style>
		
		p {
			text-align: justify;
		}
		
		.float-right {
			float: right;
			text-align: right;
		}
		
		.new-card {
			padding: 48px;
		}
		
		a {
			text-decoration: none;
		}
		
		form {
			padding: 48px;
		}
		
		ul {
			padding: 32px !important;
		}
		
	</style>

</jsp:attribute>

	<jsp:body>
	
		<div class="mdl-grid mdl-color--grey-200">
			<div class="mdl-grid mdl-cell mdl-cell--8-col mdl-cell--2-offset">
				<div class="new-card mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
					<h3 class="mdl-cell mdl-cell--12-col">${classified.title} <div class="float-right mdl-color-text--accent">${classified.price}</div></h3>
					<p class="mdl-cell mdl-cell--12-col">${classified.text}</p>
					
					<p class="mdl-cell mdl-cell--12-col">Contato: ${classified.phoneNumber}</p>
					<p class="mdl-cell mdl-cell--12-col">
						Melhor oferta: <span class="mdl-color-text--accent">${classified.bestOffer}</span> 
					</p>
					<p class="mdl-cell mdl-cell--12-col">
						Melhor oferta feita em <fmt:formatDate pattern="dd/MM/yyyy" value="${classified.bestOfferDate.time}"></fmt:formatDate> 
						por ${classified.author.name}
					</p>
					
					<form action="${s:mvcUrl('CC#addOffer').arg(1, classified.id).build()}" method="post">
										
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell--12-col">
				    		<input class="mdl-textfield__input" type="text" name="bestOffer"/>
						    <label class="mdl-textfield__label" for="title">Oferta</label>
						</div>
						
						<button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--primary" type="submit">Fazer Oferta</button>
						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						
					</form>	
					
				</div>
				
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>