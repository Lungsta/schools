package com.cland.schools



import org.junit.*
import grails.test.mixin.*

@TestFor(ApplicantController)
@Mock(Applicant)
class ApplicantControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/applicant/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.applicantInstanceList.size() == 0
        assert model.applicantInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.applicantInstance != null
    }

    void testSave() {
        controller.save()

        assert model.applicantInstance != null
        assert view == '/applicant/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/applicant/show/1'
        assert controller.flash.message != null
        assert Applicant.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/applicant/list'

        populateValidParams(params)
        def applicant = new Applicant(params)

        assert applicant.save() != null

        params.id = applicant.id

        def model = controller.show()

        assert model.applicantInstance == applicant
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/applicant/list'

        populateValidParams(params)
        def applicant = new Applicant(params)

        assert applicant.save() != null

        params.id = applicant.id

        def model = controller.edit()

        assert model.applicantInstance == applicant
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/applicant/list'

        response.reset()

        populateValidParams(params)
        def applicant = new Applicant(params)

        assert applicant.save() != null

        // test invalid parameters in update
        params.id = applicant.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/applicant/edit"
        assert model.applicantInstance != null

        applicant.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/applicant/show/$applicant.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        applicant.clearErrors()

        populateValidParams(params)
        params.id = applicant.id
        params.version = -1
        controller.update()

        assert view == "/applicant/edit"
        assert model.applicantInstance != null
        assert model.applicantInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/applicant/list'

        response.reset()

        populateValidParams(params)
        def applicant = new Applicant(params)

        assert applicant.save() != null
        assert Applicant.count() == 1

        params.id = applicant.id

        controller.delete()

        assert Applicant.count() == 0
        assert Applicant.get(applicant.id) == null
        assert response.redirectedUrl == '/applicant/list'
    }
}
