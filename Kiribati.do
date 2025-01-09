********************* Kiribati ****************************
***Okay we want a couple variables to examine the country

**import data 
*wbopendata, country(kir - Kiribati) indicator(your indicator) long clear




***the kind of country and how people live there 
*poverty headcount 

*you need to look up how to create a global for submitting the images 

****************************************************************************************************************************************************************************************
*population, youth population and population growth 
wbopendata, country(kir - Kiribati) indicator(SP.POP.TOTL; SP.POP.GROW; SP.POP.0014.TO.ZS; SP.POP.1564.TO.ZS) long clear
tsset year

ren sp_pop_totl population
ren sp_pop_grow pop_growth
ren sp_pop_0014_to_zs baby_child_pop
ren sp_pop_1564_to_zs pop_working

label var population total
label var baby_child_pop "population growth children"
label var pop_working "population growth working age people"
label var pop_growth "population growth rate"




*tsline pop_growth baby_child_pop pop_working, title("Population Growth Rates")
*red, blue and yellow 

twoway (tsline pop_growth, title("Population Growth Rates") bgcolor(ltblue) plotregion(color(ltblue)) graphregion(color(ltblue)) lcolor("sienna") lwidth(thick)) ///
(tsline baby_child, lcolor("sand") lpattern("_") lwidth(thick)) ///
(tsline pop_working, lcolor("white") lpattern("_") lwidth(thick))

/* comparing the growth rates of different demographics. Theyre all steady though
working age people is going up and child is going down. Overall population is the same*/

*I'm curious 
*It worked the second time 
wbopendata, country(kir - Kiribati) indicator(SP.POP.TOTL; SP.POP.GROW; SP.POP.0014.TO; SP.POP.1564.TO) long clear
tsset year

ren sp_pop_totl pop
ren sp_pop_grow pop_growth
ren sp_pop_0014_to children
ren sp_pop_1564_to working

label var pop population
label var pop_growth pop_growth
label var children children
label var working "working age"

twoway (tsline pop, title("Population Trend")bgcolor(ltblue) plotregion(color(ltblue)) graphregion(color(ltblue)) lcolor("sienna") lwidth(thick)) ///
(tsline children, lcolor("sand") lpattern("_") lwidth(thick)) ///
(tsline working, lcolor("white") lpattern("_") lwidth(thick)) 
/* this is also exhibited in the trend of the growth rates where growth trend 
in working age and children is growing consistently though working age is rising 
Thoko, make the children and working age lines dotted
*as of 2022, fertility rate was at 3.3 percent. Thats above the replacement rate
show the two graphs together 
*/ 
**********************************************************************************************************************************************************************************************************


**********************************************************************************************************************************************************************************************
*access to electricity, sanitation, internet, water, poverty headcount and neonatal mortality


*electricity access
wbopendata, country(kir - Kiribati) indicator(EG.ELC.ACCS.ZS; EG.ELC.ACCS.UR.ZS; EG.ELC.ACCS.RU.ZS) long clear

ren eg_elc_accs_zs elec
ren eg_elc_accs_ur_zs elec_ur
ren eg_elc_accs_ru_zs elec_ru
label var elec "Everyone"
label var elec_ur "Urban Folk"
label var elec_ru "Rural Folk"
tsset year

drop if year < 2000
twoway (tsline elec, xlabel(2000 (2) 2023) title("Electrical Access")bgcolor(ebblue) plotregion(color(ebblue)) graphregion(color(ebblue)) lcolor("sandb") lwidth(medium)) ///
(tsline elec_ru, lcolor("yellow") lwidth(medium)) ///
(tsline elec_ur, lcolor("sand") lwidth(medium))
/*it is kind of peculiar that electricity access is trending downwards in urban areas but I'm assuming thats hurricaine damage*/


*internet access 
wbopendata, country(kir - Kiribati) indicator(IT.NET.USER.ZS) long clear
tsset year
ren it_net_user_zs internet
label var internet "internet access"
keep if year >= 1990
drop if year == 2023
twoway (tsline internet, title("Internet Access")bgcolor(sand) plotregion(color(sand)) graphregion(color(sand)) lcolor("ltblue") lwidth(medium))
/* this may not be the most relevant variable for us considering the page count
Nonetheless, quite a few people have internet access by developing country standards 
*/

