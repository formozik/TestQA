﻿#language: ru

@tree
@Отчеты
@ФинальноеЗадание02

Переменные:
	СсылкаНаОтчет = 'e1cib/app/Отчет.ОстаткиТоваровНаСкладах' 
	ЯчейкаСДанными = 'R3C2'
	МакетОтчета = 'ОстаткиТоваров.mxl'

Контекст:
	И я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""

Функционал: тестирование отчета Остатки товаров

Как Тесировщик я хочу
протестировать работу отчета Остатки товаров
чтобы проверить что у пользователя не возникнет проблем

Сценарий: подготовительный сценарий 
	Когда экспорт основных данных
	Когда экспорт документов
	И я выполняю код встроенного языка на сервере
	"""bsl
		Документы.ПриходТовара.НайтиПоНомеру("000000005").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000005").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ПриходТовара.НайтиПоНомеру("000000027").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.РасходТовара.НайтиПоНомеру("000000004").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.РасходТовара.НайтиПоНомеру("000000005").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		Документы.ОперацияПоУчетуТоваров.НайтиПоНомеру("000000002").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Запись);
	"""

Сценарий: проверка отчета Остатки товаров
	Дано Я открываю навигационную ссылку "$СсылкаНаОтчет$"
	И я нажимаю на кнопку 'Выбрать вариант...'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление' |
		| 'Основной'      |
	И в таблице "СписокНастроек" я выбираю текущую строку	
	И Пауза 20
	И я нажимаю на кнопку 'Сформировать'
	И я жду когда в табличном документе 'Результат' заполнится ячейка "$ЯчейкаСДанными$" в течение 5 секунд
	Дано Табличный документ 'Результат' равен макету "$МакетОтчета$" по шаблону
	И я закрываю все окна клиентского приложения