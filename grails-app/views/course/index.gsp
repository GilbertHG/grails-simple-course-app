<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Courses</title>
</head>
<body>
    <div class="container">
        <h1>Courses</h1>
        
        <div class="mb-3">
            <g:link controller="course" action="create" class="btn btn-success">Add New Course</g:link>
            <g:link controller="home" action="index" class="btn btn-secondary">Back to Home</g:link>
        </div>

        <g:if test="${flash.success}">
            <div class="alert alert-success">${flash.success}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Instructor</th>
                        <th>Created Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${courses}" var="course">
                        <tr>
                            <td>${course.courseName}</td>
                            <td>${course.credits}</td>
                            <td>${course.instructor}</td>
                            <td><g:formatDate date="${course.dateCreated}" format="yyyy-MM-dd"/></td>
                            <td>
                                <g:link controller="course" action="show" id="${course.id}" class="btn btn-sm btn-info">View</g:link>
                                <g:link controller="course" action="edit" id="${course.id}" class="btn btn-sm btn-warning">Edit</g:link>
                                <g:link controller="course" action="delete" id="${course.id}" 
                                        class="btn btn-sm btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this course?')">Delete</g:link>
                            </td>
                        </tr>
                    </g:each>
                    <g:if test="${!courses}">
                        <tr>
                            <td colspan="5" class="text-center">No courses found</td>
                        </tr>
                    </g:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html> 