*sanitation
wbopendata, country(kir - Kiribati) indicator(SH.STA.BASS.ZS; SH.STA.BASS.UR.ZS; SH.STA.BASS.RU.ZS) long clear
tsset year

ren sh_sta_bass_zs sani
ren sh_sta_bass_ur_zs sani_urb
ren sh_sta_bass_ru_zs sani_ru
label var sani sanitation
label var sani_urb "urban sanitation"
label var sani_ru "rural sanitation"
keep if year >= 2000 & year <= 2023
twoway (tsline sani, bgcolor(magenta) plotregion(color(magenta)) graphregion(color(magenta)) title("Access to Basic Sanitation") lcolor('blue') lwidth(medium)) ///
(tsline sani_urb, lcolor('ltblue') lwidth(medium)) ///
(tsline sani_ru, lcolor('dkblue') lwidth(medium))
/*interestingly, like in electricity, rural electricfication is increasing while urban is trending downwards. this may also
be due to a combination of lots of grants going into rural development and climate change eroding the urban regions */

*water access
wbopendata, country(kir - Kiribati) indicator(SH.H2O.SMDW.ZS; SH.H2O.SMDW.RU.ZS; SH.H2O.SMDW.UR.ZS) long clear
tsset year
ren sh_h2o_smdw_zs water
ren sh_h2o_smdw_ru_zs water_ru
ren sh_h2o_smdw_ur_zs water_urb
label var water "water access"
label var water_ru "rural water access"
label var water_urb "urban water access"
keep if year >= 2000
twoway (tsline water, title("Access to (At Least) Basic Water Services") lcolor(dkblue) bgcolor(sand) plotregion(color(sand)) graphregion(color(sand))) ///
(tsline water_ru, lcolor(ltblue)) ///
(tsline water_urb, lcolor(blue))

/* accordingly, access to clean water is quite low particulalry in the rural areas. This probably
means many people use wells and questionable sources of water. This is more in line with 
usual statistics with rural areas in developing countries lagging far behind */

*neonatal and maternal mortality
wbopendata, country(kir - Kiribati) indicator(SH.STA.MMRT; SH.DYN.NMRT; SH.DYN.MORT) long clear
tsset year
ren sh_sta_mmrt maternal
ren sh_dyn_nmrt neonetal
ren sh_dyn_mort under_5
label var maternal "maternal mortality"
label var neonetal "neonatal mortality"
label var under_5 "under-5 mortality"
twoway (tsline maternal, title("The Table of Avoidable Deaths")) ///
(tsline neonatal) ///
(tsline under_5)
/*
This is usually an indicator of how well the general medical system
People can keep the babies alive and have been consistently able to do so
Maternal portality and neonatal mortality have been decreasing indicating
continuous improvements in the health sector 
*/

*poverty headcount 
wbopendata, country(kir - Kiribati) indicator(SI.POV.MPWB; SI.POV.NAHC; SI.POV.DDAY) long clear
tsset year
ren si_pov_mpwb multi_poverty
ren si_pov_nahc national_poverty
ren si_pov_dday poverty_line
label var multi_poverty "multidimensional poverty"
label var national_poverty "national poverty line"
label var poverty_line "international poverty line (2.15)"
tsline multi_poverty national_poverty poverty_line

/*
Okay, very little data available.
But from what is there, very few people live below the poverty line 
At the same time, poverty stats are  wuite high so this can indicate a very 
high standard of living on this island*/ 

/*
Overall, this seems to represent the stats of a typical lowe income country
that is improving at a manageable rate*/
*******************************************************************************************************************************************************************************************


*****************************************************************************************************************************************************************************************
***Purely economic bariables 
*Population growth, GDP, GDP per capita, GDP per capita growth 
wbopendata, country(kir - Kiribati) indicator(SP.POP.GROW; NY.GDP.PCAP.KD.ZG; NY.GDP.MKTP.KD.ZG; NY.GNP.PCAP.CD ; NY.GDP.MKTP.KD; NY.GNP.PCAP.CD; SL.TLF.TOTL.IN) long clear

ren sp_pop_grow pop_growth
label var pop_growth "pop growth"
ren ny_gdp_mktp_kd_zg GDP_growth
label var GDP_growth "GDP growth"
ren ny_gdp_pcap_kd_zg GDP_capita_gro
label var GDP_capita_gro "GDP per capita growth"
ren ny_gnp_pcap_cd GNI_per_Capita
label var GNI_per_Capita "GNI per capita"
ren ny_gdp_mktp_kd GDP_real
label var GDP_real "real GDP 2015"

