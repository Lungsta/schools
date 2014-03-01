
<%@ page import="com.cland.schools.Parent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parent.label', default: 'Parent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName1" title="${message(code: 'parent.firstName1.label', default: 'First Name1')}" />
					
						<g:sortableColumn property="lastName1" title="${message(code: 'parent.lastName1.label', default: 'Last Name1')}" />
					
						<g:sortableColumn property="firstName2" title="${message(code: 'parent.firstName2.label', default: 'First Name2')}" />
					
						<g:sortableColumn property="lastName2" title="${message(code: 'parent.lastName2.label', default: 'Last Name2')}" />
					
						<g:sortableColumn property="firstName3" title="${message(code: 'parent.firstName3.label', default: 'First Name3')}" />
					
						<g:sortableColumn property="lastName3" title="${message(code: 'parent.lastName3.label', default: 'Last Name3')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parentInstanceList}" status="i" var="parentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parentInstance.id}">${fieldValue(bean: parentInstance, field: "firstName1")}</g:link></td>
					
						<td>${fieldValue(bean: parentInstance, field: "lastName1")}</td>
					
						<td>${fieldValue(bean: parentInstance, field: "firstName2")}</td>
					
						<td>${fieldValue(bean: parentInstance, field: "lastName2")}</td>
					
						<td>${fieldValue(bean: parentInstance, field: "firstName3")}</td>
					
						<td>${fieldValue(bean: parentInstance, field: "lastName3")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
