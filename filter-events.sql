SELECT GLOBALEVENTID, SQLDATE, Actor1Code, Actor1CountryCode, Actor1Type1Code, Actor2Code, 
Actor2CountryCode, Actor2Type1Code, EventBaseCode, NumMentions, ActionGeo_CountryCode, SOURCEURL
  FROM `gdelt-bq.gdeltv2.events`
  WHERE Actor1CountryCode IN ('ALB','ARM','AUT','AZE','BIH','BEL','BGR','BLR','CHE','CYP','CZE','DEU','DNK','DZA','EST','EGY','ESP','FIN','FRA','GBR','GEO','GRC','HRV','HUN','IRL','ISR','ISL','ITA','JOR','LBN','LIE','LTU','LUX','LVA','LBY','MAR','MDA','MNE','MKD','MLT','NLD','NOR','POL','PSE','PRT','ROU','SRB','RUS','SWE','SVN','SVK','SYR','TUN','TUR','UKR')
  AND Actor1Type1Code = 'GOV'
  AND Actor2Type1Code = 'GOV'
  AND EventBaseCode IN ('042', '043', '044', '046', '057', '061')
