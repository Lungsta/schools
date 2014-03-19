<%@ page import="com.cland.schools.Applicant" %>



<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="applicant.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="firstName" cols="40" rows="5" maxlength="255" required="" value="${applicantInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="applicant.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="lastName" cols="40" rows="5" maxlength="255" required="" value="${applicantInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'dob', 'error')} required">
	<label for="dob">
		<g:message code="applicant.dob.label" default="Dob" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dob" precision="day"  value="${applicantInstance?.dob}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="applicant.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="address" cols="40" rows="5" maxlength="255" required="" value="${applicantInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="applicant.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textArea name="contactNumber" cols="40" rows="5" maxlength="255" value="${applicantInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicantInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="applicant.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.cland.schools.Parent.list()}" optionKey="id" required="" value="${applicantInstance?.parent?.id}" class="many-to-one"/>
</div>

