#Ejercicio 2.1
SELECT DISTINCT country 
FROM company c
JOIN transaction t
ON c.id = t.company_id;

#Ejercicio 2.2
SELECT count(DISTINCT country)
FROM company c
JOIN transaction t
ON c.id = t.company_id;

#Ejercicio 2.3
#Prueba
SELECT company_id, AVG(amount)
FROM transaction
GROUP BY company_id;

SELECT company_name, ROUND(AVG(amount),2) AS media
FROM transaction t
JOIN company c
ON c.id = t.company_id
GROUP BY company_id
ORDER BY media DESC
LIMIT 1;


#Ejercicio 3.1
SELECT *
FROM transaction
WHERE company_id IN (SELECT id
					FROM company
					WHERE country="Germany");
                    
#Ejercicio 3.2
SELECT *
FROM company
WHERE id IN (SELECT company_id
				FROM transaction
				WHERE amount > (SELECT AVG(amount)
								FROM transaction));
                                
#Ejercicio 3.3
SELECT id, company_name 
FROM company c
WHERE NOT EXISTS (SELECT DISTINCT company_id FROM transaction t
					WHERE c.id = t.company_id);

#Como yo lo había entendido:
SELECT *
FROM company
WHERE id IN (SELECT DISTINCT company_id
					FROM transaction
					WHERE declined = 1);

                    