create database project

CREATE TABLE userx
(
  userx_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  password VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  gender VARCHAR(7) NOT NULL,
  email VARCHAR(45) NOT NULL,
  user_type VARCHAR(10) NOT NULL,
  PRIMARY KEY (userx_id)
);

CREATE TABLE vehcile
(
  vehcile_id INT NOT NULL,
  license_plate_no VARCHAR(10) NOT NULL,
  vehciletype VARCHAR(10) NOT NULL,
  PRIMARY KEY (vehcile_id)
);

CREATE TABLE promocode
(
  isEnabaled VARCHAR(5) NOT NULL,
  code INT NOT NULL,
  Expirydate VARCHAR(45) NOT NULL,
  Discountratio VARCHAR(50) NOT NULL,
  promocode_id INT NOT NULL,
  PRIMARY KEY (promocode_id)
);
CREATE TABLE payment
(
  payment_id INT NOT NULL,
  payment_type VARCHAR(15) NOT NULL,
  PRIMARY KEY (payment_id)
);

CREATE TABLE MasterCardPayment
(
  Card_number VARCHAR(15) NOT NULL,
  ExpiryData VARCHAR(45) NOT NULL,
  payment_id INT NOT NULL,
  PRIMARY KEY (Card_number, payment_id),
  FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);

CREATE TABLE VisaPayment
(
  Card_number VARCHAR(15) NOT NULL,
  ExpiryData VARCHAR(45) NOT NULL,
  payment_id INT NOT NULL,
  PRIMARY KEY (Card_number, payment_id),
  FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);


CREATE TABLE UserPromocode
(
  Allowed_number INT NOT NULL,
  IsEnabaled VARCHAR(5) NOT NULL,
  userx_id INT NOT NULL,
  promocode_id INT NOT NULL,
  PRIMARY KEY (userx_id, promocode_id),
  FOREIGN KEY (userx_id) REFERENCES userx(userx_id),
  FOREIGN KEY (promocode_id) REFERENCES promocode(promocode_id)
);

CREATE TABLE Driver
(
  License_number VARCHAR(15) NOT NULL,
  namee VARCHAR(45) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  driver_id INT NOT NULL,
  gender VARCHAR(7) NOT NULL,
  email VARCHAR(45) NOT NULL,
  pasword VARCHAR(15) NOT NULL,
  rate Float NOT NULL,
  vehcile_id INT NOT NULL,
  PRIMARY KEY (driver_id),
  FOREIGN KEY (vehcile_id) REFERENCES vehcile(vehcile_id)
);

CREATE TABLE Trip
(
  trip_id INT NOT NULL,
  date VARCHAR(45) NOT NULL,
  sourcee VARCHAR(45) NOT NULL,
  destination VARCHAR(45) NOT NULL,
  trip_fees INT NOT NULL,
  feedback VARCHAR(45) NOT NULL,
  driver_id INT NOT NULL,
  vehcile_id INT NOT NULL,
  payment_id INT NOT NULL,
  userx_id INT NOT NULL,
  promocode_id INT NOT NULL,
  PRIMARY KEY (trip_id),
  FOREIGN KEY (driver_id) REFERENCES Driver(driver_id),
  FOREIGN KEY (vehcile_id) REFERENCES vehcile(vehcile_id),
  FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
  FOREIGN KEY (userx_id) REFERENCES userx(userx_id),
  FOREIGN KEY (promocode_id) REFERENCES promocode(promocode_id)
);
ALTER TABLE Trip
DROP COLUMN trip_time
ALTER TABLE Trip ADD date varchar(45);


