
<%@ page import="com.cland.schools.Advert" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'advert.label', default: 'Advert')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-advert" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-advert" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'advert.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'advert.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'advert.created.label', default: 'Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${advertInstanceList}" status="i" var="advertInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${advertInstance.id}">${fieldValue(bean: advertInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: advertInstance, field: "description")}</td>
					
						<td><g:formatDate date="${advertInstance.created}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${advertInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
