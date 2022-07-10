DROP TABLE if exists customer CASCADE;
DROP TABLE if exists country CASCADE;

CREATE TABLE country(
	country varchar,
	buyers int,
	topbuyers int,
	topbuyerratio float,
	femalebuyers int,
	malebuyers int,
	topfemalebuyers int,
	topmalebuyers int,
	femalebuyersratio float,
	topfemalebuyersratio float,
	boughtperwishlistratio float,
	boughtperlikeratio float,
	topboughtperwishlistratio float,
	topboughtperlikeratio float,
	totalproductsbought int,
	totalproductswished int,
	totalproductsliked int,
	toptotalproductsbought int,
	toptotalproductswished int,
	toptotalproductsliked int,
	meanproductsbought float,
	meanproductswished float,
	meanproductsliked float,
	topmeanproductsbought float,
	topmeanproductswished float,
	topmeanproductsliked float,
	meanofflinedays float,
	topmeanofflinedays float,
	meanfollowers float,
	meanfollowing float,
	topmeanfollowers float,
	topmeanfollowing float,
	PRIMARY KEY(country)
);

CREATE TABLE customer (
	identifierHash VARCHAR,
	type VARCHAR,
	country VARCHAR,
	language VARCHAR,
	socialNbFollowers INT,
	socialNbFollows int,
	socialProductsLiked int,
	productsListed int,
	productsSold int,
	productsPassRate float,
	productsWished int,
	productsBought int,
	gender varchar,
	civilityGenderId int,
	civilityTitle varchar,
	hasAnyApp boolean,
	hasAndroidApp boolean,
	hasIosApp boolean,
	hasProfilePicture boolean,
	daysSinceLastLogin int,
	seniority int,
	seniorityAsMonths float,
	seniorityAsYears float,
	countryCode varchar);

-- SELECT * FROM customer;
-- SELECT * FROM country

DROP TABLE if exists gender_and_country CASCADE;

CREATE TABLE gender_and_country (
	country varchar,
	sex varchar,
	nbsellers int,
	meanproductssold float,
	meanproductslisted float,
	meansellerpassrate float,
	totalproductssold int,
	totalproductslisted int,
	meanproductsbought float,
	meanproductswished float,
	meanproductsliked float,
	totalbought int,
	totalwished int,
	totalproductsliked int,
	meanfollowers float,
	meanfollows float,
	percentofappusers float,
	percentofiosusers float,
	meanseniority float
);

DROP TABLE if exists top_sellers CASCADE;

CREATE TABLE top_sellers(
	country varchar,
	sellers int,
	topsellers int,
	topsellerratio float,
	femalesellersratio float,
	topfemalesellersratio float,
	femalesellers int,
	malesellers int,
	topfemalesellers int,
	topmalesellers int,
	countrysoldratio float,
	bestsoldratio float,
	toptotalproductssold int,
	totalproductssold int,
	toptotalproductslisted int,
	totalproductslisted int,
	topmeanproductssold float,
	topmeanproductslisted float,
	meanproductssold float,
	meanproductslisted float,
	meanofflinedays float,
	topmeanofflinedays float,
	meanfollowers float,
	meanfollowing float,
	topmeanfollowers float,
	topmeanfollowing float
);