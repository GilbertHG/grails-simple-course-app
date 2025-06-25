<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Course Details</title>
</head>
<body>
    <div class="container">
        <h1>Course Details</h1>
        
        <div class="mb-3">
            <g:link controller="course" action="index" class="btn btn-secondary">Back to Courses</g:link>
            <g:link controller="course" action="edit" id="${course.id}" class="btn btn-warning">Edit Course</g:link>
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
                        <h5>Course Information</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Course Name:</strong> ${course.courseName}</p>
                        <p><strong>Credits:</strong> ${course.credits}</p>
                        <p><strong>Instructor:</strong> ${course.instructor}</p>
                        <p><strong>Created:</strong> <g:formatDate date="${course.dateCreated}" format="yyyy-MM-dd HH:mm"/></p>
                        <p><strong>Last Updated:</strong> <g:formatDate date="${course.lastUpdated}" format="yyyy-MM-dd HH:mm"/></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Enrolled Students</h5>
                    </div>
                    <div class="card-body">
                        <g:if test="${enrollments}">
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th>Student</th>
                                        <th>Enrollment Date</th>
                                        <th>Grade</th>
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
                                            <td><g:formatDate date="${enrollment.enrollmentDate}" format="yyyy-MM-dd"/></td>
                                            <td>${enrollment.grade ?: 'Not graded'}</td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </g:if>
                        <g:else>
                            <p>No students enrolled in this course.</p>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 