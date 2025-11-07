CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);
CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    amount DECIMAL(10, 2),
    issuedate DATE,
    paid BOOLEAN,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    visitdate DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    doctorid INT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Mae', 'Betangcor', 'Kawit', '09171234567', 'mae@example.com'),
(2, 'Arriane', 'Sasuya', 'Lipa City', '09181234567', 'arriane@example.com'),
(3, 'Andrea', 'Dela Cruz', 'Alitagtag', '09191234567', 'andrea@example.com'),
(4, 'Eam', 'Mendoza', 'Cuenca', '09201234567', 'eam@example.com'),
(5, 'Liza', 'Torres', 'Tanauan', '09211234567', 'liza@example.com'),
(6, 'Carla', 'Ramos', 'Laiya', '09221234567', 'carla@example.com'),
(7, 'Luis', 'Garcia', 'Balintawak', '09231234567', 'luis@example.com'),
(8, 'Ella', 'Fernandez', 'Bulacan', '09241234567', 'ella@example.com'),
(9, 'Marco', 'Diaz', 'Marawoy', '09251234567', 'marco@example.com'),
(10, 'Nina', 'Cruz', 'Dagatan', '09261234567', 'nina@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Labrador Retriever', '2018-05-20', 'Male', 'Yellow', 1),
(2, 'Simba', 'Cat', 'Siamese', '2019-08-15', 'Female', 'Cream', 2),
(3, 'Charlie', 'Dog', 'Beagle', '2017-11-30', 'Male', 'Tricolor', 3),
(4, 'Luna', 'Cat', 'Maine Coon', '2022-10-26', 'Female', 'Blue', 4),
(5, 'Ohm', 'Dog', 'Shih Tzu', '2020-05-20', 'Male', 'Brown', 5),
(6, 'Non', 'Cat', 'Persian', '2021-01-22', 'Male', 'Orange', 6),
(7, 'Nunew', 'Dog', 'Labrador', '2020-02-16', 'Male', 'Black', 7),
(8, 'Caloy', 'Dog', 'Bulldog', '2023-11-21', 'Male', 'Light Blue', 8),
(9, 'Toria', 'Cat', 'Ragdall', '2021-04-07', 'Female', 'White', 9),
(10, 'Hanna', 'Dog', 'Shetland Sheepdog', '2023-07-09', 'Light Brown', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2023-01-05', 'Check-up'),
(2, 2, '2023-01-10', 'Vaccination'),
(3, 3, '2023-02-02', 'Injury treatment'),
(4, 4, '2023-02-15', 'Dental cleaning'),
(5, 5, '2023-03-10', 'Skin issue'),
(6, 6, '2023-03-10', 'Flea treatment'),
(7, 7, '2023-04-12', 'Vaccination'),
(8, 8, '2024-04-18', 'Surgery'),
(9, 9, '2023-05-02', 'Allergy check'),
(10, 10, '2024-09-20', 'Eye infection');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE Owners ADD COLUMN registereddate DATE;

ALTER TABLE invoices RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments 
WHERE animalid = (SELECT animalid FROM animals WHERE name = 'Simba' AND species = 'Cat');

UPDATE THE LASTNAME oF 'Dr. Sofia' to 'Reyes-Gonzales'
UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dfirstname = 'Dr.Sofia' AND dlastname = 'Reyes';

SELECT DISTINCT species FROM animals;

SELECT SUM(totalamount) AS total_sales FROM invoices;

SELECT COUNT(*) AS total_appointments
FROM appointments a
JOIN animals an ON a.animalid = an.animalid
JOIN Owners o ON an.ownerid = o.ownerid
WHERE o.ofirstname = 'Jane';

SELECT a.name, COUNT(*) AS appointment_count
FROM appointments ap
JOIN animals a ON ap.animalid = a.animalid
GROUP BY a.animalid, a.name
ORDER BY appointment_count DESC
LIMIT 1;