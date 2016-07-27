*========================================================================================
*AIM: Genetic parameters to Alpha Lattice Design

*AUTHOR: Alysson Jalles da Silva

*EMAIL: jalles10@gmail.com

*DATE: 03/06/2016

*MODIFICATION: 27-07-2016 - Added genetic parameter calculation for a single assay.
========================================================================================;

*RECOMENDATIONS: The names of variables must be:
GENOTYPES:      GEN
ENVIRONMENTS:   ENV
REPLICATIONS:   REP
BLOCK:	        BLOCK (incomplete replication)
;

/*Simulating an alpha design;
proc plan seed=2016;
 factors ENV=2 ordered REP=5 ordered BLOCK=4 ordered GEN=4 of 20
 cyclic (1 18 15 12) 4;
 output out=ALPHA_DATA;
run; 

*Simulating 2 variables to alpha design;
data ALPHA_DATA; set ALPHA_DATA;
call streaminit(3862); *SEED=3862;
VAR1=rand('normal',50, 5); *MEDIA 50 cm: DEV.PAD: 5;
VAR2=rand('normal',58,44);
run;
proc print noobs; run;*/

data ALPHA_DATA;
input 
ENV REP BLOCK GEN VAR1 VAR2;
cards;
1 1 1 1 49.9567 15.167 
1 1 1 18 51.5764 93.693 
1 1 1 15 53.6707 29.911 
1 1 1 12 45.5961 25.604 
1 1 2 5 43.7608 75.847 
1 1 2 2 46.1128 24.957 
1 1 2 19 59.2999 96.233 
1 1 2 16 50.5998 7.982 
1 1 3 9 54.0290 24.113 
1 1 3 6 46.4260 69.920 
1 1 3 3 50.4648 70.443 
1 1 3 20 58.1360 74.505 
1 1 4 13 59.0145 4.813 
1 1 4 10 59.1921 -3.876 
1 1 4 7 48.9082 -5.805 
1 1 4 4 44.4198 64.714 
1 2 1 17 49.0856 91.932 
1 2 1 14 53.9780 60.574 
1 2 1 11 57.0769 76.768 
1 2 1 8 49.4799 100.449 
1 2 2 1 52.4914 91.129 
1 2 2 18 46.9246 111.054 
1 2 2 15 60.7953 123.622 
1 2 2 12 48.6107 93.783 
1 2 3 5 48.3192 106.802 
1 2 3 2 46.7171 4.433 
1 2 3 19 48.4480 81.025 
1 2 3 16 56.0690 92.217 
1 2 4 9 50.3647 99.083 
1 2 4 6 49.5602 104.350 
1 2 4 3 42.1737 123.655 
1 2 4 20 57.0927 80.105 
1 3 1 13 58.4072 183.911 
1 3 1 10 41.0447 67.440 
1 3 1 7 59.0220 16.497 
1 3 1 4 41.0781 119.622 
1 3 2 17 42.9046 46.941 
1 3 2 14 56.2703 110.673 
1 3 2 11 44.4955 -29.679 
1 3 2 8 48.7395 26.637 
1 3 3 1 41.4561 27.393 
1 3 3 18 42.6503 109.074 
1 3 3 15 51.8039 119.623 
1 3 3 12 56.5891 8.044 
1 3 4 5 49.4285 122.340 
1 3 4 2 57.6731 119.108 
1 3 4 19 49.2479 30.605 
1 3 4 16 47.7989 113.061 
1 4 1 9 56.8262 52.376 
1 4 1 6 46.8156 17.781 
1 4 1 3 53.8613 -6.842 
1 4 1 20 50.6302 11.517 
1 4 2 13 58.6614 69.583 
1 4 2 10 44.5341 56.641 
1 4 2 7 55.9139 -25.986 
1 4 2 4 47.6116 83.656 
1 4 3 17 49.8947 -11.658 
1 4 3 14 46.2717 72.443 
1 4 3 11 50.8406 -11.116 
1 4 3 8 53.3836 -0.195 
1 4 4 1 45.3002 55.320 
1 4 4 18 56.3602 90.062 
1 4 4 15 46.0271 19.580 
1 4 4 12 42.8250 94.155 
1 5 1 5 51.7138 99.906 
1 5 1 2 54.7779 90.302 
1 5 1 19 50.5663 53.760 
1 5 1 16 54.0428 34.844 
1 5 2 9 46.4162 -5.734 
1 5 2 6 53.0937 35.507 
1 5 2 3 50.0630 34.712 
1 5 2 20 51.1169 21.451 
1 5 3 13 56.7114 80.206 
1 5 3 10 42.7085 54.600 
1 5 3 7 49.8049 38.028 
1 5 3 4 43.4142 93.917 
1 5 4 17 47.0455 98.884 
1 5 4 14 49.6183 -2.733 
1 5 4 11 52.2694 40.438 
1 5 4 8 45.1424 78.335 
2 1 1 1 39.5351 32.556 
2 1 1 18 42.9426 81.224 
2 1 1 15 40.9275 71.889 
2 1 1 12 46.8658 78.548 
2 1 2 5 45.9133 36.146 
2 1 2 2 53.5805 28.980 
2 1 2 19 46.5641 18.904 
2 1 2 16 52.6816 94.223 
2 1 3 9 43.2145 -19.942 
2 1 3 6 54.7846 161.669 
2 1 3 3 51.1344 45.772 
2 1 3 20 47.4225 98.568 
2 1 4 13 49.6879 147.208 
2 1 4 10 50.1491 167.872 
2 1 4 7 51.9590 58.798 
2 1 4 4 45.9578 75.164 
2 2 1 17 53.5112 60.465 
2 2 1 14 49.4959 26.168 
2 2 1 11 44.7456 58.661 
2 2 1 8 48.3739 120.429 
2 2 2 1 46.1614 128.693 
2 2 2 18 45.9102 55.917 
2 2 2 15 45.4041 104.346 
2 2 2 12 52.3788 95.571 
2 2 3 5 51.8998 45.387 
2 2 3 2 54.4610 98.541 
2 2 3 19 48.8830 57.293 
2 2 3 16 52.9231 109.063 
2 2 4 9 54.1801 91.608 
2 2 4 6 45.3706 43.518 
2 2 4 3 39.8822 128.236 
2 2 4 20 56.3534 15.350 
2 3 1 13 51.5342 48.371 
2 3 1 10 56.8858 87.314 
2 3 1 7 49.0371 95.579 
2 3 1 4 44.1559 106.244 
2 3 2 17 39.9799 82.743 
2 3 2 14 48.9047 80.961 
2 3 2 11 52.8650 33.425 
2 3 2 8 47.2478 49.535 
2 3 3 1 51.2770 86.385 
2 3 3 18 55.2853 33.269 
2 3 3 15 50.8977 116.823 
2 3 3 12 44.4180 38.414 
2 3 4 5 50.7685 73.012 
2 3 4 2 58.4371 84.575 
2 3 4 19 52.3210 60.708 
2 3 4 16 46.1736 -8.790 
2 4 1 9 54.2012 -21.187 
2 4 1 6 52.2710 28.416 
2 4 1 3 52.0502 83.479 
2 4 1 20 44.1101 117.168 
2 4 2 13 45.2289 86.298 
2 4 2 10 50.4612 69.394 
2 4 2 7 43.0891 66.745 
2 4 2 4 54.5402 69.222 
2 4 3 17 45.4706 69.493 
2 4 3 14 46.4973 88.236 
2 4 3 11 50.0504 35.856 
2 4 3 8 50.6517 18.294 
2 4 4 1 53.3729 133.308 
2 4 4 18 58.2980 51.224 
2 4 4 15 48.0942 -18.685 
2 4 4 12 51.9450 51.741 
2 5 1 5 53.7594 158.724 
2 5 1 2 51.0821 89.471 
2 5 1 19 40.8230 94.731 
2 5 1 16 50.2450 0.412 
2 5 2 9 47.2978 81.971 
2 5 2 6 51.7207 53.735 
2 5 2 3 49.2286 78.317 
2 5 2 20 56.3254 47.347 
2 5 3 13 49.4854 20.769 
2 5 3 10 61.2646 58.771 
2 5 3 7 50.8052 -39.330 
2 5 3 4 38.9883 16.211 
2 5 4 17 52.6202 50.959 
2 5 4 14 56.4869 51.206 
2 5 4 11 63.3090 157.083 
2 5 4 8 52.2457 41.532 
;

