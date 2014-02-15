
<%@ page import="com.cland.schools.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-application" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-application" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="application_date" title="${message(code: 'application.application_date.label', default: 'Applicationdate')}" />
					
						<g:sortableColumn property="minGrade" title="${message(code: 'application.minGrade.label', default: 'Min Grade')}" />
					
						<th><g:message code="application.applicant.label" default="Applicant" /></th>
					
						<g:sortableColumn property="maxGrade" title="${message(code: 'application.maxGrade.label', default: 'Max Grade')}" />
					
						<th><g:message code="application.parent.label" default="Parent" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationInstanceList}" status="i" var="applicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicationInstance.id}">${fieldValue(bean: applicationInstance, field: "application_date")}</g:link></td>
					
						<td>${fieldValue(bean: applicationInstance, field: "minGrade")}</td>
					
						<td>${fieldValue(bean: applicationInstance, field: "applicant")}</td>
					
						<td>${fieldValue(bean: applicationInstance, field: "maxGrade")}</td>
					
						<td>${fieldValue(bean: applicationInstance, field: "parent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>