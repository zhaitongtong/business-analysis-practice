/* Mortgage table */

CREATE TABLE MORTGAGE(
    Ukey int not null unique,
	Time_Key int not null,
    Product_Key	int not null,
	Customer_Key int not null,
	Employee_Key int not null,
	Balance numeric(20,0),
    primary key (Ukey)
);

insert into dbo.MORTGAGE
values 
(1,1,2,2,2,500000),
(2,1,2,15,3,400000),
(3,1,2,3,1,600000),
(4,2,4,7,4,550000),
(5,2,4,1,4,450000),
(6,2,4,12,6,420000),
(7,2,4,6,7,500000),
(8,2,5,19,5,150000),
(9,2,3,11,7,600000),
(10,3,4,18,1,580000),
(11,3,4,4,3,550000),
(12,4,8,17,2,250000),
(13,4,8,10,6,200000),
(14,5,4,13,7,700000),
(15,5,4,5,4,750000),
(16,5,8,16,1,300000),
(17,6,3,9,2,560000),
(18,6,3,14,6,400000),
(19,6,4,8,7,620000),
(20,6,4,20,5,600000)

/* Product table */

CREATE TABLE PRODUCT(
    Product_Key	int not null unique,
	Product_Name char(100) not null,
	Period int not null,
	Fix_Float_Ind char(100) not null,
    Mortgage_Rate decimal(20,5) not null,
	Funding_Rate decimal(20,5) not null,
	primary key (Product_Key)
);

insert into dbo.PRODUCT
values 
(1,'1-year fix mortgage',1,'Fix',0.04,0.035),
(2,'2-year fix mortgage',2,'Fix',0.0375,0.033),
(3,'3-year fix mortgage',3,'Fix',0.035,0.03),
(4,'5-year fix mortgage',5,'Fix',0.03,0.0225),
(5,'1-year float mortgage',1,'Float',0.05,0.035),
(6,'2-year float mortgage',2,'Float',0.0475,0.033),
(7,'3-year float mortgage',3,'Float',0.045,0.03),
(8,'5-year float mortgage',5,'Float',0.04,0.0225)


/* Customer table */

CREATE TABLE CUSTOMER(
    Customer_Key int not null unique,
	Name char(100) not null,
	Gender char(100)  not null,
	Province char(100) not null,
    primary key (Customer_Key)
);

insert into dbo.CUSTOMER
values 
(1,'Anna','Female','ON'),
(2,'Bob','Male','BC'),
(3,'Christina','Male','AB'),
(4,'Dalen','Male','PE'),
(5,'Elena','Female','ON'),
(6,'Hank','Male','SK'),
(7,'Iris','Female','QC'),
(8,'Jack','Male','BC'),
(9,'Karen','Female','QC'),
(10,'Larry','Male','SK'),
(11,'Maria','Female','ON'),
(12,'Nancy','Female','NS'),
(13,'Paul','Male','NB'),
(14,'Ray','Male','ON'),
(15,'Sarah','Female','BC'),
(16,'Tim','Male','AB'),
(17,'Victoria','Female','PE'),
(18,'Wendy','Female','NS'),
(19,'Yolanda','Female','ON'),
(20,'Zack','Male','AB')


/* Employee table */

CREATE TABLE EMPLOYEE(
    Employee_Key int not null unique,
	Name char(100) not null,
	Level int not null,
	primary key (Employee_Key)
);

insert into dbo.EMPLOYEE
values 
(1,'Anna',3),
(2,'Anna',5),
(3,'Ben',4),
(4,'Chris',5),
(5,'Doug',3),
(6,'Frank',6),
(7,'Greg',4)


/* Time table */

CREATE TABLE TIME(
    Time_Key int not null unique,
	Calendar_Year int not null,
	Calendar_Month int not null,
	Fiscal_Year int not null,
	Fiscal_Month int not null,
	primary key (Time_Key)
);

insert into dbo.TIME
values 
(1,2018,11,2019,1),
(2,2018,12,2019,2),
(3,2019,1,2019,3),
(4,2019,2,2019,4),
(5,2019,3,2019,5),
(6,2019,4,2019,6),
(7,2019,5,2019,7),
(8,2019,6,2019,8),
(9,2019,7,2019,9),
(10,2019,8,2019,10),
(11,2019,9,2019,11),
(12,2019,10,2019,12)