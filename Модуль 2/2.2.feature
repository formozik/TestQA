﻿#language: ru

@tree

Функционал: проверка заполнение шапки и расчета поля Количество (итог) документа Заказ

Как Администратор я хочу
запонить шапку документа заказ разными вариантами данных и изменить количество для номенклатыры с разным видом в документе Заказ (подсистема Продажи) 
чтобы проверить корректность поведения документа Заказ (подсистема Продажи) 

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка заполнение шапки и расчета поля Количество (итог)

* Первоначальное запонение данных для теста
	И перезаполнение констант для тестирования документ Заказ
	И подготовка данных для тестирования документ Заказ
	И выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением False
	И выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением True
	И выполняю тест проверка корректности расчета поля Количество (итог) документа Заказ