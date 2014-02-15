
<%@ page import="com.cland.schools.Parent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parent.label', default: 'Parent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parent">
			
				<g:if test="${parentInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="parent.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${parentInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="parent.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${parentInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="parent.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${parentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="parent.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${parentInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="parent.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${parentInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.applicants}">
				<li class="fieldcontain">
					<span id="applicants-label" class="property-label"><g:message code="parent.applicants.label" default="Applicants" /></span>
					
						<g:each in="${parentInstance.applicants}" var="a">
						<span class="property-value" aria-labelledby="applicants-label"><g:link controller="applicant" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.applications}">
				<li class="fieldcontain">
					<span id="applications-label" class="property-label"><g:message code="parent.applications.label" default="Applications" /></span>
					
						<g:each in="${parentInstance.applications}" var="a">
						<span class="property-value" aria-labelledby="applications-label"><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parentInstance?.id}" />
					<g:link class="edit" action="edit" id="${parentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
