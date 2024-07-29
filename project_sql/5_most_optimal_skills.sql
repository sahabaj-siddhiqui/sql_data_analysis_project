
WITH demanded_skills AS (

    SELECT 
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_work_from_home = True
    GROUP BY
        skills_dim.skill_id

), top_paying_skills AS (

    SELECT 
        skills_dim.skill_id,
        skills, 
        AVG(salary_year_avg) as average_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_work_from_home = True
    GROUP BY 
        skills_dim.skill_id
    
)

SELECT 
    demanded_skills.skill_id,
    top_paying_skills.skills,
    demand_count,
    average_salary
FROM demanded_skills
INNER JOIN top_paying_skills ON demanded_skills.skill_id = top_paying_skills.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC, average_salary DESC
LIMIT 100


-- Rewriting the above query into more compact form
SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count,
        AVG(salary_year_avg) as average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC, average_salary DESC
LIMIT 100