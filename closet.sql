-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2020 at 04:47 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `closet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_Id` int(5) NOT NULL,
  `a_Name` varchar(20) NOT NULL,
  `a_Email` varchar(15) NOT NULL,
  `a_Phone` bigint(10) NOT NULL,
  `a_Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_Id`, `a_Name`, `a_Email`, `a_Phone`, `a_Password`) VALUES
(28671, 'admin', 'admin@gmail.com', 123456789, 'admin'),
(86253, 'yuvraj', 'yuvraj@gmail.co', 123456789, 'yuvraj');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `admin_login_details` AFTER INSERT ON `admin` FOR EACH ROW INSERt INTO login_details(login_Id,l_email,l_password)values(new.a_Id,new.a_Email,new.a_Password)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `sr` int(5) NOT NULL,
  `cart_Id` int(5) NOT NULL DEFAULT 99999,
  `p_Id` int(5) NOT NULL,
  `c_Id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_Id` int(5) NOT NULL,
  `c_Name` varchar(10) NOT NULL,
  `c_Email` varchar(15) NOT NULL,
  `c_Phone` bigint(10) NOT NULL,
  `c_Password` varchar(10) NOT NULL,
  `c_Address` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_Id`, `c_Name`, `c_Email`, `c_Phone`, `c_Password`, `c_Address`) VALUES
(32377, 'vishal', 'vishal@gmail.co', 1234656789, 'vishal', 'vishal'),
(35694, 'dhan', 'dhan@gmail.com', 123456789, 'dhan', 'dhan'),
(38402, 'yuvraj', 'yuvraj@gmail.co', 123456789, 'yuvraj', 'yuvraj');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `update_login_detail` AFTER INSERT ON `customer` FOR EACH ROW INSERt INTO login_details(login_Id,l_email,l_password)values(new.c_Id,new.c_Email,new.c_Password)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_Id` int(5) NOT NULL,
  `l_email` varchar(15) NOT NULL,
  `l_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_Id`, `l_email`, `l_password`) VALUES
(1, 'yuvraj@gmail.co', 'yuvraj'),
(28671, 'admin@gmail.com', 'admin'),
(35694, 'dhan@gmail.com', 'dhan');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_Id` varchar(10) NOT NULL,
  `p_Name` varchar(15) NOT NULL,
  `p_Category` varchar(10) NOT NULL,
  `p_Color` varchar(15) NOT NULL,
  `p_Type` varchar(15) NOT NULL,
  `p_Size` varchar(10) NOT NULL,
  `p_Quantity` int(10) NOT NULL,
  `p_Price` int(5) NOT NULL,
  `p_Time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_Id`, `p_Name`, `p_Category`, `p_Color`, `p_Type`, `p_Size`, `p_Quantity`, `p_Price`, `p_Time`) VALUES
('18936L', 'qwe', 'Women', 'ref', 'traditional', 'L', 0, 0, '2019-10-31 21:16:05'),
('18936S', 'qwe', 'Women', 'ref', 'traditional', 'S', 10, 599, '2019-10-31 21:16:05'),
('18936XL', 'qwe', 'Women', 'ref', 'traditional', 'XL', 20, 699, '2019-10-31 21:16:05'),
('21407XL', 'pant', 'Kids ', 'green', 'bottom_wear', 'L', 0, 0, '2019-10-31 19:48:22'),
('23357S', 'ttt', 'Kids', 'green', 'top_wear', 'S', 18, 1450, '2019-10-31 21:28:16'),
('25070M', 'pant 2', 'Kids ', 'green', 'bottom_wear', 'M', 25, 350, '2019-10-31 19:52:08'),
('25313M', 'jeans', 'Women', 'powder white', 'bottom_wear', 'M', 0, 0, '2019-10-31 20:23:41'),
('25313XL', 'jeans', 'Women', 'powder white', 'bottom_wear', 'XL', 10, 200, '2019-10-31 20:23:41'),
('29577L', 'j', 'Kids', 'ghj', 'traditional', 'L', 30, 300, '2019-10-31 20:26:05'),
('29577M', 'j', 'Kids', 'ghj', 'traditional', 'M', 20, 200, '2019-10-31 20:26:05'),
('29577S', 'j', 'Kids', 'ghj', 'traditional', 'S', 10, 100, '2019-10-31 20:26:05'),
('33043S', 'ttt', 'Kids', 'green', 'top_wear', 'S', 18, 1450, '2019-10-31 21:17:58'),
('36769M', 'shirt', 'Kids ', 'grey', 'top_wear', 'M', 25, 350, '2019-10-31 19:53:17'),
('37219M', 'jeans', 'Women', 'powder white', 'bottom_wear', 'M', 0, 0, '2019-10-31 20:24:46'),
('37219XL', 'jeans', 'Women', 'powder white', 'bottom_wear', 'XL', 10, 200, '2019-10-31 20:24:46'),
('40199XL', 'frog', 'Kids ', 'pink', 'top_wear', 'XL', 0, 0, '2019-10-31 19:56:54'),
('43252L', 'butterfly', 'Women', 'blue', 'top_wear', 'L', 20, 500, '2019-10-31 19:26:47'),
('43252M', 'butterfly', 'Women', 'blue', 'top_wear', 'M', 10, 349, '2019-10-31 19:26:47'),
('47544S', 'asd', 'Kids ', 'ASD', 'formal', 'S', 10, 1000, '2019-10-31 21:00:18'),
('54983M', 'asd', 'Kids ', 'ASD', 'formal', 'M', 10, 1049, '2019-10-31 21:02:26'),
('6426S', 'ttt', 'Kids', 'green', 'top_wear', 'S', 18, 1450, '2019-10-31 21:27:49'),
('64636XL', 'c', 'Kids ', 'green', 'bottom_wear', 'XL', 0, 0, '2019-10-31 19:33:51'),
('64985L', 'aa', 'Men', 'ref', 'top_wear', 'L', 25, 1000, '2019-10-31 19:06:30'),
('64985M', 'aa', 'Men', 'ref', 'top_wear', 'M', 15, 100, '2019-10-31 19:06:30'),
('64985XL', 'aa', 'Men', 'ref', 'top_wear', 'XL', 35, 10000, '2019-10-31 19:06:30'),
('65811S', 'gls', 'Kids ', 'yellow', 'bottom_wear', 'S', 10, 500, '2019-11-01 00:57:16'),
('75171L', 'amba', 'Kids', 'yellow', 'traditional', 'L', 0, 0, '2019-11-04 10:55:28'),
('75171S', 'amba', 'Kids', 'yellow', 'traditional', 'S', 10, 1000, '2019-11-04 10:55:28'),
('76149XL', 'girl kid', 'Kids Girl', 'pink', 'bottom_wear', 'XL', 0, 0, '2019-11-01 01:01:17'),
('79641M', 'shirt', 'Kids ', 'grey', 'top_wear', 'M', 25, 350, '2019-10-31 19:54:08'),
('81696S', 'ttt', 'Kids', 'green', 'top_wear', 'S', 18, 1450, '2019-10-31 21:21:01'),
('82121S', 'ttt', 'Kids', 'green', 'top_wear', 'S', 18, 1450, '2019-10-31 21:19:14'),
('91649L', 'frog', 'Kids ', 'pink', 'top_wear', 'L', 0, 0, '2019-10-31 20:13:11'),
('91649XL', 'frog', 'Kids ', 'pink', 'top_wear', 'XL', 0, 0, '2019-10-31 20:13:11'),
('95579S', 'boy kid', 'Kids Boy', 'blue', 'top_wear', 'S', 24, 1567, '2019-11-01 01:00:25'),
('9558L', 'boyg', 'Kids ', 'purple', 'top_wear', 'L', 0, 0, '2019-11-01 00:58:26'),
('Array', 'pant', 'Kids ', 'green', 'bottom_wear', 'S', 20, 300, '2019-10-31 19:48:22');

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `add_time` BEFORE INSERT ON `product` FOR EACH ROW set new.p_Time=now()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `quantity_check` BEFORE INSERT ON `product` FOR EACH ROW if(new.p_Quantity<=0)THEN
set new.p_Quantity=1;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_norm`
--

