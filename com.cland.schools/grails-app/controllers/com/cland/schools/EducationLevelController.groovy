package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class EducationLevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [educationLevelInstanceList: EducationLevel.list(params), educationLevelInstanceTotal: EducationLevel.count()]
    }

    def create() {
        [educationLevelInstance: new EducationLevel(params)]
    }

    def save() {
        def educationLevelInstance = new EducationLevel(params)
        if (!educationLevelInstance.save(flush: true)) {
            render(view: "create", model: [educationLevelInstance: educationLevelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), educationLevelInstance.id])
        redirect(action: "show", id: educationLevelInstance.id)
    }

    def show(Long id) {
        def educationLevelInstance = EducationLevel.get(id)
        if (!educationLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "list")
            return
        }

        [educationLevelInstance: educationLevelInstance]
    }

    def edit(Long id) {
        def educationLevelInstance = EducationLevel.get(id)
        if (!educationLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "list")
            return
        }

        [educationLevelInstance: educationLevelInstance]
    }

    def update(Long id, Long version) {
        def educationLevelInstance = EducationLevel.get(id)
        if (!educationLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (educationLevelInstance.version > version) {
                educationLevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'educationLevel.label', default: 'EducationLevel')] as Object[],
                          "Another user has updated this EducationLevel while you were editing")
                render(view: "edit", model: [educationLevelInstance: educationLevelInstance])
                return
            }
        }

        educationLevelInstance.properties = params

        if (!educationLevelInstance.save(flush: true)) {
            render(view: "edit", model: [educationLevelInstance: educationLevelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), educationLevelInstance.id])
        redirect(action: "show", id: educationLevelInstance.id)
    }

    def delete(Long id) {
        def educationLevelInstance = EducationLevel.get(id)
        if (!educationLevelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "list")
            return
        }

        try {
            educationLevelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'educationLevel.label', default: 'EducationLevel'), id])
            redirect(action: "show", id: id)
        }
    }
}
