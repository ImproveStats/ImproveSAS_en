*========================================================================================
*AIM: Genetic parameters to Alpha Lattice Design

*AUTHOR: Alysson Jalles da Silva

*EMAIL: jalles10@gmail.com

*DATE: 03/06/2016

*MODIFICATION: ______.
========================================================================================;

*RECOMENDATIONS: The names of variables must be:
GENOTYPES:      GEN
ENVIRONMENTS:   ENV
REPLICATIONS:   REP
BLOCK:	        BLOCK (incomplete replication)
;

*Simulating an alpha design;
proc plan seed=2016;
 factors ENV=2 ordered REP=5 ordered BLOCK=4 ordered GEN=4 of 20
 cyclic (1 18 15 12) 4;
 output out=ALPHA_DATA;
run; 

*Simulating 2 variables to alpha design;
data ALPHA_DATA; set ALPHA_DATA;
call streaminit(3862); /*SEED=3862*/
VAR1=rand('normal',50, 5); /*MEDIA 50 cm: DEV.PAD: 5*/
VAR2=rand('normal',58,44);
run;

*Performing mixed model analysis to Alpha lattice design;
proc mixed data=ALPHA_DATA;
class ENV REP BLOCK GEN;
model VAR1=ENV; /*<---: Fixed effects*/
random GEN GEN*ENV REP(BLOCK) BLOCK(REP ENV);  /*<---: Random effects*/
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
