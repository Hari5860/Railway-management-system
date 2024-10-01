create schema railway_management;
use railway_management;



-- create table Train--


create table Train(
Train_No int primary key,
Train_Name varchar(100),
Train_Time time(6),
Starting_Station varchar(100),
Ending_Station varchar(100),
Via varchar(1000)
);
select*from Train;


create index idx_Train_Name on Train(Train_Name);
create table Station(
Station_id int primary key not null,
Station_Name varchar(100) not null,
Train_Name varchar(100) not null,
Departure_Time time,
constraint fk_trainname foreign key(Train_Name) references Train(Train_Name)
);

-- create table Route--//

create index idx_starting_station on Train(Starting_Station);
create index idx_Ending_Station on Train(Ending_Station);
create table Route(
Route_id int primary key not null,
Train_no int not null,
starting_Station varchar(100) not null,
Ending_Station varchar(100) not null,
Distence varchar(100),
Travel_Time varchar(100),
constraint fk_TrainNo foreign key(Train_No) references Train(Train_No),
constraint fk_starting_station foreign key(Starting_Station) references Train(Starting_Station),
constraint fk_Ending_station foreign key(Ending_Station) references Train(Ending_Station)
);


-- create table schedule--//

create table Schedule(
Schedule_id int primary key not null,
Train_No int not null,
Departure_Date date not null,
Departure_Time Time not null,
Arrival_Date date not null,
Arrival_Time time not null,
constraint fk_Train_No foreign key(Train_No) references Train(Train_No)
);


-- create table passenger_details--

create table Passenger_details(
Passenger_Name varchar(100) not null,
Passenger_mobno varchar(50) primary key not null,
Passenger_Age int not null,
Passenger_Gender varchar(100) not null,
Class varchar(100) not null,
Birth_Preferences varchar(100) not null,
Train_Name varchar(100) not null,
Starting_Station varchar(100) not null,
Ending_Station varchar(100) not null,
Quota_Name varchar(100) not null,
Payment_mode varchar(100) not null
);
select*from Passenger_details;
alter Table Passenger_details rename column Payment to Payment_Mode;

-- create table payment--//

create index idx_Passenger_Name on Passenger_details(Passenger_Name);
create index idx_Payment_Mode on Passenger_details(Payment_Mode);
create table Payment(
Payment_id int primary key not null,
Passenger_mobno varchar(100) not null,
Passenger_Name varchar(100) not null,
Payment_Type varchar(100) not null,
Payment_Mode varchar(100) not null,
constraint fk_PassengerMobno foreign key(Passenger_mobno) references Passenger_details(Passenger_mobno),
constraint fk_PassengerName foreign key(Passenger_Name) references Passenger_details(Passenger_Name),
constraint fk_PaymentMode foreign key(Payment_Mode) references Passenger_details(Payment_Mode)
);

select * from payment;


-- create table Quota--


Create index idx_QuotaName on passenger_details(Quota_Name);
create table Quota(
Quota_Name varchar(100) not null,
Train_No int primary key not null,
Train_Name varchar(100) not null,
PNR_No int not null,
Coach_No varchar(100) not null,
class varchar(100) not null,
Seat_no varchar(100) not null,
constraint fk_Quota_Name foreign key(Quota_Name) references Passenger_details(Quota_Name)
);
select*from Quota;


-- create Table Passenger Name Record(PNR)--

create index idx_PNR_NO on Quota(PNR_NO);
create index idx_Train_Name on Quota(Train_Name);
create table PNR(
PNR_No int primary key not null,
Booking_id int not null,
Booking_Status varchar(100) not null,
Train_Name varchar(100) not null,
Passenger_name varchar(100) not null,
Quota_Name varchar(100) not null,
Coach_No varchar(100) not null,
class varchar(100),
Seat_no varchar(100),
constraint fk_PNR_No foreign key(PNR_No) references Quota(PNR_No),
constraint fk_Train_Name foreign key(Train_Name) references Train(Train_Name)
);
select*from PNR;

-- create table Booking--//


