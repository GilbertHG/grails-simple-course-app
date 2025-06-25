package models.request

import grails.validation.Validateable
import org.springframework.format.annotation.DateTimeFormat

class CreateStudentRequest implements Validateable {
    String firstName
    String lastName
    String email
    @DateTimeFormat(pattern='yyyy-MM-dd')
    Date enrollmentDate

    static constraints = {
        firstName blank: false
        lastName blank: false
        email email: true, blank: false
        enrollmentDate nullable: false
    }
} 