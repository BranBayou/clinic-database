/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
	id serial primary key,
	name varchar(25),
	date_of_birth date
);

CREATE TABLE medical_histories (
	id serial primary key,
	admited_at timestamp,
	patient_id int references patients(id),
	status varchar(255)
);

CREATE TABLE invoices (
	id serial primary key,
	total_amount decimal,
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id int references medical_histories(id)
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
	invoce_id int references invoices(id),
	treatment_id int references treatments(id)
	);

CREATE TABLE medical_treatmen_helper (
	id serial primary key,
	medical_history_id int references medical_histories(id),
	treatment_id int references treatments(id)
);