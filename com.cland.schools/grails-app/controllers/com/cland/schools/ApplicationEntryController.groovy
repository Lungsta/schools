package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class ApplicationEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [applicationEntryInstanceList: ApplicationEntry.list(params), applicationEntryInstanceTotal: ApplicationEntry.count()]
    }

    def create() {
        [applicationEntryInstance: new ApplicationEntry(params)]
    }

    def save() {
        def applicationEntryInstance = new ApplicationEntry(params)
        if (!applicationEntryInstance.save(flush: true)) {
            render(view: "create", model: [applicationEntryInstance: applicationEntryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), applicationEntryInstance.id])
        redirect(action: "show", id: applicationEntryInstance.id)
    }

    def show(Long id) {
        def applicationEntryInstance = ApplicationEntry.get(id)
        if (!applicationEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "list")
            return
        }

        [applicationEntryInstance: applicationEntryInstance]
    }

    def edit(Long id) {
        def applicationEntryInstance = ApplicationEntry.get(id)
        if (!applicationEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "list")
            return
        }

        [applicationEntryInstance: applicationEntryInstance]
    }

    def update(Long id, Long version) {
        def applicationEntryInstance = ApplicationEntry.get(id)
        if (!applicationEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (applicationEntryInstance.version > version) {
                applicationEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'applicationEntry.label', default: 'ApplicationEntry')] as Object[],
                          "Another user has updated this ApplicationEntry while you were editing")
                render(view: "edit", model: [applicationEntryInstance: applicationEntryInstance])
                return
            }
        }

        applicationEntryInstance.properties = params

        if (!applicationEntryInstance.save(flush: true)) {
            render(view: "edit", model: [applicationEntryInstance: applicationEntryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), applicationEntryInstance.id])
        redirect(action: "show", id: applicationEntryInstance.id)
    }

    def delete(Long id) {
        def applicationEntryInstance = ApplicationEntry.get(id)
        if (!applicationEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "list")
            return
        }

        try {
            applicationEntryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'applicationEntry.label', default: 'ApplicationEntry'), id])
            redirect(action: "show", id: id)
        }
    }
}
