package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(ApplicationEntryController)
@Mock(ApplicationEntry)
class ApplicationEntryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/applicationEntry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.applicationEntryInstanceList.size() == 0
        assert model.applicationEntryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.applicationEntryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.applicationEntryInstance != null
        assert view == '/applicationEntry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/applicationEntry/show/1'
        assert controller.flash.message != null
        assert ApplicationEntry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationEntry/list'

        populateValidParams(params)
        def applicationEntry = new ApplicationEntry(params)

        assert applicationEntry.save() != null

        params.id = applicationEntry.id

        def model = controller.show()

        assert model.applicationEntryInstance == applicationEntry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationEntry/list'

        populateValidParams(params)
        def applicationEntry = new ApplicationEntry(params)

        assert applicationEntry.save() != null

        params.id = applicationEntry.id

        def model = controller.edit()

        assert model.applicationEntryInstance == applicationEntry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/applicationEntry/list'

        response.reset()

        populateValidParams(params)
        def applicationEntry = new ApplicationEntry(params)

        assert applicationEntry.save() != null

        // test invalid parameters in update
        params.id = applicationEntry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/applicationEntry/edit"
        assert model.applicationEntryInstance != null

        applicationEntry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/applicationEntry/show/$applicationEntry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        applicationEntry.clearErrors()

        populateValidParams(params)
        params.id = applicationEntry.id
        params.version = -1
        controller.update()

        assert view == "/applicationEntry/edit"
        assert model.applicationEntryInstance != null
        assert model.applicationEntryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/applicationEntry/list'

        response.reset()

        populateValidParams(params)
        def applicationEntry = new ApplicationEntry(params)

        assert applicationEntry.save() != null
        assert ApplicationEntry.count() == 1

        params.id = applicationEntry.id

        controller.delete()

        assert ApplicationEntry.count() == 0
        assert ApplicationEntry.get(applicationEntry.id) == null
        assert response.redirectedUrl == '/applicationEntry/list'
    }
}
