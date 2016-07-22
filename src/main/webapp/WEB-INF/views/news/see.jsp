<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
					
					<c:forEach items="${sections}" var="sec">
					
						<div class="mdl-cell mdl-cell--6-col mdl-card mdl-color--white mdl-shadow--2dp">
						  	<div class="mdl-card__title mdl-card--expand">
						    	<h2 class="mdl-card__title-text">${sec.name}</h2>
						  	</div>
						  	<div class="mdl-card__supporting-text">
							    ${sec.description}
						  	</div>
						  	<div class="mdl-card__actions mdl-card--border">
						    	<a href="${s:mvcUrl('NC#listBySection').arg(0, sec.id).build()}" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
						      		Ver Notícias
						    	</a>
						  	</div>
						</div>
						
					</c:forEach>
				</div>
				
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>