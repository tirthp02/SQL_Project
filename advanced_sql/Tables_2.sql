SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS job_month,
    EXTRACT(YEAR FROM job_posted_date) AS job_year
FROM
    job_postings_fact
LIMIT 5;

SELECT 
    COUNT(job_id) as num_of_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS job_month
FROM job_postings_fact
WHERE job_title_short='Data Analyst'
GROUP BY job_month
ORDER BY num_of_jobs DESC;

-- Practice Problem 1
SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS yearly_salary,
    AVG(salary_hour_avg) AS hourly_salary
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;

-- Practice Problem 2
SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS job_month,
    COUNT(job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS num_of_jobs
FROM job_postings_fact
GROUP BY job_month
ORDER BY job_month

-- Practice Problem 3
SELECT
    name,
    job_posted_date,
    job_health_insurance
FROM
    job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE (job_posted_date BETWEEN '2023-04-01' AND '2023-06-30') AND
        job_health_insurance = TRUE

