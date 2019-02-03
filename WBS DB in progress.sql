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
	Event_date		DATE	
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
	Timer_Data			TIME(7)									,
	Pair_ID				INT			NOT NULL					,
	Event_ID			INT			NOT NULL					,
	PRIMARY KEY(Rider_Event_ID)
	INDEX Pair_ID(Pair_ID)
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
	PRIMARY KEY(Sheet_ID)
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

INSERT INTO Events (Event_ID, Event_Name, Event_Type, Event_location,  Event_date)
(1, 'Fri Poles', 'Poles', 'Waynesburg', '2019-04-01 11:12:59')	,
(2, 'Open 4D', 'Open 4D', 'Ohio', '2019-05-02 11:25:59')		;

INSERT INTO Rider_Horse_Combination (Pair_ID,Rider_Id, Horse_ID) VALUES
(1, 1, 1)						,
(2, 2, 2)						,
(3, 4, 5)						,
(4, 3, 4)						,
(5, 5, 7)						,
(6, 7, 3)						,
(7, 6, 6)						,
(7, 7, 7)						,
(8, 10, 9)						,
(9, 8, 10)						,
(10, 9, 8)						;
