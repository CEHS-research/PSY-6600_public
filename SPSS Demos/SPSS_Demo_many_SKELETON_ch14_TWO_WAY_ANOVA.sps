* Encoding: windows-1252.

*** ----------------------------------------------- ***.
*** In class examples from the textbook 
*** ----------------------------------------------- ***.
*********************************************.
* 14-B #2.
*********************************************.

DATA LIST LIST
    /ID sub_imag word_type words_recalled.
BEGIN DATA
 1   1   1   17
 2   1   1   20
 3   1   1   18
 4   1   1   21
 5   1   1   20
 6   1   2   14
 7   1   2   15
 8   1   2   15
 9   1   2   17
10   1   2   18
11   2   1   18
12   2   1   19
13   2   1   17
14   2   1   17
15   2   1   20
16   2   2   18
17   2   2   18
18   2   2   17
19   2   2   17
20   2   2   19
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID sub_imag word_type words_recalled(F2).
VALUE LABELS 
sub_imag 
   1 "visualizers" 
   2 "nonvisualizers"/
word_type
   1 "concrete"
   2 "abstract".



*********************************************.
* 14-B #3.
*********************************************.

DATA LIST LIST
    /ID hand gender score.
BEGIN DATA
 1   1   1   9
 2   1   1   12
 3   1   1   8
 4   1   1   9
 5   1   1   10
 6   1   1   11
 7   1   2   13
 8   1   2   10
 9   1   2   16
10   1   2   19
11   1   2   22
12   1   2   12
13   2   1   14
14   2   1   25
15   2   1   16
16   2   1   17
17   2   1   21
18   2   1   20
19   2   2   10
20   2   2   8
21   2   2   11
22   2   2   13
23   2   2   9
24   2   2   10
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID hand gender score(F2).
VALUE LABELS 
hand 
   1 "left handed" 
   2 "right handed"/
gender
   1 "male"
   2 "female".



*********************************************.
* 14-B #6.
*********************************************.

DATA LIST LIST
    /drug psycho group behave.
BEGIN DATA
1   4   6   1
1   3   5   3
1   2   8   0
1   5   6   2
1   4   8   4
1   5   7   4
1   5   6   2
1   4   6   2
1   2   7   1
1   6   8   2
2   1   3   0
2   1   4   1
2   3   3   3
2   1   4   2
2   2   2   0
2   1   2   0
2   3   5   1
2   4   3   2
2   2   2   1
2   3   5   0
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

* need the data in "TIDY" or "LONG form.
VARSTOCASES
  /MAKE score FROM psycho group behave
  /KEEP drug
  /INDEX=therapy_type.

FORMATS drug therapy_type score(F2).
VALUE LABELS 
drug 
   1 "no, therapy along" 
   2 "yes, therapy plus drug"/
therapy_type
   1 "Psychoanalysis"
   2 "Group Therapy"
   3 "Behavior Modification".




*********************************************.
* 14-B #11.
*********************************************.

DATA LIST LIST
    /weight movie ounces .
BEGIN DATA
1   1   5
1   1   2
1   1   3
1   1   7
1   1   6
2   1   15
2   1   19
2   1   17
2   1   16
1   2   8
1   2   6
1   2   5
1   2   11
1   2   9
2   2   13
2   2   12
2   2   9
2   2   16
2   2   15
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS weight movie ounces (F2).
VALUE LABELS 
weight
   1 "Control" 
   2 "Obese"/
movie
   1 "Comedy"
   2 "Horor".


