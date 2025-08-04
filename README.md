# 📅 Medical No-Show Appointments Analysis with PostgreSQL

With this project I will try to analyze key factors such as age, gender, medical conditions, waiting time, and SMS reminders to discover trends and inform decision-making for reducing no-show rates using PostgreSQL .

---

## 📦 Dataset Overview

- **Source:** [Kaggle - Medical Appointment No Shows](https://www.kaggle.com/datasets/joniarroba/noshowappointments)
- **Region:** Brazil (May 2016)
- **Size:** ~110K appointments
- **Target Column:** `no_show`  
  - `'Yes'` → Patient did **not** show up  
  - `'No'` → Patient attended

### 🔍 Key Columns

| Column           | Description                              |
|------------------|------------------------------------------|
| `gender`         | Patient's gender                         |
| `age`            | Patient's age                            |
| `scholarship`    | If enrolled in welfare program           |
| `hypertension`   | 0 or 1                                   |
| `diabetes`       | 0 or 1                                   |
| `alcoholism`     | 0 or 1                                   |
| `sms_received`   | 1 if SMS reminder was sent               |
| `no_show`        | 'No'` → Patient attended                          |
| `scheduled_day`  | When the appointment was scheduled       |
| `appointment_day`| Actual date of appointment               |

---

## 🗂️ Business Questions Answered with SQL

1. **How many patients did not show up?**
2. **What’s the relationship between gender and no-shows?**
3. **How does age affect no-show rates?**
4. **Does scheduling time (delay) impact attendance?**
5. **Which weekdays have the highest no-show rates?**
6. **Do medical conditions (hypertension, diabetes) affect attendance?**
7. **Do SMS reminders reduce no-shows?**

---

## 🧪 SQL Highlights

- Window functions for age group stats
- Case statements for age bins & wait time bins
- `FILTER()` for conditional counts
- Use of `EXTRACT(DOW)` and `TO_CHAR()` to analyze weekdays
- Summary `VIEW` for interactive dashboards

📝 Full SQL queries available in the [`queries/`](./queries) folder.


## 📊  Key Insights 
1. 📉 Overall No-Show Rate
Approximately 20.19% of patients miss their appointments.  That's 1 in 5 patients. That means approximately 1 in 5 appointments are missed. of scheduled medical appointments were missed.


➕ The reasons for this can be investigated in more detail. A root cause analysis can be conducted by conducting a survey using automated phone calls to those who do not show up for their appointments.
2. 👩‍⚕️👨‍⚕️ Gender  & No-Show Behavior
Women had more total appointments than men.


However, women no-show rates more than very similar across genders.


➕ Even though Gender strongly influence tcount of  appointments no show rates very similar across genders.
3. ⏱️ Waiting Time Between Scheduling & Appointment
The average waiting time for attended appointments is 14 days, while the average waiting time for unattended appointments is 16 days.
The group that does not show up for their appointment waits an average of 2 days longer.
➕ Criteria can be determined for detailed investigation of how the average waiting time affects whether or not to attend an appointment.
4. 📆 Day of the Week Impact
Wednesday was the day with the most appointment registrations, with 20.774 and it is the day with the highest number of appointments booked. Saturday was the day with the fewest appointments booked.
5. ⚕️ No Show rate  by Medical Conditions 

Patients with hypertension have a lower no-show rate (17.30%) compared to those without hypertension (20.90%).
Patients with diabetes also have a lower no-show rate (18.00%) than those without (20.36%).


6. 📲 SMS Reminder Effectiveness
Surprisingly, patients who received SMS reminders had a significantly higher no-show rate than those who did not receive SMS reminders.
7. 👶👵👨‍🦱 Age Distribution & Attendance
0–18 Age Group has the highest number of appointments (28,866), which may reflect:
60+ Age Group has the lowest number of appointments (19,763), although they typically require more care.
➕ This might suggest access issues, mobility problems, or fewer scheduled appointments due to other reasons.So , this details are so important for for sales and marketing planning.

##  📦 Tools Used

*-PostgreSQL
- SQL Window Functions, Filters, Views
-  Tableau and Looker Studio for dashboards

---




