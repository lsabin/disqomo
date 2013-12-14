package com.disqomo.model



import grails.test.mixin.*
import spock.lang.*

@TestFor(DiscoController)
@Mock(Disco)
class DiscoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.discoInstanceList
            model.discoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.discoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def disco = new Disco()
            disco.validate()
            controller.save(disco)

        then:"The create view is rendered again with the correct model"
            model.discoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            disco = new Disco(params)

            controller.save(disco)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/disco/show/1'
            controller.flash.message != null
            Disco.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def disco = new Disco(params)
            controller.show(disco)

        then:"A model is populated containing the domain instance"
            model.discoInstance == disco
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def disco = new Disco(params)
            controller.edit(disco)

        then:"A model is populated containing the domain instance"
            model.discoInstance == disco
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/disco/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def disco = new Disco()
            disco.validate()
            controller.update(disco)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.discoInstance == disco

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            disco = new Disco(params).save(flush: true)
            controller.update(disco)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/disco/show/$disco.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/disco/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def disco = new Disco(params).save(flush: true)

        then:"It exists"
            Disco.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(disco)

        then:"The instance is deleted"
            Disco.count() == 0
            response.redirectedUrl == '/disco/index'
            flash.message != null
    }
}
