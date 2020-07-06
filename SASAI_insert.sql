insert into Student(student_id,student_firstname,student_lastname,`password`) values ('620088317','Derwent','Johnson','password');

insert into Faculty_Info (faculty_id, faculty_name,title, dean_firstname, dean_lastname) values 
('00001','Science and Technology','Prof','Michael','Taylor'), 
('00002','Social Sciences','Prof','David','Tennant'),
('00003','Law','Dr','Shazeeda','Ali'),
('00004','Medical Sciences','Dr','Tomlin','Paul'), 
('00005','Engineering','Dr','Paul','Aiken'), 
('00006','Humanities and Education','Prof','Waibinte','Wariboko'),
('00007','Sport','Dr','Akshai','Mansingh');

insert into Course(course_code, course_name, number_of_credits, level) values('COMP1126','Introduction to Computing I',3,1),('COMP1127','Introduction to Computing II',3,1);

insert into Department_info(Department_id, Dept_name, dept_office_num, dept_email) values 
('COMP','Computing','8767024455','computing@uwimona.edu.jm'),
('GEOG','Geography and Geology','8769272129 ','geoggeol@uwimona.edu.jm'),
('MATH','Mathematics','8769772693','maths@uwimona.edu.jm'),
('PHYS','Physics','8769272480','physics@uwimona.edu.jm'),
('CHEM','Chemistry','8769271910','hodchemistry@uwimona.edu.jm'),
('BIOL','Life Sciences','8769271202','lifesci@uwimona.edu.jm');

insert into Degree_info(degree_id, degree_name, degree_type, elective_credits,incourse_credits, foundation_credits, level_1_credits, advanced_credits, total_credits) 
values ('00012','Computer Science','BSc',21,45,15,30,30,90);

insert into Lecturer(lecturer_id, lecturer_name) values('00021','Dr.Gunjun Mansingh');

insert into Faculty_email(faculty_id, email) values 
('00001','scitech@uwimona.edu.jm'),
('00002','fsocsci@uwimona.edu.jm'),
('00003','monalaw@uwimona.edu.jm');
('00004','medsci@uwimona.edu.jm');
('00005','engineering@uwimona.edu.jm');
('00006','fhe@uwimona.edu.jm');
('00007','sports@uwimona.edu.jm');

insert into Faculty_phone_num(faculty_id, phone_number) values ('620088317','876-977-1785');

insert into Student_email(student_id, email) values ('620088317','kingderwent@gmail.com');

insert into studentcourses(student_id, course_code,Status, grade) values ('620088317','COMP1126','Complete','B+');

insert into registered_faculty(student_id, faculty_id) values ('620088317','00001');

insert into faculty_departments(faculty_id, department_id) values ('00001','COMP'),
('00001','GEOG'),
('00001','MATH'),
('00001','PHYS'),
('00001','CHEM'),
('00001','BIOL');

insert into department_lecturers(department_id, lecturer_id, HOD) values 
('COMP','00021','Dr.Gunjun Mansingh'),
('GEOG','00022','Dr. Donovan Campbell'),
('MATH','00023','Dr. Nagarani Ponakala'),
('PHYS','00024','Dr. Tannecia Stephenson'),
('CHEM','00025','Dr. Roy Porter'),
('BIOL','00026','Dr. Dwight Robinson');

insert into teaches(lecturer_id, course_code) values ('00021','COMP1126');

insert into degree_courses(degree_id, course_code) values ('00012','COMP1126');

insert into department_degrees(department_id, degree_id) values ('COMP','00012');
