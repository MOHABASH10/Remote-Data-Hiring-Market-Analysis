WITH top_paying_jobs AS (
    SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name 
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL 
    ORDER BY
    salary_year_avg DESC
    LIMIT 10 )

SELECT 
 top_paying_jobs.*,
 skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
 salary_year_avg DESC

/* Based on the dataset of top-paying Data Analyst roles from 2023, here is a detailed analysis of the skills column across the 8 unique job postings that contain skill requirements (representing 66 total skill entries).

Key Skill Insights
The Core Trinity (SQL, Python, Tableau)

SQL is the #1 required skill, appearing in 100% (8 out of 8) of the job postings.

Python follows closely at 88% (7 out of 8).

Tableau leads the business intelligence category at 75% (6 out of 8).

Statistical Languages & Analysis Libraries

R is requested in 50% (4 out of 8) of roles.

Pandas and Excel are each required in 38% (3 out of 8) of roles, indicating that foundational data manipulation tools remain essential even at high salary tiers.

Cloud Data Warehousing & Big Data

Snowflake is the top modern cloud database requested (38%).

AWS and Azure cloud platforms appear in 25% of roles. */