CREATE DATABASE hotel_booking
GO

USE hotel_booking
GO

SELECT TOP 5 *
 FROM services
 GO

-- 1. Customers (1) - (N) Bookings
ALTER TABLE bookings
ADD CONSTRAINT FK_booking_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

-- 2. Rooms (1) - (N) Bookings
ALTER TABLE bookings
ADD CONSTRAINT FK_bookings_rooms
FOREIGN KEY (room_id)
REFERENCES rooms(room_id);

-- 3. Bookings (1) - (N) Payments
ALTER TABLE payments
ADD CONSTRAINT FK_payments_bookings
FOREIGN KEY (booking_id)
REFERENCES Bookings(booking_id);

-- 4. Bookings (1) - (N) Service_Usage
ALTER TABLE service_usage
ADD CONSTRAINT FK_ServiceUsage_bookings
FOREIGN KEY (booking_id)
REFERENCES bookings(booking_id);

-- 5. Services (1) - (N) Service_Usage
ALTER TABLE dbo.service_usage
ADD CONSTRAINT FK_ServiceUsage_Services
FOREIGN KEY (service_id)
REFERENCES dbo.services(service_id);

-- EDA
SELECT top 5 *
  from bookings

-- Total bookinng
SELECT COUNT(*) booking_count
  FROM bookings

-- Distribution of bookings by years
SELECT YEAR(created_at) years, COUNT(*) total_bookings
FROM bookings
GROUP by YEAR(created_at)
Order by years ;

--Distribution of bookings by months, years
SELECT months, [2023], [2024], [2025], ([2023] + [2024] + [2025]) total_bookings
FROM
    (SELECT MONTH(created_at) months, YEAR(created_at) years, booking_id
     FROM bookings) source_table
PIVOT
    (
     COUNT(booking_id)
     FOR years IN ([2023], [2024], [2025])
    ) AS pivot_table
ORDER BY total_bookings DESC;

-- Number of bookings at weekend
SELECT COUNT(*) weekend_books
  from bookings
 WHERE DATEPART(WEEKDAY,check_in) IN (1,7)

 --  Number of bookings at weekday
 SELECT COUNT(*) weekend_books
  from bookings
 WHERE DATEPART(WEEKDAY,check_in) IN (2,3,4,5,6)


--Distribution of room by price range 50-500 
SELECT FLOOR(price_per_night/50)*50 as price_range, COUNT(*) AS room_count
FROM rooms
GROUP BY Floor(price_per_night/50)
ORDER BY room_count DESC;


-- Distribution of Total bookings by room_types
SELECT room_type, COUNT(*) AS total_bookings
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY room_type
ORDER BY total_bookings DESC

-- Average time used for each room_types
SELECT r.room_type, 
       AVG(CAST(DATEDIFF(day, b.check_in, b.check_out) AS FLOAT)) AS avg_booking
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
 WHERE b.status = 'Confirmed'
GROUP BY r.room_type
ORDER BY avg_booking DESC;

-- Avg occupancy rate by day
WITH booking_days AS (
    SELECT 
        b.room_id,
        CAST(DATEADD(DAY, v.number, b.check_in) AS DATE) stay_date
    FROM bookings b
    JOIN rooms r ON b.room_id = r.room_id
    JOIN master..spt_values v ON v.type = 'P' 
        AND v.number < DATEDIFF(DAY, b.check_in, b.check_out)
    WHERE b.status = 'Confirmed'
),
occupancy_per_day AS (
    SELECT 
        stay_date,
        COUNT(DISTINCT room_id) AS rooms_occupied
    FROM booking_days
    GROUP BY stay_date
)
SELECT 
    COUNT(DISTINCT r.room_id) total_rooms,
    ROUND(AVG(CAST(rooms_occupied AS FLOAT)) / COUNT(DISTINCT r.room_id) * 100, 2) avg_daily_occupancy_percent
FROM occupancy_per_day
CROSS JOIN rooms r;


-- Revenue by room_types (confirmed = 100%, others = 50%)
SELECT 
    r.room_type,
    SUM(DATEDIFF(DAY, b.check_in, b.check_out)  * r.price_per_night  * 
	     CASE 
            WHEN b.status = 'Confirmed' THEN 1.0
            ELSE 0.5
          END
    ) AS revenue
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY r.room_type
ORDER BY revenue DESC;


 -- Revenue by services
SELECT se.service_name,
	   SUM(s.total_price) service_revenue
  from  service_usage s
   LEFT JOIN services se ON s.service_id = se.service_id
   GROUP BY se.service_name
   ORDER BY service_revenue DESC

-- Frequency of used service by roomtypes
SELECT r.room_type,se.service_name,
	   COUNT(s.usage_id) count_usage
  from rooms r
   LEFT JOIN bookings b on r.room_id = b.room_id
   LEFT JOIN service_usage s ON b.booking_id = s.booking_id
   LEFT JOIN services se ON s.service_id = se.service_id
   GROUP BY r.room_type,se.service_name
   ORDER BY count_usage DESC

-- What is the price_range revune?
SELECT FLOOR(r.price_per_night / 50) * 50 AS price_range,
       COUNT(b.booking_id) AS booking_count,
       SUM(DATEDIFF(DAY, b.check_in, b.check_out) * r.price_per_night) AS revenue
  FROM bookings b
 JOIN rooms r ON b.room_id = r.room_id
 GROUP BY FLOOR(r.price_per_night / 50)
 ORDER BY revenue DESC;