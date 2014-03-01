<%@ page import="com.cland.schools.Parent" %>



<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'firstName1', 'error')} required">
	<label for="firstName1">
		<g:message code="parent.firstName1.label" default="First Name1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="firstName1" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.firstName1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'lastName1', 'error')} required">
	<label for="lastName1">
		<g:message code="parent.lastName1.label" default="Last Name1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="lastName1" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.lastName1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'firstName2', 'error')} required">
	<label for="firstName2">
		<g:message code="parent.firstName2.label" default="First Name2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="firstName2" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.firstName2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'lastName2', 'error')} required">
	<label for="lastName2">
		<g:message code="parent.lastName2.label" default="Last Name2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="lastName2" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.lastName2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'firstName3', 'error')} required">
	<label for="firstName3">
		<g:message code="parent.firstName3.label" default="First Name3" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="firstName3" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.firstName3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parentInstance, field: 'lastName3', 'error')} required">
	<label for="lastName3">
		<g:message code="parent.lastName3.label" default="Last Name3" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="lastName3" cols="40" rows="5" maxlength="255" required="" value="${parentInstance?.lastName3}"/>
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

