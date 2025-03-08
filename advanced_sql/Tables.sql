CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50) 
 );

SELECT *
FROM job_applied

INSERT TABLE job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
  )
VALUES (
    1,
    '2025-02-27',
    TRUE,
    'resume_1',
    TRUE,
    'cover_letter_1',
    'submitted');

ALTER TABLE job_applied
ADD contact VARCHAR(50);   

UPDATE job_applied
SET contact='Ramesh Pawar'
WHERE job_id=1;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;