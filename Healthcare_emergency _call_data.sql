CREATE TABLE daily_and_month_call_report (
    year INT,
    month TEXT, -- Why Text while Year is INT
    total_calls INT, 
    total_doctor_consultations INT,
    total_health_info_requests INT,
    total_ambulance_info_requests INT,
    total_complaints INT,
    service_info_calls INT
);

SELECT * FROM healthcare_emergency_call_db.daily_and_month_call_report;
-- 1. Total Calls Per Year
SELECT 
  Year, 
  SUM(`Total Number of Calls`) AS Total_Calls -- Where is this column coming from `Total Number of Calls`
FROM daily_and_month_call_report 
GROUP BY Year;

-- 2. Average Doctor Consultations Per Month
SELECT 
  Month,
  ROUND(AVG(CAST(`Total Number of Doctors Consultancy` AS UNSIGNED)), 2) AS Avg_Doctor_Consultations -- Month of every Year or Month of ANy Year?
FROM daily_and_month_call_report
GROUP BY Month;

-- 3. Total Complaints Per Year and Month
SELECT 
  Year,
  Month,
  SUM(`Number of Total Complaints`) AS Total_Complaints
FROM daily_and_month_call_report
GROUP BY Year, Month;

-- 4. Maximum Health Information Calls Per Year
SELECT 
  Year,
  SUM(`Number of Total Health Information`) AS Total_Health_Info
FROM daily_and_month_call_report
GROUP BY Year;

-- 5. Count of Records Per Year

SELECT 
  Year, 
  COUNT(*) AS Total_Records
FROM daily_and_month_call_report
GROUP BY Year;

-- 6. Total Ambulance Info Calls Per Month
SELECT 
  Month, 
  SUM(`Number of Total Ambulance Information`) AS Total_Ambulance_Calls -- Month of every Year or Month of ANy Year?
FROM daily_and_month_call_report
GROUP BY Month;

-- 7. Percentage of Complaint Calls per Total Calls (Per Year)
SELECT 
  Year,
  SUM(`Number of Total Complaints`) AS Total_Complaints,
  SUM(`Total Number of Calls`) AS Total_Calls,
  ROUND(
    CAST(SUM(`Number of Total Complaints`) AS FLOAT) / NULLIF(SUM(`Total Number of Calls`), 0) * 100, -- Why FLOAT for SUM
    2
  ) AS Complaint_Percentage
FROM daily_and_month_call_report
GROUP BY Year;

-- 8. Average Calls to Know About the Service Per Month
SELECT 
  Month,
  AVG(`Number of Calls To Know About The Service`) AS Avg_Service_Inquiry_Calls -- Month of every Year or Month of ANy Year?
FROM daily_and_month_call_report
GROUP BY Month;







