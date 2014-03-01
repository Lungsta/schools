
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
			
				<g:if test="${parentInstance?.firstName1}">
				<li class="fieldcontain">
					<span id="firstName1-label" class="property-label"><g:message code="parent.firstName1.label" default="First Name1" /></span>
					
						<span class="property-value" aria-labelledby="firstName1-label"><g:fieldValue bean="${parentInstance}" field="firstName1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName1}">
				<li class="fieldcontain">
					<span id="lastName1-label" class="property-label"><g:message code="parent.lastName1.label" default="Last Name1" /></span>
					
						<span class="property-value" aria-labelledby="lastName1-label"><g:fieldValue bean="${parentInstance}" field="lastName1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.firstName2}">
				<li class="fieldcontain">
					<span id="firstName2-label" class="property-label"><g:message code="parent.firstName2.label" default="First Name2" /></span>
					
						<span class="property-value" aria-labelledby="firstName2-label"><g:fieldValue bean="${parentInstance}" field="firstName2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName2}">
				<li class="fieldcontain">
					<span id="lastName2-label" class="property-label"><g:message code="parent.lastName2.label" default="Last Name2" /></span>
					
						<span class="property-value" aria-labelledby="lastName2-label"><g:fieldValue bean="${parentInstance}" field="lastName2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.firstName3}">
				<li class="fieldcontain">
					<span id="firstName3-label" class="property-label"><g:message code="parent.firstName3.label" default="First Name3" /></span>
					
						<span class="property-value" aria-labelledby="firstName3-label"><g:fieldValue bean="${parentInstance}" field="firstName3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parentInstance?.lastName3}">
				<li class="fieldcontain">
					<span id="lastName3-label" class="property-label"><g:message code="parent.lastName3.label" default="Last Name3" /></span>
					
						<span class="property-value" aria-labelledby="lastName3-label"><g:fieldValue bean="${parentInstance}" field="lastName3"/></span>
					
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
