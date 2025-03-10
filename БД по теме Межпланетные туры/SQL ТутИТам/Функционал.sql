--����� ����� �� ������ ������������ �������
--SELECT 
--    T.TourID,
--    T.Route,
--    T.Duration,
--    T.Price,
--    T.Difficulty
--FROM Tours T
--INNER JOIN Tourist_Tours TT ON T.TourID = TT.TourID
--INNER JOIN Tourists Tr ON TT.TouristID = Tr.TouristID
--WHERE 
--    Tr.Name = '���� �������' 
--    AND T.Difficulty = '������ ��� �������';



--C���� ���������� ��������
--SELECT 
--    Tours.TourID,
--    Tours.Route,
--    COUNT(Tourist_Tours.TouristID) AS NumberOfBookings
--FROM Tours
--LEFT JOIN 
--    Tourist_Tours ON Tours.TourID = Tourist_Tours.TourID
--GROUP BY 
--    Tours.TourID, Tours.Route
--ORDER BY 
--    NumberOfBookings DESC;


--������� ������� �� ����������� �����.
--SELECT 
--    Tours.TourID,
--    Tours.Route,
--    Tours.Price,
--    BookingCounts.NumberOfBookings,
--    (Tours.Price * BookingCounts.NumberOfBookings) AS Profit
--FROM Tours
--JOIN 
--    (SELECT 
--         TourID, 
--         COUNT(TouristID) AS NumberOfBookings
--     FROM Tourist_Tours GROUP BY TourID 
--	 ) 
--	 AS BookingCounts ON Tours.TourID = BookingCounts.TourID
--ORDER BY 
--    Profit DESC;

--����� � ������������� ��������.
SELECT 
    Transport.TransportID, 
    Transport.Model, 
    Transport.Capacity,
    COUNT(Tourist_Tours.TouristID) AS TotalPassengers, -- ���������� ���������� �� �������
    Transport.Capacity - COUNT(Tourist_Tours.TouristID) AS FreeCapacity -- ������� ����� ������������ � ����������� ����������
FROM 
    Transport
LEFT JOIN 
    Tour_Transport ON Transport.TransportID = Tour_Transport.TransportID
LEFT JOIN 
    Tourist_Tours ON Tour_Transport.TourID = Tourist_Tours.TourID
GROUP BY 
    Transport.TransportID, Transport.Model, Transport.Capacity
ORDER BY 
    Transport.Capacity; -- ���������� �� ����� �����������

