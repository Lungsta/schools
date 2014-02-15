package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(StakeholderController)
@Mock(Stakeholder)
class StakeholderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/stakeholder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.stakeholderInstanceList.size() == 0
        assert model.stakeholderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.stakeholderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.stakeholderInstance != null
        assert view == '/stakeholder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/stakeholder/show/1'
        assert controller.flash.message != null
        assert Stakeholder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholder/list'

        populateValidParams(params)
        def stakeholder = new Stakeholder(params)

        assert stakeholder.save() != null

        params.id = stakeholder.id

        def model = controller.show()

        assert model.stakeholderInstance == stakeholder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholder/list'

        populateValidParams(params)
        def stakeholder = new Stakeholder(params)

        assert stakeholder.save() != null

        params.id = stakeholder.id

        def model = controller.edit()

        assert model.stakeholderInstance == stakeholder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/stakeholder/list'

        response.reset()

        populateValidParams(params)
        def stakeholder = new Stakeholder(params)

        assert stakeholder.save() != null

        // test invalid parameters in update
        params.id = stakeholder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/stakeholder/edit"
        assert model.stakeholderInstance != null

        stakeholder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/stakeholder/show/$stakeholder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        stakeholder.clearErrors()

        populateValidParams(params)
        params.id = stakeholder.id
        params.version = -1
        controller.update()

        assert view == "/stakeholder/edit"
        assert model.stakeholderInstance != null
        assert model.stakeholderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/stakeholder/list'

        response.reset()

        populateValidParams(params)
        def stakeholder = new Stakeholder(params)

        assert stakeholder.save() != null
        assert Stakeholder.count() == 1

        params.id = stakeholder.id

        controller.delete()

        assert Stakeholder.count() == 0
        assert Stakeholder.get(stakeholder.id) == null
        assert response.redirectedUrl == '/stakeholder/list'
    }
}
