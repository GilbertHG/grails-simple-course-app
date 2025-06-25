<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Student</title>
</head>
<body>
    <div class="container">
        <h1>Edit Student</h1>
        
        <div class="mb-3">
            <g:link controller="student" action="show" id="${student.id}" class="btn btn-info">View Student</g:link>
            <g:link controller="student" action="index" class="btn btn-secondary">Back to Students</g:link>
        </div>

        <g:if test="${flash.success}">
            <div class="alert alert-success">${flash.success}</div>
        </g:if>
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

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Student Information</h5>
                    </div>
                    <div class="card-body">
                        <g:form controller="student" action="update" class="row g-3">
                            <g:hiddenField name="id" value="${student.id}"/>
                            
                            <div class="col-md-6">
                                <label for="firstName" class="form-label">First Name *</label>
                                <g:textField name="firstName" class="form-control" value="${student.firstName}" required="true"/>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="lastName" class="form-label">Last Name *</label>
                                <g:textField name="lastName" class="form-control" value="${student.lastName}" required="true"/>
                            </div>
                            
                            <div class="col-12">
                                <label for="email" class="form-label">Email *</label>
                                <g:textField name="email" type="email" class="form-control" value="${student.email}" required="true"/>
                            </div>
                            
                            <div class="col-12">
                                <label for="enrollmentDate" class="form-label">Enrollment Date *</label>
                                <g:datePicker name="enrollmentDate" value="${student.enrollmentDate}" 
                                             precision="day" class="form-control"/>
                            </div>
                            
                            <div class="col-12">
                                <g:submitButton name="update" value="Update Student" class="btn btn-warning"/>
                            </div>
                        </g:form>
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
                            <h6>Currently Enrolled Courses:</h6>
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th>Course</th>
                                        <th>Credits</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${enrollments}" var="enrollment">
                                        <tr>
                                            <td>${enrollment.course.courseName}</td>
                                            <td>${enrollment.course.credits}</td>
                                            <td>
                                                <g:link controller="student" action="unenroll" 
                                                        params="[enrollmentId: enrollment.id, studentId: student.id]"
                                                        class="btn btn-sm btn-danger"
                                                        onclick="return confirm('Are you sure you want to unenroll from this course?')">
                                                    Unenroll
                                                </g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </g:if>
                        
                        <g:if test="${availableCourses}">
                            <h6 class="mt-3">Available Courses to Enroll:</h6>
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th>Course</th>
                                        <th>Credits</th>
                                        <th>Instructor</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${availableCourses}" var="course">
                                        <tr>
                                            <td>${course.courseName}</td>
                                            <td>${course.credits}</td>
                                            <td>${course.instructor}</td>
                                            <td>
                                                <g:link controller="student" action="enroll" 
                                                        params="[studentId: student.id, courseId: course.id]"
                                                        class="btn btn-sm btn-success">
                                                    Enroll
                                                </g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </g:if>
                        <g:else>
                            <p class="mt-3">No available courses to enroll in.</p>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 