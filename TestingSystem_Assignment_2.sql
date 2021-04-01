-- drop database if exists 
DROP DATABASE IF EXISTS 		TestingSystem;
CREATE DATABASE IF NOT EXISTS 			TestingSystem;
USE TestingSystem;

-- quesiton 1 : dinh danh phong ban --
DROP TABLE IF EXISTS		Department;
CREATE TABLE 				Department (
    DepartmentID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	DepartmentName 			VARCHAR(50) NOT NULL
);

-- quesiton 2 : dinh danh chuc vu  -- 
DROP TABLE IF EXISTS 		`position`;
 CREATE TABLE  				`Position` (
	PositionID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName			VARCHAR(50) NOT NULL 
);


DROP TABLE IF EXISTS 		`Account`;
 CREATE TABLE  				`Account`(
	AccountID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Email					VARCHAR(50) NOT NULL,
	Username				VARCHAR(50), NOT NULL UNIQUE KEY 
	Fullname				VARCHAR(50), NOT NULL
	DepartmentID			TINYINT  , NOT NULL
	PositionID				TINYINT,
	CreateDate          	DATETIME,
    FOREIGN KEY ( DepartmentID ) REFERENCES Department (DepartmentID), 
    FOREIGN KEY ( PositionID  )  REFERENCES Position (PositionID )
);

--TRA LOI BAI 4--
DROP TABLE IF EXISTS 		`Group`;
CREATE TABLE   				`Group`(
	GroupID					TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	GroupName 				VARCHAR(50) NOT NULL UNIQUE KEY ,
	CreatorID				TINYINT,
	CreateDate         	 	DATETIME
);

--TRA LOI BAI 5--
DROP TABLE IF EXISTS 		GroupAccount;
CREATE TABLE  				 GroupAccount(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT,
	AccountID				TINYINT,
	JoinDate				DATE
	FOREIGN KEY ( GroupID) REFERENCES `Group` (GroupID)
    FOREIGN KEY (AccountID) REFERENCES `Account` (`AccountID`)
    PRIMARY (  `Group`,`Account` )
); 

--tra loi bai 6 --
DROP TABLE IF EXISTS 		TypeQuestion
 CREATE TABLE  				TypeQuestion(
	TypeID					SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	TypeName 				VARCHAR(50) NOT NULL
);

--tra loi bai 7 --
 DROP TABLE IF EXISTS  		CategoryQuestion;
CREATE TABLE 				CategoryQuestion(
	CategoryID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	CategoryName 			VARCHAR(50) NOT NULL
);  

--tra loi bai 8--
DROP TABLE IF EXISTS        Question;
 CREATE TABLE  				Question(
	QuestionID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	Content					VARCHAR(50) NOT NULL ,
	CategoryID				TINYINT NOT NULL,
	TypeID					TINYINT NOT NULL, 
	CreatorID				TINYINT NOT NULL,
	CreateDate 		   	 	DATE,
    FOREIGN KEY ( CategoryID) REFERENCES  Category ( CategoryID),
    FOREIGN KEY ( TypeID ) REFERENCES  TypeQuestion (TypeID ) ,
    FOREIGN KEY (CreatorID)  REFERENCES `Group` (CreatorID) 
);

-- tra loi bai 9
DROP TABLE IF EXISTS        Answer;
 CREATE TABLE  				Answer(
	AnswerID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content					VARCHAR(50) NOT NULL,
	QuestionID				TINYINT NOT NULL,
	IsCorrect				VARCHAR(50) NOT NULL,
     FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
   
   -- tra loi bai 9--
DROP TABLE IF EXISTS 		Exam;
CREATE TABLE   				Exam(
	ExamID			    	SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Code`					SMALLINT NOT NULL,
	Title       			VARCHAR(100) NOT NULL,
	CategoryID				SMALLINT NOT NULL,
    Duration            	VARCHAR(50) NOT NULL,
	CreatorID				SMALLINT NOT NULL ,
	CreateDate 		    	DATE,
    FOREIGN KEY (CategoryID)REFERENCES Category(CategoryID)  
);    

--tra loi bai 10--
DROP TABLE IF EXISTS 		ExamQuestion;
CREATE TABLE  				ExamQuestion(
	ExamID			    	TINYINT UNSIGNED AUTO_INCREMENT,
	QuestionID				TINYINT NOT NULL,
    PRIMARY KEY ( Exam ,Question ),
    FOREIGN KEY  ( ExamID ) REFERENCES Exam ( ExamID),
	FOREIGN KEY (QuestionID	) REFERENCES Question(QuestionID) );
    