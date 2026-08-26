SELECT 
 skills,
 ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
 job_title_short = 'Data Analyst'
 AND salary_year_avg IS NOT NULL
 AND job_work_from_home = True
GROUP BY
 skills
ORDER BY
 avg_salary DESC
LIMIT 25
/* Key Industry Trends & Insights
1. Big Data & Distributed Computing Command the Highest Premiums
PySpark leads the entire list at $208,172, being the only skill in the dataset exceeding $200k.

Tools like Databricks ($141,907), Airflow ($126,103), and Scala ($124,903) highlight that data analysts who can process distributed datasets and build automated pipelines bridge the gap into Data Engineering, driving significantly higher compensation.

2. DevOps & Version Control are Now Standard for High Earners
Bitbucket ($189,155), GitLab ($154,500), Linux ($136,508), Kubernetes ($132,500), and Jenkins ($125,436) appear prominently.

Top-tier roles expect analysts to work directly inside software development lifecycles (CI/CD, containerization, version control) rather than operating solely in isolated spreadsheet environments.*/