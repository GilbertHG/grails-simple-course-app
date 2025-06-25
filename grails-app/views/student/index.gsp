<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Students</title>
</head>
<body>
    <div class="container">
        <h1>Students</h1>
        
        <div class="mb-3">
            <g:link controller="student" action="create" class="btn btn-success">Add New Student</g:link>
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
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Enrollment Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${students}" var="student">
                        <tr>
                            <td>${student.firstName}</td>
                            <td>${student.lastName}</td>
                            <td>${student.email}</td>
                            <td><g:formatDate date="${student.enrollmentDate}" format="yyyy-MM-dd"/></td>
                            <td>
                                <g:link controller="student" action="show" id="${student.id}" class="btn btn-sm btn-info">View</g:link>
                                <g:link controller="student" action="edit" id="${student.id}" class="btn btn-sm btn-warning">Edit</g:link>
                                <g:link controller="student" action="delete" id="${student.id}" 
                                        class="btn btn-sm btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this student?')">Delete</g:link>
                            </td>
                        </tr>
                    </g:each>
                    <g:if test="${!students}">
                        <tr>
                            <td colspan="5" class="text-center">No students found</td>
                        </tr>
                    </g:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html> 