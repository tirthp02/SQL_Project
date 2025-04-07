SELECT  job_title,
        name AS job_company,
        job_location,
        salary_year_avg,
        job_schedule_type
FROM    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
WHERE   
        salary_year_avg IS NOT NULL AND
        job_location = 'Toronto, ON, Canada'
ORDER BY salary_year_avg DESC
