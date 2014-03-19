package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(SchoolLevelController)
@Mock(SchoolLevel)
class SchoolLevelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/schoolLevel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.schoolLevelInstanceList.size() == 0
        assert model.schoolLevelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.schoolLevelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.schoolLevelInstance != null
        assert view == '/schoolLevel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/schoolLevel/show/1'
        assert controller.flash.message != null
        assert SchoolLevel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolLevel/list'

        populateValidParams(params)
        def schoolLevel = new SchoolLevel(params)

        assert schoolLevel.save() != null

        params.id = schoolLevel.id

        def model = controller.show()

        assert model.schoolLevelInstance == schoolLevel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolLevel/list'

        populateValidParams(params)
        def schoolLevel = new SchoolLevel(params)

        assert schoolLevel.save() != null

        params.id = schoolLevel.id

        def model = controller.edit()

        assert model.schoolLevelInstance == schoolLevel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/schoolLevel/list'

        response.reset()

        populateValidParams(params)
        def schoolLevel = new SchoolLevel(params)

        assert schoolLevel.save() != null

        // test invalid parameters in update
        params.id = schoolLevel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/schoolLevel/edit"
        assert model.schoolLevelInstance != null

        schoolLevel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/schoolLevel/show/$schoolLevel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        schoolLevel.clearErrors()

        populateValidParams(params)
        params.id = schoolLevel.id
        params.version = -1
        controller.update()

        assert view == "/schoolLevel/edit"
        assert model.schoolLevelInstance != null
        assert model.schoolLevelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/schoolLevel/list'

        response.reset()

        populateValidParams(params)
        def schoolLevel = new SchoolLevel(params)

        assert schoolLevel.save() != null
        assert SchoolLevel.count() == 1

        params.id = schoolLevel.id

        controller.delete()

        assert SchoolLevel.count() == 0
        assert SchoolLevel.get(schoolLevel.id) == null
        assert response.redirectedUrl == '/schoolLevel/list'
    }
}
