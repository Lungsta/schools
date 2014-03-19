<%@ page import="com.cland.schools.School" %>



<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="school.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${schoolInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'appStatDate', 'error')} required">
	<label for="appStatDate">
		<g:message code="school.appStatDate.label" default="App Stat Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appStatDate" precision="day"  value="${schoolInstance?.appStatDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'appCloseDate', 'error')} required">
	<label for="appCloseDate">
		<g:message code="school.appCloseDate.label" default="App Close Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="appCloseDate" precision="day"  value="${schoolInstance?.appCloseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: schoolInstance, field: 'levels', 'error')} ">
	<label for="levels">
		<g:message code="school.levels.label" default="Levels" />
		
	</label>
	<g:select name="levels" from="${com.cland.schools.SchoolLevel.list()}" multiple="multiple" optionKey="id" size="5" value="${schoolInstance?.levels*.id}" class="many-to-many"/>
</div>