*national debt, current account balance and trade balance 

*******Graphs I think I can use

twoway (tsline GDP_growth, title("GDP Growth")) ///
(tsline GDP_capita-gro) ///
(tsline pop_growth)
/* this is a table comparing population growth and GDP growth.
GDP and GDP per capita growth are quite similar. Their magnitudes are similar and the trends are practically the same 
Population growth has been rather steady */
/*Many countries have enjoyed growing GDPs only to be kneecapped by their growing populations. But not these dudes*/
***********************************************************************************************************************************************************************************************************************
*****other economic variables 
*national debt, trade balance, current account balance, national deficit, national debt, inflation
*remittances
wbopendata, country(kir - Kiribati) indicator(GC.DOD.TOTL.GD.ZS; FP.CPI.TOTL.ZG; BN.CAB.XOKA.GD.ZS; BG.GSR.NFSV.GD.ZS) long clear
tsset year

ren gc_dod_totl_gd_zs sov_debt
label var sov_debt "central government debt"
ren fp_cpi_totl_zg CPI
label var CPI CPI
ren bn_cab_xoka_gd_zs CAB
label var CAB CAB
tsline CPI
/* they never reached the 20 - 50 percent of some of us. Good for them */
tsline sov_debt
tsline CAB
sum CAB
/*current account balance has on average been at about 5.7 percent of GDP with large fluctuations; so largely positive. Thats certainly better than the chronic negative I was expecting. They had a dip during the covid years like everyone else but it only went below 0 in 2021 */
tsline CPI
/*hey wait, why is your CPI negative? I'm from one of those countries where I'm not used to seeing that*/

*okay, remittances on its own 
wbopendata, country(kir - Kiribati) indicator(BX.TRF.PWKR.DT.GD.ZS; BM.TRF.PWKR.CD.DT) long clear
tsset year

ren bx_trf_pwkr_dt_gd_zs remit_receiv
label var remit_receive "remittances received"


/*personal remittances received remittances are going up and down but they are almost consistently above 5 percent 
*/

********************************************************************************
*Employment 
wbopendata, country(kir - Kiribati) indicator(SL.UEM.TOTL.ZS; SL.UEM.ADVN.ZS) long clear
tsset year

/* there is no unemployment data but there is a small amount of data for people with advanced educations. This combined with how
increasing government salaries raised GDP points to a population that is educated and works for governmetn */


********************************************************************************

*Education 




********************************************************************************
*Demographic bar chart

**import data
wbopendata, country(kir - Kiribati) year(2023) indicator(SP.POP.0004.MA.5Y; ///
SP.POP.0509.MA.5Y; SP.POP.1014.MA.5Y; SP.POP.1519.MA.5Y; SP.POP.2024.MA.5Y; ///
SP.POP.2529.MA.5Y; SP.POP.3034.MA.5Y; SP.POP.3539.MA.5Y; SP.POP.4044.MA.5Y; ///
SP.POP.4549.MA.5Y; SP.POP.5054.MA.5Y; SP.POP.5559.MA.5Y; SP.POP.6064.MA.5Y; ///
SP.POP.6569.MA.5Y; SP.POP.7074.MA.5Y; SP.POP.7579.MA.5Y; SP.POP.80UP.MA.5Y; ///
SP.POP.0004.FE.5Y; SP.POP.0509.FE.5Y; SP.POP.1014.FE.5Y; SP.POP.1519.FE.5Y; ///
SP.POP.2024.FE.5Y; SP.POP.2529.FE.5Y; SP.POP.3034.FE.5Y; SP.POP.3539.FE.5Y; ///
SP.POP.4044.FE.5Y; SP.POP.4549.FE.5Y; SP.POP.5054.FE.5Y; SP.POP.5559.FE.5Y; ///
SP.POP.6064.FE.5Y; SP.POP.6569.FE.5Y; SP.POP.7074.FE.5Y; ///
SP.POP.7579.FE.5Y; SP.POP.80UP.FE.5Y) long clear
tsset year

