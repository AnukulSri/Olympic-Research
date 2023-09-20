/*Analysis on Olympics dataset*/
use Olympics_Research

/*Now a query to look at table athlete_events in undefined order.*/
select * from athlete_events;

/*noc_regions table details are imported directly as the file is small*/
select * from noc_regions;

/*1. No. of Regions in the dataset*/

Select count(distinct(region))as total_regions from noc_regions 

/*2. List of the total number of females and males by gender?*/

Select Sex,count(Sex) as Number_of_males_and_females
from athlete_events
group by Sex

/*3. The total number of females and males by city.*/

Select City,Sex,count(Sex)as total
from athlete_events
group by Sex,City
order by city

/*4. No. of males vs females who won medals*/
Select medal,Count(Sex),Sex from athlete_events
group by Sex,medal

/*5. No. of Gold medals from each Country. Top 5 Countries*/

Select Top 5 r.region,count(a.medal)as number_of_medals
from athlete_events a
inner join noc_regions r
on a.NOC = r.NOC
where a.Medal = 'Gold'
group by r.region
order by number_of_medals desc

/*6. List the country that has the highest number of participants sorted by the season.*/

Select top 10 r.region,count(a.team)as number_of_participants,a.Season 
from athlete_events a
inner join noc_regions r
on a.NOC = r.NOC
group by a.team , r.region,a.Season
order by number_of_participants desc, a.Season asc

/*7. Country that has won the highest number of medals and in which year*/

Select top 1 r.region,a.Team,count(a.Medal)as number_of_medal,a.Year
from athlete_events a
join noc_regions r
on a.NOC = r.NOC
where a.Medal in ('Gold','Silver','Bronze')
group by r.region,a.team,a.Year
order by number_of_medal desc

/*8. Medal Attained in Rio Olympics 2016*/

Select a.team,count(medal) as number_of_medal
from athlete_events a
where a.Medal ='Gold' and a.Year= 2016
group by team
order by number_of_medal desc

/*9. No. of athletes in Summer season vs Winter season*/

Select Season,count(Sex)as number_of_athlete from athlete_events
group by Season

/*10. City that is most suitable for multiple games to be played?*/

Select Top 3 City,count(city)as numebr_of_times_games_played_here from athlete_events
group by City
order by numebr_of_times_games_played_here desc

/*11. List the top 10 most popular sports events for women?*/

Select * from athlete_events

Select top 10 Event, count(Sex) as number_of_female from athlete_events
where Sex='F'
group by Event
order by number_of_female desc

/*12. List the top 10 most popular sports events for men?*/
Select top 10 Event, count(Sex) as number_of_male from athlete_events
where Sex='M'
group by Event
order by number_of_male desc

/*13. The number of participants in each sport and the event where it held. 
The participants should be sorted by their height and weight?*/

select top 10 sport, event, count(*) as Participants, region,a.Height,a.Weight
from athlete_events a 
inner join noc_regions n 
on a.noc = n.noc
group by a.sport,a.event,n.region,a.Height,a.Weight
order by a.Height desc,a.Weight desc

