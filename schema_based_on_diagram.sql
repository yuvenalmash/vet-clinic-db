CREATE TABLE IF NOT EXISTS patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  "name" VARCHAR(20),
  date_of_birth DATE
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admited_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR
)