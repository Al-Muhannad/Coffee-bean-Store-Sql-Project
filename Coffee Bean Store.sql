--[SQL Code Implementation]:
create table INDIVIDUAL_CUSTOMER( 
FNAME varchar(15) not null,
MNAME varchar(15),
LNAME varchar(15) not null,
Email varchar(50) primary key, PhoneNumber varchar(13) not null, City varchar(20) not null,
Province varchar(20) not null, ZipCode varchar(5) not null, Street_name varchar(30),
Apart_num varchar(4)
);

create table BUSINESS_CUSTOMER( 
BusinessName varchar(35),
Commercial_Name varchar(40) not null,
Commercial_Number varchar(10) primary key,
Email varchar(50),
Telephone varchar(13) not null,
City varchar(20) not null,
Province varchar(20) not null,
ZipCode varchar(5) not null,
Street_name varchar(30),
Apart_num varchar(4),
DiscountForWholesale int not null
);

create table ORDERS(
Order_ID varchar(8) primary key, 
Order_date date not null,
TotalAmount int not null,
Order_Status varchar(20) not null,
PaymentMethod varchar(15) not null
);

create table PRODUCT_LIST(
O_ID varchar(8),
ORProduct varchar(25) primary key,
foreign key (O_ID) REFERENCES ORDERS(Order_ID) 
);

create table DISCOUNT(
DiscountCode varchar(5) primary key,
StartDate date not null,
EndDate date not null ,
DiscountPercentage int not null
);

create table PRODUCT_INCLUDE(
DCode varchar(5) not null ,
ProductInclude varchar(25) primary key,
FOREIGN KEY (DCode) REFERENCES DISCOUNT(DiscountCode)
);

create table APPLY_ON(
DCode varchar(5) not null ,
O_ID varchar(8)not null,
FOREIGN KEY (DCode) REFERENCES DISCOUNT(DiscountCode),
FOREIGN KEY (O_ID) REFERENCES ORDERS(Order_ID)
);

create table INVENTORY(
RoastryName varchar(30) not null,
Coffee_crop_name varchar(30) not null unique, ItemPrice int not null,
Item_ID varchar(8) primary key,
Item_Type varchar(8),
Item_Quantity int not null,
RoastingDate date,
ExpiredDate date not null
);

create table TAKE_FROM(
I_ID varchar(8) not null ,
O_ID varchar(8)not null,
FOREIGN KEY (I_ID) REFERENCES INVENTORY(Item_ID),
FOREIGN KEY (O_ID) REFERENCES ORDERS(Order_ID)
);

create table COFFEE_ROASTERS(
Name varchar(30) not null,
Telephone varchar(13),
Email varchar(50) primary key,
BankName varchar(30) not null,
IBAN varchar(24) unique, Wholesale_Discount int not null
);

create table SUPPLIES(
CRost_Email varchar(50) not null,
I_ID varchar(8) not null,
foreign key (I_ID) references INVENTORY(Item_ID),
foreign key (CRost_Email) references COFFEE_ROASTERS(Email)
);

ALTER TABLE ORDERS
ADD INDIV_Email varchar(50);

ALTER TABLE ORDERS
ADD BCNumber varchar(10);

ALTER TABLE ORDERS
ADD FOREIGN KEY (INDIV_Email) REFERENCES INDIVIDUAL_CUSTOMER(Email);

ALTER TABLE ORDERS
ADD FOREIGN KEY ( BCNumber) REFERENCES BUSINESS_CUSTOMER(Commercial_Number);

--[Sample Input]:
--1-INDIVIDUAL_CUSTOMER
insert into INDIVIDUAL_CUSTOMER values ("Salah","Rashed","Abdulhamed","solo70@gmail.com","+966521234865","Mu baraz","eastern","34521","Turki bin Hamad","8754");
insert into INDIVIDUAL_CUSTOMER values ("Jamal","Khalifa","Muhammed","jamal@hotmail.com","+966543522176","Ta'i f","Makkah","48961","Omar bin Alkhatab","4836");
insert into INDIVIDUAL_CUSTOMER values ("Talal","Naif","Saad","TNSaad@ymail.com","+966573579724","Al- Kharj","Riyadh","20484","Ibn Batota","7183");
insert into INDIVIDUAL_CUSTOMER values ("Sarah","Khaled","Ali","sarahk@gmail.com","+966503425444","Unaizah","Al- Qassim","67134","Ibn Bisher","8867");
insert into INDIVIDUAL_CUSTOMER values ("Mohammed","Saleh","Khaled","moha@gmail.com","+966567271334","Hofuf ","eastern","36362","Fawaz Bin Salman","5602");

