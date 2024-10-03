-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Paź 03, 2024 at 09:15 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hurtownia_napojow`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawy`
--

CREATE TABLE `dostawy` (
  `id_dostawy` int(11) NOT NULL,
  `towar` int(11) NOT NULL,
  `data_zamowienia` date NOT NULL,
  `data_przyjazdu` date NOT NULL,
  `ilosc_towaru` int(11) NOT NULL,
  `koszt_dostawy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

CREATE TABLE `producent` (
  `producent_id` int(11) NOT NULL,
  `nazwa_firmy` varchar(50) NOT NULL,
  `kraj_firmy` varchar(50) NOT NULL,
  `siedziba_firmy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedarz`
--

CREATE TABLE `sprzedarz` (
  `id_sprzedarzy` int(11) NOT NULL,
  `produkt` int(11) NOT NULL,
  `data_zakupu` date NOT NULL,
  `ilosc` int(11) NOT NULL,
  `znizka` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `towar_id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `cena` double NOT NULL,
  `opis` text NOT NULL,
  `producent` varchar(50) NOT NULL,
  `w_magazynie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD PRIMARY KEY (`id_dostawy`);

--
-- Indeksy dla tabeli `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`producent_id`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`towar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dostawy`
--
ALTER TABLE `dostawy`
  MODIFY `id_dostawy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producent`
--
ALTER TABLE `producent`
  MODIFY `producent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towary`
--
ALTER TABLE `towary`
  MODIFY `towar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dostawy`
--
ALTER TABLE `dostawy`
  ADD CONSTRAINT `dostawy_ibfk_1` FOREIGN KEY (`id_dostawy`) REFERENCES `towary` (`towar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
