-- Total records
SELECT COUNT(*) FROM medical_appointments;

---Cheking Columns
SELECT * FROM medical_appointments;


---Descriptive Statistics
---Goal: Understand general patterns.

---Key Questions:
---How many appointments were No-Shows vs. Shows?

-- No-show counts

 select 
 no_show,
 count(*) as count
 FROM medical_appointments
 GROUP BY no_show;
 
---***'No'	The patient showed up
--  'Yes'	The patient did not show up (a "no-show")

--- Gender distribution

select 
 gender,
 count(*) as count
 FROM medical_appointments
 GROUP BY gender;


----📌 Time Analysis
--- Goal: Examine how scheduling time affects attendance.
--- To analyze how scheduling time affects attendance,
--- I'll examine the waiting time between when a patient schedules the appointment 
--- and the actual appointment date. 
--- Longer waiting times might increase no-shows.

SELECT 
    no_show,
    ROUND(AVG(EXTRACT(DAY FROM appointment_day - scheduled_day)), 2) AS avg_waiting_days,
    COUNT(*) AS total_appointments
FROM medical_appointments
WHERE appointment_day >= scheduled_day
GROUP BY no_show;

--no_show	Meaning
--'No'	The patient showed up
--'Yes'	The patient did not show up (a "no-show")

-- Which days of the week have more no-shows?

-- Weekday effect

select
extract(dow from appointment_day) as weekday,
no_show,
count(*) as count
FROM medical_appointments
group by 1,2
order by weekday;

 ---Which day of the week has the highest no-show rates?

select
to_char(appointment_day,'day') as weekday,
count(*) as total_appointments
FROM medical_appointments
group by 1
order by total_appointments desc;

--waiting time analysis





--**Influence of Patient Characteristics

--Goal: How do health conditions and demographics impact appointment attendance?

--We'll look at:

--Gender

--Age Groups

--Medical Conditions: Hypertension, Diabetes, Alcoholism, Scholarship (social program), and SMS reminders

---1️⃣ No-Show Rate by Gender

SELECT gender,
count(*)
FROM medical_appointments
where no_show='Yes'
group by gender;



SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 18 THEN '0-18'
        WHEN age BETWEEN 19 AND 35 THEN '19-35'
        WHEN age BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+' 
    END AS age_group,
    COUNT(*) 
FROM medical_appointments
GROUP BY age_group;

---checking columns

select * from medical_appointments


-- 3️⃣ No-Show Rate by Medical Condition (One by one)

--Hypertension:


SELECT 
    hypertension,
    COUNT(*) AS total,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS no_shows,
    ROUND(100.0 * COUNT(*) FILTER (WHERE no_show = 'Yes') / COUNT(*), 2) AS no_show_rate
FROM medical_appointments
GROUP BY hypertension;


SELECT 
    diabetes,
    COUNT(*) AS total,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS no_shows,
    ROUND(100.0 * COUNT(*) FILTER (WHERE no_show = 'Yes') / COUNT(*), 2) AS no_show_rate
FROM medical_appointments
GROUP BY diabetes;

---5️⃣ Do SMS Reminders Reduce No-Shows?

select 
sms_received,
count(*) as total
from medical_appointments
group by 1

--
SELECT 
    sms_received,
    COUNT(*) AS total_appointments,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS no_shows,
    ROUND(100.0 * COUNT(*) FILTER (WHERE no_show = 'Yes') / COUNT(*), 2) AS no_show_rate
FROM medical_appointments
GROUP BY sms_received;

--- Neighbourhood Analysis

SELECT 
       neighbourhood,
       COUNT(*) AS total_appointments
FROM medical_appointments
GROUP BY neighbourhood
order by 2 desc
LIMIT 10;


--- 📊 Summary Table View (Optional)

CREATE VIEW appointment_summary AS
SELECT 
    gender,
    scholarship,
    hypertension,
    diabetes,
    alcoholism,
    sms_received,
    COUNT(*) AS total_appointments,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS total_no_shows,
    ROUND(COUNT(*) FILTER (WHERE no_show = 'Yes') * 100.0 / COUNT(*), 2) AS no_show_percentage
FROM medical_appointments
GROUP BY gender, scholarship, hypertension, diabetes, alcoholism, sms_received;

---
SELECT * FROM appointment_summary LIMIT 10;

---
SELECT COUNT(*) FROM medical_appointments;

