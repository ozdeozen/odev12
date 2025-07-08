SELECT COUNT(*) 
FROM film f 
WHERE f.length > (
    SELECT AVG(length) 
    FROM film
);

SELECT COUNT(*) 
FROM film f 
WHERE f.rental_rate = (
    SELECT MAX(rental_rate) 
    FROM film
);

SELECT *
FROM film
WHERE rental_rate = (
      SELECT MIN(rental_rate) 
      FROM film
    )
   OR replacement_cost = (
      SELECT MIN(replacement_cost) 
      FROM film
    );

SELECT *
FROM customer c
WHERE c.customer_id IN (
    SELECT p.customer_id
    FROM payment p
    GROUP BY p.customer_id
    HAVING COUNT(*) = (
        SELECT MAX(cnt) 
        FROM (
            SELECT COUNT(*) AS cnt
            FROM payment
            GROUP BY customer_id
        ) AS sub
    )
);
