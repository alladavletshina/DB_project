Проект предполагает работу с базой данных PostgreSQL, включая создание, заполнение и управление данными. 
Основная цель — углубленное освоение знаний, полученных в рамках курса по базам данных.

Проект охватывает четыре разные базы данных:

- Транспортные средства;
- Автомобильные гонки;
- Бронирование отелей;
- Структура организации.

Для каждой базы данных предусмотрены следующие шаги: создание таблиц, добавление тестовых данных и выполнение различных запросов и задач.

Все представленные базы данных сопровождаются скриптами, которые автоматически создают структуру таблиц и наполняют их демонстрационными данными.

-- База данных 1. Транспортные средства (TransportDB).

Эта база данных предназначена для хранения информации о транспортных средствах, включая автомобили, мотоциклы и велосипеды. Она состоит из нескольких взаимосвязанных таблиц, каждая из которых описывает определенный аспект транспортного средства. 
Разберём каждую таблицу подробнее:

Таблица Vehicle
Назначение: Обеспечивает общую классификацию всех типов транспортных средств.

Структура:

maker: Производитель транспортного средства.
model: Модель транспортного средства. Это уникальный идентификатор, используемый как первичный ключ.
type: Тип транспортного средства, который может быть одним из трёх значений: "Car" (автомобиль), "Motorcycle" (мотоцикл) или "Bicycle" (велосипед).

Таблица Car
Назначение: Содержит подробную информацию об автомобилях.

Структура:

vin: Идентификационный номер автомобиля (VIN), уникальный для каждого автомобиля. Используется как первичный ключ.
model: Модель автомобиля, соответствующая записи в таблице Vehicle. Является внешним ключом.
engine_capacity: Объём двигателя в литрах.
horsepower: Мощность двигателя в лошадиных силах.
price: Стоимость автомобиля в долларах США.
transmission: Тип трансмиссии, который может быть либо "Automatic" (автоматическая), либо "Manual" (ручная).

Таблица Motorcycle
Назначение: Хранит детальную информацию о мотоциклах.

Структура:

vin: Идентификационный номер мотоцикла (VIN), уникальный для каждого мотоцикла. Используется как первичный ключ.
model: Модель мотоцикла, соответствующая записи в таблице Vehicle. Является внешним ключом.
engine_capacity: Объём двигателя в литрах.
horsepower: Мощность двигателя в лошадиных силах.
price: Стоимость мотоцикла в долларах США.
type: Тип мотоцикла, который может быть одним из трёх значений: "Sport" (спортивный), "Cruiser" (круизный) или "Touring" (туристический).

Таблица Bicycle
Назначение: Включает данные о велосипедах.

Структура:

serial_number: Серийный номер велосипеда, уникальный для каждого велосипеда. Используется как первичный ключ.
model: Модель велосипеда, соответствующая записи в таблице Vehicle. Является внешним ключом.
gear_count: Количество передач на велосипеде.
price: Стоимость велосипеда в долларах США.
type: Тип велосипеда, который может быть одним из трёх значений: "Mountain" (горный), "Road" (шоссейный) или "Hybrid" (гибридный).
Взаимосвязи
Таблицы Car, Motorcycle и Bicycle связаны с таблицей Vehicle через внешний ключ model, что позволяет объединить общие характеристики транспортных средств с уникальными характеристиками конкретного типа транспорта.

Связи между таблицами:

Все три таблицы — Car, Motorcycle и Bicycle — связаны с таблицей Vehicle через поле model. Это гарантирует, что любая модель, упомянутая в этих таблицах, уже зарегистрирована в общей таблице Vehicle.
Таблицы Car, Motorcycle и Bicycle дополняют основную таблицу Vehicle, добавляя уникальные подробности для каждого вида транспорта, такие как объём двигателя для автомобилей и мотоциклов или количество передач для велосипедов.

1. скрипт создания таблиц TransportDB/Creation_tables_TransportDB.sql
2. скрипт создания наполнения данными TransportDB/insert_into_tables_TransportDB.sql

Задача № 1
Скрипт размещен TransportDB/task_1_TransportDB.sql

Задача № 2
Скрипт размещен TransportDB/task_2_TransportDB.sql


-- База данных 2. Автомобильные гонки (CarRacingDB).

Данная база данных предназначена для хранения информации об автомобильных гонках и связанных с ними автомобилях. 
Рассмотрим каждую таблицу отдельно:

Таблица Classes
Назначение: Эта таблица содержит информацию о различных классах автомобилей, участвующих в гонках.

