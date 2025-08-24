USE watu_credit;

-- Insert clients
INSERT INTO client (client_id, first_name, middle_name, last_name, date_of_birth)
VALUES
(1, 'Paul', 'Anthony', 'Omondi', '1990-04-12'),
(2, 'Mary', 'Paul', 'Atieno', '1995-07-20'),
(3, 'John', 'Michael', 'Doe', '2002-09-15'),
(4, 'James', 'Paul', 'Otieno', '1998-03-10'),
(5, 'Lucy', 'Ann', 'Wanjiru', '2000-01-25');

-- Insert vehicles
INSERT INTO vehicle (vehicle_id, make, model_name)
VALUES
(201, 'Honda',  'Ace CB 125CC'),
(202, 'Yamaha', 'YZF 150CC'),
(203, 'Suzuki', 'GSX 100CC'),
(204, 'Toyota', 'Corolla X'),
(205, 'Bajaj',  'Boxer 125CC');

-- Insert loans
INSERT INTO loan (loan_id, client_id, vehicle_id, principal_amount, submitted_on_date)
VALUES
(101, 1, 201, 1200.00, '2020-05-12'),
(102, 1, 202, 1500.00, '2021-06-18'),
(103, 2, 203,  800.00, '2019-03-25'),
(104, 4, 204, 2000.00, '2022-01-15'),
(105, 4, 202, 2500.00, '2023-07-10');
