----�������������� �����������, ���� ������ �������� ������������� ���, 
----������� ��� �� �������� (��������, ��-�� ������ ����������).

--CREATE PROC AddBooking
--    @TouristID INT,
--    @TourID INT
--AS
--BEGIN
--    -- ��������� ������������ ������ ���������� ������� ��������� ����
--    DECLARE @TourDifficulty NVARCHAR(50);
--    DECLARE @TouristPreparationLevel NVARCHAR(50);

--    -- �������� ��������� ����
--    SET @TourDifficulty = (
--        SELECT Difficulty
--        FROM Tours
--        WHERE TourID = @TourID
--    );

--    -- �������� ������� ���������� �������
--    SET @TouristPreparationLevel = (
--        SELECT [TrainingLevel]
--        FROM Tourists
--        WHERE TouristID = @TouristID
--    );

--    -- ���������� ��������� ���� � ������� ���������� �������
--    IF (@TourDifficulty = '������ ��� �������' AND @TouristPreparationLevel = '�������')
--    BEGIN
--        -- ���� ��� ������� ������, ��������� ������������
--        PRINT '������: ��� ������� ������ ��� ������ ���������� �������.';
--        RETURN;
--    END;

--    -- ���� �������� ��������, ��������� ������������
--    INSERT INTO Tourist_Tours (TouristID, TourID)
--    VALUES (@TouristID, @TourID);

--    PRINT '������������ ������� ���������.';
--END;

--EXEC AddBooking @TouristID = 1, @TourID = 2;	--��� ������� ������ ��� ������ ���������� �������.;

--EXEC AddBooking @TouristID = 1, @TourID = 1;	  --������������ ������� ���������.


--�������� ��������� ����, 
--���� ���������� ���������� �������� (��������, � ������ ��������� ������).

--CREATE TRIGGER trg_UpdateTourPrice
--ON Tourist_Tours
--AFTER INSERT, DELETE
--AS
--BEGIN
--    DECLARE @TourID INT;
--    DECLARE @TouristCount INT;
--    DECLARE @NewPrice DECIMAL(18, 2);
    
--    -- �������� TourID (��������� ������� ����������� �� ���������� ��� ��������, ����� �������� �� Tourist_Tours)
--    -- � ������ �������� ��������, TourID � ���������� ������� �� Tourist_Tours.
--    SELECT @TourID = TourID FROM [dbo].[Tourist_Tours];
    
--    -- ������������ ���������� �������� ��� ������� ����
--    SELECT @TouristCount = COUNT(*) FROM Tourist_Tours WHERE TourID = @TourID;

--    -- ���������� ����� ���� � ����������� �� ���������� ��������
--    IF (@TouristCount > 20)
--    BEGIN
--        -- ���� �������� ������ 20, ����������� ������ 15%
--        UPDATE Tours
--        SET Price = Price * 0.85
--        WHERE TourID = @TourID;
--    END
--    ELSE IF (@TouristCount > 10)
--    BEGIN
--        -- ���� �������� ������ 10, ����������� ������ 10%
--        UPDATE Tours
--        SET Price = Price * 0.90
--        WHERE TourID = @TourID;
--    END
--    ELSE
--    BEGIN
--        -- ���� �������� 10 ��� ������, ���� �� �������� (��� ����� �������� �������������� �������)
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
