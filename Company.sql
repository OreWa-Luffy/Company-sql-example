DROP TABLE Company;
CREATE TABLE Company(id INT,name VARCHAR(255),HeadQuarters VARCHAR(255),Established_year INT,ceo VARCHAR(255),PRIMARY KEY (id,name));

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('1','APPLE','CALIFORNIA US','1976','TIM COOK');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('2','AMAZON','WASHINGTON US','1994','ANDY JASSY');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('3','ALPHABET','CALIFORNIA US','2015','SUNDAR PICHAI');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('4','MICROSOFT','WASHINGTON US','1975','SATYA NADELLA');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('5','TENCENT','SHENZHEN CHINA','1998','MA HUATENG');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('6','META','CALIFORNIA US','2004','MARK ZUCKERBERG');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('7','TSMC','HSINCHU TAIWAN','1987','C C WEI');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('8','NVIDIA','CALIFORNIA US', '1993','JENSEN HAUNG');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('9','SALESFORCE','CALIFORNIA US','1999','MARC BENIOFF');

INSERT INTO Company(id,name,HeadQuarters,Established_year,ceo)
VALUES('10','IBM','NEW YORK US','1911','ARVAND');

SELECT * FROM Company ORDER BY Established_year DESC;

ALTER TABLE Company
ADD Industry VARCHAR(100);

INSERT INTO Company(Industry)
VALUES('Tech');

UPDATE Company
SET Industry = 'Consumer electronics'
WHERE id = 1;

SELECT ceo, Established_year
FROM Company
WHERE name LIKE 'M%' 
ORDER BY Established_year DESC;


SELECT name,ceo,Established_year
FROM Company
WHERE HeadQuarters like '%US%'
ORDER BY Established_year ASC;