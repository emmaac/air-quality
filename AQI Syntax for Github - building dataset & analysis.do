*---------------------------------------------------------------------------*						
* 				Emma Armstrong-Carter	2022								*
*---------------------------------------------------------------------------*
clear
glo data "/Users/eacarter/Dropbox/Independent Projects/AQI/Data"
glo aqi_data "/Users/eacarter/Dropbox/Independent Projects/AQI/Data/AQI Data"
cd "/Users/eacarter/Dropbox/Independent Projects/AQI/Data"
glo output "/Users/eacarter/Dropbox/Independent Projects/AQI"
set maxvar 32767
*---------------------------------------------------------------------------*
*Building the data set

* import AQI for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/aqi_2009.csv", clear 
tempfile aqi2009
keep if countyname == "Los Angeles"
rename date original_date
gen date=date(original_date,"YMD")
format date %td
drop original_date countyname statecode countycode statename
save `aqi2009', replace

import delimited "$aqi_data/aqi_2010.csv", clear 
tempfile aqi2010
keep if countyname == "Los Angeles"
rename date original_date
gen date=date(original_date,"YMD")
format date %td
drop original_date countyname statecode countycode statename
save `aqi2010', replace

import delimited "$aqi_data/aqi_2011.csv", clear 
tempfile aqi2011
keep if countyname == "Los Angeles"
rename date original_date
gen date=date(original_date,"YMD")
format date %td
drop original_date countyname statecode countycode statename
save `aqi2011', replace

append using `aqi2010' `aqi2009'
tempfile aqi_all
save `aqi_all', replace

*---------------------------------------------------------------------------*
*import ozone for 2010 and 2011
*---------------------------------------------------------------------------*
import delimited "$aqi_data/ozone_2009.csv", clear 
tempfile ozone2009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi ozone
sort date
collapse (mean) ozone, by(date)
keep date ozone
label variable ozone "Ozone"
save `ozone2009', replace

import delimited "$aqi_data/ozone_2010.csv", clear 
tempfile ozone2010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi ozone
sort date
collapse (mean) ozone, by(date)
keep date ozone
label variable ozone "Ozone"
save `ozone2010', replace

import delimited "$aqi_data/ozone_2011.csv", clear 
tempfile ozone2011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi ozone
sort date
collapse (mean) ozone, by(date)
keep date ozone
label variable ozone "Ozone"
save `ozone2011', replace

append using `ozone2010' `ozone2009'
tempfile ozone_all
save `ozone_all', replace

*---------------------------------------------------------------------------*
*import so2 for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/so2_2009.csv", clear 
tempfile so22009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi so2
sort date
collapse (mean) so2, by(date)
keep date so2
label variable so2 "So2"
save `so22009', replace

import delimited "$aqi_data/so2_2010.csv", clear 
tempfile so22010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi so2
sort date
collapse (mean) so2, by(date)
keep date so2
label variable so2 "So2"
save `so22010', replace

import delimited "$aqi_data/so2_2011.csv", clear 
tempfile so22011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi so2
sort date
collapse (mean) so2, by(date)
keep date so2
label variable so2 "So2"
save `so22011', replace

append using `so22010' `so22009'
tempfile so2_all
save `so2_all', replace

*---------------------------------------------------------------------------*
*import no2 for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/no2_2009.csv", clear 
tempfile no22009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi no2
sort date
collapse (mean) no2, by(date)
keep date no2
label variable no2 "No2"
save `no22009', replace

import delimited "$aqi_data/no2_2010.csv", clear 
tempfile no22010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi no2
sort date
collapse (mean) no2, by(date)
keep date no2
label variable no2 "No2"
save `no22010', replace

import delimited "$aqi_data/no2_2011.csv", clear 
tempfile no22011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi no2
sort date
collapse (mean) no2, by(date)
keep date no2
label variable no2 "No2"
save `no22011', replace

append using `no22010' `no22009'
tempfile no2_all
save `no2_all', replace

*---------------------------------------------------------------------------*
*import co for 2010 and 2011
*---------------------------------------------------------------------------*
import delimited "$aqi_data/co_2009.csv", clear 
tempfile co2009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi co
sort date
collapse (mean) co, by(date)
keep date co
label variable co "Co"
save `co2009', replace


