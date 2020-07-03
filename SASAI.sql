Drop database if exists sasai;

create database sasai;

use sasai;

Create table Student(student_id char(11), student_firstname varchar(30), student_lastname varchar(30), primary key(student_id));

Create table Faculty_Info (faculty_id char(5), faculty_name varchar(75),title enum('Prof','Dr','Mrs','Mr'), dean_firstname varchar(30), dean_lastname varchar(30), primary key(faculty_id));


Create table Course(course_code char(8), course_name varchar(50), number_of_credits int, level char(1), primary key(course_code));


Create table Department_info(Department_id char(4), Dept_name varchar(100), dept_office_num char(10), dept_email varchar(100), primary key(Department_id));

Create table Degree_info(degree_id varchar(10), degree_name varchar(100), degree_type varchar(5), elective_credits int,
 incourse_credits int, foundation_credits int, level_1_credits int, advanced_credits int, total_credits int, primary key(degree_id));

Create table Lecturer(lecturer_id char(10), lecturer_name varchar(50), primary key(lecturer_id));

Create table Faculty_email(faculty_id char(5), email varchar(100), primary key(faculty_id), foreign key(faculty_id) references Faculty_Info(faculty_id));

Create table Faculty_phone_num(faculty_id char(5), phone_number varchar(10), primary key(faculty_id), foreign key(faculty_id) references Faculty_Info(faculty_id));

Create table Student_email(student_id char(11), email varchar(100), primary key(student_id), foreign key(student_id) references Student(student_id));

create table studentcourses(student_id char(11), course_code char(8),Status enum('Pass','fail','pending'), grade int(3),primary key(student_id,course_code),
 foreign key(student_id) references Student(student_id), foreign key(course_code) references course(course_code));
 
 create table registered_faculty(student_id char(11), faculty_id char(5), primary key(student_id,faculty_id),
 foreign key(student_id) references Student(student_id), foreign key(faculty_id) references faculty_info(faculty_id));
 
 create table faculty_departments(faculty_id char(5), department_id char(4), primary key(faculty_id,department_id)
 , foreign key(faculty_id) references faculty_info(faculty_id), foreign key(department_id) references department_info(department_id));
 
 create table department_lecturers(department_id char(4), lecturer_id char(10), HOD boolean, primary key(department_info,lecturer_id),
 foreign key(department_id) references department_info(department_id), foreign key(lecturer_id) references lecturer(lecturer_id));
 
 create table teaches(lecturer_id char(10), course_code char(8), primary key(lecturer_id,course_code),
 foreign key(lecturer_id) references lecturer(lecturer_id), foreign key(course_code) references course(course_code));
 
 create table degree_courses(degree_id varchar(10), course_code char(8), primary key(degree_id,course_code)
 , foreign key(course_code) references course(course_code), foreign key(degree_id) references degree_info(degree_id));
 
 create table department_degrees(department_id char(4), degree_id varchar(10), foreign key(department_id) references department_info(department_id), 
 foreign key(degree_id) references degree_info(degree_id))
-- select * from student;
-- describe faculty_info;
-- select * from faculty_info;