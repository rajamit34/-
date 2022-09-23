-- Business Problems :-

-- + -------------------------------------------------------------------------------------------------------------------------------------------------------- + --

-- TODO: Calculate the Average Severity by vehicle type.

SELECT vt.vehicle_type AS 'Vehicle Type', AVG(a.accident_severity) AS 'Average Severity'
FROM accident AS a
LEFT JOIN vehicle AS  v
ON a.accident_index = v.accident_index
LEFT JOIN vehicle_type AS vt
ON v.vehicle_type = vt.vehicle_code
GROUP BY 1
ORDER BY 2;

-- + -------------------------------------------------------------------------------------------------------------------------------------------------------- + --

-- TODO: Evaluate Accident Severity and Total Accidents per Vehicle Type

SELECT vt.vehicle_type AS 'Vehicle Type', a.accident_severity AS 'Severity', COUNT(number_of_casualties) AS 'Number of Accidents'
FROM accident  AS a
LEFT JOIN vehicle  AS v 
ON a.accident_index = v.accident_index
LEFT JOIN vehicle_type AS vt 
ON v.vehicle_type = vt.vehicle_code
GROUP BY 1
ORDER BY 2,3;


-- + -------------------------------------------------------------------------------------------------------------------------------------------------------- + --


-- TODO: Evaluate the median severity value and Total Accidents caused by various Motorcycles.

SELECT vt.vehicle_type AS 'Vehicle Type', AVG(a.accident_severity) AS 'Average Severity', COUNT(number_of_casualties) AS 'Number of Accidents'
FROM accident AS a
LEFT JOIN vehicle AS  v
ON a.accident_index = v.accident_index
LEFT JOIN vehicle_type AS vt
ON v.vehicle_type = vt.vehicle_code
WHERE vt.vehicle_type LIKE '%Motorcycle%'
GROUP BY 1
ORDER BY 2,3;
 

-- + -------------------------------------------------------------------------------------------------------------------------------------------------------- + --

-- TODO: Calculate the Average Severity and Total Accidents by Motorcycle.

SELECT 
    CASE  
        WHEN vt.vehicle_type LIKE '%Motorcycle%' THEN 'Motorcycle'
    END AS 'Vehicle Type',
    AVG(a.accident_severity) AS 'Average Severity', COUNT(number_of_casualties) AS 'Number of Accidents'
FROM accident a
JOIN vehicle v ON a.accident_index = v.accident_index
JOIN vehicle_type vt ON v.vehicle_type = vt.vehicle_code
WHERE vt.vehicle_type like '%motorcycle%';