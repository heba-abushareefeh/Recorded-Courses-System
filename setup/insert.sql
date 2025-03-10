-- Insert 
INSERT INTO Lockups_type (type_id, [type], CreatedBy) VALUES
(1, 'Category', 1),
(2, 'Level', 1),
(3, 'Subscription Type', 1),
(4, 'Lesson Status', 1);

INSERT INTO Lockups_item (item_id, [name], type_id, CreatedBy) VALUES
(11, 'Front-end Development', 1, 1),
(12, 'Back-end Development', 1, 1),
(13, 'UI/UX Design', 1, 1),
(14, 'Machine Learning', 1, 1),
(15, 'Cybersecurity', 1, 1),
(21, 'Beginner', 2, 1),
(22, 'Intermediate', 2, 1),
(23, 'Advanced', 2, 1),
(31, 'Free', 3, 1),
(32, 'Basic', 3, 1),
(33, 'Premium', 3, 1),
(41, 'In Progress', 4, 1),
(42, 'Completed', 4, 1);

INSERT INTO Admin (Email, [password], FName, LName) VALUES
('admin@example.com', 'Admin@1234', 'John', 'Doe');

INSERT INTO Learners (Email, [password], FName, LName, img_url, bio) VALUES
('learner1@example.com', 'Learner@123', 'Ali', 'Ahmad', 'img1.jpg', 'Passionate learner'),
('learner2@example.com', 'Learner@123', 'Sara', 'Khalid', 'img2.jpg', 'Design enthusiast'),
('learner3@example.com', 'Learner@123', 'Omar', 'Naser', 'img3.jpg', 'Tech lover'),
('learner4@example.com', 'Learner@123', 'Noor', 'Hassan', 'img4.jpg', 'Aspiring developer'),
('learner5@example.com', 'Learner@123', 'Adam', 'Smith', 'img5.jpg', 'Machine Learning fan'),
('learner6@example.com', 'Learner@123', 'Lina', 'Karam', 'img6.jpg', 'Front-end enthusiast'),
('learner7@example.com', 'Learner@123', 'Yousef', 'Ali', 'img7.jpg', 'Cybersecurity student'),
('learner8@example.com', 'Learner@123', 'Hana', 'Odeh', 'img8.jpg', 'Software engineering major'),
('learner9@example.com', 'Learner@123', 'Zain', 'Rashid', 'img9.jpg', 'Full-stack developer'),
('learner10@example.com', 'Learner@123', 'Dana', 'Tariq', 'img10.jpg', 'Cloud computing enthusiast');

INSERT INTO Instructors (Email, [password], FName, LName, img_url, bio) VALUES
('instr1@example.com', 'Instr@123', 'Omar', 'Hassan', 'img11.jpg', 'Expert in Programming'),
('instr2@example.com', 'Instr@123', 'Lina', 'Salem', 'img12.jpg', 'UI/UX Designer'),
('instr3@example.com', 'Instr@123', 'Kareem', 'Naji', 'img13.jpg', 'AI Researcher'),
('instr4@example.com', 'Instr@123', 'Hiba', 'Samir', 'img14.jpg', 'Data Science Mentor'),
('instr5@example.com', 'Instr@123', 'Tamer', 'Jamal', 'img15.jpg', 'Backend Developer'),
('instr6@example.com', 'Instr@123', 'Rana', 'Yousef', 'img16.jpg', 'Blockchain Specialist'),
('instr7@example.com', 'Instr@123', 'Fadi', 'Ghanem', 'img17.jpg', 'Cybersecurity Expert'),
('instr8@example.com', 'Instr@123', 'Maya', 'Sleiman', 'img18.jpg', 'Mobile App Developer'),
('instr9@example.com', 'Instr@123', 'Zaid', 'Mansour', 'img19.jpg', 'Game Developer'),
('instr10@example.com', 'Instr@123', 'Dalia', 'Fares', 'img20.jpg', 'Cloud Architect');

INSERT INTO courses (Title, [description], price, discount, instructor_id, category_id, level_id) VALUES
('Web Front-end', 'Learn HTML, CSS, JavaScript, and frameworks', 50.00, 0.10, 1, 11, 21),
('UI/UX Design', 'Master user experience and interface design', 60.00, 0.15, 2, 13, 21),
('Back-end Development', 'Deep dive into server-side programming', 80.00, 0.20, 3, 12, 22),
('Machine Learning', 'Learn ML algorithms and deep learning', 100.00, 0.25, 4, 14, 23),
('Cybersecurity Fundamentals', 'Protect systems from cyber threats', 70.00, 0.10, 5, 15, 22);

