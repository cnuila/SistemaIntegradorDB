--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

CREATE TABLE "REGIONS"
    ( "REGION_ID"      NUMBER
    , "REGION_NAME"    VARCHAR2(25) 
    );


COMMENT ON TABLE "REGIONS"
IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

COMMENT ON COLUMN "REGIONS"."REGION_ID"
IS 'Primary key of regions table.';

COMMENT ON COLUMN "REGIONS"."REGION_NAME"
IS 'Names of regions. Locations are in the countries of these regions.';



--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

CREATE TABLE "COUNTRIES" 
    ( "COUNTRY_ID"      CHAR(2)
    , "COUNTRY_NAME"    VARCHAR2(40) 
    , "REGION_ID"       NUMBER
    ); 

COMMENT ON TABLE "COUNTRIES"
IS 'country table. Contains 25 rows. References with locations table.';

COMMENT ON COLUMN "COUNTRIES"."COUNTRY_ID"
IS 'Primary key of countries table.';

COMMENT ON COLUMN "COUNTRIES"."COUNTRY_NAME"
IS 'Country name';

COMMENT ON COLUMN "COUNTRIES"."REGION_ID"
IS 'Region ID for the country. Foreign key to region_id column in the departments table.';


--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

CREATE TABLE "LOCATIONS"
    ( "LOCATION_ID"    NUMBER(4)
    , "STREET_ADDRESS" VARCHAR2(40)
    , "POSTAL_CODE"    VARCHAR2(12)
    , "CITY"       VARCHAR2(30)
    , "STATE_PROVINCE" VARCHAR2(25)
    , "COUNTRY_ID"     CHAR(2)
    ) ;


COMMENT ON TABLE "LOCATIONS"
IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';

COMMENT ON COLUMN "LOCATIONS"."LOCATION_ID"
IS 'Primary key of locations table';

COMMENT ON COLUMN "LOCATIONS"."STREET_ADDRESS"
IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';

COMMENT ON COLUMN "LOCATIONS"."POSTAL_CODE"
IS 'Postal code of the location of an office, warehouse, or production site 
of a company. ';

COMMENT ON COLUMN "LOCATIONS"."CITY"
IS 'A not null column that shows city where an office, warehouse, or 
production site of a company is located. ';

COMMENT ON COLUMN "LOCATIONS"."STATE_PROVINCE"
IS 'State or Province where an office, warehouse, or production site of a 
company is located.';

COMMENT ON COLUMN "LOCATIONS"."COUNTRY_ID"
IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';



--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

CREATE TABLE "DEPARTMENTS"
    ( "DEPARTMENT_ID"    NUMBER(4)
    , "DEPARTMENT_NAME"  VARCHAR2(30)
    , "MANAGER_ID"       NUMBER(6)
    , "LOCATION_ID"      NUMBER(4)
    ) ;


COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_ID"
IS 'Primary key column of departments table.';

COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_NAME"
IS 'A not null column that shows name of a department. Administration, 
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public 
Relations, Sales, Finance, and Accounting. ';

COMMENT ON COLUMN "DEPARTMENTS"."MANAGER_ID"
IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';

COMMENT ON COLUMN "DEPARTMENTS"."LOCATION_ID"
IS 'Location id where a department is located. Foreign key to location_id column of locations table.';

COMMENT ON TABLE "DEPARTMENTS"
IS 'Departments table that shows details of departments where employees 
work. Contains 27 rows; references with locations, employees, and job_history tables.';



--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

CREATE TABLE "JOBS"
    ( "JOB_ID"         VARCHAR2(10)
    , "JOB_TITLE"      VARCHAR2(35)
    , "MIN_SALARY"     NUMBER(6)
    , "MAX_SALARY"     NUMBER(6)
    ) ;


COMMENT ON COLUMN "JOBS"."JOB_ID"
IS 'Primary key of jobs table.';

COMMENT ON COLUMN "JOBS"."JOB_TITLE"
IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';

COMMENT ON COLUMN "JOBS"."MIN_SALARY"
IS 'Minimum salary for a job title.';

COMMENT ON COLUMN "JOBS"."MAX_SALARY"
IS 'Maximum salary for a job title';

COMMENT ON TABLE "JOBS"
IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';

--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

CREATE TABLE "EMPLOYEES"
    ( "EMPLOYEE_ID"    NUMBER(6)
    , "FIRST_NAME"     VARCHAR2(20)
    , "LAST_NAME"      VARCHAR2(25)
    , "EMAIL"          VARCHAR2(25)
    , "PHONE_NUMBER"   VARCHAR2(20)
    , "HIRE_DATE"      DATE
    , "JOB_ID"         VARCHAR2(10)
    , "SALARY"         NUMBER(8,2)
    , "COMMISSION_PCT" NUMBER(2,2)
    , "MANAGER_ID"     NUMBER(6)
    , "DEPARTMENT_ID"  NUMBER(4)
    ) ;


COMMENT ON COLUMN "EMPLOYEES"."EMPLOYEE_ID"
IS 'Primary key of employees table.';

COMMENT ON COLUMN "EMPLOYEES"."FIRST_NAME"
IS 'First name of the employee. A not null column.';

COMMENT ON COLUMN "EMPLOYEES"."LAST_NAME"
IS 'Last name of the employee. A not null column.';

COMMENT ON COLUMN "EMPLOYEES"."EMAIL"
IS 'Email id of the employee';

COMMENT ON COLUMN "EMPLOYEES"."PHONE_NUMBER"
IS 'Phone number of the employee; includes country code and area code';

COMMENT ON COLUMN "EMPLOYEES"."HIRE_DATE"
IS 'Date when the employee started on this job. A not null column.';

COMMENT ON COLUMN "EMPLOYEES"."JOB_ID"
IS 'Current job of the employee; foreign key to job_id column of the 
jobs table. A not null column.';

COMMENT ON COLUMN "EMPLOYEES"."SALARY"
IS 'Monthly salary of the employee. Must be greater 
than zero (enforced by constraint EMP_SALARY_MIN)';

COMMENT ON COLUMN "EMPLOYEES"."COMMISSION_PCT"
IS 'Commission percentage of the employee; Only employees in sales 
department elgible for commission percentage';

COMMENT ON COLUMN "EMPLOYEES"."MANAGER_ID"
IS 'Manager id of the employee; has same domain as manager_id in 
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';

COMMENT ON COLUMN "EMPLOYEES"."DEPARTMENT_ID"
IS 'Department id where employee works; foreign key to department_id 
column of the departments table';

