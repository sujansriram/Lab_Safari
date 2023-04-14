
1.The names of the animals in a given enclosure

```sql
SELECT animals.name, enclosures.name FROM animals 
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id;

```
2.The names of the staff working in a given enclosure

```sql
SELECT employees.name, enclosures.name FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id;

```

3.The names of staff working in enclosures which are closed for maintenance

```sql
SELECT * FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.closed_for_maintenance = TRUE; 

```

4.Name of enclosure where the oldest animal lives

```sql
SELECT * FROM animals 
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
ORDER BY (age , animals.name) DESC
LIMIT 1;

```

5. Number of different animal types a given keeper has been assigned to work with

```sql
SELECT COUNT(DISTINCT animals.type), employees.name FROM animals
INNER JOIN enclosures
ON enclosures.id = animals.enclosure_id
INNER JOIN assignments
ON assignments.enclosure_id = enclosures.id
INNER JOIN employees
ON employees.id = assignments.employee_id
GROUP BY (employees.name);

```

6.The number of different keepers who have been assigned to work in a given enclosure

```sql
SELECT COUNT(DISTINCT employees.name), enclosures.name FROM employees 
INNER JOIN assignments
ON employees.id = assignments.employee_id 
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
GROUP BY (enclosures.name);

```

7.The names of the other animals sharing an enclosure with a given animal

```sql


```