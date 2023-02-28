CREATE TABLE IF NOT EXISTS patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  "name" VARCHAR(20),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admited_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "type" VARCHAR,
  "name" VARCHAR
);

CREATE TABLE IF NOT EXISTS join_medical_history_treatment (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_history_id INTEGER REFERENCES medical_histories(id),
  treatment_id INTEGER REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);
