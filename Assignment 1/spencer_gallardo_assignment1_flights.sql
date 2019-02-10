Question 1:
	How many airplanes have listed speeds? What is the
    minimum listed speed and the maximum listed speed?
    
    Answers:
    Airplanes with listed speeds:		23
    Minimum listed Speed:				90
    Maximum listed Speed:				432
	
    Below are the SQL statements I used to determine this.	
        
Airplanes with listed speeds:
	
SELECT count(*)
FROM planes
where speed != '';

Minimum listed Speed:
	
SELECT MIN(speed)
FROM planes;

Maximum listed Speed:

SELECT MAX(speed)
FROM planes;

Question 2:
What is the total distance flown by all of the planes in
January 2013? What is the total distance flown by all of
the planes in January 2013 where the tailnum is missing?
    
Answers:  
What is the total distance flown by all of the planes in January 2013? 27,188,805

SELECT SUM(distance) AS 'Total Distance'
FROM flights
WHERE year = 2013 AND month = 1;

What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? 81,763
                        
SELECT SUM(distance) AS 'Total Missing Tailnum Distance'
FROM flights
WHERE year = 2013 AND month = 1 AND tailnum IS NULL;

Question 3:
What is the total distance flown for all planes on July 5,
2013 grouped by aircraft manufacturer? Write this
statement first using an INNER JOIN, then using a LEFT
OUTER JOIN. How do your results compare?
    
	Answers:       
	Total distance flown for all planes on July 5, 2013 grouped 
    by aircraft manufacturer:
			
            manufacturer					Total Dist
			------------------------------	----------
			AIRBUS							195089
			AIRBUS INDUSTRIE				78786
			AMERICAN AIRCRAFT INC			2199
			BARKER JACK L					937
			BOEING							335028
			BOMBARDIER INC					31160
			CANADAIR						1142
			CESSNA							2898
			DOUGLAS							1089
			EMBRAER							77909
			GULFSTREAM AEROSPACE			1157
			MCDONNELL DOUGLAS				7486
			MCDONNELL DOUGLAS AIRCRAFT CO	15690
			MCDONNELL DOUGLAS CORPORATION	4767
    
    Compare using an INNER JOIN, and a LEFT OUTER JOIN: 
    
		The inner join removes values that cannot be correlated 
        between the two tables. In this querey's case it's planes
        where the tail number has no corresponding value in either 
        table, either tailnum in the planes table was NULL, or there
        was no corresponding tailnum value in the planes table. 
        The outer join however includes the uncorrelateble fields 
        and returns an extra row titled NULL totalling the 
        uncorrelatable fileds to 12,7671
        
	Below are the SQL statements I used to determine this.	*/

Inner join:

    SELECT 
        planes.manufacturer,
        SUM(distance) AS 'Total Dist'
	FROM flights
	INNER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
            AND flights.month = 7 
            AND flights.day = 5)
		GROUP BY manufacturer;

Outer join:
    SELECT 
        planes.manufacturer,
        SUM(distance) AS 'Total Dist'
	FROM flights
	LEFT OUTER JOIN planes
		ON flights.tailnum = planes.tailnum
		WHERE (
			flights.year = 2013 
            AND flights.month = 7 
            AND flights.day = 5)
		GROUP BY manufacturer;


Question 4:
    Write and answer at least one question of your own
	choosing that joins information from at least three of
	the tables in the flights database. 
    
    Answer:
    choose own
	SELECT 
        airlines.name,
        flights.origin,
        AVG(flights.arr_delay) as 'Average_Delay'
        FROM flights
		LEFT JOIN weather ON (
			flights.year = weather.year
            AND flights.month = weather.month
            AND flights.day = weather.day
            AND flights.origin = weather.origin)
		LEFT JOIN airlines ON (
			flights.carrier = airlines.carrier)
		WHERE 
			weather.visib > 9
			and arr_delay > 0
		GROUP BY flights.origin, airlines.name
        ORDER BY Average_Delay DESC LIMIT 10;
        
	DROP INDEX indexFlights ON flights; 
    DROP INDEX indexWeather ON weather;