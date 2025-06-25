package student.courses.app

import models.request.CreateStudentRequest
import models.request.UpdateStudentRequest

class StudentController {

    StudentService studentService
    EnrollmentService enrollmentService

    def index() {
        List<Student> students = studentService.getAllStudents()
        [students: students]
    }

    def show(Long id) {
        Student student = studentService.getStudentById(id)
        if (!student) {
            flash.error = "Student not found"
            redirect(action: "index")
            return
        }
        
        List<Enrollment> enrollments = enrollmentService.getEnrollmentsByStudent(id)
        [student: student, enrollments: enrollments]
    }

    def create() {
        [student: new Student()]
    }

    def save(CreateStudentRequest request) {
        if (!request.validate()) {
            respond request.errors, view: 'create'
            return
        }

        try {
            Student student = studentService.createStudent(request)
            flash.success = "Student created successfully"
            redirect(action: "show", id: student.id)
        } catch (Exception e) {
            flash.error = "Error creating student: ${e.message}"
            respond request.errors, view: 'create'
        }
    }

    def edit(Long id) {
        Student student = studentService.getStudentById(id)
        if (!student) {
            flash.error = "Student not found"
            redirect(action: "index")
            return
        }
        
        List<Course> availableCourses = studentService.getAvailableCoursesForStudent(id)
        List<Enrollment> enrollments = enrollmentService.getEnrollmentsByStudent(id)
        
        [student: student, availableCourses: availableCourses, enrollments: enrollments]
    }

    def update(UpdateStudentRequest request) {
        if (!request.validate()) {
            Student student = studentService.getStudentById(request.id)
            List<Course> availableCourses = studentService.getAvailableCoursesForStudent(request.id)
            List<Enrollment> enrollments = enrollmentService.getEnrollmentsByStudent(request.id)
            respond request.errors, view: 'edit', model: [student: student, availableCourses: availableCourses, enrollments: enrollments]
            return
        }

        try {
            Student student = studentService.updateStudent(request)
            flash.success = "Student updated successfully"
            redirect(action: "show", id: student.id)
        } catch (Exception e) {
            flash.error = "Error updating student: ${e.message}"
            Student student = studentService.getStudentById(request.id)
            List<Course> availableCourses = studentService.getAvailableCoursesForStudent(request.id)
            List<Enrollment> enrollments = enrollmentService.getEnrollmentsByStudent(request.id)
            respond request.errors, view: 'edit', model: [student: student, availableCourses: availableCourses, enrollments: enrollments]
        }
    }

    def delete(Long id) {
        try {
            studentService.deleteStudent(id)
            flash.success = "Student deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting student: ${e.message}"
        }
        redirect(action: "index")
    }

    def enroll(Long studentId, Long courseId) {
        try {
            enrollmentService.enrollStudentInCourse(studentId, courseId, new Date())
            flash.success = "Student enrolled in course successfully"
        } catch (Exception e) {
            flash.error = "Error enrolling student: ${e.message}"
        }
        redirect(action: "edit", id: studentId)
    }

    def unenroll(Long enrollmentId, Long studentId) {
        try {
            enrollmentService.deleteEnrollment(enrollmentId)
            flash.success = "Student unenrolled from course successfully"
        } catch (Exception e) {
            flash.error = "Error unenrolling student: ${e.message}"
        }
        redirect(action: "edit", id: studentId)
    }
} 