# User Driven Operations - API Testing Guide

## Project Overview

**User Driven Operations** is a Spring Boot 3.x REST API application built with **Java 17** for managing project and entity definitions. It provides tools for creating and managing Spring Boot projects with entity definitions, fields, and CRUD operations.

### Key Features
- **Project Management** - Create, read, update, and delete project definitions
- **Entity Management** - Define entities with fields and operations
- **Code Generation** - Auto-generate Spring Boot project code
- **Project Export** - Download generated projects as ZIP files

---

## Technology Stack

| Technology | Version |
|-----------|---------|
| Java | 17 LTS |
| Spring Boot | 3.x |
| Build Tool | Maven 3.6+ |
| Testing | JUnit 5, Mockito |
| Database | H2 (In-Memory) |
| API Client | Postman |

---

## Prerequisites

### Required Software
- **Java 17 LTS** or higher
- **Maven 3.6** or higher
- **Postman** (latest version)

### Verify Installation
\`\`\`bash
java -version
# Should show: openjdk version "17" or higher

mvn -version
# Should show: Apache Maven 3.6.0 or higher
\`\`\`

---

## Getting Started

### 1. Build the Project
\`\`\`bash
mvn clean install
\`\`\`

### 2. Run the Application
\`\`\`bash
mvn spring-boot:run
\`\`\`

Application will start on: `http://localhost:8081`

### 3. Verify Application
\`\`\`bash
curl http://localhost:8081/api/projects
\`\`\`

---

## Running Tests

### Run All Tests
\`\`\`bash
mvn test
\`\`\`

### Run Specific Test Class
\`\`\`bash
mvn test -Dtest=ProjectDefinitionControllerTest
mvn test -Dtest=EntityDefinitionControllerTest
mvn test -Dtest=ProjectDefinitionServiceImplTest
mvn test -Dtest=EntityDefinitionServiceImplTest
\`\`\`

### Run Specific Test Method
\`\`\`bash
mvn test -Dtest=ProjectDefinitionControllerTest#testCreateProjectSuccess
\`\`\`

### Expected Output
\`\`\`
[INFO] Tests run: 45
[INFO] Failures: 0
[INFO] Skipped: 0
[INFO] BUILD SUCCESS
\`\`\`

---

## API Collection for Postman

### Import Collection

1. Open Postman
2. Click **Import** (top-left)
3. Select **Upload Files**
4. Choose `postman_collection.json`
5. Click **Import**

### Configure Environment

1. Click **Environments** (left sidebar)
2. Click **Create**
3. Name: `Local Development`
4. Add Variables:

| Variable | Value |
|----------|-------|
| `base_url` | `http://localhost:8081/api` |
| `project_id` | `1` |
| `entity_id` | `1` |

5. Select this environment from top-right dropdown

---

## API Endpoints Overview

### Project Management (8 Endpoints)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/projects` | Create new project |
| GET | `/projects` | Get all projects |
| GET | `/projects/{id}` | Get project by ID |
| GET | `/projects/{id}/details` | Get project with entities |
| PUT | `/projects/{id}` | Update project |
| DELETE | `/projects/{id}` | Delete project |
| POST | `/projects/{id}/generate` | Generate project code |
| GET | `/projects/{id}/download` | Download as ZIP |

### Entity Management (6 Endpoints)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/projects/{projectId}/entities` | Create entity |
| GET | `/projects/{projectId}/entities` | Get all entities |
| GET | `/projects/{projectId}/entities/{id}` | Get entity by ID |
| GET | `/projects/{projectId}/entities/{id}/details` | Get entity details |
| PUT | `/projects/{projectId}/entities/{id}` | Update entity |
| DELETE | `/projects/{projectId}/entities/{id}` | Delete entity |

---

## Example API Requests

