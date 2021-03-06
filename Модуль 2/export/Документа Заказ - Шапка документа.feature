#language: ru

@tree
@ExportScenarios
@IgnoreOnClMainBuild

Функционал: Тестирование шапки документа Заказ

Как Администратор я хочу
запонить шапку документа заказ разными вариантами данных 
чтобы проверить поведение шапки документа Заказ 

Сценарий: Первоначальное запонение данных для теста
	И перезаполнение констант для тестирования документ Заказ
	И подготовка данных для тестирования документ Заказ

@ТипШага: Тест шапки документа Заказ при значении константы УчетПоСкладам значением False
@Описание: Экспортный сценарий проверки заполнения шапки документа Заказ при значении константы УчетПоСкладам значением False	
@ПримерИспользования: И выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением False	
Сценарий: выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением False
*  Подготовка данных   
//	И я перезаполняю константу "УчетПоСкладам" значением "False"
	И В командном интерфейсе я выбираю 'Предприятие' 'Общие настройки'
	Тогда открылось окно 'Общие настройки'
	И я снимаю флаг 'Учет по складам'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Общие настройки *' в течение 20 секунд		
* Создание нового документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Проверка недоступности поля Склад	
	И элемент формы "Склад" отсутствует на форме
* Закрываем окно Заказ без сохранения данных
	И Я закрываю окно 'Заказ (создание)'

@ТипШага: Тест шапки документа Заказ при значении константы УчетПоСкладам значением True
@Описание: Экспортный сценарий проверки заполнения шапки документа Заказ при значении константы УчетПоСкладам значением True	
@ПримерИспользования: И выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением True			
Сценарий: выполняю тест шапки документа Заказ при значении константы УчетПоСкладам значением True
*  Подготовка данных 
//	И я перезаполняю константу "УчетПоСкладам" значением "True"
	И В командном интерфейсе я выбираю 'Предприятие' 'Общие настройки'
	Тогда открылось окно 'Общие настройки'
	И я устанавливаю флаг 'Учет по складам'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Общие настройки *' в течение 20 секунд		
* Создание нового документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
* Доступность поля Склад	
	И элемент формы "Склад" присутствует на форме
	И элемент формы "Склад" доступен
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад'
* Отображение Валюты взаиморасчетов для организации с валютным учетом	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'Организация с валютным уч'
	И элемент формы "Валюта взаиморасчетов" присутствует на форме
	И элемент формы "Валюта взаиморасчетов" доступен
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'USD'	
	И я запоминаю значение поля с именем 'Валюта' как 'Валюта'	
* Скрытие Валюты взаиморасчетов при очистке поля Организация
	И я нажимаю кнопку очистить у поля с именем "Организация"
	И элемент формы "Валюта взаиморасчетов" отсутствует на форме	
* Скрытие Валюты взаиморасчетов для без валютного учета	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'Организация без валютного'
	И элемент формы "Валюта взаиморасчетов" отсутствует на форме
* Значения Валюты взаиморасчетов для организации с валютным учетом после выбора организации без валютного учета не очищается
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'Организация с валютным уч'
	И элемент формы "Валюта взаиморасчетов" присутствует на форме
	И элемент формы "Валюта взаиморасчетов" доступен
	И элемент формы 'Валюта взаиморасчетов' стал равен '$Валюта$'	
* Заполнение предопреленного вида цены контрагента при выборе Контрагента
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Поставщик с Оптовой ценой '
	И элемент формы 'Вид цен' стал равен 'Оптовая'
* Изменение предопреленного вида цены контрагента при выборе Контрагента с другим предопределеннымвидом цены
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Поставщик с Закупочной ценой'
	И элемент формы 'Вид цен' стал равен 'Закупочная'
* Заполняем табличную часть для проверки пересчета цены при изменении Вида цены
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Номенклатура - Товар'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице 'Товары' поле 'Цена' имеет значение '12 000,00'	
* Изменяем Вид цены на Оптовая и проверяем изменение цены
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
	И в таблице 'Товары' поле 'Цена' имеет значение '18 000,00'		
* Закрываем окно Заказ без сохранения данных
	И Я закрываю окно 'Заказ (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'