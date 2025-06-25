package student.courses.app

import request.CreateCourseRequest
import request.UpdateCourseRequest

class CourseController {

    CourseService courseService
    EnrollmentService enrollmentService

    def index() {
        List<Course> courses = courseService.getAllCourses()
        [courses: courses]
    }

    def show(Long id) {
        Course course = courseService.getCourseById(id)
        if (!course) {
            flash.error = "Course not found"
            redirect(action: "index")
            return
        }
        
        List<Enrollment> enrollments = enrollmentService.getEnrollmentsByCourse(id)
        [course: course, enrollments: enrollments]
    }

    def create() {
        [course: new Course()]
    }

    def save(CreateCourseRequest request) {
        if (!request.validate()) {
            respond request.errors, view: 'create'
            return
        }

        try {
            Course course = courseService.createCourse(request)
            flash.success = "Course created successfully"
            redirect(action: "show", id: course.id)
        } catch (Exception e) {
            flash.error = "Error creating course: ${e.message}"
            respond request.errors, view: 'create'
        }
    }

    def edit(Long id) {
        Course course = courseService.getCourseById(id)
        if (!course) {
            flash.error = "Course not found"
            redirect(action: "index")
            return
        }
        [course: course]
    }

    def update(UpdateCourseRequest request) {
        if (!request.validate()) {
            Course course = courseService.getCourseById(request.id)
            respond request.errors, view: 'edit', model: [course: course]
            return
        }

        try {
            Course course = courseService.updateCourse(request)
            flash.success = "Course updated successfully"
            redirect(action: "show", id: course.id)
        } catch (Exception e) {
            flash.error = "Error updating course: ${e.message}"
            Course course = courseService.getCourseById(request.id)
            respond request.errors, view: 'edit', model: [course: course]
        }
    }

    def delete(Long id) {
        try {
            courseService.deleteCourse(id)
            flash.success = "Course deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting course: ${e.message}"
        }
        redirect(action: "index")
    }
} 