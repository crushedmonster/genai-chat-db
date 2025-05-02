-- employees.sql
-- Populates the `employees` tables

USE shoemart;
GO

-- Insert employees data
INSERT INTO employees (employee_id, full_name, job_title, department, business_unit, gender, date_of_birth, hire_date, status, end_date)
VALUES
-- Store Managers
('EMP001', 'Tan Wei Ming', 'Store Manager', 'Management', 'OUT001', 'Male', '1985-03-15', '2018-02-15', 'Active', NULL),
('EMP002', 'Lee Mei Ling', 'Store Manager', 'Management', 'OUT002', 'Female', '1988-07-22', '2019-01-10', 'Active', NULL),
('EMP003', 'Kumar Rajendran', 'Store Manager', 'Management', 'OUT003', 'Male', '1980-11-05', '2019-08-01', 'Active', NULL),
('EMP004', 'Wong Sharon', 'Store Manager', 'Management', 'OUT004', 'Female', '1983-05-18', '2017-10-15', 'Active', NULL),
('EMP005', 'Lim Zhi Wei', 'Store Manager', 'Management', 'OUT005', 'Male', '1986-09-30', '2020-02-01', 'Active', NULL),

-- Full-time Sales Staff
('EMP006', 'Koh Desmond', 'Sales Associate', 'Sales', 'OUT001', 'Male', '1995-04-12', '2019-05-10', 'Active', NULL),
('EMP007', 'Tan Jasmine', 'Sales Associate', 'Sales', 'OUT001', 'Female', '1997-08-25', '2020-01-15', 'Active', NULL),
('EMP008', 'Lim Michael', 'Sales Associate', 'Sales', 'OUT002', 'Male', '1996-02-18', '2019-07-20', 'Active', NULL),
('EMP009', 'Nora Binte Ali', 'Sales Associate', 'Sales', 'OUT002', 'Female', '1998-11-30', '2020-03-01', 'Active', NULL),
('EMP010', 'Thomas Chong', 'Sales Associate', 'Sales', 'OUT003', 'Male', '1996-07-14', '2019-11-15', 'Active', NULL),
('EMP011', 'Siti Normah', 'Sales Associate', 'Sales', 'OUT003', 'Female', '1998-04-05', '2020-02-10', 'Active', NULL),
('EMP012', 'Benjamin Yeo', 'Sales Associate', 'Sales', 'OUT004', 'Male', '1995-12-22', '2019-04-20', 'Active', NULL),
('EMP013', 'Rachel Lau', 'Sales Associate', 'Sales', 'OUT004', 'Female', '1997-06-15', '2019-08-15', 'Active', NULL),
('EMP014', 'Hafiz Mohamed', 'Sales Associate', 'Sales', 'OUT005', 'Male', '1996-09-08', '2020-01-10', 'Active', NULL),
('EMP015', 'Lily Quek', 'Sales Associate', 'Sales', 'OUT005', 'Female', '1998-03-21', '2020-03-15', 'Active', NULL),

-- Part-time Sales Staff
('EMP016', 'Chen Adam', 'Part-time Sales', 'Sales', 'OUT001', 'Male', '2000-02-28', '2021-06-01', 'Active', NULL),
('EMP017', 'Lim Sarah', 'Part-time Sales', 'Sales', 'OUT002', 'Female', '2001-05-17', '2021-06-15', 'Active', NULL),
('EMP018', 'Kumar Raj', 'Part-time Sales', 'Sales', 'OUT003', 'Male', '2002-01-12', '2021-07-01', 'Active', NULL),
('EMP019', 'Zara Hashim', 'Part-time Sales', 'Sales', 'OUT004', 'Female', '2000-11-03', '2021-07-15', 'Active', NULL),
('EMP020', 'Brandon Ng', 'Part-time Sales', 'Sales', 'OUT005', 'Male', '2001-08-20', '2021-05-15', 'Active', NULL),

-- Inactive Employees - Store Staff
('EMP021', 'Jessie Lim', 'Sales Associate', 'Sales', 'OUT001', 'Female', '1996-10-15', '2019-03-10', 'Inactive', '2022-05-30'),
('EMP022', 'Aaron Tan', 'Store Manager', 'Management', 'OUT003', 'Male', '1982-04-25', '2017-06-15', 'Inactive', '2019-07-20'),
('EMP023', 'Michelle Koh', 'Part-time Sales', 'Sales', 'OUT002', 'Female', '1999-12-08', '2020-08-01', 'Inactive', '2021-04-15'),
('EMP024', 'Jeremy Goh', 'Sales Associate', 'Sales', 'OUT004', 'Male', '1997-03-18', '2018-05-22', 'Inactive', '2020-11-15'),
('EMP025', 'Fiona Tay', 'Sales Associate', 'Sales', 'OUT005', 'Female', '1995-06-30', '2019-02-18', 'Inactive', '2021-08-20'),
('EMP026', 'Darren Wong', 'Part-time Sales', 'Sales', 'OUT001', 'Male', '2000-05-12', '2020-06-10', 'Inactive', '2021-12-05'),
('EMP027', 'Natasha Lim', 'Sales Associate', 'Sales', 'OUT003', 'Female', '1998-02-25', '2019-09-12', 'Inactive', '2020-07-30'),

