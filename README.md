# 🏨 Hotel Booking Analysis Project

![Hotel Booking](https://github.com/user-attachments/assets/f3e75a12-d9f9-4899-9f61-f334f79f09e1)

**Tools Used:** MS SQL Server, Python, Power BI

📁 **[Dataset Used]**  
📄 **[SQL Analysis (Code)]**  
📊 **[Dashboard - Power_BI]**

This is a personal project that uses a real-world dataset about hotel bookings. The main goal of this project is to answer several questions addressing the **price optimization problem**. In addition, I explore **booking trends over time**, identify the **most frequently booked room types**, and propose **potential additional services**.

---

## Business Problem

Hotel managers want to gain insights into guest booking patterns and revenue optimization. They are working with a large volume of real-world booking data and need a way to analyze seasonal trends, optimize room pricing, and recommend value-added services to increase profits.

---

## My Solution Plan

- First, I use SQL to explore useful insights. Serving the business objectives, I divide the problems into 3 main sections:  
  1. Analyzing total bookings by time  
  2. Analyzing bookings by room type and price range  
  3. Analyzing possible optimized prices for room types by time with associated services  
- Then, I apply Python for predicting the optimized price.  
- Finally, I use Power BI to visualize all information.  

---

## 📊 Useful Insights from the Dataset

### Overview

#### 1. What is the total number of bookings at this hotel?

SQL Query: 
![image](https://github.com/user-attachments/assets/483a31e7-c52d-4ff7-8119-84cdb185a52d)  

Result:
![image](https://github.com/user-attachments/assets/37f7e178-268f-48d8-b238-580a2ea6edb2)

The total bookings, counted from the first day to the last day in the dataset, is **5000**. This means the dataset contains **5000 rows**.

---

### Analyzing by Time Factors

#### 2. What is the distribution of bookings over the years?

SQL Query:  
![image](https://github.com/user-attachments/assets/5550a002-bb17-4863-8748-3c3a19400ae3)

Result:  
![image](https://github.com/user-attachments/assets/af2dcb52-5195-4f98-9821-38bc2c0f7c54)

This dataset is collected through 3 years including 2023, 2024, 2025.
There is not much difference in the number of bookings made between 2023 and 2024, with 2,177 and 2,516 bookings respectively. However, the number of bookings in 2025 is significantly lower, which could be due to incomplete data for the remaining months, as it is still early in the year 2025. 
---

#### 3. What is the distribution of bookings over months and years?

SQL Query:  
![image](https://github.com/user-attachments/assets/b77e7414-0f6b-4a67-80db-9349ea13b87f)

Result:  
![image](https://github.com/user-attachments/assets/e05060f9-9a48-405a-8288-c79727c58770)

Data is collected from 2/2023 to 2/2025.  
This explains the differences of total booking between 2023 and 2024, 2025 and others. Beside, could see that, when it comes to June, July ( middle time of the year), January and February(beginning time of the years), the number of bookings is higher than others, especially November and December, which could be the peak time. However, overall the range between months is not really large.

---

#### 4. How many bookings are made on weekends?

SQL Query:  
![image](https://github.com/user-attachments/assets/13722694-7da2-49d1-b1e9-053a8ef1b7fe)

Result:  
![image](https://github.com/user-attachments/assets/70c9f079-54da-4bc0-aa49-f8ca60b69083)

**1,466** out of 5,000 bookings are made on weekends, which means **over 700 bookings** for Saturday and Sunday.

---

#### 5. How many bookings are made on weekdays?

SQL Query:  
![image](https://github.com/user-attachments/assets/1e7f292a-5242-4177-8686-a47ed82e2279)

Result:  
![image](https://github.com/user-attachments/assets/ad7921e6-4c6d-4a86-be83-bcb3fff953ee)

**3,534** out of 5,000 bookings are made on weekdays, which means over 700 total bookings for each day.
   -->  There is **not much difference** between weekday and weekend bookings.

---

### Analyzing by Room Type and Price

#### 6. What is the distribution of rooms by price range?

SQL Query:  
![image](https://github.com/user-attachments/assets/9db119b3-635b-49a1-b2ba-5a3bdfb8b56f)

Result:  
![image](https://github.com/user-attachments/assets/ec8d70c7-93e8-4062-85c9-649ddfaabc38)

Rooms with the lowest prices tend to receive the highest number of rooms. At the same time, rooms in the higher price range (250–400) also show a significant number of rooms. This indicates that while low-priced rooms are highly attractive to cost-conscious customers, higher-priced rooms with better services are also a preferred choice for many.
➡Low-priced rooms attract cost-conscious customers, while premium rooms attract those seeking quality.

---

#### 7. What is the distribution of total bookings by room types?

SQL Query:  
![image](https://github.com/user-attachments/assets/10c8275b-ed0e-43fb-806f-a50c0e3787bb)

Result:  
![image](https://github.com/user-attachments/assets/6e2758df-c67f-449a-8294-a32d99b3abf5)

High-end rooms like **Presidential** and **Executive** receive the most bookings, while **Standard** and **Suite** rooms receive fewer, possibly due to the lower quality of services provided. Compared with number of rooms available above, the current distribution of room number is not optimized

---

#### 8. What is the average time booked for each room type?

SQL Query:  
![image](https://github.com/user-attachments/assets/5ee091ab-e243-460b-bc50-dfbb2f909f79)

Result:  
![image](https://github.com/user-attachments/assets/9f575c67-8ea1-4291-bd62-6fb21cee6de9)

The average time used for each room_type is quite balanced. Since it is not because of the effect of time duration for each room, the company could consider about the distribution of rooms number.


---

#### 9. What is the revenue by room type?

SQL Query:  
![image](https://github.com/user-attachments/assets/acaf7e7e-732a-41c5-bf0b-a5b89cf43603)

Result:  
![image](https://github.com/user-attachments/assets/03d951a8-7d70-4e15-b54e-e2b2885c52ba)

**Deluxe** and **Residential** rooms generate the most revenue.  
While **Suite** and **Standard** generate about half as much.

---

#### 10. What is the revenue by service?

SQL Query:  
![image](https://github.com/user-attachments/assets/6e609bd7-df19-4ab7-9bed-3bf7f2170176)

Result:  
![image](https://github.com/user-attachments/assets/923c00ae-0310-4222-aa06-de6e6f6c6e7e)

Spa, Airport Pickup and Vip Lounge are top highest contributors to service revenue . It makes sense since they are high-quality service for higher-income customers, Breakfast is moderate because it is a daily basic need compared to other kinds of services.

---

#### 11. How often are services used by each room type?

SQL Query:  
![image](https://github.com/user-attachments/assets/5f74de7c-c1c6-4bae-a2e6-2cde77672f90)

Result:  
![image](https://github.com/user-attachments/assets/1edc73b4-580c-46cd-aa7c-7a89dbb0880d)

 
- **Presidential**: Breakfast, Room Service, VIP Lounge, Airport Pickup, Tour Package, Spa  
- **Executive**: VIP Lounge, Tour Package, Spa  
- **Suite**: Room Service, Spa, Mini Bar  
- **Deluxe**: Tour Package, VIP Lounge, Airport Pickup  
- **Standard**: Spa, Room Service, Laundry

---

#### 12. What is the revenue by price range?

SQL Query:  
![image](https://github.com/user-attachments/assets/22e9c3bd-097c-483e-987c-f821a98ff6f8)

Result:  
![image](https://github.com/user-attachments/assets/ac146cda-698e-4748-b7b4-bdf72a197e02)

The **highest price ranges** contribute the most to revenue. And The lower the price, the lower the revenue.

---

## Main Insights


## How to Optimize Price?

---
