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

-- Number of bookings at weekend
SELECT COUNT(*) weekend_books
  from bookings
 WHERE DATEPART(WEEKDAY,check_in) IN (1,7)

 --  Number of bookings at weekday
 SELECT COUNT(*) weekend_books
  from bookings
 WHERE DATEPART(WEEKDAY,check_in) IN (2,3,4,5,6)

-- Distribution of bookings by years
SELECT YEAR(created_at) years, COUNT(*) total_bookings
FROM bookings
GROUP by YEAR(created_at)
Order by years ;

--Distribution of bookings by quarters, years
SELECT quarters, [2023], [2024], [2025], ([2023] + [2024] + [2025]) total_bookings
FROM
    (SELECT DATEPART(QUARTER, check_in) quarters, YEAR(created_at) years, booking_id
     FROM bookings) source_table
PIVOT
    (
     COUNT(booking_id)
     FOR years IN ([2023], [2024], [2025])
    ) AS pivot_table
ORDER BY total_bookings DESC;

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


--Distribution of room_books by price range 50-500 
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


-- Revenue by room_types
SELECT 
    r.room_type,
    SUM(DATEDIFF(DAY, b.check_in, b.check_out) * r.price_per_night) AS room_revenue,
    SUM(COALESCE(s.service_total, 0)) AS service_revenue,
    SUM(DATEDIFF(DAY, b.check_in, b.check_out) * r.price_per_night + COALESCE(s.service_total, 0)) AS total_revenue
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
LEFT JOIN (
    SELECT booking_id, SUM(total_price) AS service_total
    FROM service_usage
    GROUP BY booking_id
) s ON s.booking_id = b.booking_id
WHERE b.check_in IS NOT NULL
  AND b.check_out IS NOT NULL
  AND DATEDIFF(DAY, b.check_in, b.check_out) > 0
GROUP BY r.room_type
ORDER BY total_revenue DESC;

-- Frequency of used service by roomtypes
SELECT r.room_type,se.service_name,
	   COUNT(s.usage_id) count_usage
  from rooms r
   LEFT JOIN bookings b on r.room_id = b.room_id
   LEFT JOIN service_usage s ON b.booking_id = s.booking_id
   LEFT JOIN services se ON s.service_id = se.service_id
   GROUP BY r.room_type,se.service_name
   ORDER BY count_usage DESC

-- What is the price for optimiation?
SELECT FLOOR(r.price_per_night / 50) * 50 AS price_range,
       COUNT(b.booking_id) AS booking_count,
       SUM(DATEDIFF(DAY, b.check_in, b.check_out) * r.price_per_night) AS revenue
  FROM bookings b
 JOIN rooms r ON b.room_id = r.room_id
 WHERE b.check_in IS NOT NULL AND b.check_out IS NOT NULL
 GROUP BY FLOOR(r.price_per_night / 50)
 ORDER BY revenue DESC;