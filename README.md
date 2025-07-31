# 📅 Medical No-Show Appointments Analysis (PostgreSQL)

This project explores the reasons behind patients missing their scheduled medical appointments. Using PostgreSQL, I will try to analyze key factors such as age, gender, medical conditions, wait time, and SMS reminders to discover trends and inform decision-making for reducing no-show rates.

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
| `no_show`        | Target variable                          |
| `scheduled_day`  | When the appointment was scheduled       |
| `appointment_day`| Actual date of appointment               |

---

## 🗂️ Business Questions Answered with SQL

1. **How many patients did not show up?**
2. **What’s the relationship between gender and no-shows?**
3. **How does age affect no-show rates?**
4. **Does scheduling time (delay) impact attendance?**
5. **Which weekdays have the highest no-show rates?**
6. **Do medical conditions (hypertension, diabetes, alcoholism) affect attendance?**
7. **Do SMS reminders reduce no-shows?**

---

## 🧪 SQL Highlights

- Window functions for age group stats
- Case statements for age bins & wait time bins
- `FILTER()` for conditional counts
- Use of `EXTRACT(DOW)` and `TO_CHAR()` to analyze weekdays
- Summary `VIEW` for interactive dashboards

📝 Full SQL queries available in the [`queries/`](./queries) folder.

---




