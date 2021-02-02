/*Analyses multidimensionnelles
Question 1*/
/*STEP 1: analyses descriptives*/
/*distribution Y*/
Proc freq data=multi.Devoir2_Q1_Train ;
	Tables Y ;
Run ;

Proc freq data=multi.Devoir2_Q1_All ;
	Tables Y ;
Run ;
/*Analyses var catégorielles*/
Proc freq data=multi.Devoir2_Q1_Train ;
	Tables (job marital education default housing loan contact month poutcome) * Y;
Run ;

/*Analyses var continues*/
Proc means data =multi.Devoir2_Q1_Train ;
	Class Y ;
	Var age balance day duration pdays previous ;
Run ;


/*modifier les variables nécessaires de base*/
data multi.Devoir2_Q1_All;
set multi.Devoir2_Q1_Train;
job1=0; 
job2=0; 
job3=0; 
job4=0; 
job5=0; 
job6=0;
job6=0;
job7=0;
job8=0;
job9=0;
job10=0;
job11=0;
job12=0;
marital1=0;
marital2=0;
marital3=0;
education1=0;
education2=0;
education3=0;
education4=0;
contact1=0;
contact2=0;
contact3=0;
month1=0;
month2=0;
month3=0;
month4=0;
month5=0;
month6=0;
month7=0;
month8=0;
month9=0;
month10=0;
month11=0;
month12=0;
poutcome1=0;
poutcome2=0;
poutcome3=0;
poutcome4=0;
run;
data multi.Devoir2_Q1_All;
  set multi.Devoir2_Q1_All;
  if job="admin" then job1=1;
  if job="unknow" then job2=1;
  if job="unemployed" then job3=1;
  if job="management" then job4=1;
  if job="housemaid" then job5=1;
  if job="entrepreneur" then job6=1;
  if job="student" then job7=1;
  if job="blue-collar" then job8=1;
  if job="self-employed" then job9=1;
  if job="retired" then job10=1;
  if job="technician" then job11=1;
  if job="services" then job12=1;
  if marital="married" then marital1=1;
  if marital="divorced" then marital2=1;
  if marital="single" then marital3=1;
  if education="unknown" then education1=1;
  if education="secondary" then education2=1;
  if education="primary" then education3=1;
  if education="tertiary" then education4=1;
  if contact="unknown" then contact1=1;
  if contact="telephone" then contact2=1;
  if contact="cellular" then contact3=1;
  if month="jan" then month1=1;
  if month="feb" then month2=1;
  if month="mar" then month3=1;
  if month="apr" then month4=1;
  if month="may" then month5=1;
  if month="jun" then month6=1;
  if month="jul" then month7=1;
  if month="aug" then month8=1;
  if month="sep" then month9=1;
  if month="oct" then month10=1;
  if month="nov" then month11=1;
  if month="dec" then month12=1;
  if poutcome="unknown" then poutcome1=1;
  if poutcome="other" then poutcome2=1;
  if poutcome="failure" then poutcome3=1;
  if poutcome="success" then poutcome4=1;
  if default="yes" then default1=1;
  if default="no" then default1=0;
  if housing="yes" then housing1=1;
  if housing="no" then housing1=0;
  if loan="yes" then loan1=1;
  if loan="no" then loan1=0;
Run;
/*préparation des variables
faire les variables au carré*/
data multi.Devoir2_Q1_All;
set multi.Devoir2_Q1_All;
c_age=age**2;
c_balance=balance**2;
c_day=day**2;
c_duration=duration**2;
c_pdays=pdays**2;
c_previous=previous**2;

i_age_job1=age*job1;
i_age_job3=age*job3;
i_age_job4=age*job4;
i_age_job5=age*job5;
i_age_job6=age*job6;
i_age_job7=age*job7;
i_age_job8=age*job8;
i_age_job9=age*job9;
i_age_job10=age*job10;
i_age_job11=age*job11;
i_age_job12=age*job12;
i_age_marital1=age*marital1;
i_age_marital2=age*marital2;
i_age_education2=age*education2;
i_age_education3=age*education3;
i_age_education4=age*education4;
i_age_default1=age*default1;
i_age_balance=age*balance;
i_age_housing1=age*housing1;
i_age_loan1=age*loan1;
i_age_contact2=age*contact2;
i_age_contact3=age*contact3;
i_age_day=age*day;
i_age_month2=age*month2;
i_age_month3=age*month3;
i_age_month4=age*month4;
i_age_month5=age*month5;
i_age_month6=age*month6;
i_age_month7=age*month7;
i_age_month8=age*month8;
i_age_month9=age*month9;
i_age_month10=age*month10;
i_age_month11=age*month11;
i_age_month12=age*month12;
i_age_duration=age*duration;
i_age_pdays=age*pdays;
i_age_previous=age*previous;
i_age_poutcome2=age*poutcome2;
i_age_poutcome3=age*poutcome3;
i_age_poutcome4=age*poutcome4;

i_default1_job1=default1*job1;
i_default1_job3=default1*job3;
i_default1_job4=default1*job4;
i_default1_job5=default1*job5;
i_default1_job6=default1*job6;
i_default1_job7=default1*job7;
i_default1_job8=default1*job8;
i_default1_job9=default1*job9;
i_default1_job10=default1*job10;
i_default1_job11=default1*job11;
i_default1_job12=default1*job12;
i_default1_marital1=default1*marital1;
i_default1_marital2=default1*marital2;
i_default1_education2=default1*education2;
i_default1_education3=default1*education3;
i_default1_education4=default1*education4;
i_default1_balance=default1*balance;
i_default1_housing1=default1*housing1;
i_default1_loa1n=default1*loan1;
i_default1_contact2=default1*contact2;
i_default1_contact3=default1*contact3;
i_default1_day=default1*day;
i_default1_month2=default1*month2;
i_default1_month3=default1*month3;
i_default1_month4=default1*month4;
i_default1_month5=default1*month5;
i_default1_month6=default1*month6;
i_default1_month7=default1*month7;
i_default1_month8=default1*month8;
i_default1_month9=default1*month9;
i_default1_month10=default1*month10;
i_default1_month11=default1*month11;
i_default1_month12=default1*month12;
i_default1_duration=default1*duration;
i_default1_pdays=default1*pdays;
i_default1_previous=default1*previous;
i_default1_poutcome2=default1*poutcome2;
i_default1_poutcome3=default1*poutcome3;
i_default1_poutcome4=default1*poutcome4;

i_balance_job2=balance*job1;
i_balance_job3=balance*job3;
i_balance_job4=balance*job4;
i_balance_job5=balance*job5;
i_balance_job6=balance*job6;
i_balance_job7=balance*job7;
i_balance_job8=balance*job8;
i_balance_job9=balance*job9;
i_balance_job10=balance*job10;
i_balance_job11=balance*job11;
i_balance_job12=balance*job12;
i_balance_marital1=balance*marital1;
i_balance_marital2=balance*marital2;
i_balance_education2=balance*education2;
i_balance_education3=balance*education3;
i_balance_education4=balance*education4;
i_balance_housing1=balance*housing1;
i_balance_loa1n=balance*loan1;
i_balance_contact2=balance*contact2;
i_balance_contact3=balance*contact3;
i_balance_day=balance*day;
i_balance_month2=balance*month2;
i_balance_month3=balance*month3;
i_balance_month4=balance*month4;
i_balance_month5=balance*month5;
i_balance_month6=balance*month6;
i_balance_month7=balance*month7;
i_balance_month8=balance*month8;
i_balance_month9=balance*month9;
i_balance_month10=balance*month10;
i_balance_month11=balance*month11;
i_balance_month12=balance*month12;
i_balance_duration=balance*duration;
i_balance_pdays=balance*pdays;
i_balance_previous=balance*previous;
i_balance_poutcome2=balance*poutcome2;
i_balance_poutcome3=balance*poutcome3;
i_balance_poutcome4=balance*poutcome4;

i_housing1_job1=housing1*job1;
i_housing1_job3=housing1*job3;
i_housing1_job4=housing1*job4;
i_housing1_job5=housing1*job5;
i_housing1_job6=housing1*job6;
i_housing1_job7=housing1*job7;
i_housing1_job8=housing1*job8;
i_housing1_job9=housing1*job9;
i_housing1_job10=housing1*job10;
i_housing1_job11=housing1*job11;
i_housing1_job12=housing1*job12;
i_housing1_marital1=housing1*marital1;
i_housing1_marital2=housing1*marital2;
i_housing1_education2=housing1*education2;
i_housing1_education3=housing1*education3;
i_housing1_education4=housing1*education4;
i_housing1_loan1=housing1*loan1;
i_housing1_contact2=housing1*contact2;
i_housing1_contact3=housing1*contact3;
i_housing1_day=housing1*day;
i_housing1_month2=housing1*month2;
i_housing1_month3=housing1*month3;
i_housing1_month4=housing1*month4;
i_housing1_month5=housing1*month5;
i_housing1_month6=housing1*month6;
i_housing1_month7=housing1*month7;
i_housing1_month8=housing1*month8;
i_housing1_month9=housing1*month9;
i_housing1_month10=housing1*month10;
i_housing1_month11=housing1*month11;
i_housing1_month12=housing1*month12;
i_housing1_duration=housing1*duration;
i_housing1_pdays=housing1*pdays;
i_housing1_previous=housing1*previous;
i_housing1_poutcome2=housing1*poutcome2;
i_housing1_poutcome3=housing1*poutcome3;
i_housing1_poutcome4=housing1*poutcome4;

