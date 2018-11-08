
*** ----------------------------------------------- ***.
*** Handout
*** ----------------------------------------------- ***.
*********************************************.
* PAGE 1.
*********************************************.

DATA LIST LIST
    /ID word recall.
BEGIN DATA
 1   1   20
 2   1   16
 3   1   8
 4   1   17
 5   1   15
 6   1   10
 7   2   21
 8   2   18
 9   2   7
10   2   15
11   2   10
12   2   4
13   3   17
14   3   11
15   3   4
16   3   18
17   3   13
18   3   10
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID word recall (F2).
VALUE LABELS word 1 'neutral' 2 'positive' 3 'negative'.

* descriptives.
MEANS recall by word.

* one-way ANOVA.
ONEWAY recall BY word
 /STATISTICS DESCRIPTIVES.



*********************************************.
* PAGE 2.
*********************************************.

DATA LIST LIST
    /ID word depress recall.
BEGIN DATA
 1   1   1   20
 2   1   1   16
 3   1   1   8
 4   1   0   17
 5   1   0   15
 6   1   0   10
 7   2   1   21
 8   2   1   18
 9   2   1   7
10   2   0   15
11   2   0   10
12   2   0   4
13   3   1   17
14   3   1   11
15   3   1   4
16   3   0   18
17   3   0   13
18   3   0   10
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID word depress recall (F2).
VALUE LABELS 
word 
   1 'neutral' 
   2 'positive' 
   3 'negative'/
depress
   0 'not depressed'
   1 'depressed'.


* descriptives.
MEANS recall by word depress.

SORT CASES by word depress.
SPLIT FILE by word depress.
MEANS recall.
SPLIT FILE off.
SORT CASES by id.


* 2-way ANOVA.
UNIANOVA recall BY depress word
  /PLOT=PROFILE(word*depress)
  /EMMEANS=TABLES(depress*word) 
  /PRINT=DESCRIPTIVE
  /DESIGN depress word depress*word.

