-- PP6 
CREATE TABLE january_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


-- PP7
--Find the count of remote job posting per skill
WITH remote_jobs AS (
SELECT skill_id
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
WHERE job_work_from_home=TRUE
)        

SELECT skills_dim.skill_id,
        skills,
        COUNT(*) AS num_of_jobs
FROM remote_jobs
INNER JOIN skills_dim ON remote_jobs.skill_id=skills_dim.skill_id
GROUP BY skills_dim.skill_id
ORDER BY num_of_jobs DESC
LIMIT 5

--pp8
SELECT job_title_short,
        job_location,
        job_via,
        salary_year_avg
FROM 
( SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs ) AS q1_jobs 
WHERE salary_year_avg>70000
ORDER BY salary_year_avg DESC 