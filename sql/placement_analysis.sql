SELECT
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance;


















































    SELECT
    Department,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Department
ORDER BY placement_rate DESC;






























SELECT
    Placement_Status,
    ROUND(AVG(CGPA), 2) AS average_cgpa,
    ROUND(AVG(Attendance_Percentage), 2) AS average_attendance,
    ROUND(AVG(Coding_Skill), 2) AS average_coding_skill,
    ROUND(AVG(Communication_Skill), 2) AS average_communication_skill,
    ROUND(AVG(Technical_Skill), 2) AS average_technical_skill
FROM student_performance
GROUP BY Placement_Status;





















SELECT
    Internships,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Internships
ORDER BY Internships;
























SELECT
    Projects,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Projects
ORDER BY Projects;



















SELECT
    Backlogs,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Backlogs
ORDER BY Backlogs;


























SELECT
    Certifications,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Certifications
ORDER BY Certifications;
























SELECT
    Hackathons,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Hackathons
ORDER BY Hackathons;

























SELECT
    CASE
        WHEN Placement_Preparation_Hours <= 5 THEN '0-5'
        WHEN Placement_Preparation_Hours <= 10 THEN '6-10'
        WHEN Placement_Preparation_Hours <= 15 THEN '11-15'
        WHEN Placement_Preparation_Hours <= 20 THEN '16-20'
        ELSE '21-25'
    END AS preparation_group,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY preparation_group
ORDER BY
    CASE preparation_group
        WHEN '0-5' THEN 1
        WHEN '6-10' THEN 2
        WHEN '11-15' THEN 3
        WHEN '16-20' THEN 4
        WHEN '21-25' THEN 5
    END;

















    SELECT
    Mock_Interviews,
    COUNT(*) AS total_students,
    SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) AS placed_students,
    ROUND(
        100.0 * SUM(CASE WHEN Placement_Status = 'Placed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS placement_rate
FROM student_performance
GROUP BY Mock_Interviews
ORDER BY Mock_Interviews;




















SELECT
    Department,
    COUNT(*) AS placed_students,
    ROUND(AVG(Package_LPA), 2) AS average_package_lpa
FROM student_performance
WHERE Placement_Status = 'Placed'
GROUP BY Department
ORDER BY average_package_lpa DESC;

























WITH ranked_packages AS (
    SELECT
        Package_LPA,
        ROW_NUMBER() OVER (ORDER BY Package_LPA) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM student_performance
    WHERE Placement_Status = 'Placed'
)
SELECT
    ROUND(AVG(Package_LPA), 2) AS median_package_lpa
FROM ranked_packages
WHERE row_num IN (
    (total_rows + 1) / 2,
    (total_rows + 2) / 2
);



































SELECT
    ROUND(
        (
            SUM((CGPA - avg_cgpa) * (Package_LPA - avg_package))
        )
        /
        SQRT(
            SUM((CGPA - avg_cgpa) * (CGPA - avg_cgpa))
            *
            SUM((Package_LPA - avg_package) * (Package_LPA - avg_package))
        ),
        4
    ) AS cgpa_package_correlation
FROM (
    SELECT
        CGPA,
        Package_LPA,
        AVG(CGPA) OVER () AS avg_cgpa,
        AVG(Package_LPA) OVER () AS avg_package
    FROM student_performance
    WHERE Placement_Status = 'Placed'
);




















SELECT
    Internships,
    COUNT(*) AS placed_students,
    ROUND(AVG(Package_LPA), 2) AS average_package_lpa
FROM student_performance
WHERE Placement_Status = 'Placed'
GROUP BY Internships
ORDER BY Internships;


























SELECT
    Projects,
    COUNT(*) AS placed_students,
    ROUND(AVG(Package_LPA), 2) AS average_package_lpa
FROM student_performance
WHERE Placement_Status = 'Placed'
GROUP BY Projects
ORDER BY Projects;



















SELECT
    Placement_Status,
    COUNT(*) AS students,
    ROUND(AVG(CGPA), 2) AS avg_cgpa,
    ROUND(AVG(Backlogs), 2) AS avg_backlogs,
    ROUND(AVG(Coding_Skill), 2) AS avg_coding_skill,
    ROUND(AVG(Communication_Skill), 2) AS avg_communication_skill,
    ROUND(AVG(Technical_Skill), 2) AS avg_technical_skill,
    ROUND(AVG(Aptitude_Score), 2) AS avg_aptitude_score,
    ROUND(AVG(Internships), 2) AS avg_internships,
    ROUND(AVG(Projects), 2) AS avg_projects,
    ROUND(AVG(Certifications), 2) AS avg_certifications,
    ROUND(AVG(Hackathons), 2) AS avg_hackathons,
    ROUND(AVG(Placement_Preparation_Hours), 2) AS avg_preparation_hours,
    ROUND(AVG(Mock_Interviews), 2) AS avg_mock_interviews,
    ROUND(AVG(Resume_Score), 2) AS avg_resume_score,
    ROUND(AVG(Interview_Score), 2) AS avg_interview_score
FROM student_performance
GROUP BY Placement_Status;