COMMENT ON TABLE "EMPLOYEES"
IS 'employees table. Contains 107 rows. References with departments, 
jobs, job_history tables. Contains a self reference.';

--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

CREATE TABLE "JOB_HISTORY"
    ( "EMPLOYEE_ID"   NUMBER(6)
    , "START_DATE"    DATE
    , "END_DATE"      DATE
    , "JOB_ID"        VARCHAR2(10)
    , "DEPARTMENT_ID" NUMBER(4)
    ) ;

COMMENT ON COLUMN "JOB_HISTORY"."EMPLOYEE_ID"
IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';

COMMENT ON COLUMN "JOB_HISTORY"."START_DATE"
IS 'A not null column in the complex primary key employee_id+start_date. 
Must be less than the end_date of the job_history table. (enforced by 
constraint jhist_date_interval)';

COMMENT ON COLUMN "JOB_HISTORY"."END_DATE"
IS 'Last day of the employee in this job role. A not null column. Must be 
greater than the start_date of the job_history table. 
(enforced by constraint jhist_date_interval)';

COMMENT ON COLUMN "JOB_HISTORY"."JOB_ID"
IS 'Job role in which the employee worked in the past; foreign key to 
job_id column in the jobs table. A not null column.';

COMMENT ON COLUMN "JOB_HISTORY"."DEPARTMENT_ID"
IS 'Department id in which the employee worked in the past; foreign key to department_id column in the departments table';

COMMENT ON TABLE "JOB_HISTORY"
IS 'Table that stores job history of the employees. If an employee 
changes departments within the job or changes jobs within the department, 
new rows get inserted into this table with old job information of the 
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';


-- INSERTING into REGIONS

INSERT INTO "REGIONS" VALUES ( 1 , 'Europe' );
INSERT INTO "REGIONS" VALUES ( 2 , 'Americas' );
INSERT INTO "REGIONS" VALUES ( 3 , 'Asia' );
INSERT INTO "REGIONS" VALUES ( 4 , 'Middle East and Africa' );

-- INSERTING into COUNTRIES

INSERT INTO "COUNTRIES" VALUES ( 'IT' , 'Italy' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'JP' , 'Japan' , 3 );
INSERT INTO "COUNTRIES" VALUES ( 'US' , 'United States of America' , 2 );
INSERT INTO "COUNTRIES" VALUES ( 'CA' , 'Canada' , 2 );
INSERT INTO "COUNTRIES" VALUES ( 'CN' , 'China' , 3 );
INSERT INTO "COUNTRIES" VALUES ( 'IN' , 'India' , 3 );
INSERT INTO "COUNTRIES" VALUES ( 'AU' , 'Australia' , 3 );
INSERT INTO "COUNTRIES" VALUES ( 'ZW' , 'Zimbabwe' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'SG' , 'Singapore' , 3 );
INSERT INTO "COUNTRIES" VALUES ( 'UK' , 'United Kingdom' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'FR' , 'France' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'DE' , 'Germany' , 1 ); 
INSERT INTO "COUNTRIES" VALUES ( 'ZM' , 'Zambia' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'EG' , 'Egypt' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'BR' , 'Brazil' , 2 );
INSERT INTO "COUNTRIES" VALUES ( 'CH' , 'Switzerland' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'NL' , 'Netherlands' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'MX' , 'Mexico' , 2 );
INSERT INTO "COUNTRIES" VALUES ( 'KW' , 'Kuwait' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'IL' , 'Israel' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'DK' , 'Denmark' , 1 );
INSERT INTO "COUNTRIES" VALUES ( 'ML' , 'Malaysia' , 3 ); 
INSERT INTO "COUNTRIES" VALUES ( 'NG' , 'Nigeria' , 4 );
INSERT INTO "COUNTRIES" VALUES ( 'AR' , 'Argentina' , 2 );
INSERT INTO "COUNTRIES" VALUES ( 'BE' , 'Belgium' , 1 );

-- INSERTING into LOCATIONS

INSERT INTO "LOCATIONS" VALUES ( 1000 , '1297 Via Cola di Rie' , '00989' , 'Roma' , NULL , 'IT');
INSERT INTO "LOCATIONS" VALUES ( 1100 , '93091 Calle della Testa' , '10934' , 'Venice' , NULL , 'IT'); 
INSERT INTO "LOCATIONS" VALUES ( 1200 , '2017 Shinjuku-ku' , '1689' , 'Tokyo' , 'Tokyo Prefecture' , 'JP');
INSERT INTO "LOCATIONS" VALUES ( 1300 , '9450 Kamiya-cho' , '6823' , 'Hiroshima' , NULL , 'JP');
INSERT INTO "LOCATIONS" VALUES ( 1400 , '2014 Jabberwocky Rd' , '26192' , 'Southlake' , 'Texas' , 'US');
INSERT INTO "LOCATIONS" VALUES ( 1500 , '2011 Interiors Blvd' , '99236' , 'South San Francisco' , 'California' , 'US');
INSERT INTO "LOCATIONS" VALUES ( 1600 , '2007 Zagora St' , '50090' , 'South Brunswick' , 'New Jersey' , 'US'); 
INSERT INTO "LOCATIONS" VALUES ( 1700 , '2004 Charade Rd' , '98199' , 'Seattle' , 'Washington' , 'US');
INSERT INTO "LOCATIONS" VALUES ( 1800 , '147 Spadina Ave' , 'M5V 2L7' , 'Toronto' , 'Ontario' , 'CA');
INSERT INTO "LOCATIONS" VALUES ( 1900 , '6092 Boxwood St' , 'YSW 9T2' , 'Whitehorse' , 'Yukon' , 'CA');
INSERT INTO "LOCATIONS" VALUES ( 2000 , '40-5-12 Laogianggen' , '190518' , 'Beijing' , NULL , 'CN'); 
INSERT INTO "LOCATIONS" VALUES ( 2100 , '1298 Vileparle (E)' , '490231' , 'Bombay' , 'Maharashtra' , 'IN');
INSERT INTO "LOCATIONS" VALUES ( 2200 , '12-98 Victoria Street' , '2901' , 'Sydney' , 'New South Wales' , 'AU');
INSERT INTO "LOCATIONS" VALUES ( 2300 , '198 Clementi North' , '540198' , 'Singapore' , NULL , 'SG');
INSERT INTO "LOCATIONS" VALUES ( 2400 , '8204 Arthur St' , NULL , 'London' , NULL , 'UK');
INSERT INTO "LOCATIONS" VALUES ( 2500 , 'Magdalen Centre, The Oxford Science Park' , 'OX9 9ZB' , 'Oxford' , 'Oxford' , 'UK');
INSERT INTO "LOCATIONS" VALUES ( 2600 , '9702 Chester Road' , '09629850293' , 'Stretford' , 'Manchester' , 'UK');
INSERT INTO "LOCATIONS" VALUES ( 2700 , 'Schwanthalerstr. 7031' , '80925' , 'Munich' , 'Bavaria' , 'DE');
INSERT INTO "LOCATIONS" VALUES ( 2800 , 'Rua Frei Caneca 1360 ' , '01307-002' , 'Sao Paulo' , 'Sao Paulo' , 'BR');
INSERT INTO "LOCATIONS" VALUES ( 2900 , '20 Rue des Corps-Saints' , '1730' , 'Geneva' , 'Geneve' , 'CH');
INSERT INTO "LOCATIONS" VALUES ( 3000 , 'Murtenstrasse 921' , '3095' , 'Bern' , 'BE' , 'CH');
INSERT INTO "LOCATIONS" VALUES ( 3100 , 'Pieter Breughelstraat 837' , '3029SK' , 'Utrecht' , 'Utrecht' , 'NL');
INSERT INTO "LOCATIONS" VALUES ( 3200 , 'Mariano Escobedo 9991' , '11932' , 'Mexico City' , 'Distrito Federal,' , 'MX');