-- HQ Management Staff
('EMP028', 'David Lim', 'CEO', 'Executive', NULL, 'Male', '1970-06-14', '2016-01-05', 'Active', NULL),
('EMP029', 'Stephanie Wong', 'COO', 'Executive', NULL, 'Female', '1972-09-28', '2016-03-10', 'Active', NULL),
('EMP030', 'Wilson Teo', 'Finance Director', 'Finance', NULL, 'Male', '1975-03-30', '2017-05-08', 'Active', NULL),
('EMP031', 'Jennifer Goh', 'HR Director', 'Human Resources', NULL, 'Female', '1976-11-15', '2017-06-12', 'Active', NULL),
('EMP032', 'Raymond Ng', 'Marketing Director', 'Marketing', NULL, 'Male', '1978-07-22', '2018-02-01', 'Active', NULL),

-- HQ Administrative Staff (Finance)
('EMP033', 'Chong Wei Ling', 'Finance Manager', 'Finance', NULL, 'Female', '1982-05-18', '2018-08-15', 'Active', NULL),
('EMP034', 'Steven Lau', 'Senior Accountant', 'Finance', NULL, 'Male', '1985-10-30', '2019-01-21', 'Active', NULL),
('EMP035', 'Grace Tan', 'Accountant', 'Finance', NULL, 'Female', '1990-04-12', '2020-03-16', 'Active', NULL),
('EMP036', 'Daniel Koh', 'Finance Assistant', 'Finance', NULL, 'Male', '1992-07-08', '2021-02-22', 'Active', NULL),

-- HQ Administrative Staff (HR)
('EMP037', 'Priya Sharma', 'HR Manager', 'Human Resources', NULL, 'Female', '1984-09-22', '2018-11-12', 'Active', NULL),
('EMP038', 'Marcus Ong', 'HR Executive', 'Human Resources', NULL, 'Male', '1989-06-14', '2019-05-20', 'Active', NULL),
('EMP039', 'Lily Chen', 'Recruitment Specialist', 'Human Resources', NULL, 'Female', '1991-03-25', '2020-07-13', 'Active', NULL),
('EMP040', 'Farah Binte Yusof', 'HR Assistant', 'Human Resources', NULL, 'Female', '1993-11-30', '2021-04-05', 'Active', NULL),

-- HQ Administrative Staff (Marketing)
('EMP041', 'Amanda Yap', 'Marketing Manager', 'Marketing', NULL, 'Female', '1986-07-17', '2019-03-01', 'Active', NULL),
('EMP042', 'Ryan Tan', 'Digital Marketing Specialist', 'Marketing', NULL, 'Male', '1990-12-05', '2020-01-15', 'Active', NULL),
('EMP043', 'Sophia Lim', 'Marketing Executive', 'Marketing', NULL, 'Female', '1993-08-21', '2020-10-01', 'Active', NULL),
('EMP044', 'Kenneth Goh', 'Marketing Assistant', 'Marketing', NULL, 'Male', '1995-04-18', '2021-06-14', 'Active', NULL),

-- HQ Administrative Staff (IT)
('EMP045', 'Eugene Tay', 'IT Manager', 'IT', NULL, 'Male', '1983-01-28', '2018-09-17', 'Active', NULL),
('EMP046', 'Jason Goh', 'Systems Administrator', 'IT', NULL, 'Male', '1987-11-05', '2019-03-18', 'Active', NULL),
('EMP047', 'Melissa Lee', 'IT Support Specialist', 'IT', NULL, 'Female', '1992-05-10', '2020-04-20', 'Active', NULL),
('EMP048', 'Vincent Loh', 'IT Assistant', 'IT', NULL, 'Male', '1994-09-03', '2021-05-10', 'Active', NULL),

-- HQ Administrative Staff (Operations)
('EMP049', 'Derrick Tan', 'Operations Manager', 'Operations', NULL, 'Male', '1981-08-15', '2018-07-02', 'Active', NULL),
('EMP050', 'Karen Lim', 'Logistics Coordinator', 'Operations', NULL, 'Female', '1987-03-12', '2019-04-08', 'Active', NULL),
('EMP051', 'Amir Bin Hassan', 'Supply Chain Specialist', 'Operations', NULL, 'Male', '1989-10-25', '2020-02-17', 'Active', NULL),
('EMP052', 'Jasmine Teo', 'Purchasing Executive', 'Operations', NULL, 'Female', '1992-12-18', '2021-01-11', 'Active', NULL),

-- Inactive Employees - HQ Staff
('EMP053', 'Timothy Chew', 'Finance Manager', 'Finance', NULL, 'Male', '1980-11-30', '2017-04-15', 'Inactive', '2019-08-31'),
('EMP054', 'Linda Kwan', 'HR Executive', 'Human Resources', NULL, 'Female', '1986-02-28', '2018-03-10', 'Inactive', '2020-06-15'),
('EMP055', 'Vijay Sharma', 'IT Support Specialist', 'IT', NULL, 'Male', '1990-07-14', '2019-01-08', 'Inactive', '2019-11-22'),
('EMP056', 'Susan Lee', 'Marketing Executive', 'Marketing', NULL, 'Female', '1992-09-05', '2019-06-20', 'Inactive', '2021-02-28'),
('EMP057', 'Victor Tan', 'Operations Coordinator', 'Operations', NULL, 'Male', '1985-04-17', '2018-10-01', 'Inactive', '2020-09-15'),
('EMP058', 'Michael Chan', 'Accountant', 'Finance', NULL, 'Male', '1988-06-22', '2018-05-10', 'Inactive', '2021-07-31'),
('EMP059', 'Jessica Wong', 'Recruitment Specialist', 'Human Resources', NULL, 'Female', '1990-01-15', '2019-08-12', 'Inactive', '2022-01-15');