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

SELECT * FROM customer

SELECT AVG(boughtperlikeratio) as "Buying Ratio", Max(boughtperlikeratio) as "Max"
FROM country;

SELECT countrycode, SUM(productsbought) as "Products Bought"
FROM customer
GROUP BY countrycode
ORDER BY "Products Bought" DESC;

SELECT language, SUM(productsbought) as "Products Bought"
FROM customer
GROUP BY language
ORDER BY "Products Bought" DESC;

SELECT country, AVG(productspassrate) as "Pass Rate"
FROM customer
GROUP BY country
ORDER by "Pass Rate" DESC;

SELECT hasprofilepicture, SUM(productsbought), SUM(productssold)
FROM customer 
GROUP BY hasprofilepicture;

SELECT * FROM gender_and_country;

SELECT country, AVG(meanproductssold) as "Average"
FROM gender_and_country
GROUP BY country
ORDER BY "Average" DESC;

----------------------

SELECT * FROM country

SELECT *
FROM country
WHERE buyers > 100
ORDER BY topbuyerratio DESC 
LIMIT 10;

SELECT * FROM country;

SELECT country, buyers, (100* buyers / (SELECT SUM(buyers) as "Total Buyers" FROM country)) as "Proportion of Buyers (%)"
FROM country
ORDER BY "Proportion of Buyers (%)" DESC;

SELECT country, (100* topbuyers / (SELECT SUM(topbuyers) FROM country)) as "Proportion of Top Buyers (%)"
FROM country
ORDER BY "Proportion of Top Buyers (%)" DESC;

-- top buyers were defined by those having bought 10 or more products
SELECT country, (100* buyers / (SELECT SUM(buyers) as "Total Buyers" FROM country)) as "Proportion of Buyers (%)", (100* topbuyers / (SELECT SUM(topbuyers) FROM country)) as "Proportion of Top Buyers (%)"
FROM country
ORDER BY "Proportion of Buyers (%)" DESC
WHERE ("Proportion of Buyers (%)") AND ("Proportion of Top Buyers (%)");

SELECT country, meanproductsbought
FROM country
ORDER BY meanproductsbought DESC;

DROP TABLE product_summary;

SELECT 
	SUM(totalproductsbought) as "Total Products Bought", 
	SUM(totalproductswished) as "Total Products Wished", 
	SUM(totalproductsliked) as "Total Products Liked",
	(100 * (SUM(totalproductsbought)) / (SUM(totalproductswished)))
		as "Percent Bought From Wish List (%)",
	(100 * (SUM(totalproductsbought)) / (SUM(totalproductsliked)))
		as "Percent Bought From Liked Products (%)"
	INTO product_summary
	FROM country
	ORDER BY "Total Products Bought" DESC;

SELECT * FROM product_summary;

SELECT * FROM customer;

DROP TABLE sellers;

SELECT DISTINCT identifierhash,
country,
productslisted,
productssold,
productspassrate,
gender,
hasprofilepicture,
dayssincelastlogin
INTO sellers
from customer
WHERE productslisted > 0;

SELECT COUNT(identifierhash)
FROM sellers;

SELECT COUNT(identifierhash)
FROM customer;

SELECT * FROM sellers;

SELECT gender, ROUND(AVG(productspassrate)) as "Average Pass Rate (%)"
FROM sellers
WHERE productssold > 10
GROUP BY gender;

SELECT hasprofilepicture, ROUND(AVG(productspassrate)) as "Average Pass Rate (%)", SUM(productssold) as "Total Products Sold"
FROM sellers
WHERE productssold > 10
GROUP BY hasprofilepicture;

