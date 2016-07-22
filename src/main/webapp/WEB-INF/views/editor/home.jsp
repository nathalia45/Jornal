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
	
		td {
			white-space: normal;
		}
		
		td div {
			white-space: nowrap;
		}
		
		.table-parent {
			position: relative;
		}
		
		.mdl-button--fab {
			position: absolute;
			top: 26px;
			right: -26px;
		}
				
	</style>

</jsp:attribute>

	<jsp:body>
	
		<div class="mdl-grid mdl-color--grey-200">
			<div class="mdl-cell mdl-cell--1-offset mdl-cell--10-col">
				<h3 class="">Jornaistas</h3>
			</div>
			
			<div class="table-parent mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-grid--no-spacing">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp mdl-cell--12-col">
				  	<thead>
				    	<tr>
				      		<th class="mdl-data-table__cell--non-numeric">Nome</th>
				      		<th class="mdl-data-table__cell--non-numeric">Email</th>
				      		<th class="mdl-data-table__cell--non-numeric">Opções</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${journalists}" var="j">
					    	<tr>
					      		<td class="mdl-data-table__cell--non-numeric">${j.name}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${j.email}</td>
					      		
					      		<td class="mdl-data-table__cell--non-numeric">
					      			<div>
						      			<a href="${s:mvcUrl('EC#deleteJournalist').arg(0, j.id).build()}"
						      				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
						      				<i class="material-icons mdl-color-text--red">delete</i>
						      			</a>
						      		</div>
					      		</td>
					    	</tr>
				    	</c:forEach>
				  	</tbody>
				</table>
				
				<a href="${s:mvcUrl('NC#addForm').build()}"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-button--accent">
					<i class="material-icons">add</i>
				</a>
			</div>
			
			<div class="mdl-cell mdl-cell--1-offset mdl-cell--10-col">
				<h3 class="">Classificados</h3>
			</div>
			
			<div class="table-parent mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-grid--no-spacing">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp mdl-cell--12-col">
				  	<thead>
				    	<tr>
				      		<th class="mdl-data-table__cell--non-numeric">Título</th>
				      		<th class="mdl-data-table__cell--non-numeric">Texto</th>
				      		<th class="mdl-data-table__cell--non-numeric">Preço</th>
				      		<th class="mdl-data-table__cell--non-numeric">Melhor Oferta</th>
				      		<th class="mdl-data-table__cell--non-numeric">Telefone</th>
				      		<th class="mdl-data-table__cell--non-numeric">Autor</th>
				      		<th class="mdl-data-table__cell--non-numeric">Opções</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${classifieds}" var="c">
					    	<tr>
					      		<td class="mdl-data-table__cell--non-numeric">${c.title}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${c.text}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${c.price}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${c.bestOffer}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${c.phoneNumber}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${c.author.name}</td>
					      		<td class="mdl-data-table__cell--non-numeric">
					      			<div>
						      			<a href="${s:mvcUrl('EC#deleteClassified').arg(0, c.id).build()}"
						      				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
						      				<i class="material-icons mdl-color-text--red">delete</i>
						      			</a>
						      		</div>
					      		</td>
					    	</tr>
				    	</c:forEach>
				  	</tbody>
				</table>
				
				<a href="${s:mvcUrl('NC#addForm').build()}"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-button--accent">
					<i class="material-icons">add</i>
				</a>
			</div>
			
			<div class="mdl-cell mdl-cell--1-offset mdl-cell--10-col">
				<h3 class="">Seções</h3>
			</div>
			
			<div class="table-parent mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-grid--no-spacing">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp mdl-cell--12-col">
				  	<thead>
				    	<tr>
				      		<th class="mdl-data-table__cell--non-numeric">Nome</th>
				      		<th class="mdl-data-table__cell--non-numeric">Descrição</th>
				      		<th class="mdl-data-table__cell--non-numeric">Opções</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${sections}" var="s">
					    	<tr>
					      		<td class="mdl-data-table__cell--non-numeric">${s.name}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${s.description}</td>
					      		<td class="mdl-data-table__cell--non-numeric">
					      			<div>
						      			<a href="${s:mvcUrl('EC#deleteSection').arg(0, s.id).build()}"
						      				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
						      				<i class="material-icons mdl-color-text--red">delete</i>
						      			</a>
						      		</div>
					      		</td>
					    	</tr>
				    	</c:forEach>
				  	</tbody>
				</table>
				
				<a href="${s:mvcUrl('NC#addForm').build()}"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-button--accent">
					<i class="material-icons">add</i>
				</a>
			</div>
			
			<div class="mdl-cell mdl-cell--1-offset mdl-cell--10-col">
				<h3 class="">Notícias Cadastradas</h3>
			</div>
			
			<div class="table-parent mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-grid--no-spacing">
				<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp mdl-cell--12-col">
				  	<thead>
				    	<tr>
				      		<th class="mdl-data-table__cell--non-numeric">Título</th>
				      		<th class="mdl-data-table__cell--non-numeric">Subtítulo</th>
				      		<th class="mdl-data-table__cell--non-numeric">Texto</th>
				      		<th class="mdl-data-table__cell--non-numeric">Data</th>
				      		<th class="mdl-data-table__cell--non-numeric">Autor</th>
				      		<th class="mdl-data-table__cell--non-numeric">Seção</th>
				      		<th class="mdl-data-table__cell--non-numeric">Opções</th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<c:forEach items="${news}" var="n">
					    	<tr>
					      		<td class="mdl-data-table__cell--non-numeric">${n.title}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${n.subtitle}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${n.text}</td>
					      		<td class="mdl-data-table__cell--non-numeric">
					      			<fmt:formatDate pattern="dd/MM/yyyy" value="${n.date.time}"></fmt:formatDate>
					      		</td>
					      		<td class="mdl-data-table__cell--non-numeric">${n.author.name}</td>
					      		<td class="mdl-data-table__cell--non-numeric">${n.section.name}</td>
					      		<td class="mdl-data-table__cell--non-numeric">
					      			<div>
						      			<a href="${s:mvcUrl('EC#deleteNews').arg(0, n.id).build()}"
						      				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
						      				<i class="material-icons mdl-color-text--red">delete</i>
						      			</a>
						      		</div>
					      		</td>
					    	</tr>
				    	</c:forEach>
				  	</tbody>
				</table>
			</div>
		</div>
	</jsp:body>

</tags:pageTemplate>