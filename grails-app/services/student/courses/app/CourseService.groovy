package student.courses.app

import request.CreateCourseRequest
import request.UpdateCourseRequest
import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    List<Course> getAllCourses() {
        return Course.list(sort: "courseName")
    }

    Course getCourseById(Long id) {
        return Course.get(id)
    }

    Course createCourse(CreateCourseRequest request) {
        Course course = new Course()
        course.courseName = request.courseName
        course.credits = request.credits
        course.instructor = request.instructor
        
        if (!course.save(flush: true)) {
            throw new RuntimeException("Failed to save course: ${course.errors}")
        }
        
        return course
    }

    Course updateCourse(UpdateCourseRequest request) {
        Course course = Course.get(request.id)
        if (!course) {
            throw new RuntimeException("Course not found with id: ${request.id}")
        }
        
        course.courseName = request.courseName
        course.credits = request.credits
        course.instructor = request.instructor
        
        if (!course.save(flush: true)) {
            throw new RuntimeException("Failed to update course: ${course.errors}")
        }
        
        return course
    }

    void deleteCourse(Long id) {
        Course course = Course.get(id)
        if (!course) {
            throw new RuntimeException("Course not found with id: ${id}")
        }
        
        // Remove all enrollments first
        Enrollment.findAllByCourse(course).each { enrollment ->
            enrollment.delete(flush: true)
        }
        
        course.delete(flush: true)
    }
} 