i_loan1_job1=loan1*job1;
i_loan1_job3=loan1*job3;
i_loan1_job4=loan1*job4;
i_loan1_job5=loan1*job5;
i_loan1_job6=loan1*job6;
i_loan1_job7=loan1*job7;
i_loan1_job8=loan1*job8;
i_loan1_job9=loan1*job9;
i_loan1_job10=loan1*job10;
i_loan1_job11=loan1*job11;
i_loan1_job12=loan1*job12;
i_loan1_marital1=loan1*marital1;
i_loan1_marital2=loan1*marital2;
i_loan1_education2=loan1*education2;
i_loan1_education3=loan1*education3;
i_loan1_education4=loan1*education4;
i_loan1_contact2=loan1*contact2;
i_loan1_contact3=loan1*contact3;
i_loan1_day=loan1*day;
i_loan1_month2=loan1*month2;
i_loan1_month3=loan1*month3;
i_loan1_month4=loan1*month4;
i_loan1_month5=loan1*month5;
i_loan1_month6=loan1*month6;
i_loan1_month7=loan1*month7;
i_loan1_month8=loan1*month8;
i_loan1_month9=loan1*month9;
i_loan1_month10=loan1*month10;
i_loan1_month11=loan1*month11;
i_loan1_month12=loan1*month12;
i_loan1_duration=loan1*duration;
i_loan1_pdays=loan1*pdays;
i_loan1_previous=loan1*previous;
i_loan1_poutcome2=loan1*poutcome2;
i_loan1_poutcome3=loan1*poutcome3;
i_loan1_poutcome4=loan1*poutcome4;

i_day_job1=day*job1;
i_day_job3=day*job3;
i_day_job4=day*job4;
i_day_job5=day*job5;
i_day_job6=day*job6;
i_day_job7=day*job7;
i_day_job8=day*job8;
i_day_job9=day*job9;
i_day_job10=day*job10;
i_day_job11=day*job11;
i_day_job12=day*job12;
i_day_marital1=day*marital1;
i_day_marital2=day*marital2;
i_day_education2=day*education2;
i_day_education3=day*education3;
i_day_education4=day*education4;
i_day_contact2=day*contact2;
i_day_contact3=day*contact3;
i_day_month2=day*month2;
i_day_month3=day*month3;
i_day_month4=day*month4;
i_day_month5=day*month5;
i_day_month6=day*month6;
i_day_month7=day*month7;
i_day_month8=day*month8;
i_day_month9=day*month9;
i_day_month10=day*month10;
i_day_month11=day*month11;
i_day_month12=day*month12;
i_day_duration=day*duration;
i_day_pdays=day*pdays;
i_day_previous=day*previous;
i_day_poutcome2=day*poutcome2;
i_day_poutcome3=day*poutcome3;
i_day_poutcome4=day*poutcome4;

i_duration_job1=duration*job1;
i_duration_job3=duration*job3;
i_duration_job4=duration*job4;
i_duration_job5=duration*job5;
i_duration_job6=duration*job6;
i_duration_job7=duration*job7;
i_duration_job8=duration*job8;
i_duration_job9=duration*job9;
i_duration_job10=duration*job10;
i_duration_job11=duration*job11;
i_duration_job12=duration*job12;
i_duration_marital1=duration*marital1;
i_duration_marital2=duration*marital2;
i_duration_education2=duration*education2;
i_duration_education3=duration*education3;
i_duration_education4=duration*education4;
i_duration_contact2=duration*contact2;
i_duration_contact3=duration*contact3;
i_duration_month2=duration*month2;
i_duration_month3=duration*month3;
i_duration_month4=duration*month4;
i_duration_month5=duration*month5;
i_duration_month6=duration*month6;
i_duration_month7=duration*month7;
i_duration_month8=duration*month8;
i_duration_month9=duration*month9;
i_duration_month10=duration*month10;
i_duration_month11=duration*month11;
i_duration_month12=duration*month12;
i_duration_pdays=duration*pdays;
i_duration_previous=duration*previous;
i_duration_poutcome2=duration*poutcome2;
i_duration_poutcome3=duration*poutcome3;
i_duration_poutcome4=duration*poutcome4;

i_pdays_job1=pdays*job1;
i_pdays_job3=pdays*job3;
i_pdays_job4=pdays*job4;
i_pdays_job5=pdays*job5;
i_pdays_job6=pdays*job6;
i_pdays_job7=pdays*job7;
i_pdays_job8=pdays*job8;
i_pdays_job9=pdays*job9;
i_pdays_job10=pdays*job10;
i_pdays_job11=pdays*job11;
i_pdays_job12=pdays*job12;
i_pdays_marital1=pdays*marital1;
i_pdays_marital2=pdays*marital2;
i_pdays_education2=pdays*education2;
i_pdays_education3=pdays*education3;
i_pdays_education4=pdays*education4;
i_pdays_contact2=pdays*contact2;
i_pdays_contact3=pdays*contact3;
i_pdays_month2=pdays*month2;
i_pdays_month3=pdays*month3;
i_pdays_month4=pdays*month4;
i_pdays_month5=pdays*month5;
i_pdays_month6=pdays*month6;
i_pdays_month7=pdays*month7;
i_pdays_month8=pdays*month8;
i_pdays_month9=pdays*month9;
i_pdays_month10=pdays*month10;
i_pdays_month11=pdays*month11;
i_pdays_month12=pdays*month12;
i_pdays_previous=pdays*previous;
i_pdays_poutcome2=pdays*poutcome2;
i_pdays_poutcome3=pdays*poutcome3;
i_pdays_poutcome4=pdays*poutcome4;

i_previous_job2=previous*job2;
i_previous_job3=previous*job3;
i_previous_job4=previous*job4;
i_previous_job5=previous*job5;
i_previous_job6=previous*job6;
i_previous_job7=previous*job7;
i_previous_job8=previous*job8;
i_previous_job9=previous*job9;
i_previous_job10=previous*job10;
i_previous_job11=previous*job11;
i_previous_job12=previous*job12;
i_previous_marital1=previous*marital1;
i_previous_marital2=previous*marital2;
i_previous_education2=previous*education2;
i_previous_education3=previous*education3;
i_previous_education4=previous*education4;
i_previous_contact2=previous*contact2;
i_previous_contact3=previous*contact3;
i_previous_month2=previous*month2;
i_previous_month3=previous*month3;
i_previous_month4=previous*month4;
i_previous_month5=previous*month5;
i_previous_month6=previous*month6;
i_previous_month7=previous*month7;
i_previous_month8=previous*month8;
i_previous_month9=previous*month9;
i_previous_month10=previous*month10;
i_previous_month11=previous*month11;
i_previous_month12=previous*month12;
i_previous_poutcome2=previous*poutcome2;
i_previous_poutcome3=previous*poutcome3;
i_previous_poutcome4=previous*poutcome4;

i_job1_marital1=job1*marital1;
i_job1_marital2=job1*marital2;
i_job1_education2=job1*education2;
i_job1_education3=job1*education3;
i_job1_education4=job1*education4;
i_job1_contact2=job1*contact2;
i_job1_contact3=job1*contact3;
i_job1_month2=job1*month2;
i_job1_month3=job1*month3;
i_job1_month4=job1*month4;
i_job1_month5=job1*month5;
i_job1_month6=job1*month6;
i_job1_month7=job1*month7;
i_job1_month8=job1*month8;
i_job1_month9=job1*month9;
i_job1_month10=job1*month10;
i_job1_month11=job1*month11;
i_job1_month12=job1*month12;
i_job1_poutcome2=job1*poutcome2;
i_job1_poutcome3=job1*poutcome3;
i_job1_poutcome4=job1*poutcome4;

i_job3_marital1=job3*marital1;
i_job3_marital2=job3*marital2;
i_job3_education2=job3*education2;
i_job3_education3=job3*education3;
i_job3_education4=job3*education4;
i_job3_contact2=job3*contact2;
i_job3_contact3=job3*contact3;
i_job3_month2=job3*month2;
i_job3_month3=job3*month3;
i_job3_month4=job3*month4;
i_job3_month5=job3*month5;
i_job3_month6=job3*month6;
i_job3_month7=job3*month7;
i_job3_month8=job3*month8;
i_job3_month9=job3*month9;
i_job3_month10=job3*month10;
i_job3_month11=job3*month11;
i_job3_month12=job3*month12;
i_job3_poutcome2=job3*poutcome2;
i_job3_poutcome3=job3*poutcome3;
i_job3_poutcome4=job3*poutcome4;

i_job4_marital1=job4*marital1;
i_job4_marital2=job4*marital2;
i_job4_education2=job4*education2;
i_job4_education3=job4*education3;
i_job4_education4=job4*education4;
i_job4_contact2=job4*contact2;
i_job4_contact3=job4*contact3;
i_job4_month2=job4*month2;
i_job4_month3=job4*month3;
i_job4_month4=job4*month4;
i_job4_month5=job4*month5;
i_job4_month6=job4*month6;
i_job4_month7=job4*month7;
i_job4_month8=job4*month8;
i_job4_month9=job4*month9;
i_job4_month10=job4*month10;
i_job4_month11=job4*month11;
i_job4_month12=job4*month12;
i_job4_poutcome2=job4*poutcome2;
i_job4_poutcome3=job4*poutcome3;
i_job4_poutcome4=job4*poutcome4;

i_job5_marital1=job5*marital1;
i_job5_marital2=job5*marital2;
i_job5_education2=job5*education2;
i_job5_education3=job5*education3;
i_job5_education4=job5*education4;
i_job5_contact2=job5*contact2;
i_job5_contact3=job5*contact3;
i_job5_month2=job5*month2;
i_job5_month3=job5*month3;
i_job5_month4=job5*month4;
i_job5_month5=job5*month5;
i_job5_month6=job5*month6;
i_job5_month7=job5*month7;
i_job5_month8=job5*month8;
i_job5_month9=job5*month9;
i_job5_month10=job5*month10;
i_job5_month11=job5*month11;
i_job5_month12=job5*month12;
i_job5_poutcome2=job5*poutcome2;
i_job5_poutcome3=job5*poutcome3;
i_job5_poutcome4=job5*poutcome4;