import delimited "$aqi_data/co_2010.csv", clear 
tempfile co2010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi co
sort date
collapse (mean) co, by(date)
keep date co
label variable co "Co"
save `co2010', replace

import delimited "$aqi_data/co_2011.csv", clear 
tempfile co2011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi co
sort date
collapse (mean) co, by(date)
keep date co
label variable co "Co"
save `co2011', replace

append using `co2010' `co2009'
tempfile co_all
save `co_all', replace

*---------------------------------------------------------------------------*
*import pm10 for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/pm10_2009.csv", clear //wrong
tempfile pm102009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm10
sort date
collapse (mean) pm10, by(date)
keep date pm10
label variable pm10 "Pm10"
save `pm102009', replace

import delimited "$aqi_data/pm10_2010.csv", clear 
tempfile pm102010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm10
sort date
collapse (mean) pm10, by(date)
keep date pm10
label variable pm10 "Pm10"
save `pm102010', replace

import delimited "$aqi_data/pm10_2011.csv", clear 
tempfile pm102011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm10
sort date
collapse (mean) pm10, by(date)
keep date pm10
label variable pm10 "Pm10"
save `pm102011', replace

append using `pm102009' `pm102010' 
tempfile pm10_all
save `pm10_all', replace

*---------------------------------------------------------------------------*
*import pm2.5 for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/pm25_2009.csv", clear 
tempfile pm25_2009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm25
sort date
collapse (mean) pm25, by(date)
keep date pm25
label variable pm25 "Pm2.5"
save `pm25_2009', replace

import delimited "$aqi_data/pm25_2010.csv", clear 
tempfile pm25_2010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm25
sort date
collapse (mean) pm25, by(date)
keep date pm25
label variable pm25 "Pm2.5"
save `pm25_2010', replace

import delimited "$aqi_data/pm25_2011.csv", clear //wrong
tempfile pm25_2011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename aqi pm25
sort date
collapse (mean) pm25, by(date)
keep date pm25
label variable pm25 "Pm2.5"
save `pm25_2011', replace

append using `pm25_2009' `pm25_2010' 
tempfile pm25_all
save `pm25_all', replace
isid date

*---------------------------------------------------------------------------*
*import temp for 2010 and 2011
*---------------------------------------------------------------------------*
import delimited "$aqi_data/temp_humidity/temp_2009.csv", clear 
tempfile temp2009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean temp
sort date
collapse (mean) temp, by(date)
keep date temp
label variable temp "Temp"
save `temp2009', replace


import delimited "$aqi_data/temp_humidity/temp_2010.csv", clear 
tempfile temp2010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean temp
sort date
collapse (mean) temp, by(date)
keep date temp
label variable temp "Temp"
save `temp2010', replace

import delimited "$aqi_data/temp_humidity/temp_2011.csv", clear 
tempfile temp2011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean temp
sort date
collapse (mean) temp, by(date)
keep date temp
label variable temp "Temp"
save `temp2011', replace

append using `temp2010' `temp2009'
tempfile temp_all
save `temp_all', replace

*---------------------------------------------------------------------------*
*import humid for 2010 and 2011
*---------------------------------------------------------------------------*

import delimited "$aqi_data/temp_humidity/humid_2009.csv", clear 
tempfile humid2009
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean humid
sort date
collapse (mean) humid, by(date)
keep date humid
label variable humid "Humid"
save `humid2009', replace

import delimited "$aqi_data/temp_humidity/humid_2010.csv", clear 
tempfile humid2010
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean humid
sort date
collapse (mean) humid, by(date)
keep date humid
label variable humid "Humid"
save `humid2010', replace

import delimited "$aqi_data/temp_humidity/humid_2011.csv", clear 
tempfile humid2011
keep if countyname == "Los Angeles"
rename datelocal original_date
gen date=date(original_date,"YMD")
format date %td
rename arithmeticmean humid
sort date
collapse (mean) humid, by(date)
keep date humid
label variable humid "Humid"
save `humid2011', replace

