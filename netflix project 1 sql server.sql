use project1

select * from netflix;
--count the number of movies vs tv shows

select type,count(type) as total 
from netflix
group by type;

--find the most common rating for movies and tv shows

select type,rating,count(rating) as count_rating 
from netflix 
group by rating,type
order by count_rating desc;

--ranking the top one type
select type,rating,count(*) as counts,rank() over(partition by
type order by count(*) desc) as ranking from netflix
group by rating,type
order by counts desc;

--list all  movies realeased in a specific year (eg 2020)
select * from netflix
--filter2020
--movies
select * from netflix
where type='movie' and release_year=2020;

--find the top 5 countries with the most content on netflix
select  * from netflix;

select country,count(show_id) as total 
from netflix
group by country
order by total desc;

select 
* 
 from netflix;

 --identify the longest movie

 select * from netflix;

 select * from netflix
 where type='Movie'
 and
 duration = (select max(duration) from netflix);

 --find content added in the last 5 years
 select 

 select * from netflix
 where
  date_added >= DATEADD(YEAR, -5, GETDATE());

  --find all movies/tv shows by director 'Rajiv chilaka'

  select * from netflix where director like'%Rajiv chilaka';

  --list all tv shows with more than 5 seasons


  select *
 from netflix where
  type= 'TV show'
  and
  duration > '5 Seasons';

  --count the number of content items in each genre

  select * from netflix;

  --find each year and the average numbers of content release by india on netflix
  --return top 5 years with highest avg content release
 

  SELECT 
    YEAR(CAST(date_added AS DATE)) AS year, 
    COUNT(*) AS total_content,
    CAST(COUNT(*) AS FLOAT) * 100 / (
        SELECT COUNT(*) 
        FROM netflix 
        WHERE country = 'India'
    ) AS avg_content_per_year
FROM 
    netflix
WHERE 
    country = 'India'
GROUP BY 
    YEAR(CAST(date_added AS DATE))
ORDER BY 
    year;

	---list all movies that are documentaries
	select * from netflix

	select * from netflix
	where type='Movie'
	and
	listed_in like'%Documentaries';

	--find all content without a director
	select * from netflix
	where director is null;

	--find how many movies actor 'salman khan' appeared in last 10 years
	select * from netflix
	where
	country='india'
	and 
	type='Movie' 
	and
	casts like
	'%Salman Khan%'
	and
	release_year > year(dateadd(year,-10,getdate())); 

	--find the top actors who have appeared in the highest number of movies produced in india

	select * from netflix where country='india';

SELECT 
    TRIM(value) AS actors, 
    COUNT(*) AS total_content
FROM 
    netflix
CROSS APPLY 
    STRING_SPLIT(casts, ',')
GROUP BY 
    TRIM(value)
ORDER BY 
    total_content DESC;
