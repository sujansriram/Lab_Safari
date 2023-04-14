-- The names of the animals in a given enclosure
SELECT animals.name, enclosures.name FROM animals 
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id;

-- The names of the staff working in a given enclosure
SELECT employees.name, enclosures.name FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id; 

-- The names of staff working in enclosures which are closed for maintenance
SELECT * FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.closed_for_maintenance = TRUE; 

-- Name of enclosure where the oldest animal lives
SELECT * FROM animals 
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
ORDER BY (age , animals.name) DESC
LIMIT 1;

-- Number of different animal types a given keeper has been assigned to work with
SELECT COUNT(DISTINCT animals.type), employees.name FROM animals
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
INNER JOIN assignments
ON assignments.enclosure_id = enclosures.id
INNER JOIN employees
ON employees.id = assignments.employee_id
GROUP BY (employees.name);

-- The number of different keepers who have been assigned to work in a given enclosure
SELECT COUNT(DISTINCT employees.name), enclosures.name FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
GROUP BY (enclosures.name);

-- The names of the other animals sharing an enclosure with a given animal
WITH p AS ( SELECT animals.name, animals.enclosure_id FROM animals)

SELECT * FROM animals 
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
INNER JOIN p
ON enclosures.id = p.animals.enclosure_id
;