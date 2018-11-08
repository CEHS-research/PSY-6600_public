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

NUMERIC weight_oz (F6.1) / total_add total_sum (F2).

COMPUTE weight_oz = 16 * weighin.
COMPUTE total_add = TOTALCIN + TOTALCW2 + TOTALCW4 + TOTALCW6.  
COMPUTE total_sum = sum(TOTALCIN, TOTALCW2, TOTALCW4, TOTALCW6).
EXECUTE.



*** ==================================================================================== ***.
*** ==================================================================================== ***.
*** CHAPTER 2: VISUALIZE YOUR DATA
*** ==================================================================================== ***.
*** ==================================================================================== ***.


*** ------------------------------------------------------------------------------------ ***.
*** Creating FREQUENCY disribution tables.
*** ------------------------------------------------------------------------------------ ***.

* One variable, this one is continuous.
FREQUENCIES TRT.

* or you can do several variables at one, they each get their own table.
FREQUENCIES AGE STAGE total_add.


* you include a split file to make two tables, by anothe rvariable.
SORT CASES by TRT.
SPLIT FILE by TRT.
FREQUENCIES STAGE.
SPLIT FILE off.
SORT CASES by ID.


* Here is a nice way to do a simple crosstabulation of two categorical variables.
CROSSTABS STAGE BY TRT.


*** ------------------------------------------------------------------------------------ ***.
*** Use the FREQUENCIES command to make BAR CHART's.
*** ------------------------------------------------------------------------------------ ***.

* You can just add the HISTOGRAM option after a slash..
FREQUENCIES TRT /BARCHART.

* or you can include the option to not bother with the table.
FREQUENCIES TRT STAGE 
  /BARCHART  
  /FORMAT notable.

* wrapping in the sort/split produces two seperate histograms.
SORT CASES by TRT.
SPLIT FILE by TRT.
FREQUENCIES STAGE /BARCHART /FORMAT NOTABLE.
SPLIT FILE off.
SORT CASES by ID.


*** ------------------------------------------------------------------------------------ ***.
*** Use the FREQUENCIES command to make HISTOGRAM's.
*** ------------------------------------------------------------------------------------ ***.

* You can just add the HISTOGRAM option after a slash.
FREQUENCIES AGE /HISTOGRAM.

* or you can include the option to not bother with the table.
FREQUENCIES total_add /HISTOGRAM /FORMAT NOTABLE.

* wrapping in the sort/split produces two seperate histograms
* not that they have different ranges on the x & y axis.
* This makes them hard to compare to each other.
SORT CASES by TRT.
SPLIT FILE by TRT.
FREQUENCIES total_add /HISTOGRAM /FORMAT NOTABLE.
SPLIT FILE off.
SORT CASES by ID.


*** ------------------------------------------------------------------------------------ ***.
*** You can also use the EXAMINE command to make HISTOGRAM's.
*** ------------------------------------------------------------------------------------ ***.

* a simple histogram that includes a descriptive table by default.
EXAMINE AGE /PLOT HISTOGRAM.

* You can include an option to not bother with the table.
EXAMINE AGE
  /PLOT HISTOGRAM
  /STATISTICS NONE.

* This produces a histogram of age seperately for each level of TRT.
* Like using sort/split/freq, they have different ranges on the x & y axis.
* This makes them hard to compare to each other.
EXAMINE AGE BY TRT
  /PLOT HISTOGRAM
  /COMPARE GROUPS
  /STATISTICS NONE.


* If you are using the COMPARE BY option, you can also include the TOTAL option.
* This gives you results for all subjects first, followed by the groups seperately.
EXAMINE AGE BY TRT
  /PLOT HISTOGRAM
  /COMPARE GROUPS
  /STATISTICS NONE
  /TOTAL.


*** ------------------------------------------------------------------------------------ ***.
*** You can also use the GRAPH command to make HISTOGRAM's.
*** ------------------------------------------------------------------------------------ ***.

* Here is the basic, all default options.
GRAPH /HISTOGRAM AGE.

* a nice option this command has is to employ PANELs.
* notice that the stacked plots have the exact same ranges on the axes so you CAN COMPARE.
GRAPH
  /HISTOGRAM AGE
  /PANEL ROWVAR = TRT.

* you can do them side by side depending on the .
GRAPH
  /HISTOGRAM AGE
  /PANEL COLVAR = TRT.

* You can do both rows & colums to make a grid of plots.
GRAPH
  /HISTOGRAM AGE
  /PANEL ROWVAR = TRT COLVAR = STAGE.


* You can get really fancy:
* Use NUMERIC to create a new variable that collapses the stage into two levels.
* Use LABELS to clearly tell yourself and others what is going ion.
* Use RECODE to convert values of the old variable INTO the new variable.
* You can check the number of subjects in each combinatio with CROSSTAB.
* Then do a grid of histograms with GRAPH.

NUMERIC         stage_2 (F3).
VARIABLE LABELS stage_2 "Stage of Cancer: 2 levels".
VALUE LABELS    stage_2 0 "0 or 1" 1 "2, 3, or 4".

RECODE stage (0, 1 = 0)(2, 3, 4 = 1) INTO stage_2.
EXECUTE.

CROSSTABS TRT BY stage_2.

GRAPH
  /HISTOGRAM AGE
  /PANEL ROWVAR = TRT COLVAR = stage_2.


*** ------------------------------------------------------------------------------------ ***.
*** Use FREQUENCIES to find QUARTILE's, DECILE's, & PERCENTILE's
*** ------------------------------------------------------------------------------------ ***.

* Quartiles split the data into four equal portions.
FREQUENCIES AGE  /NTILES(4).

* or you can include the option to not bother with the table.
FREQUENCIES AGE WEIGHIN total_add total_sum
  /FORMAT NOTABLE 
  /NTILES(10) .


* To get quartiles and deciles, you have to do 2 NTILE option lines.
FREQUENCIES AGE 
  /FORMAT NOTABLE 
  /NTILES(4) 
  /NTILES(10).

* The PERCENTILE option allows you to specify a list...seperated by commas.
FREQUENCIES AGE WEIGHIN  
  /FORMAT NOTABLE 
  /PERCENTILES(5, 50, 95).


*** ------------------------------------------------------------------------------------ ***.
*** Use EXAMINE command to get STEM-LEAF plots
*** ------------------------------------------------------------------------------------ ***.

* a simple histogram that includes a descriptive table by default.
EXAMINE AGE /PLOT STEMLEAF.

* You can include an option to not bother with the table.
EXAMINE AGE WEIGHIN
  /PLOT STEMLEAF
  /STATISTICS NONE.

* This produces a plot of age seperately for each level of TRT.
EXAMINE AGE BY TRT
  /PLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS NONE.

* You can ask for multiple things at once.
EXAMINE AGE BY TRT
  /PLOT HISTOGRAM STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /TOTAL.