-- INSERTING into DEPARTMENTS

INSERT INTO "DEPARTMENTS" VALUES ( 10 , 'Administration' , 200 , 1700); 
INSERT INTO "DEPARTMENTS" VALUES ( 20 , 'Marketing' , 201 , 1800);
INSERT INTO "DEPARTMENTS" VALUES ( 30 , 'Purchasing' , 114 , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 40 , 'Human Resources' , 203 , 2400);
INSERT INTO "DEPARTMENTS" VALUES ( 50 , 'Shipping' , 121 , 1500);
INSERT INTO "DEPARTMENTS" VALUES ( 60 , 'IT' , 103 , 1400);
INSERT INTO "DEPARTMENTS" VALUES ( 70 , 'Public Relations' , 204 , 2700);
INSERT INTO "DEPARTMENTS" VALUES ( 80 , 'Sales' , 145 , 2500);
INSERT INTO "DEPARTMENTS" VALUES ( 90 , 'Executive' , 100 , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 100 , 'Finance' , 108 , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 110 , 'Accounting' , 205 , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 120 , 'Treasury' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 130 , 'Corporate Tax' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 140 , 'Control And Credit' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 150 , 'Shareholder Services' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 160 , 'Benefits' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 170 , 'Manufacturing' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 180 , 'Construction' , NULL , 1700); 
INSERT INTO "DEPARTMENTS" VALUES ( 190 , 'Contracting' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 200 , 'Operations' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 210 , 'IT Support' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 220 , 'NOC' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 230 , 'IT Helpdesk' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 240 , 'Government Sales' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 250 , 'Retail Sales' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 260 , 'Recruiting' , NULL , 1700);
INSERT INTO "DEPARTMENTS" VALUES ( 270 , 'Payroll' , NULL , 1700);

-- INSERTING into JOBS

INSERT INTO "JOBS" VALUES ( 'AD_PRES' , 'President' , 20080 , 40000);
INSERT INTO "JOBS" VALUES ( 'AD_VP' , 'Administration Vice President' , 15000 , 30000);
INSERT INTO "JOBS" VALUES ( 'AD_ASST' , 'Administration Assistant' , 3000 , 6000);
INSERT INTO "JOBS" VALUES ( 'FI_MGR' , 'Finance Manager' , 8200 , 16000);
INSERT INTO "JOBS" VALUES ( 'FI_ACCOUNT' , 'Accountant' , 4200 , 9000);
INSERT INTO "JOBS" VALUES ( 'AC_MGR' , 'Accounting Manager' , 8200 , 16000);
INSERT INTO "JOBS" VALUES ( 'AC_ACCOUNT' , 'Public Accountant' , 4200 , 9000);
INSERT INTO "JOBS" VALUES ( 'SA_MAN' , 'Sales Manager' , 10000 , 20080);
INSERT INTO "JOBS" VALUES ( 'SA_REP' , 'Sales Representative' , 6000 , 12008);
INSERT INTO "JOBS" VALUES ( 'PU_MAN' , 'Purchasing Manager' , 8000 , 15000);
INSERT INTO "JOBS" VALUES ( 'PU_CLERK' , 'Purchasing Clerk' , 2500 , 5500);
INSERT INTO "JOBS" VALUES ( 'ST_MAN' , 'Stock Manager' , 5500 , 8500);
INSERT INTO "JOBS" VALUES ( 'ST_CLERK' , 'Stock Clerk' , 2008 , 5000);
INSERT INTO "JOBS" VALUES ( 'SH_CLERK' , 'Shipping Clerk' , 2500 , 5500);
INSERT INTO "JOBS" VALUES ( 'IT_PROG' , 'Programmer' , 4000 , 10000);
INSERT INTO "JOBS" VALUES ( 'MK_MAN' , 'Marketing Manager' , 9000 , 15000); 
INSERT INTO "JOBS" VALUES ( 'MK_REP' , 'Marketing Representative' , 4000 , 9000);
INSERT INTO "JOBS" VALUES ( 'HR_REP' , 'Human Resources Representative' , 4000 , 9000);
INSERT INTO "JOBS" VALUES ( 'PR_REP' , 'Public Relations Representative' , 4500 , 10500);

-- INSERTING into EMPLOYEES

