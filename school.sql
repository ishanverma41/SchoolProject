-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 14, 2023 at 09:48 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`) VALUES
(1, 'abc'),
(2, 'Database Management Systems'),
(3, 'Operating Systems'),
(4, 'Software Engineering'),
(5, 'Data Structures and Algorithms'),
(6, 'Computer Networks'),
(7, 'Web Development'),
(8, 'Computer Graphics'),
(9, 'Artificial Intelligence'),
(10, 'Information Security'),
(11, 'IT Technologies'),
(12, 'Cloud Computing'),
(13, 'Database Administration'),
(14, 'Computer Organization and Architecture'),
(15, 'Human-Computer Interaction'),
(16, 'Object-Oriented Programming'),
(17, 'Internet of Things'),
(18, 'Big Data Analytics'),
(19, 'Blockchain Technology'),
(20, 'Cryptography and Network Security'),
(21, 'Data Mining'),
(22, 'Information Retrieval'),
(23, 'Natural Language Processing'),
(24, 'Parallel Computing'),
(25, 'Robotics'),
(26, 'Virtual Reality'),
(27, 'Wireless and Mobile Communication');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `student_id`, `course_id`) VALUES
(1, 101, 1),
(2, 1, 1),
(3, 2, 2),
(4, 3, 3),
(5, 4, 4),
(6, 5, 5),
(7, 6, 6),
(8, 7, 7),
(9, 8, 8),
(10, 9, 9),
(11, 10, 10),
(12, 11, 11),
(13, 12, 12),
(14, 13, 13),
(15, 14, 14),
(16, 15, 15),
(17, 16, 16),
(18, 17, 17),
(19, 18, 18),
(20, 19, 19),
(21, 20, 20),
(22, 101, 5),
(23, 102, 7),
(24, 103, 9),
(25, 4339316, 11);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `class` varchar(100) NOT NULL,
  `section` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `class`, `section`) VALUES
(1, 'John Doe', 'IT TECHNOLOGIES', 'A'),
(2, 'Jane Doe', 'IT TECHNOLOGIES', 'A'),
(3, 'Bob Smith', 'IT TECHNOLOGIES', 'B'),
(4, 'Samantha Johnson', 'IT TECHNOLOGIES', 'B'),
(5, 'Tom Brown', 'IT TECHNOLOGIES', 'A'),
(6, 'Emily Davis', 'IT TECHNOLOGIES', 'A'),
(7, 'Steven Lee', 'IT TECHNOLOGIES', 'B'),
(8, 'Jessica White', 'IT TECHNOLOGIES', 'B'),
(9, 'Michael Green', 'IT TECHNOLOGIES', 'A'),
(10, 'Stephanie Black', 'IT TECHNOLOGIES', 'A'),
(11, 'David Rodriguez', 'IT TECHNOLOGIES', 'B'),
(12, 'Maria Hernandez', 'IT TECHNOLOGIES', 'B'),
(13, 'Chris Brown', 'IT TECHNOLOGIES', 'A'),
(14, 'Linda Taylor', 'IT TECHNOLOGIES', 'A'),
(15, 'James Wilson', 'IT TECHNOLOGIES', 'B'),
(16, 'Jennifer Davis', 'IT TECHNOLOGIES', 'B'),
(17, 'Andrew Jackson', 'IT TECHNOLOGIES', 'A'),
(18, 'Megan Campbell', 'IT TECHNOLOGIES', 'A'),
(19, 'Peter Johnson', 'IT TECHNOLOGIES', 'B'),
(20, 'Karen Wilson', 'IT TECHNOLOGIES', 'B'),
(101, 'ashok', '5th', 'a'),
(102, 'sam', '9', 'a'),
(103, 'rr', '66', 's'),
(4339316, 'Kiran Deep', 'IT Technologies', '');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`) VALUES
(1, 'asass'),
(2, 'John Smith'),
(3, 'Mary Johnson'),
(4, 'David Brown'),
(5, 'Emily Davis'),
(6, 'Michael Green'),
(7, 'Karen Wilson'),
(8, 'Chris Lee'),
(9, 'Sarah Miller'),
(10, 'Tom Jones'),
(11, 'Jessica White'),
(12, 'Robert Garcia'),
(13, 'Stephanie Black'),
(14, 'Linda Taylor'),
(15, 'James Wilson'),
(16, 'Jennifer Davis'),
(17, 'Andrew Jackson'),
(18, 'Megan Campbell'),
(19, 'Peter Johnson'),
(20, 'Julia Brown'),
(21, 'Scott Davis'),
(22, 'Rachel Lee'),
(23, 'Mark Thompson'),
(24, 'Nicole Davis'),
(25, 'Erica Wilson'),
(26, 'Timothy Jones');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
