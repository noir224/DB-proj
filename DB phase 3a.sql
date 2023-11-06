CREATE DATABASE Charma;
USE Charma;
CREATE table Project
( 
Project_license varchar(8) primary key,
Pname varchar(50) not null,
Pdescription varchar(150),
Budget INT,
Pcategory varchar(15) CHECK (Pcategory IN ('Medical', 'Feeding', 'Water',
'Building', 'Educational')),
Plocation varchar(50),
Start_date date,
End_date date
);

CREATE table Donator
(
DCID char(12) primary key,
Dname varchar(15),
Demail varchar(30) unique not null,
Dphone char(8)
);

CREATE table Donates_to
(
 Plicense varchar(8),
 DCID char(12),
 Payment_date date,
 Amount_paid INT,
 primary key(Plicense,DCID),
 foreign key (Plicense) references Project(Project_license),
 foreign key (DCID) references Donator(DCID)
);
#minus = 0 mafi

CREATE table Volunteer
(
VCID char(12) primary key,
Vname varchar(15),
Vemail varchar(30) unique not null,
Vphone char(8) unique,
VDOB date, 
Vgender varchar(6) CHECK (Vgender IN ('Female', 'Male')),
Vaddress varchar(60),
Field_of_expertise varchar(20) CHECK (Field_of_expertise IN ('Medical', 'Public Service',
'Construction', 'Education'))
);
#16 yo

CREATE table Volunteers_in 
(
 Plicense varchar(8),
 VCID char(12),
 Vhours INT, 
 primary key(Plicense,VCID),
 foreign key (Plicense) references Project(Project_license),
 foreign key (VCID) references Volunteer(VCID)
);

CREATE table Beneficiary
(
BCID char(12) primary key,
Bname varchar(15),
Bphone char(8) unique not null,
Baddress varchar(60),
Bgender varchar(6) CHECK (Bgender IN ('Female', 'Male')),
BDOB date,
Family_members_No INT,
Medical_record varchar(100)
);

CREATE table Benefits 
(
 Plicense varchar(8),
 BCID char(12),
 Date_benefited date,
 primary key(Plicense,BCID),
 foreign key (Plicense) references Project(Project_license),
 foreign key (BCID) references Beneficiary(BCID)
);

CREATE table Department
(
Dnumber INT primary key,
DeptName varchar(30),
Dlocation varchar(30)
);


CREATE table Employee
(
ECID char(12) primary key,
Ename varchar(15),
Eemail varchar(30) unique not null,
Ephone char(8) not null unique,
Epassword varchar(20) not null,
Egender varchar(6) CHECK (Egender IN ('Female', 'Male')),
EDOB date,
Eaddress varchar(60),
Position_ varchar(30),
Dnum INT,
foreign key (Dnum) references Department(Dnumber),
foreign key (Position_) references Positions(Position_)
);

 


CREATE table Positions
(
Position_ varchar(30) primary key CHECK (Position_ IN('Director', 'Supervisor', 'Coordinator', 'Accountant',
'Worker', 'HR', 'Medical staff', 'Marketing', 'Volunteer Coordinator', 'Fundraising Manager')),
Salary int
);

CREATE table Works_on 
(
Plicense varchar(8),
ECID char(12),
primary key(Plicense,ECID),
foreign key (Plicense) references Project(Project_license),
foreign key (ECID) references Employee(ECID)
);