i_job6_marital1=job6*marital1;
i_job6_marital2=job6*marital2;
i_job6_education2=job6*education2;
i_job6_education3=job6*education3;
i_job6_education4=job6*education4;
i_job6_contact2=job6*contact2;
i_job6_contact3=job6*contact3;
i_job6_month2=job6*month2;
i_job6_month3=job6*month3;
i_job6_month4=job6*month4;
i_job6_month5=job6*month5;
i_job6_month6=job6*month6;
i_job6_month7=job6*month7;
i_job6_month8=job6*month8;
i_job6_month9=job6*month9;
i_job6_month10=job6*month10;
i_job6_month11=job6*month11;
i_job6_month12=job6*month12;
i_job6_poutcome2=job6*poutcome2;
i_job6_poutcome3=job6*poutcome3;
i_job6_poutcome4=job6*poutcome4;

i_job6_marital1=job6*marital1;
i_job6_marital2=job6*marital2;
i_job6_education2=job6*education2;
i_job6_education3=job6*education3;
i_job6_education4=job6*education4;
i_job6_contact2=job6*contact2;
i_job6_contact3=job6*contact3;
i_job6_month2=job6*month2;
i_job6_month3=job6*month3;
i_job6_month4=job6*month4;
i_job6_month5=job6*month5;
i_job6_month6=job6*month6;
i_job6_month7=job6*month7;
i_job6_month8=job6*month8;
i_job6_month9=job6*month9;
i_job6_month10=job6*month10;
i_job6_month11=job6*month11;
i_job6_month12=job6*month12;
i_job6_poutcome2=job6*poutcome2;
i_job6_poutcome3=job6*poutcome3;
i_job6_poutcome4=job6*poutcome4;

i_job7_marital1=job7*marital1;
i_job7_marital2=job7*marital2;
i_job7_education2=job7*education2;
i_job7_education3=job7*education3;
i_job7_education4=job7*education4;
i_job7_contact2=job7*contact2;
i_job7_contact3=job7*contact3;
i_job7_month2=job7*month2;
i_job7_month3=job7*month3;
i_job7_month4=job7*month4;
i_job7_month5=job7*month5;
i_job7_month6=job7*month6;
i_job7_month7=job7*month7;
i_job7_month8=job7*month8;
i_job7_month9=job7*month9;
i_job7_month10=job7*month10;
i_job7_month11=job7*month11;
i_job7_month12=job7*month12;
i_job7_poutcome2=job7*poutcome2;
i_job7_poutcome3=job7*poutcome3;
i_job7_poutcome4=job7*poutcome4;

i_job8_marital1=job8*marital1;
i_job8_marital2=job8*marital2;
i_job8_education2=job8*education2;
i_job8_education3=job8*education3;
i_job8_education4=job8*education4;
i_job8_contact2=job8*contact2;
i_job8_contact3=job8*contact3;
i_job8_month2=job8*month2;
i_job8_month3=job8*month3;
i_job8_month4=job8*month4;
i_job8_month5=job8*month5;
i_job8_month6=job8*month6;
i_job8_month7=job8*month7;
i_job8_month8=job8*month8;
i_job8_month9=job8*month9;
i_job8_month10=job8*month10;
i_job8_month11=job8*month11;
i_job8_month12=job8*month12;
i_job8_poutcome2=job8*poutcome2;
i_job8_poutcome3=job8*poutcome3;
i_job8_poutcome4=job8*poutcome4;

i_job9_marital1=job9*marital1;
i_job9_marital2=job9*marital2;
i_job9_education2=job9*education2;
i_job9_education3=job9*education3;
i_job9_education4=job9*education4;
i_job9_contact2=job9*contact2;
i_job9_contact3=job9*contact3;
i_job9_month2=job9*month2;
i_job9_month3=job9*month3;
i_job9_month4=job9*month4;
i_job9_month5=job9*month5;
i_job9_month6=job9*month6;
i_job9_month7=job9*month7;
i_job9_month8=job9*month8;
i_job9_month9=job9*month9;
i_job9_month10=job9*month10;
i_job9_month11=job9*month11;
i_job9_month12=job9*month12;
i_job9_poutcome2=job9*poutcome2;
i_job9_poutcome3=job9*poutcome3;
i_job9_poutcome4=job9*poutcome4;

i_job10_marital1=job10*marital1;
i_job10_marital2=job10*marital2;
i_job10_education2=job10*education2;
i_job10_education3=job10*education3;
i_job10_education4=job10*education4;
i_job10_contact2=job10*contact2;
i_job10_contact3=job10*contact3;
i_job10_month2=job10*month2;
i_job10_month3=job10*month3;
i_job10_month4=job10*month4;
i_job10_month5=job10*month5;
i_job10_month6=job10*month6;
i_job10_month7=job10*month7;
i_job10_month8=job10*month8;
i_job10_month9=job10*month9;
i_job10_month10=job10*month10;
i_job10_month11=job10*month11;
i_job10_month12=job10*month12;
i_job10_poutcome2=job10*poutcome2;
i_job10_poutcome3=job10*poutcome3;
i_job10_poutcome4=job10*poutcome4;

i_job11_marital1=job11*marital1;
i_job11_marital2=job11*marital2;
i_job11_education2=job11*education2;
i_job11_education3=job11*education3;
i_job11_education4=job11*education4;
i_job11_contact2=job11*contact2;
i_job11_contact3=job11*contact3;
i_job11_month2=job11*month2;
i_job11_month3=job11*month3;
i_job11_month4=job11*month4;
i_job11_month5=job11*month5;
i_job11_month6=job11*month6;
i_job11_month7=job11*month7;
i_job11_month8=job11*month8;
i_job11_month9=job11*month9;
i_job11_month10=job11*month10;
i_job11_month11=job11*month11;
i_job11_month12=job11*month12;
i_job11_poutcome2=job11*poutcome2;
i_job11_poutcome3=job11*poutcome3;
i_job11_poutcome4=job11*poutcome4;

i_job12_marital1=job12*marital1;
i_job12_marital2=job12*marital2;
i_job12_education2=job12*education2;
i_job12_education3=job12*education3;
i_job12_education4=job12*education4;
i_job12_contact2=job12*contact2;
i_job12_contact3=job12*contact3;
i_job12_month2=job12*month2;
i_job12_month3=job12*month3;
i_job12_month4=job12*month4;
i_job12_month5=job12*month5;
i_job12_month6=job12*month6;
i_job12_month7=job12*month7;
i_job12_month8=job12*month8;
i_job12_month9=job12*month9;
i_job12_month10=job12*month10;
i_job12_month11=job12*month11;
i_job12_month12=job12*month12;
i_job12_poutcome2=job12*poutcome2;
i_job12_poutcome3=job12*poutcome3;
i_job12_poutcome4=job12*poutcome4;

i_marital1_education2=marital1*education2;
i_marital1_education3=marital1*education3;
i_marital1_education4=marital1*education4;
i_marital1_contact2=marital1*contact2;
i_marital1_contact3=marital1*contact3;
i_marital1_month2=marital1*month2;
i_marital1_month3=marital1*month3;
i_marital1_month4=marital1*month4;
i_marital1_month5=marital1*month5;
i_marital1_month6=marital1*month6;
i_marital1_month7=marital1*month7;
i_marital1_month8=marital1*month8;
i_marital1_month9=marital1*month9;
i_marital1_month10=marital1*month10;
i_marital1_month11=marital1*month11;
i_marital1_month12=marital1*month12;
i_marital1_poutcome2=marital1*poutcome2;
i_marital1_poutcome3=marital1*poutcome3;
i_marital1_poutcome4=marital1*poutcome4;

i_marital2_education2=marital2*education2;
i_marital2_education3=marital2*education3;
i_marital2_education4=marital2*education4;
i_marital2_contact2=marital2*contact2;
i_marital2_contact3=marital2*contact3;
i_marital2_month2=marital2*month2;
i_marital2_month3=marital2*month3;
i_marital2_month4=marital2*month4;
i_marital2_month5=marital2*month5;
i_marital2_month6=marital2*month6;
i_marital2_month7=marital2*month7;
i_marital2_month8=marital2*month8;
i_marital2_month9=marital2*month9;
i_marital2_month10=marital2*month10;
i_marital2_month11=marital2*month11;
i_marital2_month12=marital2*month12;
i_marital2_poutcome2=marital2*poutcome2;
i_marital2_poutcome3=marital2*poutcome3;
i_marital2_poutcome4=marital2*poutcome4;

i_education2_contact2=education2*contact2;
i_education2_contact3=education2*contact3;
i_education2_month2=education2*month2;
i_education2_month3=education2*month3;
i_education2_month4=education2*month4;
i_education2_month5=education2*month5;
i_education2_month6=education2*month6;
i_education2_month7=education2*month7;
i_education2_month8=education2*month8;
i_education2_month9=education2*month9;
i_education2_month10=education2*month10;
i_education2_month11=education2*month11;
i_education2_month12=education2*month12;
i_education2_poutcome2=education2*poutcome2;
i_education2_poutcome3=education2*poutcome3;
i_education2_poutcome4=education2*poutcome4;

i_education3_contact2=education3*contact2;
i_education3_contact3=education3*contact3;
i_education3_month2=education3*month2;
i_education3_month3=education3*month3;
i_education3_month4=education3*month4;
i_education3_month5=education3*month5;
i_education3_month6=education3*month6;
i_education3_month7=education3*month7;
i_education3_month8=education3*month8;
i_education3_month9=education3*month9;
i_education3_month10=education3*month10;
i_education3_month11=education3*month11;
i_education3_month12=education3*month12;
i_education3_poutcome2=education3*poutcome2;
i_education3_poutcome3=education3*poutcome3;
i_education3_poutcome4=education3*poutcome4;

