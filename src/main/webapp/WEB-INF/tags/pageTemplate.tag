<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ attribute name="title" required="false" %>
<%@ attribute name="styles" fragment="true" %>
<%@ attribute name="scripts" fragment="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>QQTC</title>
		
		<c:url value="/resources/css" var="cssPath"/>
		<link rel="stylesheet" type="text/css" href="${cssPath}/material.min.css">
		<link rel="stylesheet" type="text/css" href="${cssPath}/font/roboto.css">
		<link rel="stylesheet" type="text/css" href="${cssPath}/font/material-icons.css">
		<jsp:invoke fragment="styles"/>
		
	</head>
	
	<body>
	
		<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
			<header class="mdl-layout__header">
		    	<div class="mdl-layout__header-row">
		      
			      	<span class="mdl-layout-title">${title}</span>
			      
			      	<div class="mdl-layout-spacer"></div>
			      
					<nav class="mdl-navigation mdl-layout--large-screen-only">
						<a class="mdl-navigation__link" href="">Link</a>
						<a class="mdl-navigation__link" href="">Link</a>
						<a class="mdl-navigation__link" href="">Link</a>
						<a class="mdl-navigation__link" href="">Link</a>
					</nav>
					
					<security:authorize access="isAuthenticated()" var="isAuth"/>
					
					<c:choose>
					    <c:when test="${isAuth}">
					        <a href="<c:url value='/logout'/>" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--white">
								sair
							</a>
					    </c:when>    
					    <c:otherwise>
					        <a href="<c:url value='/login'/>" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--white">
								login
							</a>
					    </c:otherwise>
					</c:choose>
					
		    	</div>
		  </header>
		  <div class="mdl-layout__drawer">
		  		<span class="mdl-layout-title">Title</span>
				<nav class="mdl-navigation">
			  		<a class="mdl-navigation__link" href="">Link</a>
				  	<a class="mdl-navigation__link" href="">Link</a>
				  	<a class="mdl-navigation__link" href="">Link</a>
				  	<a class="mdl-navigation__link" href="">Link</a>
				</nav>
		  </div>
		  <main class="mdl-layout__content">
		  		<jsp:doBody></jsp:doBody>
		  </main>
		</div>
		
		<c:url value="/resources/js" var="jsPath"/>
		<script type="text/javascript" src="${jsPath}/material.min.js"></script>
		<jsp:invoke fragment="scripts"/>
	
	</body>
	
</html>