<%@ page import="com.cland.schools.Application" %>



<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicant', 'error')} ">
	<label for="applicant">
		<g:message code="application.applicant.label" default="Applicant" />
		
	</label>
	<g:select id="applicant" name="applicant.id" from="${com.cland.schools.Applicant.list()}" optionKey="id" value="${applicationInstance?.applicant?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'application_date', 'error')} ">
	<label for="application_date">
		<g:message code="application.application_date.label" default="Applicationdate" />
		
	</label>
	<g:datePicker name="application_date" precision="day"  value="${applicationInstance?.application_date}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="application.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="grade" from="${applicationInstance.constraints.grade.inList}" required="" value="${fieldValue(bean: applicationInstance, field: 'grade')}" valueMessagePrefix="application.grade"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="application.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${com.cland.schools.Parent.list()}" optionKey="id" required="" value="${applicationInstance?.parent?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'schools', 'error')} ">
	<label for="schools">
		<g:message code="application.schools.label" default="Schools" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${applicationInstance?.schools?}" var="s">
    <li><g:link controller="school" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="school" action="create" params="['application.id': applicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'school.label', default: 'School')])}</g:link>
</li>
</ul>

</div>

