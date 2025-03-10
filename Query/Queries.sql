--Write a query to fetch all courses within a selected category, including title, price, and ratings
select c.course_id,title,c.price,avg(course_rate) avg_rate
from courses c join Lockups_item l on l.item_id=c.category_id
join learner_courses lc on c.course_id=lc.courses_id
where l.name='Front-end Development'
group by c.course_id,title,c.price

--Implement a query to search courses by keyword in the title or description.select * from courses
where [description] Like'%HTML%' or [Title] Like'%HTML%' 

--Create a query to retrieve the progress of a learner in a specific course, including completed lessons and remaining lessons
select llp.learner_id,rl.courses_id,
count(rl.lesson_id) as total_lessons,                                   
count(case when llp.lesson_status = 42 then 1 end) as completed_lessons, 
count(rl.lesson_id) - count(case when llp.lesson_status = 42 then 1 end) as remaining_lessons
from learner_lesson_progress llp
join recorded_lessons rl
on llp.lesson_id=rl.lesson_id
group by llp.learner_id,rl.courses_id

--Write a query to identify the top-rated courses based on average ratings and enrollment numbers.select Top 1 lc.courses_id,c.Titlefrom learner_courses lcjoin courses c on lc.courses_id=c.course_idwhere course_rate is not nullgroup by lc.courses_id,c.Titleorder by avg(lc.course_rate)/count(*) desc