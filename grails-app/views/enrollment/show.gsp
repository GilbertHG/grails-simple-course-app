<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Enrollment Details</title>
</head>
<body>
    <div class="container">
        <h1>Enrollment Details</h1>
        
        <div class="mb-3">
            <g:link controller="enrollment" action="index" class="btn btn-secondary">Back to Enrollments</g:link>
        </div>

        <g:if test="${flash.success}">
            <div class="alert alert-success">${flash.success}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5>Enrollment Information</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Student:</strong> 
                            <g:link controller="student" action="show" id="${enrollment.student.id}">
                                ${enrollment.student.firstName} ${enrollment.student.lastName}
                            </g:link>
                        </p>
                        <p><strong>Course:</strong> 
                            <g:link controller="course" action="show" id="${enrollment.course.id}">
                                ${enrollment.course.courseName}
                            </g:link>
                        </p>
                        <p><strong>Instructor:</strong> ${enrollment.course.instructor}</p>
                        <p><strong>Credits:</strong> ${enrollment.course.credits}</p>
                        <p><strong>Enrollment Date:</strong> <g:formatDate date="${enrollment.enrollmentDate}" format="yyyy-MM-dd"/></p>
                        <p><strong>Current Grade:</strong> ${enrollment.grade ?: 'Not graded'}</p>
                        <p><strong>Created:</strong> <g:formatDate date="${enrollment.dateCreated}" format="yyyy-MM-dd HH:mm"/></p>
                        <p><strong>Last Updated:</strong> <g:formatDate date="${enrollment.lastUpdated}" format="yyyy-MM-dd HH:mm"/></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Update Grade</h5>
                    </div>
                    <div class="card-body">
                        <g:form controller="enrollment" action="updateGrade">
                            <g:hiddenField name="id" value="${enrollment.id}"/>
                            
                            <div class="mb-3">
                                <label for="grade" class="form-label">Grade (0-100)</label>
                                <g:textField name="grade" type="number" class="form-control" 
                                             value="${enrollment.grade}" 
                                             min="0" max="100" step="0.01"/>
                            </div>
                            
                            <g:submitButton name="updateGrade" value="Update Grade" class="btn btn-primary"/>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 