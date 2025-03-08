
-- Subquery eg.
SELECT name,
        company_id
FROM company_dim
WHERE company_id IN (
    SELECT company_id
FROM job_postings_fact
WHERE job_no_degree_mention=TRUE
);

-- CTE eg.
--Find companies having most job postings
SELECT name AS company_name,
        COUNT(*) AS num_of_jobs
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
GROUP BY company_dim.company_id
ORDER BY num_of_jobs DESC

--Practice Problem PP1
--Identify Top 5 skills mentioned in job postings
SELECT skills,
        COUNT(*) AS count_of_skills
FROM skills_job_dim
LEFT JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
GROUP BY skills_dim.skill_id
ORDER BY count_of_skills DESC

--PP2
SELECT 
        CASE 
        WHEN num_of_jobs < 10 THEN 'Small'
        WHEN num_of_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN num_of_jobs >= 50 THEN 'Large'
        ELSE 'Otherwise'
        END AS size_category,
        COUNT(*) AS num_of_jobs
FROM         
( SELECT 
        COUNT(*) AS num_of_jobs
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id=job_postings_fact.company_id
GROUP BY company_dim.company_id
ORDER BY num_of_jobs DESC )
GROUP BY size_category
ORDER BY num_of_jobs DESC

--pp
-- display skills & type for each job with salary>70k in 1st Quater 
WITH q1_jobs AS ( SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs ) 

SELECT *
FROM q1_jobs
WHERE salary_year_avg>70000

SELECT 
        skills,
        type
FROM 
( SELECT skill_id,
        salary_year_avg
FROM q1_jobs
LEFT JOIN skills_job_dim ON q1_jobs.job_id=skills_job_dim.job_id
WHERE salary_year_avg>70000
ORDER BY salary_year_avg DESC ) AS skills_jobs
LEFT JOIN skills_dim ON skills_jobs.skill_id=skills_dim.skill_id

 