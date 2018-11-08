* Encoding: windows-1252.

* Read the raw data in as matched pairs.

DATA LIST LIST
    /pair drug placebo.
BEGIN DATA
    1   11   11
    2    1   11
    3    0    5
    4    2    8
    5    0    4
END DATA.

FORMATS pair drug placebo (F2).

VARIABLE LABELS
pair    "Identification of Matched Pair"
drug    "Level of Depression of Drug Group Member"
placebo "Level of Depression of Placebo Group Member".


LIST all.

FREQUENCIES drug placebo
 /STATISTICS MEAN MEDIAN STDDEV
 /FORMAT NOTABLE.

CORRELATIONS drug WITH placebo.

GRAPH /SCATTERPLOT(BIVAR) placebo WITH drug.


T-TEST PAIRS placebo WITH drug (PAIRED).


NUMERIC diff (F2).
COMPUTE diff = placebo - drug.
EXECUTE.

T-TEST TESTVAL 0
 /VARIABLE diff.



*** ---------------------------------------------- ***.

* Read the raw data in as independent groups.

DATA LIST LIST
    /ID pair grp dep.
BEGIN DATA
   1   1  1   11   
   2   1  2   11
   3   2  1    1   
   4   2  2   11
   5   3  1    0    
   6   3  2    5
   7   4  1    2    
   8   4  2    8
   9   5  1    0    
  10   5  2    4
END DATA.

FORMATS ID pair grp dep (F2).

VARIABLE LABELS
ID   "Identification of Individual"
pair "Identification of Matched Pair"
grp  "Group Designation"
dep  "Level of Depression".

VALUE LABELS grp 1 "drug" 2 "placebo".


EXAMINE dep BY grp
  /PLOT BOXPLOT
  /STATISTICS NONE
  /NOTOTAL.



T-TEST GROUPS grp(1 2)
  /VARIABLES dep.



