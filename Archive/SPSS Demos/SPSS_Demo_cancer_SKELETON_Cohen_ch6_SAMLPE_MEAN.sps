* Encoding: windows-1252.
*** ==================================================================================== ***.
***   The data set contains part of the data for a study of oral condition of cancer patients 
***   conducted at the Mid-Michigan Medical Center.  The oral conditions of the patients were 
***   measured and recorded at the initial stage, at the end of the second week, at the end of 
***   the fourth week, and at the end of the sixth week.  The variables age, initial weight 
***   and initial cancer stage of the patients were recorded. 
*** 
***   Patients were divided into two groups at random:  
***      One group received a placebo and the other group received aloe juice treatment.  
***
***    Sample size, n = 25 patients with neck cancer. 
*** ==================================================================================== ***.

*** ------------------------------------------------------------------------------------ ***.
*** open new dataset 
*** ------------------------------------------------------------------------------------ ***.

*** You will need to change your path to match where you stored the file on your computer.

GET FILE='C:\Users\A00315273\Box Sync\USU Teaching\Psy6600 Quant 1\Dataset\Cancer.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.


*** ------------------------------------------------------------------------------------ ***.
*** Do some basic prep work
*** ------------------------------------------------------------------------------------ ***.

VARIABLE LABELS
ID      "Identification number"
TRT     "Treatment Group"
AGE     "Incoming Age"
WEIGHIN "Incoming Weight in pounds"
STAGE   "Stage of Cancer".


VALUE LABELS
TRT
   0 "control" 
   1 "aloe treatment" 
   999 "missing"/
AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6 
   999 "missing".

MISSING VALUES
TRT AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6
   (999).

RECODE 
TRT AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6
   (SYSMIS = 999).
EXECUTE.

FORMATS 
ID TRT AGE WEIGHIN STAGE
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6 (F3).


*** ------------------------------------------------------------------------------------ ***.
*** Compute some new variables.
*** ------------------------------------------------------------------------------------ ***.

NUMERIC total_add total_sum total_avg total_mean (F2).

VARIABLE LABELS
total_add  "TOTAL: ADD using the PLUS symbol"
total_sum  "TOTAL: ADD using the SUM command"
total_avg  "TOTAL: AVG using the PLUS & DIVIDE symbols"
total_mean "TOTAL: AVG using the MEAN command".

COMPUTE total_add = TOTALCIN + TOTALCW2 + TOTALCW4 + TOTALCW6.  
COMPUTE total_sum = sum(TOTALCIN, TOTALCW2, TOTALCW4, TOTALCW6).

COMPUTE total_avg = (TOTALCIN + TOTALCW2 + TOTALCW4 + TOTALCW6) / 4.  
COMPUTE total_mean = mean(TOTALCIN, TOTALCW2, TOTALCW4, TOTALCW6).
EXECUTE.





*** ==================================================================================== ***.
*** ==================================================================================== ***.
*** CHAPTER 6: SINGLE SAMPLE t-TEST
*** ==================================================================================== ***.
*** ==================================================================================== ***.


* The t-test come with a confidence interval (default is 95% CI).




* You can change the confidence level to with the CRITERIA option.




* ----------------------------------------------------------- *
* SPSS seems to have removed the bootstraping option.
* I think it is an add-on utility now which costs MEGA $$$.
* ----------------------------------------------------------- *


* To get a Confidence Interval around the mean, use a TEST VALUE of ZERO.
* Ignore the significance (p-value) as it is nearly always significant.