**rename 
ren sp_pop_0004_ma_5y MA0004
ren sp_pop_0509_ma_5y MA0509
ren sp_pop_1014_ma_5y MA1014
ren sp_pop_1519_ma_5y MA1519
ren sp_pop_2024_ma_5y MA2024
ren sp_pop_2529_ma_5y MA2529
ren sp_pop_3034_ma_5y MA3034
ren sp_pop_3539_ma_5y MA3539
ren sp_pop_4044_ma_5y MA4044
ren sp_pop_4549_ma_5y MA4549
ren sp_pop_5054_ma_5y MA5054
ren sp_pop_5559_ma_5y MA5559
ren sp_pop_6064_ma_5y MA6064
ren sp_pop_6569_ma_5y MA6569
ren sp_pop_7074_ma_5y MA7074
ren sp_pop_7579_ma_5y MA7579
ren sp_pop_80up_ma_5y MA80up
ren sp_pop_0004_fe_5y FE0004
ren sp_pop_0509_fe_5y FE0509
ren sp_pop_1014_fe_5y FE1014
ren sp_pop_1519_fe_5y FE1519
ren sp_pop_2024_fe_5y FE2024
ren sp_pop_2529_fe_5y FE2529
ren sp_pop_3034_fe_5y FE3034
ren sp_pop_3539_fe_5y FE3539
ren sp_pop_4044_fe_5y FE4044
ren sp_pop_4549_fe_5y FE4549
ren sp_pop_5054_fe_5y FE5054
ren sp_pop_5559_fe_5y FE5559
ren sp_pop_6064_fe_5y FE6064
ren sp_pop_6569_fe_5y FE6569
ren sp_pop_7074_fe_5y FE7074
ren sp_pop_7579_fe_5y FE7579
ren sp_pop_80up_fe_5y FEup


*import data
wbopendata, country(kir - Kiribati) year(2023) indicator(SP.POP.0004.MA.5Y; ///
SP.POP.0509.MA.5Y; SP.POP.1014.MA.5Y; SP.POP.1519.MA.5Y; SP.POP.2024.MA.5Y; ///
SP.POP.2529.MA.5Y; SP.POP.3034.MA.5Y; SP.POP.3539.MA.5Y; SP.POP.4044.MA.5Y; ///
SP.POP.4549.MA.5Y; SP.POP.5054.MA.5Y; SP.POP.5559.MA.5Y; SP.POP.6064.MA.5Y; ///
SP.POP.6569.MA.5Y; SP.POP.7074.MA.5Y; SP.POP.7579.MA.5Y; SP.POP.80UP.MA.5Y; ///
SP.POP.0004.FE.5Y; SP.POP.0509.FE.5Y; SP.POP.1014.FE.5Y; SP.POP.1519.FE.5Y; ///
SP.POP.2024.FE.5Y; SP.POP.2529.FE.5Y; SP.POP.3034.FE.5Y; SP.POP.3539.FE.5Y; ///
SP.POP.4044.FE.5Y; SP.POP.4549.FE.5Y; SP.POP.5054.FE.5Y; SP.POP.5559.FE.5Y; ///
SP.POP.6064.FE.5Y; SP.POP.6569.FE.5Y; SP.POP.7074.FE.5Y; ///
SP.POP.7579.FE.5Y; SP.POP.80UP.FE.5Y) clear

*create the gender variable 
gen gender = substr( indicatorcode,13,2)
gen gend = (gender == "MA")
gen indicator = substr( indicatorcode,1,11)



*this kinda worked for reshaping the variable
reshape wide gender, i(indicatorcode) j(gend)

**but then try this 
*reshape wide gender yr2023, i(indicatorcode) j(gend)



drop countrycode countryname region regionname adminregion adminregionname incomelevel incomelevelname lendingtype lendingtypename indicatorcode



**********************okay i did some cleaning and tried again
gen gender = (gender0 == "FE")
drop gender0  gender1
*this is what i used but use the second one its probably better
reshape wide yr2023, i(indicatorname) j(gend)
*reshape wide gender, i(indicatorname) j(gend)




********************************************************************************
********************************************************************************
************************ lets try with the code we picked up online 
********************************************************************************

