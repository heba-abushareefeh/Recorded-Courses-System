--CREATE TABLE
create table Lockups_type
([type_id] int primary key, 
[type] varchar(50),
IsActive bit default 1,
CreatedBy int,
UpdatedBy int ,
CreatedAt datetime default GETDATE(),
UpdatedAt datetime ,
)

create table Lockups_item
(item_id int primary key, 
[name] varchar(50),
[type_id] int,
CreatedBy int,
UpdatedBy int ,
CreatedAt datetime default GETDATE(),
UpdatedAt datetime,
IsActive bit default 1,
constraint fk_Lockupsitem_type foreign key ([type_id]) references Lockups_type( [type_id])
)

create table Admin 
(admin_id int identity(1,1) primary key,
Email varchar(50) unique not null check(Email Like '_%@__%.__%'),
[password] varchar(50) not null check (
										LEN([password]) >= 8 AND
										[password] LIKE '%[A-Z]%' AND
										[password] LIKE '%[0-9]%' AND
										[password] LIKE '%[a-z]%' AND
										[password] LIKE '%[^A-Za-z0-9]%'
										) ,
FName varchar(10) not null check (FName NOT lIKE'%[^A-Za-z]%'),
LName varchar(10) not null check (LName NOT lIKE'%[^A-Za-z]%'))

select * into Learners
from [Admin];

alter table Learners
add img_url NVARCHAR(max),bio NVARCHAR(255); 

EXEC sp_rename 'Learners.admin_id',  'learner_id', 'COLUMN';

select * into Instructors 
from Learners;

EXEC sp_rename 'Instructors .learner_id',  'instructors_id', 'COLUMN';


create table courses
(course_id int identity(1,1) primary key,
Title varchar(50) not null,
[description] varchar(max) ,
price decimal(6,2) not null check (price >= 0),
discount decimal(3,2) check (discount>=0 and discount<=1) default 0.00,
CreatedAt datetime default GETDATE(),
UpdatedAt datetime,
IsActive bit default 1,
instructor_id int,
category_id int,
level_id int,
constraint FK_Instructor_Course foreign key (instructor_id) references Instructors (instructors_id)on delete cascade,
constraint FK_LockupsCategory_Course foreign key (category_id) references Lockups_item(item_id),
constraint FK_LockupsLevel_Course foreign key (level_id) references Lockups_item(item_id)on delete no action
)

create table learner_courses
(learner_courses_id int identity(1,1) primary key,
price decimal(6,2) not null check (price >= 0),
date_enrolled DATETIME DEFAULT GETDATE() ,
end_date date,
IsActive bit default 1,
instructor_rate decimal(3,1) check(Instructor_Rate>=0 and Instructor_Rate<=5),
course_rate decimal(3,1) check(course_rate>=0 and course_rate<=5),
courses_id int,
learner_id int,
constraint FK_Courses_learnerCorses foreign key (courses_id) references courses(course_id)on delete cascade,
constraint FK_Learner_learnerCorses foreign key (learner_id) references Learners(learner_id)on delete no action
)
alter table learner_courses
add constraint unq_learnerCourses unique(learner_id,courses_id)

CREATE TABLE Bookmarks (
    BookmarkID INT IDENTITY(1,1) PRIMARY KEY,
	DateAdded DATETIME NOT NULL DEFAULT GETDATE(),
    LearnerID INT NOT NULL,                 
    CourseID INT NOT NULL,                  
    CONSTRAINT FK_Bookmark_Learner FOREIGN KEY (LearnerID) REFERENCES Learners(Learner_id) ,
    CONSTRAINT FK_Bookmark_Course FOREIGN KEY (CourseID) REFERENCES Courses(Course_id),
)

create table recorded_lessons
(
lesson_id int identity(1,1) primary key,
order_number int not null,
Title varchar(50) not null,
[description] varchar(max) ,
duration int not null check (Duration >= 0),
video_url varchar(max) not null,--check
CreatedAt datetime default GETDATE(),
UpdatedAt datetime,
IsActive bit default 1,
courses_id int,
constraint FK_Lessons_Corses foreign key (courses_id) references courses(course_id)on delete cascade,
)

create table learner_lesson_progress
(lesson_progress_id int identity(1,1) primary key,
last_watch_at datetime default GETDATE(),
learner_id int,
lesson_id int,
lesson_status int,
constraint FK_Learner_LessonProgress foreign key (learner_id) references Learners(learner_id)on delete Cascade,
constraint FK_Lesson_LessonProgress foreign key (lesson_id) references recorded_lessons(lesson_id)on delete Cascade,
constraint FK_LockupsItem_statusProgress foreign key (lesson_status) references Lockups_item(item_id)on delete no action,
)

create table bundles
(
bundles_id int identity(1,1) primary key,
discount decimal(3,2) check (discount>=0 and discount<=1) default 0.00,
Description Varchar(MAX), 
Title VARCHAR(50) NOT NULL,
price decimal(6,2) not null check (price >= 0),
IsActive bit default 1,
CreatedBy int,
UpdatedBy int ,
CreatedAt datetime default GETDATE(),
UpdatedAt datetime ,
)

create table courses_bundles
(courses_bundles_id int identity(1,1) primary key,
 is_active bit default 1,
 CreatedAt datetime default GETDATE(),
 bundles_id int, 
 course_id int,
 constraint FK_bundles_coursesbundles foreign key (bundles_id) references bundles(bundles_id)on delete cascade,
 constraint FK_Courses_coursesbundles foreign key (course_id) references courses(course_id),
 )

create table learner_bundles
(learner_bundles_id int identity(1,1) primary key,
 [start_date] DATETIME not null DEFAULT GETDATE(),
 price_when_assigned decimal(6,2) not null check (price_when_assigned >= 0),
 IsActive bit default 1,
 learner_id int,
 bundles_id int,
 constraint FK_bundles_learnerbundles foreign key (bundles_id) references bundles(bundles_id)on delete cascade,
 constraint FK_learner_learnerbundles foreign key (learner_id) references learners(learner_id)
 )

 create table subscription(
    sub_id int identity(1,1) primary key,
	discount decimal(3,2) check (discount>=0 and discount<=1) default 0.00,
    Title varchar(50) NOT nuLL,        
    [Description] NVARCHAR(MAX) ,      
    Price DECIMAL(6, 2) not null check (price >= 0),       
    Duration INT not null check (Duration >= 0),
	IsActive bit default 1,
    CreatedBy int ,
    CreatedAt datetime default GETDATE(),
    UpdatedBy int ,
    UpdatedAt datetime ,
	sub_type_id int,
	constraint FK_LockupsItem_sub foreign key (sub_type_id) references Lockups_item(item_id)ON DELETE NO ACTION
);
