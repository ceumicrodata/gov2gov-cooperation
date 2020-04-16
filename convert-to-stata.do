import delimited "externals/gdelt/`1'.csv", varnames(1) encoding("utf-8") bindquotes(strict) case(preserve) clear
save "temp/`1'.dta", replace
