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



*** ==================================================================================== ***.
*** ==================================================================================== ***.
*** CHAPTER 1: IMPORT & PREP YOUR DATA.
*** ==================================================================================== ***.
*** ==================================================================================== ***.


*** ------------------------------------------------------------------------------------ ***.
*** open new dataset 
*** ------------------------------------------------------------------------------------ ***.

*** You will need to change your path to match where you stroed the file on your computer.

* This data file is already saved as an SPSS dataset
* We know this because of the ".sav" file extention.

GET FILE='C:\Users\A00315273\Box Sync\USU Teaching\Psy6600 Quant 1\Dataset\Cancer.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.


*** ------------------------------------------------------------------------------------ ***.
*** View the raw data you have opened
*** ------------------------------------------------------------------------------------ ***.

* You can list the entire data file to the output window.
* This is not advised to LIST "all" for a large dataset.

* These two do the same thing.
LIST.
LIST all.

* There is an option to specify how many CASES to list out (in the order your file is in).
LIST /CASES 5.
LIST /CASES 10.




*** ------------------------------------------------------------------------------------ ***.
*** Do some basic prep work
*** ------------------------------------------------------------------------------------ ***.

*** Apply text labels to each variable's name.

* Each varaible name and "text" only need to be seperated by a single space.
* Adding extra spaces and line breaks makes the code easier to read & find errors.
* You do NOT need to use slashes (/) to seperate anything.

VARIABLE LABELS
ID      "Identification number"
TRT     "Treatment Group"
AGE     "Incoming Age"
WEIGHIN "Incoming Weight in pounds"
STAGE   "Stage of Cancer".


*** Apply text to specific values each vairable can take on.

* Denote labels for each value a CATEGORICAL variable can take.
* Also include a missing valude designation for ALL vairables (that could be missing).
* These labels will help make your output (tables, plots, models, etc) be easier to read.

* Order: variable name(s), value number, "label", slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.


VALUE LABELS
TRT
   0 "control" 
   1 "aloe treatment" 
   999 "missing"/
AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6 
   999 "missing".


*** Declare sepcified values to be treated as MISSING, rather than actual valid values.
* Order: variable name(s), (value number, value number, ...), slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.

MISSING VALUES
TRT AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6
   (999).


*** Fill in blank values with the missng value chosen.

* Order: variable name(s), (old# = new#)(old# = new#)(old# = new#)..., slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.

* Note: in SPSS "SYSMIS" is the 'value' when a cell is blank. 

RECODE 
TRT AGE WEIGHIN STAGE 
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6
   (SYSMIS = 999).
EXECUTE.

* See the changes that were made.
LIST all.


*** You can use FORMATS to change the width of each variable

* For numeric/scale vairables, designate size total width & decimal places: (F#.#).

FORMATS 
ID TRT AGE WEIGHIN STAGE
TOTALCIN TOTALCW2 TOTALCW4 TOTALCW6 (F3).

* See the difference in the list?.
LIST all.



*** ------------------------------------------------------------------------------------ ***.
*** Compute some new variables.
*** ------------------------------------------------------------------------------------ ***.

* Optional: create the new variables before filling them in with COMPUTE.
*           if you skip this step, COMPUTE will automatically create the varibles as F8.2.

NUMERIC weight_oz (F6.1) / total_add total_sum (F2).

COMPUTE weight_oz = 16 * weighin.
COMPUTE total_add = TOTALCIN + TOTALCW2 + TOTALCW4 + TOTALCW6.  
COMPUTE total_sum = sum(TOTALCIN, TOTALCW2, TOTALCW4, TOTALCW6).
EXECUTE.

* See the difference in the two ways to calculate the total?.
LIST all.

* An alternative to using the NUMERIC before COMPUTE, is to use FORMATS after COMPUTE.
FORMATS weight_oz (F6.1) / total_add total_sum (F2).



*** ------------------------------------------------------------------------------------ ***.
*** Various ways to employ the LIST command
*** ------------------------------------------------------------------------------------ ***.
** Most basic: just prints everything, all cases, all variables...often too much!.
LIST all.


* Select specific variables to list.
LIST ID TRT total_add.

* Specify cases: just the control group.
TEMPORARY.
SELECT IF TRT = 0.
LIST all.


* Just stage greater than 2.
TEMPORARY.
SELECT IF STAGE > 2.
LIST all.


* Just stage greater than 2 AND younger than 60.
TEMPORARY.
SELECT IF STAGE > 2 and AGE < 60.
LIST all.


* If the total is missing.
TEMPORARY.
SELECT IF missing(total_add).
LIST all.


* If missing ANY of the totals.
TEMPORARY.
SELECT IF missing(TOTALCIN) or missing(TOTALCW2) or missing(TOTALCW4) or missing(TOTALCW6).
LIST all.


* An alternative is to see if the number of missing "NMISS" is more than one.
TEMPORARY.
SELECT IF nmiss(TOTALCIN, TOTALCW2, TOTALCW4, TOTALCW6) > 0.
LIST all.


* You can SORT the cases prior to listing.
SORT CASES by AGE.
TEMPORARY.
LIST all.


* Another option is to SPLIT the file, 
* but be sure to sort first & turn split file off afte
SORT CASES by TRT AGE.
SPLIT FILE by TRT.
LIST all.
SPLIT FILE off.


*** Put it all togehter for a specific query.
SORT CASES by TRT STAGE AGE.
SPLIT FILE by TRT .
TEMPORARY.
SELECT IF STAGE > 1 and WEIGHIN < 180.
LIST all.
SPLIT FILE off.
SORT CASES by ID.

