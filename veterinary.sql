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
    specialization VARCHAR(100),
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

CREATE TABLE medical_records (
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
(2, 'Mittens', 'Cat', 'Siamese', '2019-08-15', 'Female', 'Cream', 2),
(3, 'Charlie', 'Dog', 'Beagle', '2017-11-30', 'Male', 'Tricolor', 3),
(4, 'Luna', 'Cat', 'Maine Coon', '2022-10-26', 'Female', 'Blue', 4),
(5, 'Ohm', 'Dog', 'Shih Tzu', '2020-05-20', 'Male', 'Brown', 5),
(6, 'Non', 'Cat', 'Persian', '2021-01-22', 'Male', 'Orange', 6),
(7, 'Nunew', 'Dog', 'Labrador', '2020-02-16', 'Male', 'Black', 7),
(8, 'Caloy', 'Dog', 'Bulldog', '2023-11-21', 'Male', 'Light Blue', 8),
(9, 'Toria', 'Cat', 'Ragdall', '2021-04-07', 'Female', 'White', 9),
(10, 'Hanna', 'Dog', 'Shetland Sheepdog', '2023-07-09', 'Light Brown', 10);