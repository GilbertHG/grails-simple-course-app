package student.courses.app

import request.CreateStudentRequest
import request.UpdateStudentRequest
import grails.gorm.transactions.Transactional

@Transactional
class StudentService {

    List<Student> getAllStudents() {
        return Student.list(sort: "lastName")
    }

    Student getStudentById(Long id) {
        return Student.get(id)
    }

    Student createStudent(CreateStudentRequest request) {
        Student student = new Student()
        student.firstName = request.firstName
        student.lastName = request.lastName
        student.email = request.email
        student.enrollmentDate = request.enrollmentDate
        
        if (!student.save(flush: true)) {
            throw new RuntimeException("Failed to save student: ${student.errors}")
        }
        
        return student
    }

    Student updateStudent(UpdateStudentRequest request) {
        Student student = Student.get(request.id)
        if (!student) {
            throw new RuntimeException("Student not found with id: ${request.id}")
        }
        
        student.firstName = request.firstName
        student.lastName = request.lastName
        student.email = request.email
        student.enrollmentDate = request.enrollmentDate
        
        if (!student.save(flush: true)) {
            throw new RuntimeException("Failed to update student: ${student.errors}")
        }
        
        return student
    }

    void deleteStudent(Long id) {
        Student student = Student.get(id)
        if (!student) {
            throw new RuntimeException("Student not found with id: ${id}")
        }
        
        // Remove all enrollments first
        Enrollment.findAllByStudent(student).each { enrollment ->
            enrollment.delete(flush: true)
        }
        
        student.delete(flush: true)
    }

    List<Course> getAvailableCoursesForStudent(Long studentId) {
        Student student = Student.get(studentId)
        if (!student) {
            return []
        }
        
        List<Long> enrolledCourseIds = Enrollment.findAllByStudent(student)*.course*.id
        
        if (enrolledCourseIds) {
            return Course.createCriteria().list {
                not {
                    'in'('id', enrolledCourseIds)
                }
                order('courseName', 'asc')
            }
        } else {
            return Course.list(sort: 'courseName')
        }
    }
} 