insert into Project values ('P9185425' , 'well in africa' , 'digging water well in poor countries' , 10000 , 'Water' , 'Africa' ,  '2021-06-23' , '2021-08-15');
insert into Project values ('P8319654' , 'medicine for palastine' , 'giving away essential medicine for the hospitals in Palastine that is in war' , 25000 , 'Medical' , 'Palestine' ,  '2021-05-12' , '2021-07-15');
insert into Project values ('P5459284' , 'food donationKW' , 'providing food for families in need during the first days of Ramadan' , 3000 , 'Feeding' , 'Kuwait' ,  '2019-04-01' , '2019-04-05');
insert into Project values ('P4962557' , 'water distrubtionKW' , 'giving away water bottles for workers' , 500 , 'Water' , 'Kuwait' ,  '2018-06-11' , '2018-08-25');
insert into Project values ('P3572447' , 'school in somalia' , 'building a school in Somalia' , 51500 , 'Building' , 'East Africa' ,  '2016-07-13' , '2017-09-23');
insert into Project values ('P3769365' , 'diabitics medicine_EYGPT' , 'free insulin for those who suffer from diabetes' , 20000 , 'Medical' , 'Egypt' ,  '2017-02-20' , '2017-03-05');
insert into Project values ('P7998265' , 'groceriesKW' , 'providing food for those who cannot buy in kuwait' , 5000 , 'Feeding' , 'Kuwait' ,  '2020-12-01' , '2021-01-05');
insert into Project values ('P2557302', 'water cleaning africa' , 'installing machines that clean dirty water' , 65000 , 'Water' , 'Africa' ,  '2016-03-01' , '2016-06-15');
insert into Project values ('P1692361' , 'medicine india' , 'providing medicine for hospitals in poor countries as india' , 30000 , 'Medical' , 'India' ,  '2015-01-11' , '2015-02-05');
insert into Project values ('P1564830' , 'food donation syria' , 'providing food for families in need during war in syria' , 9500 , 'Feeding' , 'Syria' ,  '2014-05-11' , '2014-07-15');
insert into Project values ('P9564830' , 'tech education africa' , 'truck of computers in africa to teach kids techno' , 129000 , 'Educational' , 'Africa' ,  '2021-09-12' , '2022-04-15');
insert into Project values ('P9892772' , 'erasing illitracyKW' , 'teaching people how to write and read in kuwait' , 2000 , 'Educational' , 'Kuwait' ,  '2021-11-23' , '2021-11-30');


insert into Donator values ('333222349761', 'Mohammahd', 'moh2335@gmail.com','52113098');
insert into Donator values ('882619939865', 'Sarah', 'ssforyum@yahoo.com','59876609');
insert into Donator values ('299039843322', 'Nada', 'nadnad433@gmail.com','67993403');
insert into Donator values ('122348883444', 'Bandar', 'bandaryolo@hotmail.com','99870334');
insert into Donator values ('301022400856', 'Nour', 'nourahmad224@gmail.com','51705903');
insert into Donator values ('328993829274', 'Nasser', 'nosnos33@gmail.com','68990982');
insert into Donator values ('579273916628', 'Sara', 'sarableu@hotmail.com','67237920');
insert into Donator values ('772936636266', 'Nolan', 'nolanjjss@gmail.com','99864182');
insert into Donator values ('388228939920', 'Ann', 'annlunacat@yahoo.com','56998629');
insert into Donator values ('287889203993', 'Malak', 'Malak666@gmail.com','98227308');

insert into Volunteer values ('292883990923', 'Adora', 'adorashera@gmail.com', '98227368', '1998-06-12', 'Female', 'West st.102', 'Public Service');
insert into Volunteer values ('838927739347', 'Catra', 'Catrahatesadora@yahoo.com', '57882973', '1999-05-05', 'Female', 'East st.102', 'Construction');
insert into Volunteer values ('553829927392', 'Glimmer', 'glimmer7729@gmail.com', '99283722', '1996-09-24', 'Female', 'long cost', 'Medical');
insert into Volunteer values ('829937288273', 'Bow', 'bowlotsolo@gmail.com', '56692738', '1996-06-01', 'Male', 'long cost', 'Medical');
insert into Volunteer values ('628827192792', 'Luz', 'luznoceda@hotmail.com', '98334029', '2001-02-24', 'Female', 'owl st. 89', 'Public Service');
insert into Volunteer values ('992048203819', 'Amity', 'amityblight@gmail.com', '92848209', '2001-04-01', 'Female', 'owl st. 55', 'Education');
insert into Volunteer values ('839910384928', 'Daria', 'dariamorgendorffer@yahoo.com', '67882928', '1998-01-09', 'Female', 'lawndale', 'Education');
insert into Volunteer values ('102888428839', 'Trent', 'trentlane@gmail.com', '66282933', '1989-08-22', 'Male', 'lawndale st.99', 'Construction');
insert into Volunteer values ('492899482939', 'Sam', 'samgardner@hotmail.com', '58829738', '1995-07-07', 'Male', 'seasaw st.109', 'Public Service');
insert into Volunteer values ('399482927755', 'Casey', 'caseygardner@gmail.com', '98366386', '1998-11-11', 'Female', 'linins st. 29', 'Medical');

