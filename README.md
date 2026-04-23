# Dental Office Database Project

## Overview
This project is a relational database for managing patient information in a dental office. It was designed to model the main operations of a dental clinic, including patient records, staff, visits, treatments, dental records, x-rays, laboratory orders, billing, insurance payments, and self-pay payments. The database was created in SQL Server and implemented using SQL table creation, primary keys, foreign keys, and sample data inserts.

## Project Goals
The goal of this project is to organize and store important dental office data in a structured relational database. The design supports:
- patient information and contact data
- dentist and dental hygienist records
- patient visits and services performed
- dental records and x-rays
- dental laboratory services and lab orders
- billing information
- insurance and self-pay payment tracking 

## Database Name
The SQL script creates and uses the database `Assignment3`, a project for CSE 3153 Database Systems

## Tables Included
This project includes the following tables:

- `Patient`
- `PatientPhone`
- `Dentist`
- `DentalHygienist`
- `Visit`
- `Services`
- `DentalRecord`
- `XRay`
- `DentalLab`
- `LabOrder`
- `Billing`
- `InsurancePayment`
- `SelfPayPayment` 

## Entity Relationships
The database was designed from an ER diagram for a dental clinic. Key relationships include:

- A patient can have one or more phone numbers.
- A patient can have many visits.
- A visit can involve a dentist and/or a dental hygienist.
- A visit can include one or more services.
- A patient has dental records, which may include x-rays.
- A visit may connect to a dental lab through a lab order.
- A visit has billing information.
- Billing can be connected to insurance payment records and self-pay payment records.

## Features
- Uses **primary keys** to uniquely identify each record.
- Uses **foreign keys** to maintain relationships between tables.
- Includes **sample insert statements** for testing.
- Tracks both **insured** and **self-paying** patients through separate payment-related tables.
- Stores clinical, administrative, and financial data in one database design.

## Sample Data
The script includes sample records for:
- 3 patients
- 3 dentists
- 3 dental hygienists
- 3 visits
- 3 services
- 3 dental records
- 3 x-rays
- 3 dental labs
- 3 lab orders
- 3 billing records
- 3 insurance payment records
- 3 self-pay payment records

## Technologies Used
- **SQL**
- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)**

## How to Run
1. Open Microsoft SQL Server Management Studio.
2. Open the SQL script file.
3. Run the script to create the `Assignment3` database.
4. Execute the table creation and insert statements.
5. Use `SELECT *` queries to view the data in each table.

## Purpose of the Project
This project was created to demonstrate database design and implementation skills by turning a dental office business scenario into a working relational database. It shows understanding of ER modeling, table creation, keys, relationships, and SQL data insertion.

## Future Improvements
Possible future improvements for this project include:
- adding more advanced queries and reports
- normalizing additional repeating data where needed
- adding constraints such as `UNIQUE`, `CHECK`, or `NOT NULL` in more places
- creating stored procedures or views
- improving handling of multiple cards, multiple insurance plans, or multiple x-rays per patient visit

## Author
Ria Reddy
