create table Customer(
CustomerID int primary key not null,
name nvarchar(50),
city nvarchar(50),
country nvarchar(50),
phone nvarchar(15),
email nvarchar(50),
);

create table CustomerAccount(
AccountNumber char(9) primary key not null,
CustomerID int foreign key references Customer(CustomerID) not null,
Balance money not null,
MinAccount money,
);

create table CustomerTransaction(
TransactionID int primary key not null,
AccountNumber char(9) foreign key references CustomerAccount(AccountNumber),
TransactionDate smalldatetime,
Amount money,
DepostitorWithdraw bit,
);

insert into Customer(CustomerID,name,city,country,phone,email)
values (1,'Le Quynh Nga','Hanoi','Vietnam','0987654321','lqnga28@gmail.com'),
(2,'Ngo Hoai Nam','Thanhhoa','Vietnam','0981234567','nhnam04@gmail.com'),
(3,'Tran Thanh Tung','Hanoi','Vietnam','0123456789','tttung98@gmail.com'),
(4,'Nguyen Thi Kieu Diem','Bacgiang','Vietnam','0456123789','kdiem23@gmail.com');

select * from Customer;


insert into CustomerAccount(AccountNumber,CustomerID,Balance,MinAccount)
values ('123456789',1,'778293','300'),
('123789345',2,'1938473','300'),
('789456334',3,'20987300','300'),
('456113789',4,'10099809','300');

select * from CustomerAccount;

insert into CustomerTransaction(TransactionID,AccountNumber,TransactionDate,Amount,DepostitorWithdraw)
values (123,'123456789','2021/11/22','20000',1),
(119,'123456789','2022/12/20','10000',1),
(125,'789456334','2022/12/28','40000',1),
(234,'456113789','2023/01/24','14900',1),
(302,'123789345','2023/01/24','23990',1),
(120,'123789345','2023/02/22','201999',1);

select * from CustomerTransaction;

select * from Customer where City like 'Hanoi';

 select * from CustomerAccount where CustomerId in 
(select CustomerId from Customer where Name like 'Tran Thanh Tung');

select * from CustomerAccount where CustomerId in 
(select CustomerId from Customer where Phone like '0987654321');

select * from CustomerAccount where CustomerId in 
(select CustomerId from Customer where Email like 'kdiem23@gmail.com');

select  * from CustomerAccount where AccountNumber like  '123789345';
