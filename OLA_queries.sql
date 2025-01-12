create database Ola;
Use Ola;

select * from bookings;

#1. Retrieve all successful bookings:

Create view successful_bookings as
select * from bookings where booking_status = 'Success';

#2. Find the average ride distance for each vehicle type:

create view ride_distance_for_each_vehicle as 
select vehicle_type, ROUND(AVG(ride_distance),2) 
from bookings 
group by vehicle_type;

#3. Get the total number of cancelled rides by customers:

Create View cancelled_rides_by_customers As
select count(*) from bookings 
where booking_status = 'Canceled by customer';

#4. List the top 5 customers who booked the highest number of rides:

Create View Top_5_Customers AS 
select customer_id, Count(booking_id) as highest_rides 
from bookings 
group by customer_id 
order by highest_rides 
desc LIMIT 5;	 

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
select COUNT(booking_id) 
from bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
select MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
from bookings 
where vehicle_type = 'Prime Sedan'; 

#7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
SELECT * from bookings
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
select vehicle_type, ROUND(AVG(Customer_Rating),2) as avg_rating
from bookings
group by vehicle_type;

#9. Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
select SUM(Booking_Value) as total_amount from bookings
where Booking_Status = 'success';

#10. List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
select booking_id, Incomplete_Rides_Reason from bookings
where  Incomplete_Rides = 'yes';

#11 List Top 2 booking value for each vehicle type:

create view top_2_each as
select customer_id, vehicle_type, booking_value, 
RANK() OVER (partition by vehicle_type order by booking_value DESC) as rnk
from bookings;

#RETRIEVE All ANSWERS


#1. Retrieve all successful bookings:
Select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from Rides_cancelled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:
Select * from AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides_Reason;

#11 List Top 2 booking value for each vehicle type

select * from top_2_each;