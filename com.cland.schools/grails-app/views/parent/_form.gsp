<%@ page import="com.cland.schools.Parent" %>



<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="parent.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="firstName" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="parent.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="lastName" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="parent.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="email" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="parent.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="address" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="parent.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textArea name="contactNumber" cols="40" rows="5" maxlength="255" value="${parentInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'applicants', 'error')} ">
	<label for="applicants">
		<g:message code="parent.applicants.label" default="Applicants" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${parentInstance?.applicants?}" var="a">
    <li><g:link controller="applicant" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="applicant" action="create" params="['parent.id': parentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'applicant.label', default: 'Applicant')])}</g:link>
</li>
</ul>

</div>

