SELECT * FROM country;

SELECT COUNT(country) as "Number of Countries"
FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT country, buyers
FROM country
ORDER BY buyers DESC
LIMIT 10;

-- SELECT SUM(buyers) as "Total Buyers"
-- FROM country

-- SELECT SUM(femalebuyers) as "Number of Female Buyers", SUM(malebuyers) as "Number of Male Buyers"
-- FROM country;

SELECT * FROM customer;

SELECT country, SUM(productssold) as "Products Sold"
FROM customer
GROUP BY country
ORDER BY "Products Sold" DESC
LIMIT 10;

SELECT country, SUM(productsbought) as "Products Bought"
FROM customer
GROUP BY country
ORDER BY "Products Bought" DESC
LIMIT 10;

SELECT country, COUNT(hasanyapp) as "Has"
FROM customer
WHERE hasanyapp = TRUE
GROUP BY country
ORDER BY "Has" DESC;

SELECT country, COUNT(hasanyapp) as "Does Not Have App"
FROM customer
WHERE hasanyapp = FALSE
GROUP BY country
ORDER BY "No" DESC;

SELECT * FROM customer;

SELECT hasanyapp, SUM(productsbought) as "Total Bought", SUM(socialproductsliked) as "Total Liked", 100 * CAST(SUM(productsbought) as float) / SUM(socialproductsliked) as "Bought/Liked (%)"
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

SELECT * from top_sellers;

SELECT country, sellers, 100 * sellers / (SELECT SUM(sellers) FROM top_sellers) as  "Proportion of Sellers (%)"
INTO sellers_summary
FROM top_sellers
ORDER BY sellers DESC;

SELECT country, totalproductssold, 100 * totalproductssold / (SELECT SUM(totalproductssold) FROM top_sellers) as  "Proportion of Products Sold (%)"
FROM top_sellers
ORDER BY totalproductssold DESC;


SELECT * FROM gender_and_country;

SELECT country, SUM(totalproductssold)
FROM gender_and_country
GROUP BY country
ORDER BY sum DESC;

DROP TABLE IF EXISTS buyers_by_country;

CREATE TABLE buyers_by_country(
	country_type VARCHAR,
	percent_buyers float
);

INSERT INTO buyers_by_country (country_type, percent_buyers)
VALUES ('France', 100 *(SELECT MAX(buyers) FROM country) / (SELECT SUM(buyers) from country));

INSERT INTO buyers_by_country (country_type, percent_buyers)
VALUES ('Outside France', 100 - (SELECT percent_buyers FROM buyers_by_country))

SELECT * FROM buyers_by_country;



-- How likely are people from other countries to sign up in a C2C website?

SELECT * FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT *
INTO foregin_buyers
FROM country
ORDER BY buyers DESC
OFFSET 1;

SELECT SUM(buyers)
FROM foregin_buyers;

SELECT MAX(buyers)
FROM country;

SELECT SUM(buyers)
from country;



SELECT (SUM(CASE WHEN buyers < (SELECT MAX(buyers) FROM country) THEN buyers ELSE buyers*0 END)) FROM country;


-- Are e-commerce users interested in social network feature?

SELECT * FROM customer;

SELECT COUNT(identifierhash), SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer

SELECT COUNT(identifierhash), SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer
WHERE dayssincelastlogin > 365

SELECT COUNT(identifierhash) , SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer
WHERE dayssincelastlogin < 365




SELECT * FROM country;

SELECT COUNT(country) as "Number of Countries"
FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT country, buyers
FROM country
ORDER BY buyers DESC
LIMIT 10;

------------

SELECT country, SUM(productssold) as "Products Sold"
INTO top_ten_sellers
FROM customer
GROUP BY country
ORDER BY "Products Sold" DESC
LIMIT 10;

SELECT country, SUM(productsbought) as "Products Bought"
INTO top_ten_buyers
FROM customer
GROUP BY country
ORDER BY "Products Bought" DESC
LIMIT 10;

SELECT country, COUNT(hasanyapp) as "Has App"
FROM customer
WHERE hasanyapp = TRUE
GROUP BY country
ORDER BY "Has App" DESC;

SELECT hasanyapp, SUM(productsbought) as "Total Bought", SUM(socialproductsliked) as "Total Liked", 100 * CAST(SUM(productsbought) as float) / SUM(socialproductsliked) as "Bought/Liked (%)"
FROM customer
GROUP BY hasanyapp
ORDER BY "Total Bought" DESC;

------

SELECT * FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT *
INTO foregin_buyers
FROM country
ORDER BY buyers DESC
OFFSET 1;

SELECT SUM(buyers)
FROM foregin_buyers;

SELECT MAX(buyers)
FROM country;

SELECT SUM(buyers)
from country;

SELECT (SUM(CASE WHEN buyers < (SELECT MAX(buyers) FROM country) THEN buyers ELSE buyers*0 END)) FROM country;

SELECT * FROM foregin_buyers

SELECT SUM(buyers) FROM country

SELECT 100 * (SELECT SUM(fb.buyers) FROM foregin_buyers as fb) / SUM(buyers) as "Percent of Buyers (%)" FROM country;

DROP TABLE trade
CREATE TABLE trade(
	kind VARCHAR,
	percent_buyers int
);

SELECT * FROM country;

SELECT country, buyers
FROM country
ORDER BY buyers DESC;

SELECT *
INTO foregin_buyers
FROM country
ORDER BY buyers DESC
OFFSET 1;

SELECT SUM(buyers)
FROM foregin_buyers;

SELECT MAX(buyers)
FROM country;

SELECT SUM(buyers)
from country;

SELECT 100 * (SELECT SUM(fb.buyers) FROM foregin_buyers as fb) / SUM(buyers) as "Domestic Sales (%)",
100 - (100 * (SELECT SUM(fb.buyers) FROM foregin_buyers as fb) / SUM(buyers)) as "International Sales (%)"
INTO sales_stats
FROM country;

SELECT * FROM sales_stats

-------
SELECT * FROM customer;

SELECT COUNT(identifierhash), SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer

SELECT dayssincelastlogin, COUNT(identifierhash), SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer
WHERE dayssincelastlogin > 365

SELECT dayssincelastlogin, COUNT(identifierhash) , SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer
WHERE dayssincelastlogin < 365

SELECT COUNT(identifierhash) , SUM(socialnbfollowers) / COUNT(identifierhash), SUM(socialnbfollows) / COUNT(identifierhash)
FROM customer
WHERE dayssincelastlogin < 30

SELECT hasprofilepicture as "Has Profile Picture", ROUND(AVG(dayssincelastlogin),0) as "Average Days Since Last Login"
FROM customer
GROUP BY hasprofilepicture
ORDER BY hasprofilepicture DESC;

SELECT hasanyapp, AVG(dayssincelastlogin)
FROM customer
GROUP BY hasanyapp

select * from gender_and_country

SELECT * FROM product_summary

