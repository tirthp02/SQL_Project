WITH top_paying_jobs AS (   
    SELECT  job_title,
            name AS job_company,
            job_location,
            salary_year_avg,
            job_id
    FROM    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
    WHERE   
            salary_year_avg IS NOT NULL AND
            job_country = 'Canada'
    ORDER BY salary_year_avg DESC
)

SELECT  skills,
        top_paying_jobs.*
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