INSERT INTO "EMPLOYEES" VALUES ( 100 , 'Steven' , 'King' , 'SKING' , '515.123.4567' , TO_DATE('17-06-2003', 'dd-MM-yyyy') , 'AD_PRES' , 24000 , NULL , NULL , 90);
INSERT INTO "EMPLOYEES" VALUES ( 101 , 'Neena' , 'Kochhar' , 'NKOCHHAR' , '515.123.4568' , TO_DATE('21-09-2005', 'dd-MM-yyyy') , 'AD_VP' , 17000 , NULL , 100 , 90);
INSERT INTO "EMPLOYEES" VALUES ( 102 , 'Lex' , 'De Haan' , 'LDEHAAN' , '515.123.4569' , TO_DATE('13-01-2001', 'dd-MM-yyyy') , 'AD_VP' , 17000 , NULL , 100 , 90);
INSERT INTO "EMPLOYEES" VALUES ( 103 , 'Alexander' , 'Hunold' , 'AHUNOLD' , '590.423.4567' , TO_DATE('03-01-2006', 'dd-MM-yyyy') , 'IT_PROG' , 9000 , NULL , 102 , 60);
INSERT INTO "EMPLOYEES" VALUES ( 104 , 'Bruce' , 'Ernst' , 'BERNST' , '590.423.4568' , TO_DATE('21-05-2007', 'dd-MM-yyyy') , 'IT_PROG' , 6000 , NULL , 103 , 60);
INSERT INTO "EMPLOYEES" VALUES ( 105 , 'David' , 'Austin' , 'DAUSTIN' , '590.423.4569' , TO_DATE('25-06-2005', 'dd-MM-yyyy') , 'IT_PROG' , 4800 , NULL , 103 , 60);
INSERT INTO "EMPLOYEES" VALUES ( 106 , 'Valli' , 'Pataballa' , 'VPATABAL' , '590.423.4560' , TO_DATE('05-02-2006', 'dd-MM-yyyy') , 'IT_PROG' , 4800 , NULL , 103 , 60);
INSERT INTO "EMPLOYEES" VALUES ( 107 , 'Diana' , 'Lorentz' , 'DLORENTZ' , '590.423.5567' , TO_DATE('07-02-2007', 'dd-MM-yyyy') , 'IT_PROG' , 4200 , NULL , 103 , 60);
INSERT INTO "EMPLOYEES" VALUES ( 108 , 'Nancy' , 'Greenberg' , 'NGREENBE' , '515.124.4569' , TO_DATE('17-08-2002', 'dd-MM-yyyy') , 'FI_MGR' , 12008 , NULL , 101 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 109 , 'Daniel' , 'Faviet' , 'DFAVIET' , '515.124.4169' , TO_DATE('16-08-2002', 'dd-MM-yyyy') , 'FI_ACCOUNT' , 9000 , NULL , 108 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 110 , 'John' , 'Chen' , 'JCHEN' , '515.124.4269' , TO_DATE('28-09-2005', 'dd-MM-yyyy') , 'FI_ACCOUNT' , 8200 , NULL , 108 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 111 , 'Ismael' , 'Sciarra' , 'ISCIARRA' , '515.124.4369' , TO_DATE('30-09-2005', 'dd-MM-yyyy') , 'FI_ACCOUNT' , 7700 , NULL , 108 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 112 , 'Jose Manuel' , 'Urman' , 'JMURMAN' , '515.124.4469' , TO_DATE('07-03-2006', 'dd-MM-yyyy') , 'FI_ACCOUNT' , 7800 , NULL , 108 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 113 , 'Luis' , 'Popp' , 'LPOPP' , '515.124.4567' , TO_DATE('07-12-2007', 'dd-MM-yyyy') , 'FI_ACCOUNT' , 6900 , NULL , 108 , 100);
INSERT INTO "EMPLOYEES" VALUES ( 114 , 'Den' , 'Raphaely' , 'DRAPHEAL' , '515.127.4561' , TO_DATE('07-12-2002', 'dd-MM-yyyy') , 'PU_MAN' , 11000 , NULL , 100 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 115 , 'Alexander' , 'Khoo' , 'AKHOO' , '515.127.4562' , TO_DATE('18-05-2003', 'dd-MM-yyyy') , 'PU_CLERK' , 3100 , NULL , 114 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 116 , 'Shelli' , 'Baida' , 'SBAIDA' , '515.127.4563' , TO_DATE('24-12-2005', 'dd-MM-yyyy') , 'PU_CLERK' , 2900 , NULL , 114 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 117 , 'Sigal' , 'Tobias' , 'STOBIAS' , '515.127.4564' , TO_DATE('24-07-2005', 'dd-MM-yyyy') , 'PU_CLERK' , 2800 , NULL , 114 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 118 , 'Guy' , 'Himuro' , 'GHIMURO' , '515.127.4565' , TO_DATE('15-11-2006', 'dd-MM-yyyy') , 'PU_CLERK' , 2600 , NULL , 114 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 119 , 'Karen' , 'Colmenares' , 'KCOLMENA' , '515.127.4566' , TO_DATE('10-08-2007', 'dd-MM-yyyy') , 'PU_CLERK' , 2500 , NULL , 114 , 30);
INSERT INTO "EMPLOYEES" VALUES ( 120 , 'Matthew' , 'Weiss' , 'MWEISS' , '650.123.1234' , TO_DATE('18-07-2004', 'dd-MM-yyyy') , 'ST_MAN' , 8000 , NULL , 100 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 121 , 'Adam' , 'Fripp' , 'AFRIPP' , '650.123.2234' , TO_DATE('10-04-2005', 'dd-MM-yyyy') , 'ST_MAN' , 8200 , NULL , 100 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 122 , 'Payam' , 'Kaufling' , 'PKAUFLIN' , '650.123.3234' , TO_DATE('01-05-2003', 'dd-MM-yyyy') , 'ST_MAN' , 7900 , NULL , 100 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 123 , 'Shanta' , 'Vollman' , 'SVOLLMAN' , '650.123.4234' , TO_DATE('10-10-2005', 'dd-MM-yyyy') , 'ST_MAN' , 6500 , NULL , 100 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 124 , 'Kevin' , 'Mourgos' , 'KMOURGOS' , '650.123.5234' , TO_DATE('16-11-2007', 'dd-MM-yyyy') , 'ST_MAN' , 5800 , NULL , 100 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 125 , 'Julia' , 'Nayer' , 'JNAYER' , '650.124.1214' , TO_DATE('16-07-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 3200 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 126 , 'Irene' , 'Mikkilineni' , 'IMIKKILI' , '650.124.1224' , TO_DATE('28-09-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2700 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 127 , 'James' , 'Landry' , 'JLANDRY' , '650.124.1334' , TO_DATE('14-01-2007', 'dd-MM-yyyy') , 'ST_CLERK' , 2400 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 128 , 'Steven' , 'Markle' , 'SMARKLE' , '650.124.1434' , TO_DATE('08-03-2008', 'dd-MM-yyyy') , 'ST_CLERK' , 2200 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 129 , 'Laura' , 'Bissot' , 'LBISSOT' , '650.124.5234' , TO_DATE('20-08-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 3300 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 130 , 'Mozhe' , 'Atkinson' , 'MATKINSO' , '650.124.6234' , TO_DATE('30-10-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 2800 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 131 , 'James' , 'Marlow' , 'JAMRLOW' , '650.124.7234' , TO_DATE('16-02-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 2500 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 132 , 'TJ' , 'Olson' , 'TJOLSON' , '650.124.8234' , TO_DATE('10-04-2007', 'dd-MM-yyyy') , 'ST_CLERK' , 2100 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 133 , 'Jason' , 'Mallin' , 'JMALLIN' , '650.127.1934' , TO_DATE('14-06-2004', 'dd-MM-yyyy') , 'ST_CLERK' , 3300 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 134 , 'Michael' , 'Rogers' , 'MROGERS' , '650.127.1834' , TO_DATE('26-08-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2900 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 135 , 'Ki' , 'Gee' , 'KGEE' , '650.127.1734' , TO_DATE('12-12-2007', 'dd-MM-yyyy') , 'ST_CLERK' , 2400 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 136 , 'Hazel' , 'Philtanker' , 'HPHILTAN' , '650.127.1634' , TO_DATE('06-02-2008', 'dd-MM-yyyy') , 'ST_CLERK' , 2200 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 137 , 'Renske' , 'Ladwig' , 'RLADWIG' , '650.121.1234' , TO_DATE('14-07-2003', 'dd-MM-yyyy') , 'ST_CLERK' , 3600 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 138 , 'Stephen' , 'Stiles' , 'SSTILES' , '650.121.2034' , TO_DATE('26-10-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 3200 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 139 , 'John' , 'Seo' , 'JSEO' , '650.121.2019' , TO_DATE('12-02-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2700 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 140 , 'Joshua' , 'Patel' , 'JPATEL' , '650.121.1834' , TO_DATE('06-04-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2500 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 141 , 'Trenna' , 'Rajs' , 'TRAJS' , '650.121.8009' , TO_DATE('17-10-2003', 'dd-MM-yyyy') , 'ST_CLERK' , 3500 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 142 , 'Curtis' , 'Davies' , 'CDAVIES' , '650.121.2994' , TO_DATE('29-01-2005', 'dd-MM-yyyy') , 'ST_CLERK' , 3100 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 143 , 'Randall' , 'Matos' , 'RMATOS' , '650.121.2874' , TO_DATE('15-03-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2600 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 144 , 'Peter' , 'Vargas' , 'PVARGAS' , '650.121.2004' , TO_DATE('09-07-2006', 'dd-MM-yyyy') , 'ST_CLERK' , 2500 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 145 , 'John' , 'Russell' , 'JRUSSEL' , '011.44.1344.429268' , TO_DATE('01-10-2004', 'dd-MM-yyyy') , 'SA_MAN' , 14000 , .4 , 100 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 146 , 'Karen' , 'Partners' , 'KPARTNER' , '011.44.1344.467268' , TO_DATE('05-01-2005', 'dd-MM-yyyy') , 'SA_MAN' , 13500 , .3 , 100 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 147 , 'Alberto' , 'Errazuriz' , 'AERRAZUR' , '011.44.1344.429278' , TO_DATE('10-03-2005', 'dd-MM-yyyy') , 'SA_MAN' , 12000 , .3 , 100 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 148 , 'Gerald' , 'Cambrault' , 'GCAMBRAU' , '011.44.1344.619268' , TO_DATE('15-10-2007', 'dd-MM-yyyy') , 'SA_MAN' , 11000 , .3 , 100 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 149 , 'Eleni' , 'Zlotkey' , 'EZLOTKEY' , '011.44.1344.429018' , TO_DATE('29-01-2008', 'dd-MM-yyyy') , 'SA_MAN' , 10500 , .2 , 100 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 150 , 'Peter' , 'Tucker' , 'PTUCKER' , '011.44.1344.129268' , TO_DATE('30-01-2005', 'dd-MM-yyyy') , 'SA_REP' , 10000 , .3 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 151 , 'David' , 'Bernstein' , 'DBERNSTE' , '011.44.1344.345268' , TO_DATE('24-03-2005', 'dd-MM-yyyy') , 'SA_REP' , 9500 , .25 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 152 , 'Peter' , 'Hall' , 'PHALL' , '011.44.1344.478968' , TO_DATE('20-08-2005', 'dd-MM-yyyy') , 'SA_REP' , 9000 , .25 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 153 , 'Christopher' , 'Olsen' , 'COLSEN' , '011.44.1344.498718' , TO_DATE('30-03-2006', 'dd-MM-yyyy') , 'SA_REP' , 8000 , .2 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 154 , 'Nanette' , 'Cambrault' , 'NCAMBRAU' , '011.44.1344.987668' , TO_DATE('09-12-2006', 'dd-MM-yyyy') , 'SA_REP' , 7500 , .2 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 155 , 'Oliver' , 'Tuvault' , 'OTUVAULT' , '011.44.1344.486508' , TO_DATE('23-11-2007', 'dd-MM-yyyy') , 'SA_REP' , 7000 , .15 , 145 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 156 , 'Janette' , 'King' , 'JKING' , '011.44.1345.429268' , TO_DATE('30-01-2004', 'dd-MM-yyyy') , 'SA_REP' , 10000 , .35 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 157 , 'Patrick' , 'Sully' , 'PSULLY' , '011.44.1345.929268' , TO_DATE('04-03-2004', 'dd-MM-yyyy') , 'SA_REP' , 9500 , .35 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 158 , 'Allan' , 'McEwen' , 'AMCEWEN' , '011.44.1345.829268' , TO_DATE('01-08-2004', 'dd-MM-yyyy') , 'SA_REP' , 9000 , .35 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 159 , 'Lindsey' , 'Smith' , 'LSMITH' , '011.44.1345.729268' , TO_DATE('10-03-2005', 'dd-MM-yyyy') , 'SA_REP' , 8000 , .3 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 160 , 'Louise' , 'Doran' , 'LDORAN' , '011.44.1345.629268' , TO_DATE('15-12-2005', 'dd-MM-yyyy') , 'SA_REP' , 7500 , .3 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 161 , 'Sarath' , 'Sewall' , 'SSEWALL' , '011.44.1345.529268' , TO_DATE('03-11-2006', 'dd-MM-yyyy') , 'SA_REP' , 7000 , .25 , 146 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 162 , 'Clara' , 'Vishney' , 'CVISHNEY' , '011.44.1346.129268' , TO_DATE('11-11-2005', 'dd-MM-yyyy') , 'SA_REP' , 10500 , .25 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 163 , 'Danielle' , 'Greene' , 'DGREENE' , '011.44.1346.229268' , TO_DATE('19-03-2007', 'dd-MM-yyyy') , 'SA_REP' , 9500 , .15 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 164 , 'Mattea' , 'Marvins' , 'MMARVINS' , '011.44.1346.329268' , TO_DATE('24-01-2008', 'dd-MM-yyyy') , 'SA_REP' , 7200 , .10 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 165 , 'David' , 'Lee' , 'DLEE' , '011.44.1346.529268' , TO_DATE('23-02-2008', 'dd-MM-yyyy') , 'SA_REP' , 6800 , .1 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 166 , 'Sundar' , 'Ande' , 'SANDE' , '011.44.1346.629268' , TO_DATE('24-03-2008', 'dd-MM-yyyy') , 'SA_REP' , 6400 , .10 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 167 , 'Amit' , 'Banda' , 'ABANDA' , '011.44.1346.729268' , TO_DATE('21-04-2008', 'dd-MM-yyyy') , 'SA_REP' , 6200 , .10 , 147 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 168 , 'Lisa' , 'Ozer' , 'LOZER' , '011.44.1343.929268' , TO_DATE('11-03-2005', 'dd-MM-yyyy') , 'SA_REP' , 11500 , .25 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 169  , 'Harrison' , 'Bloom' , 'HBLOOM' , '011.44.1343.829268' , TO_DATE('23-03-2006', 'dd-MM-yyyy') , 'SA_REP' , 10000 , .20 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 170 , 'Tayler' , 'Fox' , 'TFOX' , '011.44.1343.729268' , TO_DATE('24-01-2006', 'dd-MM-yyyy') , 'SA_REP' , 9600 , .20 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 171 , 'William' , 'Smith' , 'WSMITH' , '011.44.1343.629268' , TO_DATE('23-02-2007', 'dd-MM-yyyy') , 'SA_REP' , 7400 , .15 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 172 , 'Elizabeth' , 'Bates' , 'EBATES' , '011.44.1343.529268' , TO_DATE('24-03-2007', 'dd-MM-yyyy') , 'SA_REP' , 7300 , .15 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 173 , 'Sundita' , 'Kumar' , 'SKUMAR' , '011.44.1343.329268' , TO_DATE('21-04-2008', 'dd-MM-yyyy') , 'SA_REP' , 6100 , .10 , 148 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 174 , 'Ellen' , 'Abel' , 'EABEL' , '011.44.1644.429267' , TO_DATE('11-05-2004', 'dd-MM-yyyy') , 'SA_REP' , 11000 , .30 , 149 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 175 , 'Alyssa' , 'Hutton' , 'AHUTTON' , '011.44.1644.429266' , TO_DATE('19-03-2005', 'dd-MM-yyyy') , 'SA_REP' , 8800 , .25 , 149 , 80); 
INSERT INTO "EMPLOYEES" VALUES ( 176 , 'Jonathon' , 'Taylor' , 'JTAYLOR' , '011.44.1644.429265' , TO_DATE('24-03-2006', 'dd-MM-yyyy') , 'SA_REP' , 8600 , .20 , 149 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 177 , 'Jack' , 'Livingston' , 'JLIVINGS' , '011.44.1644.429264' , TO_DATE('23-04-2006', 'dd-MM-yyyy') , 'SA_REP' , 8400 , .20 , 149 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 178 , 'Kimberely' , 'Grant' , 'KGRANT' , '011.44.1644.429263' , TO_DATE('24-05-2007', 'dd-MM-yyyy') , 'SA_REP' , 7000 , .15 , 149 , NULL);
INSERT INTO "EMPLOYEES" VALUES ( 179 , 'Charles' , 'Johnson' , 'CJOHNSON' , '011.44.1644.429262' , TO_DATE('04-01-2008', 'dd-MM-yyyy') , 'SA_REP' , 6200 , .10 , 149 , 80);
INSERT INTO "EMPLOYEES" VALUES ( 180 , 'Winston' , 'Taylor' , 'WTAYLOR' , '650.507.9876' , TO_DATE('24-01-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3200 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 181 , 'Jean' , 'Fleaur' , 'JFLEAUR' , '650.507.9877' , TO_DATE('23-02-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3100 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 182 , 'Martha' , 'Sullivan' , 'MSULLIVA' , '650.507.9878' , TO_DATE('21-06-2007', 'dd-MM-yyyy') , 'SH_CLERK' , 2500 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 183 , 'Girard' , 'Geoni' , 'GGEONI' , '650.507.9879' , TO_DATE('03-02-2008', 'dd-MM-yyyy') , 'SH_CLERK' , 2800 , NULL , 120 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 184 , 'Nandita' , 'Sarchand' , 'NSARCHAN' , '650.509.1876' , TO_DATE('27-01-2004', 'dd-MM-yyyy') , 'SH_CLERK' , 4200 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 185 , 'Alexis' , 'Bull' , 'ABULL' , '650.509.2876' , TO_DATE('20-02-2005', 'dd-MM-yyyy') , 'SH_CLERK' , 4100 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 186 , 'Julia' , 'Dellinger' , 'JDELLING' , '650.509.3876' , TO_DATE('24-06-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3400 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 187 , 'Anthony' , 'Cabrio' , 'ACABRIO' , '650.509.4876' , TO_DATE('07-02-2007', 'dd-MM-yyyy') , 'SH_CLERK' , 3000 , NULL , 121 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 188 , 'Kelly' , 'Chung' , 'KCHUNG' , '650.505.1876' , TO_DATE('14-06-2005', 'dd-MM-yyyy') , 'SH_CLERK' , 3800 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 189 , 'Jennifer' , 'Dilly' , 'JDILLY' , '650.505.2876' , TO_DATE('13-08-2005', 'dd-MM-yyyy') , 'SH_CLERK' , 3600 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 190 , 'Timothy' , 'Gates' , 'TGATES' , '650.505.3876' , TO_DATE('11-07-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 2900 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 191 , 'Randall' , 'Perkins' , 'RPERKINS' , '650.505.4876' , TO_DATE('19-12-2007', 'dd-MM-yyyy') , 'SH_CLERK' , 2500 , NULL , 122 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 192 , 'Sarah' , 'Bell' , 'SBELL' , '650.501.1876' , TO_DATE('04-02-2004', 'dd-MM-yyyy') , 'SH_CLERK' , 4000 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 193 , 'Britney' , 'Everett' , 'BEVERETT' , '650.501.2876' , TO_DATE('03-03-2005', 'dd-MM-yyyy') , 'SH_CLERK' , 3900 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 194 , 'Samuel' , 'McCain' , 'SMCCAIN' , '650.501.3876' , TO_DATE('01-07-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3200 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 195 , 'Vance' , 'Jones' , 'VJONES' , '650.501.4876' , TO_DATE('17-03-2007', 'dd-MM-yyyy') , 'SH_CLERK' , 2800 , NULL , 123 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 196 , 'Alana' , 'Walsh' , 'AWALSH' , '650.507.9811' , TO_DATE('24-04-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3100 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 197 , 'Kevin' , 'Feeney' , 'KFEENEY' , '650.507.9822' , TO_DATE('23-05-2006', 'dd-MM-yyyy') , 'SH_CLERK' , 3000 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 198 , 'Donald' , 'OConnell' , 'DOCONNEL' , '650.507.9833' , TO_DATE('21-06-2007', 'dd-MM-yyyy') , 'SH_CLERK' , 2600 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 199 , 'Douglas' , 'Grant' , 'DGRANT' , '650.507.9844' , TO_DATE('13-01-2008', 'dd-MM-yyyy') , 'SH_CLERK' , 2600 , NULL , 124 , 50);
INSERT INTO "EMPLOYEES" VALUES ( 200 , 'Jennifer' , 'Whalen' , 'JWHALEN' , '515.123.4444' , TO_DATE('17-09-2003', 'dd-MM-yyyy') , 'AD_ASST' , 4400 , NULL , 101 , 10);
INSERT INTO "EMPLOYEES" VALUES ( 201 , 'Michael' , 'Hartstein' , 'MHARTSTE' , '515.123.5555' , TO_DATE('17-02-2004', 'dd-MM-yyyy') , 'MK_MAN' , 13000 , NULL , 100 , 20);
INSERT INTO "EMPLOYEES" VALUES ( 202 , 'Pat' , 'Fay' , 'PFAY' , '603.123.6666' , TO_DATE('17-08-2005', 'dd-MM-yyyy') , 'MK_REP' , 6000 , NULL , 201 , 20);
INSERT INTO "EMPLOYEES" VALUES ( 203 , 'Susan' , 'Mavris' , 'SMAVRIS' , '515.123.7777' , TO_DATE('07-06-2002', 'dd-MM-yyyy') , 'HR_REP' , 6500 , NULL , 101 , 40);
INSERT INTO "EMPLOYEES" VALUES ( 204 , 'Hermann' , 'Baer' , 'HBAER' , '515.123.8888' , TO_DATE('07-06-2002', 'dd-MM-yyyy') , 'PR_REP' , 10000 , NULL , 101 , 70);
INSERT INTO "EMPLOYEES" VALUES ( 205 , 'Shelley' , 'Higgins' , 'SHIGGINS' , '515.123.8080' , TO_DATE('07-06-2002', 'dd-MM-yyyy') , 'AC_MGR' , 12008 , NULL , 101 , 110);
INSERT INTO "EMPLOYEES" VALUES ( 206 , 'William' , 'Gietz' , 'WGIETZ' , '515.123.8181' , TO_DATE('07-06-2002', 'dd-MM-yyyy') , 'AC_ACCOUNT' , 8300 , NULL , 205 , 110);

-- INSERTING into JOB_HISTORY

INSERT INTO "JOB_HISTORY" VALUES (102 , TO_DATE('13-01-2001', 'dd-MM-yyyy') , TO_DATE('24-07-2006', 'dd-MM-yyyy') , 'IT_PROG' , 60);
INSERT INTO "JOB_HISTORY" VALUES (101 , TO_DATE('21-09-1997', 'dd-MM-yyyy') , TO_DATE('27-10-2001', 'dd-MM-yyyy') , 'AC_ACCOUNT' , 110); 
INSERT INTO "JOB_HISTORY" VALUES (101 , TO_DATE('28-10-2001', 'dd-MM-yyyy') , TO_DATE('15-03-2005', 'dd-MM-yyyy') , 'AC_MGR' , 110); 
INSERT INTO "JOB_HISTORY" VALUES (201 , TO_DATE('17-02-2004', 'dd-MM-yyyy') , TO_DATE('19-12-2007', 'dd-MM-yyyy') , 'MK_REP' , 20); 
INSERT INTO "JOB_HISTORY" VALUES  (114 , TO_DATE('24-03-2006', 'dd-MM-yyyy') , TO_DATE('31-12-2007', 'dd-MM-yyyy') , 'ST_CLERK' , 50);
INSERT INTO "JOB_HISTORY" VALUES  (122 , TO_DATE('01-01-2007', 'dd-MM-yyyy') , TO_DATE('31-12-2007', 'dd-MM-yyyy') , 'ST_CLERK' , 50);
INSERT INTO "JOB_HISTORY" VALUES  (200 , TO_DATE('17-09-1995', 'dd-MM-yyyy') , TO_DATE('17-06-2001', 'dd-MM-yyyy') , 'AD_ASST' , 90);
INSERT INTO "JOB_HISTORY" VALUES  (176 , TO_DATE('24-03-2006', 'dd-MM-yyyy') , TO_DATE('31-12-2006', 'dd-MM-yyyy') , 'SA_REP' , 80);
INSERT INTO "JOB_HISTORY" VALUES  (176 , TO_DATE('01-01-2007', 'dd-MM-yyyy') , TO_DATE('31-12-2007', 'dd-MM-yyyy') , 'SA_MAN' , 80);
INSERT INTO "JOB_HISTORY" VALUES  (200 , TO_DATE('01-07-2002', 'dd-MM-yyyy') , TO_DATE('31-12-2006', 'dd-MM-yyyy') , 'AC_ACCOUNT' , 90);

--------------------------------------------------------
--  Indexes
--------------------------------------------------------

CREATE UNIQUE INDEX "REG_ID_PK"
ON "REGIONS" ("REGION_ID");

CREATE UNIQUE INDEX "LOC_ID_PK"
ON "LOCATIONS" ("LOCATION_ID");

CREATE UNIQUE INDEX "DEPT_ID_PK"
ON "DEPARTMENTS" ("DEPARTMENT_ID") ;

CREATE UNIQUE INDEX "JOB_ID_PK"
ON "JOBS" ("JOB_ID") ;

CREATE UNIQUE INDEX "JHIST_EMP_ID_ST_DATE_PK"
ON "JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE");

--------------------------------------------------------
--  Constraints
--------------------------------------------------------

ALTER TABLE "REGIONS" 
ADD CONSTRAINT "REG_ID_PK"
    PRIMARY KEY ("REGION_ID");

ALTER TABLE "REGIONS"
ADD CONSTRAINT "REGION_ID_NN" 
CHECK ("REGION_ID" IS NOT NULL);

ALTER TABLE "COUNTRIES"
ADD CONSTRAINT country_id_nn 
CHECK ("COUNTRY_ID" IS NOT NULL);

ALTER TABLE "COUNTRIES"
ADD CONSTRAINT "COUNTRY_C_ID_PK"
PRIMARY KEY ("COUNTRY_ID");

ALTER TABLE "COUNTRIES" ADD (
    CONSTRAINT "COUNTRY_REG_FK"
    FOREIGN KEY ("REGION_ID")
    REFERENCES "REGIONS"("REGION_ID")
);

ALTER TABLE "LOCATIONS"
ADD CONSTRAINT "LOC_CITY_NN"
CHECK ("CITY" IS NOT NULL);

ALTER TABLE "LOCATIONS" 
ADD CONSTRAINT "LOC_ID_PK"
PRIMARY KEY ("LOCATION_ID");

ALTER TABLE "LOCATIONS" 
ADD CONSTRAINT "LOC_C_ID_FK"
     FOREIGN KEY ("COUNTRY_ID")
     REFERENCES "COUNTRIES"("COUNTRY_ID");

ALTER TABLE "DEPARTMENTS" 
ADD CONSTRAINT "DEPARTMENT_NAME_NN"
CHECK ("DEPARTMENT_NAME" IS NOT NULL);


ALTER TABLE "DEPARTMENTS" ADD ( 
    CONSTRAINT "DEPT_ID_PK"
        PRIMARY KEY ("DEPARTMENT_ID"),
    CONSTRAINT "DEPT_LOC_FK"
        FOREIGN KEY ("LOCATION_ID")
        REFERENCES "LOCATIONS" ("LOCATION_ID"));

ALTER TABLE "JOBS"
ADD CONSTRAINT "JOB_ID_PK"
PRIMARY KEY("JOB_ID");

ALTER TABLE "EMPLOYEES" ADD (
    CONSTRAINT "EMP_LAST_NAME_NN" CHECK ("LAST_NAME" IS NOT NULL),
    CONSTRAINT "EMP_EMAIL_NN" CHECK ("EMAIL" IS NOT NULL),
    CONSTRAINT "EMP_HIRE_DATE_NN" CHECK ("HIRE_DATE" IS  NOT NULL),
    CONSTRAINT "EMP_JOB_NN" CHECK ("JOB_ID" IS NOT NULL),
    CONSTRAINT "EMP_SALARY_MIN" CHECK ("SALARY" > 0),
    CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL"));


ALTER TABLE "EMPLOYEES" ADD (
    CONSTRAINT "EMP_EMP_ID_PK" 
        PRIMARY KEY ("EMPLOYEE_ID"),
    CONSTRAINT "EMP_DEPT_FK"
        FOREIGN KEY ("DEPARTMENT_ID") 
        REFERENCES "DEPARTMENTS",
     CONSTRAINT "EMP_JOB_FK"
         FOREIGN KEY ("JOB_ID")
         REFERENCES "JOBS" ("JOB_ID"),
     CONSTRAINT "EMP_MANAGER_FK"
         FOREIGN KEY ("MANAGER_ID")
         REFERENCES "EMPLOYEES"
);

ALTER TABLE "DEPARTMENTS" ADD ( 
    CONSTRAINT "DEPT_MGR_FK"
    FOREIGN KEY ("MANAGER_ID")
    REFERENCES "EMPLOYEES" ("EMPLOYEE_ID")
);

ALTER TABLE "JOB_HISTORY" ADD ( 
    CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK"
        PRIMARY KEY ("EMPLOYEE_ID", "START_DATE"),
    CONSTRAINT "JHIST_JOB_FK"
        FOREIGN KEY ("JOB_ID") 
        REFERENCES "JOBS",
    CONSTRAINT "JHIST_EMP_FK"
        FOREIGN KEY ("EMPLOYEE_ID")
        REFERENCES "EMPLOYEES",
    CONSTRAINT "JHIST_DEPT_FK"
        FOREIGN KEY ("DEPARTMENT_ID")
        REFERENCES "DEPARTMENTS"
);

CREATE OR REPLACE VIEW "EMP_DETAILS_VIEW" AS 
SELECT 
    E.EMPLOYEE_ID, E.JOB_ID, E.MANAGER_ID, E.DEPARTMENT_ID,
    D.LOCATION_ID, L.COUNTRY_ID, E.FIRST_NAME, E.LAST_NAME,
    E.SALARY, E.COMMISSION_PCT, D.DEPARTMENT_NAME, J.JOB_TITLE,
    L.CITY, L.STATE_PROVINCE, C.COUNTRY_NAME, R.REGION_NAME
FROM
  "EMPLOYEES" E,
  "DEPARTMENTS" D,
  "JOBS" J,
  "LOCATIONS" L,
  "COUNTRIES" C,
  "REGIONS" R
WHERE E."DEPARTMENT_ID" = D."DEPARTMENT_ID"
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID
  AND J.JOB_ID = E.JOB_ID
WITH READ ONLY;


CREATE SEQUENCE "LOCATIONS_SEQ"
 START WITH     3300
 INCREMENT BY   100
 MAXVALUE       9900
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE "DEPARTMENTS_SEQ"
 START WITH     280
 INCREMENT BY   10
 MAXVALUE       9990
 NOCACHE
 NOCYCLE;

CREATE SEQUENCE "EMPLOYEES_SEQ"
 START WITH     207
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

CREATE OR REPLACE PROCEDURE "SECURE_DML"
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR (-20205,
                'You may only make changes during normal office hours');
  END IF;
END ;
/


CREATE OR REPLACE PROCEDURE "ADD_JOB_HISTORY"
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END;
/

-- oracledb.ccet05tt3mp2.us-east-1.rds.amazonaws.com nombreInstancia
-- PROYECTO nombreDB
-- 1521 port
-- admin username
-- 12345678 password