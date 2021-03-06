
<%@ page import="filmes.Filme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'filme.label', default: 'Filme')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<a href="#list-filme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<form>
					<input type="button" name="consulta" value="Ordenar Nomes" action="consulta.consultaFilme">
				</form>			
			</ul>
		</div>
		<div id="list-filme" class="content scaffold-list" role="main">

			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="anoLancamento" title="${message(code: 'filme.anoLancamento.label', default: 'Ano Lancamento')}" />
					
						<th><g:message code="filme.categoria.label" default="Categoria" /></th>
					
						<g:sortableColumn property="nome" title="${message(code: 'filme.nome.label', default: 'Nome')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${filmeInstanceList}" status="i" var="filmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${filmeInstance.id}">${fieldValue(bean: filmeInstance, field: "anoLancamento")}</g:link></td>
					
						<td>${fieldValue(bean: filmeInstance, field: "categoria")}</td>
					
						<td>${fieldValue(bean: filmeInstance, field: "nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${filmeInstanceCount ?: 0}" />
			</div>
		</div>
	
	</body>
</html>
