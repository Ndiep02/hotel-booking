#  Hotel Booking Analysis Project

![Hotel Booking]
![image](https://github.com/user-attachments/assets/f3e75a12-d9f9-4899-9f61-f334f79f09e1)

**Tools Used: **MS Sql-server,Python, Power_BI)

[📁 Dataset Used]
[📄 SQL Analysis (Code)] 
[📊 Dashboard - Tableau]

This is a personal project, which uses a real-world dataset about hotel booking domains. In addition, the main goal of this project is to answer several questions addressing the price optimization problem. Furthermore, I also explore booking trends over time, identify the most frequently booked room types, and propose potential additional services.

### 📌 Business Problem
Hotel managers want to gain insights into guest booking patterns and revenue optimization. They are working with a large volume of real-world booking data and need a way to analyze seasonal trends, optimize room pricing, and recommend value-added services to increase profits.

### My solution plan: 
- First, I use SQL for exploring some usefull insights. Serving for the main objectives of the bussiness, I devide the problems into 3 small sections including analyzing total bookings by time, analyzing total bookings by room_type and price range and finally analyzing the possible optimized price for roomtypes by time with associated services.
- Then Python is applied for predicting the optimized price
- Finally I use Power BI to visuallize all information

### Useful Insights from the dataset 
**Overview 
1. What is the total bookings at this hotel?
![image](https://github.com/user-attachments/assets/483a31e7-c52d-4ff7-8119-84cdb185a52d)
![image](https://github.com/user-attachments/assets/37f7e178-268f-48d8-b238-580a2ea6edb2)

The total_booking which is count from the first day to the last day in the dataser is 5000.This also means this dataset has 5000 rows.

**Analyzing by time factors
2. What is the distribution of the bookings count over the years? 
SQL queries : 
![image](https://github.com/user-attachments/assets/5550a002-bb17-4863-8748-3c3a19400ae3)
Result: 
![image](https://github.com/user-attachments/assets/af2dcb52-5195-4f98-9821-38bc2c0f7c54)
This dataset is collected through 3 years including 2023, 2024, 2025.There is not much difference in the number of bookings made between 2023 and 2024, with 2,177 and 2,516 bookings respectively. However, the number of bookings in 2025 is significantly lower, which could be due to incomplete data for the remaining months, as it is still early in the year 2025. 
3. What is the distribution of the bookings count over months and years? Is number total booking affected by months and years? 
SQL queries : 
![image](https://github.com/user-attachments/assets/b77e7414-0f6b-4a67-80db-9349ea13b87f)
Result: 
![image](https://github.com/user-attachments/assets/e05060f9-9a48-405a-8288-c79727c58770)

It is noticable that the dataset collected the data from 2/2023 to 2/2025. This explains the differences of total booking between 2023 and 2024, 2025 and others. Beside, could see that, when it comes to June, July ( middle time of the year), January and February(beginning time of the years), the number of bookings is higher than others, especially November and December, which could be the peak time. However, overall the range between months is not really large.

4. How many bookings are made at weekend?
SQL queries :
![image](https://github.com/user-attachments/assets/13722694-7da2-49d1-b1e9-053a8ef1b7fe)
Result: 
![image](https://github.com/user-attachments/assets/70c9f079-54da-4bc0-aa49-f8ca60b69083)
1466 out of 5000 bookings are made,which means over 700 total bookings for Saturday and Sunday. 
6. How many bookings are made at weekday?
SQL queries :
![image](https://github.com/user-attachments/assets/1e7f292a-5242-4177-8686-a47ed82e2279)
Result:
![image](https://github.com/user-attachments/assets/ad7921e6-4c6d-4a86-be83-bcb3fff953ee)
3534 out of 5000 bookings are made, which means over 700 total bookings for each day.
   --> Not much difference between weekday and weekend
**Analyzing by room_type and price factors
7. What is the distributions of rooms by price range?
SQL queries:
![image](https://github.com/user-attachments/assets/9db119b3-635b-49a1-b2ba-5a3bdfb8b56f)
Result:
![image](https://github.com/user-attachments/assets/ec8d70c7-93e8-4062-85c9-649ddfaabc38)
Rooms with the lowest prices tend to receive the highest number of rooms. At the same time, rooms in the higher price range (250–400) also show a significant number of rooms. This indicates that while low-priced rooms are highly attractive to cost-conscious customers, higher-priced rooms with better services are also a preferred choice for many.
8. What is the distribution of total booking by room types?
SQL queries :
![image](https://github.com/user-attachments/assets/10c8275b-ed0e-43fb-806f-a50c0e3787bb)

Result : ![image](https://github.com/user-attachments/assets/6e2758df-c67f-449a-8294-a32d99b3abf5)
High-end rooms like Presidential and Executive receive the most bookings, while low and mid-range rooms have significantly fewer bookings, possibly due to the lower quality of services provided. Compared with number of rooms available above, could be the current distributed number of rooms is not yet resonable.

9. What is the average time booked for each room_type?
SQL queries :
![image](https://github.com/user-attachments/assets/5ee091ab-e243-460b-bc50-dfbb2f909f79)

Result:
![image](https://github.com/user-attachments/assets/9f575c67-8ea1-4291-bd62-6fb21cee6de9)

The average time used for each room_type is quite balanced. Since it is not because of the effect of time duration for each room, the company could consider about the distribution of rooms number.

10. What is the revenue by room_type?
SQL queries:
![image](https://github.com/user-attachments/assets/acaf7e7e-732a-41c5-bf0b-a5b89cf43603)

Result: 
![image](https://github.com/user-attachments/assets/03d951a8-7d70-4e15-b54e-e2b2885c52ba)

Could see that, Deluxe and Residental brings the most revenue to the hotel while Suite and Standard are nearly halve of them.

11. What is the revenue by service ?
SQL queries:
![image](https://github.com/user-attachments/assets/6e609bd7-df19-4ab7-9bed-3bf7f2170176)

Result: 
![image](https://github.com/user-attachments/assets/923c00ae-0310-4222-aa06-de6e6f6c6e7e)

Spa, Airport Pickup and Vip Lounge are top highest contributors to service revenue . It makes sense since they are high-quality service for higher-income customers, Breakfast is moderate because it is a daily basic need compared to other kinds of services.

12. How often these services are used by each room_type?
SQL queries: ![image](https://github.com/user-attachments/assets/5f74de7c-c1c6-4bae-a2e6-2cde77672f90)

Result: ![image](https://github.com/user-attachments/assets/1edc73b4-580c-46cd-aa7c-7a89dbb0880d)
Presidental usually use services including Breakfast, Room Service, VIP Lounge, Airport Pickup, TourPackage and Spa. While Executive usually use VipLounge, Tour Package and Spa.Suite usually use Room service, Spa and Mini Bar. While Deluxe use TourPackage, VIP Lounge and Airport Pickup the most.
Finally, Standard most uses Spa, Room service and Laundary.

13. What is the price_range revune?
SQL queries:
![image](https://github.com/user-attachments/assets/22e9c3bd-097c-483e-987c-f821a98ff6f8)

Result: 
![image](https://github.com/user-attachments/assets/ac146cda-698e-4748-b7b4-bdf72a197e02)

The highest prices contribute the most to the revenue, then the lower the price is the lower the revenue is .


** Main insights: 


** How to optimize price ? 