insert into Beneficiary values ('126348964302' , 'Sara' , '66392284' , 'South Africa' , 'Female' , '1984-09-12' , 4, NULL);
insert into Beneficiary values ('347283940123' , 'Naved' , '97482935' , 'Middle East Palestine' , 'Male' , '1976-10-1' , 6 , 'Pressure and Diabetes');
insert into Beneficiary values ('937453627123' , 'Ahmad' , '69873425' , 'Kuwait' , 'Male' , '1994-08-10' , 10, NULL);
insert into Beneficiary values ('201934251627' , 'Amer' , '55492284' , 'Lebanon' , 'Male' , '1980-09-16' , 15, NULL);
insert into Beneficiary values ('745392536472' , 'Hiba' , '98453627' , 'Syria' , 'Female' , '1979-12-01' , 4, NULL);
insert into Beneficiary values ('123425678192' , 'Sally' , '57463829' , 'Kuwait' , 'Female' , '1991-01-22' , 16 , 'Diabetes');
insert into Beneficiary values ('564738291837' , 'Omar' , '99237463' , 'Egypt' , 'Male' , '1974-05-20' , 7 , 'Pressure');
insert into Beneficiary values ('847362172823' , 'Samar' , '54637282' , 'Iraq' , 'Female' , '1990-03-19' ,NULL, NULL);
insert into Beneficiary values ('564738291023' , 'Mohammed' , '56992284' , 'Eygpt' , 'Male' , '1995-11-12' , 11 , 'Diabetes');
insert into Beneficiary values ('536473829104' , 'Osama' , '95364732' , 'Saudi Arabia' , 'Male' , '1984-09-12' , 10, NULL);


insert into Department values (1, 'General Management', 'Salmiya');
insert into Department values (2, 'Accounting', 'Jabriya');
insert into Department values (3, 'Project Management', 'Mishrif');
insert into Department values (4, 'PR', 'Salmiya');
insert into Department values (5, 'volunteers', 'Hawally');
insert into Department values (6, 'Medical Staff', 'Mubarak Alkabeer');

insert into Positions values ('Director', 10000);
insert into Positions values ('Supervisor', 8000);
insert into Positions values ('Coordinator', 5000);
insert into Positions values ('Accountant', 2000);
insert into Positions values ('Worker', 1000);
insert into Positions values ('HR', 1200);
insert into Positions values ('Medical Staff', 7000);
insert into Positions values ('Marketing', 1500);
insert into Positions values ('Volunteer Coordinator', 6000);
insert into Positions values ('Fundraising Manager', 4000);

