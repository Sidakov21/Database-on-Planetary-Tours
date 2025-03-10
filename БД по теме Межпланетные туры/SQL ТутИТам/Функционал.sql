--Поиск туров на основе предпочтений туриста
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
--    Tr.Name = 'Анна Петрова' 
--    AND T.Difficulty = 'Только для опытных';



--Cамые популярные маршруты
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


--Подсчет прибыли от проведенных туров.
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

--Отчет о загруженности кораблей.
SELECT 
    Transport.TransportID, 
    Transport.Model, 
    Transport.Capacity,
    COUNT(Tourist_Tours.TouristID) AS TotalPassengers, -- Количество пассажиров на корабле
    Transport.Capacity - COUNT(Tourist_Tours.TouristID) AS FreeCapacity -- Разница между вместимостью и количеством пассажиров
FROM 
    Transport
LEFT JOIN 
    Tour_Transport ON Transport.TransportID = Tour_Transport.TransportID
LEFT JOIN 
    Tourist_Tours ON Tour_Transport.TourID = Tourist_Tours.TourID
GROUP BY 
    Transport.TransportID, Transport.Model, Transport.Capacity
ORDER BY 
    Transport.Capacity; -- Сортировка по числу пассажииров

