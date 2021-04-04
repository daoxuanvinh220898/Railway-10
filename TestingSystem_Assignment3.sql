-- drop database if exists 
DROP DATABASE IF EXISTS 		TestingSystem;
CREATE DATABASE IF NOT EXISTS 			TestingSystem;
-- USE TestingSystem;
use testing_system_assignment_1;

-- quesiton 1 : dinh danh phong ban --
ALTER table department 
CHANGE COLUMN departmentID departmentID TINYINT PRIMARY KEY AUTO_INCREMENT; 


CREATE TABLE IF NOT EXISTS			Department (
    DepartmentID 			TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	DepartmentName 			VARCHAR(50) NOT NULL UNIQUE KEY 
);


 -- add data department 
 INSERT INTO Department (  DepartmentName )
 VALUES                 (  'PHONG Marketing' ),
						(  'PHONG Sale ' ),
						(   'PHONG Bảo Vệ ' ),
						(  'PHONG  Nhân  Sự ' ),
						(  'PHONG Kỹ Thuật  ' ),
						( 'PHONG  Tài Chính ' ),
						( 'PHONG  Phó Giám Đốc ' );
                        
                        
                        
                        
                        
-- quesiton 2 : dinh danh chuc vu  -- 
DROP TABLE IF EXISTS 		`position`;
 CREATE TABLE  IF NOT EXISTS				`Position` (
	PositionID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName			VARCHAR(50) NOT NULL UNIQUE KEY 
);

-- add data 'position'
INSERT INTO Position  ( positionName ) 
VALUES         		('DEV'),
					('TEST'),
                    ('SCRUM MASTER ' ),
                    ('PM' ) ;
                    
                    

-- quesition 3 : dinh danh cua khach hang --
DROP TABLE IF EXISTS 		`Account`;
 CREATE TABLE IF NOT EXISTS 				`Account`(
	AccountID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Email					VARCHAR(50) NOT NULL UNIQUE KEY ,
	Username				VARCHAR(50) NOT NULL UNIQUE KEY ,
	Fullname				VARCHAR(50 )NOT NULL UNIQUE KEY ,
	DepartmentID			TINYINT UNSIGNED NOT NULL  ,
	PositionID				TINYINT UNSIGNED,
	CreateDate          	DATE NOT NULL ,
    FOREIGN KEY ( DepartmentID ) REFERENCES Department (DepartmentID), 
    FOREIGN KEY ( PositionID  )  REFERENCES Position (PositionID )
);


-- add data account 
INSERT INTO  `account` (Email		 					,	username , 			Fullname , 			departmentID , 			positionID , 			CreateDate)
VALUES					('haidang29productions@gmail.com'   ,'dangblack'     ,'Nguyễn hải Đăng'	 ,   '0'			,       '1'        ,           '2020-03-05'),
						( 'account1@gmail.com'				,'quanganh'		,'Nguyen Chien Thang'	, '1' 			,       '2'       ,            '2020-03-05'),
						('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                        ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                       ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
                       ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                       ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, '2020-08-08'	),
                       ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                      ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                        ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');




-- quesition 4 : dinh danh cua nhom --
DROP TABLE IF EXISTS 		`Group`;
CREATE TABLE  IF NOT EXISTS 				`Group`(
	GroupID					TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	GroupName 				VARCHAR(50) NOT NULL UNIQUE KEY ,
	CreatorID				TINYINT NOT NULL ,
	CreateDate         	 	DATETIME  DEFAULT now()
);
-- add data group 
INSERT INTO 	`group`	(Groupname ,           CreatorID ,             CreateDate         )
VALUES      		('Testing System'		,   5			,'2019-03-05'),
					('Development'			,   1			,'2020-03-07'),
                    ('VTI Sale 01'			,   2			,'2020-03-09'),
                    ('VTI Sale 02'			,   3			,'2020-03-10'),
                    ('VTI Sale 03'			,   4			,'2020-03-28'),
                    ('VTI Creator'			,   6			,'2020-04-06'),
                    ('VTI Marketing 01'		,   7			,'2020-04-07'),
                    ('Management'			,   8			,'2020-04-08'),
                    ('Chat with love'		,   9			,'2020-04-09'),
                    ('Vi Ti Ai'			    ,   10			,'2020-04-10');


