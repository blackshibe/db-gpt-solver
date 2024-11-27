-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Lis 2024, 07:06
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `korporacja`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `city`
--

CREATE TABLE `city` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `city`
--

INSERT INTO `city` (`Id`, `Name`) VALUES
(1, 'New York'),
(2, 'Warsaw'),
(3, 'London'),
(4, 'Paris'),
(5, 'Venice');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `department`
--

CREATE TABLE `department` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `ManagerId` smallint(6) NOT NULL,
  `CityId` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `department`
--

INSERT INTO `department` (`Id`, `Name`, `ManagerId`, `CityId`) VALUES
(1, 'IT', 5, 2),
(2, 'Accounting', 4, NULL),
(3, 'HR', 8, 2),
(4, 'Marketing', 3, 1),
(5, 'Controlling', 11, 3),
(6, 'Data Warehouse', 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee`
--

CREATE TABLE `employee` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `SecondName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','W')),
  `BirthDate` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `HireDate` date NOT NULL,
  `RelieveDate` date DEFAULT NULL,
  `Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `employee`
--

INSERT INTO `employee` (`Id`, `FirstName`, `SecondName`, `LastName`, `Gender`, `BirthDate`, `Salary`, `DepartmentId`, `HireDate`, `RelieveDate`, `Active`) VALUES
(1, 'Mary', NULL, 'Smith', 'W', '1985-12-18', 2000, 1, '2011-05-06', NULL, b'1'),
(2, 'Paul', 'George', 'Johnson', 'M', '1990-01-13', 1500, 3, '2011-10-29', NULL, b'1'),
(3, 'Patricia', NULL, 'Wilson', 'W', '1995-05-28', 1000, 4, '2012-01-24', '2013-11-25', b'0'),
(4, 'Linda', 'Lisa', 'Brown', 'W', '1983-07-11', 2700, 2, '2012-06-15', NULL, b'0'),
(5, 'Johnatan', NULL, 'Davis', 'M', '1978-01-24', 1200, 1, '2013-01-15', NULL, b'1'),
(6, 'John', NULL, 'Miller', NULL, '1993-10-20', 2000, 4, '2013-03-27', '2014-10-06', b'0'),
(7, 'Elizabeth', 'Dorothy', 'Taylor', 'W', '1992-09-09', 2110, 1, '2013-05-01', NULL, b'1'),
(8, 'James', NULL, 'Wilson', 'M', '1987-03-19', 1000, 3, '2013-10-09', '2014-03-01', b'1'),
(9, 'Robert', NULL, 'Anderson', 'M', '1989-12-13', 2900, 2, '2013-12-20', '2014-05-05', b'0'),
(10, 'John', 'Mark', 'Smith', 'W', '1990-05-24', 2500, 1, '2014-01-24', NULL, b'1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `formeremployee`
--

CREATE TABLE `formeremployee` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `SecondName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Salary` decimal(6,2) DEFAULT NULL,
  `DepartmentId` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `RelieveDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `formeremployee`
--

INSERT INTO `formeremployee` (`Id`, `FirstName`, `SecondName`, `LastName`, `Gender`, `BirthDate`, `Salary`, `DepartmentId`, `HireDate`, `RelieveDate`) VALUES
(6, 'John', NULL, 'Miller', 'W', '1993-10-20', '2000.00', 4, '2013-03-27', '2014-10-06'),
(11, 'Ann', NULL, 'Pritchett', 'M', '1980-05-21', '2400.00', 6, '2014-01-05', '2015-02-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitCost` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orderdetails`
--

INSERT INTO `orderdetails` (`Id`, `OrderId`, `ProductId`, `Quantity`, `UnitCost`) VALUES
(2, 1, 2, 1, '55'),
(3, 2, 2, 1, '55'),
(4, 2, 4, 2, '99'),
(5, 2, 5, 1, '415'),
(6, 3, 1, 2, '1900'),
(7, 3, 2, 2, '45'),
(8, 5, 2, 20, '40');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `OrderNumber` varchar(50) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderTotal` decimal(18,0) NOT NULL,
  `EmployeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`Id`, `OrderNumber`, `OrderDate`, `OrderTotal`, `EmployeeId`) VALUES
(1, 'Z/13/2014', '2014-01-14', '55', 3),
(2, 'Z/25/2015', '2015-02-21', '668', 5),
(3, 'Z/30/2015', '2015-06-29', '2890', 1),
(5, 'Z/45/2015', '2015-07-24', '800', 3),
(6, 'Z/50/2015', '2015-08-02', '2700', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `CategoryId` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `product`
--

INSERT INTO `product` (`Id`, `Name`, `Price`, `CategoryId`) VALUES
(1, 'Laptop', 2000, 1),
(2, 'Mouse', 50, 2),
(3, 'Keyboard', 300, 2),
(4, 'Flash Drive', 100, 3),
(5, 'Hard Drive', 400, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `productcategory`
--

CREATE TABLE `productcategory` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `productcategory`
--

INSERT INTO `productcategory` (`Id`, `Name`) VALUES
(1, 'Computer'),
(2, 'Accessory'),
(3, 'Drive'),
(4, 'Printer');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `city`
--
ALTER TABLE `city`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `department`
--
ALTER TABLE `department`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `employee`
--
ALTER TABLE `employee`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