*import data
wbopendata, country(kir - Kiribati) year(2023) indicator(SP.POP.0004.MA.5Y; ///
SP.POP.0509.MA.5Y; SP.POP.1014.MA.5Y; SP.POP.1519.MA.5Y; SP.POP.2024.MA.5Y; ///
SP.POP.2529.MA.5Y; SP.POP.3034.MA.5Y; SP.POP.3539.MA.5Y; SP.POP.4044.MA.5Y; ///
SP.POP.4549.MA.5Y; SP.POP.5054.MA.5Y; SP.POP.5559.MA.5Y; SP.POP.6064.MA.5Y; ///
SP.POP.6569.MA.5Y; SP.POP.7074.MA.5Y; SP.POP.7579.MA.5Y; SP.POP.80UP.MA.5Y; ///
SP.POP.0004.FE.5Y; SP.POP.0509.FE.5Y; SP.POP.1014.FE.5Y; SP.POP.1519.FE.5Y; ///
SP.POP.2024.FE.5Y; SP.POP.2529.FE.5Y; SP.POP.3034.FE.5Y; SP.POP.3539.FE.5Y; ///
SP.POP.4044.FE.5Y; SP.POP.4549.FE.5Y; SP.POP.5054.FE.5Y; SP.POP.5559.FE.5Y; ///
SP.POP.6064.FE.5Y; SP.POP.6569.FE.5Y; SP.POP.7074.FE.5Y; ///
SP.POP.7579.FE.5Y; SP.POP.80UP.FE.5Y) clear


*generate variables for gender and age 
gen gender = substr(indicatorcode, 13, 2)
gen age_range = substr(indicator, 9, 4)


*reshape to long format 
reshape long yr2023, i(indicatorcode) j(gender_age)


*separate gender and age range 
gen gender = substr(gender_age, -2, 2)
gen age_range = substr(gender_age, 1, 5)


*reshape to wide format 
reshape wide yr2023, i(age_range) j(gender)



*rename and drop
ren yr2023_FE FE_pop
ren yr2023_MA MA_pop

**check what you have first before you go
*drop indicatorcode gender_age



