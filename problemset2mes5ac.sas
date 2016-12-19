


filename expt 'C:\LocalData\PS2Prob1.txt';
filename vote 'C:\LocalData\PS2Prob3.csv';
filename bank 'C:\LocalData\PS2Prob4.txt';
filename stocks 'C:\LocalData\PS2Prob6.txt';
filename prob7a 'C:\LocalData\PS2Prob7A.csv';
filename prob7b 'C:\LocalData\PS2Prob7B.txt';
filename prob7c 'C:\LocalData\PS2Prob7C.txt';

Title Problem_1A;

data expt;
infile expt;
keep ID Gender Pre5 Time;
length ID $7 Gender $1 Pre5 $1;
input ID $ Gender $ Weight Age Pulse Pre1 $ Pre2 $ Pre3 $ Pre4 $ Pre5$
      Expt $ Time Post1 $ Post2 $ Post3 $ Post4 $ Post5 $;
if Pre5 = 1 then delete;
if Pre5 = 2 then delete;
if Pre5 = 3 then delete;
if _n_ > 234 then delete;
run;

proc print data= expt;
run;

Title Problem1_B;

data expt;
length ID $7 Gender $1 Pre1 $1 Pre2 $1 Pre3 $1 Pre4 $1 Pre5 $1 Expt $1
       Post1 $1 Post2 $1 Post3 $1 Post4 $1 Post5 $1;
infile expt;
input ID $ Gender $ Weight Age Pulse Pre1 $ Pre2 $ Pre3 $ Pre4 $ Pre5$
      Expt $ Time Post1 $ Post2 $ Post3 $ Post4 $ Post5 $;
run;

proc print data=expt(keep= ID Gender Pre5 Time obs =100);
where Pre5 > '3';
run;

Title Problem_2;

data preds;
input x1 x2;
y = (96.0240) - (1.8245*x1) + (0.5652*x2) + (0.0247*x1*x2) + (0.0140*(x1**2)) - (0.0118*(x2**2));
datalines;
5 10
5 30
5 50
20 10
20 30
20 50
40 10
40 30
40 50
;
run;


proc print;
run;


Title Problem_3;

data vote;
infile vote DSD;
input state $ party $ age;
run;

proc print;
run;

Title Problem_4A;

data bank;
infile bank;
input name $ 1-15
      acct $ 16-20
	  balance 21-26
	  rate 27-30;
interest = balance*(rate/100);
run;

proc print;
run;

Title Problem_4B;

data bank;
infile bank;
input @1 name $15.
      @16 acct $5.
	  @21 balance dollar6.0
	  @27 rate 4.2;
interest = balance*rate/100;
run;

proc print;
run;

Title Problem5 ;

data expt2;
infile expt;
input ID $ 1-7
      Gender $ 9
	  Pre5 $ 29
	  Time 33-36;
if Pre5 = 1 then delete;
if Pre5 = 2 then delete;
if Pre5 = 3 then delete;
if _n_ < 235 then output;
run;

proc print;
run;

Title Problem_6;

data stocks;
infile stocks;
input @1 stock $4.
      @5 purdate mmddyy10.
	  @15 purprice dollar6.1
	  @21 number 4.0
	  @25 selldate mmddyy10.
	  @35 sellprice dollar6.1;
totalpur = number*purprice;
totalsell= number*sellprice;
profit= totalsell - totalpur;
run;

proc print;
run;

Title Problem 7_A;

data emplA;
infile prob7a DSD;
input ID: $3. name: $14. dept: $8. datehire: mmddyy10. salary& dollar8.;
run;

proc print;
run;

Title Problem 7_B;

data emplB;
infile prob7b DLM = '$' DSD;
input ID: $3. name: $14. dept: $8. datehire: mmddyy10. salary& dollar8.;
run;

proc print;
run;



Title Problem7_c;

data emplC;
infile prob7c DLM = '*' DSD;
input ID : $3. name: $14. dept: $8. datehire: mmddyy10. salary: dollar8.;
run;

proc print;
run;


