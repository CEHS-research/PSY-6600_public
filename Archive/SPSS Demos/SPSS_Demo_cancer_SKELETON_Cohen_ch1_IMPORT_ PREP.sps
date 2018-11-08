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



*** ------------------------------------------------------------------------------------ ***.
*** View the raw data you have opened
*** ------------------------------------------------------------------------------------ ***.

* You can list the entire data file to the output window.
* This is not advised to LIST "all" for a large dataset.

* These two do the same thing.


* There is an option to specify how many CASES to list out (in the order your file is in).





*** ------------------------------------------------------------------------------------ ***.
*** Do some basic prep work
*** ------------------------------------------------------------------------------------ ***.

*** Apply text labels to each variable's name.

* Each varaible name and "text" only need to be seperated by a single space.
* Adding extra spaces and line breaks makes the code easier to read & find errors.
* You do NOT need to use slashes (/) to seperate anything.




*** Apply text to specific values each vairable can take on.

* Denote labels for each value a CATEGORICAL variable can take.
* Also include a missing valude designation for ALL vairables (that could be missing).
* These labels will help make your output (tables, plots, models, etc) be easier to read.

* Order: variable name(s), value number, "label", slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.





*** Declare sepcified values to be treated as MISSING, rather than actual valid values.
* Order: variable name(s), (value number, value number, ...), slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.



*** Fill in blank values with the missng value chosen.

* Order: variable name(s), (old# = new#)(old# = new#)(old# = new#)..., slash (/), ...
* Again, adding extra spaces and line breaks makes the code easier to read & find errors.

* Note: in SPSS "SYSMIS" is the 'value' when a cell is blank. 



* See the changes that were made.



*** You can use FORMATS to change the width of each variable

* For numeric/scale vairables, designate size total width & decimal places: (F#.#).


* See the difference in the list?.




*** ------------------------------------------------------------------------------------ ***.
*** Compute some new variables.
*** ------------------------------------------------------------------------------------ ***.

* Optional: create the new variables before filling them in with COMPUTE.
*           if you skip this step, COMPUTE will automatically create the varibles as F8.2.



* See the difference in the two ways to calculate the total?.


* An alternative to using the NUMERIC before COMPUTE, is to use FORMATS after COMPUTE.




*** ------------------------------------------------------------------------------------ ***.
*** Various ways to employ the LIST command
*** ------------------------------------------------------------------------------------ ***.
** Most basic: just prints everything, all cases, all variables...often too much!.



* Select specific variables to list.


* Specify cases: just the control group.



* Just stage greater than 2.



* Just stage greater than 2 AND younger than 60.



* If the total is missing.



* If missing ANY of the totals.



* An alternative is to see if the number of missing "NMISS" is more than one.



* You can SORT the cases prior to listing.



* Another option is to SPLIT the file, 
* but be sure to sort first & turn split file off afte
SORT CASES by TRT AGE.



*** Put it all togehter for a specific query.