/*###############################################################*/
/*########GENETIC PARAMETER FOR ALL ENVIRONMENT ################*/
/*###############################################################*/

*Performing mixed model analysis to Alpha lattice design;
*Predicting BLUPS (Estimates);
proc mixed data=ALPHA_DATA;
class ENV REP BLOCK GEN;
model VAR1=ENV; /*<---: Fixed effects*/
random GEN GEN*ENV REP(BLOCK) BLOCK(REP ENV)/solution; /*<---: Random effects*/
estimate "Overall mean of variable" intercept 1 | GEN 0;
run; 

	*Values from proc mixed output;
%let var=VAR1;  *Variable name;
%let Vg=0.5334; *Genetic variance;
%let Ve=24.1819;*Residual variance;
%let Vi=1.1852; *gen*env variance;
%let x=50.0668; *Experimental Overall mean of variable;
	*Values from experiment;
%let num_rep=5; *number of replications;
%let num_env=2; *number of env;
	*Value to final table;
%let DECIMAL_PLACE=6; *Decimal place in table of genetic parameter;

data GENETIC_PARAMETER; 
do OBS=1 to 14; *14 genetic parameters;
output; end;
run;

data GENETIC_PARAMETER; set GENETIC_PARAMETER; 
if OBS=1 then do;GP='Vp               '; &var=&Vg+&Vi+&Ve; end;
%let Vp=%sysevalf(&Vg+&Vi+&Ve); 
if OBS=2 then do;GP='Vg'; &var=&Vg; end;
if OBS=3 then do;GP='Vi';&var=&Vi;end;
if OBS=4 then do;GP='c2int';&var=&Vi/&Vp;end;
if OBS=5 then do;GP='Ve';&var=&Ve;end;
if OBS=6 then do;GP='h2mg (%)';&var=(&Vg)/(&Vg+(&Vi/&NUM_ENV)+(&Ve/(&NUM_REP*&NUM_ENV)))*100;end;
	%let h2mg=%sysevalf((&Vg)/(&Vg+(&Vi/&NUM_ENV)+(&Ve/(&NUM_REP*&NUM_ENV)))*100); 
