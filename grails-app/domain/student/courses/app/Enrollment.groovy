package student.courses.app

class Enrollment {
    Student student
    Course course
    Date enrollmentDate
    BigDecimal grade
    Date dateCreated
    Date lastUpdated

    static belongsTo = [student: Student, course: Course]

    static constraints = {
        enrollmentDate nullable: false
        grade nullable: true, scale: 2, min: 0.0G, max: 100.0G
        student unique: 'course'
    }

    static mapping = {
        table 'enrollments'
    }

    String toString() {
        return "${student} enrolled in ${course}"
    }
} 