USE company;
CREATE TABLE item_mast (
PRO_ID INT NOT NULL, 
PRO_NAME VARCHAR(20) NOT NULL, 
PRO_PRICE float(10) NOT NULL, 
PRO_COM INT NOT NULL,
PRIMARY KEY(PRO_ID)
);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
(101, 'Mother Board', 32.0, 15),
(102, 'Key Board', 45.0, 16),
(103, 'Zip drive', 25.0, 14),
(104, 'Speaker', 55.0, 16),
(105, 'Monitor', 50.0, 11),
(106, 'DVD drive', 90.0, 12),
(107, 'CD drive', 80.0, 12),
(108, 'Printer', 26.0, 13),
(109, 'Refill carteidge', 35.0, 13);

SELECT * FROM item_mast;