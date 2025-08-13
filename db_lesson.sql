/* DB Lesson課題のクエリ集です。
Q1
USE db_lesson;
CREATE TABLE departments (
    ->   department_id INT AUTO_INCREMENT PRIMARY KEY,
    ->   name VARCHAR(20) NOT NULL,
    ->   created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    ->   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );

Q2
ALTER TABLE people
    -> ADD COLUMN department_id INT UNSIGNED AFTER email;

Q3
- departments 
INSERT INTO departments (name)
    -> VALUES 
    ->   ('営業'),
    ->   ('開発'),
    ->   ('経理'),
    ->   ('人事'),
    ->   ('情報システム');

- people
INSERT INTO people (name, email, age, gender, department_id)
    -> VALUES
    ->   ('廣澤順平', 'jumpei@gizumo.jp', 27, 1, 1),
    ->   ('佐藤みさき', 'sato@gizumo.jp', 25, 2, 1),
    ->   ('小林まこと', 'kobayashi@gizumo.jp', 30, 1, 1),
    -> 
    ->   -- 開発 (4人)
    ->   ('田中ゆうこ', 'tanaka_yuko@gizumo.jp', 26, 2, 2),
    ->   ('福田だいすけ', 'fukuda_daisuke@gizumo.jp', 35, 1, 2),  -- ← 修正
    ->   ('井上しおり', 'inoue@gizumo.jp', 29, 2, 2),
    ->   ('山本けんた', 'yamamoto@gizumo.jp', 31, 1, 2),
    -> 
    ->   -- 経理 (1人)
    ->   ('豊島はなこ', 'toyoshima_hanako@gizumo.jp', 32, 2, 3),  -- ← 修正
    -> 
    ->   -- 人事 (1人)
    ->   ('大西ひろし', 'ohnishi@gizumo.jp', 41, 1, 4),
    -> 
    ->   -- 情報システム (1人)
    ->   ('田中大地', 'daichi@gizumo.jp', 30, 2, 5);

- report
INSERT INTO reports (person_id, content)
    -> VALUES
    ->   (67, '今日は気分がいい。'),
    ->   (67, '今日は今日だ。'),
    ->   (67, 'やることをやる。'),
    ->   (67, '休みは休もう。'),
    ->   (67, '楽しくやろう。'),
    ->   (67, 'ワクワクしている。'),
    ->   (67, '最高の１日。'),
    ->   (67, '音楽聴きたい。'),
    ->   (67, 'お寿司はマストで。'),
    ->   (67, '世界ひっろぉ。');

Q4
SELECT name, age
    -> FROM people
    -> WHERE gender = 1
    -> ORDER BY age DESC;

Q5
SELECT name, age, department_id
    -> FROM people
    -> WHERE gender = 1
    -> ORDER BY age DESC;

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
people テーブルから、department_id カラムが1であるレコードを選び、
name、email、age カラムのデータを、created_at カラムの値で並べ替えて取得しているSQL文です。

Q7
SELECT name
    -> FROM people
    -> WHERE (age BETWEEN 20 AND 29 AND gender = 2)
    ->    OR (age BETWEEN 40 AND 49 AND gender = 1);

Q8
SELECT name, age
    -> FROM people
    -> WHERE department_id = 1
    -> ORDER BY age ASC;

Q9
SELECT AVG(age) AS avg_age
    -> FROM people
    -> WHERE gender = 2 AND department_id = 2;

Q10
SELECT
    ->   people.name AS person_name,
    ->   departments.name AS department_name,
    ->   reports.content AS report_content
    -> FROM
    ->   people
    -> JOIN
    ->   departments ON people.department_id = departments.department_id
    -> JOIN
    ->   reports ON people.person_id = reports.person_id;