Структура:

class: Название класса автомобиля (например, "Formula 1", "MotoGP"). Это уникальный идентификатор класса, используется как первичный ключ.
type: Тип класса ("Racing" или "Street"), определяющий назначение автомобиля.
country: Страна происхождения класса автомобилей.
numDoors: Количество дверей у автомобилей данного класса.
engineSize: Размер двигателя в литрах.
weight: Вес автомобиля в килограммах.

Таблица Cars
Назначение: Хранит информацию о конкретных моделях автомобилей, участвовавших в гонках.

Структура:

name: Название модели автомобиля (например, "Ferrari F2004"). Используется как первичный ключ.
class: Класс, к которому относится автомобиль (ссылается на таблицу Classes).
year: Год выпуска автомобиля.

Таблица Races
Назначение: Содержит информацию о проведенных гонках.

Структура:

name: Название гонки (например, "Monaco Grand Prix"). Используется как первичный ключ.
date: Дата проведения гонки.

Таблица Results
Назначение: Хранит результаты участия автомобилей в гонках.

Структура:

car: Модель автомобиля, участвующего в гонке (ссылается на таблицу Cars).
race: Гонка, в которой участвовал автомобиль (ссылается на таблицу Races).
position: Позиция, занятая автомобилем в данной гонке.
Таким образом, эта база данных позволяет хранить информацию о различных классах автомобилей, конкретных моделях, проводимых гонках и результатах участия автомобилей в этих гонках.

Связи между таблицами:

Таблица Cars устанавливает связь с таблицей Classes, объединяя автомобили с их соответствующими классами.
Таблица Results соединяет автомобили с гонками, показывая результаты каждого автомобиля в определенной гонке. Ссылки на таблицы Cars и Races поддерживают целостность и согласованность данных.

1. скрипт создания таблиц CarRacingDB/Creation_tables_CarRacingDB.sql
2. скрипт создания наполнения данными CarRacingDB/insert_into_tables_CarRacingDB.sql

Задача № 1
Скрипт размещен CarRacingDB/task_1_CarRacingDB.sql

Задача № 2
Скрипт размещен CarRacingDB/task_2_CarRacingDB.sql

Задача № 3
Скрипт размещен CarRacingDB/task_3_CarRacingDB.sql

Задача № 4
Скрипт размещен CarRacingDB/task_4_CarRacingDB.sql

Задача № 5
Скрипт размещен CarRacingDB/task_5_CarRacingDB.sql


--База данных 3. Бронирование отелей (BookingDB).

Эта база данных предназначена для бронирования гостиниц и управления информацией о клиентах, номерах и самих гостиницах. 
Разберем каждую таблицу подробнее:

Таблица Hotel
Назначение: Хранит информацию о гостиницах.

Структура:

ID_hotel: Уникальный идентификатор гостиницы, автоматически генерируется системой (используется тип SERIAL).
name: Название гостиницы (строка длиной до 255 символов, обязательное поле).
location: Местоположение гостиницы (строка длиной до 255 символов, обязательное поле).

Таблица Room
Назначение: Содержит данные о номерах в гостинице.

Структура:

ID_room: Уникальный идентификатор номера, автоматически генерируемый (SERIAL).
ID_hotel: Ссылка на отель, которому принадлежит номер (является внешним ключом, ссылающимся на таблицу Hotel).
room_type: Тип номера (строка длиной до 20 символов, обязательная информация). Допустимые значения: 'Single' (одноместный), 'Double' (двухместный), 'Suite' (люкс).
price: Цена номера (десятичное число с точностью до двух знаков после запятой, обязательное поле).
capacity: Вместимость номера (целое число, обязательное поле).

Таблица Customer
Назначение: Хранит информацию о клиентах, которые делают бронь.

Структура:

ID_customer: Уникальный идентификатор клиента, автоматически генерирующийся (SERIAL).
name: Имя клиента (строка длиной до 255 символов, обязательное поле).
email: Электронная почта клиента (уникальная строка длиной до 255 символов, обязательное поле).
phone: Номер телефона клиента (строка длиной до 20 символов, обязательное поле).

Таблица Booking
Назначение: Управляет информацией о забронированных номерах.

Структура:

