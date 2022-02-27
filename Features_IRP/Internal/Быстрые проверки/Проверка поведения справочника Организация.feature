﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: проверка функциональной опции Использовать организации

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка функциональной опции использовать организации в Заказе клиента
	И я закрываю все окна клиентского приложения
	И я устанавливаю в константу "UseCompanies" значение "False"
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И элемент формы "Организация" отсутствует на форме

Сценарий: Проверка заполнения справочника Организация
	И я устанавливаю в константу "UseCompanies" значение "True"
	И я закрываю сеанс текущего клиента тестирования
	Дано Я открыл новый сеанс TestClient или подключил уже существующий	
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
	И я нажимаю на кнопку с именем 'FormWrite'
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И в таблице "List" я перехожу к строке:
		| 'Наименование'        |
		| 'Тестовый контрагент' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'	

Сценарий: проверка расположения элементов в форме Организаций
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	@screenshot
	Тогда открылось окно 'Организация (создание)'
