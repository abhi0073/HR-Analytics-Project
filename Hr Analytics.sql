Create database HR_Analytics;

Use HR_Analytics;

/* KPI CARD1 : Total Employee */

select count(`EmployeeNumber`) as Total_Employee
from `hr_1`;

/* KPI CARD2 : Attrition Count */

select count(`Attrition`) as Attrition_Count
from `hr_1`
where `Attrition` = 'Yes';

/* KPI CARD3 : Average Age */

select round(avg(`Age`),0) as Average_Age
from `hr_1`;

/* KPI CARD4 : Attrition Rate */

select concat(round(count(`Attrition`) / (select
count(`Attrition`) from `hr_1`) * 100,2), "%") as AttritionRate
from `hr_1`
where `Attrition` = 'Yes';

/* KPI 1 : Average Attrition rate for each Departments */

select `Department`, concat(round(count(`Attrition`) / (select
count(`Attrition`) from `hr_1`) * 100 / 2,2), "%") as AttritionRate 
from `hr_1` where `Attrition` = 'Yes'
group by `Department`
order by count(`Attrition`) desc;

/* KPI 2 : Average Hourly rate of Male Research Scientist */

select `JobRole`, avg(`HourlyRate`) as Avg_hourlyRate
from `hr_1`
where `JobRole` = 'Research Scientist' and `Gender` = 'Male'
group by `JobRole`;

/* KPI 3 : Attrition rate Vs Monthly income stats */

select concat(round(count(`Attrition`) / (select
count(`Attrition`) from `hr_1`) * 100,2), "%") as AttritionRate, 
round(avg(`MonthlyIncome`),2) as MonthlyIncomeStats
from `hr_1` join `hr_2`
on `hr_1`.`EmployeeNumber` = `hr_2`.`Employee ID`
where `Attrition` = 'Yes';

/* KPI 4 : Average working years for each Department */

select `Department`, avg(`TotalWorkingYears`) as AverageWorkingYear
from `hr_1` join `hr_2`
on `hr_1`.`EmployeeNumber` = `hr_2`.`Employee ID`
group by `Department`;

/* KPI 5 : Job Role Vs Work life balance */

select `JobRole`, count(`WorkLifeBalance`)
from `hr_1` join `hr_2`
on `hr_1`.`EmployeeNumber` = `hr_2`.`Employee ID`
group by `JobRole`;

/* KPI 6 : Attrition rate Vs Year since last promotion relation */

select concat(round(count(`Attrition`) / (select
count(`Attrition`) from `hr_1`) * 100,2), "%") as AttritionRate, 
round(avg(`YearsSinceLastPromotion`),0) as YearSinceLastPromotion
from `hr_1` join `hr_2`
on `hr_1`.`EmployeeNumber` = `hr_2`.`Employee ID`
where `Attrition` = 'Yes';
