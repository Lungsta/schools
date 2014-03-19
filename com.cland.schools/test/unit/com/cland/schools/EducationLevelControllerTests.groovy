package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(EducationLevelController)
@Mock(EducationLevel)
class EducationLevelControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/educationLevel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.educationLevelInstanceList.size() == 0
        assert model.educationLevelInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.educationLevelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.educationLevelInstance != null
        assert view == '/educationLevel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/educationLevel/show/1'
        assert controller.flash.message != null
        assert EducationLevel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/educationLevel/list'

        populateValidParams(params)
        def educationLevel = new EducationLevel(params)

        assert educationLevel.save() != null

        params.id = educationLevel.id

        def model = controller.show()

        assert model.educationLevelInstance == educationLevel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/educationLevel/list'

        populateValidParams(params)
        def educationLevel = new EducationLevel(params)

        assert educationLevel.save() != null

        params.id = educationLevel.id

        def model = controller.edit()

        assert model.educationLevelInstance == educationLevel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/educationLevel/list'

        response.reset()

        populateValidParams(params)
        def educationLevel = new EducationLevel(params)

        assert educationLevel.save() != null

        // test invalid parameters in update
        params.id = educationLevel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/educationLevel/edit"
        assert model.educationLevelInstance != null

        educationLevel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/educationLevel/show/$educationLevel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        educationLevel.clearErrors()

        populateValidParams(params)
        params.id = educationLevel.id
        params.version = -1
        controller.update()

        assert view == "/educationLevel/edit"
        assert model.educationLevelInstance != null
        assert model.educationLevelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/educationLevel/list'

        response.reset()

        populateValidParams(params)
        def educationLevel = new EducationLevel(params)

        assert educationLevel.save() != null
        assert EducationLevel.count() == 1

        params.id = educationLevel.id

        controller.delete()

        assert EducationLevel.count() == 0
        assert EducationLevel.get(educationLevel.id) == null
        assert response.redirectedUrl == '/educationLevel/list'
    }
}
