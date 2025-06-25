<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Enrollment</title>
</head>
<body>
    <div class="container">
        <h1>Create Enrollment</h1>
        
        <div class="mb-3">
            <g:link controller="enrollment" action="index" class="btn btn-secondary">Back to Enrollments</g:link>
        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <g:hasErrors bean="${enrollment}">
            <div class="alert alert-danger">
                <ul>
                    <g:eachError bean="${enrollment}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <div class="card">
            <div class="card-body">
                <g:form controller="enrollment" action="save" class="row g-3">
                    <div class="col-md-6">
                        <label for="studentId" class="form-label">Student *</label>
                        <g:select name="studentId" from="${students}" 
                                 optionKey="id" 
                                 optionValue="${{it.firstName + ' ' + it.lastName + ' (' + it.email + ')'}}"
                                 noSelection="['': 'Select a student...']"
                                 class="form-control" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="courseId" class="form-label">Course *</label>
                        <g:select name="courseId" from="${courses}" 
                                 optionKey="id" 
                                 optionValue="${{it.courseName + ' (' + it.credits + ' credits)'}}"
                                 noSelection="['': 'Select a course...']"
                                 class="form-control" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="enrollmentDate" class="form-label">Enrollment Date *</label>
                        <g:datePicker name="enrollmentDate" value="${enrollment?.enrollmentDate ?: new Date()}" 
                                     precision="day" class="form-control"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="grade" class="form-label">Grade (0-100, optional)</label>
                        <g:textField name="grade" type="number" class="form-control" 
                                     value="${enrollment?.grade}" 
                                     min="0" max="100" step="0.01"/>
                    </div>
                    
                    <div class="col-12">
                        <g:submitButton name="save" value="Create Enrollment" class="btn btn-success"/>
                        <g:link controller="enrollment" action="index" class="btn btn-secondary">Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</body>
</html> 