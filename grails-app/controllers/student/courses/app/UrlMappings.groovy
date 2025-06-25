package student.courses.app

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        // Home page
        "/"(controller: "home", action: "index")
        
        // Student mappings
        "/students"(controller: "student", action: "index")
        "/students/create"(controller: "student", action: "create")
        "/students/$id/edit"(controller: "student", action: "edit")
        "/students/$id"(controller: "student", action: "show")
        
        // Course mappings
        "/courses"(controller: "course", action: "index")
        "/courses/create"(controller: "course", action: "create")
        "/courses/$id/edit"(controller: "course", action: "edit")
        "/courses/$id"(controller: "course", action: "show")
        
        // Enrollment mappings
        "/enrollments"(controller: "enrollment", action: "index")
        "/enrollments/create"(controller: "enrollment", action: "create")
        "/enrollments/$id"(controller: "enrollment", action: "show")

        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
