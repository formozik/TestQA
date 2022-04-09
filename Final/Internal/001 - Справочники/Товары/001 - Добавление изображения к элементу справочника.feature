﻿#language: ru

@tree
@СправочникТовары
@ФинальноеЗадание01

Функционал: Проверка возможности прикрепления картинок к элементам в справочнике Товары

Как Пользователь я хочу
добавить изображение к элементу справочника Товары 
чтобы проверить возможность прикрепления файла картинки 
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка данных для тестирования
	Когда Экспорт основных данных

Сценарий: Прикрепления файла картинки
	* Открываем загруженный элемент справочника Товары
		Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca1000d8843cd1b11dc8eacd471d6c7"
	* Открываем форму выбора файлов
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	* Создаем новый элемент справочника ХранимыеФайлы
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		И я запоминаю значение выражения 'Босоножки' в переменную "Наименование"
		И в поле с именем 'Наименование' я ввожу текст '$Наименование$'
		И я выбираю файл "$КаталогПроекта$\Files\TestImage.jpg"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'	
		И я закрываю окно '$Наименование$ (Файл)'	
	* Выбираем созданный элемент
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
	* Проверяем отображение добавленного элемента справочника ХранимыеФайлы на форме элемента Товары
		И В текущем окне я нажимаю кнопку командного интерфейса 'Файлы'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| '$Наименование$' |
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	* Записываем данные и формируем скриншот
		@screenshot
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
	* Открываем форму выбора файлов и переходим к добавленному файлу изображения
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| '$Наименование$' |
	* Удаляем добавленное изображение
		И я нажимаю на кнопку с именем 'ФормаУдалить'
		И я нажимаю на кнопку с именем 'Button0'
	* Закрываем окно выбора файла и очищаем информацию о пути к файлу
		И я закрываю окно 'Файлы'
		И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
	* Записываем и закрываем окно элемента справочника Товары
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Босоножки (Товар) *' в течение 20 секунд