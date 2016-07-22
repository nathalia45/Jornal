<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate title="QQTáContesseno">

<jsp:attribute name="styles">

	<style>
		
	</style>

</jsp:attribute>

	<jsp:body>
	
		<div class="mdl-grid mdl-color--grey-200">
			<div class="mdl-grid mdl-cell mdl-cell--8-col mdl-cell--2-offset">
				<h3 class="mdl-cell mdl-cell--12-col">${section.name}</h3>
				<h4 class="mdl-cell mdl-cell--12-col">${section.description}</h4>
				
				<c:forEach items="${news}" var="n">
				
					<div class="mdl-cell mdl-cell--6-col mdl-card mdl-color--white mdl-shadow--2dp">
					  	<div class="mdl-card__title mdl-card--expand">
					    	<h2 class="mdl-card__title-text">${n.title}</h2>
					  	</div>
					  	<div class="mdl-card__supporting-text">
						    ${n.subtitle}
					  	</div>
					  	<div class="mdl-card__actions mdl-card--border">
					    	<a href="${s:mvcUrl('NC#see').arg(0, n.id).build()}" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
					      		Ver Notícia
					    	</a>
					  	</div>
					</div>
					
				</c:forEach>
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>