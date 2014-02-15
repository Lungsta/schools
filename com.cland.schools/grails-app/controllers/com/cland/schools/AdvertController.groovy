package com.cland.schools

import org.springframework.dao.DataIntegrityViolationException

class AdvertController {

	//static scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [advertInstanceList: Advert.list(params), advertInstanceTotal: Advert.count()]
    }

    def create() {
        [advertInstance: new Advert(params)]
    }

    def save() {
        def advertInstance = new Advert(params)
        if (!advertInstance.save(flush: true)) {
            render(view: "create", model: [advertInstance: advertInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'advert.label', default: 'Advert'), advertInstance.id])
        redirect(action: "show", id: advertInstance.id)
    }

    def show(Long id) {
        def advertInstance = Advert.get(id)
        if (!advertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "list")
            return
        }

        [advertInstance: advertInstance]
    }

    def edit(Long id) {
        def advertInstance = Advert.get(id)
        if (!advertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "list")
            return
        }

        [advertInstance: advertInstance]
    }

    def update(Long id, Long version) {
        def advertInstance = Advert.get(id)
        if (!advertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (advertInstance.version > version) {
                advertInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'advert.label', default: 'Advert')] as Object[],
                          "Another user has updated this Advert while you were editing")
                render(view: "edit", model: [advertInstance: advertInstance])
                return
            }
        }

        advertInstance.properties = params

        if (!advertInstance.save(flush: true)) {
            render(view: "edit", model: [advertInstance: advertInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'advert.label', default: 'Advert'), advertInstance.id])
        redirect(action: "show", id: advertInstance.id)
    }

    def delete(Long id) {
        def advertInstance = Advert.get(id)
        if (!advertInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "list")
            return
        }

        try {
            advertInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'advert.label', default: 'Advert'), id])
            redirect(action: "show", id: id)
        }
    }
}
