-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 06:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` char(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Name`, `Email`, `Phone`, `Password`) VALUES
('AR001', 'Ray', 'ray123@gmail.com', '081726425', '$2y$10$P85yrdK5ZuCtYg0ZGEPWw.NUd/TBo/E3UhBwhT9hSX/.J6V5UvmUK');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Publisher` varchar(255) NOT NULL,
  `PublishedYear` int(10) NOT NULL,
  `BookStatus` varchar(50) NOT NULL,
  `imagepath` varchar(500) NOT NULL,
  `Description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `Title`, `Author`, `Publisher`, `PublishedYear`, `BookStatus`, `imagepath`, `Description`) VALUES
('1287410', 'Buku Trading', 'Akademi Crypto', 'Kambana', 1990, '0', '../uploads/book2.jpeg', 'anda bisa trading pakai ini'),
('2311223124', 'Alone', 'Paro', 'Laman', 2012, '1', '../uploads/book4.jpeg', 'Perjalanan sendiri'),
('23123124', 'Midnight caller', 'KAMAN', 'Gramedia', 1990, '0', '../uploads/book3.jpeg', 'Buku yang bagus');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `LibrarianID` char(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`LibrarianID`, `Name`, `Email`, `Phone`, `PASSWORD`) VALUES
('LB001', 'Rhevell', 'rhevell@gmail.com', '6278178421521', '$2y$10$sTT9RTSA0wUpU7.7fl.BwesXXAo1KvvOpXtncxc2mRf...'),
('LB002', 'AndyLagi', 'fjdkfd@gmail.com', '6237574868334', '$2y$10$IjN67JKZuWXDS6YS38qc9ulscAgD7jWLXWILDKHYyLnFH./uEI0Va'),
('LB003', 'wkfokwma', 'dovace7919@rowplant.com', '6276152421', '$2y$10$FQn6l4ndkUN9t5R32Y7Ft.AtYYXnMXRA3DpUFS.Nb6PbZpuAODZBG');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` char(10) NOT NULL,
  `ReportDate` date NOT NULL,
  `AdminID` char(10) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `ReportDate`, `AdminID`, `Description`, `Nama`, `Role`) VALUES
('RE001', '2025-04-26', 'AR001', 'GA SUKA', 'Radawmandad', 'Visitor'),
('RE002', '2025-04-27', 'AR001', 'gak tau', 'Rhevell', 'Librarian'),
('RE003', '2025-04-28', 'AR001', 'Oke', 'Ray', 'Visitor');

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetail`
--

CREATE TABLE `transactiondetail` (
  `TransactionID` char(10) NOT NULL,
  `LoanDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `TransactionStatus` varchar(50) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `UserID` char(10) NOT NULL,
  `LibrarianID` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactiondetail`
--

INSERT INTO `transactiondetail` (`TransactionID`, `LoanDate`, `ReturnDate`, `TransactionStatus`, `ISBN`, `UserID`, `LibrarianID`) VALUES
('TR001', '2025-04-25', '2025-04-26', 'Buku Telah dikembalikan', '1287410', 'AD001', NULL),
('TR002', '2025-04-26', '2025-04-26', 'Menunggu Konfirmasi Librarian', '23123124', 'AD001', NULL),
('TR003', '2025-04-26', '2025-04-28', 'Buku Telah dikembalikan', '2311223124', 'AD001', NULL),
('TR004', '2025-04-26', NULL, 'Buku Telah dikembalikan', '1287410', 'AD001', 'LB001'),
('TR005', '2025-04-28', '2025-04-28', 'Buku Telah dikembalikan', '2311223124', 'AD004', NULL),
('TR006', '2025-04-28', NULL, 'Telah di konfirmasi Librarian', '23123124', 'AD005', 'LB002');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `UserID` char(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`UserID`, `Name`, `Phone`, `Email`, `Password`) VALUES
('AD001', 'Ray', '628176241522142', 'ray123@gmail.com', '$2y$10$f8DsBbTf4Q937O2fFmP4GuHpoiUpgDe2yIeaTY6RInY8NMjcg6I4C'),
('AD002', 'Radawmandad', '62806170713120', 'ray15424@gmail.com', '$2y$10$6/j2cufWatrXjBB9c2nF.OX3GhbppKQbaliy/wEB.yz6byDJwrTOS'),
('AD003', 'Ray', '627611232152421', 'ray1312323@gmail.com', '$2y$10$pf1voudFKS74IEB.KP.H3u0QAZ5rIZrovFffjjmn7S8GMPDFLr8Zu'),
('AD005', 'Andi', '6273748582', 'Andy@gmail.com', '$2y$10$6d9KFYSKLhjeaf.I1cL6LexPXerOrOuHhNF1kzVJg29xbFMue6jbK'),
('AD006', 'kalimafda', '627615242122', 'motapo482196@vasteron.com', '$2y$10$p7nljt1rN3AVeC1SsOVwmuRFl8GxX.QBjSInyk8NgiJm3MqJjM9vm'),
('AD007', 'Ray123', '627615212424', 'ray12923@gmail.com', '$2y$10$s9Lan2xBjRQ11ZwCJgjM2OBRbrcZ8oA8WF/32nj0t0SDu7FV5hpp.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`LibrarianID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `transactiondetail_ibfk_3` (`LibrarianID`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `transactiondetail`
--
ALTER TABLE `transactiondetail`
  ADD CONSTRAINT `fk_book_isbn` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