i_education4_contact2=education4*contact2;
i_education4_contact3=education4*contact3;
i_education4_month2=education4*month2;
i_education4_month3=education4*month3;
i_education4_month4=education4*month4;
i_education4_month5=education4*month5;
i_education4_month6=education4*month6;
i_education4_month7=education4*month7;
i_education4_month8=education4*month8;
i_education4_month9=education4*month9;
i_education4_month10=education4*month10;
i_education4_month11=education4*month11;
i_education4_month12=education4*month12;
i_education4_poutcome2=education4*poutcome2;
i_education4_poutcome3=education4*poutcome3;
i_education4_poutcome4=education4*poutcome4;

i_contact2_month2=contact2*month2;
i_contact2_month3=contact2*month3;
i_contact2_month4=contact2*month4;
i_contact2_month5=contact2*month5;
i_contact2_month6=contact2*month6;
i_contact2_month7=contact2*month7;
i_contact2_month8=contact2*month8;
i_contact2_month9=contact2*month9;
i_contact2_month10=contact2*month10;
i_contact2_month11=contact2*month11;
i_contact2_month12=contact2*month12;
i_contact2_poutcome2=contact2*poutcome2;
i_contact2_poutcome3=contact2*poutcome3;
i_contact2_poutcome4=contact2*poutcome4;

i_contact3_month2=contact3*month2;
i_contact3_month3=contact3*month3;
i_contact3_month4=contact3*month4;
i_contact3_month5=contact3*month5;
i_contact3_month6=contact3*month6;
i_contact3_month7=contact3*month7;
i_contact3_month8=contact3*month8;
i_contact3_month9=contact3*month9;
i_contact3_month10=contact3*month10;
i_contact3_month11=contact3*month11;
i_contact3_month12=contact3*month12;
i_contact3_poutcome2=contact3*poutcome2;
i_contact3_poutcome3=contact3*poutcome3;
i_contact3_poutcome4=contact3*poutcome4;

i_month2_poutcome2=month2*poutcome2;
i_month2_poutcome3=month2*poutcome3;
i_month2_poutcome4=month2*poutcome4;

i_month3_poutcome2=month3*poutcome2;
i_month3_poutcome3=month3*poutcome3;
i_month3_poutcome4=month3*poutcome4;

i_month4_poutcome2=month4*poutcome2;
i_month4_poutcome3=month4*poutcome3;
i_month4_poutcome4=month4*poutcome4;

i_month5_poutcome2=month5*poutcome2;
i_month5_poutcome3=month5*poutcome3;
i_month5_poutcome4=month5*poutcome4;

i_month6_poutcome2=month6*poutcome2;
i_month6_poutcome3=month6*poutcome3;
i_month6_poutcome4=month6*poutcome4;

i_month7_poutcome2=month7*poutcome2;
i_month7_poutcome3=month7*poutcome3;
i_month7_poutcome4=month7*poutcome4;

i_month8_poutcome2=month8*poutcome2;
i_month8_poutcome3=month8*poutcome3;
i_month8_poutcome4=month8*poutcome4;

i_month9_poutcome2=month9*poutcome2;
i_month9_poutcome3=month9*poutcome3;
i_month9_poutcome4=month9*poutcome4;

i_month10_poutcome2=month10*poutcome2;
i_month10_poutcome3=month10*poutcome3;
i_month10_poutcome4=month10*poutcome4;

i_month11_poutcome2=month11*poutcome2;
i_month11_poutcome3=month11*poutcome3;
i_month11_poutcome4=month11*poutcome4;

i_month12_poutcome2=month12*poutcome2;
i_month12_poutcome3=month12*poutcome3;
i_month12_poutcome4=month12*poutcome4;
run;

/*spéarer l'échantillon*/
/*Step 1 : sélection de vars :*/
Proc Surveyselect data=multi.Devoir2_Q1_All 
OUT=Devoir2_Q1_tous outall Method=SRS Sampsize=1800 Seed=2209;
Run ;
/*Step 2 : Mettre les échantillons sélectionnés dans une table training :*/
Data multi.Devoir2_Q1_Train ;
Set Devoir2_Q1_tous;
If selected=1;
Run ;
/*Step 3 : Mettre le reste des échantillons dans une autre table + nouvelle sélection :*/
Data multi.Devoir2_Q1_Valid;
Set Devoir2_Q1_tous;
If selected=0;
Run ;

/*Tests de choix de modèles et variables
----------------41 variables de start-------------------------
lancer la recherche de modèle recherche all-subset*/
%logistic_aic_sbc_score(yvariable=y,xvariables=age default1 balance housing1 loan1 day duration pdays previous job1 job3 job4 job5 job6 job7 job8 
job9 job10 job11 job12 marital1 marital2 education2 education3 education4 contact2 contact3 month2
month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 poutcome2 poutcome3 poutcome4,
dataset=multi.Devoir2_Q1_Train,minvar=1,maxvar=41);

/*méthode stepwise*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Train;
model y(ref='0') = age default1 balance housing1 loan1 day duration pdays previous job1 job3 job4 job5 job6 job7 job8 
job9 job10 job11 job12 marital1 marital2 education2 education3 education4 contact2 contact3 month2
month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 poutcome2 poutcome3 poutcome4 
/ selection=stepwise slentry=.05 slstay=.05;
run;
ods rtf close;

/*méthode stepwise + all-subset*/
%logistic_aic_sbc_score(yvariable=y,xvariables=Duration 
poutcome4 month3 month10 contact3 contact2 month6 month9 month4 loan1 housing1 marital1 poutcome2 month7,
dataset=multi.Devoir2_Q1_Train,minvar=1,maxvar=14);

/*test recherche variables hpgenselect*/
ods rtf;
proc hpgenselect data=multi.Devoir2_Q1_Train;
model y(ref='0') = age default1 balance housing1 loan1 day duration pdays previous job1 job3 job4 job5 job6 job7 job8 
job9 job10 job11 job12 marital1 marital2 education2 education3 education4 contact2 contact3 month2
month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 poutcome2 poutcome3 poutcome4 
  / link=logit distribution=binary;
selection method=stepwise(select=sl choose=sbc);
run;
ods rtf close;

/*-----------------770 variables-------------------*/ 
/*test recherche variables Stepwise*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Train ;
model y(ref='0') = age default1 balance housing1 loan1 day duration pdays previous job1 job3 job4 job5 job6 job7 job8 
job9 job10 job11 job12 marital1 marital2 education2 education3 education4 contact2 contact3 month2
month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 poutcome2 poutcome3 poutcome4
c_age c_balance c_day c_duration c_pdays c_previous
age|default1|balance|housing1|loan1|day|duration|pdays|previous|job1|job3|job4|job5|job6|job7|job8|
job9|job10|job11|job12|marital1|marital2|education2|education3|education4|contact2|contact3|month2|
month3|month4|month5|month6|month7|month8|month9|month10|month11|month12|poutcome2|poutcome3|poutcome4 @2 / selection=stepwise sle=0.05 sls=0.05;
run;
ods rtf close;

/*Test de recherche stepwise + all-subset avec les 12 variables obtenus précedement*/
%logistic_aic_sbc_score(yvariable=y,xvariables=Duration poutcome4 month3 c_duration month10 contact3 
month9 contact2 month6 month4 loan1 i_contact3_month6 housing1 i_housing1_loan1 i_month9_poutcome4 
i_housing1_month4 i_contact2_month4 i_duration_month10 poutcome2 i_month3_poutcome2 marital1 i_duration_month6 
i_housing1_month6 i_marital1_month10,
dataset=multi.Devoir2_Q1_Train,minvar=1,maxvar=24);

/*test recherche variables hpgenselect*/
ods rtf;
proc hpgenselect data=multi.Devoir2_Q1_Train;
model y(ref='0') = age default1 balance housing1 loan1 day duration pdays previous job1 job3 job4 job5 job6 job7 job8 
job9 job10 job11 job12 marital1 marital2 education2 education3 education4 contact2 contact3 month2
month3 month4 month5 month6 month7 month8 month9 month10 month11 month12 poutcome2 poutcome3 poutcome4
c_age c_balance c_day c_duration c_pdays c_previous
age|default1|balance|housing1|loan1|day|duration|pdays|previous|job1|job3|job4|job5|job6|job7|job8|
job9|job10|job11|job12|marital1|marital2|education2|education3|education4|contact2|contact3|month2|
month3|month4|month5|month6|month7|month8|month9|month10|month11|month12|poutcome2|poutcome3|poutcome4 @2  
  / link=logit distribution=binary;
selection method=stepwise(select=sl choose=sbc);
run;
ods rtf close;


/*-----------------test de point de coupure----------------------------
modèle 1 allsubset aic*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = housing1 loan1 duration job4 job7 job10 marital1 
education2 education3 contact2 contact3 month3 month4 month6 month7 month9 month10 month12 poutcome2 poutcome4 / ctable;
run;
ods rtf close;

/*modèle 2 allsubset bic*/
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = housing1 loan1 duration contact2 contact3 month3 month4 month6 month9 month10 poutcome2 poutcome4 / ctable;
run;

/*modèle 3 stepwise*/
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = Duration poutcome4 month3 month10 contact3 contact2 month6 month9 
month4 loan1 housing1 marital1 poutcome2 month7 / ctable;
run;

/*modèle 4 limitée + allsubset aic*/
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = duration poutcome4 month3 month10 contact3 contact2 month6 month9 month4 
loan1 housing1 marital1 poutcome2 month7 / ctable;
run;

