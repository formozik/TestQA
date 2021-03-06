#language: ru

@tree
@Отчеты

Функционал: тестирование отчетов

Как Тесировщик я хочу
протестировать отчеты
чтобы проверить что у пользователя не возникнет проблем

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _0901 подготовительный сценарий (тестирование отчетов)
	Когда экспорт основных данных
	Когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
	"""bsl
		Документы.PurchaseOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.PurchaseInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
	"""

Сценарий: _0902 проверка отчета D0010 Информация по товарам
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D0010_ItemsInfo"
	И я нажимаю на кнопку 'Сформировать'
	Дано Табличный документ "Result" равен макету "Информация по товарам 1" по шаблону

Сценарий: _0903 проверка отчета по Закупкам
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D1001_Purchases"
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе "Result" заполнится ячейка "R2C1" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Закупки 1" по шаблону

	
