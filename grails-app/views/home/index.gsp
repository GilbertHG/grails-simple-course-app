<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Student Courses Management System</title>
</head>
<body>
    <div class="container">
        <h1>Student Courses Management System</h1>
        <p class="lead">Welcome to the Student Courses Management System. Choose an option below to get started.</p>
        
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Students</h5>
                        <p class="card-text">Manage student information and enrollments.</p>
                        <g:link controller="student" action="index" class="btn btn-primary">View Students</g:link>
                        <g:link controller="student" action="create" class="btn btn-success">Add Student</g:link>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Courses</h5>
                        <p class="card-text">Manage course information and details.</p>
                        <g:link controller="course" action="index" class="btn btn-primary">View Courses</g:link>
                        <g:link controller="course" action="create" class="btn btn-success">Add Course</g:link>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Enrollments</h5>
                        <p class="card-text">View and manage student course enrollments.</p>
                        <g:link controller="enrollment" action="index" class="btn btn-primary">View Enrollments</g:link>
                        <g:link controller="enrollment" action="create" class="btn btn-success">New Enrollment</g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 