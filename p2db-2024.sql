-- *********************************************
-- This script creates an example database
--        for CS27020 practical 2023/2024. 
--
-- This is a database for organising the most popular tech and IT companies in the world
-- There are three tables, one for company,
-- one for product and one for revenue
-- *********************************************

\echo Dropping tables if they exist
DROP TABLE IF EXISTS company CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS revenue CASCADE;

\echo Creating company table
-- Company Table
CREATE TABLE company (
  id INT NOT NULL UNIQUE,
  name VARCHAR(100),
  headquarters VARCHAR(100),
  established_year INT,
  ceo VARCHAR(100),
  PRIMARY KEY (id)
);

\echo Creating product table
-- Product  table
CREATE TABLE product (
  id INT NOT NULL UNIQUE,
  company_id INT NOT NULL,
  name VARCHAR(100)  NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

\echo Creating revenue table
-- Revenue table
CREATE TABLE revenue (
  id INT NOT NULL UNIQUE,
  company_id INT NOT NULL,
  product_id INT NOT NULL,
  revenue DECIMAL(10,2),
  PRIMARY KEY (id),
  UNIQUE(company_id, product_id)
);

\echo Inserting into tables
INSERT INTO company (id, name, headquarters, established_year, ceo)
VALUES (1, 'Apple', 'California, US', 1976, 'Tim Cook'),
       (2, 'Samsung Electronics', 'Suwon, South Korea', 1938, 'Jong-Hee Lee'),
       (3, 'Alphabet', 'California, US', 2015, 'Sundar Pichai'),
       (4, 'Microsoft', 'Washington, US', 1975, 'Satya Nadella'),
       (5, 'Amazon', 'Washington, US', 1994, 'Andy Jassy'),
       (6, 'Tencent', 'Shenzhen, China', 1998, 'Ma Huateng'),
       (7, 'Meta Platforms', 'California, US', 2004, 'Mark Zuckerberg'),
       (8, 'TSMC', 'Hsinchu, Taiwan', 1987, 'C.C. Wei'),
       (9, 'Nvidia', 'California, US', 1993, 'Jensen Huang'),
       (10, 'Salesforce', 'California, US', 1999, 'Marc Benioff');

INSERT INTO product (id, company_id, name)
VALUES (1, 1, 'iPhone'),
       (2, 2, 'Galaxy smartphones'),
       (3, 3, 'Google Search'),
       (4, 4, 'Windows'),
       (5, 5, 'Amazon Web Services'),
       (6, 6, 'WeChat'),
       (7, 7, 'Facebook'),
       (8, 8, 'Custom-designed semiconductor chips'),
       (9, 9, 'GeForce GPUs'),
       (10, 10, 'Salesforce CRM'),
       (11, 1, 'iPad'),
       (12, 1, 'Mac'),
       (13, 2, 'Instagram'),
       (14, 2, 'Whatsapp');

INSERT INTO revenue (id, company_id, product_id, revenue)
VALUES (1, 1, 1, 192.23),
       (2, 2, 2, 136.35),
       (3, 3, 3, 150.73),
       (4, 4, 4, 122.74),
       (5, 5, 5, 79.83),
       (6, 6, 6, 24.68),
       (7, 7, 7, 28.52),
       (8, 8, 8, 77.18),
       (9, 9, 9, 12.54),
       (10, 10, 10, 22.43),
       (11, 1, 11, 37.00),
       (12, 1, 12, 36.00),
       (13, 7, 13, 23.25),
       (14, 7, 14, 21.20);


SELECT * FROM company
WHERE established_year BETWEEN 1990 AND 2020;


SELECT name, revenue FROM company, revenue
Where company.id = revenue.company_id
ORDER BY revenue DESC
LIMIT 5;


Drop TABLE IF EXISTS countries;
CREATE TABLE countries ( 
	id INT NOT NULL UNIQUE,
	product_id INT NOT NULL,
	country VARCHAR(100) NOT NULL,
	product_count INT,
	sales DECIMAL(10,2),
	PRIMARY KEY (id),
	UNIQUE(product_id, country)
	);
	
	
INSERT INTO countries (id, product_id, country, product_count,sales) VALUES
(1,1,'United states',100,192.23),
(2, 1, 'China', 90, 170.10),
(3, 2, 'China', 100, 136.35),
(4, 7, 'United States', 243, 28.52),
(5, 10, 'Iran', NULL, 23.87);


--SELECT Company.name, countries.product_count FROM company, countriesINNER JOIN  ON product.id = countries.product_idwhere country = 'China';  



SELECT name, product_count, INTO productChina FROM product
INNER JOIN countries ON product.id = product_id WHERE country = 'China'

SELECT COUNT(name) FROM productChina;


 