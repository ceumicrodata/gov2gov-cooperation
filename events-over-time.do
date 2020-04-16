clear all
local files : dir "temp" files "bq-results*.dta"

tempfile all
save `all', replace emptyok

foreach file in `files' {
	use "temp/`file'", clear
	append using `all'
	save `all', replace
}

gen YearMonth = int(SQLDATE/100)

* drop events mentioned only once 
drop if NumMentions <= 1
* drop historical events mentioned
drop if YearMonth < 201401
collapse (sum) Mentions = NumMentions (count) Events = GLOBALEVENTID, by(Actor1CountryCode Actor2CountryCode EventRootCode YearMonth)

* balance panel over time
reshape wide Events Mentions, i(Actor1CountryCode Actor2CountryCode EventRootCode) j(YearMonth)
reshape long

reshape wide Events Mentions, i(Actor1CountryCode Actor2CountryCode YearMonth) j(EventRootCode)
mvencode Events* Mentions*, mv(0)

generate date = date(string(YearMonth, "%6.0f"), "YM")
format date %td

label variable Events3 "Intent to cooperate"
label variable Events4 "Visits and negotiations"
label variable Events5 "Diplomatic events"
label variable Events6 "Material cooperation"

compress
save "output/gov2gov-events-by-month.dta", replace

* example graph
tw  (line Events3 Events4 Events5 date if Actor1CountryCode=="HUN" & Actor2CountryCode=="RUS", sort) ///
	, scheme(s2mono) ytitle("") xtitle("")
	
graph export "output/hun2rus-example.pdf", replace

* save to .csv
generate str YM = string(int(YearMonth/100)) + "-" + string(YearMonth - 100*int(YearMonth/100), "%02.0f")
drop YearMonth
rename YM YearMonth

local  variables Actor1CountryCode Actor2CountryCode YearMonth Events3 Events4 Events5 Events6 Mentions3 Mentions4 Mentions5 Mentions6
keep  `variables'
order `variables'

sort Actor1 Actor2 YearMonth
export delimited "output/gov2gov-events-by-month.csv", replace
