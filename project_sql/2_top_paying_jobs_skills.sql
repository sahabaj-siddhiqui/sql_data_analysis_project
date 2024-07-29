/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON
        company_dim.company_id = job_postings_fact.company_id -- Joining the company dim table so that we can see which company has posted the job
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.job_id,
    job_title,
    skills,
    salary_year_avg,
    company_name
FROM top_paying_jobs
INNER JOIN skills_job_dim ON
    skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
    Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
    SQL is leading with a bold count of 8.
    Python follows closely with a bold count of 7.
    Tableau is also highly sought after, with a bold count of 6.
    Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.


[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "sql",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "python",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "r",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "azure",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "databricks",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "aws",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "pandas",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "pyspark",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "jupyter",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "excel",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "tableau",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "power bi",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "skills": "powerpoint",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "skills": "sql",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "skills": "python",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "skills": "r",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "skills": "hadoop",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "skills": "tableau",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "skills": "sql",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "skills": "crystal",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "skills": "oracle",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "skills": "tableau",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "skills": "flow",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "sql",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "python",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "go",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "snowflake",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "pandas",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "numpy",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "excel",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "tableau",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "skills": "gitlab",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "sql",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "python",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "azure",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "aws",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "oracle",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "snowflake",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "tableau",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "power bi",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "sap",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "jenkins",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "bitbucket",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "atlassian",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "jira",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "skills": "confluence",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "sql",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "python",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "r",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "git",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "bitbucket",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "atlassian",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "jira",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "skills": "confluence",
    "salary_year_avg": "189000.0",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "sql",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "python",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "go",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "snowflake",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "pandas",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "numpy",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "excel",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "tableau",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "skills": "gitlab",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "skills": "sql",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "skills": "python",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "skills": "r",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology"
  }
]
*/