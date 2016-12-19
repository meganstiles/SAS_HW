
filename Prob1 'C:\Users\mes5ac\Desktop\Local_Data\PS3Prob1A.txt';
filename Prob2 'C:\Users\mes5ac\Desktop\Local_Data\PS3Prob2.txt';
filename Prob3 'C:\Users\mes5ac\Desktop\Local_Data\PS3Prob3.txt';

Title Problem 1A;

data answers;
infile Prob1; 
input subjID $1-7 gender $9 @11 dob mmddyy10. qA1 $22 qA2 $23 qA3 $24 qA4 $24 @27 qB1 dollar6.2 @34 qB2:dollar6.2 
    @41 qB3 dollar6.2 @48 qC1 1. @49 qC2 1. @50 qC3 1. @51qC4 1. @52qC5 1.;
totb = qB1 + qB2 + qB3;
pctC = (qC1 + qC2 +qC3 + qC4 + qC5)/5;
adultyrs = (18498-dob)/365.25;
run;

proc print data = answers label;
label gender = 'Subject Gender'
      adultyrs = 'Years as Adult'
	  totB = 'Total Balance'
	  pctC = 'Percent Yes';
var gender adultyrs totB pctC;
format adultyrs 8. totB dollar7.2 pctC percent6.;
id subjID;
run;

Title Problem 1 B;

data _null_;
infile Prob1;
file 'C:\Users\mes5ac\Desktop\Local_Data\PS3Prob1Bout.txt';
input subjID $1-7 gender $9 @11 dob mmddyy10. qA1 $22 qA2 $23 qA3 $24 qA4 $24 @27 qB1 dollar6.2 @34 qB2:dollar6.2 
    @41 qB3 dollar6.2 @48 qC1 1. @49 qC2 1. @50 qC3 1. @51qC4 1. @52qC5 1.;
totb = qB1 + qB2 + qB3;
pctC = (qC1 + qC2 +qC3 + qC4 + qC5)/5;
adultyrs = (18498-dob)/365.25;
put @1 subjID $7. @9 gender $1. @ 11 adultyrs 8. @20 totB dollar7.2 @28 pctC percent6.;
run;

Title Problem 1 C;
libname rawdata 'C:\Users\mes5ac\Desktop\Local_Data';

data finaldata;
set rawdata.PS3Prob1C;
file 'C:\Users\mes5ac\Desktop\Local_Data\PS3Prob1Cout.txt';
totb = qB1 + qB2 + qB3;
pctC = (qC1 + qC2 +qC3 + qC4 + qC5)/5;
adultyrs = dob/365.25;
put @1 subjID $7. @9 gender $1. @ 11 adultyrs 8. @20 totB dollar7.2 @28 pctC percent6.;
run;

run;

Title Problem 2;

data prob2;
infile Prob2;
input ID: $3. Gender: $1. DOB: mmddyyyy10. Height: 2.  Weight: 3. ;
run;

proc print;
run;

Title Problem 3;

data prob3;
infile Prob3;
input @1 age 