/*modèle 5 limitée + allsubset Bic*/
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = duration poutcome4 month3 month10 contact3 contact2 month6 month9 
month4 loan1 housing1 marital1 poutcome2 / ctable;
run;

/*modèle 6 hpgenselect*/
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = Duration poutcome4 i_housing1_month5 c_duration month3 i_day_month10 i_contact3_month6 i_age_month9 
i_contact3_month4 i_contact3_month5 i_pdays_month8 i_day_month2 i_housing1_month4 i_previous_month9 i_month5_poutcome4 
/ ctable;
run;

/*modèle 7 stepwise 770 variables*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = Duration poutcome4 month3 c_duration month10 contact3 month9 contact2 month6 month4 loan1 
i_contact3_month6 housing1 i_housing1_loan1 i_month9_poutcome4 i_housing1_month4 i_contact2_month4 i_duration_month10 
poutcome2 i_month3_poutcome2 marital1 i_duration_month6 i_housing1_month6 i_marital1_month10 
/ ctable;
run;
ods rtf close;

/*modèle 7 limité + allsubset AIC 22 variables*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = duration poutcome4 month3 c_duration month10 contact3 month9 contact2 month4 loan1 i_contact3_month6
housing1 i_housing1_loan1 i_month9_poutcome4 i_housing1_month4 i_contact2_month4 i_duration_month10 poutcome2 i_month3_poutcome2 
marital1 i_housing1_month6 i_marital1_month10 
/ ctable;
run;
ods rtf close;

/*modèle 8 limité + allsubset BIC 16 variables*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = duration poutcome4 month3 c_duration month10 contact3 month9 contact2 month4 loan1 i_contact3_month6 housing1 
i_housing1_loan1 i_housing1_month4 poutcome2 i_marital1_month10 
/ ctable;
run;
ods rtf close;

/*modèle 9 hpgenselect 770 variables*/
ods rtf;
proc logistic data=multi.Devoir2_Q1_Valid;
model y(ref='0') = duration month3 poutcome4 c_duration i_age_month9 i_housing1_month4 i_housing1_month5 i_day_month2 i_day_month10 
i_pdays_month8 i_previous_month9 i_contact3_month4 i_contact3_month5 i_contact3_month6 i_month5_poutcome4 
/ ctable;
run;
ods rtf close;

/*préparation des données de score*/
data multi.Devoir2_Q1_Score;
set multi.Devoir2_Q1_Score;
job1=0; 
job2=0; 
job3=0; 
job4=0; 
job5=0; 
job6=0;
job6=0;
job7=0;
job8=0;
job9=0;
job10=0;
job11=0;
job12=0;
marital1=0;
marital2=0;
marital3=0;
education1=0;
education2=0;
education3=0;
education4=0;
contact1=0;
contact2=0;
contact3=0;
month1=0;
month2=0;
month3=0;
month4=0;
month5=0;
month6=0;
month7=0;
month8=0;
month9=0;
month10=0;
month11=0;
month12=0;
poutcome1=0;
poutcome2=0;
poutcome3=0;
poutcome4=0;

  if job="admin" then job1=1;
  if job="unknow" then job2=1;
  if job="unemployed" then job3=1;
  if job="management" then job4=1;
  if job="housemaid" then job5=1;
  if job="entrepreneur" then job6=1;
  if job="student" then job7=1;
  if job="blue-collar" then job8=1;
  if job="self-employed" then job9=1;
  if job="retired" then job10=1;
  if job="technician" then job11=1;
  if job="services" then job12=1;
  if marital="married" then marital1=1;
  if marital="divorced" then marital2=1;
  if marital="single" then marital3=1;
  if education="unknown" then education1=1;
  if education="secondary" then education2=1;
  if education="primary" then education3=1;
  if education="tertiary" then education4=1;
  if contact="unknown" then contact1=1;
  if contact="telephone" then contact2=1;
  if contact="cellular" then contact3=1;
  if month="jan" then month1=1;
  if month="feb" then month2=1;
  if month="mar" then month3=1;
  if month="apr" then month4=1;
  if month="may" then month5=1;
  if month="jun" then month6=1;
  if month="jul" then month7=1;
  if month="aug" then month8=1;
  if month="sep" then month9=1;
  if month="oct" then month10=1;
  if month="nov" then month11=1;
  if month="dec" then month12=1;
  if poutcome="unknown" then poutcome1=1;
  if poutcome="other" then poutcome2=1;
  if poutcome="failure" then poutcome3=1;
  if poutcome="success" then poutcome4=1;
  if default="yes" then default1=1;
  if default="no" then default1=0;
  if housing="yes" then housing1=1;
  if housing="no" then housing1=0;
  if loan="yes" then loan1=1;
  if loan="no" then loan1=0;

c_age=age**2;
c_balance=balance**2;
c_day=day**2;
c_duration=duration**2;
c_pdays=pdays**2;
c_previous=previous**2;

i_age_job1=age*job1;
i_age_job3=age*job3;
i_age_job4=age*job4;
i_age_job5=age*job5;
i_age_job6=age*job6;
i_age_job7=age*job7;
i_age_job8=age*job8;
i_age_job9=age*job9;
i_age_job10=age*job10;
i_age_job11=age*job11;
i_age_job12=age*job12;
i_age_marital1=age*marital1;
i_age_marital2=age*marital2;
i_age_education2=age*education2;
i_age_education3=age*education3;
i_age_education4=age*education4;
i_age_default1=age*default1;
i_age_balance=age*balance;
i_age_housing1=age*housing1;
i_age_loan1=age*loan1;
i_age_contact2=age*contact2;
i_age_contact3=age*contact3;
i_age_day=age*day;
i_age_month2=age*month2;
i_age_month3=age*month3;
i_age_month4=age*month4;
i_age_month5=age*month5;
i_age_month6=age*month6;
i_age_month7=age*month7;
i_age_month8=age*month8;
i_age_month9=age*month9;
i_age_month10=age*month10;
i_age_month11=age*month11;
i_age_month12=age*month12;
i_age_duration=age*duration;
i_age_pdays=age*pdays;
i_age_previous=age*previous;
i_age_poutcome2=age*poutcome2;
i_age_poutcome3=age*poutcome3;
i_age_poutcome4=age*poutcome4;

i_default1_job1=default1*job1;
i_default1_job3=default1*job3;
i_default1_job4=default1*job4;
i_default1_job5=default1*job5;
i_default1_job6=default1*job6;
i_default1_job7=default1*job7;
i_default1_job8=default1*job8;
i_default1_job9=default1*job9;
i_default1_job10=default1*job10;
i_default1_job11=default1*job11;
i_default1_job12=default1*job12;
i_default1_marital1=default1*marital1;
i_default1_marital2=default1*marital2;
i_default1_education2=default1*education2;
i_default1_education3=default1*education3;
i_default1_education4=default1*education4;
i_default1_balance=default1*balance;
i_default1_housing1=default1*housing1;
i_default1_loa1n=default1*loan1;
i_default1_contact2=default1*contact2;
i_default1_contact3=default1*contact3;
i_default1_day=default1*day;
i_default1_month2=default1*month2;
i_default1_month3=default1*month3;
i_default1_month4=default1*month4;
i_default1_month5=default1*month5;
i_default1_month6=default1*month6;
i_default1_month7=default1*month7;
i_default1_month8=default1*month8;
i_default1_month9=default1*month9;
i_default1_month10=default1*month10;
i_default1_month11=default1*month11;
i_default1_month12=default1*month12;
i_default1_duration=default1*duration;
i_default1_pdays=default1*pdays;
i_default1_previous=default1*previous;
i_default1_poutcome2=default1*poutcome2;
i_default1_poutcome3=default1*poutcome3;
i_default1_poutcome4=default1*poutcome4;

i_balance_job2=balance*job1;
i_balance_job3=balance*job3;
i_balance_job4=balance*job4;
i_balance_job5=balance*job5;
i_balance_job6=balance*job6;
i_balance_job7=balance*job7;
i_balance_job8=balance*job8;
i_balance_job9=balance*job9;
i_balance_job10=balance*job10;
i_balance_job11=balance*job11;
i_balance_job12=balance*job12;
i_balance_marital1=balance*marital1;
i_balance_marital2=balance*marital2;
i_balance_education2=balance*education2;
i_balance_education3=balance*education3;
i_balance_education4=balance*education4;
i_balance_housing1=balance*housing1;
i_balance_loa1n=balance*loan1;
i_balance_contact2=balance*contact2;
i_balance_contact3=balance*contact3;
i_balance_day=balance*day;
i_balance_month2=balance*month2;
i_balance_month3=balance*month3;
i_balance_month4=balance*month4;
i_balance_month5=balance*month5;
i_balance_month6=balance*month6;
i_balance_month7=balance*month7;
i_balance_month8=balance*month8;
i_balance_month9=balance*month9;
i_balance_month10=balance*month10;
i_balance_month11=balance*month11;
i_balance_month12=balance*month12;
i_balance_duration=balance*duration;
i_balance_pdays=balance*pdays;
i_balance_previous=balance*previous;
i_balance_poutcome2=balance*poutcome2;
i_balance_poutcome3=balance*poutcome3;
i_balance_poutcome4=balance*poutcome4;

