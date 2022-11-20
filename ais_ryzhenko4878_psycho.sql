-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Ноя 20 2022 г., 10:55
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_ryzhenko4878_psycho`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL COMMENT 'id категории',
  `name` varchar(255) NOT NULL COMMENT 'название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Общение'),
(2, 'Помощь'),
(3, 'Не знаю'),
(4, 'Что-то');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL COMMENT ' id клиента',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'имя клиента',
  `Birth` date DEFAULT NULL COMMENT 'Дата рождения',
  `phone_numb` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `Birth`, `phone_numb`) VALUES
(1, 'Сергеев С.С', '2022-11-02', '123456789'),
(2, 'Александров А.А', '2022-11-23', '123123123');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `sum` int NOT NULL COMMENT 'Сумма',
  `status` int NOT NULL COMMENT 'Статус оплаты',
  `type` int NOT NULL COMMENT 'Способ оплаты'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `sum`, `status`, `type`) VALUES
(1, 5000, 1, 2),
(2, 5322, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Payment status`
--

CREATE TABLE `Payment status` (
  `id` int NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Payment status`
--

INSERT INTO `Payment status` (`id`, `status`) VALUES
(1, 'OK'),
(2, 'Error');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int NOT NULL,
  `payment_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `payment_type`
--

INSERT INTO `payment_type` (`id`, `payment_type`) VALUES
(1, 'Наличный'),
(2, 'Безналичный');

-- --------------------------------------------------------

--
-- Структура таблицы `specialist`
--

CREATE TABLE `specialist` (
  `id` int NOT NULL COMMENT 'id специалиста',
  `name` varchar(255) NOT NULL,
  `phone_number` text NOT NULL COMMENT 'Номер телефона'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Информация о специалисте';

--
-- Дамп данных таблицы `specialist`
--

INSERT INTO `specialist` (`id`, `name`, `phone_number`) VALUES
(1, 'Петров П.П', '123123123123'),
(2, 'Егоров Е.Е.', '14342134124');

-- --------------------------------------------------------

--
-- Структура таблицы `Visit`
--

CREATE TABLE `Visit` (
  `id` int NOT NULL,
  `next_visit` int DEFAULT NULL COMMENT 'id результатов встречи',
  `day` date NOT NULL COMMENT 'Дата приема',
  `time` time(5) NOT NULL COMMENT 'Время приема',
  `id_cli` int NOT NULL COMMENT 'id специалиста',
  `id_med` int NOT NULL COMMENT 'id клиента',
  `category` int NOT NULL COMMENT 'Категория встречи',
  `payment_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Visit`
--

INSERT INTO `Visit` (`id`, `next_visit`, `day`, `time`, `id_cli`, `id_med`, `category`, `payment_id`) VALUES
(1, 2, '2022-11-02', '14:52:51.00000', 2, 1, 1, 1),
(2, NULL, '2022-11-09', '15:53:51.04700', 2, 1, 2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `Payment status`
--
ALTER TABLE `Payment status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Visit`
--
ALTER TABLE `Visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `id_cli` (`id_cli`),
  ADD KEY `id_med` (`id_med`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `next_visit` (`next_visit`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id категории', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT ' id клиента', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Payment status`
--
ALTER TABLE `Payment status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id специалиста', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Visit`
--
ALTER TABLE `Visit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`status`) REFERENCES `Payment status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`type`) REFERENCES `payment_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Visit`
--
ALTER TABLE `Visit`
  ADD CONSTRAINT `Visit_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Visit_ibfk_2` FOREIGN KEY (`id_cli`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Visit_ibfk_3` FOREIGN KEY (`id_med`) REFERENCES `specialist` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Visit_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Visit_ibfk_5` FOREIGN KEY (`next_visit`) REFERENCES `Visit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
