CREATE DATABASE performance;
USE performance;
ALTER TABLE students ADD COLUMN id_student INT PRIMARY KEY AUTO_INCREMENT;
DESCRIBE students;

-- 1.Average score in each subject.
SELECT 
    ROUND(AVG(math_score)),
    ROUND(AVG(writing_score)),
    ROUND(AVG(reading_score))
FROM
    students
WHERE
    math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per student is: in mathematics 66 out of 100, in writing 68 out of 100 and finally, in reading 69 out of 100.

-- 2.How many students took the test preparation course? 
SELECT 
    test_preparation_course,
    concat(round(count(test_preparation_course)/10,2),"%") as course_percentage
FROM
    students
GROUP BY test_preparation_course;
-- 64.20% of students did not take the exam preparation course, while 35.80% did.

-- 3.Is there a relationship between the student doing a test preparation course and the score in the exams?
SELECT round(avg((math_score+writing_score+reading_score)/3)) as avg_total_score
from students
where test_preparation_course IS NOT NULL
        AND test_preparation_course = 'none'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per subject from a student who did not take the preparation course is 65 out of 100.

SELECT 
    ROUND(AVG(math_score)),
    ROUND(AVG(writing_score)),
    ROUND(AVG(reading_score))
FROM
    students
WHERE
    test_preparation_course IS NOT NULL
        AND test_preparation_course = 'none'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per student who did not take the course is: in math 64 out of 100, in writing 65 out of 100 and finally, in reading 67 out of 100.

SELECT round(avg((math_score+writing_score+reading_score)/3)) as avg_total_score
from students
where test_preparation_course IS NOT NULL
        AND test_preparation_course = 'completed'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per subject from a student who took the preparation course is 73 out of 100.

SELECT 
    ROUND(AVG(math_score)),
    ROUND(AVG(writing_score)),
    ROUND(AVG(reading_score))
FROM
    students
WHERE
    test_preparation_course IS NOT NULL
        AND test_preparation_course = 'completed'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per student who took the course is: in math 70 out of 100, in writing 74 out of 100 and finally, in reading 74 out of 100.

-- 4.Number of students by gender.
SELECT 
    gender, COUNT(gender)
FROM
    students
GROUP BY gender
HAVING gender IS NOT NULL;
-- There are 518 female and 482 male students.

-- 5.Average score by gender.
SELECT round(avg((math_score+writing_score+reading_score)/3)) as avg_total_score
from students
where gender = "female"
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per subject for a female student is 70 out of 100. 

SELECT round(avg((math_score+writing_score+reading_score)/3)) as avg_total_score
from students
where gender = "male"
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per subject for a male student is 66 out of 100.

-- 6.Average score per subject by gender. 
SELECT 
    ROUND(AVG(math_score)) as avg_math,
    ROUND(AVG(writing_score)) as avg_writing,
    ROUND(AVG(reading_score)) as avg_reading
FROM
    students
WHERE
    gender IS NOT NULL
        AND gender = 'female'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per female student is: in math 64 out of 100, in writing 72 out of 100 and finally, in reading 73 out of 100.

SELECT 
    ROUND(AVG(math_score)) as avg_math,
    ROUND(AVG(writing_score)) as avg_writing,
    ROUND(AVG(reading_score)) as avg_reading
FROM
    students
WHERE
    gender IS NOT NULL
        AND gender = 'male'
        AND math_score IS NOT NULL
        AND writing_score IS NOT NULL
        AND reading_score IS NOT NULL;
-- The average score per male student is: in math 69 out of 100, in writing 63 out of 100 and finally, in reading 65 out of 100.

-- 7.Student with the highest total score.
SELECT 
    id_student,
    (math_score + writing_score + reading_score) AS total_score
FROM
    students
ORDER BY total_score DESC; 
-- The students with the highest total score are three, they also have a perfect score in all the exams. students with id: 101, 812 and 941.

-- 8.Student with the lowest total score.
SELECT 
    id_student,
    (math_score + writing_score + reading_score) AS total_score
FROM
    students
ORDER BY total_score ASC; 
-- The student with the lowest total score in the exams is the student id: 60.

-- 9.What role did ethnicity and educational level from their parents play?
SELECT 
    ethnicity, parental_level_education
FROM
    students
ORDER BY ethnicity ASC;

SELECT 
    ethnicity, COUNT(ethnicity) AS count_students
FROM
    students
GROUP BY ethnicity
ORDER BY ethnicity ASC; 
-- The group with most amount of students is the C with 319. 
-- The group with less amount of students is the A with 89. 

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
GROUP BY parental_level_education;
-- Most of parents' education is some college.
-- The least amount of education they have is a master's degree.

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
WHERE
    ethnicity = 'group A'
GROUP BY parental_level_education;
-- Most parents' education in group A is some high school.
-- Most parents' least amount of education in group A is a master degree.

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
WHERE
    ethnicity = 'group B'
GROUP BY parental_level_education;
-- Most parents' education in group B is high school.
-- Most parents' least amount of education in group B is a master degree.

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
WHERE
    ethnicity = 'group C'
GROUP BY parental_level_education;
-- Most parents' education in group C is associate degree.
-- Most parents' least amount of education in group C is a master degree.

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
WHERE
    ethnicity = 'group D'
GROUP BY parental_level_education;
-- Most parents' education in group D is some college.
-- Most parents' least amount of education in group D is a master degree.

SELECT 
    parental_level_education, COUNT(parental_level_education)
FROM
    students
WHERE
    ethnicity = 'group E'
GROUP BY parental_level_education;
-- Most parents' education in group E is associate degree.
-- Most parents' least amount of education in group E is a master degree.

-- The least obtained level of parental education is a master degree, regardless of ethnicity group.

-- 10.How do ethnicity and lunch behave?
SELECT 
    lunch, COUNT(lunch)
FROM
    students
GROUP BY lunch;
-- Most students access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    ethnicity = 'group A'
GROUP BY lunch;
-- Most students in group A access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    ethnicity = 'group B'
GROUP BY lunch;
-- Most students in group B access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    ethnicity = 'group C'
GROUP BY lunch;
-- Most students in group C access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    ethnicity = 'group D'
GROUP BY lunch;
-- Most students in group D access the standard lunch.

SELECT 
    lunch, COUNT(lunch)
FROM
    students
WHERE
    ethnicity = 'group E'
GROUP BY lunch;
-- Most students in group E access the standard lunch.

-- Most students, regardless of their group, have access to the standard lunch.