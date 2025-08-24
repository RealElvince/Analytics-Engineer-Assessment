USE watu_credit;

-- Q1: Clients named Paul and older than 25 years
SELECT 
    client_id,
    first_name,
    middle_name,
    last_name,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS client_age
FROM client
WHERE (first_name = 'Paul' OR middle_name = 'Paul')
  AND TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 25
ORDER BY client_age DESC;

-- Q2: Extend Q1 with number of loans
SELECT 
    c.client_id,
    c.first_name,
    c.middle_name,
    c.last_name,
    TIMESTAMPDIFF(YEAR, c.date_of_birth, CURDATE()) AS client_age,
    COALESCE(COUNT(l.loan_id), 0) AS number_of_loans
FROM client c
LEFT JOIN loan l ON c.client_id = l.client_id
WHERE (c.first_name = 'Paul' OR c.middle_name = 'Paul')
  AND TIMESTAMPDIFF(YEAR, c.date_of_birth, CURDATE()) > 25
GROUP BY c.client_id, c.first_name, c.middle_name, c.last_name, c.date_of_birth
ORDER BY client_age DESC;

-- Q3: Vehicles filtered by engine size 100cc, 125cc, 150cc
SELECT 
    vehicle_id,
    make,
    model_name,
    REGEXP_SUBSTR(model_name, '[0-9]+') AS engine_size
FROM vehicle
WHERE REGEXP_SUBSTR(model_name, '[0-9]+') IN ('100','125','150');

-- Q4: Total principal per client full name and vehicle make
SELECT 
    CONCAT_WS(' ', c.first_name, c.middle_name, c.last_name) AS full_name,
    v.make,
    SUM(l.principal_amount) AS total_principal
FROM client c
JOIN loan l ON c.client_id = l.client_id
JOIN vehicle v ON l.vehicle_id = v.vehicle_id
GROUP BY full_name, v.make;

-- Q5: Chronological loan order per client
SELECT 
    loan_id,
    client_id,
    vehicle_id,
    principal_amount,
    submitted_on_date,
    ROW_NUMBER() OVER (PARTITION BY client_id ORDER BY submitted_on_date ASC) AS loan_order
FROM loan;
