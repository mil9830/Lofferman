-- Selects all Riders First and last names from the Rider Category and Renames them--
SELECT Rider_F_name AS 'First Name', Rider_L_name AS 'Last Name'
FROM Rider;

--Displays the pairings by Pair id, Riders Name, and Horse's Name--

SELECT Rider_F_Name AS 'First Name', Rider_L_Name AS 'Last Name', Horse_Name AS 'Horse Name'
FROM 
Rider_Horse_Combination,
Rider,
horse
WHERE Rider.Rider_ID = Rider_horse_combination.Rider_ID AND horse.Horse_ID=Rider_horse_combination.Horse_ID

--queries all riders ordered by highest points, needs to be arranged for specific events--
SELECT Rider_F_Name, Rider_L_Name, Horse_Name, Rider_Horse_Points, Timer_Data
FROM 
Rider_Horse_Combination,
Rider,
horse,
Events,
Rider_Events
WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND Events.Event_ID = Rider_Events.Event_ID
AND rider_horse_combination.Pair_ID= rider_events.Pair_ID
ORDER BY Rider_Horse_Points DESC

--Table 1 successfully queued and ordered--
SELECT Rider_F_Name AS 'First Name', Rider_L_Name AS 'Last Name',
 Horse_Name AS 'Horse Name', Rider_Horse_Points AS 'Points', Timer_Data AS 'Last Race'
FROM 
Rider_Horse_Combination,
Rider,
horse,
Events,
Rider_Events
WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND Events.Event_ID = Rider_Events.Event_ID
AND rider_horse_combination.Pair_ID= rider_events.Pair_ID
AND Rider_Events.Event_ID = 1
ORDER BY Rider_Horse_Points DESC

--Table 2 successfully queued and ordered--
SELECT Rider_F_Name AS 'First Name', Rider_L_Name AS 'Last Name',
 Horse_Name AS 'Horse Name', Rider_Horse_Points AS 'Points', Timer_Data AS 'Last Race'
FROM 
Rider_Horse_Combination,
Rider,
horse,
Events,
Rider_Events
WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND Events.Event_ID = Rider_Events.Event_ID
AND rider_horse_combination.Pair_ID= rider_events.Pair_ID
AND Rider_Events.Event_ID = 2
ORDER BY Rider_Horse_Points DESC

--Table 3 Successfully queued and ordered--
SELECT Rider_F_Name AS 'First Name', Rider_L_Name AS 'Last Name',
 Horse_Name AS 'Horse Name', Rider_Horse_Points AS 'Points', Timer_Data AS 'Last Race'
FROM 
Rider_Horse_Combination,
Rider,
horse,
Events,
Rider_Events
WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND Events.Event_ID = Rider_Events.Event_ID
AND rider_horse_combination.Pair_ID= rider_events.Pair_ID
AND Rider_Events.Event_ID = 3
ORDER BY Rider_Horse_Points DESC

--Insert a new rider named Robert Wheeler, change the Values 'Wheeler' and 'Robert' to insert a new user--
INSERT INTO Rider (Rider_ID, Rider_L_Name, Rider_F_Name) VALUES ('Wheeler', 'Robert')

--Insert a new horse named unicorn--
INSERT INTO Horse (Horse_Name) VALUES ("Unicorn")

--Create an Event--
INSERT INTO EVENTS (Event_name, Event_Type, Event_Location, Event_Date) VALUES ('Time Trials', 'Timed laps', 'Outer Space', '2019-02-23 08:11:21');

/* Create a pairing of a rider and a horse, this combination is used to keep track of the points earned in races. 
The points are tied to the combination of rider/horse rather than just one. Attached the desired rider id to the desired horse id. */
INSERT INTO Rider_Horse_Combination (Rider_Id, Horse_ID) VALUES (11, 11);

--Master Sheet Creation--
SELECT Rider_L_Name, Rider_F_Name, Horse_name, Exhibition_Cost, Grounds_Fee, Stall_Cost, Amount_hookups, Total_Due, Deduction, Balance_Due

FROM Rider, Horse, rider_horse_combination, master_sheet

WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND rider_horse_combination.Pair_ID= master_sheet.Pair_ID

--Master Sheet for a single user--
SELECT Rider_L_Name, Rider_F_Name, Horse_name, Exhibition_Cost, Grounds_Fee, Stall_Cost, Amount_hookups, Total_Due, Deduction, Balance_Due

FROM Rider, Horse, rider_horse_combination, master_sheet

WHERE rider.Rider_ID = rider_horse_combination.Rider_ID AND horse.Horse_ID=rider_horse_combination.Horse_ID 
AND rider_horse_combination.Pair_ID= master_sheet.Pair_ID
AND master_sheet.Pair_ID = 1