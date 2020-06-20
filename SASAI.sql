Create table Student(student_id char(11), student_firstname varchar(30), student_lastname varchar(30), primary key(student_id));


Create table Faculty_Info (faculty_id char(5), faculty_name varchar(75), dean_firstname varchar(30), dean_lastname varchar(30), primary key(faculty_id));


Create table Course(course_code char(8), course_name varchar(50), number_of_credits int, level char(1), primary key(course_code));


Create table Department_info(Department_id char(4), Dept_name varchar(100), dept_office_num char(10), dept_email varchar(100), primary key(Department_id));

Create table Degree_info(degree_id varchar(10), degree_name varchar(100), degree_type varchar(5), elective_credits int, incourse_credits int, foundation_credits int, level_1_credits int, advanced_credits int, total_credits int, primary key(degree_id));

Create table Lecturer(lecturer_id char(10), lecturer_name varchar(50), primary key(lecturer_id));

Create table Faculty_email(faculty_id char(5), email varchar(100), primary key(faculty_id), foreign key(faculty_id) references Faculty_Info(faculty_id));

Create table Faculty_phone_num(faculty_id char(5), phone_number varchar(10), primary key(faculty_id), foreign key(faculty_id) references Faculty_Info(faculty_id));

Create table Student_email(student_id char(11), email varchar(100), primary key(student_id), foreign key(student_id) references Student(student_id));

