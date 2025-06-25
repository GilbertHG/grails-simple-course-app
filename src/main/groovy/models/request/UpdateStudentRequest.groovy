package models.request

import grails.validation.Validateable
import org.springframework.format.annotation.DateTimeFormat

class UpdateStudentRequest implements Validateable {
    Long id
    String firstName
    String lastName
    String email
    @DateTimeFormat(pattern='yyyy-MM-dd')
    Date enrollmentDate

    static constraints = {
        id nullable: false
        firstName blank: false
        lastName blank: false
        email email: true, blank: false
        enrollmentDate nullable: false
    }
} 