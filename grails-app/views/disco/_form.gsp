<%@ page import="com.disqomo.model.Disco" %>



<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'artista', 'error')} ">
	<label for="artista">
		<g:message code="disco.artista.label" default="Artista" />
		
	</label>
	<g:textField name="artista" value="${discoInstance?.artista}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'imagen', 'error')} required">
	<label for="imagen">
		<g:message code="disco.imagen.label" default="Imagen" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="imagen" name="imagen" />
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'imagenThumb', 'error')} required">
	<label for="imagenThumb">
		<g:message code="disco.imagenThumb.label" default="Imagen Thumb" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="imagenThumb" name="imagenThumb" />
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'prettyUrl', 'error')} ">
	<label for="prettyUrl">
		<g:message code="disco.prettyUrl.label" default="Pretty Url" />
		
	</label>
	<g:textField name="prettyUrl" value="${discoInstance?.prettyUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="disco.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${discoInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'urlImagen', 'error')} ">
	<label for="urlImagen">
		<g:message code="disco.urlImagen.label" default="Url Imagen" />
		
	</label>
	<g:textField name="urlImagen" value="${discoInstance?.urlImagen}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: discoInstance, field: 'urlThumb', 'error')} ">
	<label for="urlThumb">
		<g:message code="disco.urlThumb.label" default="Url Thumb" />
		
	</label>
	<g:textField name="urlThumb" value="${discoInstance?.urlThumb}"/>
</div>

