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
				<a class="mdl-cell mdl-cell--8-col" href="${s:mvcUrl('NC#listBySection').arg(0, news.section.id).build()}"><h4 class="">${news.section.name}</h4></a>
				<div class="mdl-cell mdl-cell--4-col float-right">
					<h4><fmt:formatDate pattern="dd/MM/yyyy" value="${news.date.time}"></fmt:formatDate></h4>
				</div>
				
				<div class="new-card mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
					<h3 class="mdl-cell mdl-cell--12-col">${news.title}</h3>
					<h4 class="mdl-cell mdl-cell--12-col">${news.subtitle}</h4>
					<h6 class="mdl-cell mdl-cell--12-col float-right">${news.author.name}</h6>
					<p class="mdl-cell mdl-cell--12-col">${news.text}</p>
					
				</div>
				
				<div class="coments mdl-cell mdl-cell--12-col mdl-shadow--2dp mdl-color--white">
					<form:form action="${s:mvcUrl('NC#addComment').arg(0, news.id).build()}" method="post" commandName="comment">
					  <div class="mdl-textfield mdl-js-textfield">
					    <form:textarea cssClass="mdl-textfield__input" path="text" rows= "3" ></form:textarea>
					    <label class="mdl-textfield__label" for="text">Escreva um comentário...</label>
					  </div>
					  <br/>
					  <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--primary" type="submit">Adicionar Comentário</button>
					</form:form>
					
					<ul class="mdl-list ">
						<c:forEach items="${comments}" var="c">
						  	<li class="mdl-list__item mdl-list__item--three-line">
						    	<span class="mdl-list__item-primary-content">
						      		<i class="material-icons mdl-list__item-avatar">person</i>
						      	<span>${c.author.name}</span>
						      	<span class="mdl-list__item-text-body">
							        ${c.text}
						      	</span>
						    	</span>
						  	</li>
					  	</c:forEach>
					</ul>
				</div>
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>