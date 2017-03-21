-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 21 2017 г., 22:35
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `loadlevel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `maps`
--

INSERT INTO `maps` (`id`, `name`) VALUES
(1, 'Forest');

-- --------------------------------------------------------

--
-- Структура таблицы `objects`
--

CREATE TABLE `objects` (
  `id` int(11) NOT NULL,
  `maps_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `objects`
--

INSERT INTO `objects` (`id`, `maps_id`, `type`, `x`, `y`) VALUES
(52, 1, 1, 477, 58),
(53, 1, 1, 206, 65),
(54, 1, 1, 79, 65),
(55, 1, 1, 600, 128),
(56, 1, 1, 555, 68),
(57, 1, 1, 304, 79),
(58, 1, 2, 723, 122),
(59, 1, 2, 475, 133),
(60, 1, 2, 360, 93),
(61, 1, 2, 268, 125),
(62, 1, 2, 158, 125),
(63, 1, 2, 57, 131),
(64, 1, 2, 30, 90),
(65, 1, 1, 600, 330),
(66, 1, 1, 460, 445),
(67, 1, 1, 270, 451),
(68, 1, 1, 126, 380),
(69, 1, 1, 155, 255),
(70, 1, 1, 362, 255),
(71, 1, 1, 352, 354),
(72, 1, 1, 474, 340),
(73, 1, 1, 543, 246),
(74, 1, 1, 419, 187),
(75, 1, 1, 298, 196),
(76, 1, 1, 259, 287),
(77, 1, 1, 263, 366),
(78, 1, 1, 730, 75),
(79, 1, 1, 931, 182),
(80, 1, 1, 825, 331),
(81, 1, 1, 731, 342),
(82, 1, 1, 739, 193),
(83, 1, 1, 1010, 67),
(84, 1, 1, 826, 257),
(85, 1, 1, 1075, 340),
(86, 1, 1, 1022, 216),
(87, 1, 1, 936, 329),
(88, 1, 1, 868, 82),
(89, 1, 2, 834, 157),
(90, 1, 2, 705, 241),
(91, 1, 2, 644, 310),
(92, 1, 2, 432, 341),
(93, 1, 2, 319, 306),
(94, 1, 2, 232, 241),
(95, 1, 2, 213, 341),
(96, 1, 2, 86, 296),
(97, 1, 2, 62, 162),
(98, 1, 2, 25, 258),
(99, 1, 2, 169, 167),
(100, 1, 2, 81, 238),
(101, 1, 2, 39, 356),
(102, 1, 3, 657, 457),
(103, 1, 3, 651, 396),
(104, 1, 3, 648, 344),
(105, 1, 3, 646, 291),
(106, 1, 3, 644, 243),
(107, 1, 3, 651, 186),
(108, 1, 3, 645, 122),
(109, 1, 3, 641, 78),
(110, 1, 3, 643, 29),
(111, 1, 3, 644, 1),
(112, 1, 2, 1069, 159);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`) VALUES
(1, 'admin', '123456');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `objects`
--
ALTER TABLE `objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
