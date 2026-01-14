-- Data CLeaning

SELECT * 
FROM layoffs
;


-- 1. Remove Duplicates
-- 2. Standardise the data
-- 3. Null Values or blank values
-- 4. Remove any column and rows that are not necessary(depends)


CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs
;

SELECT * 
FROM layoffs_staging;