*****now we can make those goddamn population pyramids 
twoway (bar FE_pop gender_age, horizontal xvarlab(Females)) ///
(bar MA_Pop gender_age, horizontal xvarlab(Males) ///
title("Kiribati Population Breakdown") ///
subtitle("Year 2023") ///
legend(label(1 Females) label(2 Males))



/* Is there an API for the WEO data */


***************the data from the article 4

set obs 1
generate var1 = -0.6 in 1
rename var1 Year
replace Year = 2020 in 1
generate var2 = -0.6 in 1
rename var2 RGDP
gen var3 = 2.6 in 1
ren var3 CPI_chng
browse
set obs 2
replace Year = 2021 in 2
set obs 3
replace Year = 2022 in 3
set obs 4
replace Year = 2023 in 4
set obs 5
replace Year = 2024 in 5
set obs 6
replace Year = 2025 in 6
set obs 7
replace Year = 2026 in 7
set obs 8
replace Year = 2027 in 8
set obs 9
replace Year = 2028 in 9
set obs 10
replace Year = 2029 in 10
replace RGDP = 8.5 in 2
replace RGDP = 33.9 in 3
replace RGDP = 4.2 in 4
replace RGDP = 5.8 in 5
replace RGDP = 4.1 in 6
replace RGDP = 3.3 in 7
replace RGDP = 2.5 in 8
replace RGDP = 2.1 in 9
replace RGDP = 2.1 in 10
replace CPI_chng = 2.1 in 2
replace CPI_chng = 5.3 in 3
replace CPI_chng = 9.3 in 4
replace CPI_chng = 4.5 in 5
replace CPI_chng = 3.0 in 6
replace CPI_chng = 2.5 in 7
replace CPI_chng = 2.0 in 8
replace CPI_chng = 1.9 in 9
replace CPI_chng = 1.8 in 10
generate var4 = 105 in 1
rename var4 Rev
generate var5 = 101 in 1
rename var5 Exp
replace Rev = 72 in 2
replace Rev = 69 in 3
replace Rev = 101 in 4
replace Rev = 103 in 5
replace Rev = 92 in 6
replace Rev = 82 in 7
replace Rev = 91 in 8
replace Rev = 88 in 9
replace Rev = 87 in 10
replace Exp = 83 in 2
replace Exp = 87 in 3
replace Exp = 102 in 4
replace Exp = 126 in 5
replace Exp = 107 in 6
replace Exp = 95 in 7
replace Exp = 104 in 8
replace Exp = 103 in 9
replace Exp = 103 in 10
generate var6 = 57 in 1
replace var6 = 44 in 2
replace var6 = 36 in 3
replace var6 = 51 in 4
replace var6 = 46 in 5
replace var6 = 44 in 6
replace var6 = 43 in 7
replace var6 = 42 in 8
replace var6 = 42 in 9
replace var6 = 41 in 10
rename var6 FishRev
generate var7 = 75 in 1
replace var7 = 64 in 2
replace var7 = 56 in 3
replace var7 = 71 in 4
replace var7 = 65 in 5
replace var7 = 63 in 6
replace var7 = 63 in 7
replace var7 = 62 in 8
replace var7 = 62 in 9
replace var7 = 62 in 10
rename var7 domrev
generate var8 = 30 in 1
replace var8 = 8 in 2
replace var8 = 13 in 3
replace var8 = 30 in 4
replace var8 = 39 in 5
replace var8 = 29 in 6
replace var8 = 19 in 7
replace var8 = 28 in 8
replace var8 = 26 in 9
replace var8 = 26 in 10
rename var8 Grants_external
generate var9 = 63 in 1
replace var9 = 67 in 2
replace var9 = 67 in 3
replace var9 = 71 in 4
replace var9 = 73 in 5
replace var9 = 72 in 6
replace var9 = 70 in 7
replace var9 = 68 in 8
replace var9 = 68 in 9
replace var9 = 68 in 10
rename var9 ExpCur
generate var10 = 39 in 1
replace var10 = 16 in 2
replace var10 = 21 in 3
replace var10 = 31 in 4
replace var10 = 53 in 5
replace var10 = 29 in 6
replace var10 = 19 in 7
replace var10 = 28 in 8
replace var10 = 26 in 9
replace var10 = 26 in 10
rename var10 ExpDev
generate var11 = 71 in 1
replace var11 = 20.3 in 2
replace var11 = -6.5 in 3
replace var11 = 28.6 in 4
replace var11 = 30.2 in 5
replace var11 = 30.4 in 6
replace var11 = 29.2 in 7
replace var11 = 29.4 in 8
replace var11 = 30.5 in 9
replace var11 = 31.3 in 10
rename var11 CAB
generate var12 = 39 in 1
replace var12 = 36 in 2
replace var12 = 32 in 3
replace var12 = 30 in 4
replace var12 = 28 in 5
replace var12 = 43 in 6
replace var12 = 57 in 7
replace var12 = 78 in 8
replace var12 = 105 in 9
replace var12 = 135 in 10
rename var12 Debt
label var RGDP "percent change"
label var CPI_chng "percent change average "
browse
label var Rev "revenue and grants percent GDP"
label var Exp "expenditure in percent of GDP"
label var FishRev "revenue and grants of which is fishing revenue percent of GDP"
label var domrev "total domestic revenue (percent GDP)"
label var Grants_external "External grants as revenue and percent gdp"
label var ExpCur "current expenditures as percent GDP"
generate var13 = 340 in 1
replace var13 = 278 in 2
replace var13 = 270 in 3
replace var13 = 423 in 4
replace var13 = 485 in 5
replace var13 = 462 in 6
replace var13 = 433 in 7
replace var13 = 499 in 8
replace var13 = 504 in 9
replace var13 = 520 in 10
rename var13 RevTot
generate var14 = 328 in 1
replace var14 = 319 in 2
replace var14 = 341 in 3
replace var14 = 429 in 4
replace var14 = 590 in 5
replace var14 = 537 in 6
replace var14 = 501 in 7
replace var14 = 575 in 8
replace var14 = 592 in 9
replace var14 = 615 in 10
rename var14 ExpTot
gen netRev = RevTot - ExpTot
replace RGDP = 3.9 in 3
label var Debt "Debt in Percent of GDP"


*real GDP
twoway (tsline RGDP, title("Real GDP Growth Rate") bgcolor(sandb) plotregion(color(sandb)) graphregion(color(sandb)) lcolor("ebblue") lwidth(thick))


*CPI
twoway (tsline CPI_chng, title("CPI") bgcolor(sandb) plotregion(color(sandb)) graphregion(color(sandb)) lcolor("ebblue") lwidth(thick)) 


*Debt
twoway (tsline Debt, title("Debt") bgcolor(sandb) plotregion(color(sandb)) graphregion(color(sandb)) lcolor("ebblue") lwidth(thick)) 


*trade balance
twoway (tsline fiscBalance, title("Debt") bgcolor(sandb) plotregion(color(sandb)) graphregion(color(sandb)) lcolor("ebblue") lwidth(thick))
