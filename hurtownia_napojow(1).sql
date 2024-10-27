-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Paź 2024, 22:11
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hurtownia_napojow`
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

--
-- Zrzut danych tabeli `dostawy`
--

INSERT INTO `dostawy` (`id_dostawy`, `towar`, `data_zamowienia`, `data_przyjazdu`, `ilosc_towaru`, `koszt_dostawy`) VALUES
(1, 1, '2024-10-01', '2024-10-03', 100, 350);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

CREATE TABLE `producent` (
  `producent_id` int(11) NOT NULL,
  `nazwa_firmy` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `kraj_firmy` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `siedziba_firmy` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `producent`
--

INSERT INTO `producent` (`producent_id`, `nazwa_firmy`, `kraj_firmy`, `siedziba_firmy`) VALUES
(1, 'tymbark', 'polska', 'poznan');

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

--
-- Zrzut danych tabeli `sprzedarz`
--

INSERT INTO `sprzedarz` (`id_sprzedarzy`, `produkt`, `data_zakupu`, `ilosc`, `znizka`) VALUES
(1, 1, '2024-10-03', 3, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `towar_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `cena` double NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `producent` int(50) NOT NULL,
  `w_magazynie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `towary`
--

INSERT INTO `towary` (`towar_id`, `nazwa`, `cena`, `opis`, `producent`, `w_magazynie`) VALUES
(1, 'tymbark jabko wisnia', 2, 'fajny', 1, 100);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD PRIMARY KEY (`id_dostawy`),
  ADD KEY `towar` (`towar`);

--
-- Indeksy dla tabeli `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`producent_id`);

--
-- Indeksy dla tabeli `sprzedarz`
--
ALTER TABLE `sprzedarz`
  ADD PRIMARY KEY (`id_sprzedarzy`),
  ADD KEY `produkt` (`produkt`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`towar_id`),
  ADD KEY `producent` (`producent`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  MODIFY `id_dostawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `producent`
--
ALTER TABLE `producent`
  MODIFY `producent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `sprzedarz`
--
ALTER TABLE `sprzedarz`
  MODIFY `id_sprzedarzy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `towary`
--
ALTER TABLE `towary`
  MODIFY `towar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD CONSTRAINT `dostawy_ibfk_1` FOREIGN KEY (`towar`) REFERENCES `towary` (`towar_id`);

--
-- Ograniczenia dla tabeli `sprzedarz`
--
ALTER TABLE `sprzedarz`
  ADD CONSTRAINT `sprzedarz_ibfk_1` FOREIGN KEY (`produkt`) REFERENCES `towary` (`towar_id`);

--
-- Ograniczenia dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD CONSTRAINT `towary_ibfk_1` FOREIGN KEY (`producent`) REFERENCES `producent` (`producent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
