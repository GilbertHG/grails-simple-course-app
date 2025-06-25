<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Student</title>
</head>
<body>
    <div class="container">
        <h1>Create Student</h1>
        
        <div class="mb-3">
            <g:link controller="student" action="index" class="btn btn-secondary">Back to Students</g:link>
        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <g:hasErrors bean="${student}">
            <div class="alert alert-danger">
                <ul>
                    <g:eachError bean="${student}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <div class="card">
            <div class="card-body">
                <g:form controller="student" action="save" class="row g-3">
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name *</label>
                        <g:textField name="firstName" class="form-control" value="${student?.firstName}" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name *</label>
                        <g:textField name="lastName" class="form-control" value="${student?.lastName}" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email *</label>
                        <g:textField name="email" type="email" class="form-control" value="${student?.email}" required="true"/>
                    </div>
                    
                    <div class="col-md-6">
                        <label for="enrollmentDate" class="form-label">Enrollment Date *</label>
                        <g:datePicker name="enrollmentDate" value="${student?.enrollmentDate ?: new Date()}" 
                                     precision="day" class="form-control"/>
                    </div>
                    
                    <div class="col-12">
                        <g:submitButton name="save" value="Create Student" class="btn btn-success"/>
                        <g:link controller="student" action="index" class="btn btn-secondary">Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</body>
</html> 