### Create Project
\`\`\`json
POST /api/projects
Content-Type: application/json

{
  "name": "E-Commerce Platform",
  "packageName": "com.ecommerce.app",
  "description": "Online shopping platform",
  "securityEnabled": true
}
\`\`\`

**Response (201):**
\`\`\`json
{
  "id": 1,
  "name": "E-Commerce Platform",
  "packageName": "com.ecommerce.app",
  "description": "Online shopping platform",
  "securityEnabled": true
}
\`\`\`

### Create Entity
\`\`\`json
POST /api/projects/1/entities
Content-Type: application/json

{
  "name": "User",
  "pluralName": "Users",
  "description": "User entity",
  "fields": [
    {
      "name": "id",
      "type": "Long",
      "required": true
    },
    {
      "name": "email",
      "type": "String",
      "required": true
    }
  ],
  "operations": [
    {"operationType": "CREATE"},
    {"operationType": "READ"},
    {"operationType": "UPDATE"},
    {"operationType": "DELETE"}
  ]
}
\`\`\`

### Get All Projects
\`\`\`
GET /api/projects
\`\`\`

### Get Project with Entities
\`\`\`
GET /api/projects/1/details
\`\`\`

### Update Project
\`\`\`json
PUT /api/projects/1
Content-Type: application/json

{
  "name": "E-Commerce Platform v2",
  "description": "Updated platform"
}
\`\`\`

### Delete Project
\`\`\`
DELETE /api/projects/1
\`\`\`

---

## Testing Workflow

### Step 1: Create Project
1. Open Postman
2. Select "Create Project" request
3. Click **Send**
4. Copy `id` from response
5. Update `project_id` environment variable

### Step 2: Create Entity
1. Select "Create Entity" request
2. Update `project_id` in URL
3. Click **Send**
4. Copy `id` from response
5. Update `entity_id` environment variable

### Step 3: Test Read Operations
- Get All Projects
- Get Project by ID
- Get Project with Entities
- Get All Entities
- Get Entity by ID
- Get Entity with Details

### Step 4: Test Update Operations
- Update Project
- Update Entity

### Step 5: Test Generation
- Generate Project
- Download Project

### Step 6: Cleanup
- Delete Entity
- Delete Project

---

## Postman Collection Structure

\`\`\`
📦 User Driven Operations API
├── 📁 Project Management
│   ├── POST Create Project
│   ├── GET All Projects
│   ├── GET Get Project by ID
│   ├── GET Get Project with Entities
│   ├── PUT Update Project
│   ├── DELETE Delete Project
│   ├── POST Generate Project
│   └── GET Download Project
└── 📁 Entity Management
    ├── POST Create Entity
    ├── GET All Entities
    ├── GET Get Entity by ID
    ├── GET Get Entity with Details
    ├── PUT Update Entity
    └── DELETE Delete Entity
\`\`\`

---

## Test Coverage

### Controllers (28 Test Methods)
✅ CRUD operations validation  
✅ Error handling (400, 404, 500)  
✅ Project generation and download  
✅ Entity creation with fields/operations  

### Services (21 Test Methods)
✅ Business logic validation  
✅ Duplicate name prevention  
✅ Relationship management  
✅ Data persistence  

---

## Troubleshooting

### Port 8080 Already in Use
\`\`\`bash
# Change port in application.properties
server.port=8081

# Or kill process
# Windows:
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# Mac/Linux:
lsof -ti :8080 | xargs kill -9
\`\`\`

### Tests Fail
\`\`\`bash
mvn clean install
mvn test -X
\`\`\`

### Postman Collection Not Working
1. Verify application is running
2. Check environment variables
3. Test endpoint manually:
\`\`\`bash
curl http://localhost:8081/api/projects
\`\`\`

### 404 Errors
1. Check application logs
2. Verify `base_url` environment variable
3. Ensure endpoint paths are correct

---

## Quick Commands

\`\`\`bash
# Build
mvn clean install

# Run
mvn spring-boot:run

# Test
mvn test

# Specific test
mvn test -Dtest=ProjectDefinitionControllerTest

# With coverage
mvn test jacoco:report
\`\`\`

---

## File Structure

\`\`\`
src/
├── main/java/com/user/driven/operations/
│   ├── controller/
│   │   ├── ProjectDefinitionController.java
│   │   └── EntityDefinitionController.java
│   ├── service/
│   ├── serviceimpl/
│   ├── dto/
│   ├── entities/
│   └── repositories/
└── test/java/com/user/driven/operations/
    ├── controller/ (Controller Tests)
    └── serviceimpl/ (Service Tests)
\`\`\`

---

## Support

For issues:
1. Check application logs
2. Review test output
3. Verify all prerequisites are installed
4. Check database configuration

---

**Java Version**: 17 LTS  
**Last Updated**: November 2025  
**Status**: Ready for Testing
