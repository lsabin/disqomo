
<%@ page import="com.disqomo.model.Disco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disco.label', default: 'Disco')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-disco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-disco" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="artista" title="${message(code: 'disco.artista.label', default: 'Artista')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'disco.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="imagen" title="${message(code: 'disco.imagen.label', default: 'Imagen')}" />
					
						<g:sortableColumn property="imagenThumb" title="${message(code: 'disco.imagenThumb.label', default: 'Imagen Thumb')}" />
					
						<g:sortableColumn property="prettyUrl" title="${message(code: 'disco.prettyUrl.label', default: 'Pretty Url')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'disco.titulo.label', default: 'Titulo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${discoInstanceList}" status="i" var="discoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${discoInstance.id}">${fieldValue(bean: discoInstance, field: "artista")}</g:link></td>
					
						<td><g:formatDate date="${discoInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: discoInstance, field: "imagen")}</td>
					
						<td>${fieldValue(bean: discoInstance, field: "imagenThumb")}</td>
					
						<td>${fieldValue(bean: discoInstance, field: "prettyUrl")}</td>
					
						<td>${fieldValue(bean: discoInstance, field: "titulo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${discoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
