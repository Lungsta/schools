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

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'appliedLevel', 'error')} required">
	<label for="appliedLevel">
		<g:message code="application.appliedLevel.label" default="Applied Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appliedLevel" name="appliedLevel.id" from="${com.cland.schools.SchoolLevel.list()}" optionKey="id" required="" value="${applicationInstance?.appliedLevel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'entries', 'error')} ">
	<label for="entries">
		<g:message code="application.entries.label" default="Entries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${applicationInstance?.entries?}" var="e">
    <li><g:link controller="applicationEntry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="applicationEntry" action="create" params="['application.id': applicationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry')])}</g:link>
</li>
</ul>

</div>