i_housing1_job1=housing1*job1;
i_housing1_job3=housing1*job3;
i_housing1_job4=housing1*job4;
i_housing1_job5=housing1*job5;
i_housing1_job6=housing1*job6;
i_housing1_job7=housing1*job7;
i_housing1_job8=housing1*job8;
i_housing1_job9=housing1*job9;
i_housing1_job10=housing1*job10;
i_housing1_job11=housing1*job11;
i_housing1_job12=housing1*job12;
i_housing1_marital1=housing1*marital1;
i_housing1_marital2=housing1*marital2;
i_housing1_education2=housing1*education2;
i_housing1_education3=housing1*education3;
i_housing1_education4=housing1*education4;
i_housing1_loan1=housing1*loan1;
i_housing1_contact2=housing1*contact2;
i_housing1_contact3=housing1*contact3;
i_housing1_day=housing1*day;
i_housing1_month2=housing1*month2;
i_housing1_month3=housing1*month3;
i_housing1_month4=housing1*month4;
i_housing1_month5=housing1*month5;
i_housing1_month6=housing1*month6;
i_housing1_month7=housing1*month7;
i_housing1_month8=housing1*month8;
i_housing1_month9=housing1*month9;
i_housing1_month10=housing1*month10;
i_housing1_month11=housing1*month11;
i_housing1_month12=housing1*month12;
i_housing1_duration=housing1*duration;
i_housing1_pdays=housing1*pdays;
i_housing1_previous=housing1*previous;
i_housing1_poutcome2=housing1*poutcome2;
i_housing1_poutcome3=housing1*poutcome3;
i_housing1_poutcome4=housing1*poutcome4;

i_loan1_job1=loan1*job1;
i_loan1_job3=loan1*job3;
i_loan1_job4=loan1*job4;
i_loan1_job5=loan1*job5;
i_loan1_job6=loan1*job6;
i_loan1_job7=loan1*job7;
i_loan1_job8=loan1*job8;
i_loan1_job9=loan1*job9;
i_loan1_job10=loan1*job10;
i_loan1_job11=loan1*job11;
i_loan1_job12=loan1*job12;
i_loan1_marital1=loan1*marital1;
i_loan1_marital2=loan1*marital2;
i_loan1_education2=loan1*education2;
i_loan1_education3=loan1*education3;
i_loan1_education4=loan1*education4;
i_loan1_contact2=loan1*contact2;
i_loan1_contact3=loan1*contact3;
i_loan1_day=loan1*day;
i_loan1_month2=loan1*month2;
i_loan1_month3=loan1*month3;
i_loan1_month4=loan1*month4;
i_loan1_month5=loan1*month5;
i_loan1_month6=loan1*month6;
i_loan1_month7=loan1*month7;
i_loan1_month8=loan1*month8;
i_loan1_month9=loan1*month9;
i_loan1_month10=loan1*month10;
i_loan1_month11=loan1*month11;
i_loan1_month12=loan1*month12;
i_loan1_duration=loan1*duration;
i_loan1_pdays=loan1*pdays;
i_loan1_previous=loan1*previous;
i_loan1_poutcome2=loan1*poutcome2;
i_loan1_poutcome3=loan1*poutcome3;
i_loan1_poutcome4=loan1*poutcome4;

i_day_job1=day*job1;
i_day_job3=day*job3;
i_day_job4=day*job4;
i_day_job5=day*job5;
i_day_job6=day*job6;
i_day_job7=day*job7;
i_day_job8=day*job8;
i_day_job9=day*job9;
i_day_job10=day*job10;
i_day_job11=day*job11;
i_day_job12=day*job12;
i_day_marital1=day*marital1;
i_day_marital2=day*marital2;
i_day_education2=day*education2;
i_day_education3=day*education3;
i_day_education4=day*education4;
i_day_contact2=day*contact2;
i_day_contact3=day*contact3;
i_day_month2=day*month2;
i_day_month3=day*month3;
i_day_month4=day*month4;
i_day_month5=day*month5;
i_day_month6=day*month6;
i_day_month7=day*month7;
i_day_month8=day*month8;
i_day_month9=day*month9;
i_day_month10=day*month10;
i_day_month11=day*month11;
i_day_month12=day*month12;
i_day_duration=day*duration;
i_day_pdays=day*pdays;
i_day_previous=day*previous;
i_day_poutcome2=day*poutcome2;
i_day_poutcome3=day*poutcome3;
i_day_poutcome4=day*poutcome4;

i_duration_job1=duration*job1;
i_duration_job3=duration*job3;
i_duration_job4=duration*job4;
i_duration_job5=duration*job5;
i_duration_job6=duration*job6;
i_duration_job7=duration*job7;
i_duration_job8=duration*job8;
i_duration_job9=duration*job9;
i_duration_job10=duration*job10;
i_duration_job11=duration*job11;
i_duration_job12=duration*job12;
i_duration_marital1=duration*marital1;
i_duration_marital2=duration*marital2;
i_duration_education2=duration*education2;
i_duration_education3=duration*education3;
i_duration_education4=duration*education4;
i_duration_contact2=duration*contact2;
i_duration_contact3=duration*contact3;
i_duration_month2=duration*month2;
i_duration_month3=duration*month3;
i_duration_month4=duration*month4;
i_duration_month5=duration*month5;
i_duration_month6=duration*month6;
i_duration_month7=duration*month7;
i_duration_month8=duration*month8;
i_duration_month9=duration*month9;
i_duration_month10=duration*month10;
i_duration_month11=duration*month11;
i_duration_month12=duration*month12;
i_duration_pdays=duration*pdays;
i_duration_previous=duration*previous;
i_duration_poutcome2=duration*poutcome2;
i_duration_poutcome3=duration*poutcome3;
i_duration_poutcome4=duration*poutcome4;

i_pdays_job1=pdays*job1;
i_pdays_job3=pdays*job3;
i_pdays_job4=pdays*job4;
i_pdays_job5=pdays*job5;
i_pdays_job6=pdays*job6;
i_pdays_job7=pdays*job7;
i_pdays_job8=pdays*job8;
i_pdays_job9=pdays*job9;
i_pdays_job10=pdays*job10;
i_pdays_job11=pdays*job11;
i_pdays_job12=pdays*job12;
i_pdays_marital1=pdays*marital1;
i_pdays_marital2=pdays*marital2;
i_pdays_education2=pdays*education2;
i_pdays_education3=pdays*education3;
i_pdays_education4=pdays*education4;
i_pdays_contact2=pdays*contact2;
i_pdays_contact3=pdays*contact3;
i_pdays_month2=pdays*month2;
i_pdays_month3=pdays*month3;
i_pdays_month4=pdays*month4;
i_pdays_month5=pdays*month5;
i_pdays_month6=pdays*month6;
i_pdays_month7=pdays*month7;
i_pdays_month8=pdays*month8;
i_pdays_month9=pdays*month9;
i_pdays_month10=pdays*month10;
i_pdays_month11=pdays*month11;
i_pdays_month12=pdays*month12;
i_pdays_previous=pdays*previous;
i_pdays_poutcome2=pdays*poutcome2;
i_pdays_poutcome3=pdays*poutcome3;
i_pdays_poutcome4=pdays*poutcome4;

i_previous_job2=previous*job2;
i_previous_job3=previous*job3;
i_previous_job4=previous*job4;
i_previous_job5=previous*job5;
i_previous_job6=previous*job6;
i_previous_job7=previous*job7;
i_previous_job8=previous*job8;
i_previous_job9=previous*job9;
i_previous_job10=previous*job10;
i_previous_job11=previous*job11;
i_previous_job12=previous*job12;
i_previous_marital1=previous*marital1;
i_previous_marital2=previous*marital2;
i_previous_education2=previous*education2;
i_previous_education3=previous*education3;
i_previous_education4=previous*education4;
i_previous_contact2=previous*contact2;
i_previous_contact3=previous*contact3;
i_previous_month2=previous*month2;
i_previous_month3=previous*month3;
i_previous_month4=previous*month4;
i_previous_month5=previous*month5;
i_previous_month6=previous*month6;
i_previous_month7=previous*month7;
i_previous_month8=previous*month8;
i_previous_month9=previous*month9;
i_previous_month10=previous*month10;
i_previous_month11=previous*month11;
i_previous_month12=previous*month12;
i_previous_poutcome2=previous*poutcome2;
i_previous_poutcome3=previous*poutcome3;
i_previous_poutcome4=previous*poutcome4;

i_job1_marital1=job1*marital1;
i_job1_marital2=job1*marital2;
i_job1_education2=job1*education2;
i_job1_education3=job1*education3;
i_job1_education4=job1*education4;
i_job1_contact2=job1*contact2;
i_job1_contact3=job1*contact3;
i_job1_month2=job1*month2;
i_job1_month3=job1*month3;
i_job1_month4=job1*month4;
i_job1_month5=job1*month5;
i_job1_month6=job1*month6;
i_job1_month7=job1*month7;
i_job1_month8=job1*month8;
i_job1_month9=job1*month9;
i_job1_month10=job1*month10;
i_job1_month11=job1*month11;
i_job1_month12=job1*month12;
i_job1_poutcome2=job1*poutcome2;
i_job1_poutcome3=job1*poutcome3;
i_job1_poutcome4=job1*poutcome4;

i_job3_marital1=job3*marital1;
i_job3_marital2=job3*marital2;
i_job3_education2=job3*education2;
i_job3_education3=job3*education3;
i_job3_education4=job3*education4;
i_job3_contact2=job3*contact2;
i_job3_contact3=job3*contact3;
i_job3_month2=job3*month2;
i_job3_month3=job3*month3;
i_job3_month4=job3*month4;
i_job3_month5=job3*month5;
i_job3_month6=job3*month6;
i_job3_month7=job3*month7;
i_job3_month8=job3*month8;
i_job3_month9=job3*month9;
i_job3_month10=job3*month10;
i_job3_month11=job3*month11;
i_job3_month12=job3*month12;
i_job3_poutcome2=job3*poutcome2;
i_job3_poutcome3=job3*poutcome3;
i_job3_poutcome4=job3*poutcome4;

