
<%@ page import="com.disqomo.model.Disco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disco.label', default: 'Disco')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-disco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-disco" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list disco">
			
				<g:if test="${discoInstance?.artista}">
				<li class="fieldcontain">
					<span id="artista-label" class="property-label"><g:message code="disco.artista.label" default="Artista" /></span>
					
						<span class="property-value" aria-labelledby="artista-label"><g:fieldValue bean="${discoInstance}" field="artista"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="disco.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${discoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${discoInstance?.imagen}">
			  		<img class="disco-img img-thumbnail"   
			  			src="${createLink(controller:'disco', action:'discoImage', id:discoInstance.ident())}" />				
				</g:if>


			
				<g:if test="${discoInstance?.prettyUrl}">
				<li class="fieldcontain">
					<span id="prettyUrl-label" class="property-label"><g:message code="disco.prettyUrl.label" default="Pretty Url" /></span>
					
						<span class="property-value" aria-labelledby="prettyUrl-label"><g:fieldValue bean="${discoInstance}" field="prettyUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="disco.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${discoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discoInstance?.urlImagen}">
				<li class="fieldcontain">
					<span id="urlImagen-label" class="property-label"><g:message code="disco.urlImagen.label" default="Url Imagen" /></span>
					
						<span class="property-value" aria-labelledby="urlImagen-label"><g:fieldValue bean="${discoInstance}" field="urlImagen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${discoInstance?.urlThumb}">
				<li class="fieldcontain">
					<span id="urlThumb-label" class="property-label"><g:message code="disco.urlThumb.label" default="Url Thumb" /></span>
					
						<span class="property-value" aria-labelledby="urlThumb-label"><g:fieldValue bean="${discoInstance}" field="urlThumb"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:discoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${discoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
