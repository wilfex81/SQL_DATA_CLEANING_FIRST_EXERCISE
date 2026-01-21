-- Exploratory Data Analysis
-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

SELECT *
FROM layoffs_staging2;

-- EASY QUERIES


-- Percentage on how big the layoffs were

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Companies which had 1 is basically 100 percent, meaning the whole company went under

-- if we order by funcs_raised_millions we can see how big some of these companies were
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

-- Companies with the most Total Layoff

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
;


SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;


SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC
;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC
;


SELECT  substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY  `MONTH`
ORDER BY 1 ASC
;

-- TOUGHER QUERIES------------------------------------------------------------------------------------------------------------------------------------


-- Rolling Total of Layoffs Per Month

WITH Rolling_Total AS
(
SELECT  substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY  `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total
;


SELECT company, YEAR(`date`) years, SUM(total_laid_off) Total_Laid_Off
FROM layoffs_staging2
GROUP BY company, years
ORDER BY 3 DESC
;


-- Companies with the most Layoffs  per year. It's a little more difficult.
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`) years, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, years
), Company_Year_Rank AS
(
SELECT * , 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) 
AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <=5
;












































