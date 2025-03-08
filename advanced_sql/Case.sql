SELECT 
    COUNT(job_id) AS num_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
GROUP BY location_category;        

-- Practice Problem 1

SELECT 
  /*  AVG(salary_year_avg) AS avg_salary,
    MAX(salary_year_avg) AS max_salary,
    MIN(salary_year_avg) AS min_salary */
    COUNT(job_id) AS num_of_jobs,
    CASE
    WHEN salary_year_avg <= 80000 THEN 'Low Salary'
    WHEN salary_year_avg BETWEEN 80000 AND 150000 THEN 'Standard Salary'
    WHEN salary_year_avg >= 150000 THEN 'High Salary'
    ELSE 'Salary Not Mentioned'
    END AS salary_range
FROM job_postings_fact
WHERE job_title_short='Data Analyst'
GROUP BY salary_range
ORDER BY num_of_jobs  DESC;

/*SELECT job_title,
        salary_year_avg
FROM job_postings_fact
WHERE job_title_short='Data Analyst' AND
        salary_year_avg IS NULL*/

