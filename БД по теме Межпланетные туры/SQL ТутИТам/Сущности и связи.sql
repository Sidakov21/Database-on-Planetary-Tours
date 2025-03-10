CREATE TABLE Planets (
    PlanetID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор планеты
    Name NVARCHAR(100) NOT NULL,			-- Название планеты
    Coordinates NVARCHAR(100),				-- Координаты планеты в галактике
    Type NVARCHAR(50),						-- Тип планеты (например, каменистая, газовый гигант и т. д.)
    Features NVARCHAR(255)					-- Особенности планеты (наличие атмосферы, обитаемость и т. д.)
);

CREATE TABLE Transport (
    TransportID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор транспорта
    Model NVARCHAR(100),						-- Модель корабля
    Capacity INT,								-- Вместимость корабля (число пассажиров)
    Speed DECIMAL(18, 2),						-- Скорость корабля
    SpecialConditions NVARCHAR(255)				-- Особые условия (например, "каюты с искусственной гравитацией")
);

CREATE TABLE Tours (
    TourID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор тура
    Route NVARCHAR(255),					-- Список планет, через которые проходит маршрут (например, разделенные запятой)
    Duration INT,							-- Продолжительность тура (в днях)
    Price DECIMAL(18, 2),					-- Стоимость тура
    Difficulty NVARCHAR(50),				-- Сложность тура ("для новичков", "для опытных")  
);

CREATE TABLE Tourists (
    TouristID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор туриста
    Name NVARCHAR(100) NOT NULL,			-- Имя туриста
    Age INT,								-- Возраст туриста
    TrainingLevel NVARCHAR(50),				-- Уровень подготовки (например, "начинающий", "опытный")
    Preferences NVARCHAR(255)				-- Предпочтения туриста (например, "экстремальные условия", "комфорт")
);




CREATE TABLE Tour_Planets (
    TourID INT,										-- Идентификатор тура
    PlanetID INT,									-- Идентификатор планеты

    FOREIGN KEY (TourID) REFERENCES Tours(TourID), -- Внешний ключ на таблицу "Туры"
    FOREIGN KEY (PlanetID) REFERENCES Planets(PlanetID), -- Внешний ключ на таблицу "Планеты"
    PRIMARY KEY (TourID, PlanetID)					-- Композитный ключ для связи туров и планет
);

CREATE TABLE Tourist_Tours (
    TouristID INT,									-- Идентификатор туриста
    TourID INT,										-- Идентификатор тура

    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID), -- Внешний ключ на таблицу "Туристы"
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),			-- Внешний ключ на таблицу "Туры"
    PRIMARY KEY (TouristID, TourID)							-- Композитный ключ для связи туристов и туров
);

CREATE TABLE Tour_Transport (
    TourID INT,										-- Идентификатор тура
    TransportID INT,								-- Идентификатор транспорта

    FOREIGN KEY (TourID) REFERENCES Tours(TourID), -- Внешний ключ на таблицу "Туры"
    FOREIGN KEY (TransportID) REFERENCES Transport(TransportID), -- Внешний ключ на таблицу "Транспорт"
    PRIMARY KEY (TourID, TransportID)			-- Композитный ключ для связи туров и транспорта
);


