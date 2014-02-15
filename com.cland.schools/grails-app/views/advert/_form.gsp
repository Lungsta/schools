<%@ page import="com.cland.schools.Advert" %>



<div class="fieldcontain ${hasErrors(bean: advertInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="advert.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${advertInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="advert.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${advertInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="advert.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${advertInstance?.created}"  />
</div>