i_job4_marital1=job4*marital1;
i_job4_marital2=job4*marital2;
i_job4_education2=job4*education2;
i_job4_education3=job4*education3;
i_job4_education4=job4*education4;
i_job4_contact2=job4*contact2;
i_job4_contact3=job4*contact3;
i_job4_month2=job4*month2;
i_job4_month3=job4*month3;
i_job4_month4=job4*month4;
i_job4_month5=job4*month5;
i_job4_month6=job4*month6;
i_job4_month7=job4*month7;
i_job4_month8=job4*month8;
i_job4_month9=job4*month9;
i_job4_month10=job4*month10;
i_job4_month11=job4*month11;
i_job4_month12=job4*month12;
i_job4_poutcome2=job4*poutcome2;
i_job4_poutcome3=job4*poutcome3;
i_job4_poutcome4=job4*poutcome4;

i_job5_marital1=job5*marital1;
i_job5_marital2=job5*marital2;
i_job5_education2=job5*education2;
i_job5_education3=job5*education3;
i_job5_education4=job5*education4;
i_job5_contact2=job5*contact2;
i_job5_contact3=job5*contact3;
i_job5_month2=job5*month2;
i_job5_month3=job5*month3;
i_job5_month4=job5*month4;
i_job5_month5=job5*month5;
i_job5_month6=job5*month6;
i_job5_month7=job5*month7;
i_job5_month8=job5*month8;
i_job5_month9=job5*month9;
i_job5_month10=job5*month10;
i_job5_month11=job5*month11;
i_job5_month12=job5*month12;
i_job5_poutcome2=job5*poutcome2;
i_job5_poutcome3=job5*poutcome3;
i_job5_poutcome4=job5*poutcome4;

i_job6_marital1=job6*marital1;
i_job6_marital2=job6*marital2;
i_job6_education2=job6*education2;
i_job6_education3=job6*education3;
i_job6_education4=job6*education4;
i_job6_contact2=job6*contact2;
i_job6_contact3=job6*contact3;
i_job6_month2=job6*month2;
i_job6_month3=job6*month3;
i_job6_month4=job6*month4;
i_job6_month5=job6*month5;
i_job6_month6=job6*month6;
i_job6_month7=job6*month7;
i_job6_month8=job6*month8;
i_job6_month9=job6*month9;
i_job6_month10=job6*month10;
i_job6_month11=job6*month11;
i_job6_month12=job6*month12;
i_job6_poutcome2=job6*poutcome2;
i_job6_poutcome3=job6*poutcome3;
i_job6_poutcome4=job6*poutcome4;

i_job6_marital1=job6*marital1;
i_job6_marital2=job6*marital2;
i_job6_education2=job6*education2;
i_job6_education3=job6*education3;
i_job6_education4=job6*education4;
i_job6_contact2=job6*contact2;
i_job6_contact3=job6*contact3;
i_job6_month2=job6*month2;
i_job6_month3=job6*month3;
i_job6_month4=job6*month4;
i_job6_month5=job6*month5;
i_job6_month6=job6*month6;
i_job6_month7=job6*month7;
i_job6_month8=job6*month8;
i_job6_month9=job6*month9;
i_job6_month10=job6*month10;
i_job6_month11=job6*month11;
i_job6_month12=job6*month12;
i_job6_poutcome2=job6*poutcome2;
i_job6_poutcome3=job6*poutcome3;
i_job6_poutcome4=job6*poutcome4;

i_job7_marital1=job7*marital1;
i_job7_marital2=job7*marital2;
i_job7_education2=job7*education2;
i_job7_education3=job7*education3;
i_job7_education4=job7*education4;
i_job7_contact2=job7*contact2;
i_job7_contact3=job7*contact3;
i_job7_month2=job7*month2;
i_job7_month3=job7*month3;
i_job7_month4=job7*month4;
i_job7_month5=job7*month5;
i_job7_month6=job7*month6;
i_job7_month7=job7*month7;
i_job7_month8=job7*month8;
i_job7_month9=job7*month9;
i_job7_month10=job7*month10;
i_job7_month11=job7*month11;
i_job7_month12=job7*month12;
i_job7_poutcome2=job7*poutcome2;
i_job7_poutcome3=job7*poutcome3;
i_job7_poutcome4=job7*poutcome4;

i_job8_marital1=job8*marital1;
i_job8_marital2=job8*marital2;
i_job8_education2=job8*education2;
i_job8_education3=job8*education3;
i_job8_education4=job8*education4;
i_job8_contact2=job8*contact2;
i_job8_contact3=job8*contact3;
i_job8_month2=job8*month2;
i_job8_month3=job8*month3;
i_job8_month4=job8*month4;
i_job8_month5=job8*month5;
i_job8_month6=job8*month6;
i_job8_month7=job8*month7;
i_job8_month8=job8*month8;
i_job8_month9=job8*month9;
i_job8_month10=job8*month10;
i_job8_month11=job8*month11;
i_job8_month12=job8*month12;
i_job8_poutcome2=job8*poutcome2;
i_job8_poutcome3=job8*poutcome3;
i_job8_poutcome4=job8*poutcome4;

i_job9_marital1=job9*marital1;
i_job9_marital2=job9*marital2;
i_job9_education2=job9*education2;
i_job9_education3=job9*education3;
i_job9_education4=job9*education4;
i_job9_contact2=job9*contact2;
i_job9_contact3=job9*contact3;
i_job9_month2=job9*month2;
i_job9_month3=job9*month3;
i_job9_month4=job9*month4;
i_job9_month5=job9*month5;
i_job9_month6=job9*month6;
i_job9_month7=job9*month7;
i_job9_month8=job9*month8;
i_job9_month9=job9*month9;
i_job9_month10=job9*month10;
i_job9_month11=job9*month11;
i_job9_month12=job9*month12;
i_job9_poutcome2=job9*poutcome2;
i_job9_poutcome3=job9*poutcome3;
i_job9_poutcome4=job9*poutcome4;

i_job10_marital1=job10*marital1;
i_job10_marital2=job10*marital2;
i_job10_education2=job10*education2;
i_job10_education3=job10*education3;
i_job10_education4=job10*education4;
i_job10_contact2=job10*contact2;
i_job10_contact3=job10*contact3;
i_job10_month2=job10*month2;
i_job10_month3=job10*month3;
i_job10_month4=job10*month4;
i_job10_month5=job10*month5;
i_job10_month6=job10*month6;
i_job10_month7=job10*month7;
i_job10_month8=job10*month8;
i_job10_month9=job10*month9;
i_job10_month10=job10*month10;
i_job10_month11=job10*month11;
i_job10_month12=job10*month12;
i_job10_poutcome2=job10*poutcome2;
i_job10_poutcome3=job10*poutcome3;
i_job10_poutcome4=job10*poutcome4;

i_job11_marital1=job11*marital1;
i_job11_marital2=job11*marital2;
i_job11_education2=job11*education2;
i_job11_education3=job11*education3;
i_job11_education4=job11*education4;
i_job11_contact2=job11*contact2;
i_job11_contact3=job11*contact3;
i_job11_month2=job11*month2;
i_job11_month3=job11*month3;
i_job11_month4=job11*month4;
i_job11_month5=job11*month5;
i_job11_month6=job11*month6;
i_job11_month7=job11*month7;
i_job11_month8=job11*month8;
i_job11_month9=job11*month9;
i_job11_month10=job11*month10;
i_job11_month11=job11*month11;
i_job11_month12=job11*month12;
i_job11_poutcome2=job11*poutcome2;
i_job11_poutcome3=job11*poutcome3;
i_job11_poutcome4=job11*poutcome4;

i_job12_marital1=job12*marital1;
i_job12_marital2=job12*marital2;
i_job12_education2=job12*education2;
i_job12_education3=job12*education3;
i_job12_education4=job12*education4;
i_job12_contact2=job12*contact2;
i_job12_contact3=job12*contact3;
i_job12_month2=job12*month2;
i_job12_month3=job12*month3;
i_job12_month4=job12*month4;
i_job12_month5=job12*month5;
i_job12_month6=job12*month6;
i_job12_month7=job12*month7;
i_job12_month8=job12*month8;
i_job12_month9=job12*month9;
i_job12_month10=job12*month10;
i_job12_month11=job12*month11;
i_job12_month12=job12*month12;
i_job12_poutcome2=job12*poutcome2;
i_job12_poutcome3=job12*poutcome3;
i_job12_poutcome4=job12*poutcome4;

i_marital1_education2=marital1*education2;
i_marital1_education3=marital1*education3;
i_marital1_education4=marital1*education4;
i_marital1_contact2=marital1*contact2;
i_marital1_contact3=marital1*contact3;
i_marital1_month2=marital1*month2;
i_marital1_month3=marital1*month3;
i_marital1_month4=marital1*month4;
i_marital1_month5=marital1*month5;
i_marital1_month6=marital1*month6;
i_marital1_month7=marital1*month7;
i_marital1_month8=marital1*month8;
i_marital1_month9=marital1*month9;
i_marital1_month10=marital1*month10;
i_marital1_month11=marital1*month11;
i_marital1_month12=marital1*month12;
i_marital1_poutcome2=marital1*poutcome2;
i_marital1_poutcome3=marital1*poutcome3;
i_marital1_poutcome4=marital1*poutcome4;

i_marital2_education2=marital2*education2;
i_marital2_education3=marital2*education3;
i_marital2_education4=marital2*education4;
i_marital2_contact2=marital2*contact2;
i_marital2_contact3=marital2*contact3;
i_marital2_month2=marital2*month2;
i_marital2_month3=marital2*month3;
i_marital2_month4=marital2*month4;
i_marital2_month5=marital2*month5;
i_marital2_month6=marital2*month6;
i_marital2_month7=marital2*month7;
i_marital2_month8=marital2*month8;
i_marital2_month9=marital2*month9;
i_marital2_month10=marital2*month10;
i_marital2_month11=marital2*month11;
i_marital2_month12=marital2*month12;
i_marital2_poutcome2=marital2*poutcome2;
i_marital2_poutcome3=marital2*poutcome3;
i_marital2_poutcome4=marital2*poutcome4;

