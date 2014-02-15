<%@ page import="com.cland.schools.Application" %>



<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'application_date', 'error')} required">
	<label for="application_date">
		<g:message code="application.application_date.label" default="Applicationdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="application_date" precision="day"  value="${applicationInstance?.application_date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'minGrade', 'error')} required">
	<label for="minGrade">
		<g:message code="application.minGrade.label" default="Min Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="minGrade" from="${applicationInstance.constraints.minGrade.inList}" required="" value="${fieldValue(bean: applicationInstance, field: 'minGrade')}" valueMessagePrefix="application.minGrade"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'applicant', 'error')} required">
	<label for="applicant">
		<g:message code="application.applicant.label" default="Applicant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="applicant" name="applicant.id" from="${com.cland.schools.Applicant.list()}" optionKey="id" required="" value="${applicationInstance?.applicant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'maxGrade', 'error')} required">
	<label for="maxGrade">
		<g:message code="application.maxGrade.label" default="Max Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxGrade" type="number" value="${applicationInstance.maxGrade}" required=""/>
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

