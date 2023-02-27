-- Obtaining the average (N02 & PM2.5 emissions) for a particular 

select FORMAT_TIMESTAMP(“%Y-%m-%d %H”,gps_timestamp) hour,count(*) as count, avg(NO2_ugm3) as NO2, avg(PM25_ugm3) as PM25
from `street-view-air-quality.Dublin_20210506_20220805_GoogleAclimaAQ.AirView_DublinCity_Measurements_ugm3` group by hour order by hour;

-- Selects the average PM2.5 levels for a particular road_id (50m segment of a particular road_name) and groups them by the hours the data was being collected 

select FORMAT_TIMESTAMP(“%Y-%m-%d %H”,gps_timestamp) day_hour, road_id, count(*) as count, avg(PM25_ugm3) as PM25_avg
from `street-view-air-quality.Dublin_20210506_20220805_GoogleAclimaAQ.AirView_DublinCity_Measurements_ugm3`
where PM25_ugm3 is not null
group by road_id, day_hour;