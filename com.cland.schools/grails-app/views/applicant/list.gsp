
<%@ page import="com.cland.schools.Applicant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicant.label', default: 'Applicant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-applicant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-applicant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'applicant.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'applicant.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="dob" title="${message(code: 'applicant.dob.label', default: 'Dob')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'applicant.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="contactNumber" title="${message(code: 'applicant.contactNumber.label', default: 'Contact Number')}" />
					
						<th><g:message code="applicant.application.label" default="Application" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicantInstanceList}" status="i" var="applicantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${applicantInstance.id}">${fieldValue(bean: applicantInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: applicantInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: applicantInstance, field: "dob")}</td>
					
						<td>${fieldValue(bean: applicantInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: applicantInstance, field: "contactNumber")}</td>
					
						<td>${fieldValue(bean: applicantInstance, field: "application")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${applicantInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
