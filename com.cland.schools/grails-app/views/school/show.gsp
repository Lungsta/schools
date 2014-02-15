
<%@ page import="com.cland.schools.School" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'school.label', default: 'School')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-school" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-school" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list school">
			
				<g:if test="${schoolInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="school.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${schoolInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.application}">
				<li class="fieldcontain">
					<span id="application-label" class="property-label"><g:message code="school.application.label" default="Application" /></span>
					
						<span class="property-value" aria-labelledby="application-label"><g:link controller="application" action="show" id="${schoolInstance?.application?.id}">${schoolInstance?.application?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.avail_space}">
				<li class="fieldcontain">
					<span id="avail_space-label" class="property-label"><g:message code="school.avail_space.label" default="Availspace" /></span>
					
						<span class="property-value" aria-labelledby="avail_space-label"><g:fieldValue bean="${schoolInstance}" field="avail_space"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="school.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${schoolInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${schoolInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="school.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${schoolInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${schoolInstance?.id}" />
					<g:link class="edit" action="edit" id="${schoolInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
