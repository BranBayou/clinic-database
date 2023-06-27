/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic-database;

CREATE TABLE patients (
	id serial primary key,
	name varchar(25),
	date_of_birth date
);

CREATE TABLE medical_histories (
	id serial primary key,
	admited_at timestamp,
	patient_id int,
	foreign key (patient_id) references patients(id),
	status varchar(255)
);

CREATE TABLE invoices (
	id serial primary key,
	total_amount decimal,
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id int, 
	foreign key (medical_history_id) references medical_histories(id)
);

CREATE TABLE treatments (
	id serial primary key,
	type varchar(25),
	name varchar(25)
);

CREATE TABLE invoice_items (
	id serial primary key,
	unit_price decimal,
	quantity int,
	total_price decimal,
	invoce_id int,
	treatment_id int,
	foreign key (invoce_id) references invoices(id),
	foreign key (treatment_id) references treatments(id)
);

CREATE TABLE medical_treatment_helper (
	id serial primary key,
	medical_history_id int,
	treatment_id int,
	foreign key (medical_history_id) references medical_histories(id),
	foreign key (treatment_id) references treatments(id)
);

CREATE INDEX ON medical_treatment_helper (medical_history_id);
CREATE INDEX ON medical_treatment_helper (treatment_id);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoice_items (invoce_id);