INSERT INTO learner_courses (price, end_date, instructor_rate, course_rate, courses_id, learner_id)
VALUES 
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 1),
	  ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 2), DATEADD(month, 2, Getdate()), 3, 5, 2, 1),
	   ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 3), DATEADD(month, 2, Getdate()), 3, 5, 3, 1), 
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 2),  
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 3), 
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 4),  
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 5),  
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 6),
    ((SELECT c.price - (c.price * c.discount) 
      FROM courses c 
      WHERE c.course_id = 1), DATEADD(month, 2, Getdate()), 3, 5, 1, 7); 

update learner_courses set courses_id = 4 where learner_id=5 or learner_id=6

INSERT INTO bookmarks (learner_id, courses_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 2),
(4, 3),
(5, 4),
(5, 5);

-- Insert into Recorded Lessons
INSERT INTO recorded_lessons (order_number, Title, [description], duration, video_url, courses_id) VALUES
(1, 'Introduction to HTML', 'Basics of HTML structure', 20, 'https://example.com/html-intro', 1),
(2, 'CSS Fundamentals', 'Learn CSS styling and layout', 30, 'https://example.com/css-fundamentals', 1),
(3, 'JavaScript Basics', 'Understand JS concepts and syntax', 40, 'https://example.com/js-basics', 1),
(1, 'User Research', 'Understand how to conduct user research', 25, 'https://example.com/user-research', 2),
(2, 'Wireframing and Prototyping', 'Create UI wireframes', 35, 'https://example.com/wireframing', 2),
(1, 'Introduction to Back-end', 'Server-side programming overview', 30, 'https://example.com/backend-intro', 3),
(2, 'Databases 101', 'Understanding SQL and NoSQL databases', 40, 'https://example.com/databases-101', 3),
(1, 'Supervised Learning', 'Learn about supervised ML models', 50, 'https://example.com/supervised-ml', 4),
(2, 'Deep Learning Basics', 'Introduction to deep neural networks', 60, 'https://example.com/deep-learning', 4),
(1, 'Cyber Threats Overview', 'Understanding different types of cyber threats', 45, 'https://example.com/cyber-threats', 5),
(2, 'Network Security Fundamentals', 'Basics of securing networks', 50, 'https://example.com/network-security', 5);

INSERT INTO learner_lesson_progress (learner_id, lesson_id, lesson_status)
SELECT  c.learner_id, l.lesson_id,li.item_id AS lesson_status
FROM learner_courses c
JOIN  recorded_lessons l ON c.courses_id = l.courses_id
JOIN  Lockups_item li  ON li.name = 'In progress';

update learner_lesson_progress set lesson_status=42 where lesson_id=1

-- Insert into Bundles
INSERT INTO bundles (title, [description], price, discount, created_by) VALUES
('Full Stack Web Development', 'Front-end + Back-end courses together', 120.00, 0.30, 'admin'),
('AI & Security Pack', 'Machine Learning and Cybersecurity', 150.00, 0.25, 'admin');

-- Insert into Courses_Bundles
INSERT INTO courses_bundles (bundles_id, course_id) VALUES
(1, 1),
(1, 3), 
(2, 4),
(2, 5);  

-- Insert into Subscriptions
INSERT INTO [subscription]([discount],[Title],[Description] ,[Price]
           ,[Duration],[IsActive],[CreatedBy],[CreatedAt],[UpdatedBy] ,[UpdatedAt],[sub_type_id])
VALUES
(0.00, 'Basic Plan', 'Access to essential courses for a limited time.', 19.99, 30, 1, 1, '2025-03-07', 1, '2025-03-07', 32),
(0.10, 'Premium Plan', 'Access to all courses with additional premium features.', 49.99, 90, 1, 1, '2025-03-07', 1, '2025-03-07', 33),
(0.20, 'Lifetime Plan', 'Unlimited access to all courses for life.', 199.99, 0, 1, 1, '2025-03-07', 1, '2025-03-07', 31)


