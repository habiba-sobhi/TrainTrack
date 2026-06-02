-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2026 at 04:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traintrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `att_status` varchar(10) NOT NULL
) ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `trainee_id`, `record_date`, `att_status`) VALUES
(1, 1, '2025-01-06', 'Present'),
(2, 1, '2025-01-07', 'Present'),
(3, 1, '2025-01-08', 'Absent'),
(4, 2, '2025-01-06', 'Present'),
(5, 2, '2025-01-07', 'Late'),
(6, 2, '2025-01-08', 'Absent'),
(7, 2, '2025-01-09', 'Absent'),
(8, 3, '2025-01-06', 'Absent'),
(9, 3, '2025-01-07', 'Absent'),
(10, 3, '2025-01-08', 'Absent'),
(11, 4, '2025-01-06', 'Present'),
(12, 4, '2025-01-07', 'Present'),
(13, 5, '2025-01-06', 'Present'),
(14, 6, '2025-01-06', 'Present'),
(15, 7, '2025-01-06', 'Absent'),
(16, 7, '2025-01-07', 'Absent'),
(17, 8, '2025-01-06', 'Present'),
(18, 9, '2025-02-03', 'Present'),
(19, 10, '2025-02-03', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_name`, `start_date`, `end_date`, `trainer_id`, `dept_id`) VALUES
(1, 'CSR-B01-2025', '2025-01-06', '2025-02-02', 1, 1),
(2, 'TSR-B01-2025', '2025-01-06', '2025-01-26', 2, 2),
(3, 'NONPAY-B01', '2025-02-03', '2025-02-23', 1, 3),
(4, 'RET-MOB-B01', '2025-02-03', '2025-02-23', 3, 4),
(5, 'RET-RES-B01', '2025-03-03', '2025-03-30', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `training_weeks` int(11) NOT NULL
) ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `training_weeks`) VALUES
(1, 'CSR', 4),
(2, 'TSR', 3),
(3, 'Non-pay', 3),
(4, 'Retention Mobile', 3),
(5, 'Retention Residential', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `quiz_date` date NOT NULL,
  `max_score` decimal(5,2) NOT NULL DEFAULT 100.00,
  `pass_score` decimal(5,2) NOT NULL DEFAULT 60.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `batch_id`, `quiz_name`, `quiz_date`, `max_score`, `pass_score`) VALUES
(1, 1, 'Product Knowledge Q1', '2025-01-10', 100.00, 60.00),
(2, 1, 'System Navigation Q1', '2025-01-17', 100.00, 60.00),
(3, 1, 'Compliance Quiz', '2025-01-24', 100.00, 70.00),
(4, 2, 'TSR Product Quiz', '2025-01-10', 100.00, 60.00),
(5, 2, 'TSR Policy Quiz', '2025-01-17', 100.00, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempt`
--

CREATE TABLE `quiz_attempt` (
  `attempt_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `result` varchar(10) NOT NULL
) ;

--
-- Dumping data for table `quiz_attempt`
--

INSERT INTO `quiz_attempt` (`attempt_id`, `trainee_id`, `quiz_id`, `score`, `result`) VALUES
(1, 1, 1, 82.00, 'Pass'),
(2, 1, 2, 75.00, 'Pass'),
(3, 1, 3, 65.00, 'Pass'),
(4, 2, 1, 55.00, 'Fail'),
(5, 2, 2, 50.00, 'Fail'),
(6, 4, 1, 90.00, 'Pass'),
(7, 4, 2, 88.00, 'Pass'),
(8, 6, 4, 72.00, 'Pass'),
(9, 7, 4, 40.00, 'Fail'),
(10, 7, 5, 35.00, 'Fail'),
(11, 8, 4, 78.00, 'Pass'),
(12, 8, 5, 81.00, 'Pass');

-- --------------------------------------------------------

--
-- Table structure for table `role_play`
--

CREATE TABLE `role_play` (
  `rp_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `rp_name` varchar(100) NOT NULL,
  `rp_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_play`
--

INSERT INTO `role_play` (`rp_id`, `batch_id`, `rp_name`, `rp_date`) VALUES
(1, 1, 'Billing Complaint RP', '2025-01-14'),
(2, 1, 'Upgrade Offer RP', '2025-01-21'),
(3, 1, 'Cancellation Save RP', '2025-01-28'),
(4, 2, 'TSR Pitch RP', '2025-01-14'),
(5, 2, 'Objection Handling RP', '2025-01-21');

-- --------------------------------------------------------

--
-- Table structure for table `rp_attempt`
--

CREATE TABLE `rp_attempt` (
  `attempt_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `rp_id` int(11) NOT NULL,
  `result` varchar(10) NOT NULL,
  `feedback` text DEFAULT NULL
) ;

--
-- Dumping data for table `rp_attempt`
--

INSERT INTO `rp_attempt` (`attempt_id`, `trainee_id`, `rp_id`, `result`, `feedback`) VALUES
(1, 1, 1, 'Pass', 'Good empathy, strong close.'),
(2, 1, 2, 'Pass', 'Excellent product knowledge.'),
(3, 1, 3, 'Pass', 'Met all criteria.'),
(4, 2, 1, 'Fail', 'Rushed through steps, missed verification.'),
(5, 4, 1, 'Pass', 'Outstanding performance.'),
(6, 4, 2, 'Pass', 'Very confident delivery.'),
(7, 6, 4, 'Pass', 'Good pitch structure.'),
(8, 7, 4, 'Fail', 'Did not follow script.'),
(9, 8, 4, 'Pass', 'Strong opener and close.'),
(10, 8, 5, 'Pass', 'Handled objection professionally.');

-- --------------------------------------------------------

--
-- Table structure for table `test_call`
--

CREATE TABLE `test_call` (
  `tc_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL,
  `attempt_number` int(11) NOT NULL,
  `result` varchar(10) NOT NULL,
  `fail_reason` varchar(20) DEFAULT NULL,
  `attempt_date` date NOT NULL
) ;

--
-- Dumping data for table `test_call`
--

INSERT INTO `test_call` (`tc_id`, `trainee_id`, `attempt_number`, `result`, `fail_reason`, `attempt_date`) VALUES
(1, 4, 1, 'Pass', NULL, '2025-01-31'),
(2, 1, 1, 'Fail', 'Language', '2025-01-31'),
(3, 1, 2, 'Pass', NULL, '2025-02-01'),
(4, 6, 1, 'Fail', 'Quality', '2025-01-24'),
(5, 6, 2, 'Fail', 'Both', '2025-01-25'),
(6, 6, 3, 'Fail', 'Quality', '2025-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

CREATE TABLE `trainee` (
  `trainee_id` int(11) NOT NULL,
  `biometric_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active'
) ;

--
-- Dumping data for table `trainee`
--

INSERT INTO `trainee` (`trainee_id`, `biometric_id`, `first_name`, `last_name`, `batch_id`, `status`) VALUES
(1, 'BIO-10001', 'Layla', 'Khaled', 1, 'Active'),
(2, 'BIO-10002', 'Omar', 'Samir', 1, 'Active'),
(3, 'BIO-10003', 'Yasmine', 'Ali', 1, 'Terminated'),
(4, 'BIO-10004', 'Karim', 'Farouk', 1, 'Nesting'),
(5, 'BIO-10005', 'Dina', 'Tawfik', 1, 'Active'),
(6, 'BIO-20001', 'Hassan', 'Mostafa', 2, 'Terminated'),
(7, 'BIO-20002', 'Mariam', 'Sayed', 2, 'Terminated'),
(8, 'BIO-20003', 'Tarek', 'Nasser', 2, 'Active'),
(9, 'BIO-30001', 'Hana', 'Aziz', 3, 'Active'),
(10, 'BIO-30002', 'Youssef', 'Fathy', 3, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`trainer_id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Sara', 'Hassan', 'sara.hassan@callcenter.com'),
(2, 'Ahmed', 'Mostafa', 'ahmed.mostafa@callcenter.com'),
(3, 'Nour', 'Ibrahim', 'nour.ibrahim@callcenter.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `trainee_id` (`trainee_id`,`record_date`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD UNIQUE KEY `batch_name` (`batch_name`),
  ADD KEY `trainer_id` (`trainer_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `dept_name` (`dept_name`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `quiz_attempt`
--
ALTER TABLE `quiz_attempt`
  ADD PRIMARY KEY (`attempt_id`),
  ADD UNIQUE KEY `trainee_id` (`trainee_id`,`quiz_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `role_play`
--
ALTER TABLE `role_play`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `rp_attempt`
--
ALTER TABLE `rp_attempt`
  ADD PRIMARY KEY (`attempt_id`),
  ADD UNIQUE KEY `trainee_id` (`trainee_id`,`rp_id`),
  ADD KEY `rp_id` (`rp_id`);

--
-- Indexes for table `test_call`
--
ALTER TABLE `test_call`
  ADD PRIMARY KEY (`tc_id`),
  ADD UNIQUE KEY `trainee_id` (`trainee_id`,`attempt_number`);

--
-- Indexes for table `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`trainee_id`),
  ADD UNIQUE KEY `biometric_id` (`biometric_id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`trainer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quiz_attempt`
--
ALTER TABLE `quiz_attempt`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_play`
--
ALTER TABLE `role_play`
  MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rp_attempt`
--
ALTER TABLE `rp_attempt`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_call`
--
ALTER TABLE `test_call`
  MODIFY `tc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainee`
--
ALTER TABLE `trainee`
  MODIFY `trainee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `trainer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`);

--
-- Constraints for table `batch`
--
ALTER TABLE `batch`
  ADD CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`),
  ADD CONSTRAINT `batch_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `quiz_attempt`
--
ALTER TABLE `quiz_attempt`
  ADD CONSTRAINT `quiz_attempt_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`),
  ADD CONSTRAINT `quiz_attempt_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`);

--
-- Constraints for table `role_play`
--
ALTER TABLE `role_play`
  ADD CONSTRAINT `role_play_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `rp_attempt`
--
ALTER TABLE `rp_attempt`
  ADD CONSTRAINT `rp_attempt_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`),
  ADD CONSTRAINT `rp_attempt_ibfk_2` FOREIGN KEY (`rp_id`) REFERENCES `role_play` (`rp_id`);

--
-- Constraints for table `test_call`
--
ALTER TABLE `test_call`
  ADD CONSTRAINT `test_call_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`trainee_id`);

--
-- Constraints for table `trainee`
--
ALTER TABLE `trainee`
  ADD CONSTRAINT `trainee_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
