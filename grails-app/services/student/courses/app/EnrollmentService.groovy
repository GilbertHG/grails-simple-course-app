package student.courses.app

import request.CreateEnrollmentRequest
import grails.gorm.transactions.Transactional

@Transactional
class EnrollmentService {

    List<Enrollment> getAllEnrollments() {
        return Enrollment.list(sort: "enrollmentDate", order: "desc")
    }

    Enrollment getEnrollmentById(Long id) {
        return Enrollment.get(id)
    }

    Enrollment createEnrollment(CreateEnrollmentRequest request) {
        Student student = Student.get(request.studentId)
        if (!student) {
            throw new RuntimeException("Student not found with id: ${request.studentId}")
        }
        
        Course course = Course.get(request.courseId)
        if (!course) {
            throw new RuntimeException("Course not found with id: ${request.courseId}")
        }
        
        // Check if enrollment already exists
        Enrollment existingEnrollment = Enrollment.findByStudentAndCourse(student, course)
        if (existingEnrollment) {
            throw new RuntimeException("Student is already enrolled in this course")
        }
        
        Enrollment enrollment = new Enrollment()
        enrollment.student = student
        enrollment.course = course
        enrollment.enrollmentDate = request.enrollmentDate
        enrollment.grade = request.grade
        
        if (!enrollment.save(flush: true)) {
            throw new RuntimeException("Failed to save enrollment: ${enrollment.errors}")
        }
        
        return enrollment
    }

    Enrollment enrollStudentInCourse(Long studentId, Long courseId, Date enrollmentDate) {
        CreateEnrollmentRequest request = new CreateEnrollmentRequest()
        request.studentId = studentId
        request.courseId = courseId
        request.enrollmentDate = enrollmentDate ?: new Date()
        
        return createEnrollment(request)
    }

    void updateGrade(Long enrollmentId, BigDecimal grade) {
        Enrollment enrollment = Enrollment.get(enrollmentId)
        if (!enrollment) {
            throw new RuntimeException("Enrollment not found with id: ${enrollmentId}")
        }
        
        enrollment.grade = grade
        
        if (!enrollment.save(flush: true)) {
            throw new RuntimeException("Failed to update grade: ${enrollment.errors}")
        }
    }

    void deleteEnrollment(Long id) {
        Enrollment enrollment = Enrollment.get(id)
        if (!enrollment) {
            throw new RuntimeException("Enrollment not found with id: ${id}")
        }
        
        enrollment.delete(flush: true)
    }

    List<Enrollment> getEnrollmentsByStudent(Long studentId) {
        Student student = Student.get(studentId)
        if (!student) {
            return []
        }
        
        return Enrollment.findAllByStudent(student, [sort: 'enrollmentDate', order: 'desc'])
    }

    List<Enrollment> getEnrollmentsByCourse(Long courseId) {
        Course course = Course.get(courseId)
        if (!course) {
            return []
        }
        
        return Enrollment.findAllByCourse(course, [sort: 'enrollmentDate', order: 'desc'])
    }
} 