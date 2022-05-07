DROP Database if exists Shairport;
CREATE DATABASE `Shairport`;
USE Shairport;
CREATE TABLE `tickets` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `pickupdate` varchar(45) NOT NULL,
  `airport` varchar(45) NOT NULL,
  `pickuptime` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  PRIMARY KEY (`ticketID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `userticketbridge` (
  `email` varchar(45) DEFAULT NULL,
  `ticketID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `carpools` (
  `carpoolID` int NOT NULL AUTO_INCREMENT,
  `user1_email` varchar(45) DEFAULT NULL,
  `user1_name` varchar(45) DEFAULT NULL,
  `user1_phonenumber` varchar(45) DEFAULT NULL,
  `user2_email` varchar(45) DEFAULT NULL,
  `user2_name` varchar(45) DEFAULT NULL,
  `user2_phonenumber` varchar(45) DEFAULT NULL,
  `pickupdate` varchar(45) DEFAULT NULL,
  `airport` varchar(45) DEFAULT NULL,
  `pickuptime` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`carpoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `additionalinfo` (
  `email` varchar(45) NOT NULL,
  `gradyear` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
ALTER TABLE `Shairport`.`additionalinfo` 
ADD COLUMN `image` VARCHAR(1000) NULL AFTER `major`;