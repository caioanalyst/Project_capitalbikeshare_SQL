# Project_capitalbikeshare_SQL

 This project aims to introduce SQL skills
 

The project done development in one course offer by Data Science Academy. We used the SGBD MySQL for charge the datas and done the analyses also.

https://www.datascienceacademy.com.br.

The dataset is public and be available in the link fellow: https://s3.amazonaws.com/capitalbikeshare-data/index.html.

The questions ansewers were:

1- What is the average time (in seconds) for bike rental by type of member?

2- What is the average time (in seconds) for bike rental by type of member and
by end station (where the bikes are delivered after renting)?

3- What time of day (regardless of the month) did bike number W01182 have the highest number of
rents considering start date?

4- What is the average time (in seconds) for bike rental by type of member and
by end station (where bikes are delivered after rental) over time?

5- What is the number of rentals of the bike number W01182 over time considering the
start date?

6- Return:
End station, end date of each bike rental and duration of each rental in seconds
Number of bike rentals (regardless of season) over time
Only the records when the end date was in the month of April

7- Return:
End station, end date and duration in seconds of the rental
The end date must be returned in the format: 01/January/2012 00:00:00
We want the order (rank or ranking) of rental days over time
Return data for rentals between 7 am and 11 am

8- What is the difference in the duration of bike rental over time,
from one record to another, considering rental start date and start season?
The start date must be returned in the format: Sat/Jan/12 00:00:00 (Sat = Day of the week
abbreviated and Jan equals abbreviated month). Return data for rentals between 01 and 03 am

9- Return:
End station, end date and duration in seconds of the rental
The end date must be returned in the format: 01/January/2012 00:00:00
We want the records divided into 4 groups over time per partition
Return data for rentals between 8 am and 10 am
What criteria does the NTILE function use to split the groups?

10- Which seasons had more than 35 hours of total bike rental duration over the
time considering end date and end season?
Return data between days '2012-04-01' and '2012-04-02'