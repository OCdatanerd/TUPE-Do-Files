
*This is to create one large, merged data including pre and post and life skill, ALERT for TUPE project.

*First, I am cleaning the online-based ALERT pre-survey.*********************************************************************************************************
#delimit;
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Excel Files\Source Files\Project ALERT Pre-Survey.csv", clear;
drop if status=="Partial";
drop responseid timestarted datesubmitted contactid legacycomments comments language referer extendedreferer sessionid useragent extendeduse* tags ipaddress
 longitude latitude country city stateregion postal status;


#delimit cr;
gen TestType="Project ALERT PreTest"
gen SurveyType="online"

rename pleaseenteryo~t district
rename pleaseenteryo~e Teacher_Name
rename intheâboxbelo~r Unique_ID
rename myfriendswoul~l inf1_pre
rename iunderstandho~e inf2_pre
rename iamabletodeal~i inf3_pre
rename iunderstandho~s inf4_pre
rename iamabletotalk~s inf5_pre
rename resistpress~esi ic1_pre
rename resistpressur~r ic2_pre
rename resistpress~gsi ic3_pre
rename seekhelpfromf~l ic4_pre
rename planaheadtoav~e ic5_pre
rename iwouldaskatru~i dm1_pre
rename iworkoutallth~m dm2_pre
rename imakedecision~g dm3_pre
rename iknowhowtogat~l dm4_pre
rename iknowhowcerta~n dm5_pre
rename smokecigarett~o use1_pre
rename useecigarette~t use2_pre
rename usesmokelesst~n use3_pre
rename smokecigarett~m ph1_temp
rename smoke1ormorep~c ph2_temp
rename useecigarette~g ph3_temp
rename useecigarette~v ph4_temp
rename usemarijuanao~p ph5_temp
rename usemarijuanad~l ph6_temp

foreach n of numlist 1/6 {
 gen ph`n'_pre=1 
 replace ph`n'_pre=2 if ph`n'_temp=="Slight"
 replace ph`n'_pre=3 if ph`n'_temp=="Moderate"
 replace ph`n'_pre=4 if ph`n'_temp=="Great"
}

*egen temp=rownonmiss(v*), s
*tab temp
rename pleaseenteryo~l School_Site
replace School_Site=v24 if v24!=""
replace School_Site=v25 if v25!=""
replace School_Site=v26 if v26!=""
replace School_Site=v27 if v27!=""
replace School_Site=v28 if v28!=""
replace School_Site=v29 if v29!=""
*replace School_Site=v30 if v30!=""
*egen School_Site=rowfirst (v30)...I dont know why this command didn't work
*There are 17 missing on School_Site
drop v* ph1_temp-ph6_temp

save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Pre-Survey_KI.dta", replace


*Secondly, I am cleaning the online-based ALERT post-survey*********************************************************************************************************
#delimit;
import delimited "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Excel Files\Source Files\Project ALERT Post-Survey.csv", clear;
drop if status=="Partial";
drop responseid timestarted datesubmitted contactid legacycomments comments language referer sessionid useragent tags ipaddress
 longitude latitude country city stateregion postal status;


#delimit cr;
gen TestType="Project ALERT PostTest"
gen SurveyType="online"

rename pleaseenteryo~t district
rename pleaseenteryo~e Teacher_Name
rename intheâboxbelo~r Unique_ID
rename myfriendswoul~l inf1_pre
rename iunderstandho~e inf2_pre
rename iamabletodeal~i inf3_pre
rename iunderstandho~s inf4_pre
rename iamabletotalk~s inf5_pre
rename resistpress~esi ic1_pre
rename resistpressur~r ic2_pre
rename resistpress~gsi ic3_pre
rename seekhelpfromf~l ic4_pre
rename planaheadtoav~e ic5_pre
rename iwouldaskatru~i dm1_pre
rename iworkoutallth~m dm2_pre
rename imakedecision~g dm3_pre
rename iknowhowtogat~l dm4_pre
rename iknowhowcerta~n dm5_pre
rename smokecigarett~o use1_pre
rename useecigarette~t use2_pre
rename usesmokelesst~n use3_pre
rename smokecigarett~m ph1_temp
rename smoke1ormorep~c ph2_temp
rename useecigarette~g ph3_temp
rename useecigarette~v ph4_temp
rename usemarijuanao~p ph5_temp
rename usemarijuanad~l ph6_temp

foreach n of numlist 1/6 {
 replace ph`n'_pre=1 
 replace ph`n'_pre=2 if ph`n'_temp=="Slight"
 replace ph`n'_pre=3 if ph`n'_temp=="Moderate"
 replace ph`n'_pre=4 if ph`n'_temp=="Great"
}

*egen temp=rownonmiss(v*), s
*tab temp
rename pleaseenteryo~l School_Site
replace School_Site=v22 if v22!=""
*replace School_Site=v23 if v23!=""
replace School_Site=v24 if v24!=""
replace School_Site=v25 if v25!=""
replace School_Site=v26 if v26!=""
replace School_Site=v27 if v27!=""
*replace School_Site=v28 if v28!=""
*egen School_Site=rowfirst (v30)...I dont know why this command didn't work
*There are 17 missing on School_Site
drop v* ph1_temp-ph6_temp

save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Post-Survey_KI.dta", replace

*Third, I am cleaning the paper-version of ALERT pre-survey*********************************************************************************************************
#delimit;
import excel "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Excel Files\Source Files\Project ALERT Pre-Survey_paper.xls", sheet("Project ALERT Pre-Survey 2018-1") firstrow clear;

#delimit cr
gen SurveyType="paper"
save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Pre-Survey_paper_KI.dta", replace


*Fouth, I am cleaning the paper-version of ALERT post-survey*********************************************************************************************************
#delimit;
import excel "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Excel Files\Source Files\Project ALERT Post-Survey_paper.xls", sheet("Project ALERT Post-Survey 2018-") firstrow clear;

#delimit cr
gen SurveyType="paper"
save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Post-Survey_paper_KI.dta", replace

*I am appending the paper and online versions of the pre-surveys*****************************************************************************************************
use "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Pre-Survey_KI.dta", clear
append using "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Pre-Survey_paper_KI.dta", generate(AppendResults)
gen temp= lower(Unique_ID)
rename temp UniqueID
save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\Project ALERT Pre-Survey_all_KI.dta", replace

*I am appending the paper and online versions of the post-surveys******************************************************************************************************
use "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Post-Survey_KI.dta", clear
append using "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project AlERT Post-Survey_paper_KI.dta", generate(AppendResults)
gen temp= lower(Unique_ID)
drop Unique_ID
rename temp Unique_ID
order Unique_ID, after(Teacher_Name)
save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\Project ALERT Post-Survey_all_KI.dta", replace

*I am merging the pre and post****************************************************************************************************************************************
*merge m:m School_Site UniqueID using "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\Project ALERT Pre-Survey_all_KI.dta"
*There are only 750 matched observations
*save "C:\Users\s.KIshida\Dropbox (OCDE)\TUPE\Data Files\SY 2018-19\Stata Files\temp\Project ALERT_all_KI.dta", replace

** Clean for Merge

forv i = 1/6 {
	encode ph`i'_pre, gen(ph`i')
	
	}

label define ph1 4 "Great" 3 "Moderate" 1 "None" 2 "Slight", replace
label values ph1-ph6 ph1
drop ph1_pre-ph6_pre
rename (ph1-ph6)=_pre