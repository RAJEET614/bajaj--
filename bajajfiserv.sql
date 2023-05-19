create table product( ProductId VARCHAR(30) primary key, ProductName VARCHAR(30), ProductGroup VARCHAR(30));
insert into product values('PRD01','Full Health Cover','Family');
insert into product values('PRD02','OPD care package','Personal');
insert into product values('PRD03','Comprehensive Lab Package','Personal');
insert into product values('PRD04','Heart Care','Family');
insert into product values('PRD05','Full Body Care','Personal');
create table policy( CustomerId INT,PolicyId VARCHAR(30),ProductId VARCHAR(30),PurchaseDate DATE, ExpiryDate DATE, CancellationDate DATE, Status VARCHAR(30),Premium INT, MembersCovered INT,FOREIGN KEY (ProductId) REFERENCES product(ProductId),primary key(CustomerId,PolicyId));
INSERT INTO policy(CustomerId, PolicyId, ProductId, PurchaseDate, ExpiryDate, CancellationDate, Status, Premium, MembersCovered)
VALUES
  (1011123, 'POL1001001', 'PRD01', '2023-01-01', '2023-12-31', '2022-03-30', 'Cancelled', 10000, 2),
  (1011124, 'POL1001002', 'PRD01', '2022-01-03', '2023-01-02', '2022-01-25', 'Cancelled', 17000, 3),
  (1011125, 'POL1001003', 'PRD01', '2022-02-10', '2023-02-09', NULL, 'Expired', 20000, 3),
  (1011126, 'POL1001004', 'PRD02', '2022-03-27', '2023-03-26', '2022-09-14', 'Cancelled', 15000, 3),
  (1011127, 'POL1001005', 'PRD02', '2022-04-15', '2023-04-14', NULL, 'Expired', 12500, 2),
  (1011128, 'POL1001006', 'PRD02', '2022-05-25', '2023-05-24', NULL, 'Active', 13700, 2),
  (1011129, 'POL1001007', 'PRD02', '2022-05-30', '2023-05-29', NULL, 'Active', 9800, 1),
  (1011130, 'POL1001008', 'PRD03', '2022-06-11', '2023-06-10', NULL, 'Active', 5000, 1),
  (1011131, 'POL1001009', 'PRD04', '2021-12-21', '2022-12-20', NULL, 'Expired', 4700, 1),
  (1011132, 'POL1001010', 'PRD04', '2021-06-25', '2023-06-24', '2022-06-30', 'Cancelled', 6600, 2);
create table claim( ClaimId INT primary key,CustomerId INT,PolicyId VARCHAR(30),ProductId VARCHAR(30) ,ClaimDate date,ClaimApprovedDate date, ClaimStatus VARCHAR(30),ClaimSource VARCHAR(30),ClaimAmount INT,FOREIGN KEY (CustomerId,PolicyId) REFERENCES policy(CustomerId,PolicyId));
INSERT INTO claim(ClaimId, CustomerId,PolicyId, ProductId, ClaimDate, ClaimApprovedDate, ClaimStatus, ClaimSource, ClaimAmount)
VALUES
  (2021331, 1011123, 'POL1001001', 'PRD01', '2022-02-02', '2022-02-10', 'Approved', 'MobileApp', 3000),
  (2021332, 1011125, 'POL1001003', 'PRD01', '2022-12-17', '2022-12-21', 'Approved', 'MobileApp', 2500),
  (2021333, 1011125, 'POL1001003', 'PRD01', '2022-12-28', NULL, 'Rejected', 'MobileApp', 4800),
  (2021334, 1011125, 'POL1001003', 'PRD01', '2023-01-15', '2023-01-19', 'Approved', 'MobileApp', 7200),
  (2021335, 1011127, 'POL1001005', 'PRD02', '2022-08-02', '2022-08-06', 'Approved', 'Website', 2370),
  (2021336, 1011127, 'POL1001005', 'PRD02', '2022-12-15', '2022-12-20', 'Approved', 'Website', 5400),
  (2021337, 1011128, 'POL1001006', 'PRD02', '2022-10-03', NULL, 'Rejected', 'Website', 3600),
  (2021338, 1011128, 'POL1001006', 'PRD02', '2022-11-20', '2022-11-22', 'Approved', 'Website', 6900),
  (2021339, 1011130, 'POL1001008', 'PRD03', '2022-10-06', '2022-10-14', 'Approved', 'MobileApp', 1500),
  (2021340, 1011131, 'POL1001009', 'PRD04', '2022-04-13', '2022-04-15', 'Approved', 'Website', 3200);