append using `humid2010' `humid2009'
tempfile humid_all
save `humid_all', replace


*---------------------------------------------------------------------------*
			*load diaries
*---------------------------------------------------------------------------*

*diary variables
use "$data/Full_Quant_Diary_W1W2.dta", clear 
tempfile diary
rename *, lower
mvdecode *, mv(-9999)

*keep
keep aid id* merge_id_d  weekday* acompdt* schday* afeel*  happy* distress*  adate


*convert wide to long 
reshape long weekday_ weekday_w2_ acompdt_w2_ acompdt_ schday_ schday_w2_  ///
	happy_ happy_w2_ distress_ distress_w2_ ///
	afeel16_ afeel15_ afeel14_ afeel13_ afeel12_ afeel11_ afeel10_ ///
	afeel9_w2_ afeel8_w2_ afeel7_w2_ afeel6_w2_ afeel5_w2_ afeel4_w2_ afeel3_w2_ afeel2_w2_ afeel1_w2_ ///
	afeel16_w2_ afeel15_w2_ afeel14_w2_ afeel13_w2_ afeel12_w2_ afeel11_w2_ afeel10_w2_ ///
	afeel9_ afeel8_ afeel7_ afeel6_ afeel5_ afeel4_ afeel3_ afeel2_ afeel1_ ///
	, i(aid) j(day) 


*rename wave 1
loc vars  acompdt_  weekday_ schday_ afeel16_ afeel15_ afeel14_ afeel13_ afeel12_ afeel11_ afeel10_ afeel9_ ///
	afeel8_ afeel7_ afeel6_ afeel5_ afeel4_ afeel3_ afeel2_ afeel1_ happy_  distress_ 
	foreach y of loc vars {
	rename `y' `y'w1
}

*rename wave 2
rename (*_w2_) (*_w2)


*convert to long waves too
reshape long weekday_w  acompdt_w schday_w happy_w distress_w  ///
	afeel16_w afeel15_w afeel14_w afeel13_w afeel12_w afeel11_w afeel10_w ///
	afeel9_w afeel8_w afeel7_w afeel6_w afeel5_w afeel4_w afeel3_w afeel2_w afeel1_w ///
	, i(aid day) j(year) 
rename (*_w) (*)

*browse
sort id year day
order id day year acompdt adate afeel1 afeel2 afeel3 afeel4 afeel5 afeel6 afeel7 afeel8 afeel9 afeel10 afeel11 afeel11 afeel12 afeel13 afeel14 afeel15 afeel16
	
*rename date 
rename adate daymonth

*format date -> must be Numeric daily date (float)
rename acompdt date
format date %td
recast float date
sort date
order id day date

*missing variables
mdesc
drop if date==. //2,294 missing dates

save `diary'

*---------------------------------------------------------------------------* 
*merge in long form
*---------------------------------------------------------------------------*
foreach temp in `aqi_all' `ozone_all' `so2_all' `no2_all' `co_all' `pm10_all' `pm25_all' `temp_all' `humid_all'  {
	merge m:1 date using  `temp' 
	drop _merge
}

order id day date aqi ozone so2 no2 co
drop if id ==.
drop if date ==. //date missing for 18% of variables
browse
*---------------------------------------------------------------------------*
		*clean
*---------------------------------------------------------------------------*

*rename feelings
label variable afeel1 "On edge"
label variable afeel2 "Joyful"
label variable afeel3 "Exhausted"
label variable afeel4 "Sad"
label variable afeel5 "Unable to concentrate"
label variable afeel6 "Worn-out" 
label variable afeel7 "Happy"
label variable afeel8 "Uneasy"
label variable afeel9 "Fatigued"
label variable afeel10 "Hopeless"
label variable afeel11 "Nervous"
label variable afeel12 "Discouraged"
label variable afeel13 "Calm"
label variable afeel14 "Headache"
label variable afeel15 "Back, joint, or muscle pain"
label variable afeel16 "Trouble sleeping"

rename distress old_distress
rename happy old_happy

