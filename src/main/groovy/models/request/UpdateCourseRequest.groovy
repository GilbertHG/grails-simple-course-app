package models.request

import grails.validation.Validateable

class UpdateCourseRequest implements Validateable {
    Long id
    String courseName
    Integer credits
    String instructor

    static constraints = {
        id nullable: false
        courseName blank: false
        credits min: 0
        instructor blank: false
    }
} 