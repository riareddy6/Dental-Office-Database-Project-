CREATE DATABASE Assignment3;
GO

USE Assignment3;
GO


--Patient Entity -------------------------------------------------
Create Table Patient(
	PatientID	INT	Primary KEY,
	FName	VarChar(30)	Not Null,
	LName	VarChar(30)	Not Null,
	Email	VarChar(30)	Not Null,
	DOB		Date,
	Age		INT,
	Street	VarChar(50),
	City	VarChar(50),
	State	VarChar(30),
	ZipCode	VarChar(15)
);

Insert Into Patient Values
(1, 'Ria', 'Reddy', 'riareddy@gmail.com', '2007-11-16', 18, '1234 Candy Lane', 'Atlanta','GA', '30040'),
(2, 'Santa', 'Claus', 'whitebeard@np.com', '2002-1-1', 24, '777 NorthPoint Drive', 'Atlanta', 'GA', '30020'),
(3, 'George', 'Washington', 'georgie@usa.org', '2000-2-2', 26, '911 Graveyard St','Atlanta', 'GA', '30067');

SELECT * FROM Patient;

--Patient Phone Number -------------------------------------------------

CREATE TABLE PatientPhone (
    PhoneID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    PhoneNumber VarChar(15) NOT NULL,
    Foreign Key (PatientID) references Patient(PatientID)
);


Insert into PatientPhone Values
(1, 1, '111-111-1111'),
(2,2, '222-222-2222'),
(3,3,'333-333-3333');

Select * from PatientPhone;


--Dentist Table -------------------------------------------------
Create Table Dentist(
	DentistID	INT				Primary Key,
	FName		VarChar(30)		Not Null,
	LName		VarChar(30)		Not Null,
	Salary		Decimal(10,2),
	DOB			Date,
	Phone		VarChar(15),
	Email		VarChar(30),
	Street	VarChar(50),
	City	VarChar(50),
	State	VarChar(30),
	ZipCode	VarChar(15)
);

Insert Into Dentist Values
(1001, 'Emma', 'Stone', 149000.05, '1750-04-03', '123-456-7890', 'emst@dentist.com', '456 Main St', 'Atlanta', 'GA', '30041'),
(1002, 'Ashley', 'Tisdale', 123456.78, '2024-02-09', '676-767-6767', 'ashtis67@dentist.com', '67 Hill Rd', 'Atlanta', 'GA', '30067'),
(1003, 'Bob', 'Marly', 100700.40, '1896-01-07', '135-579-1113', 'marmarlade@dentist.com', '123 Da St', 'Atlanta', 'GA', '30024');

Select * from Dentist;


--Dental Hygienist -------------------------------------------------
Create Table DentalHygienist (
	HygienistID		INT				Primary Key,
	FName			VarChar(30)		Not Null,
	LName			VarChar(30)		Not Null,
	Salary			Decimal(10,2),
	DOB				Date,
	Phone			VarChar(15),
	Email			VarChar(30),
	Street			VarChar(50),
	City			VarChar(50),
	State			VarChar(30),
	ZipCode			VarChar(15)
);

Insert into DentalHygienist Values
(2001, 'Pennsylvania', 'Smith', 670670.67, '2003-06-07', '123-123-1234', 'pennpennsm@hyg.org', '456 Sparkle Ln', 'Atlanta', 'GA', '30670'),
(2002, 'Sue', 'Heck', 456789.10, '2001-05-20', '456-123-6789', 'hecks@hyg.org', '334 Brushing Dr', 'Alpharetta', 'GA', '30012'),
(2003, 'Virginia', 'Woolf', 889889.89, '2000-08-09', '889-889-8889', 'awoooolf@hyg.org', '999 Lucky St', 'Marietta', 'GA', '30049');

Select * from DentalHygienist;


--Visit Table -------------------------------------------------
Create Table Visit (
	VisitID				INT		Primary Key,
	PatientID			INT		Not Null,
	DentistID			INT		Null,
	HygienistID			INT		Null,
	VisitDate			Date	Not Null,
	CurrentTreatment	VarChar(200),
	Cost				Decimal(10,2),
	NextVisit			Date,
	
	Foreign Key (PatientID) References Patient(PatientID),
	Foreign Key (DentistID) References Dentist(DentistID),
	Foreign Key (HygienistID) References DentalHygienist(HygienistID)
);

Insert into Visit Values
(3001, 1, 1001, 2001, '2026-01-01', 'Root Canal', 5000.00, '2026-02-01'),
(3002, 2, 1002, 2002, '2025-04-01', 'Professional Whitening', 2500.50, '2025-12-01'),
(3003, 3, 1003, 2003, '2025-08-03', 'Cavity Excavation', 6000.60, '2025-09-03');


