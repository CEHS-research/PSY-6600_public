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






*** ==================================================================================== ***.
*** ==================================================================================== ***.
*** CHAPTER 10: SIMPLE LINEAR REGRESSION
*** ==================================================================================== ***.
*** ==================================================================================== ***.


* simplest syntax: must tell SPSS what is Y and what is X
   (leave everything we can to default settings).




* include asking for the 95% CI for the slope.




* you can also ask to include descriptives on X & Y (including correlations).



* you can ask for residual plots to test the assumptions, too.





* most of the optional commands used here (from point-click).




* you can SAVE variables, too.
*   ...optional: specify the name of the new variable in parenthese.

* Come in handy:.
* PRED.     Unstandardized predicted values.
* RESID.    Unstandardized residuals.
* MCIN.     Lower (LMCIN) and upper (UMCIN) bounds for the prediction interval of the MEAN predicted response. 
* ICIN.     Lower and upper bounds for the prediction interval for a SINGLE observation
*              The default confidence interval is 95%, can be reset with the CIN subcommand of CRITERIA. 






*** NOTE: Here is a list of other values that may be saved...but I never have used them.

* DRESID.   Deleted residuals.
* ADJPRED.  Adjusted predicted values.
* ZPRED.    Standardized predicted values.
* ZRESID.   Standardized residuals.
* SRESID.   Studentized residuals.
* SDRESID.  Studentized deleted residuals. 
* SEPRED.   Standard errors of the predicted values.
* MAHAL.    Mahalanobis distances.
* COOK.     Cook’s distances. 
* LEVER.    Centered leverage values. 
* DFBETA.   Change in the regression coefficient that results from the deletion of the ith case.  
* SDBETA.   Standardized DFBETA. 
* DFFIT.    Change in the predicted value when the ith case is deleted. 
* SDFIT.    Standardized DFFIT. 
* COVRATIO. Ratio of the determinant of the covariance matrix.

