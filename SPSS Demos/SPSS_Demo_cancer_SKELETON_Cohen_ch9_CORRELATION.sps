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

GET FILE='C:\Users\A00315273\Box Sync\USU Teaching\Psy6600 Quant 1\Datasets\Cancer.sav'.
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
*** CHAPTER 9: 2 CORRELATION
*** ==================================================================================== ***.
*** ==================================================================================== ***.


*** ==================================================================================== ***.
*** Creating SCATTERPLOTS: x-variable "WITH" y-variable.
*** ==================================================================================== ***.

* Scatterplots with 2 variables.




*** ------------------------------------------------------------------------------------ ***.

* Scatterplot MATRIX between more than 2 variables (shows all possible PAIRS).



*** ------------------------------------------------------------------------------------ ***.

* Use "BY" to designate a categorical variable to color the points by.


* aren't the color choices awful!!!!.


* Other than making changes point-&-click, here is a different type of code.
* Its more work and still doesn't look good...sigh!

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES= AGE WEIGHIN STAGE
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
 SOURCE: s=userSource(id("graphdataset"))
 DATA: AGE=col(source(s), name("AGE"))
 DATA: WEIGHIN=col(source(s), name("WEIGHIN"))
 DATA: STAGE=col(source(s), name("STAGE"), unit.category())
 GUIDE: axis(dim(1), label("Age at Baseline"))
 GUIDE: axis(dim(2), label("Weight at Baseline"))
 ELEMENT: point(position(AGE*WEIGHIN), color(STAGE), shape(STAGE))
END GPL.


*** ------------------------------------------------------------------------------------ ***.

* use "SELECT IF" to restrict to only cases in stage 0, 1 or 2.


*** ------------------------------------------------------------------------------------ ***.

* seperate treatment/control into panels (columns).



* seperate stage into panels (rows).



* seperate treatment/control into panels (columns) 
   AND stage into panels (rows).





*** ==================================================================================== ***.
*** Compute (linear) correlation, Pearson's Correlation Coefficient, "r".
*** ==================================================================================== ***.

*** Only 2 variables only.


*** More than two variables = "correlation matrix".

* Default: pair-wise deletion (cells can all have different # valid).




* Option: list-wise deletion (all cells have the same N, given under table). 





*** ------------------------------------------------------------------------------------ ***.

* Use the "with" option to create a smaller matrix (Row variables "WITH" column varialbes).



*** ------------------------------------------------------------------------------------ ***.

* use "SELECT IF" to restrict to only cases in stage 3 & 4.



* use "SELECT IF" to restrict to only cases in stage 0, 1 or 2.



*** ------------------------------------------------------------------------------------ ***.

* use "SPLIT FILE" to calculate on subgroups.







