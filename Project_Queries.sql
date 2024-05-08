/*In this query i selected the area that had the most/least ride requests last month */

select top 1 sourcee, COUNT(sourcee) AS MOST_Rides
from Trip
WHERE DATEPART(m, date) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, date) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
GROUP BY sourcee
ORDER BY COUNT(sourcee) DESC

/*In this query i selected the drivers with the maximum number of rides last month */

Select Trip.driver_id,Driver.namee , COUNT(Trip.driver_id) AS Maximum_Rides
FROM Trip, Driver
Where Trip.driver_id = Driver.driver_id  and DATEPART(m, date) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, date) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
GROUP BY Trip.driver_id,Driver.namee
ORDER BY COUNT(Trip.driver_id) DESC

/*In this query i retrieved all his/her information and the number of rides he/she had for each driver. */

Select Driver.driver_id,Driver.License_number,Driver.namee, Driver.phone_number 
,Driver.age ,Driver.email , Driver.pasword , Driver.gender ,COUNT(Trip.trip_id) AS Number_of_trip
from Driver Left outer Join Trip
on Driver.driver_id = Trip.driver_id
GROUP BY Driver.driver_id,Driver.namee,Driver.License_number, Driver.phone_number,Driver.age,Driver.email , Driver.pasword , Driver.gender

/*In this query i retrieved the driver who got at least 4.5 out of 5 on every user rating he/she got */
select Driver.driver_id , Driver.namee , user_driver_rate.driver_rate 
from Driver join user_driver_rate
on Driver.driver_id = user_driver_rate.driver_id
where user_driver_rate.driver_rate >= 4.5

/*In this query i selected the drivers that didn’t have any ride last month */

SELECT Driver.driver_id , Driver.namee
FROM Driver , Trip
WHERE driver.driver_id = trip.driver_id
and DATEPART(m, date) <> DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, date) = DATEPART(yyyy, DATEADD(m, -1, getdate())); 

/*In this query i selected the most type of vehicle (car, bus, and scooter) requested last mont */

Select vehcile.vehciletype,COUNT(Trip.vehcile_id) AS MOST_Vehicle
from vehcile , Trip
where vehcile.vehcile_id = Trip.vehcile_id
and DATEPART(m, date) = DATEPART(m, DATEADD(m, -1, getdate()))
AND DATEPART(yyyy, date) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
group by vehcile.vehciletype
Order by COUNT(Trip.vehcile_id) DESC