-- quesition 5 : dinh danh nhom khach hang su dung --
DROP TABLE IF EXISTS 		GroupAccount;
CREATE TABLE IF NOT EXISTS 				 GroupAccount(
	GroupID					TINYINT UNSIGNED,
	AccountID				TINYINT UNSIGNED,
	JoinDate				DATE DEFAULT now() ,
	FOREIGN KEY ( GroupID) REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account` (`AccountID`),
    PRIMARY key  ( GroupID , AccountID)
); 


-- add data GroupAccount
INSERT INTO GroupAccount (GroupID ,       AccountID,       JoinDate    )
VALUES                      ( 1		,    	 1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- quesition  6 : dinh danh loai cau hoi --
DROP TABLE IF EXISTS 		TypeQuestion;
 CREATE TABLE IF NOT EXISTS 				TypeQuestion(
	TypeID					SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	TypeName 				VARCHAR(50) NOT NULL
);


-- add data TypeQuestion
INSERT INTO TypeQuestion (Typename)
VALUES                    ('Essay'),
                          ('Multiple-Choice');


-- quesition 7  : dinh danh cua chu de cau hoi --
 DROP TABLE IF EXISTS  		CategoryQuestion;
CREATE TABLE IF NOT EXISTS 				CategoryQuestion(
	CategoryID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	CategoryName 			VARCHAR(50) NOT NULL
);  

-- add data CategoryQuestion
INSERT INTO  CategoryQuestion (CategoryName )
VALUES						  ('java'),
							  ('ASP.NET'),
							  ('ADO.NET'),
						      ('Postman'),
						      ('Ruby'),
					          ('Python'),
						      ('C++'),
						      ('C Sharp');

-- quesition 8 : dinh danh cua cau hoi --
DROP TABLE IF EXISTS        Question;
 CREATE TABLE IF NOT EXISTS  				Question(
	QuestionID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	Content					VARCHAR(50) NOT NULL  UNIQUE KEY ,
	CategoryID				TINYINT UNSIGNED NOT NULL, 
	TypeID					SMALLINT UNSIGNED NOT NULL, 
	CreatorID				TINYINT UNSIGNED NOT NULL,
	CreateDate 		   	 	DATE NOT NULL DEFAULT now() ,
    FOREIGN KEY ( CategoryID) REFERENCES  CategoryQuestion ( CategoryID),
    FOREIGN KEY ( TypeID ) REFERENCES  TypeQuestion (TypeID ) ,
    FOREIGN KEY (CreatorID)  REFERENCES `Account` (AccountID) 
);

-- add data quesition 


-- quesiton 9 : dinh danh cua cau tra loi -- 
DROP TABLE IF EXISTS        Answer;
 CREATE TABLE IF NOT EXISTS  				Answer(
	AnswerID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content					VARCHAR(50) NOT NULL unique key ,
	QuestionID				TINYINT UNSIGNED NOT NULL,
	IsCorrect				VARCHAR(50) NOT NULL unique key ,
     FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
   
   -- quesiiton 10 : dinh danh cua de thi --
DROP TABLE IF EXISTS 		Exam;
CREATE TABLE IF NOT EXISTS   				Exam(
	ExamID			    	TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Code`					SMALLINT NOT NULL unique key ,
	Title       			VARCHAR(100) NOT NULL,
	CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration            	TINYINT UNSIGNED NOT NULL,
	CreatorID				TINYINT UNSIGNED NOT NULL ,
	CreateDate 		    	DATE DEFAULT now() ,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ,
    FOREIGN KEY (CreatorID)  REFERENCES `Account` (AccountID) 
);    

-- question 11--
DROP TABLE IF EXISTS 		ExamQuestion;
CREATE TABLE  IF NOT EXISTS 				ExamQuestion(
	ExamID			    	TINYINT UNSIGNED AUTO_INCREMENT,
	QuestionID				TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY ( ExamID , QuestionID ),
    FOREIGN KEY  ( ExamID ) REFERENCES Exam ( ExamID),
	FOREIGN KEY (QuestionID	) REFERENCES Question(QuestionID) 
 );   
 
 
 
 
 
 
 
 