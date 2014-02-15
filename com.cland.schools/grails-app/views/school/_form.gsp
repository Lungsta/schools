<%@ page import="com.cland.schools.School" %>



<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="school.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${schoolInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'application', 'error')} required">
	<label for="application">
		<g:message code="school.application.label" default="Application" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="application" name="application.id" from="${com.cland.schools.Application.list()}" optionKey="id" required="" value="${schoolInstance?.application?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'avail_space', 'error')} ">
	<label for="avail_space">
		<g:message code="school.avail_space.label" default="Availspace" />
		
	</label>
	<g:textField name="avail_space" value="${schoolInstance?.avail_space}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'grade', 'error')} ">
	<label for="grade">
		<g:message code="school.grade.label" default="Grade" />
		
	</label>
	<g:textField name="grade" value="${schoolInstance?.grade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="school.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${schoolInstance?.name}"/>
</div>

