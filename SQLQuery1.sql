use Portfolioproject;
select * from Coviddeaths
--select location,date,total_cases,total_deaths,population from Coviddeaths
--order by 1,2

--Looking at Death Percentage vs Total case
select Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage  from Coviddeaths
where Location Like 'India'
order by 1,2

--Looking at Covid Case Percentage wrt to population
select Location,date,total_cases,Population,(total_cases/Population)*100 as Covid_Case_Percentage 
from Coviddeaths
where Location Like 'India'
order by 1,2 

--Loooking for countries with highest Infection rate with respect to population 
select Location,max(total_cases) as Total_Case,Population,max((total_cases/Population))*100 as Covid_Case_Percentage 
from Coviddeaths
group by Location,population
order by Covid_Case_Percentage desc

--Looking for country with highest death count wrt to poulation
select Location,max(total_deaths) as Total_deaths,Population,max((total_deaths/Population))*100 as Total_Death_percentage 
from Coviddeaths
group by Location,population
order by Total_Death_percentage desc

--Looking for country with highest death count
select Location,max(cast(total_deaths as int)) as Total_deaths
from Coviddeaths
where continent is not null
group by Location
order by Total_Deaths desc

--Looking for continent with highest case count
select continent,max(cast(total_deaths as int)) as Total_death_count
from Coviddeaths
where continent is not null
group by continent
order by Total_death_count desc

--GLOBAL NUMBERS
select SUM(new_cases) as Total_Global_Cases,SUM(cast(new_deaths as int)) as Total_Global_Deaths,
SUM(cast(new_deaths as int))/SUM(new_cases)*100 as Global_Death_Percentage from Coviddeaths
where continent is not null