--2-BUSINESS_CUSTOMER
insert into BUSINESS_CUSTOMER values ("White coffee","Code co","1020764826","white0@code.com"," 0135833335","Dammam","eastern","36336","Qassim Alkateeb","7090",0.10);
insert into BUSINESS_CUSTOMER values ("Brew92","Coffee Drop co","7812659837","brew92@drop.co","8002442245","Jeddah","Makkah","489 61","Saud bin Faisal","4824",0.24);
insert into BUSINESS_CUSTOMER values ("Ratio","Arabica co","9845872345","Ratio@Arabica.com","0116424030","Dawadmi","Riyadh"," 20484","Ibn Majah","6543",0.30);
insert into BUSINESS_CUSTOMER values ("Kafa","Bona co","3452678521","kafa@bona.com","0163266060","Buraidah","Al- Qassim","52379","King Salman","9852",0.15);
insert into BUSINESS_CUSTOMER values ("Octobar","Mahazel co","1097529845","octobar@mahazel.com","0133610989","Jubail","eastern"," 34797","Al-Mutanabi","8753",0.40);

--3-ORDERS
insert into ORDERS values ("87236468","2020-02- 08",120,"Complete","Mada",null,"solo70@gmail.com"); insert into ORDERS values ("76541237","2021-12- 28",493,"Canceled","Cash","7812659837",null);
insert into ORDERS values ("13579642","2022-03-01",324,"In shipping","Visa",null,"sarahk@gmail.com");
insert into ORDERS values ("41968732","2019-04- 01",242,"Complete","Mastercard",null,"TNSaad@ymail.com"); insert into ORDERS values ("56439812","2020-06- 13",762,"Complete","Mada","1020764826",null);

--4-Inventory
insert into INVENTORY values ("Arriyadh","Qiddiya",230,"101","Espresso",10,"2022-03-01","2023-03-01"); insert into INVENTORY values ("Kiffa","MEXICO",46,"102","Drip",23,"2021-08- 21","2022-08-21");
insert into INVENTORY values ("CamelStep","Hima",89,"103","Drip",46,"2021- 05-14","2022-05-14");
insert into INVENTORY values ("Swa'a","Fazenda",62,"104","Espresso",55,"2021-11-12","2022-11-12"); insert into INVENTORY values ("Arriyadh","Qara",72,"105","Espresso",82,"2019-01-01","2020-01-01");

--5-COFFEE_ROASTERS
insert into COFFEE_ROASTERS values ("Arriyadh","+966114356743","arriyadh@gmail.com","Ahli","SA282095829760 3648596978",0.30);
insert into COFFEE_ROASTERS values ("Kiffa","+966121345678","kiffacoffee@gmail.com","Bilad","SA917988297336 76",0.35);
insert into COFFEE_ROASTERS values ("CamelStep","+966132347586","Camel@Step.co","SABB","SA685001051782 97336485",0.25);
insert into COFFEE_ROASTERS values ("Swa'a","+966141346742","Swaa@cafe.com","SAMBA","SA32127390005082 97336485",0.20);
insert into COFFEE_ROASTERS values ("Rocket","+966156889732","rocketroasters@gmail.com","Rajhi","SA2820958 297603648512345",0.40);

--6-DISCOUNT
insert into DISCOUNT values ("D22","2022-01-29","2022-12-29",0.10);
insert into DISCOUNT values ("EID","2022-04-02","2022-05-02",0.30);
insert into DISCOUNT values ("HPY","2022-03-04","2022-03-10",0.25);
insert into DISCOUNT values ("TYS","2022-06-01","2022-06-28",0.20);
insert into DISCOUNT values ("BLKFR","2022-11-25","2022-11-25",0.40);


