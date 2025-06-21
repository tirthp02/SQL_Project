SELECT  --job_title_short,
        job_title,
        name AS job_company,
        job_location,
        salary_year_avg,
        salary_hour_avg,
        job_schedule_type
FROM    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
WHERE   
        (salary_hour_avg IS NOT NULL OR
        salary_year_avg IS NOT NULL) AND
        job_location = 'Anywhere'
ORDER BY salary_hour_avg DESC, salary_year_avg DESC 
