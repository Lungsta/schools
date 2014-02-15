package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class ApplicantController {
	//static scaffold = true

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [applicantInstanceList: Applicant.list(params), applicantInstanceTotal: Applicant.count()]
    }

    def create() {
        [applicantInstance: new Applicant(params)]
    }

    def save() {
        def applicantInstance = new Applicant(params)
        if (!applicantInstance.save(flush: true)) {
            render(view: "create", model: [applicantInstance: applicantInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'applicant.label', default: 'Applicant'), applicantInstance.id])
        redirect(action: "show", id: applicantInstance.id)
    }

    def show(Long id) {
        def applicantInstance = Applicant.get(id)
        if (!applicantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "list")
            return
        }

        [applicantInstance: applicantInstance]
    }

    def edit(Long id) {
        def applicantInstance = Applicant.get(id)
        if (!applicantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "list")
            return
        }

        [applicantInstance: applicantInstance]
    }

    def update(Long id, Long version) {
        def applicantInstance = Applicant.get(id)
        if (!applicantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (applicantInstance.version > version) {
                applicantInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'applicant.label', default: 'Applicant')] as Object[],
                          "Another user has updated this Applicant while you were editing")
                render(view: "edit", model: [applicantInstance: applicantInstance])
                return
            }
        }

        applicantInstance.properties = params

        if (!applicantInstance.save(flush: true)) {
            render(view: "edit", model: [applicantInstance: applicantInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'applicant.label', default: 'Applicant'), applicantInstance.id])
        redirect(action: "show", id: applicantInstance.id)
    }

    def delete(Long id) {
        def applicantInstance = Applicant.get(id)
        if (!applicantInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "list")
            return
        }

        try {
            applicantInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'applicant.label', default: 'Applicant'), id])
            redirect(action: "show", id: id)
        }
    }
	
}
