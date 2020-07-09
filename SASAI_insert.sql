insert into Student(student_id,student_firstname,student_lastname,`password`) values 
('620088317','Derwent','Johnson','password'),
('620110310','Onesha','Sappleton','Osappleton'),
('620107770','Dana','Campbell','Dcampbell'),
('620111723','Nicholas','McKenzie','something');

insert into Faculty_Info (faculty_id, faculty_name,title, dean_firstname, dean_lastname) values 
('00001','Science and Technology','Prof','Michael','Taylor'), 
('00002','Social Sciences','Prof','David','Tennant'),
('00003','Law','Dr','Shazeeda','Ali'),
('00004','Medical Sciences','Dr','Tomlin','Paul'), 
('00005','Engineering','Dr','Paul','Aiken'), 
('00006','Humanities and Education','Prof','Waibinte','Wariboko'),
('00007','Sport','Dr','Akshai','Mansingh');

insert into Course(course_code, course_name, number_of_credits, level) values
('COMP1126','Introduction to Computing I',3,1),
('COMP1127','Introduction to Computing II',3,1),
('COMP1161','Object-oriented Programming',3,1),
('COMP1210','Math for Computing',3,1),
('COMP2201','Discrete Mathematics for Computer Science',3,2),
('COMP2211','Analysis of Algorithms',3,2),
('COMP2140','Software Engineering',3,2),
('COMP2170','Object Oriented Design and Implementation',3,2),
('COMP2190','Net-Centric Computing',3,2),
('COMP2340','Computer Organisation',3,2),
('COMP3101','Operating Systems',3,3),
('COMP3220','Introduction to Artificial Intelligence',3,3),
('COMP3161','Database Management Systems',3,3),
('COMP3901','Group Project',3,3),
('BIOL1017','Cell Biology',3,1),
('CHEM1901','Introductory Chemistry A',3,1),
('GEOG1232','Earth Environments 2: Climate & The Biosphere',3,2),
('MATH2410','A First Course in Linear Algebra',3,2),
('PHYS1422','Modern Physics',3,1);

insert into Department_info(Department_id, Dept_name, dept_office_num, dept_email) values 
('COMP','Computing','876-702-4455','computing@uwimona.edu.jm'),
('GEOG','Geography and Geology','876-927-2129 ','geoggeol@uwimona.edu.jm'),
('MATH','Mathematics','876-977-2693','maths@uwimona.edu.jm'),
('PHYS','Physics','876-927-2480','physics@uwimona.edu.jm'),
('CHEM','Chemistry','876-927-1910','hodchemistry@uwimona.edu.jm'),
('BIOL','Life Sciences','876-927-1202','lifesci@uwimona.edu.jm');

insert into Degree_info(degree_id, degree_name, degree_type, elective_credits,incourse_credits, foundation_credits, level_1_credits, advanced_credits, total_credits) 
values 
('00012','Major in Computer Science','B.Sc',21,45,15,30,30,90),
('00013','Major in Biochemistry','B.Sc',0,0,0,22,32,54),
('00014','Minor General Physics','B.Sc',9,18,9,18,18,73),
('00015','Minor in Mathematics of Finance','B.Sc',9,33,9,33,33,99),
('00016','Major in Geography','B.Sc',21,45,15,30,30,90),
('00017','Major in Enviornmental Biology','B.Sc',21,45,15,30,30,90);

insert into Lecturer(lecturer_id, lecturer_name) values
('00021','Dr. Gunjun Mansingh'),
('00022','Dr. Donovan Campbell'),
('00023','Dr. Nagarani Ponakala'),
('00024','Dr. Tannecia Stephenson'),
('00025','Dr. Roy Porter'),
('00026','Dr. Dwight Robinson'),
('00027','Dr. Carl Beckford');
('00028','Dr. Michael Burn');
('00029','Dr. Samuel McDaniel');
('00030','Phylicia Ricketts'),
('00031','Dr. Donna Minott Kates'),
('00032','Dr. Jane Cohen');

insert into Faculty_email(faculty_id, email) values 
('00001','scitech@uwimona.edu.jm'),
('00002','fsocsci@uwimona.edu.jm'),
('00003','monalaw@uwimona.edu.jm'),
('00004','medsci@uwimona.edu.jm'),
('00005','engineering@uwimona.edu.jm'),
('00006','fhe@uwimona.edu.jm'),
('00007','sports@uwimona.edu.jm');

insert into Faculty_phone_num(faculty_id, phone_number) values 
('620088317','876-977-1785'),
('00002','876-977-3536'),
('00003','876-927-1855'),
('00004','876-927-1297'),
('00005','(876) 927-1640'),
('00006','876-927-0221'),
('00007','876-702-4473');

insert into Student_email(student_id, email) values 
('620088317','kingderwent@gmail.com'),
('620111723','ncamckenzie@gmail.com');

insert into studentcourses(student_id, course_code,Status, grade) values 
('620088317','COMP1126','Complete','B+'),
('620111723','COMP1127','Complete','A-');

insert into registered_faculty(student_id, faculty_id) values 
('620088317','00001'),
('620111723','00006');

insert into faculty_departments(faculty_id, department_id) values 
('00001','COMP'),
('00001','GEOG'),
('00001','MATH'),
('00001','PHYS'),
('00001','CHEM'),
('00001','BIOL');

insert into department_lecturers(department_id, lecturer_id, HOD) values 
('COMP','00021','True'),
('GEOG','00022','True'),
('MATH','00023','True'),
('PHYS','00024','True'),
('CHEM','00025','True'),
('BIOL','00026','True'),
('COMP','00027','False'),
('GEOG','00028','False'),
('MATH','00029','False'),
('PHYS','00030','False'),
('CHEM','00031','False'),
('BIOL','00032','False');

insert into teaches(lecturer_id, course_code) values 
('00021','COMP1126'),
('00025','CHEM1901'),
('00027','COMP1127'),
('00029','MATH2410'),
('00030','PHYS1422'),
('00032','BIOL1017');

insert into degree_courses(degree_id, course_code) values 
('00012','COMP1126'),
('00012','COMP1127'),
('00012','COMP1161'),
('00012','COMP1210'),
('00012','COMP2201'),
('00012','COMP2211'),
('00012','COMP2140'),
('00012','COMP2171'),
('00012','COMP2190'),
('00012','COMP2340'),
('00012','COMP3101'),
('00012','COMP3220'),
('00012','COMP3161'),
('00013','CHEM1901'),
('00014','PHYS1422'),
('00015','MATH2410'),
('00016','GEOG1232'),
('00017','BIOL1017');

insert into department_degrees(department_id, degree_id) values 
('COMP','00012'),
('CHEM','00013'),
('PHYS','00014'),
('MATH','00015'),
('GEOG','00016'),
('BIOL','00017');
