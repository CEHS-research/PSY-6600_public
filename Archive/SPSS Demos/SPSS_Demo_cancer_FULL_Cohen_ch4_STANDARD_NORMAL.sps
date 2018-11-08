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


*** ==================================================================================== ***.
*** ==================================================================================== ***.
*** CHAPTER 4:STANDARD & NORMAL
*** ==================================================================================== ***.
*** ==================================================================================== ***.

* Find the grand mean of age (59.64) and the stadard deviation (12.932).

FREQUENCIES AGE 
   /FORMAT NOTABLE
   /STATISTICS MEAN STDDEV.



*** ------------------------------------------------------------------------------------ ***.
*** LINEAR transformation.
*** ------------------------------------------------------------------------------------ ***.

* Calculate the z-scores by subtracting the M and dividing by the SD.
* Addition, Subtraction, Multiplication, and Division are linear transformations.

NUMERIC         AGE_z (F5.2).
VARIABLE LABELS AGE_z "AGE: Standardized".
COMPUTE         AGE_z = (AGE - 59.64) / 12.932.
EXECUTE.


* What happened to the skewness & kurtosis?

FREQUENCIES AGE AGE_z 
   /FORMAT NOTABLE
   /STATISTICS MINIMUM MAXIMUM MEAN MEDIAN 
               STDDEV RANGE SKEWNESS KURTOSIS
  /HISTOGRAM NORMAL.



*** ------------------------------------------------------------------------------------ ***.
*** NON-LINEAR transformations.
*** ------------------------------------------------------------------------------------ ***.

* Try two non-linear transformations, like log and square root.

NUMERIC AGE_log AGE_sqrt (F5.2).

VARIABLE LABELS 
AGE_log  "AGE: Log transformed"
AGE_sqrt "AGE: Square Root transformed".

COMPUTE AGE_log  = LN(AGE).
COMPUTE AGE_sqrt = SQRT(AGE).
EXECUTE.


* What happened to the skewness & kurtosis?

FREQUENCIES AGE AGE_z AGE_log AGE_sqrt
   /FORMAT NOTABLE
   /STATISTICS MINIMUM MAXIMUM MEAN MEDIAN 
               STDDEV RANGE SKEWNESS KURTOSIS
  /HISTOGRAM NORMAL.