--Services table -------------------------------------------------

Create Table Services (
	ServiceID			INT				Primary Key,
	VisitID				INT				Not Null,
	ServiceName			VarChar(50)		Not Null,
	ServiceDescription	VarChar(200),
	ServiceCost			Decimal(10,2),
	Foreign Key (VisitID) References Visit(VisitID)
);

Insert into Services values
(4001, 3001, 'Root Canal', 'Root canal procedure.', 5000.00),
(4002, 3002, 'Professional Whitening', 'Professional Teeth whitening service', 2500.50),
(4003, 3003, 'Cavity Excavation', 'Deep cavity excavation service.', 6000.60);

SELECT * FROM Services;


--DentalRecord -------------------------------------------------
Create Table DentalRecord(
	RecordID	INT		Primary Key,
	PatientID	INT		Not Null,
	PastProcedures	VarChar(300),
	
	Foreign Key (PatientID) References Patient(PatientID)
);

Insert into DentalRecord Values
(5001, 1, 'Prior cavities'),
(5002, 2, 'Gingivitis'),
(5003, 3, 'No past procedures');

Select * from DentalRecord;

--X-ray -------------------------------------------------
Create Table XRay(
	XrayID		INT		Primary Key,
	RecordID	INT		Not Null,
	VisitID		INT		Not Null,
	XRayDate	Date,
	Foreign Key (RecordID) References DentalRecord(RecordID),
	Foreign Key (VisitID) References Visit(VisitID)
);

Insert into XRay Values
(6001, 5001, 3001, '2026-01-01'),
(6002, 5002, 3002, '2025-02-01'),
(6003, 5003, 3003, '2024-09-08');

Select * from XRay;

--Dental Lab -------------------------------------------------
Create Table DentalLab(
	LabID			INT		Primary Key,
	LabName			VarChar(100)	Not Null,
	Phone			VarChar(15),
	Email			VarChar(30),
	Street			VarChar(50),
	City			VarChar(50),
	State			VarChar(30),
	ZipCode			VarChar(15),
	ServiceType		VarChar(100),
	ServiceCost		Decimal(10,2),
	SupplyType		VarChar(100),
	SupplyCost		Decimal(10,2)
);

Insert Into DentalLab Values
(7001, 'Smile Lab', '111-222-3344', 'lab@smilelab.org', '345 N Main St', 'Atlanta', 'GA', '30049', 'Denture Molding', 5000.00, 'Model teeth displays', 300.00),
(7002, 'Dental Depot', '223-334-4456', 'lab@ddepot.org', '582 Downtown Dr', 'Atlanta', 'GA', '31004', 'Custom Retainers', 10000.50, 'Lab Equipment Sanitizer', 2000.00),
(7003, 'Simply Smiles', '595-237-7238', 'lab@simsm.org', '383 Banana Circle', 'Atlanta', 'GA', '30154', 'Scanning Hardware Replacement', 23000.40, 'Hygienist Kits', 3000.00);

Select * from DentalLab;


--LabOrder -------------------------------------------------

Create Table LabOrder(
	OrderID			INT		Primary Key,
	VisitID			INT		Not Null,
	LabID			INT		Not Null,
	Foreign Key (VisitID) References Visit(VisitID),
	Foreign Key	(LabID) References DentalLab(LabID)
);
	
Insert into LabOrder values
(8001, 3001, 7001),
(8002, 3002, 7002),
(8003, 3003, 7003);

Select * from LabOrder;


--Billing -------------------------------------------------
Create Table Billing(
	BillingID		INT		Primary Key,
	VisitID			INT		Not Null,
	BillingDate		Date,
	AmountOwed		Decimal(10,2),
	PaymentMethod	VarChar(30),
	BillingStatus	VarChar(30),
	Foreign Key (VisitID) References Visit(VisitID)
);

Insert into Billing values
(9001, 3001, '2026-01-01', 5000.00, 'Credit Card', 'Paid'),
(9002, 3002, '2025-12-01', 2500.50, 'Wire Transfer', 'Paid'),
(9003, 3003, '2025-09-03', 6000.60, 'Debit Card', 'Pending');

Select * From Billing;

--Insurance Payment-------------------------------------------------

Create Table InsurancePayment(
	InsurancePaymentID		INT		Primary Key,
	BillingID				INT		Not Null,
	PaymentDate				Date,
	InsuranceProvider		VarChar(100),
	PolicyNumber			VarChar(100),
	ProviderPhone			VarChar(20),
	AmountCovered			Decimal(10,2),
	Foreign Key (BillingID) References Billing(BillingID)
);

