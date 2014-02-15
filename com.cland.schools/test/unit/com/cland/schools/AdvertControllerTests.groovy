package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(AdvertController)
@Mock(Advert)
class AdvertControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/advert/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.advertInstanceList.size() == 0
        assert model.advertInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.advertInstance != null
    }

    void testSave() {
        controller.save()

        assert model.advertInstance != null
        assert view == '/advert/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/advert/show/1'
        assert controller.flash.message != null
        assert Advert.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/advert/list'

        populateValidParams(params)
        def advert = new Advert(params)

        assert advert.save() != null

        params.id = advert.id

        def model = controller.show()

        assert model.advertInstance == advert
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/advert/list'

        populateValidParams(params)
        def advert = new Advert(params)

        assert advert.save() != null

        params.id = advert.id

        def model = controller.edit()

        assert model.advertInstance == advert
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/advert/list'

        response.reset()

        populateValidParams(params)
        def advert = new Advert(params)

        assert advert.save() != null

        // test invalid parameters in update
        params.id = advert.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/advert/edit"
        assert model.advertInstance != null

        advert.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/advert/show/$advert.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        advert.clearErrors()

        populateValidParams(params)
        params.id = advert.id
        params.version = -1
        controller.update()

        assert view == "/advert/edit"
        assert model.advertInstance != null
        assert model.advertInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/advert/list'

        response.reset()

        populateValidParams(params)
        def advert = new Advert(params)

        assert advert.save() != null
        assert Advert.count() == 1

        params.id = advert.id

        controller.delete()

        assert Advert.count() == 0
        assert Advert.get(advert.id) == null
        assert response.redirectedUrl == '/advert/list'
    }
}
