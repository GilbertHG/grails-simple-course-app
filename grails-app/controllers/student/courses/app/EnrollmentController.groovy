package student.courses.app

import models.request.CreateEnrollmentRequest

class EnrollmentController {

    EnrollmentService enrollmentService
    StudentService studentService
    CourseService courseService

    def index() {
        List<Enrollment> enrollments = enrollmentService.getAllEnrollments()
        [enrollments: enrollments]
    }

    def show(Long id) {
        Enrollment enrollment = enrollmentService.getEnrollmentById(id)
        if (!enrollment) {
            flash.error = "Enrollment not found"
            redirect(action: "index")
            return
        }
        [enrollment: enrollment]
    }

    def create() {
        List<Student> students = studentService.getAllStudents()
        List<Course> courses = courseService.getAllCourses()
        [students: students, courses: courses, enrollment: new Enrollment()]
    }

    def save(CreateEnrollmentRequest request) {
        if (!request.validate()) {
            List<Student> students = studentService.getAllStudents()
            List<Course> courses = courseService.getAllCourses()
            respond request.errors, view: 'create', model: [students: students, courses: courses, enrollment: new Enrollment()]
            return
        }

        try {
            Enrollment enrollment = enrollmentService.createEnrollment(request)
            flash.success = "Enrollment created successfully"
            redirect(action: "show", id: enrollment.id)
        } catch (Exception e) {
            flash.error = "Error creating enrollment: ${e.message}"
            List<Student> students = studentService.getAllStudents()
            List<Course> courses = courseService.getAllCourses()
            respond request.errors, view: 'create', model: [students: students, courses: courses, enrollment: new Enrollment()]
        }
    }

    def updateGrade(Long id, BigDecimal grade) {
        try {
            enrollmentService.updateGrade(id, grade)
            flash.success = "Grade updated successfully"
        } catch (Exception e) {
            flash.error = "Error updating grade: ${e.message}"
        }
        redirect(action: "show", id: id)
    }

    def delete(Long id) {
        try {
            enrollmentService.deleteEnrollment(id)
            flash.success = "Enrollment deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting enrollment: ${e.message}"
        }
        redirect(action: "index")
    }
} 