*make emo variables
egen distress = rowmean(afeel4 afeel10 afeel12 afeel1 afeel5 afeel8 afeel11) //sad, hopeless, discouraged, on edge, unable to concentrate, uneasy, nervous (no stressed, worried )
egen happy = rowmean(afeel2 afeel7)
egen burnout = rowmean(afeel9 afeel3 afeel6) //fatigue exhausted, and worn-out 
egen pain = rowmean(afeel14 afeel15)


*make new variables
g cat =. 
replace cat = 1 if category=="Good" 
replace cat = 2 if category=="Moderate" 
replace cat = 3 if category=="Unhealthy for Sensitive Groups" 


*save tempfile so far
save "$data/air_and_dairy.dta", replace
use"$data/air_and_dairy.dta", clear
tempfile airdiary
recast int id
save `airdiary', replace

*---------------------------------------------------------------------------*
		*add trait variables 
*---------------------------------------------------------------------------*

*trait variables - wanted vars new

use "$data/Full_Quant_Diary_W1W2 - wanted vars new.dta", clear
tempfile trait
rename *, lower


foreach temp in `airdiary'  {
	merge 1:m id using  `temp' 
	*drop if _merge==2 //6 kids have trait data but no useable diary data with dates
}

drop if id ==. 

*save out
save "$data/Merged AQI Diary Data.dta", replace

*---------------------------------------------------------------------------*
		*NOW the dataset is built, conduct the analysis 
*---------------------------------------------------------------------------*
glo data "/Users/eacarter/Dropbox/Independent Projects/AQI/Data"
glo aqi_data "/Users/eacarter/Dropbox/Independent Projects/AQI/Data/AQI Data"
cd "/Users/eacarter/Dropbox/Independent Projects/AQI/Data"
glo output "/Users/eacarter/Dropbox/Independent Projects/AQI/Output"
use "$data/Merged AQI Diary Data.dta", replace

*---------------------------------------------------------------------------*
*recode missing variables 
mvdecode *, mv(-9998)


*alphas
alpha afeel4 afeel10 afeel12 afeel1 afeel5 afeel8 afeel11 //distress 
alpha afeel9 afeel3 afeel6 //burnout

*drop unwanted variables
drop aid id_w2 merge_id _merge afeel1 afeel2 afeel3 afeel4 afeel5 afeel6 afeel7 afeel8 afeel9 afeel10 afeel11 afeel12 afeel13 afeel14 afeel15 afeel16 definingparameter definingsite

*rename
rename aphysical aphysical_w1
rename aysrsomatic aysrsomatic_w1
rename pcbclsomatic pcbclsomatic_w1
rename scbclsomatic scbclsomatic_w1

*sort
sort id year day 
order id day year ozone so2 no2 co pm25 pm10 aqi temp humid happy distress burnout 

*make next day vars
sort id year day
loc vars ozone so2 no2 co aqi pm25 pm10 burnout distress
	foreach y of loc vars {
	g `y'_nd=`y'[_n+1]  //next day 
		replace `y'_nd=. if day==14
		replace `y'_nd=. if day[_n+1]!=day[_n]+1
	g `y'_pd=`y'[_n-1]  //next day 
		replace `y'_pd=. if day==1
		replace `y'_pd=. if day[_n-1]!=day[_n]-1
}