create index idx_BookingStatus on PNR(Booking_Status);
create table Booking(
Booking_id int primary key not null,
Passenger_mobno varchar(100) not null,
Passenger_Name varchar(100) not null,
Train_Name varchar(100) not null,
Booking_Status varchar(100) not null,
Coach_No varchar(100) not null,
Seat_no varchar(100) not null,
constraint fk_BookingStatus foreign key(Booking_Status) references PNR(Booking_Status)
);

-- Train insert values--

insert into Train
               (Train_No,Train_Name,Train_Time,Starting_Station,Ending_Station,Via)
values 

(20627,"MS Ncj Vb Exp","05:00:00","Chennai Egmore","Nagercoil","[Vilupuram,Tiruchirappalli,Madurai,Tirunelveli]"),
(22671,"Tejas Exp","06:00:00","Chennai Egmore","Madurai","[Vilupuram,Virudhachalam,Tiruchirappli,Dindukal]"),
(22675,"Chozhan Sf Exp","07:45:00","Chennai Egmore","Tanjore","[Vilupuram,Virudhachalam,Kumbakonam]"),
(22536,"Bsbs Rmm Exp","08:30:00","Chennai Egmore","Rameshwaram","[Vilupuram,Tiruchirappalli,Madurai,Karaikudi]"),
(16127,"MS Guruvayur Exp","09:35:00","Chennai Egmore","Guruvayur","[Vilupuram,Tiruchirappalli,Coimbatore,palakad]"),
(22632,"Bkn Mdu Sf Exp","10:15:00","chennai Egmore","Madurai","[vilupuram,Virudhachalam,Tiruchirappli,Dindukal]"),
(12635,"Vaigai Sf Exp","13:50:00","Chennai Egmore","Madurai","[vilupuram,Virudhachalam,Tiruchirappli,Dindukal]"),
(22605,"Prr Ten Sf Exp","14:05:00","Chennai Egmore","Tirunelveli","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12605,"Pallavn Sf Exp","15:45:00","Chennai Egmore","Karaikudi","[vilupuram,Virudhachalam,Tiruchirappli,Pudukkottai]"),
(20605,"Ms Tcn Sf Exp","16:10:00","Chennai Egmore","Tiruchendur","[Vilupuram,Tiruchirappalli,Madurai,Tirunelveli]"),
(12642,"Nzm Cape Sf Exp","16:20:00","Chennai Egmore","Kanniyakumari","[Vilupuram,Tiruchirappalli,Madurai,Tirunelveli]"),
(16101,"Ms Qln Exp","15:00:00","Chennai Egmore","Kollam","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12633,"Kannyakumari Exp","17:20:00","Chennai Egmore","Kannyakumari","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(22621,"Rmm Sf Exp","17:45:00","Chennai Egmore","Rameshwaram","[Vilupuram,Tiruchirappalli,Madurai,Karaikudi]"),
(16751,"MS Rmm Exp","19:15:00","Chennai Egmore","Rameshwaram","[Vilupuram,Tiruchirappalli,Madurai,Karaikudi]"),
(12693,"Pearl City Exp","19:30:00","Chennai Egmore","Tuticorin","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(20635,"Anantapuri Exp","19:50:00","Chennai Egmore","Kollam","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12631,"Nellai Sf Exp","20:10:00","Chennai Egmore","Tirunelveli","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12661,"Pothigai Sf Exp","20:40:00","Chennai Egmore","Sengottai","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12665,"Hwh Cape Sf Exp","21:10:00","Chennai Egmore","Kanniyakumari","[Vilupuram,Tiruchirappalli,Madurai,Virudhunagar]"),
(12637,"Pandian Sf Exp","21:40:00","Chennai Egmore","Madurai","[vilupuram,Virudhachalam,Tiruchirappli,Dindukal]"),
(12653,"Rockfort Sf Exp","23:35:00","Chennai Egmore","Tiruchirappalli","[Tambaram,vilupuram,Virudhachalam,Ariyalur]"),
(16159,"Ms Maq Exp","23:50:00","Chennai Egmore","Mangalore","[Vilupuram,Tiruchirappalli,Coimbatore,palakad]")
;
select Train_No,Train_Name,Train_Time,Starting_Station,Ending_Station,Via 
from Train
order by Train_Time asc;

-- Station Insert values--//

insert into Station
(Station_id,Station_Name,Train_Name,Departure_Time)
values
(1,"Chennai Egmore","Ms Maq Exp","23:50:00"),
(2,"Chennai Egmore","Pothigai Sf Exp","20:40:00"),
(3,"Chennai Egmore","Rockfort Sf Exp","23:35:00"),
(4,"Chennai Egmore","Tejas Exp","06:00:00"),
(5,"Chennai Egmore","Vaigai Sf Exp","01:50:00")
;
select * from Station;

-- Route Insert Values--//

insert into Route
(Route_id,Train_No,Starting_Station,Ending_Station,Distence,Travel_Time)
values
(1,20627,"Chennai Egmore","Nagercoil",710,"12hr18min"),
(2,22671,"Chennai Egmore","Madurai",470,"6hr38min"),
(3,22675,"Chennai Egmore","Tanjore",345,"5hr45min"),
(4,22536,"Chennai Egmore","Rameshwaram",559,"13hr00min"),
(5,16127,"Chennai Egmore","Guruvayur",638,"12hr00min"),
(6,22632,"Chennai Egmore","Madurai",470,"8hr30min"),
(7,12635,"Chennai Egmore","Madurai",470,"8hr30min"),
(8,22605,"Chennai Egmore","Tirunelveli",623,"10hr25min"),
(9,16101,"Chennai Egmore","Kollam",727,"17hr00min"),
(10,12605,"Chennai Egmore","Karaikudi",418,"6hr40min"),
(11,20605,"Chennai Egmore","Tiruchendur",638,"10hr45min"),
(12,12642,"Chennai Egmore","Kanniyakumari",707,"12hr00min"),
(13,12633,"Chennai Egmore","Kanniyakumari",707,"9hr20min"),
(14,22621,"Chennai Egmore","Rameshwaram",559,"11hr00min"),
(15,16751,"Chennai Egmore","Rameshwaram",559,"10hr00min"),
(16,12693,"Chennai Egmore","Tuticorin",604,"10hr50min"),
(17,20635,"Chennai Egmore","Kollam",727,"12hr35min"),
(18,12631,"Chennai Egmore","Tirunelveli",623,"10hr20min"),
(19,12661,"Chennai Egmore","Sengottai",627,"11hr00min"),
(20,12665,"Chennai Egmore","Kanniyakumari",707,"11hr32min"),
(21,12637,"Chennai Egmore","Madurai",460,"6hr40min"),
(22,12653,"Chennai Egmore","Tiruchirappalli",332,"5hr15min"),
(23,16159,"Chennai Egmore","Mangalore",961,"17hr25min")
;

select*from Route;

-- Schedule Insert Values--//

insert into Schedule
(Schedule_id,Train_no,Departure_Date,Departure_Time,Arrival_Date,Arrival_Time)
values
(2,22671,"24-10-01","06:00:00","24-10-01","12:15:00"),
(3,22675,"24-10-01","07:45:00","24-10-01","13:42:00"),
(4,22536,"24-10-01","08:30:00","24-10-01","22:40:00"),
(5,16127,"24-10-01","09:35:00","24-10-02","07:40:00"),
(6,22632,"24-10-01","10:15:00","24-10-01","18:40:00"),
(7,12635,"24-10-01","13:50:00","24-10-01","21:30:00"),
(8,22605,"24-10-01","14:05:00","24-10-01","04:10:00"),
(9,16101,"24-10-01","15:00:00","24-10-02","07:00:00"),
(10,12605,"24-10-01","15:45:00","24-10-01","22:35:00"),
(11,20605,"24-10-01","16:10:00","24-10-02","05:43:00"),
(12,12642,"24-10-01","16:20:00","24-10-02","04:40:00"),
(13,12633,"24-10-01","17:20:00","24-10-02","05:35:00"),
(14,22621,"24-10-01","17:45:00","24-10-02","04:10:00"),
(15,16751,"24-10-01","19:15:00","24-10-02","08:20:00"),
(16,12693,"24-10-01","19:30:00","24-10-02","06:26:00"),
(17,20635,"24-10-01","19:50:00","24-10-02","11:15:00"),
(18,12631,"24-10-01","20:10:00","24-10-02","06:40:00"),
(19,12661,"24-10-01","20:40:00","24-10-02","07:35:00"),
(20,12665,"24-10-01","21:10:00","24-10-02","09:55:00"),
(21,12637,"24-10-01","21:40:00","24-10-02","05:25:00"),
(22,12653,"24-10-01","23:35:00","24-10-02","04:55:00"),
(23,16159,"24-10-01","23:50:00","24-10-02","19:15:00")
;
select * from Schedule;


-- Passenger Insert values--


insert into Passenger_details 
	(Passenger_Name,Passenger_mobno,Passenger_Age,Passenger_Gender,Class,Birth_Preferences,Train_Name,Starting_Station,Ending_Station,Quota_Name,Payment_Mode)
values
 ("Hari",9787675860,22,"Male","2s","Window","Rockfort Sf Exp","Chennai Egmore","Tiruchirappalli","General","Online"),
 ("Pavi",8767543231,21,"Female","2s","No preference","Pandian Sf Exp","Vilupuram","Tiruchirappalli","Tatkal","Online"),
 ("Maheswari",7645897632,22,"Female","2s","No preference","Pallavn Sf Exp","Tiruchirappalli","Karaikudi","General","Online"),
 ("Jeni",9686455321,22,"Female","2s","No preference","Vaigai Sf Exp","Chennai Egmore","Dindukal","Tatkal","OnLine"),
 ("Jessi",6383987654,22,"Female","2s","Window","Pothigai Sf Exp","Vilupuram","Madurai","Tatkal","Online"),
 ("Venish",9384285860,21,"Female","2s","Window","Chozhan Sf Exp","Vilupuram","Kumbakonam","General","Online"),
 ("Eva",8825767411,21,"Female","2s","Window","Anantapuri Exp","Chennai Egmore","Virudhunagar","Ladies","Online"),
 ("Jaisy",8675887035,21,"Female","2s","Window","Ms Maq Exp","Chennai Egmore","Palakad","Ladies","Online"),
 ("Aravind",7695988876,23,"Male","2s","No preference","MS Guruvayur Exp","Chennai Egmore","Coimbatore","Tatkal","Online"),
 ("Vetri",9003898500,23,"Male","2s","Window","MS Ncj Vb Exp","Chennai Egmore","Tiruchirappalli","General","Online"),
 ("Selva",6379032753,62,"Male","2s","No preference","Ms Qln Exp","Chennai Egmore","Kollam","Senior Citizen","Online"),
 ("Saruthy",8754182306,23,"Female","2s","Window","Tejas Exp","Chennai Egmore","Madurai","General","Online"),
 ("Priya",9597660943,23,"Female","2s","Window","Hwh Cape Sf Exp","Chennai Egmore","Kanniyakumari","Tatkal","Online"),
 ("Prasana Priya",9344062061,23,"Female","2s","Window","Bsbs Rmm Exp","Chennai Egmore","Rameshwaram","Tatkal","Online"),
 ("Latsman",8778809570,65,"Male","2s","No preference","Kannyakumari Exp","Chennai Egmore","Kanniyakumari","Senior Citizen","Online"),
 ("Asraf",9654342367,22,"Male","2s","No preference","Nellai Sf Exp","Chennai Egmore","Tirunelveli","General","Online"),
 ("Jones",6380170209,23,"Male","2s","Window","Prr Ten Sf Exp","Chennai Egmore","Tirunelveli","General","Online"),
 ("Ajith",9361691369,23,"Male","2s","Window","Bkn Mdu Sf Exp","Vilupuram","Virudhachalam","Tatkal","Online"),
 ("Ajith",8248507688,24,"Male","2s","Window","Nzm Cape Sf Exp","Chennai Egmore","Vilupuram","General","Online")
 ;
 update passenger_details set payment_mode="Online" where passenger_name="Jeni";
 select * from Passenger_details
 order by Passenger_name asc;
 

 
 -- Payment insert values--//
 
insert into Payment
(Payment_id,Passenger_mobno,Passenger_Name,Payment_Type,Payment_Mode)
values
(1,6379032753,"Selva","UPI","online"),
(2,6380170209,"Jones","UPI","online"),
(3,6383987654,"Jessi","UPI","online"),
(4,7645897632,"Maheswari","Net Banking","online"),
(5,7695988876,"Aravind","UPI","online"),
(6,8248507688,"Ajith","Net banking","online"),
(7,8675887035,"Jaisy","Net banking","online"),
(8,8754182306,"Saruthy","UPI","online"),
(9,8767543231,"Pavi","UPI","online"),
(10,8778809570,"Latsman","UPI","online"),
(11,8825767411,"Eva","UPI","online"),
(12,9003898500,"Vetri","Net Banking","online"),
(13,9344062061,"Prasana Priya","Net Banking","online"),
(14,9361691369,"Ajith","UPI","online"),
(15,9384285860,"Venish","UPI","online"),
(16,9597660943,"Priya","UPI","online"),
(17,9654342367,"Asraf","Net Banking","online"),
(18,9686455321,"Jeni","UPI","online"),
(19,9787675860,"Hari","UPI","online")
;
select*from Payment;

-- Quota insert values--
 
 insert into Quota
	(Quota_Name,Train_No,Train_Name,PNR_No,Coach_No,class,Seat_No)
      values
("General",12653,"Rockfort Sf Exp",23567,"D1","2S",16),
("Tatkal",12637,"Pandian Sf Exp",76754,"S4","2S",22),
("General",12605,"Pallavn Sf Exp",94071,"S4","2S",15),
("General",12631,"Nellai Sf Exp",70844,"S7","2S",27),
("Tatkal",12635,"Vaigai Sf Exp",38398,"S8","2S",20),
("General",22675,"Chozhan Sf Exp",38428,"S5","2S",19),
("Ladies",20635,"Anantapuri Exp",82576,"S6","2S",28),
("Ladies",16159,"Ms Maq Exp",867588,"S6","2S",26),
("Tatkal",16127,"MS Guruvayur Exp",79598,"S6","2S",22),
("Tatkal",12665,"Hwh Cape Sf Exp",66806,"S4","2S",21),
("General",20627,"MS Ncj Vb Exp",30389,"S2","2S",18),
("Senior Citizen",16101,"Ms Qln Exp",37903,"S6","2S",26),
("General",22671,"Tejas Exp",75418,"S3","2S",20),
("Tatkal",22536,"Bsbs Rmm Exp",34406,"S5","2S",24),
("Tatkal",22632,"Bkn Mdu Sf Exp",16596,"S7","2S",27),
("Tatkal",12661,"Pothigai Sf Exp",36114,"S8","2S",21),
("Senior Citizen",16633,"Kannyakumari Exp",77880,"S6","2S",26),
("General",22605,"Prr Ten Sf Exp",38017,"S9","2S",19),
("General",12642,"Nzm Cape Sf Exp",24850,"S7","2S",27)
;
select * from Quota;


 -- PNR insert values--
 

 insert into PNR 	
    (PNR_No,Booking_id,Booking_Status,Train_Name,Passenger_Name,Quota_Name,Coach_No,class,Seat_No)
values
(37903,1,"CNF","Ms Qln Exp","Selva","Senior Citizen","S6","2S",26),
(38017,2,"CNF","Prr Ten Sf Exp","Jones","General","S9","2S",19),
(36114,3,"CNF","Pothigai Sf Exp","Jessi","Tatkal","S8","2S",21),
(94071,4,"CNF","Pallavn Sf Exp","Maheswari","General","S4","2S",15),
(79598,5,"CNF","MS Guruvayur Exp","Aravind","Tatkal","S6","2S",22),
(24850,6,"CNF","Nzm Cape Sf Exp","Ajith","General","S7","2S",27),
(867588,7,"CNF","Ms Maq Exp","Jaisy","Ladies","S6","2S",26),
(75418,8,"CNF","Tejas Exp","Saruthy","General","S3","2S",20),
(76754,9,"CNF","Pandian Sf Exp","Pavi","Tatkal","S4","2S",22),
(77880,10,"CNF","Kannyakumari Exp","Latsman","Senior Citizen","S6","2S",26),
(82576,11,"CNF","Anantapuri Exp","Eva","Ladies","S6","2S",28),
(30389,12,"CNF","MS Ncj Vb Exp","Vetri","General","S2","2S",18),
(34406,13,"CNF","Bsbs Rmm Exp","Prasana Priya","Tatkal","S5","2S",24),
(16596,14,"CNF","Bkn Mdu Sf Exp","Ajith","Tatkal","S7","2S",27),
(38428,15,"CNF","Chozhan Sf Exp","Venish","General","S5","2S",19),
(66806,16,"CNF","Hwh Cape Sf Exp","Priya","Tatkal","S4","2S",21),
(70844,17,"CNF","Nellai Sf Exp","Asraf","General","S7","2S",27),
(38398,18,"CNF","Vaigai Sf Exp","Jeni","Tatkal","S8","2S",20),
(23567,19,"CNF","Rockfort Sf Exp","Hari","General","D1","2S",16)
;
select*From pnr
order by booking_id asc;


-- Booking Insert Values--//

insert into Booking
(Booking_id,Passenger_mobno,Passenger_Name,Train_Name,Booking_Status,Coach_No,Seat_no)
values
(1,6379032753,"Selva","Ms Qln Exp","CNF","S6",26),
(2,6380170209,"Jones","Prr Ten Sf Exp","CNF","S9",19),
(3,6383987654,"Jessi","Pothigai Sf Exp","CNF","S8",21),
(4,7645897632,"Maheswari","Pallavn Sf Exp","CNF","S4",15),
(5,7695988876,"Aravind","MS Guruvayur Exp","CNF","S6",22),
(6,8248507688,"Ajith","Nzm Cape Sf Exp","CNF","S7",27),
(7,8675887035,"Jaisy","Ms Maq Exp","CNF","S6",26),
(8,8754182306,"Saruthy","Tejas Exp","CNF","S3",20),
(9,8767543231,"Pavi","Pandian Sf Exp","CNF","S4",22),
(10,8778809570,"Latsman","Kannyakumari Exp","CNF","S6",26),
(11,8825767411,"Eva","Anantapuri Exp","CNF","S6",28),
(12,9003898500,"Vetri","MS Ncj Vb Exp","CNF","S2",18),
(13,9344062061,"Prasana Priya","Bsbs Rmm Exp","CNF","S5",24),
(14,9361691369,"Ajith","Bkn Mdu Sf Exp","CNF","S7",27),
(15,9384285860,"Venish","Chozhan Sf Exp","CNF","S5",19),
(16,9597660943,"Priya","Hwh Cape Sf Exp","CNF","S4",21),
(17,9654342367,"Asraf","Hwh Cape Sf Exp","CNF","S7",27),
(18,9686455321,"Jeni","Vaigai Sf Exp","CNF","S8",20),
(19,9787675860,"Hari","Rockfort Sf Exp","CNF","D1",16)
;
select*from Booking
order by passenger_name asc;



                  ------- Using Join---------//

-- Passenger details joins Train table--//
create view pd_tr
as
select Passenger_details.Passenger_Name,Passenger_details.Passenger_age,Train.Train_No,Train.Train_Name 
from Passenger_details inner join Train on Passenger_details.Train_Name=Train.Train_Name;
 
 -- Quota joins Passenger details table--//

select Passenger_details.Passenger_Name,Passenger_details.Train_Name,Quota.Quota_Name
from Passenger_details inner join Quota
on Passenger_details.Quota_Name=Quota.Quota_Name;

-- PNR joins Quota table--//

select  Quota.Train_No, Quota.Train_Name,PNR.PNR_No,PNR.PNR_Status,PNR.Coach_No,PNR.Seat_No,PNR.Class 
from Quota inner join PNR on Quota.PNR_No=PNR.PNR_No;

-- Train Joins PNR tables--//

select Train.Train_Name,Train.Train_Time,PNR.PNR_No,PNR.Booking_Status,PNR.Coach_No,PNR.Seat_No,PNR.Class 
from Train inner join PNR on Train.Train_Name=PNR.Train_Name;

-- PNR joins Booking Tables--//

select booking.booking_id,booking.booking_status,booking.train_name,pnr.coach_no,pnr.seat_no 
from booking inner join pnr on booking.booking_id = pnr.booking_id
order by Booking_id asc;

-- Payment joins Passenger_details tables--//

select distinct payment.payment_id,payment.passenger_mobno,payment.payment_type,passenger_details.passenger_name,passenger_details.payment_mode
from payment inner join passenger_details on payment.passenger_name=passenger_details.passenger_name;

-- joins using join in three tables--//

select passenger_details.passenger_name,passenger_details.passenger_age,passenger_details.passenger_mobno,payment.payment_id,payment.payment_type,booking.booking_status
from passenger_details join payment on passenger_details.passenger_mobno=payment.passenger_mobno join booking on payment.passenger_mobno=booking.passenger_mobno
order by payment_id asc;


-- using aggrecate function--//

select avg(passenger_age),passenger_name from passenger_details
group by passenger_name
having avg(passenger_age)<22
order by  passenger_name desc
limit 2;

select passenger_name from passenger_details
where starting_station="vilupuram"
order by passenger_name asc;

//-- using like and wildcards--//
select * from passenger_details
where passenger_name like "a%"
order by Passenger_name asc;

select * from train
where train_name like "r__k%p";

//-- using distinct removes duplicate data--//

select distinct Passenger_name from Passenger_details 
where passenger_name="ajith"; 

-- using where clause--//

select * from train 
where train_time in ("21:40:00");

//-- using sub query--//

select train_name,train_no from train
where train_time <> (select train_time from train where train_time="05:00:00");

select passenger_name from passenger_details
where passenger_name like "a%" and passenger_name <> (select Passenger_name from passenger_details where passenger_name="aravind");

 select * from passenger_details
 where quota_name="general" and passenger_name not in (select passenger_name from passenger_details where passenger_name in ("ajith","venish","hari"));
 
 select * from pnr
 where passenger_name like "s%" and passenger_name <> (select passenger_name from pnr where passenger_name="selva");
 
 select passenger_name,train_name from pnr
 where seat_no in ("20","21","22") and train_name <>(select Train_name from quota where train_name="vaigai sf exp");

select passenger_name,train_name from pnr
where seat_no in ("20","21","22") and train_name not in (select Train_name from quota where train_name in ("vaigai sf exp","tejas exp","pandian sf exp"));

select passenger_name,passenger_age from passenger_details
where passenger_age in ("21","22") and passenger_name not in (select passenger_name from passenger_details where passenger_name in ("jaisy","jessi"));

select passenger_name,payment_type from payment
where payment_type <> ("upi") and passenger_name not in(select passenger_name from payment where passenger_name in ("ajith","jaisy"));

select passenger_name,payment_type from payment
where payment_type in ("upi") and passenger_name in(select passenger_name from payment where passenger_name in ("ajith","jeni"));
 
 //-- using aggricate fuctions--//
 
select count(passenger_name),Passenger_gender from passenger_details
group by Passenger_gender;
 
select count(passenger_name),quota_name from passenger_details
group by quota_name;
 
select avg(passenger_age),Passenger_gender from passenger_details
group by Passenger_gender
order by Passenger_gender asc;

select count(passenger_name),quota_name from passenger_details
group by Quota_name
having min(passenger_age)<25
limit 1;

select count(passenger_name),quota_name from passenger_details
group by Quota_name
having min(passenger_age)>20;

select count(passenger_name)as passenger_count,payment_type from payment
where passenger_name in ("ajith","jeni")
group by payment_type;


-- using views join  passenger_details & train--//

select * from pd_tr;

------------------------------------ X ------------------------------------------------------------------------------ X ----------------------------------------

 

 
 


 
 
 

