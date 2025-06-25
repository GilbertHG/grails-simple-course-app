package student.courses.app

class Course {
    String courseName
    Integer credits
    String instructor
    Date dateCreated
    Date lastUpdated

    static hasMany = [enrollments: Enrollment]

    static constraints = {
        courseName blank: false
        credits min: 0
        instructor blank: false
    }

    static mapping = {
        table 'courses'
    }

    String toString() {
        return courseName
    }
} 