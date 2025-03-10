----Автоматическое уведомление, если турист пытается забронировать тур, 
----который ему не подходит (например, из-за уровня подготовки).

--CREATE PROC AddBooking
--    @TouristID INT,
--    @TourID INT
--AS
--BEGIN
--    -- Проверяем соответствие уровня подготовки туриста сложности тура
--    DECLARE @TourDifficulty NVARCHAR(50);
--    DECLARE @TouristPreparationLevel NVARCHAR(50);

--    -- Получаем сложность тура
--    SET @TourDifficulty = (
--        SELECT Difficulty
--        FROM Tours
--        WHERE TourID = @TourID
--    );

--    -- Получаем уровень подготовки туриста
--    SET @TouristPreparationLevel = (
--        SELECT [TrainingLevel]
--        FROM Tourists
--        WHERE TouristID = @TouristID
--    );

--    -- Сравниваем сложность тура и уровень подготовки туриста
--    IF (@TourDifficulty = 'Только для опытных' AND @TouristPreparationLevel = 'Новичок')
--    BEGIN
--        -- Если тур слишком сложен, отклоняем бронирование
--        PRINT 'Ошибка: Тур слишком сложен для уровня подготовки туриста.';
--        RETURN;
--    END;

--    -- Если проверка пройдена, добавляем бронирование
--    INSERT INTO Tourist_Tours (TouristID, TourID)
--    VALUES (@TouristID, @TourID);

--    PRINT 'Бронирование успешно добавлено.';
--END;

--EXEC AddBooking @TouristID = 1, @TourID = 2;	--Тур слишком сложен для уровня подготовки туриста.;

--EXEC AddBooking @TouristID = 1, @TourID = 1;	  --Бронирование успешно добавлено.


--Пересчет стоимости тура, 
--если изменяется количество туристов (например, с учетом групповых скидок).

--CREATE TRIGGER trg_UpdateTourPrice
--ON Tourist_Tours
--AFTER INSERT, DELETE
--AS
--BEGIN
--    DECLARE @TourID INT;
--    DECLARE @TouristCount INT;
--    DECLARE @NewPrice DECIMAL(18, 2);
    
--    -- Получаем TourID (поскольку триггер срабатывает на добавление или удаление, берем значение из Tourist_Tours)
--    -- В случае удаления туристов, TourID и количество берутся из Tourist_Tours.
--    SELECT @TourID = TourID FROM [dbo].[Tourist_Tours];
    
--    -- Подсчитываем количество туристов для данного тура
--    SELECT @TouristCount = COUNT(*) FROM Tourist_Tours WHERE TourID = @TourID;

--    -- Определяем новую цену в зависимости от количества туристов
--    IF (@TouristCount > 20)
--    BEGIN
--        -- Если туристов больше 20, применяется скидка 15%
--        UPDATE Tours
--        SET Price = Price * 0.85
--        WHERE TourID = @TourID;
--    END
--    ELSE IF (@TouristCount > 10)
--    BEGIN
--        -- Если туристов больше 10, применяется скидка 10%
--        UPDATE Tours
--        SET Price = Price * 0.90
--        WHERE TourID = @TourID;
--    END
--    ELSE
--    BEGIN
--        -- Если туристов 10 или меньше, цена не меняется (или можно добавить дополнительные условия)
--		UPDATE Tours
--		SET Price = Price
--		where TourID = @TourID;
--    END
--END;

--INSERT INTO Tourist_Tours (TouristID, TourID)
--VALUES (3, 2);

--DELETE FROM Tourist_Tours
--WHERE TouristID = 4 AND TourID = 2;

--select * from Tourists;

--drop trigger trg_UpdateTourPrice;
