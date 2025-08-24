-- Create database
CREATE DATABASE watu_credit;

-- Select database
USE watu_credit;

-- Create client table
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- Create vehicle table
CREATE TABLE vehicle (
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(50),
    model_name VARCHAR(100)
);

-- Create loan table
CREATE TABLE loan (
    loan_id INT PRIMARY KEY,
    client_id INT,
    vehicle_id INT,
    principal_amount DECIMAL(10,2),
    submitted_on_date DATE,
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id)
);
