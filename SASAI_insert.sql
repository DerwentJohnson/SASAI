insert into Student(student_id,student_firstname,student_lastname) values ('620088317','Derwent','Johnson');

insert into Faculty_Info (faculty_id, faculty_name, dean_firstname, dean_lastname) values ('00001','Science and Technology','Prof','Michael','Taylor');

insert into Course(course_code, course_name, number_of_credits, level) values('COMP1126','Introduction to Computing I',3,1),('COMP1127','Introduction to Computing II',3,1);

insert into Department_info(Department_id, Dept_name, dept_office_num, dept_email) values ('COMP','Computing','(876) 702-4455','computing@uwimona.edu.jm');

insert into Degree_info(degree_id, degree_name, degree_type, elective_credits,incourse_credits, foundation_credits, level_1_credits, advanced_credits, total_credits) 
values ();

insert into Lecturer(lecturer_id, lecturer_name) values();

insert into Faculty_email(faculty_id, email) values ();

insert into Faculty_phone_num(faculty_id, phone_number) values ();

insert into Student_email(student_id, email) values ();

insert into studentcourses(student_id, course_code,Status, grade) values ();

insert into registered_faculty(student_id, faculty_id) values ();

insert into faculty_departments(faculty_id, department_id) values ();

insert into department_lecturers(department_id, lecturer_id, HOD) values ();

insert into teaches(lecturer_id, course_code) values ();

insert into degree_courses(degree_id, course_code) values ();

insert into department_degrees(department_id, degree_id) values ();