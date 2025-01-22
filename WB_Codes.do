***********************WB CODES**********************************
wbopendata, indicator(NY.GDP.MKTP.KD.ZG) clear long 




********************************************************************************
********************************************************************************
**************** A QUICK GUIDE TO THE API WORLD BANK STRUCTURE *****************
********************************************************************************
********************************************************************************


***Macro factors 
*central government debt (percent of GDP): GC.DOD.TOTL.GD.ZS
*CPI: FP.CPI.TOTL.ZG
*Current account balance (% of GDP): BN.CAB.XOKA.GD.ZS
*net trade (BOP current): BN.GSR.GNFS.CD
*personal remittances paid (Current US$) (5 GDP): BM.TRF.PWKR.CD.DT
*personal remittances received (Current US$) (5 GDP: 
*personal remittances received (% GDP): BX.TRF.PWKR.DT.GD.ZS
*trade in services (% GDP): BG.GSR.NFSV.GD.ZS
*net factor income: NY.GSR.NFCY.CD
*final consumption expenditure (constant 2015 USD):NE.CON.TOTL.KD
*********************************************************************************


********************************************************************************
***GDPs
*gdp per capita growth (annual %): NY.GDP.PCAP.KD.ZG 
*gdp growth (annual %): NY.GDP.MKTP.KD.ZG
*GNI per capita: NY.GNP.PCAP.CD
*GDP (constant 2015 US$): NY.GDP.MKTP.KD
*GDP deflator: 
*********************************************************************************



*********************************************************************************
***Population stuff
*labor force percent: SL.TLF.TOTL.IN
*maternal mortality ratio (per 100,0000 live births): SH.STA.MMRT 
*mortality rate, neonatal (per 1,000 live births): SH.DYN.NMRT
*mortality rate, under 5 (per 1,000 live births): SH.DYN.MORT0
*population: SP.POP.TOTL
*population (0 - 14)(percent of pop): SP.POP.0014.TO.ZS
*population (15 - 64) (percent of pop): SP.POP.1564.TO.ZS
*population growth: SP.POP.GROW
*real/constant (2015 USD) GDP: NY.GDP.MKTP.KD
*********************************************************************************



***********************************************************************************
***Welfare stuff
*basic sanitation services (% of population): SH.STA.BASS.ZS
*basic sanitation services (urban) (% of population): SH.STA.BASS.UR.ZS
*basic sanitation services (rural) (% of population): SH.STA.BASS.RU.ZS
*maternal mortality: SH.STA.MMRT
*multidimensional poverty headcount (percent of population): SI.POV.MPWB
*neonatal mortality rate: SH.DYN.NMRT
*poverty headcount ratio (national poverty lines) (percent of population): SI.POV.NAHC
*poverty headcount ratio ($2.15 a day) (percent of population): SI.POV.DDAY
*Safe water access: SH.H2O.SMDW.ZS
*Safe water access (rural): SH.H2O.SMDW.RU.ZS
*Safe water access (urban): SH.H2O.SMDW.UR.ZS
*sanitation services (basic): SH.STA.BASS.ZS
*sanitation services (basic)(rural): SH.STA.BASS.RU.ZS
*sanitation services (basic) (urban): SH.STA.BASS.UR.ZS
*unemployment (total): SL.UEM.TOTL.ZS
*unemployment (total) (urban): SL.UEM.TOTL.UR.ZS
*unemployment (total) (rural): SL.UEM.TOTL.RU.ZS
*access to electricity: EG.ELC.ACCS.ZS
*access to electricity (urban): EG.ELC.ACCS.UR.ZS
*access to electricity (rural): EG.ELC.ACCS.RU.ZS
*internet access (percent of population): IT.NET.USER.ZS
*********************************************************************************





********************************************************************************
***Employment
*Unemployment (% of total labor force) (modeled ILO estimate): SL.UEM.TOTL.ZS
*Female unemployment (% of total labor force) (modeled ILO estimate): SL.UEM.TOTL.FE.ZS
*Male unemployment (% of total labor force) (modeled ILO estimate): SL.UEM.TOTL.MA.ZS
*Unemployment with advanced education (% of total labor force): SL.UEM.ADVN.ZS
*Unemployment with advanced education (female)(% of total labor force): SL.UEM.ADVN.FE.ZS
*Unemployment with advanced education (male)(% of total labor force): SL.UEM.ADVN.MA.ZS
**********************************************************************************



********************************************************************************
***Population  but for making this demographic dividend double bar charts 

**male populations 
***total population: SP.POP.TOTL.MA.IN
***total population percent: SP.POP.TOTL.MA.ZS
*00 - 04 percent of female population: SP.POP.0004.MA.5Y
*05 - 09 percent of female population: SP.POP.0509.MA.5Y
*10 - 14 percent of female population: SP.POP.1014.MA.5Y
*15 - 19 percent of female population: SP.POP.1519.MA.5Y
*20 - 24 percent of female population: SP.POP.2024.MA.5Y
*25 - 29 percent of female population: SP.POP.2529.MA.5Y
*30 - 34 percent of female population: SP.POP.3034.MA.5Y
*35 - 39 percent of female population: SP.POP.3539.MA.5Y
*40 - 44 percent of female population: SP.POP.4044.MA.5Y
*45 - 49 percent of female population: SP.POP.4549.MA.5Y
*50 - 54 percent of female population: SP.POP.5054.MA.5Y
*55 - 59 percent of female population: SP.POP.5559.MA.5Y
*60 - 64 percent of female population: SP.POP.6064.MA.5Y
*65 - 69 percent of female population: SP.POP.6569.MA.5Y
*70 - 74 percent of female population: SP.POP.7074.MA.5Y
*75 - 79 percent of female population: SP.POP.7579.MA.5Y
*80 and above percent of female population: SP.POP.80UP.MA.5Y


**female populations 
*total population: SP.POP.TOTL.FE.IN
*total population percent: SP.POP.TOTL.FE.ZS
*00 - 04 percent of female population: SP.POP.0004.FE.5Y
*05 - 09 percent of female population: SP.POP.0509.FE.5Y
*10 - 14 percent of female population: SP.POP.1014.FE.5Y
*15 - 19 percent of female population: SP.POP.1519.FE.5Y
*20 - 24 percent of female population: SP.POP.2024.FE.5Y
*25 - 29 percent of female population: SP.POP.2529.FE.5Y
*30 - 34 percent of female population: SP.POP.3034.FE.5Y
*35 - 39 percent of female population: SP.POP.3539.FE.5Y
*40 - 44 percent of female population: SP.POP.4044.FE.5Y
*45 - 49 percent of female population: SP.POP.4549.FE.5Y
*50 - 54 percent of female population: SP.POP.5054.FE.5Y
*55 - 59 percent of female population: SP.POP.5559.FE.5Y
*60 - 64 percent of female population: SP.POP.6064.FE.5Y
*65 - 69 percent of female population: SP.POP.6569.FE.5Y
*70 - 74 percent of female population: SP.POP.7074.FE.5Y
*75 - 79 percent of female population: SP.POP.7579.FE.5Y
*80 and above percent of female population: SP.POP.80UP.FE.5Y

 