*make several day lagged vars
sort id year day
loc vars ozone so2 no2 co aqi pm25 pm10 burnout distress
	foreach y of loc vars {
	g `y'_plus3lag=`y'[_n+3]  //next day 
		replace `y'_plus3lag=. if day==14
		replace `y'_plus3lag=. if day==13
		replace `y'_plus3lag=. if day==12
		replace `y'_plus3lag=. if day[_n+3]!=day[_n]+3
		
	g `y'_min3lag=`y'[_n-3]  //minus three day lag
		replace `y'_min3lag=. if day==1
		replace `y'_min3lag=. if day==2
		replace `y'_min3lag=. if day==3
		replace `y'_min3lag=. if day[_n-3]!=day[_n]-3

	g `y'_plus5lag=`y'[_n+5]  //next day 
		replace `y'_plus5lag=. if day==14
		replace `y'_plus5lag=. if day==13
		replace `y'_plus5lag=. if day==12
		replace `y'_plus5lag=. if day==11
		replace `y'_plus5lag=. if day==10
		replace `y'_plus5lag=. if day[_n+5]!=day[_n]+5
		
	g `y'_min5lag=`y'[_n-5]  //minus three day lag
		replace `y'_min5lag=. if day==1
		replace `y'_min5lag=. if day==2
		replace `y'_min5lag=. if day==3
		replace `y'_min5lag=. if day==4
		replace `y'_min5lag=. if day==5
		replace `y'_min5lag=. if day[_n-5]!=day[_n]-5
		
		
	g `y'_plus7lag=`y'[_n+7]  //next day 
		replace `y'_plus7lag=. if day==14
		replace `y'_plus7lag=. if day==13
		replace `y'_plus7lag=. if day==12
		replace `y'_plus7lag=. if day==11
		replace `y'_plus7lag=. if day==10
		replace `y'_plus7lag=. if day==9
		replace `y'_plus7lag=. if day==8
		replace `y'_plus7lag=. if day[_n+7]!=day[_n]+7
		
	g `y'_min7lag=`y'[_n-7]  //minus three day lag
		replace `y'_min7lag=. if day==1
		replace `y'_min7lag=. if day==2
		replace `y'_min7lag=. if day==3
		replace `y'_min7lag=. if day==4
		replace `y'_min7lag=. if day==5
		replace `y'_min7lag=. if day==6
		replace `y'_min7lag=. if day==7
		replace `y'_min7lag=. if day[_n-7]!=day[_n]-7
	
}

browse id year day ozone ozone_nd ozone_pd

* create person-means and mean-centered variables 
sort id 
loc vars ozone so2 no2 co aqi pm25 pm10 temp humid ///
	ozone_nd so2_nd no2_nd co_nd aqi_nd pm25_nd pm10_nd ///
	ozone_pd so2_pd no2_pd co_pd aqi_pd pm25_pd pm10_pd ///
	burnout distress 
	foreach y of loc vars {
by id: summarize `y', meanonly
by id: egen m`y' = mean(`y')
by id: gen c`y' = `y' - m`y'
}

*make time varying physical symptoms variables
g aphysical = aphysical_w1
	replace aphysical=aphysical_w2 if year ==2
	
* standardize 
sort id 
loc vars burnout distress aysrsomatic_w1 aphysical_w1 aphysical_w2  aysrsomatic_w2 pcbclsomatic_w2 pphysical_w2 aphysical distress_nd burnout_nd
	foreach y of loc vars {
egen z`y' = std(`y')
}


* create interactions 
sort id 
loc vars ozone so2 no2 co aqi pm25 pm10
	foreach y of loc vars {
g c`y'Xaphysical_w1 = c`y'*zaphysical_w1 
g c`y'Xaysrsomatic_w1  = c`y'*zaysrsomatic_w1 
g c`y'Xaphysical_w2 = c`y'*zaphysical_w2 
g c`y'Xaphysical = c`y'*zaphysical

}

* create categories  
sort id 
loc vars ozone so2 no2 co aqi pm25 pm10
	foreach y of loc vars {
g cat_`y'=. 
replace cat_`y'=0 if `y'<50
replace cat_`y'=1 if `y'>49 & `y'<100
replace cat_`y'=2 if `y'>99 & `y'<150
}


?
*save out for R
save "$data/AQI-Diary for R.dta", replace

?


*look at season
*save out
preserve
keep if year ==1
tab date
28.02% nov - feb, 
48.7% march - may
23.28% June -August 
display 100- (28.02+48.70) 
restore

preserve
keep if year ==2
tab date 28.28 until Feb
70.03 until May 
the rest until 



/*---------------------------------------------------------------------------*
*iccs
*/*---------------------------------------------------------------------------*
*icc wave 1 to wave 2

