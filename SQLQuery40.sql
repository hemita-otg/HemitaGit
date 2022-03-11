select distinct top 10 category,brand,manufacturer,advertiser,market from acfvdetailreports with (nolock)
where brand like '%david%' 

select distinct Advertiser,market from conacDetailReports
where Advertiser like 'rite%'