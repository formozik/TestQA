﻿#language: ru

@tree
@ДвиженияДокументов

Функционал: проверка движений документа Поступление товаров

Как Тестировщик я хочу
проверить движения документа Поступления товаров 
чтобы проверить что документ делает движения по нужным регистрам

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0501 подготовительный сценарий (движения документа Поступление товаров)
	Когда экспорт основных данных
	Когда загрузка документа Поступление товаров и услуг
	И я выполняю код встроенного языка на сервере
		|Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение); |
	Тогда не появилось окно предупреждения системы

Сценарий: _0502 проверка движений документа Поступление товаров по регистру R1001 Закупки
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку 'Движения документа'
	И в табличном документе 'ResultTable' я перехожу к ячейке "R1C1"
	И из выпадающего списка "Регистр" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку 'Сформировать'
	Тогда табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '11.02.2022 15:07:16' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Услуга'                  | 'ddf482a9-5b6a-4758-b148-71884fd7f318' | 'Да'                |
		| ''                                                         | '11.02.2022 15:07:16' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Услуга'                  | 'ddf482a9-5b6a-4758-b148-71884fd7f318' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Услуга'                  | 'ddf482a9-5b6a-4758-b148-71884fd7f318' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Услуга'                  | 'ddf482a9-5b6a-4758-b148-71884fd7f318' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Услуга'                  | 'ddf482a9-5b6a-4758-b148-71884fd7f318' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Товар без характеристик' | 'fe9e9b56-f3e7-4920-a98a-1cc1d1778fd6' | 'Да'                |
		| ''                                                         | '11.02.2022 15:07:16' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Товар без характеристик' | 'fe9e9b56-f3e7-4920-a98a-1cc1d1778fd6' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Товар без характеристик' | 'fe9e9b56-f3e7-4920-a98a-1cc1d1778fd6' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Товар без характеристик' | 'fe9e9b56-f3e7-4920-a98a-1cc1d1778fd6' | 'Нет'               |
		| ''                                                         | '11.02.2022 15:07:16' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | 'Товар без характеристик' | 'fe9e9b56-f3e7-4920-a98a-1cc1d1778fd6' | 'Нет'               |
	И я закрываю все окна клиентского приложения

Сценарий: _0503 проверка движений документа Поступление товаров по регистру R1021 Взаиморасчеты с поставщиками
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку 'Движения документа'
	И в табличном документе 'ResultTable' я перехожу к ячейке "R1C1"
	И из выпадающего списка "Регистр" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
	И я нажимаю на кнопку 'Сформировать'
	И табличный документ "ResultTable" содержит строки по шаблону:
		| 'Поступление товаров и услуг 1 001 от 11.02.2022 15:07:16' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
		| ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
		| ''                                                         | 'Приход'      | '*'                   | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
		| ''                                                         | 'Приход'      | '*'                   | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '11.02.2022 15:07:16' | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '11.02.2022 15:07:16' | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '11.02.2022 15:07:16' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	И я закрываю все окна клиентского приложения