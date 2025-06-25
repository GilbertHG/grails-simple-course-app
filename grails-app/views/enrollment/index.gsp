<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enrollments</title>
</head>
<body>
    <div class="container">
        <h1>Enrollments</h1>
        
        <div class="mb-3">
            <g:link controller="enrollment" action="create" class="btn btn-success">Add New Enrollment</g:link>
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
                        <th>Student</th>
                        <th>Course</th>
                        <th>Enrollment Date</th>
                        <th>Grade</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${enrollments}" var="enrollment">
                        <tr>
                            <td>
                                <g:link controller="student" action="show" id="${enrollment.student.id}">
                                    ${enrollment.student.firstName} ${enrollment.student.lastName}
                                </g:link>
                            </td>
                            <td>
                                <g:link controller="course" action="show" id="${enrollment.course.id}">
                                    ${enrollment.course.courseName}
                                </g:link>
                            </td>
                            <td><g:formatDate date="${enrollment.enrollmentDate}" format="yyyy-MM-dd"/></td>
                            <td>${enrollment.grade ?: 'Not graded'}</td>
                            <td>
                                <g:link controller="enrollment" action="show" id="${enrollment.id}" class="btn btn-sm btn-info">View</g:link>
                                <g:link controller="enrollment" action="delete" id="${enrollment.id}" 
                                        class="btn btn-sm btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this enrollment?')">Delete</g:link>
                            </td>
                        </tr>
                    </g:each>
                    <g:if test="${!enrollments}">
                        <tr>
                            <td colspan="5" class="text-center">No enrollments found</td>
                        </tr>
                    </g:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html> 