Insert into InsurancePayment values
(1010, 9001, '2026-01-01', 'Aetna Dental', '0057', '124-125-8493', 900.00),
(1011, 9002, '2025-12-01', 'Cigna', '0009', '027-638-9276', 790.00),
(1012, 9003, '2025-09-03', 'Delta Dental', '0012', '872-673-8328', 2300.00);

Select * from InsurancePayment

--Self-pay -------------------------------------------------
Create Table SelfPayPayment(
	SelfPayID			INT			Primary Key,
	BillingID			INT			Not Null,
	PaymentDate			Date,
	Amount				Decimal(10,2),
	CardType			VarChar(20),
	CardNumber			VarChar(30),
	ExpirationDate		Date,
	SecurityNumber		VarChar(15),
	Foreign Key (BillingID) References Billing(BillingID)
);

Insert into SelfPayPayment Values
(1100, 9001, '2026-01-01', 4100.00, 'Credit', '986789', '2028-03-04', '097'),
(1110, 9002, '2025-12-01', 1710.50, 'Debit', '987890', '2030-05-09', '457'),
(1120, 9003, '2025-09-03', 3700.60, 'Debit', '457536', '2027-05-07', '754');

Select * from SelfPayPayment





--- NEW SECTION: ASSIGNMENT 4 -------------------------------------------------

--- 1. List of details of all insured Patients (join patient and insurance company tables). ----------
Select
	Pat.PatientID,
	Pat.FName,
	Pat.LName,
	IP.InsuranceProvider,
	IP.PolicyNumber,
	IP.AmountCovered
From Patient Pat

---Joins 
Join Visit Vis
	On Pat.PatientID = Vis.PatientID
Join Billing Bil 
	On Vis.VisitID = Bil.VisitID
Join InsurancePayment IP
	On Bil.BillingID = IP.BillingID 




--- 2. List of all patients’ details and their card information (join patient, card, and payment tables) ---
Select 
	Pat.PatientID,
	Pat.FName,  
	Pat.LName, 
	Pat.Email,
	SP.CardType,
	SP.CardNumber, 
	SP.ExpirationDate

From Patient Pat
 
--- Joins
Join Visit Vis
	On Pat.PatientID=Vis.PatientID
Join Billing Bil
	On Vis.VisitID =Bil.VisitID 
Join SelfPayPayment SP
	On Bil.BillingID=SP.BillingID


---- 3. List all the details about patients who have visited dentists/hygienists --------------------
Select 
	Pat.PatientID,
	Pat.FName,
	Pat.LName,
	Vis.VisitDate,
	Vis.CurrentTreatment,
	
	Den.FName + ' ' + Den.LName AS DentistName,
    Hyg.FName + ' ' + Hyg.LName AS HygienistName

From Patient Pat

---Join
Join Visit Vis
	On Pat.PatientID =Vis.PatientID
Join Dentist Den  
	On Vis.DentistID=Den.DentistID
Join DentalHygienist Hyg  
	On Vis.HygienistID= Hyg.HygienistID 




---4. List the information of the staff (dentists and hygienists) alphabetically. ------------------
Select 
	Den.FName,
	Den.LName,
	Den.Email,
	Den.Phone,

	'Dentist' as StaffRole
From Dentist Den

Union



Select
	Hyg.FName,
	Hyg.LName,
	Hyg.Email,
	Hyg.Phone,

	'Hygienist' as StaffRole

FROM DentalHygienist Hyg

Order by LName, FName




--- 5. List of patients and total price they paid so far--------------------------------------------
Select
	Pat.PatientID,
	Pat.FName,
	Pat.LName,

	Sum(IP.AmountCovered + SP.Amount) as TotalPaid

	From Patient Pat 

---Joins
Join Visit Vis
	On Pat.PatientID=Vis.PatientID 
Join Billing Bil
	On Vis.VisitID=Bil.VisitID 
Join InsurancePayment IP
	On Bil.BillingID= IP.BillingID
Join SelfPayPayment SP  
	On Bil.BillingID =SP.BillingID

---By patient
Group by
	Pat.PatientID,  
	Pat.FName, 
	Pat.LName


---6. List the patient information that paid the most. ---------------------------------------------
Select top 1
	Pat.PatientID,  
	Pat.FName, 
	Pat.LName,

    Sum(IP.AmountCovered + SP.Amount) as TotalPaid

From Patient Pat


--Joins
Join Visit Vis
	On Pat.PatientID=Vis.PatientID
Join Billing Bil
	On Vis.VisitID=Bil.VisitID
Join InsurancePayment IP
	On Bil.BillingID=IP.BillingID
Join SelfPayPayment SP
	On Bil.BillingID=SP.BillingID

Group by
	Pat.PatientID,  
	Pat.FName, 
	Pat.LName
	
---sort highest
Order by TotalPaid Desc