package request

import grails.validation.Validateable

class CreateCourseRequest implements Validateable {
    String courseName
    Integer credits
    String instructor

    static constraints = {
        courseName blank: false
        credits min: 0
        instructor blank: false
    }
} 