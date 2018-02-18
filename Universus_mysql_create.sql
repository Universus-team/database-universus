CREATE TABLE `StudentToGroup` (
	`ID` int NOT NULL AUTO_INCREMENT,
	`GroupID` int NOT NULL,
	`accountID` int NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `StudentGroup` (
	`ID` int NOT NULL AUTO_INCREMENT,
	`StudentGroupName` varchar(25) NOT NULL,
	`CreatedDate` DATE NOT NULL,
	`DepartmentID` int NOT NULL,
	`TutorID` bigint NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `University` (
	`ID` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL UNIQUE,
	`Address` varchar(255) NOT NULL,
	`Web_Address` varchar(255) NOT NULL,
	`Email` varchar(254) NOT NULL,
	`hasStateAccreditation` bool NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Exam` (
	`ID` int NOT NULL AUTO_INCREMENT,
	`AuthorId` int NOT NULL,
	`Title` varchar(50) NOT NULL,
	`Description` mediumtext NOT NULL,
	`countOfQuestion` int NOT NULL,
	`content` longtext NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `ExamHistory` (
	`ID` bigint NOT NULL AUTO_INCREMENT,
	`StudentID` bigint NOT NULL,
	`DateOfExam` DATETIME NOT NULL,
	`Deadline` DATETIME NOT NULL,
	`passingScore` FLOAT NOT NULL,
	`ExanStatusId` int NOT NULL,
	`SubjectId` int NOT NULL,
	`Result` FLOAT NOT NULL,
	`TestID` bigint NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Department` (
	`ID` bigint NOT NULL AUTO_INCREMENT,
	`Name` varchar(255) NOT NULL,
	`UniversityID` bigint NOT NULL,
	`Email` varchar(254) NOT NULL,
	`PhoneNumber` varchar(15) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Account` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar NOT NULL AUTO_INCREMENT,
	`passwordMD5` varchar(32) NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`surname` varchar NOT NULL,
	`patronymic` varchar NOT NULL,
	`email` varchar(254) NOT NULL,
	`phoneNumber` varchar(15),
	`roleID` varchar(254) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Role` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(30) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ExamStatus` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(30) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Message` (
	`id` int NOT NULL AUTO_INCREMENT,
	`content` TEXT NOT NULL,
	`toUserId` int NOT NULL,
	`fromUserId` int NOT NULL,
	`dateOfMessage` DATETIME NOT NULL,
	`isRead` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Subject` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL AUTO_INCREMENT,
	`TeacherId` int NOT NULL,
	`createdDate` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `SubjectToStudentGroup` (
	`id` int NOT NULL AUTO_INCREMENT,
	`subjectId` int NOT NULL AUTO_INCREMENT,
	`studentGroupId` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `TeacherToDepartment` (
	`id` int NOT NULL,
	`department_id` int NOT NULL,
	`teacher_id` int NOT NULL
);

ALTER TABLE `StudentToGroup` ADD CONSTRAINT `StudentToGroup_fk0` FOREIGN KEY (`GroupID`) REFERENCES `StudentGroup`(`ID`);

ALTER TABLE `StudentToGroup` ADD CONSTRAINT `StudentToGroup_fk1` FOREIGN KEY (`accountID`) REFERENCES `Account`(`id`);

ALTER TABLE `StudentGroup` ADD CONSTRAINT `StudentGroup_fk0` FOREIGN KEY (`DepartmentID`) REFERENCES `Department`(`ID`);

ALTER TABLE `StudentGroup` ADD CONSTRAINT `StudentGroup_fk1` FOREIGN KEY (`TutorID`) REFERENCES `Account`(`id`);

ALTER TABLE `Exam` ADD CONSTRAINT `Exam_fk0` FOREIGN KEY (`AuthorId`) REFERENCES `Account`(`id`);

ALTER TABLE `ExamHistory` ADD CONSTRAINT `ExamHistory_fk0` FOREIGN KEY (`StudentID`) REFERENCES `Account`(`id`);

ALTER TABLE `ExamHistory` ADD CONSTRAINT `ExamHistory_fk1` FOREIGN KEY (`ExanStatusId`) REFERENCES `ExamStatus`(`id`);

ALTER TABLE `ExamHistory` ADD CONSTRAINT `ExamHistory_fk2` FOREIGN KEY (`SubjectId`) REFERENCES `Subject`(`id`);

ALTER TABLE `ExamHistory` ADD CONSTRAINT `ExamHistory_fk3` FOREIGN KEY (`TestID`) REFERENCES `Exam`(`ID`);

ALTER TABLE `Department` ADD CONSTRAINT `Department_fk0` FOREIGN KEY (`UniversityID`) REFERENCES `University`(`ID`);

ALTER TABLE `Account` ADD CONSTRAINT `Account_fk0` FOREIGN KEY (`roleID`) REFERENCES `Role`(`id`);

ALTER TABLE `Message` ADD CONSTRAINT `Message_fk0` FOREIGN KEY (`toUserId`) REFERENCES `Account`(`id`);

ALTER TABLE `Message` ADD CONSTRAINT `Message_fk1` FOREIGN KEY (`fromUserId`) REFERENCES `Account`(`id`);

ALTER TABLE `Subject` ADD CONSTRAINT `Subject_fk0` FOREIGN KEY (`TeacherId`) REFERENCES `Account`(`id`);

ALTER TABLE `SubjectToStudentGroup` ADD CONSTRAINT `SubjectToStudentGroup_fk0` FOREIGN KEY (`subjectId`) REFERENCES `Subject`(`id`);

ALTER TABLE `SubjectToStudentGroup` ADD CONSTRAINT `SubjectToStudentGroup_fk1` FOREIGN KEY (`studentGroupId`) REFERENCES `StudentGroup`(`ID`);

ALTER TABLE `TeacherToDepartment` ADD CONSTRAINT `TeacherToDepartment_fk0` FOREIGN KEY (`department_id`) REFERENCES `Department`(`ID`);

ALTER TABLE `TeacherToDepartment` ADD CONSTRAINT `TeacherToDepartment_fk1` FOREIGN KEY (`teacher_id`) REFERENCES `Account`(`id`);

