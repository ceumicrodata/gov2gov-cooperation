# European Gov2Gov Cooperation Data

## Files
Raw data is in the `externals/` folder. GDELT 2.0 was accessed through Google BigQuery with the .sql scripts and further processed with Stata .do files. Clean data is save in `output/` folder.

The main output table is `output/gov2gov-events-by-month.csv`

## Variables

|-------------------|-----------------------------------------------|
| Actor1CountryCode | ISO-3166-1 3-letter code of initiator country |
| Actor2CountryCode | ISO-3166-1 3-letter code of receiving country |
| YearMonth | Date in `YYYY-MM` format |
| Events3 | Number of events expressing intent to cooperate |
| Events4 | Number of visits and negotiations |
| Events5 | Number of diplomatic events |
| Events6 | Number of events expressing material cooperation |
| Mentions3 | Number of news mentions expressing intent to cooperate |
| Mentions4 | Number of news mentions of visits and negotiations |
| Mentions5 | Number of news mentions of diplomatic events |
| Mentions6 | Number of news mentions expressing material cooperation |

Institutions of the European Union are coded under country code `EUR`.

## Citation
This data is being developed as part of the [RESPECT project](http://respect.eui.eu/) supported by the European Commission. 

> This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 770680.

Please cite as

> Koren, Miklós, Fiorini, Matteo and Santi, Filippo. 2020. "European Gov2Gov Cooperation Data." https://github.com/ceumicrodata/gov2gov-cooperation

## License
All text and figures (`*.md`, `*.txt`, `*.tex`, `*.pdf`) are [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/). All code (`*.sql`, `*.do`, `Makefile`) are subject to the [3-clause BSD license](https://opensource.org/licenses/BSD-3-Clause). All derived data (`output/*`) are subject to [Open Database License](https://opendatacommons.org/licenses/odbl/index.html). Please respect to copyright and license terms of original data vendors (`externals/*`).

## Data sources
### Citation
The GDELT Project. 2020. “Global Database of Events, Language and Tone (GDELT) 2.0.” https://www.gdeltproject.org/data.html.
### License
https://www.gdeltproject.org/about.html#termsofuse