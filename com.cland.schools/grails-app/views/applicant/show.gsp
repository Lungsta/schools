
<%@ page import="com.cland.schools.Applicant" %>
<%@ page import="com.cland.schools.SystemRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicant.label', default: 'Applicant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-applicant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-applicant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_PARENT }">
			<ol class="property-list applicant">
			
				<g:if test="${applicantInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="applicant.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${applicantInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicantInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="applicant.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${applicantInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicantInstance?.dob}">
				<li class="fieldcontain">
					<span id="dob-label" class="property-label"><g:message code="applicant.dob.label" default="Dob" /></span>
					
						<span class="property-value" aria-labelledby="dob-label"><g:formatDate date="${applicantInstance?.dob}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicantInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="applicant.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${applicantInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicantInstance?.contactNumber}">
				<li class="fieldcontain">
					<span id="contactNumber-label" class="property-label"><g:message code="applicant.contactNumber.label" default="Contact Number" /></span>
					
						<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${applicantInstance}" field="contactNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicantInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="applicant.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="parent" action="show" id="${applicantInstance?.parent?.id}">${applicantInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			</sec:ifAnyGranted>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${applicantInstance?.id}" />
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_PARENT }">
					<g:link class="edit" action="edit" id="${applicantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</sec:ifAnyGranted>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
