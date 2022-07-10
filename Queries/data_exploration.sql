SELECT * FROM country;

SELECT COUNT(country) as "Number of Countries"
FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT SUM(buyers) as "Total Buyers"
FROM country

SELECT SUM(femalebuyers), SUM(malebuyers)
FROM country;

SELECT * FROM customer;

SELECT country, SUM(productssold) as "Products Sold"
FROM customer
GROUP BY country
ORDER BY "Products Sold" DESC;

SELECT country, SUM(productsbought) as "Products Bought"
FROM customer
GROUP BY country
ORDER BY "Products Bought" DESC;

SELECT country, COUNT(hasanyapp) as "Has"
FROM customer
WHERE hasanyapp = TRUE
GROUP BY country
ORDER BY "Has" DESC;

SELECT country, COUNT(hasanyapp) as "No"
FROM customer
WHERE hasanyapp = FALSE
GROUP BY country
ORDER BY "No" DESC;

SELECT * FROM customer;

SELECT hasanyapp,SUM(productsbought) as "Total Bought", SUM(socialproductsliked) as "Total Liked"
FROM customer
GROUP BY hasanyapp
ORDER BY "Total Bought" DESC;

SELECT * FROM top_sellers