CREATE TABLE `product_norm` (
  `p_Id` int(10) NOT NULL,
  `p_Name` varchar(15) NOT NULL,
  `p_Category` varchar(5) NOT NULL,
  `p_Color` varchar(15) NOT NULL,
  `p_Type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_norm_quantity`
--

CREATE TABLE `product_norm_quantity` (
  `p_Id` int(10) NOT NULL,
  `p_Quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_norm__size`
--

CREATE TABLE `product_norm__size` (
  `p_Id` int(11) NOT NULL DEFAULT 0,
  `p_Size` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_size_chart`
--

CREATE TABLE `product_size_chart` (
  `sr` int(5) NOT NULL,
  `p_Size_Id` varchar(25) NOT NULL,
  `p_Quantity` int(5) NOT NULL,
  `p_Price` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales_transaction`
--

CREATE TABLE `sales_transaction` (
  `sr` int(5) NOT NULL,
  `t_Id` int(5) NOT NULL,
  `cart_Id` int(5) NOT NULL,
  `date` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `s_Id` int(5) NOT NULL,
  `s_Name` varchar(10) NOT NULL,
  `s_Email` varchar(15) NOT NULL,
  `s_Phone` bigint(10) NOT NULL,
  `s_Password` varchar(10) NOT NULL,
  `s_Address` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`s_Id`, `s_Name`, `s_Email`, `s_Phone`, `s_Password`, `s_Address`) VALUES
(28475, 'yuvraj', 'yuvraj@gmail.co', 123456789, 'yuvraj', 'yuvraj');

--
-- Triggers `seller`
--
DELIMITER $$
CREATE TRIGGER `seller_login_details` AFTER INSERT ON `seller` FOR EACH ROW INSERt INTO login_details(login_Id,l_email,l_password)values(new.s_Id,new.s_Email,new.s_Password)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_Id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`sr`,`cart_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_Id`),
  ADD KEY `c_Id` (`c_Id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_Id`),
  ADD UNIQUE KEY `login_Id` (`login_Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_Id`);

--
-- Indexes for table `product_norm`
--
ALTER TABLE `product_norm`
  ADD PRIMARY KEY (`p_Id`);

--
-- Indexes for table `product_size_chart`
--
ALTER TABLE `product_size_chart`
  ADD KEY `sr` (`sr`);

--
-- Indexes for table `sales_transaction`
--
ALTER TABLE `sales_transaction`
  ADD PRIMARY KEY (`t_Id`),
  ADD KEY `sr` (`sr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `sr` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_size_chart`
--
ALTER TABLE `product_size_chart`
  MODIFY `sr` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_transaction`
--
ALTER TABLE `sales_transaction`
  MODIFY `sr` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
