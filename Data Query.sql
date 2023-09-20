Create database Olympics_Research

use Olympics_Research

create table athlete_events
(
ID	int,
Name varchar(100),
Sex	varchar(10),
Age	int,
Height int,
Weight int,
Team varchar(100),
NOC varchar(100),	
Games varchar(100),	
Year int,
Season varchar(100),	
City varchar(100),	
Sport varchar(100),	
Event varchar(100),	
Medal varchar(100)
)

Create table noc_regions
(
NOC varchar(10),
region varchar(20),
notes nvarchar(50)
)