i_education2_contact2=education2*contact2;
i_education2_contact3=education2*contact3;
i_education2_month2=education2*month2;
i_education2_month3=education2*month3;
i_education2_month4=education2*month4;
i_education2_month5=education2*month5;
i_education2_month6=education2*month6;
i_education2_month7=education2*month7;
i_education2_month8=education2*month8;
i_education2_month9=education2*month9;
i_education2_month10=education2*month10;
i_education2_month11=education2*month11;
i_education2_month12=education2*month12;
i_education2_poutcome2=education2*poutcome2;
i_education2_poutcome3=education2*poutcome3;
i_education2_poutcome4=education2*poutcome4;

i_education3_contact2=education3*contact2;
i_education3_contact3=education3*contact3;
i_education3_month2=education3*month2;
i_education3_month3=education3*month3;
i_education3_month4=education3*month4;
i_education3_month5=education3*month5;
i_education3_month6=education3*month6;
i_education3_month7=education3*month7;
i_education3_month8=education3*month8;
i_education3_month9=education3*month9;
i_education3_month10=education3*month10;
i_education3_month11=education3*month11;
i_education3_month12=education3*month12;
i_education3_poutcome2=education3*poutcome2;
i_education3_poutcome3=education3*poutcome3;
i_education3_poutcome4=education3*poutcome4;

i_education4_contact2=education4*contact2;
i_education4_contact3=education4*contact3;
i_education4_month2=education4*month2;
i_education4_month3=education4*month3;
i_education4_month4=education4*month4;
i_education4_month5=education4*month5;
i_education4_month6=education4*month6;
i_education4_month7=education4*month7;
i_education4_month8=education4*month8;
i_education4_month9=education4*month9;
i_education4_month10=education4*month10;
i_education4_month11=education4*month11;
i_education4_month12=education4*month12;
i_education4_poutcome2=education4*poutcome2;
i_education4_poutcome3=education4*poutcome3;
i_education4_poutcome4=education4*poutcome4;

i_contact2_month2=contact2*month2;
i_contact2_month3=contact2*month3;
i_contact2_month4=contact2*month4;
i_contact2_month5=contact2*month5;
i_contact2_month6=contact2*month6;
i_contact2_month7=contact2*month7;
i_contact2_month8=contact2*month8;
i_contact2_month9=contact2*month9;
i_contact2_month10=contact2*month10;
i_contact2_month11=contact2*month11;
i_contact2_month12=contact2*month12;
i_contact2_poutcome2=contact2*poutcome2;
i_contact2_poutcome3=contact2*poutcome3;
i_contact2_poutcome4=contact2*poutcome4;

i_contact3_month2=contact3*month2;
i_contact3_month3=contact3*month3;
i_contact3_month4=contact3*month4;
i_contact3_month5=contact3*month5;
i_contact3_month6=contact3*month6;
i_contact3_month7=contact3*month7;
i_contact3_month8=contact3*month8;
i_contact3_month9=contact3*month9;
i_contact3_month10=contact3*month10;
i_contact3_month11=contact3*month11;
i_contact3_month12=contact3*month12;
i_contact3_poutcome2=contact3*poutcome2;
i_contact3_poutcome3=contact3*poutcome3;
i_contact3_poutcome4=contact3*poutcome4;

i_month2_poutcome2=month2*poutcome2;
i_month2_poutcome3=month2*poutcome3;
i_month2_poutcome4=month2*poutcome4;

i_month3_poutcome2=month3*poutcome2;
i_month3_poutcome3=month3*poutcome3;
i_month3_poutcome4=month3*poutcome4;

i_month4_poutcome2=month4*poutcome2;
i_month4_poutcome3=month4*poutcome3;
i_month4_poutcome4=month4*poutcome4;

i_month5_poutcome2=month5*poutcome2;
i_month5_poutcome3=month5*poutcome3;
i_month5_poutcome4=month5*poutcome4;

i_month6_poutcome2=month6*poutcome2;
i_month6_poutcome3=month6*poutcome3;
i_month6_poutcome4=month6*poutcome4;

i_month7_poutcome2=month7*poutcome2;
i_month7_poutcome3=month7*poutcome3;
i_month7_poutcome4=month7*poutcome4;

i_month8_poutcome2=month8*poutcome2;
i_month8_poutcome3=month8*poutcome3;
i_month8_poutcome4=month8*poutcome4;

i_month9_poutcome2=month9*poutcome2;
i_month9_poutcome3=month9*poutcome3;
i_month9_poutcome4=month9*poutcome4;

i_month10_poutcome2=month10*poutcome2;
i_month10_poutcome3=month10*poutcome3;
i_month10_poutcome4=month10*poutcome4;

i_month11_poutcome2=month11*poutcome2;
i_month11_poutcome3=month11*poutcome3;
i_month11_poutcome4=month11*poutcome4;

i_month12_poutcome2=month12*poutcome2;
i_month12_poutcome3=month12*poutcome3;
i_month12_poutcome4=month12*poutcome4;
run;



/*faire la prévision
code de prévision*/
proc logistic data=multi.Devoir2_Q1_valid ;
model y(ref='0') = duration month3 poutcome4 c_duration i_age_month9 i_housing1_month4 i_housing1_month5 i_day_month2 i_day_month10 
i_pdays_month8 i_previous_month9 i_contact3_month4 i_contact3_month5 i_contact3_month6 i_month5_poutcome4
/ clparm=pl clodds=pl expb;
score data=multi.Devoir2_Q1_score out=multi.Elias_Ouafi;
run; 

data multi.Elias_Ouafi;
	set multi.Elias_Ouafi;
	ypred=0;
	label ypred="Prevision de Y";
run;

data multi.Elias_Ouafi;
  set multi.Elias_Ouafi;
  if P_1>0.340 then ypred=1;
  else ypred=0;
  keep id ypred;
run;

proc means data=multi.Elias_Ouafi sum;
  var ypred;
run;




/*---------------------------------------------------------
Question 2
Préparer les données
créer la varibale ID*/
data multi.Devoir2_q2; 
set multi.Devoir2_q2;
id=_N_;
cluster_vrai=0;
run;

proc means data=multi.Devoir2_q2;
 var ressext culture nightlife actext;
run;

/*observer les résultats préliminaires
analyse composante principales*/
proc princomp data=multi.Devoir2_q2 out=compprincipale cov;
var ressext culture nightlife actext;
run;

proc sgplot data=compprincipale;
scatter x=prin1 y=prin2 ;
run;

/*--------------------------------------------------------
Méthode hierarchique*/
ods rtf;
proc cluster data=multi.Devoir2_q2 method=ward outtree=D2_Q2_tree nonorm rsquare ccc ;
var ressext culture nightlife actext;
copy id cluster_vrai ressext culture nightlife actext;
ods output D2_Q2.cluster.ClusterHistory=criteres;
run;
proc tree data=D2_Q2_tree out=D2_Q2_cluster nclusters=3;
id id;
copy id cluster_vrai ressext culture nightlife actext;
run;
proc sort data=D2_Q2_cluster out=D2_Q2_cluster;
by cluster;
run;
ods rtf close;

/* Graphiques des critères à partir du fichier crée avec le "ods output" précédent 
Le R carré: Mesure à quelle point les groupes sont homogènes, on veut choisir un petit nombre de groupes avec un R2 carré élevé*/
proc sgplot data=criteres;
series x=NumberOfClusters y=RSquared/markers markerattrs=(symbol=CircleFilled color=red);
run;

/* Le R carré semi partiel: la perte d'homogénièté résultant de chaque nouveau regroupement*/
proc sgplot data=criteres;
series x=NumberOfClusters y=SemipartialRSq/markers markerattrs=(symbol=CircleFilled color=red);
run;

/* CCC: Plus sa valeur est élevée, mieux c'est! Régle générale, on choisit le premier maximum local dans le voisinage pour un nombre de groupe faible*/
proc sgplot data=criteres;
series x=NumberOfClusters y=CubicClusCrit/markers markerattrs=(symbol=CircleFilled color=red);
run;

/*faire les zoom pour les graphiques*/
proc sgplot data=criteres(where=(NumberOfClusters LE 30));
series x=NumberOfClusters y=RSquared/markers markerattrs=(symbol=CircleFilled color=red);
run;

proc sgplot data=criteres(where=(NumberOfClusters LE 30));
series x=NumberOfClusters y=SemipartialRSq/markers markerattrs=(symbol=CircleFilled color=red);
run;

proc sgplot data=criteres(where=(NumberOfClusters LE 30));
series x=NumberOfClusters y=CubicClusCrit/markers markerattrs=(symbol=CircleFilled color=red);
run;

/*observer les données de hierarchique*/
proc means data=D2_Q2_cluster;
by cluster;
var ressext culture nightlife actext;
output out=initial mean=ressext culture nightlife actext age sexe;
run;
proc print data=initial;run;





/*Méthode non-hierarchique*/
proc fastclus data=multi.Devoir2_q2 seed=multi.Devoir2_q2 distance maxclusters=3 out=D2_Q2_nonhierarchique maxiter=30;
var ressext culture nightlife actext;
run;

/*orga les odnnées obtenues*/
proc sort data=D2_Q2_nonhierarchique out=D2_Q2_nonhierarchique;
by cluster;
run;
proc means data=D2_Q2_nonhierarchique;
var ressext culture nightlife actext age sexe;
by cluster;
run;


/*Statistiques descriptives sur les variables ayant servies à former les groupes*/
proc means data=D2_Q2_nonhierarchique;
 class cluster;
 var ressext culture nightlife actext age sexe;
run;