ID_booking: Уникальный идентификатор бронирования, автоматически генерируемый (SERIAL).
ID_room: Ссылка на номер, который был забронирован (внешний ключ, ссылается на таблицу Room).
ID_customer: Ссылка на клиента, сделавшего бронирование (внешний ключ, ссылается на таблицу Customer).
check_in_date: Дата заселения (обязательное поле типа DATE).
check_out_date: Дата выселения (обязательное поле типа DATE).

Связи между таблицами:
- Таблица Room соединена с таблицей Hotel, устанавливая связь между номерами и относящимися к ним гостиницами.
- Таблица Booking объединяет номера и клиентов, предоставляя сведения о том, какие клиенты забронировали конкретные номера.
- Внешние ключи, используемые в таблицах Room и Booking, обеспечивают корректность данных, гарантируя, что все ссылки на отели, номера и клиентов являются правильными.

1. скрипт создания таблиц BookingDB/Creation_tables_BookingDB.sql
2. скрипт создания наполнения данными BookingDB/insert_into_tables_BookingDB.sql

Задача № 1
Скрипт размещен BookingDB/task_1_BookingDB.sql

Задача № 2
Скрипт размещен BookingDB/task_2_BookingDB.sql

Задача № 3
Скрипт размещен BookingDB/task_3_BookingDB.sql


-- База данных 4. Структура организации (CompanyOrganizationDB).

Эта база данных предназначена для управления данными о сотрудниках, ролях, департаментах, проектах и задачах внутри организации. Рассмотрим каждую таблицу отдельно:

Таблица Departments
Назначение: Хранит информацию о департаментах (или подразделениях) компании.

Структура:

DepartmentID: Уникальный идентификатор департамента, автоматически генерируется.
DepartmentName: Название департамента.

Таблица Roles
Назначение: Хранит информацию о должностных обязанностях или ролях сотрудников.

Структура:

RoleID: Уникальный идентификатор роли, автоматически генерируется.
RoleName: Название должности или роли сотрудника.

Таблица Employees
Назначение: Хранит информацию о сотрудниках компании.

Структура:

EmployeeID: Уникальный идентификатор сотрудника, автоматически генерируется.
Name: Имя сотрудника.
Position: Должность сотрудника (необязательно).
ManagerID: Идентификатор менеджера, которому подчиняется сотрудник (если есть). При удалении менеджера, ссылка на него становится NULL.
DepartmentID: Идентификатор департамента, к которому относится сотрудник. При удалении департамента, сотрудник удаляется вместе с ним.
RoleID: Идентификатор роли, которую исполняет сотрудник. При удалении роли, ссылка на неё становится NULL.

Таблица Projects
Назначение: Хранит информацию о проектах, над которыми работают сотрудники.

Структура:

ProjectID: Уникальный идентификатор проекта, автоматически генерируется.
ProjectName: Название проекта.
StartDate: Дата начала проекта.
EndDate: Дата окончания проекта.
DepartmentID: Идентификатор департамента, которому принадлежит проект. При удалении департамента, проект удаляется вместе с ним.

Таблица Tasks
Назначение: Хранит информацию о задачах, назначенных сотрудникам в рамках проектов.

Структура:

TaskID: Уникальный идентификатор задачи, автоматически генерируется.
TaskName: Название задачи.
AssignedTo: Идентификатор сотрудника, которому назначена задача. При удалении сотрудника, ссылка на него становится NULL.
ProjectID: Идентификатор проекта, к которому относится задача. При удалении проекта, задача удаляется вместе с ним.

Связи между таблицами:
- Таблицы Employees, Projects и Tasks объединены внешними ключами, благодаря чему возможно объединение данных о работниках, выполняемых ими заданиях и проектах.
- Поле ManagerID в таблице Employees помогает сформировать иерархическую структуру руководства, связывая работников с их непосредственными начальниками.
- Поле DepartmentID соединяет сотрудников с отделами, а также проекты с организационной структурой внутри определённого подразделения.
- Поле RoleID привязывает сотрудников к их должностям, позволяя классифицировать их роли и обязанности в рамках компании.

1. скрипт создания таблиц CompanyOrganizationDB/Creation_tables_CompanyOrganizationDB.sql
2. скрипт создания наполнения данными CompanyOrganizationDB/insert_into_tables_CompanyOrganizationDB.sql

Задача № 1
Скрипт размещен CompanyOrganizationDB/task_1_CompanyOrganizationDB.sql

Задача № 2
Скрипт размещен CompanyOrganizationDB/task_2_CompanyOrganizationDB.sql

Задача № 3
Скрипт размещен CompanyOrganizationDB/task_3_CompanyOrganizationDB.sql
