CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR,
  PRIMARY KEY(id)
);

CREATE INDEX patient_id_index ON medical_histories(patient_id ASC);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE INDEX medical_history_id_index ON invoices(medical_history_id ASC);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR,
  name VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE  invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
	invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY(id)
);

CREATE INDEX invoice_id_index ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_index ON invoice_items(treatment_id ASC);

CREATE TABLE medical_history_treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY(id)
);

CREATE INDEX medical_history_index ON medical_history_treatments(medical_history_id ASC);
CREATE INDEX treatment_index ON medical_history_treatments(treatment_id ASC);

