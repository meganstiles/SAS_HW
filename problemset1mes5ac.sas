*Problem 1;

Data Prob1Data;
Infile 'C:\LocalData\PS1Prob1.txt';
Input obj $ hgt wid;
Run;

Title1 'Problem Set 1';
Title2 'Problem 1';
Options nonumber;

Proc print;
var obj wid hgt;
Run;

Title
*Problem 5;

Data expt;
Infile 'C:\LocalData\PS1Prob5.txt';
Input sample $ temp_degF press_psi;
temp_degC = (5/9)*(temp_degF -32);
press_pa = press_psi*6894.575;
quadT2 = temp_degC**2;
quadP2 = press_Pa**2;
quadTP = temp_degC*press_Pa;
run;


Title
*Problem 7;

Data PS1Prob7;
Infile 'C:\LocalData\PS1Prob7.txt';
Input class $ x1 y1 y2;
run;

proc means mean median;
var x1 y1 y2;
run;

proc freq;
tables class / nocum;
run;

proc univariate;
var x1;
qqplot x1;
run;

proc corr noprob;
var x1 y1;
run;
