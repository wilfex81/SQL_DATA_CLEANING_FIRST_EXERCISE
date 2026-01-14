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

-- 1. Remove Duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, percentage_laid_off, `date`, stage,
 country, funds_raised_millions) AS row_num
FROM layoffs_staging;


WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, 
percentage_laid_off, `date`,
 stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = "Aqua Security";

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, 
percentage_laid_off, `date`,
 stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE  #Failed
FROM duplicate_cte
WHERE row_num > 1;

#Option 2

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



SELECT *
FROM layoffs_staging2
WHERE row_num > 1
;

INSERT layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location, industry, total_laid_off, 
percentage_laid_off, `date`,
 stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
;


SET SQL_SAFE_UPDATES = 0;

DELETE FROM layoffs_staging2 
WHERE
    row_num > 1
;
SET SQL_SAFE_UPDATES = 1; 



SELECT *
FROM
    layoffs_staging2
;












