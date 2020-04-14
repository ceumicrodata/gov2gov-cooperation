clear all
import delimited "externals/datahub/country-codes.csv", varnames(1) encoding("utf-8") bindquotes(strict) case(preserve) clear
tempfile codes
save `codes'

import delimited "externals/eurostat/eu-related-countries.csv", varnames(1) encoding("utf-8") bindquotes(strict) case(preserve) clear
rename iso_3166_2 ISO31661Alpha2

* EU uses a different country code for Greece
replace ISO31661Alpha2 = "GR" if ISO31661Alpha2 == "EL"
* UK is not the official country code
replace ISO31661Alpha2 = "GB" if ISO31661Alpha2 == "UK"

* Kosovo does not have a country code
merge 1:1 ISO31661Alpha2 using `codes', keepusing(ISO31661Alpha3) keep(match) nogen

keep ISO31661Alpha3
export delimited "externals/eu-related-country-codes.csv", replace
