DROP DATABASE IF EXISTS WBSdb	;
CREATE DATABASE WBSdb			;
USE WBSdb;

CREATE TABLE Rider	
(
	Rider_ID		INT(20)			NOT NULL	AUTO_INCREMENT	,
	Rider_L_Name	VARCHAR(15)		NOT NULL					,
	Rider_F_Name	VARCHAR(15)		NOT NULL					,
	PRIMARY KEY (Rider_ID)
);

CREATE TABLE Horse	
(
	Horse_ID		INT(20)			NOT NULL	AUTO_INCREMENT	,
	Horse_Name		VARCHAR(30)		NOT NULL					,
	PRIMARY KEY (Horse_ID)
);

CREATE TABLE Events
(
	Event_ID		INT(20)			NOT NULL	AUTO_INCREMENT	,
	Event_Name		VARCHAR(20)									,
	Event_Type		VARCHAR(20)									,
	Event_location	VARCHAR(20)									,
	Event_date		DATETIME DEFAULT NULL										,
	PRIMARY KEY (Event_ID)
);

CREATE TABLE Rider_Horse_Combination
(

	Pair_ID			INT(20)			NOT NULL	AUTO_INCREMENT	,
	Rider_ID		INT				NOT NULL					,
	Horse_ID		INT				NOT NULL					,
	PRIMARY KEY(Pair_ID)										,
	INDEX	Rider_ID(Rider_ID)									,
	INDEX	Horse_ID(Horse_ID)
);

CREATE TABLE Rider_Events
(
	Rider_Event_ID		INT(20)		NOT NULL	AUTO_INCREMENT	,
	Rider_Horse_Points	INT(100)								,
	Timer_Data			TIME(6)									,
	Pair_ID				INT			NOT NULL					,
	Event_ID			INT			NOT NULL					,
	PRIMARY KEY(Rider_Event_ID)									,
	INDEX Pair_ID(Pair_ID)										,
	INDEX Event_ID(Event_ID)
);

CREATE TABLE Master_Sheet
(
	Sheet_ID			INT(20)		NOT NULL	AUTO_INCREMENT	,
	Exhibition_Cost		DECIMAL(4,2)							,
	Grounds_Fee			DECIMAL(4,2)							,
	Stall_Cost			DECIMAL(4,2)							,
	Amount_Hookups		DECIMAL(4,2)							,
	Total_Due			DECIMAL(4,2)							,
	Deduction			DECIMAL(4,2)							,
	Balance_Due			DECIMAL(4,2)							,
	Pair_ID				INT										,
	PRIMARY KEY(Sheet_ID)										,
	INDEX(Pair_ID)
);

INSERT INTO Rider (Rider_ID, Rider_L_Name, Rider_F_Name) VALUES
(1, 'Mercedes', 'Fertig')	,
(2, 'Mohn', 'Kelley')		,
(3, 'Sherman', 'Rich')		,
(4, 'Clemons', 'Megan')		,
(5, 'MuCullough', 'Patti')	,
(6, 'MuCullough', 'Shayla')	,
(7, 'Ames', 'Harley')		,
(8,	'Dempsey', 'Cassie')	,
(9,	'Jorgenson', 'Billi Jo'),
(10, 'Sacconi', 'Samantha')	;

INSERT INTO Horse (Horse_ID, Horse_Name) VALUES
(1, 'Badgers  Twisted   Tyme')	,
(2, 'Blaster')					,
(3, 'Cassidy')					,
(4, 'JD Driften Georgia')		,
(5, 'JJ Albert the Great')		,
(6, 'GiGi')						,
(7, 'Cajun')					,
(8, 'Yeller Jack')				,
(9, 'Romeos Tax Refund')		,
(10, 'Drifter')					;

INSERT INTO Events (Event_ID, Event_Name, Event_Type, Event_location,  Event_date) VALUES
(1, 'Fri Poles', 'Poles', 'Waynesburg', '2019-04-01 11:39:03')	,
(2, 'Open 4D', 'Open 4D', 'Ohio', '2019-05-02 11:30:03')		;

INSERT INTO Rider_Horse_Combination (Pair_ID,Rider_Id, Horse_ID) VALUES
(1, 1, 1)						,
(2, 2, 2)						,
(3, 4, 5)						,
(4, 3, 4)						,
(5, 5, 7)						,
(6, 7, 3)						,
(7, 6, 6)						,
(8, 10, 9)						,
(9, 8, 10)						,
(10, 9, 8)						;

INSERT INTO Rider_Events (Rider_Event_ID, Rider_Horse_Points, Timer_Data, Pair_ID, Event_ID) VALUES

(1, '20', '1:00', 1, 1)			,
(2, '23', '0:56', 2, 2)			,-
(3, '14', '0:59', 3, 2)			,
(4, '12', '1:02', 4, 1)			,
(5, '17', '1:17', 5, 1)			,
(6, '14', '1:29', 6, 1)			,
(7, '12', '1:21', 7, 2)			,
(8, '16', '1:34', 8, 1)			,
(9, '8', '1:02', 9, 2)			,
(10, '27', '1:05', 10, 2)		;

INSERT INTO Master_Sheet (Sheet_ID, Exhibition_Cost, Grounds_Fee, Stall_Cost, Amount_Hookups, Total_Due, Deduction, Balance_Due, Pair_ID) VALUES
(1, '25.00', '15.00', '20.00', '10.00', '70.00', '20.00', '50.00', 1)		,
(2, '10.00', '10.00', '20.00', '0.00', '40.00', '0.00', '40.00', 2)		,
(3, '10.00', '10.00', '20.00', '10.00', '50.00', '10.00', '40.00', 3)		,
(4, '25.00', '15.00', '20.00', '10.00', '70.00', '20.00', '50.00', 4)		,
(5, '25.00', '15.00', '20.00', '10.00', '70.00', '20.00', '50.00', 5)		,
(6, '25.00', '15.00', '20.00', '10.00', '70.00', '20.00', '50.00', 6)		,
(7, '10.00', '10.00', '20.00', '10.00', '50.00', '10.00', '40.00', 7)		,
(8, '25.00', '15.00', '20.00', '10.00', '70.00', '20.00', '50.00', 8)		,
(9, '10.00', '15.00', '20.00', '10.00', '55.00', '20.00', '35.00', 9)		,
(10, '10.00', '15.00', '20.00', '10.00', '70.00', '20.00', '35.00', 10)		;


GRANT SELECT, INSERT, DELETE, UPDATE
ON WBSdb
TO mgs_user@localhost
IDENTIFIED BY 'pa55word';

GRANT SELECT
ON products
TO mgs_tester@localhost
IDENTIFIED BY 'pa55word';
