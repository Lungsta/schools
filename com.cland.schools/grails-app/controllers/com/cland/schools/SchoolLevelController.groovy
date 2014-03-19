package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class SchoolLevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [schoolLevelInstanceList: SchoolLevel.list(params), schoolLevelInstanceTotal: SchoolLevel.count()]
    }

    def create() {
        [schoolLevelInstance: new SchoolLevel(params)]
    }

    def save() {
        def schoolLevelInstance = new SchoolLevel(params)
        if (!schoolLevelInstance.save(flush: true)) {
            render(view: "create", model: [schoolLevelInstance: schoolLevelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), schoolLevelInstance.id])
        redirect(action: "show", id: schoolLevelInstance.id)
    }

    def show(Long id) {
        def schoolLevelInstance = SchoolLevel.get(id)
        if (!schoolLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "list")
            return
        }

        [schoolLevelInstance: schoolLevelInstance]
    }

    def edit(Long id) {
        def schoolLevelInstance = SchoolLevel.get(id)
        if (!schoolLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "list")
            return
        }

        [schoolLevelInstance: schoolLevelInstance]
    }

    def update(Long id, Long version) {
        def schoolLevelInstance = SchoolLevel.get(id)
        if (!schoolLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (schoolLevelInstance.version > version) {
                schoolLevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'schoolLevel.label', default: 'SchoolLevel')] as Object[],
                          "Another user has updated this SchoolLevel while you were editing")
                render(view: "edit", model: [schoolLevelInstance: schoolLevelInstance])
                return
            }
        }

        schoolLevelInstance.properties = params

        if (!schoolLevelInstance.save(flush: true)) {
            render(view: "edit", model: [schoolLevelInstance: schoolLevelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), schoolLevelInstance.id])
        redirect(action: "show", id: schoolLevelInstance.id)
    }

    def delete(Long id) {
        def schoolLevelInstance = SchoolLevel.get(id)
        if (!schoolLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "list")
            return
        }

        try {
            schoolLevelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'schoolLevel.label', default: 'SchoolLevel'), id])
            redirect(action: "show", id: id)
        }
    }
}
