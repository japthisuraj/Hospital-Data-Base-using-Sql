create database HospitalDB;
use HospitalDB;

create table if not exists Patients(
PatientID int primary key auto_increment,
FirstName varchar(20),
LastName varchar(20),
DateOfBirth date,
Gender enum('M','F'),
ContactNumber bigint,
Address varchar(255)
);

create table if not exists Doctors(
DoctorID int primary key auto_increment,
FirstName varchar(20),
LastName varchar(20),
Specialization varchar(20),
ContactNumber bigint,
Email varchar(40),
constraint doc_email_uni unique(Email)
);

create table Appointments(
AppointmentID int primary key auto_increment,
PatientID int ,
DoctorID int ,
AppointmentDate date ,
Diagnosis varchar(255),
foreign key (PatientID) references Patients(PatientID)
on update cascade on delete cascade,
foreign key (DoctorID) references Doctors(DoctorID)
on update cascade on delete cascade
);
-- Task 2: Modifying the Tables with DDL Commands

alter table Patients
add column Email varchar(255);

alter table Doctors
modify column ContactNumber varchar(20);

alter table Patients
drop column Address;

alter table Doctors
drop constraint doc_email_uni;

alter table Appointments
rename column Diagnosis to MedicalDiagnosis;

-- Task 3: Data Manipulation with DML Commands

desc Patients;
desc Doctors;
desc Appointments;

insert into Patients(FirstName,LastName,DateOfBirth,Gender,ContactNumber,Email)
values('sunny','kalyanam','2003-04-28','f',356484154,'sunny@.com');

insert into Doctors(FirstName,LastName,Specialization,ContactNumber,Email)
values('dr','bali','psycologist',465431222,'bali@kick.com');

insert into Appointments(AppointmentDate,PatientID,DoctorID,MedicalDiagnosis)
values('2024-09-24',2,1,'onary Artery Disease');

update Doctors
set Specialization =' Heart Specialist'
where DoctorID = 2;

delete from Patients 
where PatientID = 3;

select*from Patients;
select*from Doctors;
select*from Appointments;
