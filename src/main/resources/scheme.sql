-- noinspection SqlDialectInspectionForFile

DROP DATABASE IF EXISTS theater_course;
CREATE DATABASE theater_course;

\c theater_course
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS state
(
	state_id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS location
(
	location_id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	state int REFERENCES state(state_id)
);

CREATE TABLE IF NOT EXISTS contragent_category
(
	contragent_category_id SERIAL PRIMARY KEY,
	name varchar(20)
);

CREATE TABLE IF NOT EXISTS product_category
(
	product_category_id SERIAL PRIMARY KEY,
	name varchar(20)
);

CREATE TABLE IF NOT EXISTS operation_category
(
	operation_category_id SERIAL PRIMARY KEY,
	name varchar(20)
);

CREATE TABLE IF NOT EXISTS agent
(
	agent_id SERIAL PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	phone varchar(10),
	mail varchar(100) NOT NULL,
	edrpu varchar(10) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS contragent
(
	contragent_id SERIAL PRIMARY KEY,
	agent int REFERENCES agent(agent_id),
	category int REFERENCES contragent_category(contragent_category_id),
	location int REFERENCES location(location_id)
);

CREATE TABLE IF NOT EXISTS product
(
	product_id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	description text,
	price int,
	category int REFERENCES product_category(product_category_id),
	location int REFERENCES location(location_id)
);

CREATE TABLE IF NOT EXISTS operation
(
	operation_id SERIAL PRIMARY KEY,
	order_date DATE,
	perform_date DATE CHECK (operation.order_date < operation.perform_date),
	category int REFERENCES operation_category(operation_category_id),
	product int REFERENCES product(product_id),
	contragent int REFERENCES contragent(contragent_id)
);

INSERT INTO state (state_id, name) VALUES (DEFAULT, 'Украина');
INSERT INTO state (state_id, name) VALUES (DEFAULT, 'Великобритания');
INSERT INTO state (state_id, name) VALUES (DEFAULT, 'Германия');

INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Киев', 1);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Одесса', 1);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Львов', 1);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Берлин', 3);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Мюнхен', 3);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Дрезден', 3);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Манчестер', 2);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Лондон', 2);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Бирмингем', 2);
INSERT INTO location (location_id, name, state) VALUES (DEFAULT, 'Лидс', 2);

INSERT INTO contragent_category (contragent_category_id, name) VALUES (DEFAULT, 'Продавец');
INSERT INTO contragent_category (contragent_category_id, name) VALUES (DEFAULT, 'Покупатель');
INSERT INTO contragent_category (contragent_category_id, name) VALUES (DEFAULT, 'Изготовитель');

INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Ткань');
INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Костюм');
INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Материал');
INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Декорация');
INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Услуга');
INSERT INTO product_category (product_category_id, name) VALUES (DEFAULT, 'Другое');

INSERT INTO operation_category (operation_category_id, name) VALUES (DEFAULT, 'Купля');
INSERT INTO operation_category (operation_category_id, name) VALUES (DEFAULT, 'Продажа');

INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Георгий', 'Давыдов', '0987654321', 'g.davydov@gmail.com', '9207719657');
INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Борис', 'Новиков', '0745154168', 'b.novykov@gmail.com', '4745154168');
INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Святослав', 'Шарапов', '0475638956', 's.sharapov@gmail.com', '5748562963');
INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Дмитрий', 'Шестаков', '0674523098', 'd.shestakov@gmail.com', '5729563851');
INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Владислав', 'Федотов', '0875642766', 'v.fedotov@gmail.com', '1243568709');
INSERT INTO agent (agent_id, first_name, last_name, phone, mail, edrpu) VALUES (DEFAULT, 'Иван', 'Кошелев', '0503690911', 'i.koshelev@gmail.com', '8465274900');

INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 1, 1, 1);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 1, 2, 1);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 2, 1, 3);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 3, 1, 4);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 4, 1, 5);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 4, 2, 6);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 4, 3, 7);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 5, 1, 8);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 6, 1, 9);
INSERT INTO contragent (contragent_id, agent, category, location) VALUES (DEFAULT, 6, 2, 10);

INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Хлопок', 'Натуральный цвет', 50, 1, 9);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Сталь', 'Тут будет находится описание товара', 140, 3, 4);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Освещение', 'Фоновое и направленное', 500, 6, 8);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Настройка аудио', 'Анализ звучания, поиск резонансных частот', 30, 5, 7);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Юбка сатиновая', '35 размер', 25, 2, 6);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Глина', 'Тут будет находится описание товара', 70, 3, 5);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Вельвет', 'Тут будет находится описание товара', 100, 1, 5);
INSERT INTO product (product_id, name, description, price, category, location) VALUES (DEFAULT, 'Крючки для гардеробной', 'Стальные матовые', 200, 6, 2);

INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-04-21', '2015-05-21', 1, 1, 9);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-05-14', '2015-06-14', 1, 4, 4);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-06-08', '2015-07-08', 1, 6, 6);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-07-13', '2015-08-13', 1, 5, 5);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-08-19', '2015-09-19', 2, 3, 3);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2015-09-24', '2015-10-24', 2, 7, 7);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2016-01-05', '2016-02-05', 1, 1, 1);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2016-01-18', '2016-02-18', 1, 3, 2);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2016-04-20', '2016-04-25', 1, 8, 8);
INSERT INTO operation (operation_id, order_date, perform_date, category, product, contragent) VALUES (DEFAULT, '2016-04-20', '2016-04-30', 1, 7, 8);