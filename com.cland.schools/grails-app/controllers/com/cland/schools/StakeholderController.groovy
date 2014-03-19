package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class StakeholderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [stakeholderInstanceList: Stakeholder.list(params), stakeholderInstanceTotal: Stakeholder.count()]
    }

    def create() {
        [stakeholderInstance: new Stakeholder(params)]
    }

    def save() {
        def stakeholderInstance = new Stakeholder(params)
        if (!stakeholderInstance.save(flush: true)) {
            render(view: "create", model: [stakeholderInstance: stakeholderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), stakeholderInstance.id])
        redirect(action: "show", id: stakeholderInstance.id)
    }

    def show(Long id) {
        def stakeholderInstance = Stakeholder.get(id)
        if (!stakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "list")
            return
        }

        [stakeholderInstance: stakeholderInstance]
    }

    def edit(Long id) {
        def stakeholderInstance = Stakeholder.get(id)
        if (!stakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "list")
            return
        }

        [stakeholderInstance: stakeholderInstance]
    }

    def update(Long id, Long version) {
        def stakeholderInstance = Stakeholder.get(id)
        if (!stakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stakeholderInstance.version > version) {
                stakeholderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stakeholder.label', default: 'Stakeholder')] as Object[],
                          "Another user has updated this Stakeholder while you were editing")
                render(view: "edit", model: [stakeholderInstance: stakeholderInstance])
                return
            }
        }

        stakeholderInstance.properties = params

        if (!stakeholderInstance.save(flush: true)) {
            render(view: "edit", model: [stakeholderInstance: stakeholderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), stakeholderInstance.id])
        redirect(action: "show", id: stakeholderInstance.id)
    }

    def delete(Long id) {
        def stakeholderInstance = Stakeholder.get(id)
        if (!stakeholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "list")
            return
        }

        try {
            stakeholderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stakeholder.label', default: 'Stakeholder'), id])
            redirect(action: "show", id: id)
        }
    }
}
