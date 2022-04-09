﻿#language: ru
@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: одинаковые блоки шагов

Как Тестировщик я хочу
создать экспортные сценарии на одинаковые блоки шагов
чтобы не дублировать части сценариев

Сценарий: заполнить новый документ Продажа товара данными
	* Создаем новый документ
		И В командном интерфейсе я выбираю 'Продажи' 'Продажа'
	* Подготавливаем данные
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'Организация без валютного'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Покупатель с розничной'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Кроссовки (вид товар)'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Ботинки (вид товар)'
		И я перехожу к следующему реквизиту
		И в таблице "Товары" я завершаю редактирование строки