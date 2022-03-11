-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 11 2022 г., 16:44
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `to-do`
--

-- --------------------------------------------------------

--
-- Структура таблицы `activity`
--

CREATE TABLE `activity` (
  `id` int NOT NULL COMMENT 'Виды активности',
  `naimenovanie` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `activity`
--

INSERT INTO `activity` (`id`, `naimenovanie`) VALUES
(1, 'ogorod'),
(3, 'rabota'),
(5, 'sport'),
(7, 'ucheba'),
(9, 'sdfsdfsdfsd'),
(10, 'asdasdadasda'),
(11, 'Взять киев'),
(12, 'adasdasdasd'),
(13, '1'),
(14, '1616165'),
(15, '2'),
(16, 'Вsfsзять киевsdfsdf'),
(17, '3'),
(18, 'sfsdfsfsdfВзять киев'),
(19, '2'),
(20, 'sdfsfsfsd'),
(21, '2'),
(22, '1616165'),
(23, '3'),
(24, 'Взять киев'),
(25, '2'),
(26, '1616165'),
(27, 'dadadas'),
(28, '2'),
(29, '3');

-- --------------------------------------------------------

--
-- Структура таблицы `personal`
--

CREATE TABLE `personal` (
  `id` int NOT NULL,
  `FIO` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `personal`
--

INSERT INTO `personal` (`id`, `FIO`, `pass`) VALUES
(1, 'ValovAA', ''),
(2, 'IvanovII', ''),
(3, 'PetrovPP', ''),
(4, 'SidorovSS', ''),
(5, 'PutinVV', ''),
(7, 'GaraevAV', ''),
(8, 'BaidenAA', '123456'),
(9, 'JanefitLA', '739e3e721e774a462fb4214e88213fc7'),
(10, 'Vfafsdfsd', '739e3e721e774a462fb4214e88213fc7'),
(11, 'Vfafsdfsd', 'b3546a958b6fb34adc0c9d1e485b9ef4'),
(12, 'Vfafsdfsd', '739e3e721e774a462fb4214e88213fc7'),
(13, 'BaidenAA', '739e3e721e774a462fb4214e88213fc7'),
(14, 'BorisovAA', '739e3e721e774a462fb4214e88213fc7'),
(15, 'Morozov', '739e3e721e774a462fb4214e88213fc7');

-- --------------------------------------------------------

--
-- Структура таблицы `plane`
--

CREATE TABLE `plane` (
  `id_plan` int NOT NULL COMMENT 'План активности',
  `id_Personal` int NOT NULL,
  `naimenovanie` varchar(255) DEFAULT NULL,
  `result` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `plane`
--

INSERT INTO `plane` (`id_plan`, `id_Personal`, `naimenovanie`, `result`) VALUES
(18, 2, 'Купи молоко', 95),
(20, 1, 'Сдать экзамены', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int UNSIGNED NOT NULL,
  `task` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `task`) VALUES
(9, 'nlnkljnbjkln');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`id_plan`),
  ADD KEY `id_Personal` (`id_Personal`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Виды активности', AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `plane`
--
ALTER TABLE `plane`
  MODIFY `id_plan` int NOT NULL AUTO_INCREMENT COMMENT 'План активности', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `plane`
--
ALTER TABLE `plane`
  ADD CONSTRAINT `plane_ibfk_3` FOREIGN KEY (`id_Personal`) REFERENCES `personal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
