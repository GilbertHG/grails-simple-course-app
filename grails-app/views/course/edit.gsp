<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Course</title>
</head>
<body>
    <div class="container">
        <h1>Edit Course</h1>
        
        <div class="mb-3">
            <g:link controller="course" action="show" id="${course.id}" class="btn btn-info">View Course</g:link>
            <g:link controller="course" action="index" class="btn btn-secondary">Back to Courses</g:link>
        </div>

        <g:if test="${flash.success}">
            <div class="alert alert-success">${flash.success}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <g:hasErrors bean="${course}">
            <div class="alert alert-danger">
                <ul>
                    <g:eachError bean="${course}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <div class="card">
            <div class="card-body">
                <g:form controller="course" action="update" class="row g-3">
                    <g:hiddenField name="id" value="${course.id}"/>
                    
                    <div class="col-md-6">
                        <label for="courseName" class="form-label">Course Name *</label>
                        <g:textField name="courseName" class="form-control" value="${course.courseName}" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="credits" class="form-label">Credits *</label>
                        <g:textField name="credits" type="number" class="form-control" value="${course.credits}" min="0" required="true"/>
                    </div>
                    
                    <div class="col-12">
                        <label for="instructor" class="form-label">Instructor *</label>
                        <g:textField name="instructor" class="form-control" value="${course.instructor}" required="true"/>
                    </div>
                    
                    <div class="col-12">
                        <g:submitButton name="update" value="Update Course" class="btn btn-warning"/>
                        <g:link controller="course" action="show" id="${course.id}" class="btn btn-secondary">Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</body>
</html> 