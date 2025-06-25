package models.request

import grails.validation.Validateable
import org.springframework.format.annotation.DateTimeFormat

class CreateEnrollmentRequest implements Validateable {
    Long studentId
    Long courseId
    @DateTimeFormat(pattern='yyyy-MM-dd')
    Date enrollmentDate
    BigDecimal grade

    static constraints = {
        studentId nullable: false
        courseId nullable: false
        enrollmentDate nullable: false
        grade nullable: true, scale: 2, min: 0.0G, max: 100.0G
    }
} 