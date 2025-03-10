--Write a stored procedure to handle learner enrollments.
create proc LearnerEnrolled
@course_id int,@learner_id int
as
begin
insert into learner_courses(price ,end_date,course_rate,instructor_rate,courses_id,learner_id) values
((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = @course_id), DATEADD(month, 2, Getdate()), null, null, @course_id, @learner_id)
end
----------------------------------------------------------------------------------------------------
-- Implement a stored procedure for instructors to add courses, including lessons and metadata.create proc add_course_with_lessons
    @Title varchar(50), 
    @description varchar(max), 
    @price decimal(6,2), 
    @discount decimal(3,2), 
    @instructor_id int, 
    @category_id int, 
    @level_id int,
    @order_number int, 
    @lesson_Title varchar(50), 
    @lesson_description varchar(max), 
    @duration int, 
    @video_url varchar(max)
as
begin
    insert into courses (Title, [description], price, discount, instructor_id, category_id, level_id) 
    values (@Title, @description, @price, @discount, @instructor_id, @category_id, @level_id);

    declare @new_course_id INT = SCOPE_IDENTITY();

    insert into recorded_lessons (order_number, Title, [description], duration, video_url, courses_id) 
    values (@order_number, @lesson_Title, @lesson_description, @duration, @video_url, @new_course_id);

    print 'Success: Course and lessons added successfully.';
end;
---------------------------------or---------------------------------------
create proc add_course
    @Title varchar(50), 
    @description varchar(max), 
    @price decimal(6,2), 
    @discount decimal(3,2), 
    @instructor_id int, 
    @category_id int, 
    @level_id int
as
begin
    insert into courses (Title, [description], price, discount, instructor_id, category_id, level_id) 
    values (@Title, @description, @price, @discount, @instructor_id, @category_id, @level_id);
end;

create proc add_lessons
    @order_number int, 
    @lesson_Title varchar(50), 
    @lesson_description varchar(max), 
    @duration int, 
    @video_url varchar(max),
	@course_id int
as
begin
     insert into recorded_lessons (order_number, Title, [description], duration, video_url, courses_id) 
    values (@order_number, @lesson_Title, @lesson_description, @duration, @video_url, @course_id);
end;

exec add_course_with_lessons 'Advanced SQL','Master complex SQL queries',200.00,0.20,1,1,12,1, 'Introduction', 'Course Overview', 20, 'video1.mp4'

--------------------------------------------------------------------------------------------
--Create a stored procedure to generate a report of total revenue per course and instructor within a specific timeframe.
create proc course_revenue
@startDate datetime ,@endDate datetime
as
begin
select c.course_id,c.Title,instructor_id,(i.FName+' ' +i.LName) instructor_name ,sum(case when  lc.price is null then 0 else  lc.price end ) as course_revenue 
from courses c
left join Instructors i on c.instructor_id=i.instructors_id
left join learner_courses lc on c.course_id=lc.courses_id 
where lc.date_enrolled between @startDate and @endDate 
group by  c.course_id,c.Title,instructor_id,i.FName,i.LName
end

exec course_revenue '2025-03-07 13:58:44.863','2025-05-07 13:58:44.863'; 
--------------------------------------------------------------------------------------------
--Write a stored procedure to apply or update discounts on courses based on promotional campaigns.
create proc manage_discount
@courses_id int,@discount decimal(3,2)
as
begin
update  courses set discount=@discount
where course_id=@courses_id
end

