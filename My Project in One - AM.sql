
create database CFG_Project;

use CFG_Project;

 CREATE TABLE Customer_Detail (
     CUSTOMER_ID varchar(30) not null,
     FIRST_NAME varchar(30) not null,
     SECOND_NAME varchar(30)  not null ,
     CUSTOMER_AGE int not null,
     CUSTOMER_POSTCODE char(6) not null,
  PRIMARY KEY (CUSTOMER_ID)
    )
 ;

CREATE TABLE Country_Detail (
    Country_Name varchar(50) not null,
    Country_Code char(3) not null,
 PRIMARY KEY (Country_Code)
    )
;

CREATE TABLE Category_Detail (
    Category_Description varchar(255) not null,
    Category_Code char(4) not null,
 PRIMARY KEY (Category_Code)
    )
;

-- drop TABLE Fraud_transactions;
-- drop TABLE Risk_Score;
-- drop TABLE Transaction_Detail;
-- drop TABLE category_Detail;
-- drop TABLE Country_Detail;

CREATE TABLE Transaction_Detail (
    Transaction_ID varchar(10) not null,

    Customer_ID varchar(10) not null,
 --    Transaction_Date date not null ,
    Transaction_Amt int not null,
    Merchant_Name varchar(20) not null,
    Merchant_Country_Code char(3) not null ,
    Merchant_Category_Code char(4) not null,
 PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Detail(Customer_ID),
    FOREIGN KEY (Merchant_Country_Code) REFERENCES Country_Detail(Country_Code),
    FOREIGN KEY (Merchant_Category_Code) REFERENCES Category_Detail(Category_Code)
    )
;


CREATE TABLE Fraud_Transactions (
    Transaction_ID varchar(10) not null,
    Fraud_Type varchar(20) not null,
	FOREIGN KEY (Transaction_ID) REFERENCES Transaction_Detail(Transaction_ID)
    )
;

CREATE TABLE Risk_Score (
    Transaction_ID varchar(10) not null,
    Risk_Score int not null,
	FOREIGN KEY (Transaction_ID) REFERENCES Transaction_Detail(Transaction_ID)
    )
;

-- add values


-- Customer_detail table imported from CSV file

insert into Country_Detail (Country_Name,Country_Code)
values 
('UK',826),
('US',840),
('Korea, Republic of',410)
;

insert into Category_Detail (Category_Description ,Category_Code)
values 
('GROCERY STORES OR SUPERMARKETS',5411),
('TIMESHARES',7012),
('KOREAN AIRLINES',3082)
;

