-- MySQL dump 10.13  Distrib 5.5.45, for Win32 (x86)
--
-- Host: localhost    Database: integratedlibrarysystem
-- ------------------------------------------------------
-- Server version	5.5.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlogin` (
  `userval` varchar(30) DEFAULT NULL,
  `passval` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminnotification`
--

DROP TABLE IF EXISTS `adminnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminnotification` (
  `enrollno` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `message` varchar(300) NOT NULL,
  `notidate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotification`
--

LOCK TABLES `adminnotification` WRITE;
/*!40000 ALTER TABLE `adminnotification` DISABLE KEYS */;
INSERT INTO `adminnotification` VALUES ('0818cs151206','Somi Shrivastva','somi55shrivastva@gmail.com','somi','shrivastav','2018-04-19 07:07:50'),('0818cs151219','umesh patil','umeshpatil1303@gmail.com','need of new books','please get available the new book of database','2018-05-03 14:55:27');
/*!40000 ALTER TABLE `adminnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` varchar(10) NOT NULL,
  `ISBN` varchar(30) DEFAULT NULL,
  `title` varchar(70) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `edition` varchar(20) NOT NULL,
  `edition_year` int(11) NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `publication_year` int(11) NOT NULL,
  `bookadded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `ISBN` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('123456','123456789','programming with java','balaguruswami','2nd',2012,'Technical Publication',2015,'2018-05-04 06:57:58'),('13487','976-81-8431-096-10','Advanced Database Management','S.Kedar A.Jadhav','1st',2006,'Technical Publications',2006,'2018-04-22 08:37:58'),('21904','978-93-5038-995-9','Object Oriented Modelling & Design with UML','Jame R.Rambaugh','2nd',2007,'Pearson Education',2005,'2018-04-22 08:42:57'),('24394','978-81-203-1380-4','Distributed Operating System','Pradeep K. Sinha','3rd',2010,'PHI Learning',2007,'2018-04-22 08:35:42'),('25161','398-93-80273-64-8','Discrete Structure','Dr. DC Agrawal','2nd',2010,'Shri Sai Publication',2008,'2018-04-20 17:27:10'),('25905','971-81-265-2741-0','Fundamentals of Database System','Shamkant B. Navathe','2nd',2011,'Wiley India',2008,'2018-04-22 08:14:19'),('27188','978-0-07-063414-5','Data Communication and Networking','Behrouz A Forouzan','4th',2010,'Mc Graw-Hill',2007,'2018-04-20 06:37:11'),('29020','978-81-265-1056-6','Wireless Communication','Andreas F.Malisch','3rd',2010,'Wiley India',2005,'2018-04-22 09:15:22'),('29590','1414-2-03-248918-7','Operating System Concepts','Abraham Silberschatz','8th',2010,'Wiley India',2016,'2018-04-22 07:19:19'),('30606','978-81-317-0205-5','Design and Analysis of Computer Algorithm','Aho Ullman','3rd',2008,'Pearson Education',2006,'2018-04-22 09:15:02'),('31492','971-81-317-1625-0','Soft Computing','S.N.Sivanandam','3rd',2008,'Pearson Education',2006,'2018-04-22 08:23:19'),('3176','978-81-206-2141-4','Introduction to Algorithm','Thomas H.Cormen','2nd',2008,'PHI Learning',2007,'2018-04-22 09:15:11'),('34400','978-007-132522-6','Database System Concepts','Korth & Sudarshan','5th',2009,'Pearson Education',1997,'2018-04-22 07:29:29'),('41572','878-81-775-8765-4','Computer Graphics','Donald D.Hearn & M.Pauline Baker','6th',2011,'McGraw Hill',2006,'2018-04-22 07:32:07'),('45948','81-7656-106-1','Let us C++','Yashavant kanetkar','1st',2008,'BPB Publications',2008,'2018-04-20 17:24:58'),('47171','978-0-07-052904-5','Local Area Networks','Geral Keiser','2nd',2003,'McGraw Hill',2002,'2018-04-22 07:17:51'),('48959','978-81-317-0078-5','Introduction to Database Management System','Atul Kahate','3rd',2009,'Pearson Education',2006,'2018-04-22 09:14:47'),('49109','978-81-7758-826-2','Data Structure & Algorithm','Jeffrey D.Ullman','5th',2009,'Pearson Education',2005,'2018-04-22 08:24:32'),('49353','978-81-317-1340-2','C# for Programmers',' Harvey M. Deitel','2nd',2009,'Pearson Education',2006,'2018-04-22 08:35:34'),('49900','978-81-317-0070-9','Advanced Computer Architecture','M.Morris Mano','3rd',2008,'Pearson Education',2007,'2018-04-22 07:10:41'),('50300','978-0-07-053246-5','The Complete Reference C++','Herbert Schildt','4th',2009,'Mc Graw-Hill',2003,'2018-04-20 17:20:39'),('62597','978-81-265-2980-3','Cloud Computing','Barrie Sobinsky','1st',2011,'Wiley India Pvt.Ltd',2011,'2018-04-20 17:32:59'),('70879','978-98-5038-995-9','Object Oriented Programming','A.A. Puntambekar','2nd',2013,'Technical Publication',2012,'2018-04-20 17:29:39'),('95501','89451-1-08-428129-6','Software Project Management','Bob Hughes & Mike Cotterell','3rd',2005,'McGraw Hill',2004,'2018-04-22 07:17:58');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `enrollno` varchar(12) DEFAULT NULL,
  `book_id` varchar(10) NOT NULL DEFAULT '',
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `enrollno` (`enrollno`),
  CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`enrollno`) REFERENCES `studentprofile` (`enrollno`),
  CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES ('0818cs151219','21904','2018-05-03','2018-05-23'),('0818cs151206','24394','2018-05-03','2018-05-23'),('0818cs151111','25161','2018-04-21','2018-05-11'),('0818cs151219','27188','2018-04-20','2018-05-10'),('0818cs151222','45948','2018-04-20','2018-05-10'),('0818cs151206','70879','2018-04-20','2018-05-10');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarianlogin`
--

DROP TABLE IF EXISTS `librarianlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarianlogin` (
  `userval` varchar(30) DEFAULT NULL,
  `passval` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarianlogin`
--

LOCK TABLES `librarianlogin` WRITE;
/*!40000 ALTER TABLE `librarianlogin` DISABLE KEYS */;
INSERT INTO `librarianlogin` VALUES ('vaishu','shinde'),('umesh','patil');
/*!40000 ALTER TABLE `librarianlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `enrollno` varchar(15) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` varchar(300) DEFAULT NULL,
  `currentdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('0818cs151219','Book Issued','Book with Book ID : 1 is issued on your card. Return Date of this Book is : 2018-05-04','2018-04-14 08:47:04'),('0818cs151219','Book Returned','Book with Book ID : 1 is Returned by you. Fine Paid: 0 Fine Due : 10 ','2018-04-14 09:20:32'),('0818cs151222','Book Returned','Book with Book ID : 5 is Returned by you. Fine Paid: 0 Fine Due : 20 ','2018-04-14 09:21:42'),('0818cs151206','Book Issued','Book with Book ID : 5 is issued on your card. Return Date of this Book is : 2018-05-04','2018-04-14 09:55:19'),('0818cs151219','Book Issued','Book with Book ID : 1 is issued on your card. Return Date of this Book is : 2018-05-05','2018-04-15 08:46:51'),('0818cs151206','Book Returned','Book with Book ID : 5 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-17 08:01:57'),('0818cs151123','Book Issued','Book with Book ID : 5 is issued on your card. Return Date of this Book is : 2018-05-07','2018-04-17 08:02:28'),('0818cs151219','Book Issued','Book with Book ID : 27188 is issued on your card. Return Date of this Book is : 2018-05-10','2018-04-20 17:43:36'),('0818cs151222','Book Issued','Book with Book ID : 45948 is issued on your card. Return Date of this Book is : 2018-05-10','2018-04-20 17:44:50'),('0818cs151123','Book Issued','Book with Book ID : 50300 is issued on your card. Return Date of this Book is : 2018-05-10','2018-04-20 17:45:13'),('0818cs151206','Book Issued','Book with Book ID : 70879 is issued on your card. Return Date of this Book is : 2018-05-10','2018-04-20 17:46:16'),('0818cs151225','Book Issued','Book with Book ID : 62597 is issued on your card. Return Date of this Book is : 2018-05-10','2018-04-20 18:00:40'),('0818cs151111','Book Issued','Book with Book ID : 25161 is issued on your card. Return Date of this Book is : 2018-05-11','2018-04-21 11:37:32'),('0818cs151123','Book Returned','Book with Book ID : 50300 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-21 11:39:38'),('0818cs151225','Book Returned','Book with Book ID : 62597 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-21 11:41:29'),('0818cs151222','Book Issued','Book with Book ID : 13487 is issued on your card. Return Date of this Book is : 2018-05-13','2018-04-23 09:24:44'),('0818cs151222','Book Returned','Book with Book ID : 13487 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-23 09:26:19'),('0818cs151222','Book Returned','Book with Book ID : 13487 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-23 09:26:24'),('0818cs151222','Book Returned','Book with Book ID : 13487 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-23 09:26:25'),('0818cs151222','Book Returned','Book with Book ID : 13487 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-23 09:26:25'),('0818cs151197','Book Issued','Book with Book ID : 3176 is issued on your card. Return Date of this Book is : 2018-05-13','2018-04-23 09:31:54'),('0818cs151197','Book Returned','Book with Book ID : 3176 is Returned by you. Fine Paid: 0 Fine Due : 0 ','2018-04-23 09:33:16'),('0818cs151219','Book Issued','Book with Book ID : 21904 is issued on your card. Return Date of this Book is : 2018-05-23','2018-05-03 14:56:27'),('0818cs151206','Book Issued','Book with Book ID : 24394 is issued on your card. Return Date of this Book is : 2018-05-23','2018-05-03 14:58:17');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationwall`
--

DROP TABLE IF EXISTS `notificationwall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationwall` (
  `notiwall` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationwall`
--

LOCK TABLES `notificationwall` WRITE;
/*!40000 ALTER TABLE `notificationwall` DISABLE KEYS */;
INSERT INTO `notificationwall` VALUES ('New Books of Internet of Things (IoT) are available in the Library.'),('Students can Now Issue 8 Books on their ID Card.'),('Days Limit are Increased from 15 days to 20 days.'),('More Books of Programming Language are added in the Library.'),('New International Journals are updated.'),(' Check our E-Library for your Course related Manuals and ebooks.'),('For new Student Registration, Contact Admin.');
/*!40000 ALTER TABLE `notificationwall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returned`
--

DROP TABLE IF EXISTS `returned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returned` (
  `enrollno` varchar(12) NOT NULL,
  `book_id` varchar(10) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `return_date` date NOT NULL,
  KEY `enrollno` (`enrollno`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `returned_ibfk_1` FOREIGN KEY (`enrollno`) REFERENCES `studentprofile` (`enrollno`),
  CONSTRAINT `returned_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returned`
--

LOCK TABLES `returned` WRITE;
/*!40000 ALTER TABLE `returned` DISABLE KEYS */;
INSERT INTO `returned` VALUES ('0818cs151123','50300','2018-04-20','2018-05-10','2018-04-21'),('0818cs151225','62597','2018-04-20','2018-05-10','2018-04-21'),('0818cs151222','13487','2018-04-23','2018-05-13','2018-04-23'),('0818cs151222','13487','2018-04-23','2018-05-13','2018-04-23'),('0818cs151222','13487','2018-04-23','2018-05-13','2018-04-23'),('0818cs151222','13487','2018-04-23','2018-05-13','2018-04-23'),('0818cs151197','3176','2018-04-23','2018-05-13','2018-04-23');
/*!40000 ALTER TABLE `returned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `sno` int(11) NOT NULL,
  `fine` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `books` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,5,20,8);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlogin`
--

DROP TABLE IF EXISTS `studentlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlogin` (
  `enrollno` varchar(12) NOT NULL,
  `passval` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`enrollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlogin`
--

LOCK TABLES `studentlogin` WRITE;
/*!40000 ALTER TABLE `studentlogin` DISABLE KEYS */;
INSERT INTO `studentlogin` VALUES ('0818cs151099','12345678'),('0818cs151111','12345678'),('0818cs151123','12345678'),('0818cs151197','patil'),('0818cs151206','12345678'),('0818cs151219','12345678'),('0818cs151222','12345678'),('0818cs151225','12345687'),('null','null');
/*!40000 ALTER TABLE `studentlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentprofile`
--

DROP TABLE IF EXISTS `studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentprofile` (
  `enrollno` varchar(12) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `year` varchar(5) DEFAULT NULL,
  `course` varchar(10) DEFAULT NULL,
  `DOB` varchar(10) DEFAULT NULL,
  `phone_no` varchar(13) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `fine` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enrollno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentprofile`
--

LOCK TABLES `studentprofile` WRITE;
/*!40000 ALTER TABLE `studentprofile` DISABLE KEYS */;
INSERT INTO `studentprofile` VALUES ('0818cs151099','Lokesh Singh Sodha','3','BE-CS','1997-10-26','8871935310','lokeshsinghsodha28@gmail.com','Mhow',0),('0818cs151111','Kartik Patidar','3','BE-CS','1997-03-17','9993991796','kartikpatidar35@gmail.com','Mhow',0),('0818cs151123','Mayur patidar','3','BE-CS','1997-01-14','9753525824','patidar.mayur14@gmail.com','palasiya mhow',0),('0818cs151197','Shubham Sahu','3','BE-CS','1997-01-15','8959285077','sahus3453@gmail.com','indore',0),('0818cs151206','Somi Shrivastva','3','BE-CS','1997-03-07','7746866827','somi55shrivastva@gmail.com','Dharnaka,Mhow',0),('0818cs151219','Umesh Patil','2015','BE-CS','13\031997','7697680121','umeshpatil1303@gmail.com','96,chandra vihar colony,mhow',0),('0818cs151222','Vaishnavi Shinde','3','BE(CSE)','211997','8225020574','shindevaishu02@gmail.com','dewas',0),('0818cs151225','Vidushee Shrotriya','3','BE-CS','1997-05-12','7772026524','vidushee.shrotriya@gmail.com','jaora, ratlam',0);
/*!40000 ALTER TABLE `studentprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierid` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`supplierid`),
  UNIQUE KEY `phoneno` (`phoneno`),
  UNIQUE KEY `emailid` (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('1','umesh patil','7697680121','umeshpatil1303@gmail.com','96, chandra vihar colony, umariya, a.b road mhow');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-25  7:33:04