insert into Employee values ('230987368892', 'sally', 'sallyfrankly@gmail.com', '99836277','salsal93Sm', 'Female', '2000-09-22', 'Jabriya 3b', 'Worker',1);
insert into Employee values ('728839204772', 'salem', 'ssslamenm3@gmail.com', '67299273','Salem2019%', 'Male', '1996-04-07', 'Salmiya v2', 'Worker',3);
insert into Employee values ('663829372937', 'lamma', 'lammahnour@gmail.com', '98362092','Lammablue3', 'Female', '1999-12-12', 'Salem Mubarak b.5', 'Worker',4);
insert into Employee values ('389283902930', 'Ben', 'Benlaskotiv@gmail.com', '51200273','BenBak41', 'Male', '1989-09-15', 'Hateen', 'Worker',5);
insert into Employee values ('188294729372', 'Ghada', 'Ghadaraee@hotmail.com', '90773645','ghadaGG55', 'Female', '1977-04-01', 'Jabriya', 'Director',1);
insert into Employee values ('773927233920', 'Bojack', 'Bojackhorseman@yahoo.com', '67992038','BojackPain8', 'Male', '1982-09-15', 'Salmiya long st.', 'Marketing',4);
insert into Employee values ('299328297488', 'Coraline', 'Coralinetim@gmail.com', '52883917','coributton202', 'Female', '2001-06-06', 'beacholio st.102', 'HR',1);
insert into Employee values ('629926301634', 'Jake', 'Jakethedog@hotmail.com', '97008293','bakingPancakes2', 'Male', '1980-12-25', 'treehouse B23', 'Supervisor',3);
insert into Employee values ('200397193782', 'Finn', 'finnthehuman@hotmail.com', '99882203','Yobro6969', 'Male', '1999-02-02', 'treehouse B44', 'Supervisor',5);
insert into Employee values ('890273927739', 'Bonnie', 'PrincessBubblegum@gmail.com', '51698023','marcythequeen%5', 'Female', '1995-08-18', 'candykingdom st.2', 'Supervisor',6);
insert into Employee values ('626606881634', 'Jake', 'Jakeiscool@hotmail.com', '93674829','bakingPancakes0', 'Male', '1980-02-25', 'treehouse B29', 'Coordinator',3);
insert into Employee values ('822738008283', 'Marceline', 'Macreyvampire@hotmail.com', '51483976','MyFries992', 'Female', '1996-06-06', 'nightosphere', 'Accountant',2);
insert into Employee values ('209399203820', 'Ben', 'bonioben2@yahoo.com', '93224592','benajole322', 'Male', '1988-07-19', 'northen st.', 'Accountant',2);
insert into Employee values ('233841048399', 'Catlyin', 'enforcerrule@hotmail.com', '67199287','hexatechCat9', 'Female', '1992-05-20', 'piltvort', 'Medical staff',6);
insert into Employee values ('293884028489', 'joan', 'joanjett@yahoo.com', '92027392','therunawaysRR', 'Female', '1975-09-19', 'longlike st.', 'Medical staff',6);
insert into Employee values ('828982927338', 'Finn', 'thehumanff@gmail.com', '58292382','ffiiinn993', 'Male', '1977-07-07', 'thursday valley b.9', 'Volunteer Coordinator',5);
insert into Employee values ('992039203022', 'Mitski', 'mitski22p@hotmail.com', '98225387','lastwordsstar2', 'Female', '1990-09-27', 'tokyo st.', 'Fundraising Manager',3);


insert into Donates_to values ('P9185425', '333222349761', '2021-06-27', 100);
insert into Donates_to values ('P8319654', '882619939865', '2021-06-03', 250);
insert into Donates_to values ('P3769365', '299039843322', '2017-07-30', 50);
insert into Donates_to values ('P9892772', '287889203993', '2021-11-24', 170);
insert into Donates_to values ('P7998265', '882619939865', '2020-12-15', 50);
insert into Donates_to values ('P9892772', '772936636266', '2021-11-23', 290);

insert into Volunteers_in values ('P8319654','553829927392',6);
insert into Volunteers_in values ('P3769365','553829927392',3);
insert into Volunteers_in values ('P9564830','992048203819',8);
insert into Volunteers_in values ('P3572447','102888428839',23);
insert into Volunteers_in values ('P5459284','292883990923',20);

insert into Benefits values ('P3769365','564738291023','2017-02-25');
insert into Benefits values ('P7998265','937453627123','2021-01-01');
insert into Benefits values ('P1564830','745392536472','2014-06-11');
insert into Benefits values ('P7998265','123425678192','2021-01-01');

insert into Works_on values ('P5459284','663829372937'); #food
insert into Works_on values ('P5459284','629926301634'); #food
insert into Works_on values ('P9564830','822738008283'); #tech
insert into Works_on values ('P1692361','233841048399'); #medicine
insert into Works_on values ('P3572447','728839204772'); #construction
insert into Works_on values ('P3769365','629926301634'); #medicine 
insert into Works_on values ('P5459284','828982927338');

Select * From Project;
Select * From Donator;
Select * From Beneficiary;
Select * From Department;
Select * From Donates_to;
Select * From Positions;
Select * From Employee;
Select * From Works_on;
Select * From Benefits;
Select * From Volunteer;
Select * From Volunteers_in;