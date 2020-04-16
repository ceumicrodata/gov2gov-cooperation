output/gov2gov-events-by-month.csv: events-over-time.do temp/bq-results*.dta 
	stata -b do $<
temp/%.dta: convert-to-stata.do externals/gdelt/%.csv
	stata -b do $< $(notdir $(basename $@))