sort id 
loc vars no2 co ozone so2 weekday temp humid burnout distress aphysical
	foreach y of loc vars {
icc `y' id 
}

preserve
	icc prts_f id 
restore



*descriptives for sample
eststo clear
preserve 
	collapse (mean) agender aage_w2 income pedu, by(id)
	*drop if aage_w2==0
	tab aage_w2
	tab pedu
	
/*---------------------------------------------------------------------------*
	*descriptive table
*/*---------------------------------------------------------------------------*

eststo clear
preserve 
	collapse (mean) no2 co ozone so2 weekday temp humid burnout distress aphysical , by(id)
	eststo: estpost summarize no2 co ozone so2 weekday temp humid burnout distress aphysical
	esttab using "$output/Descriptive2.xls", tab cells("mean sd min max") replace
restore		

/*---------------------------------------------------------------------------*
	*correlations 
*/*---------------------------------------------------------------------------*
preserve
	collapse (mean) no2 co ozone so2 weekday temp humid burnout distress aphysical , by(id)
	estpost correlate no2 co ozone so2 weekday temp humid burnout distress aphysical, matrix 
	esttab . using "$output/Table1.csv", label replace b(a2) not unstack compress noobs ///
	star( * 0.05 ** 0.01 *** 0.001)
restore

*---------------------------------------------------------------------------*
	*MLM Regressions: 
*---------------------------------------------------------------------------*

*burnout then distress
loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (zburnout <- weekday  c`y' m`y'  M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", e(r2) bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (burnout <- weekday  c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	

loc vars no2 co ozone so2 
	foreach y of loc vars {

gsem (zdistress <- weekday  c`y' m`y'  M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (zdistress <- weekday  c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	

*---------------------------------------------------------------------------*
	*next day analyses
*---------------------------------------------------------------------------*

*burnout & distress 
loc vars  no2 co ozone so2 
	foreach y of loc vars {
gsem (burnout_nd <- weekday cburnout c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/MLM5.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (burnout_nd <- weekday cburnout c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM5.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

}	

loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (distress_nd <- weekday cdistress  c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/MLM5.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (distress_nd <- weekday cdistress c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM5.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	

*---------------------------------------------------------------------------*
	*several day lagged analysis
*---------------------------------------------------------------------------*

* 3 day lag 
loc vars  no2 co //ozone so2  //ozone X physical --> burnout and no2 X physical --> burnout
	foreach y of loc vars {
gsem (burnout_plus3lag <- weekday cburnout c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/3lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (burnout_plus3lag <- weekday cburnout c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/3lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}

loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (distress_plus3lag <- weekday cdistress  c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/3lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (distress_plus3lag <- weekday cdistress c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/3lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}

*burnout & distress 
loc vars  no2 ozone co  so2 //
	foreach y of loc vars {
gsem (burnout_plus5lag <- weekday cburnout c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/5lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (burnout_plus5lag <- weekday cburnout c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/5lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}

loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (distress_plus5lag <- weekday cdistress  c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/5lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (distress_plus5lag <- weekday cdistress c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/5lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}

*burnout & distress 
loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (burnout_plus7lag <- weekday cburnout c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/7lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (burnout_plus7lag <- weekday cburnout c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/7lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}

loc vars no2 co ozone so2 
	foreach y of loc vars {
gsem (distress_plus7lag <- weekday cdistress  c`y'  m`y'  M1[id] M2[id>year])
outreg2 using "$output/7lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
gsem (distress_plus7lag <- weekday cdistress c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/7lag.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}


*---------------------------------------------------------------------------*
*sensitivity analyses: 
*---------------------------------------------------------------------------*
*control for temp and humidity
loc vars no2 co ozone so2  //significnat dirrect effects for no2 and so2. sig interactions for co and no2
	foreach y of loc vars {
gsem (zburnout <- weekday c`y' m`y' temp humid M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
 
gsem (zburnout <- weekday  c`y' m`y' temp humid aphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

}	

*distress
loc vars  no2 co ozone so2 //significnat dirrect effects for no2. sig interactions for co and no2
	foreach y of loc vars {
gsem (zdistress <- weekday  c`y' m`y' temp humid M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (zdistress <- weekday  c`y' m`y' temp humid aphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/MLM4.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

}	

*simultaneous 
loc vars  burnout distress //significnat dirrect effects for no2 and so2. sig interactions for co and no2
	foreach y of loc vars {
gsem (`y'  <- weekday cno2 cco cozone cso2 mno2 mco mozone mso2  M1[id] M2[id>year])
outreg2 using "$output/MLM2.xls", bdec(2) sdec(2) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
 
gsem (`y'  <- weekday cno2 cco cozone cso2 mno2 mco mozone mso2 ///
		aphysical cno2Xaphysical ccoXaphysical cozoneXaphysical cso2Xaphysical ///
			M1[id] M2[id>year])
outreg2 using "$output/MLM2.xls", bdec(2) sdec(2) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	

*---------------------------------------------------------------------------*
* same day mediation: air quality --> burnout --> distress
*---------------------------------------------------------------------------*

*run mediation for NO2
gsem (zdistress <- zburnout cno2  M1[id]) (zburnout <-  cno2 M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[zdistress:zburnout]*_b[zburnout:cno2]

*total effect
nlcom _b[zdistress:zburnout]+_b[zdistress:zburnout]*_b[zburnout:cno2]
?

*run mediation for CO
gsem (zdistress <- zburnout cco  M1[id]) (zburnout <-  cco M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[zdistress:zburnout]*_b[zburnout:cco]

*total effect
nlcom _b[zdistress:zburnout]+_b[zdistress:zburnout]*_b[zburnout:cco]

*---------------------------------------------------------------------------*
*mediation: air quality --> burnout --> distress next day
*---------------------------------------------------------------------------*


*run mediation for NO2
gsem (zdistress_nd <- zburnout zdistress cno2  M1[id]) (zburnout <- cno2 M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[zdistress_nd:zburnout]*_b[zburnout:cno2]

*total effect
nlcom _b[zdistress_nd:zburnout]+_b[zdistress_nd:zburnout]*_b[zburnout:cno2]
?

*run mediation for CO
gsem (zdistress_nd<- zburnout zdistress cco  M1[id]) (zburnout <-  cco M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[zdistress_nd:zburnout]*_b[zburnout:cco]

*total effect
nlcom _b[zdistress_nd:zburnout]+_b[zdistress_nd:zburnout]*_b[zburnout:cco]

*---------------------------------------------------------------------------*
*mediation: air quality --> distress --> fatigue
*Could also be that emotional distress causes fatigue.  ? (could add in future)
*---------------------------------------------------------------------------*


*run mediation for NO2
gsem (burnout_nd <-  distress burnout cno2  M1[id]) (distress <- cno2 M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[burnout_nd:distress]*_b[distress:cno2]

*total effect
nlcom _b[burnout_nd:distress]+_b[burnout_nd:distress]*_b[distress:cno2]


*run mediation for CO
gsem (burnout_nd <-  distress cco   M1[id]) (distress <- cco M2[id] ), cov(M1[id]*M2[id]@0)

*calculate indirect effect
nlcom _b[burnout_nd:distress]*_b[distress:cno2]

*total effect
nlcom _b[burnout_nd:distress]+_b[burnout_nd:distress]*_b[distress:cco]


*---------------------------------------------------------------------------*
	*Supplementary: PM10 and PM2
*---------------------------------------------------------------------------*

*burnout then distress
loc vars pm10 pm25
	foreach y of loc vars {
gsem (burnout <- weekday  c`y' m`y'  M1[id] M2[id>year])
outreg2 using "$output/S9.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
 
gsem (burnout <- weekday  c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/S9.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	


loc vars pm10  pm25 
	foreach y of loc vars {

gsem (distress <- weekday  c`y' m`y'  M1[id] M2[id>year])
outreg2 using "$output/S9.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")

gsem (distress <- weekday  c`y' m`y' zaphysical  c`y'Xaphysical M1[id] M2[id>year])
outreg2 using "$output/s9.xls", bdec(3) sdec(3) label alpha(0.001, 0.01, 0.05) sym(***,**, *) ctitle("`y'")
}	
