CREATE TYPE users_roles AS ENUM (
	'ADMIN',
	'TEACHER',
	'STUDENT'
);

CREATE TABLE users (
	userId SERIAL PRIMARY KEY,
	userName CHARACTER VARYING(255) UNIQUE NOT NULL,
	userEmail CHARACTER VARYING(255) UNIQUE NOT NULL,
	userPassword CHARACTER VARYING(255) NOT NULl,
	userRole users_roles NOT NULL,
	CHECK((userName != '') AND (userEmail != '') AND (userPassword != ''))
); 

CREATE TABLE departments (
	departmentId SERIAL PRIMARY KEY,
	departmentName CHARACTER VARYING(255) UNIQUE NOT NULL
);

CREATE TABLE specialities (
	specialityId SERIAL PRIMARY KEY,
	specitialityName CHARACTER VARYING(255) UNIQUE NOT NULL
);

CREATE TABLE teachers (
	teacherId SERIAL PRIMARY KEY,
	teacherName CHARACTER VARYING(255) NOT NULL,
	teacherLoad INT NOT NULL,
	userId INT REFERENCES users(userId),
	departmentId INT REFERENCES departments(departmentId)
);

CREATE TABLE students (
	studentId SERIAL PRIMARY KEY,
	studentName CHARACTER VARYING(255) NOT NULL,
	userId INT REFERENCES users(userId),
	departmentId INT REFERENCES departments(departmentId),
	specialityId INT REFERENCES specialities(specialityId)
);

CREATE TABLE studentsGroups (
	groupId SERIAL PRIMARY KEY,
	groupName CHARACTER VARYING(255) UNIQUE NOT NULL,
	studentId INT REFERENCES students(studentId)
);

CREATE TABLE disciplines (
	disciplineId SERIAL PRIMARY KEY,
	disciplineName CHARACTER VARYING(255) UNIQUE NOT NULL
);

CREATE TABLE disciplines_student (
	studentId INT REFERENCES students(studentId),
	disciplineId INT REFERENCES disciplines(disciplineId)
);

CREATE TABLE educationForm (
	formId SERIAL PRIMARY KEY,
	formName CHARACTER VARYING(255) UNIQUE NOT NULL,
	studentId INT REFERENCES students(studentId)
);