insert into transaction_detail (TRANSACTION_ID,CUSTOMER_ID,TRANSACTION_AMT,MERCHANT_NAME,MERCHANT_COUNTRY_CODE,	MERCHANT_CATEGORY_CODE)
values 
('CFG001','C1',50,'TESCO',826,5411),
('CFG002','C2',60,'ASDA',826,5411),
('CFG003','C2',48,'MORRISONS',826,5411),
('CFG004','C3',37,'TESCO',826,5411),
('CFG005','C4',48,'ASDA',826,5411),
('CFG006','C5',63,'MORRISONS',826,5411),
('CFG007','C5',57,'SAINSBURYS',826,5411),
('CFG008','C6',58,'ASDA',826,5411),
('CFG009','C7',45,'MORRISONS',826,5411),
('CFG010','C8',50,'SAINSBURYS',826,5411),
('CFG011','C9',60,'TESCO',826,5411),
('CFG012','C2',48,'TESCO',826,5411),
('CFG013','C9',90,'FRAUD.COM',840,7012),
('CFG014','C3',100,'FRAUD.COM',840,7012),
('CFG015','C3',80,'FRAUD.COM',840,7012),
('CFG016','C8',57,'SAINSBURYS',826,5411),
('CFG017','C1',58,'ASDA',826,5411),
('CFG018','C1',45,'MORRISONS',826,5411),
('CFG019','C3',50,'SAINSBURYS',826,5411),
('CFG020','C7',60,'TESCO',826,5411),
('CFG021','C8',48,'TESCO',826,5411),
('CFG022','C9',37,'ASDA',826,5411),
('CFG023','C2',48,'MORRISONS',826,5411),
('CFG024','C5',63,'TESCO',826,5411),
('CFG025','C3',57,'ASDA',826,5411),
('CFG026','C3',58,'MORRISONS',826,5411),
('CFG027','C8',45,'SAINSBURYS',826,5411),
('CFG028','C2',50,'ASDA',826,5411),
('CFG029','C3',60,'MORRISONS',826,5411),
('CFG030','C4',48,'SAINSBURYS',826,5411),
('CFG031','C5',100,'FRAUD.COM',840,7012),
('CFG032','C5',80,'FRAUD.COM',840,7012),
('CFG033','C6',63,'SAINSBURYS',826,5411),
('CFG034','C7',57,'ASDA',826,5411),
('CFG035','C8',58,'MORRISONS',826,5411),
('CFG036','C1',45,'SAINSBURYS',826,5411),
('CFG037','C1',50,'TESCO',826,5411),
('CFG038','C3',60,'SAINSBURYS',826,5411),
('CFG039','C7',48,'ASDA',826,5411),
('CFG040','C8',37,'MORRISONS',826,5411),
('CFG041','C9',48,'SAINSBURYS',826,5411),
('CFG042','C2',63,'TESCO',826,5411),
('CFG043','C7',100,'FRAUD.COM',840,7012),
('CFG044','C8',85,'FRAUD.COM',840,7012),
('CFG045','C1',60,'SAINSBURYS',826,5411),
('CFG046','C1',48,'ASDA',826,5411),
('CFG047','C3',37,'MORRISONS',826,5411),
('CFG048','C7',48,'SAINSBURYS',826,5411),
('CFG049','C8',63,'TESCO',826,5411),
('CFG050','C9',57,'ASDA',826,5411),
('CFG051','C4',64,'MOREFRAUD.COM',410,3082),
('CFG052','C2',83,'MOREFRAUD.COM',410,3082),
('CFG053','C7',68,'MOREFRAUD.COM',410,3082),
('CFG054','C1',77,'MOREFRAUD.COM',410,3082)
;


insert into fraud_transactions (Transaction_ID,Fraud_Type)
values 
('CFG013','ONLINE'),
('CFG014','ONLINE'),
('CFG015','ONLINE'),
('CFG031','ONLINE'),
('CFG032','ONLINE'),
('CFG043','ONLINE'),
('CFG044','ONLINE'),
('CFG051','FLIGHT'),
('CFG052','FLIGHT'),
('CFG053','FLIGHT'),
('CFG054','FLIGHT')
;

insert into risk_score (Transaction_ID ,Risk_Score)
values 
('CFG001',4),
('CFG002',7),
('CFG003',2),
('CFG004',8),
('CFG005',47),
('CFG006',2),
('CFG007',38),
('CFG008',7),
('CFG009',9),
('CFG010',2),
('CFG011',26),
('CFG012',9),
('CFG013',99),
('CFG014',99),
('CFG015',99),
('CFG016',5),
('CFG017',2),
('CFG018',40),
('CFG019',5),
('CFG020',9),
('CFG021',33),
('CFG022',9),
('CFG023',2),
('CFG024',8),
('CFG025',24),
('CFG026',0),
('CFG027',3),
('CFG028',7),
('CFG029',9),
('CFG030',3),
('CFG031',99),
('CFG032',99),
('CFG033',6),
('CFG034',9),
('CFG035',2),
('CFG036',8),
('CFG037',4),
('CFG038',9),
('CFG039',2),
('CFG040',8),
('CFG041',2),
('CFG042',0),
('CFG043',99),
('CFG044',99),
('CFG045',9),
('CFG046',3),
('CFG047',9),
('CFG048',2),
('CFG049',6),
('CFG050',97),
('CFG051',97),
('CFG052',97),
('CFG053',97),
('CFG054',97)
;



-- core join

