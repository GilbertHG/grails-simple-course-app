package student.courses.app

import java.text.SimpleDateFormat

class BootStrap {

    def init = { servletContext ->
        log.info "Loading sample data..."
        
        // Check if data already exists
        if (Student.count() > 0) {
            log.info "Sample data already exists, skipping initialization"
            return
        }
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
        
        // Create sample courses
        Course course1 = new Course(
            courseName: "Introduction to Computer Science",
            credits: 3,
            instructor: "Dr. Sarah Johnson"
        ).save(failOnError: true)
        
        Course course2 = new Course(
            courseName: "Data Structures and Algorithms",
            credits: 4,
            instructor: "Prof. Michael Chen"
        ).save(failOnError: true)
        
        Course course3 = new Course(
            courseName: "Database Design",
            credits: 3,
            instructor: "Dr. Emily Rodriguez"
        ).save(failOnError: true)
        
        Course course4 = new Course(
            courseName: "Web Development",
            credits: 3,
            instructor: "Prof. David Lee"
        ).save(failOnError: true)
        
        Course course5 = new Course(
            courseName: "Software Engineering",
            credits: 4,
            instructor: "Dr. Maria Garcia"
        ).save(failOnError: true)
        
        // Create sample students
        Student student1 = new Student(
            firstName: "John",
            lastName: "Doe",
            email: "john.doe@email.com",
            enrollmentDate: sdf.parse("2024-01-15")
        ).save(failOnError: true)
        
        Student student2 = new Student(
            firstName: "Jane",
            lastName: "Smith",
            email: "jane.smith@email.com",
            enrollmentDate: sdf.parse("2024-01-16")
        ).save(failOnError: true)
        
        Student student3 = new Student(
            firstName: "Bob",
            lastName: "Wilson",
            email: "bob.wilson@email.com",
            enrollmentDate: sdf.parse("2024-02-01")
        ).save(failOnError: true)
        
        Student student4 = new Student(
            firstName: "Alice",
            lastName: "Brown",
            email: "alice.brown@email.com",
            enrollmentDate: sdf.parse("2024-02-15")
        ).save(failOnError: true)
        
        Student student5 = new Student(
            firstName: "Charlie",
            lastName: "Davis",
            email: "charlie.davis@email.com",
            enrollmentDate: sdf.parse("2024-03-01")
        ).save(failOnError: true)
        
        // Create sample enrollments
        new Enrollment(
            student: student1,
            course: course1,
            enrollmentDate: sdf.parse("2024-01-20"),
            grade: 85.5
        ).save(failOnError: true)
        
        new Enrollment(
            student: student1,
            course: course2,
            enrollmentDate: sdf.parse("2024-01-25"),
            grade: 92.0
        ).save(failOnError: true)
        
        new Enrollment(
            student: student2,
            course: course1,
            enrollmentDate: sdf.parse("2024-01-20"),
            grade: 78.5
        ).save(failOnError: true)
        
        new Enrollment(
            student: student2,
            course: course3,
            enrollmentDate: sdf.parse("2024-02-10"),
            grade: 88.0
        ).save(failOnError: true)
        
        new Enrollment(
            student: student3,
            course: course2,
            enrollmentDate: sdf.parse("2024-02-05"),
            grade: 90.5
        ).save(failOnError: true)
        
        new Enrollment(
            student: student3,
            course: course4,
            enrollmentDate: sdf.parse("2024-02-20"),
            grade: null // Not graded yet
        ).save(failOnError: true)
        
        new Enrollment(
            student: student4,
            course: course3,
            enrollmentDate: sdf.parse("2024-02-25"),
            grade: 95.0
        ).save(failOnError: true)
        
        new Enrollment(
            student: student4,
            course: course5,
            enrollmentDate: sdf.parse("2024-03-10"),
            grade: null // Not graded yet
        ).save(failOnError: true)
        
        new Enrollment(
            student: student5,
            course: course1,
            enrollmentDate: sdf.parse("2024-03-05"),
            grade: 82.0
        ).save(failOnError: true)
        
        new Enrollment(
            student: student5,
            course: course4,
            enrollmentDate: sdf.parse("2024-03-15"),
            grade: null // Not graded yet
        ).save(failOnError: true)
        
        log.info "Sample data loaded successfully!"
        log.info "Created ${Student.count()} students, ${Course.count()} courses, and ${Enrollment.count()} enrollments"
    }
    
    def destroy = {
    }
}