CREATE TABLE user_driver_rate
(
  driver_rate FLOAT NOT NULL,
  userx_id INT NOT NULL,
  driver_id INT NOT NULL,
  PRIMARY KEY (userx_id, driver_id),
  FOREIGN KEY (userx_id) REFERENCES userx(userx_id),
  FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

/*DATA INSERTED*/
INSERT INTO userx VALUES(1,'Tom',01148714320,5642,19,'Male','m7med@gmail.com','normal');
INSERT INTO userx VALUES(2,'ahmed',01158794320,4442,29,'Male','ahmed@gmail.com','normal');
INSERT INTO userx VALUES(3,'max',01116614320,7542,26,'Male','maxsded@gmail.com','normal');
INSERT INTO userx VALUES(4,'ramy',0100714320,55642,35,'Male','ramy78@gmail.com','admin');
INSERT INTO userx VALUES(5,'taha',01558714320,57642,54,'Male','m7med47@gmail.com','normal');
INSERT INTO userx VALUES(8,'roman',01916614320,8942,42,'Male','roman@gmail.com','normal');
INSERT INTO userx VALUES(9,'gamal',0100014320,16322,19,'Male','gamal45@gmail.com','admin');
INSERT INTO userx VALUES(10,'tahar',01555554320,9842,18,'Male','taherteto@gmail.com','normal');
INSERT INTO userx VALUES(11,'ali',01177714320,7772,36,'Male','ali@gmail.com','normal');
INSERT INTO userx VALUES(12,'karim',012058794320,3332,28,'Male','karimkemo@gmail.com','normal');
INSERT INTO userx VALUES(13,'menna',0115556614320,9632,24,'Female','menna@gmail.com','normal');
INSERT INTO userx VALUES(14,'mona',0100714320,1112,41,'female','mona@gmail.com','admin');
INSERT INTO userx VALUES(15,'tamer',1558714320,75742,19,'male','tamer@gmail.com','normal');
INSERT INTO userx VALUES(16,'Marwan',0180714320,1812,21,'male','Marwan@gmail.com','normal');
INSERT INTO userx VALUES(17,'Marcus',01070714320,1912,41,'male','Marcus@gmail.com','admin');
INSERT INTO vehcile VALUES(1,1324,'Bus');
INSERT INTO vehcile VALUES(2,4213,'Car');
INSERT INTO vehcile VALUES(3,5452,'Scooter');
INSERT INTO vehcile VALUES(4,5464,'Bus');
INSERT INTO vehcile VALUES(5,7645,'Bus');
INSERT INTO vehcile VALUES(6,2324,'Car');
INSERT INTO vehcile VALUES(7,6324,'Scooter');
INSERT INTO vehcile VALUES(8,7324,'Bus');
INSERT INTO vehcile VALUES(9,1024,'Scooter');
INSERT INTO vehcile VALUES(10,1224,'Car');
INSERT INTO vehcile VALUES(11,1924,'Scooter');
INSERT INTO vehcile VALUES(12,1224,'Bus');
INSERT INTO vehcile VALUES(13,1344,'Car');
INSERT INTO vehcile VALUES(14,1321,'Car');
INSERT INTO vehcile VALUES(15,1334,'Scooter');
INSERT INTO promocode VALUES('Yes',1000,'1/6/2020',75,1);
INSERT INTO promocode VALUES('No',1200,'2/6/2020',50,2);
INSERT INTO promocode VALUES('Yes',1400,'3/6/2020',75,3);
INSERT INTO promocode VALUES('No',1300,'4/4/2020',25,4);
INSERT INTO promocode VALUES('Yes',1060,'1/5/2020',25,5);
INSERT INTO promocode VALUES('Yes',1220,'2/5/2020',50,6);
INSERT INTO promocode VALUES('No',3000,'13/5/2020',25,7);
INSERT INTO promocode VALUES('Yes',5500,'12/5/2020',75,8);
INSERT INTO promocode VALUES('Yes',5000,'15/5/2020',25,9);
INSERT INTO promocode VALUES('No',1330,'16/6/2020',50,10);
INSERT INTO promocode VALUES('Yes',1055,'11/5/2020',75,11);
INSERT INTO promocode VALUES('No',1110,'20/6/2020',25,12);
INSERT INTO promocode VALUES('Yes',1080,'19/6/2020',75,13);
INSERT INTO promocode VALUES('No',1090,'18/6/2020',25,14);
INSERT INTO promocode VALUES('No',1770,'17/6/2020',50,15);
INSERT INTO payment VALUES(1,'Cash');
INSERT INTO payment VALUES(2,'Mastercard');
INSERT INTO payment VALUES(3,'Visa');
INSERT INTO payment VALUES(4,'Cash');
INSERT INTO payment VALUES(5,'Mastercard');
INSERT INTO payment VALUES(6,'Cash');
INSERT INTO payment VALUES(7,'Visa');
INSERT INTO payment VALUES(8,'Cash');
INSERT INTO payment VALUES(9,'Mastercard');
INSERT INTO payment VALUES(10,'Cash');
INSERT INTO payment VALUES(11,'Mastercard');
INSERT INTO payment VALUES(12,'Visa');
INSERT INTO MasterCardPayment VALUES(2387,'18/11/2022',2);
INSERT INTO MasterCardPayment VALUES(3387,'25/8/2022',5);
INSERT INTO MasterCardPayment VALUES(4387,'27/9/2025',9);
INSERT INTO MasterCardPayment VALUES(5387,'4/4/2020',11);
INSERT INTO VisaPayment VALUES(6387,'4/4/2020',3);
INSERT INTO VisaPayment VALUES(7387,'14/12/2022',7);
INSERT INTO VisaPayment VALUES(8387,'12/6/2022',12);
INSERT INTO UserPromocode VALUES(5,'Yes',17,1);
INSERT INTO UserPromocode VALUES(6,'Yes',7,3);
INSERT INTO UserPromocode VALUES(10,'Yes',11,5);
INSERT INTO UserPromocode VALUES(1,'Yes',8,6);
INSERT INTO UserPromocode VALUES(4,'Yes',1,8);
INSERT INTO UserPromocode VALUES(3,'Yes',7,9);
INSERT INTO UserPromocode VALUES(3,'Yes',16,11);
INSERT INTO Driver VALUES(2703,'Sayed',02123213,19,1,'male','Sayed@yahoo.com',1233,4,1);
INSERT INTO Driver VALUES(2933,'Atf',02323213,33,2,'male','Atf@yahoo.com',1123,4.4,2);
INSERT INTO Driver VALUES(2133,'Salafie',0212253213,54,3,'male','Salafie@yahoo.com',1253,4.2,3);
INSERT INTO Driver VALUES(1933,'Mecky',021213,33,4,'male','Mecky@yahoo.com',1263,4.1,4);
INSERT INTO Driver VALUES(0233,'Mohamed',0287793213,33,5,'male','Mohamed@yahoo.com',123,3,5);
INSERT INTO Driver VALUES(0933,'Ali',0234213,54,6,'male','Ali@yahoo.com',123,3.2,6);
INSERT INTO Driver VALUES(0233,'Shapaan',02343213,26,7,'male','Shapaan@yahoo.com',123,2,7);
INSERT INTO Driver VALUES(2733,'Magdy',02121213,54,8,'male','Magdy@yahoo.com',1283,1,8);
INSERT INTO Driver VALUES(2033,'Bassem',02153213,33,9,'male','Bassem@yahoo.com',123,1.5,9);
INSERT INTO Driver VALUES(2133,'Ragab',0212213,33,10,'male','Ragab@yahoo.com',123,4.5,10);
INSERT INTO Driver VALUES(2743,'Ashraf',02124413,33,11,'male','Ashraf@yahoo.com',12223,3.5,11);
INSERT INTO Driver VALUES(2753,'Sameh',0215513,26,12,'male','Sameh@yahoo.com',123,2.2,12);
INSERT INTO Driver VALUES(2763,'Aymen',021266213,33,13,'male','Aymen@yahoo.com',123,2.1,13);
INSERT INTO Driver VALUES(2773,'Delta',02122213,33,14,'female','Delta@yahoo.com',123,5,14);
INSERT INTO Driver VALUES(2783,'Amr',02124413,26,15,'male','Amr@yahoo.com',1243,4.9,15);
INSERT INTO Trip VALUES(1,'11/5/2020','Dokki','Maadi',75,'Perfect',2,2,1,17,1);
INSERT INTO Trip VALUES(2,'12/5/2020','Dokki','Monib',25,'Bad',2,2,2,14,2);
INSERT INTO Trip VALUES(3,'17/5/2020','Dokki','City stars',100,'Good',6,6,3,7,3);
INSERT INTO Trip VALUES(4,'30/4/2020','Dokki','Carffour',50,'Bad',6,6,4,8,4);
INSERT INTO Trip VALUES(5,'11/5/2020','Monib','Maadi',150,'Good',6,6,5,11,5);
INSERT INTO Trip VALUES(6,'9/5/2020','Maadi','Helwan',150,'Perfect',1,1,6,8,6);
INSERT INTO Trip VALUES(7,'1/5/2020','Helwan','Monib',200,'Bad',4,4,7,10,7);
INSERT INTO Trip VALUES(8,'2/5/2020','Haram','Maadi',100,'Good',5,5,8,1,8);
INSERT INTO Trip VALUES(9,'14/5/2020','Maddi','Faisl',75,'Perfect',7,7,9,7,9);
INSERT INTO Trip VALUES(10,'18/5/2020','Faisl','Maadi',75,'Bad',9,9,10,2,10);
INSERT INTO Trip VALUES(11,'30/5/2020','Hawamdia','Marg',125,'Good',2,2,11,16,11);
INSERT INTO Trip VALUES(12,'26/5/2020','Downtown','Monib',100,'Perfect',6,6,12,14,12);
update Trip SET date = '2024-4-28' WHERE trip_id = 1;
update Trip SET date = '2024-4-25' WHERE trip_id = 2;
update Trip SET date = '2024-4-15' WHERE trip_id = 3;
update Trip SET date = '2024-4-8' WHERE trip_id = 4;
update Trip SET date = '2024-4-1' WHERE trip_id = 5;
update Trip SET date = '2024-4-20' WHERE trip_id = 6;
update Trip SET date = '2024-4-7' WHERE trip_id = 7;
update Trip SET date = '2024-4-2' WHERE trip_id = 8;
update Trip SET date = '2024-3-13' WHERE trip_id = 9;
update Trip SET date = '2024-3-6' WHERE trip_id = 10;
update Trip SET date = '2024-4-30' WHERE trip_id = 11;
update Trip SET date = '2024-4-14' WHERE trip_id = 12;
update Trip SET sourcee = 'Dokki' WHERE trip_id = 1;
update Trip SET sourcee = 'Dokki' WHERE trip_id = 2;
update Trip SET sourcee = 'Dokki' WHERE trip_id = 3;
update Trip SET sourcee = 'Zahara' WHERE trip_id = 4;
update Trip SET sourcee = 'DS' WHERE trip_id = 5;
update Trip SET sourcee = 'Sayeda' WHERE trip_id = 6;
update Trip SET sourcee = 'Zahara' WHERE trip_id = 7;
update Trip SET sourcee = 'Monib' WHERE trip_id = 8;
update Trip SET sourcee = 'Monib' WHERE trip_id = 9;
update Trip SET sourcee = 'Monib' WHERE trip_id = 10;
update Trip SET sourcee = 'Monib' WHERE trip_id = 11;
update Trip SET sourcee = 'Monib' WHERE trip_id = 12;
INSERT INTO user_driver_rate VALUES(3.5,17,2);
INSERT INTO user_driver_rate VALUES(3,14,2);
INSERT INTO user_driver_rate VALUES(4.5,7,6);
INSERT INTO user_driver_rate VALUES(3,8,6);
INSERT INTO user_driver_rate VALUES(5,11,6);
INSERT INTO user_driver_rate VALUES(3.1,8,1);
INSERT INTO user_driver_rate VALUES(2,10,4);
INSERT INTO user_driver_rate VALUES(1,1,5);
INSERT INTO user_driver_rate VALUES(4.5,7,7);
INSERT INTO user_driver_rate VALUES(3.7,2,9);
INSERT INTO user_driver_rate VALUES(1.5,16,2);
INSERT INTO user_driver_rate VALUES(4.8,14,6);










