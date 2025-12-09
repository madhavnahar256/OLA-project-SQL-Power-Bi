use ola;
#1.Retrieve all successful bookings:
create view successfull_booking as
 select * from bookings where Booking_status ="success" ;


#2. Find the average ride distance for each vehicle type:
create view  avg_ride_distance as 
select AVG(Ride_Distance),Vehicle_Type from bookings group by Vehicle_type ;


#3. Get the total number of cancelled rides by customers:
create view cancelled_ride_by_customer as 
select count(`Canceled_Rides_by_Customer`) from bookings;


#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID ,count(Booking_ID) as total_rides from bookings
group by Customer_ID
order by total_rides desc limit 5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Canceled_Rides_by_Driver_P_C_R_ISSUE as
select count(*) from bookings 
where Canceled_Rides_by_Driver='Personal & Car related issue' ;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Prime_Sedan_ratings  as
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings
from bookings where Vehicle_Type = 'Prime Sedan';


#7. Retrieve all rides where payment was made using UPI:
create view UPI_payment_methods as
select * from bookings where Payment_Method = 'UPI' ;


#8. Find the average customer rating per vehicle type:
create view avg_customer_rating as
select avg(Customer_Rating) as avg_customer_rating , Vehicle_Type from bookings
group by Vehicle_Type;


#9. Calculate the total booking value of rides completed successfully:
create view total_succesful_book_value as
select sum(Booking_Value) as total_succesful_book_value from bookings
where Booking_Status = 'Success';


#10. List all incomplete rides along with the reason:
create view incomplete_rides_reason as
select Booking_ID,  Incomplete_Rides, Incomplete_Rides_Reason from bookings 
where Incomplete_Rides = 'Yes'