create view full_transaction_detail as
select 
t1.TRANSACTION_ID, 
t1.CUSTOMER_ID,
t1.TRANSACTION_AMT,
t1.MERCHANT_NAME,
t1.Merchant_Country_Code,
t2.Country_Name,
t1.Merchant_Category_Code,
t3.Category_Description,
t4.Risk_Score
from transaction_detail t1
left join Country_Detail t2
on t1.Merchant_Country_Code = t2.Country_Code
left join category_detail t3
on t1.Merchant_Category_Code = t3.Category_Code
left join risk_score t4
on t1.Transaction_ID = t4.transaction_ID
;


-- core query with subquery
select merchant_name, count(distinct transaction_id) as Total_Fraud, sum(transaction_amt) as Total_Loss
from full_transaction_detail
where transaction_id in (select transaction_id from fraud_transactions)
group by 1
order by Total_Loss desc
;





-- core stored function
DELIMITER //
CREATE FUNCTION Risk_Level(
    Risk_Score INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE Risk_Level VARCHAR(20);
    IF Risk_Score > 90 THEN
        SET Risk_Level = 'HIGH';
    ELSEIF (Risk_Score <= 90 AND 
            Risk_Score >= 10) THEN
        SET Risk_Level = 'MEDIUM';
    ELSEIF Risk_Score < 10 THEN
        SET Risk_Level = 'LOW';
    END IF;
    RETURN (Risk_Level);
END//
DELIMITER ;



use cfg_project;

-- core query using function 
    select 
    TRANSACTION_ID,
    CUSTOMER_ID,
    TRANSACTION_AMT,
    MERCHANT_NAME,
    MERCHANT_COUNTRY_CODE,	
    MERCHANT_CATEGORY_CODE,
    Risk_Score,
    Risk_Level(Risk_Score) AS Risk_Level
from full_transaction_detail
;






-- ADVANCED TRIGGER 
DELIMITER //

CREATE TRIGGER Potential_Fraud
BEFORE INSERT  on transaction_detail
FOR EACH ROW
BEGIN
if NEW.Merchant_Name = 'FRAUD.COM' then SIGNAL SQLSTATE '45000' set message_text = 'SUSPECT FRAUD - DECLINED' ;

END IF; 

END//

-- SHOULD INSERT
insert into transaction_detail (TRANSACTION_ID,CUSTOMER_ID,TRANSACTION_AMT,MERCHANT_NAME,MERCHANT_COUNTRY_CODE,	MERCHANT_CATEGORY_CODE)
values 
('CFG055','C1',50,'TESCO',826,5411)
;
     
-- SHOULD DECLINE WITH CUSTOM MESSAGE
insert into transaction_detail (TRANSACTION_ID,CUSTOMER_ID,TRANSACTION_AMT,MERCHANT_NAME,MERCHANT_COUNTRY_CODE,	MERCHANT_CATEGORY_CODE)
values 
('CFG056','C3',100,'FRAUD.COM',840,7012)
;
     

     
 
-- advanced join

create view Customers_with_fraud as
select t1.Customer_ID, 
t1.FIRST_NAME, 
t1.SECOND_NAME, 
t2.Transaction_Amt, 
t2.Merchant_Name, 
t3.Fraud_Type
from customer_detail t1
inner join
transaction_detail t2
on t1.CUSTOMER_ID = t2.customer_id
right join fraud_transactions t3 
on t2.Transaction_ID = t3.transaction_ID
;

-- Sort by Customer_ID - useful for analysis to spot sequential attacks
select Customer_ID, First_Name, Second_Name, Transaction_Amt, Merchant_Name, Fraud_Type
from Customers_with_fraud
group by 1
order by Customer_ID
;

-- advanced query with subquery - useful for detecting vulnerable customers or web compromises
select Customer_ID, First_Name, Second_Name, count(Customer_ID) as Total_Fraud, sum(transaction_amt) as Total_Loss
from Customers_with_fraud
group by 1
having Total_Fraud >=2
order by Total_Loss desc
;
    
     
     






