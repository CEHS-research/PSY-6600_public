
*** ----------------------------------------------- ***.
*** Handout
*** ----------------------------------------------- ***.
*********************************************.
* PAGE 1.
*********************************************.

DATA LIST LIST
    /ID method score.
BEGIN DATA
 1   1   72
 2   1   83
 3   1   96
 4   1   79
 5   1   83
 6   1   95
 7   1   89
 8   1   98
 9   2   69
10   2   66
11   2   78
12   2   64
13   2   96
14   2   87
15   2   93
16   2   86
17   3   63
18   3   72
19   3   78
20   3   59
21   3   89
22   3   93
23   3   86
24   3   95
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID method score (F2).
VALUE LABELS method 1 'traditional' 2 'video' 3 'computer'.

* descriptives.
MEANS score by method.

* box plotes.
EXAMINE score BY method
  /PLOT BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.

* one-way ANOVA.
ONEWAY score BY method.

UNIANOVA score BY method.



ONEWAY score BY method
  /CONTRAST 1 -1 -1 
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /PLOT MEANS
  /MISSING ANALYSIS
  /POSTHOC LSD BONFERRONI ALPHA(0.05).





*********************************************.
* PAGE 2.
*********************************************.


DATA LIST LIST
    /ID type method score.
BEGIN DATA
 1   1   1   72
 2   1   1   83
 3   1   1   96
 4   1   1   79
 5   2   1   83
 6   2   1   95
 7   2   1   89
 8   2   1   98
 9   1   2   69
10   1   2   66
11   1   2   78
12   1   2   64
13   2   2   96
14   2   2   87
15   2   2   93
16   2   2   86
17   1   3   63
18   1   3   72
19   1   3   78
20   1   3   59
21   2   3   89
22   2   3   93
23   2   3   86
24   2   3   95
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID type method score (F2).
VALUE LABELS 
type 
   1 'Average'
   2 'gifted'/
method 
   1 'traditional' 
   2 'video' 
   3 'computer'.


* descriptives.
MEANS score by type method.

SORT CASES by type method.
SPLIT FILE by type method.
MEANS score.
SPLIT FILE off.
SORT CASES by id.


* box plotes.
EXAMINE VARIABLES=score BY method
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /PANEL ROWVAR=type ROWOP=CROSS.



* 2-way ANOVA.
UNIANOVA score BY type method.


UNIANOVA score BY type method
  /POSTHOC method(LSD) 
  /POSTHOC type
  /PLOT PROFILE(method*type) 
  /EMMEANS TABLES(type)        COMPARE
  /EMMEANS TABLES(method)      COMPARE
  /EMMEANS TABLES(type*method) COMPARE (method) 
  /PRINT OPOWER ETASQ HOMOGENEITY DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN type method type*method.

