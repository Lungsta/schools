<%@ page import="com.cland.schools.Stakeholder" %>



<div class="fieldcontain ${hasErrors(bean: stakeholderInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="stakeholder.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${stakeholderInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="stakeholder.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" value="${stakeholderInstance?.contactNumber}"/>
</div>

