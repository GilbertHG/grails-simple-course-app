package student.courses.app

class Student {
    String firstName
    String lastName
    String email
    Date enrollmentDate
    Date dateCreated
    Date lastUpdated

    static hasMany = [enrollments: Enrollment]

    static constraints = {
        firstName blank: false
        lastName blank: false
        email email: true, blank: false, unique: true
        enrollmentDate nullable: false
    }

    static mapping = {
        table 'students'
    }

    String toString() {
        return "${firstName} ${lastName}"
    }
} 