# Student Courses Management System

A simple Grails web application for managing students, courses, and student course enrollments.

## Features

- **Student Management**: Create, view, edit, and delete students
- **Course Management**: Create, view, edit, and delete courses  
- **Enrollment Management**: Enroll students in courses, view enrollments, and manage grades
- **Interactive UI**: Modern Bootstrap-based user interface
- **MySQL Integration**: Production-ready database configuration

## Technical Stack

- **Framework**: Grails 6.2.4
- **Language**: Groovy
- **Database**: MySQL 8.0 (development/production), H2 (testing)
- **ORM**: GORM (Grails Object Relational Mapping)
- **Frontend**: GSP (Grails Server Pages) with Bootstrap 5
- **Build Tool**: Gradle

## Architecture

The application follows Grails best practices:
- **Domain Classes**: `Student`, `Course`, `Enrollment`
- **Service Layer**: All business logic is in service classes (`StudentService`, `CourseService`, `EnrollmentService`)
- **Controllers**: Handle HTTP requests and delegate to services
- **Request Classes**: Type-safe request handling for POST operations
- **Views**: GSP templates with responsive Bootstrap styling

## Prerequisites

- Java 11 or higher
- MySQL 8.0
- Git

## Database Setup

1. **Install MySQL 8.0** and ensure it's running on port 3307
2. **Create the database**:
   ```sql
   CREATE DATABASE student_courses;
   ```
3. **Create a MySQL user** (optional, or use root):
   ```sql
   CREATE USER 'grails_user'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON student_courses.* TO 'grails_user'@'localhost';
   FLUSH PRIVILEGES;
   ```
4. **Update database credentials** in `grails-app/conf/application.yml` if needed

## Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd student-courses-app
   ```

2. **Make gradlew executable**:
   ```bash
   chmod +x gradlew
   ```

3. **Run the application**:
   ```bash
   ./gradlew bootRun
   ```

4. **Access the application**:
   Open your browser to `http://localhost:8080`

## Sample Data

The application automatically loads sample data on first startup:
- 5 sample students
- 5 sample courses
- 10 sample enrollments (some with grades, some without)

## Application Features

### Home Page
- Navigation dashboard with quick access to all sections
- Clean, modern interface with Bootstrap cards

### Student Management
- **List View**: Display all students with basic information
- **Detail View**: Complete student information with enrolled courses
- **Create/Edit**: Forms for adding and updating student information
- **Enrollment Management**: Enroll/unenroll students from courses directly in edit view

### Course Management
- **List View**: Display all courses with instructor and credit information
- **Detail View**: Course information with list of enrolled students
- **Create/Edit**: Forms for adding and updating course information

### Enrollment Management
- **List View**: Display all enrollments with student-course relationships
- **Detail View**: Complete enrollment information with grade management
- **Create**: Form to create new enrollments
- **Grade Management**: Update grades for existing enrollments

## API Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET | `/` | Home page |
| GET | `/students` | List all students |
| GET | `/students/{id}` | Show student details |
| GET | `/students/create` | Create student form |
| POST | `/students/save` | Save new student |
| GET | `/students/{id}/edit` | Edit student form |
| POST | `/students/update` | Update student |
| GET | `/students/delete/{id}` | Delete student |
| GET | `/courses` | List all courses |
| GET | `/courses/{id}` | Show course details |
| GET | `/courses/create` | Create course form |
| POST | `/courses/save` | Save new course |
| GET | `/courses/{id}/edit` | Edit course form |
| POST | `/courses/update` | Update course |
| GET | `/courses/delete/{id}` | Delete course |
| GET | `/enrollments` | List all enrollments |
| GET | `/enrollments/{id}` | Show enrollment details |
| GET | `/enrollments/create` | Create enrollment form |
| POST | `/enrollments/save` | Save new enrollment |
| POST | `/enrollments/updateGrade` | Update enrollment grade |
| GET | `/enrollments/delete/{id}` | Delete enrollment |

## Development

### Project Structure
```
student-courses-app/
├── grails-app/
│   ├── conf/
│   │   └── application.yml          # Configuration
│   ├── controllers/                 # HTTP request handlers
│   ├── domain/                      # Domain classes (Student, Course, Enrollment)
│   ├── models/request/              # Request validation classes
│   ├── services/                    # Business logic layer
│   ├── views/                       # GSP templates
│   └── init/
│       └── BootStrap.groovy         # Sample data initialization
├── src/
│   ├── main/groovy/                 # Additional Groovy source
│   └── test/groovy/                 # Test classes
└── build.gradle                     # Build configuration
```

### Running Tests
```bash
./gradlew test
```

### Building for Production
```bash
./gradlew assemble
```

### Database Migration
The application uses `dbCreate: update` in development, so database schema changes are automatically applied.

## Configuration

### Environment-specific Configuration
- **Development**: MySQL on localhost:3307
- **Test**: H2 in-memory database
- **Production**: MySQL (configure connection details in application.yml)

### Key Configuration Files
- `grails-app/conf/application.yml`: Database and application configuration
- `build.gradle`: Dependencies and build configuration
- `grails-app/init/BootStrap.groovy`: Sample data initialization

## Troubleshooting

### Common Issues

1. **MySQL Connection Error**: 
   - Verify MySQL is running on port 3307
   - Check database credentials in `application.yml`
   - Ensure database `student_courses` exists

2. **Build Errors**:
   - Run `./gradlew clean` then `./gradlew bootRun`
   - Check Java version (should be 11+)

3. **Port Already in Use**:
   - Change port in `application.yml` under `server.port`
   - Or kill process using port 8080

### Logging
Application logs are available in the console when running with `./gradlew bootRun`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is for educational purposes.

## Contact

For questions or support regarding this educational project, please contact the development team.

## Grails 6.2.3 Documentation

- [User Guide](https://docs.grails.org/6.2.3/guide/index.html)
- [API Reference](https://docs.grails.org/6.2.3/api/index.html)
- [Grails Guides](https://guides.grails.org/index.html)
---

## Feature scaffolding documentation

- [Grails Scaffolding Plugin documentation](https://grails.github.io/scaffolding/latest/groovydoc/)

- [https://grails-fields-plugin.github.io/grails-fields/latest/guide/index.html](https://grails-fields-plugin.github.io/grails-fields/latest/guide/index.html)

## Feature geb documentation

- [Grails Geb Functional Testing for Grails documentation](https://github.com/grails3-plugins/geb#readme)

- [https://www.gebish.org/manual/current/](https://www.gebish.org/manual/current/)

## Feature asset-pipeline-grails documentation

- [Grails Asset Pipeline Core documentation](https://www.asset-pipeline.com/manual/)

