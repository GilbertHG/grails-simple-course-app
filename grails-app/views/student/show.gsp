<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Student Details</title>
</head>
<body>
    <div class="container">
        <h1>Student Details</h1>
        
        <div class="mb-3">
            <g:link controller="student" action="index" class="btn btn-secondary">Back to Students</g:link>
            <g:link controller="student" action="edit" id="${student.id}" class="btn btn-warning">Edit Student</g:link>
        </div>

        <g:if test="${flash.success}">
            <div class="alert alert-success">${flash.success}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Student Information</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Name:</strong> ${student.firstName} ${student.lastName}</p>
                        <p><strong>Email:</strong> ${student.email}</p>
                        <p><strong>Enrollment Date:</strong> <g:formatDate date="${student.enrollmentDate}" format="yyyy-MM-dd"/></p>
                        <p><strong>Created:</strong> <g:formatDate date="${student.dateCreated}" format="yyyy-MM-dd HH:mm"/></p>
                        <p><strong>Last Updated:</strong> <g:formatDate date="${student.lastUpdated}" format="yyyy-MM-dd HH:mm"/></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Course Enrollments</h5>
                    </div>
                    <div class="card-body">
                        <g:if test="${enrollments}">
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th>Course</th>
                                        <th>Enrollment Date</th>
                                        <th>Grade</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${enrollments}" var="enrollment">
                                        <tr>
                                            <td>
                                                <g:link controller="course" action="show" id="${enrollment.course.id}">
                                                    ${enrollment.course.courseName}
                                                </g:link>
                                            </td>
                                            <td><g:formatDate date="${enrollment.enrollmentDate}" format="yyyy-MM-dd"/></td>
                                            <td>${enrollment.grade ?: 'Not graded'}</td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </g:if>
                        <g:else>
                            <p>No course enrollments found.</p>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 