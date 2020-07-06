-- use the id number to check the number of credits that a student has
Delimiter $$
create procedure student_credits(student_id char(11))
Begin
select count(number_of_credits) from course 
where course_code in (select course_code from studentcourses
where student_id = student_id and status = 'Pass');
End
$$
