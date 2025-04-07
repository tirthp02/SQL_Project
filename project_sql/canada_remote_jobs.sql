SELECT  job_title,
        name,
        job_via,
        job_schedule_type,
        job_posted_date,
        job_no_degree_mention,
        job_health_insurance,
        salary_year_avg,
        salary_hour_avg

FROM    job_postings_fact
INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE   job_country = 'Canada' AND
        (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL) AND
        job_work_from_home = 'TRUE'
ORDER BY    salary_year_avg DESC,
            salary_hour_avg DESC