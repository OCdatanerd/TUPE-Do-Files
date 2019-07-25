

** Clean for Merge

replace dm3_pre= 6-dm3_pre
replace dm3_post= 6-dm3_post


forv i = 1/6 {
	encode ph`i'_pre, gen(ph`i')
	
	}

label define ph1 4 "Great" 3 "Moderate" 1 "None" 2 "Slight", replace
label values ph1-ph6 ph1
drop ph1_pre-ph6_pre
rename (ph1-ph6)=_pre

forv i = 1/6 {
	encode ph`i'_post, gen(ph`i')
	
	}

label define ph1 4 "Great" 3 "Moderate" 1 "None" 2 "Slight", replace
label values ph1-ph6 ph1
drop ph1_post-ph6_post
rename (ph1-ph6)=_post
	

** Merge and Analysis

sumscale, f1(inf1_pre-inf5_pre) f2(ic1_pre-ic5_pre)	f3(dm1_pre-dm5_pre) f4(inf1_post-inf5_post) f5(ic1_post-ic5_post) f6(dm1_post-dm5_post)

rename Factor1_average influence_pre
rename Factor2_average intercom_pre
rename Factor3_average decision_pre
rename Factor4_average influence_post
rename Factor5_average intercom_post
rename Factor6_average decision_post
order influence_pre-decision_post, after(unique_id)

mean(influence_pre)
mean(influence_post)
mean(intercom_pre)
mean(intercom_post)
mean(decision_pre)
mean(decision_post)

forvalues i = 1/5 {
	mean(inf`i'_pre)
	}
	
forvalues i = 1/5 {
	mean(inf`i'_post)
	}
	
forvalues i = 1/5 {
	mean(ic`i'_pre)
	}
	
forvalues i = 1/5 {
	mean(ic`i'_post)
	}

forvalues i = 1/5 {
	mean(dm`i'_pre)
	}
	
forvalues i = 1/5 {
	mean(dm`i'_post)
	}
	
tab use1_pre
tab use1_post
tab use2_pre
tab use2_post
tab use3_pre
tab use3_post

forv i = 1/6 {
	tab ph`i'_pre
	}
	
forv i = 1/6 {
	tab ph`i'_post
	}
	
	