if OBS=7 then do;GP='Acgen (%)';&var=sqrt(&h2mg)*10;end;
	%let Acgen=%sysevalf(((&h2mg)*10)**0.5); 
if OBS=8 then do;GP='Cvg';&var=(100*(sqrt(&Vg))/&x);end;
	%let Cvg=%sysevalf(100*((&Vg)**0.5)/&x); 
if OBS=9 then do;GP='Cve';&var=(100*(sqrt(&Ve))/&x);end;
	%let Cve=%sysevalf(100*((&Ve)**0.5)/&x); 
if OBS=10 then do;GP='CVg/CVe';&var=&Cvg/&Cve;end;
if OBS=11 then do;GP='rgenv';&var=&Ve/(&Vg+&Vi);end;
if OBS=12 then do;GP='PEV';&var=(1-((&Acgen/100)**2))*(&Vg);end;
	%let PEV=%sysevalf(1-((&Acgen/100)**2))*(&Vg); 
if OBS=13 then do;GP='SEP';&var=sqrt(&PEV);end;
if OBS=14 then do;GP='Overall mean';&var=&X;end;
label GP='Genetic Parameter';
drop OBS;
Proc print noobs label;
format &var 32.&DECIMAL_PLACE;
footnote1 color=red "W-H-E-R-E";
footnote2 color=darkblue
"Vp=Vg+Vi+Ve: Phenotypic variance;
Vg: Genotypic variance;
Vi: Variance of interaction GEN X ENV;
c2int= Vi/Vp: Interaction coefficent determination GEN X ENV;
Ve: Residual variance;
h2mg=(Vg/(Vg+Vi/num.env+Ve/(num.env*num.rep): Heritability in a broad sense;
AcGen=sqrt(h2mg): Accuracy in selecting of genotypes;
CVg=sqrt(Vg/average: Genetic coefficient of variation;
CVe= sqrt(Ve))/average: Environmental coefficient of variation;
CVg/Cve=CVg/Cve: Relative coefficient of variation;
rgenv=Vg/(Vg+Vi): Genotypic correlation between the performance of genotypes in various environments;
PEV=(1-AcGen^2)*Vg: prediction error variance of BLUPS;
SEP= sqrt(PEV): Average standard error of prediction error variance of GEN";
run;title; footnote;


/*####################################################################*/
/*########GENETIC PARAMETER FOR A SINGLE ENVIRONMENT #################*/
/*############################################################@#######*/
*Performing mixed model analysis to Alpha lattice design;
*Predicting BLUPS (Estimates);
proc mixed data=ALPHA_DATA;
	where ENV=1;         *<------Analysis for the Environment "1";
class  REP BLOCK GEN;
model  VAR1=; /*<---: Fixed effects=None!*/
random GEN REP BLOCK(REP)/solution; /*<---: Random effects*/
estimate "Overall mean of variable" intercept 1 | GEN 0;
run; 

	*Values from proc mixed output;
%let var=VAR1;  *Variable name;
%let Vg=4.2125; *Genetic variance;
%let Ve=22.7059;*Residual variance;
%let x=50.3903; *Experimental Overall mean of variable;
	*Values from experiment;
%let num_rep=5; *number of replications;
	*Value to final table;
%let DECIMAL_PLACE=6; *Decimal place in table of genetic parameter;

data GENETIC_PARAMETER; 
do OBS=1 to 11; *11 genetic parameters;
output; end;
run;

data GENETIC_PARAMETER; set GENETIC_PARAMETER; 
if OBS=1 then do;GP='Vp               '; &var=&Vg+&Ve; end;
%let Vp=%sysevalf(&Vg+&Ve); 
if OBS=2 then do;GP='Vg'; &var=&Vg; end;
if OBS=3 then do;GP='Ve';&var=&Ve;end;
if OBS=4 then do;GP='h2mg (%)';&var=(&Vg)/(&Vg+(&Ve/(&NUM_REP)))*100;end;
	%let h2mg=%sysevalf((&Vg)/(&Vg+(&Ve/(&NUM_REP)))*100); 
if OBS=5 then do;GP='Acgen (%)';&var=sqrt(&h2mg)*10;end;
	%let Acgen=%sysevalf(((&h2mg)*10)**0.5); 
if OBS=6 then do;GP='Cvg';&var=(100*(sqrt(&Vg))/&x);end;
	%let Cvg=%sysevalf(100*((&Vg)**0.5)/&x); 
if OBS=7 then do;GP='Cve';&var=(100*(sqrt(&Ve))/&x);end;
	%let Cve=%sysevalf(100*((&Ve)**0.5)/&x); 
if OBS=8 then do;GP='CVg/CVe';&var=&Cvg/&Cve;end;
if OBS=9 then do;GP='PEV';&var=(1-((&Acgen/100)**2))*(&Vg);end;
	%let PEV=%sysevalf(1-((&Acgen/100)**2))*(&Vg); 
if OBS=10 then do;GP='SEP';&var=sqrt(&PEV);end;
if OBS=11 then do;GP='Overall mean';&var=&X;end;
label GP='Genetic Parameter';
drop OBS;run;
Proc print noobs label;
format &var 32.&DECIMAL_PLACE;
footnote1 color=red "W-H-E-R-E";
footnote2 color=darkblue
"Vp=Vg+Vi+Ve: Phenotypic variance;
Vg: Genotypic variance;
Ve: Residual variance;
h2mg=(Vg/(Vg+Vi/num.env+Ve/(num.env*num.rep): Heritability in a broad sense;
AcGen=sqrt(h2mg): Accuracy in selecting of genotypes;
CVg=sqrt(Vg/average: Genetic coefficient of variation;
CVe= sqrt(Ve))/average: Environmental coefficient of variation;
CVg/Cve=CVg/Cve: Relative coefficient of variation;
PEV=(1-AcGen^2)*Vg: prediction error variance of BLUPS;
SEP= sqrt(PEV): Average standard error of prediction error variance of GEN";
run;title; footnote;
