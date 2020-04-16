SELECT GLOBALEVENTID, SQLDATE, Actor1Code, Actor1CountryCode, Actor1Type1Code, Actor2Code, 
Actor2CountryCode, Actor2Type1Code, EventBaseCode, EventRootCode, NumMentions, ActionGeo_CountryCode, SOURCEURL
  FROM `gdelt-bq.gdeltv2.events`
  WHERE Actor1Code LIKE 'IGOEUREEC%'
  AND Actor2CountryCode IS NOT NULL
  AND NOT Actor2CountryCode = Actor1CountryCode
  AND Actor2Type1Code = 'GOV'
  AND EventRootCode IN ('03', '04', '05', '06')
