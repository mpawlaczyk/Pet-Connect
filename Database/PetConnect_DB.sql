CREATE TABLE `tUser` (
  `userID` int PRIMARY KEY AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL DEFAULT '',
  `lastName` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `addressID` int DEFAULT 1
);

CREATE TABLE `tAddress` (
  `addressID` int PRIMARY KEY AUTO_INCREMENT,
  `addressNumber` int,
  `stName` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `zip` int
);

CREATE TABLE `tDog` (
  `dogID` int PRIMARY KEY AUTO_INCREMENT,
  `breedID` int,
  `gender` varchar(255),
  `fixed` boolean,
  `age` int NOT NULL,
  `favParkID` int,
  `favToyID` int,
  `Size` varchar(255) NOT NULL,
  `weight` int,
  `bio` varchar(255)
);

CREATE TABLE `tBreed` (
  `breedID` int PRIMARY KEY AUTO_INCREMENT,
  `breed` varchar(255) NOT NULL
);

CREATE TABLE `tOwnership` (
  `ownerID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int
);

CREATE TABLE `tFavoriteToy` (
  `favToyID` int PRIMARY KEY AUTO_INCREMENT,
  `ToyName` varchar(255) NOT NULL
);

CREATE TABLE `tFavoritePark` (
  `favParkID` int PRIMARY KEY AUTO_INCREMENT,
  `parkName` varchar(255) NOT NULL,
  `AddressID` int
);

CREATE TABLE `tAdmin` (
  `adminID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int
);

CREATE TABLE `tFollowers` (
  `followID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int
);

CREATE TABLE `tPosts` (
  `postID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int,
  `Post` varchar(255) NOT NULL,
  `ts` timestamp
);

CREATE TABLE `tComments` (
  `commentID` int PRIMARY KEY AUTO_INCREMENT,
  `postID` int,
  `dogID` int,
  `userID` int,
  `Post` varchar(255) NOT NULL,
  `ts` timestamp
);

CREATE TABLE `tReacts` (
  `reactID` int PRIMARY KEY AUTO_INCREMENT,
  `reactTypeID` int,
  `postID` int
);

CREATE TABLE `tReactTypes` (
  `reactTypeID` int PRIMARY KEY AUTO_INCREMENT,
  `ReactType` varchar(255) NOT NULL
);

CREATE TABLE `tAvailability` (
  `availabilityID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int,
  `Begin_ts` timestamp NULL DEFAULT NULL,
  `End_ts` timestamp NULL DEFAULT NULL
);

CREATE TABLE `tPlayDateTime` (
  `playdateTimeID` int PRIMARY KEY AUTO_INCREMENT,
  `playDateID` int,
  `Begin_ts` timestamp NULL DEFAULT NULL,
  `End_ts` timestamp NULL DEFAULT NULL,
  `AddressID` int
);

CREATE TABLE `tPlayDate` (
  `playDateID` int PRIMARY KEY AUTO_INCREMENT,
  `dogID` int,
  `userID` int
);

CREATE TABLE `tMessage` (
  `messageID` int PRIMARY KEY AUTO_INCREMENT,
  `userTo_ID` int,
  `userFrom_ID` int
);

CREATE TABLE `tInterests` (
  `interestsID` int PRIMARY KEY AUTO_INCREMENT,
  `Interests` varchar(255) NOT NULL,
  `Disinterests` varchar(255) NOT NULL
);

CREATE TABLE `tDogInterests` (
  `DogInterestsID` int PRIMARY KEY AUTO_INCREMENT,
  `interestsID` int,
  `dogID` int
);

ALTER TABLE `tUser` ADD FOREIGN KEY (`addressID`) REFERENCES `tAddress` (`addressID`);

ALTER TABLE `tDog` ADD FOREIGN KEY (`breedID`) REFERENCES `tBreed` (`breedID`);

ALTER TABLE `tDog` ADD FOREIGN KEY (`favParkID`) REFERENCES `tFavoritePark` (`favParkID`);

ALTER TABLE `tDog` ADD FOREIGN KEY (`favToyID`) REFERENCES `tFavoriteToy` (`favToyID`);

ALTER TABLE `tOwnership` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tOwnership` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tFavoritePark` ADD FOREIGN KEY (`AddressID`) REFERENCES `tAddress` (`addressID`);

ALTER TABLE `tAdmin` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tAdmin` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tFollowers` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tFollowers` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tPosts` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tPosts` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tComments` ADD FOREIGN KEY (`postID`) REFERENCES `tPosts` (`postID`);

ALTER TABLE `tComments` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tComments` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tReacts` ADD FOREIGN KEY (`reactTypeID`) REFERENCES `tReactTypes` (`reactTypeID`);

ALTER TABLE `tReacts` ADD FOREIGN KEY (`postID`) REFERENCES `tPosts` (`postID`);

ALTER TABLE `tAvailability` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tAvailability` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tPlayDateTime` ADD FOREIGN KEY (`playDateID`) REFERENCES `tPlayDate` (`playDateID`);

ALTER TABLE `tPlayDateTime` ADD FOREIGN KEY (`AddressID`) REFERENCES `tAddress` (`addressID`);

ALTER TABLE `tPlayDate` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);

ALTER TABLE `tPlayDate` ADD FOREIGN KEY (`userID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tMessage` ADD FOREIGN KEY (`userTo_ID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tMessage` ADD FOREIGN KEY (`userFrom_ID`) REFERENCES `tUser` (`userID`);

ALTER TABLE `tDogInterests` ADD FOREIGN KEY (`interestsID`) REFERENCES `tInterests` (`interestsID`);

ALTER TABLE `tDogInterests` ADD FOREIGN KEY (`dogID`) REFERENCES `tDog` (`dogID`);
