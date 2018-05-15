/*
Bazaar Schema
======================================================================
Merchant (MerchantID [P], LastName, FirstName)
Permit (MerchantID [P], PermitType [P], PermitInformation, Expiration)
BusinessType (BusinessType [P], PermitRequired)
Business (BusinessID [P], BusinessName, BusinessType, MerchantID)
Lot (LotNumber [P], SquareFt, DailyFee, Electricity)
Reservation (ReservationID [P], LotNumber, ReservationDate, BusinessID)
*/

/*
=======================================================================
For the first five questions you may not use NATURAL JOIN in either Relational Algebra or SQL
=======================================================================
*/

-----------------------------------------------------------------------
/*
Find all businesses who reserved a lot with more than 490 SquareFt and No Electricity.  Display BusinessName, LotNumber, SquareFt, ReservationDate, and DailyFee.

You should have 117 tuples that satisfy this query.
*/

SELECT Table1.BusinessName,Table1.SquareFt,Table1.LotNumber,Table1.DailyFee,Table1.ReservationDate 
FROM (SELECT DISTINCT  Table2.BusinessName,Table2.ReservationDate,l.SquareFt,l.LotNumber,l.DailyFee,l.Electricity 
FROM  cs85_assignment2_lot l 
CROSS JOIN 
(SELECT b.BusinessName,r.ReservationDate,r.LotNumber FROM cs85_assignment2_business b 
CROSS JOIN 
cs85_assignment2_reservation r WHERE b.BusinessID = r.BusinessID) as Table2
WHERE Table2.LotNumber = l.LotNumber) as Table1 
WHERE Table1.SquareFt > 490 
AND Table1.Electricity = FALSE;


-----------------------------------------------------------------------
/*
Find all Merchants that have a business of type "Packaged Food Vendor"  Display MerchantID, BusinessName, LastName, and FirstName.

You should have 50 tuples that satisfy this query.
*/

SELECT b.BusinessName,m.MerchantID,m.LastName,m.FirstName 
FROM cs85_assignment2_merchant m 
CROSS JOIN 
cs85_assignment2_business b 
WHERE b.BusinessType = "Packaged Food Vendor" 
AND b.MerchantID = m.MerchantID;

-----------------------------------------------------------------------
/*
Find the owner of all valid (not expired) permits as of 2014.  Display LastName, FirstName, PermitType, Expiration, and PermitInformation.

You should have 24 tuples that satisfy this query.
*/
 SELECT m.FirstName,m.LastName,p.PermitType,p.PermitInformation,p.Expiration
 FROM  cs85_assignment2_merchant m 
 CROSS JOIN 
 cs85_assignment2_permit p
 WHERE YEAR(p.Expiration) >= 2014 
 AND p.MerchantID = m.MerchantID;
 
-----------------------------------------------------------------------

/*
Find out which merchants booked a reservation for July 4th, 2013.  Show FirstName, LastName, BusinessName, and BusinessType.

You should have 4 tuples that satisfy this query.
*/

SELECT m.FirstName,m.LastName,b.BusinessType,b.BusinessName
FROM  cs85_assignment2_business b 
CROSS JOIN 
cs85_assignment2_merchant m 
CROSS JOIN 
cs85_assignment2_reservation r
WHERE b.BusinessID = r.BusinessID
AND m.MerchantID = b.MerchantID
AND DAY(r.ReservationDate) = 04 
AND MONTH(r.ReservationDate) = 7
AND YEAR(r.ReservationDate) = 2013;

-----------------------------------------------------------------------
/*
Find all businesses that do not need a permit.  Display BusinessName and BusinessType. 

You should have 1353 tuples that satisfy this query.
*/

SELECT b.BusinessName,bt.BusinessType 
FROM cs85_assignment2_business b 
CROSS JOIN 
cs85_assignment2_businesstype bt
WHERE b.BusinessType=bt.BusinessType 
AND bt.PermitRequired="None";

/*
=======================================================================
For the rest of the queries, you may use NATURAL JOIN
=======================================================================
*/

/*
Find all Reservations made by "Marion Moon" on lots without electricity.  Display LotNumber, DailyFee, and ReservationDate.

You should have 4 tuples that satisfy this query.
*/

SELECT l.LotNumber,l.DailyFee, Table2 .ReservationDate 
FROM cs85_assignment2_lot l 
NATURAL JOIN 
(SELECT r.LotNumber,r.ReservationDate,Table1.FirstName,Table1.LastName 
FROM 
(SELECT m.FirstName,m.LastName,b.BusinessID 
FROM cs85_assignment2_merchant m 
NATURAL JOIN 
cs85_assignment2_business b ) as Table1 
NATURAL JOIN 
cs85_assignment2_reservation r) as Table2 
WHERE l.Electricity = FALSE 
AND Table2 .FirstName = "Marion" 
AND Table2 .LastName = "Moon";


-----------------------------------------------------------------------
/*
Find all Business that have not made a Reservation for April 2nd 2013.  Display BusinessID, BusinessName, BusinessType.

You should have 1796 tuples that satisfy this query.
*/


SELECT b1.BusinessID,b1.BusinessName,b1.BusinessType 
FROM cs85_assignment2_business b1 
WHERE (b1.BusinessID,b1.BusinessName,b1.BusinessType) 
NOT IN
(SELECT DISTINCT b2.BusinessID,b2.BusinessName,b2.BusinessType 
FROM cs85_assignment2_business b2 
NATURAL JOIN 
cs85_assignment2_reservation r
WHERE r.ReservationDate = '2013-04-02'
);

-----------------------------------------------------------------------
/*
Find all reservations made by Merchant "Kara Boyette" between January 3, 2013 and October 27, 2013.  Display LotNumber, ReservationDate, and DailyFee.

You should have 3 tuples that satisfy this query.
*/
SELECT l.DailyFee,Table2.LotNumber,Table2.ReservationDate 
FROM (SELECT r.ReservationDate,r.LotNumber 
FROM (SELECT b.BusinessID,m.FirstName,m.LastName 
FROM cs85_assignment2_merchant m 
NATURAL JOIN
 cs85_assignment2_business b
WHERE m.FirstName = "Kara" 
AND m.LastName = "Boyette") as Table1 
NATURAL JOIN
cs85_assignment2_reservation r 
WHERE r.ReservationDate >= '2013-1-03' 
AND r.ReservationDate <= '2013-10-27') as Table2
NATURAL JOIN 
cs85_assignment2_lot l;
-----------------------------------------------------------------------
/*
Find all lots that are unreserved for July 9th, 2014.  Display LotNumber, SquareFt, DailyFee, and Electricity.

You should have 496 tuples that satisfy this query.
*/

SELECT DISTINCT l1.DailyFee,l1.Electricity,l1.LotNumber,l1.SquareFt 
FROM cs85_assignment2_lot l1 
WHERE (l1.LotNumber,l1.SquareFt,l1.Electricity,l1.DailyFee) NOT IN 
(SELECT l2.LotNumber,l2.SquareFt,l2.Electricity,l2.DailyFee 
FROM cs85_assignment2_lot l2 
NATURAL JOIN 
cs85_assignment2_reservation r
WHERE  r.ReservationDate = '2014-07-09'
); 

-- 155 163 177 213
-----------------------------------------------------------------------
/*
Difficult!  Find all merchants that have a business that requires a permit, that they do not have.  Display MerchantID, BusinessName, BusinessType and PermitRequired.

You should have 435 tuples that satisfy this query.
*/

:/
