*** ENTER THE DATA.

DATA LIST list
/class major score.
BEGIN DATA.
1   1   2
1   1   4
1   1   3
1   1   7
2   1   3
2   1   4
2   1   6
2   1   5
3   1   7
3   1   8
3   1   7
3   1   7
4   1   10
4   1   12
4   1   9
4   1   13
1   2   5
1   2   6
1   2   9
1   2   10
2   2   10
2   2   12
2   2   16
2   2   14
3   2   14
3   2   15
3   2   13
3   2   12
4   2   16
4   2   18
4   2   16
4   2   19
1   3   7
1   3   8
1   3   7
1   3   12
2   3   20
2   3   13
2   3   16
2   3   15
3   3   20
3   3   25
3   3   22
3   3   21
4   3   30
4   3   33
4   3   34
4   3   29
END DATA.

FORMATS class major score (F2).

VALUE LABELS 
class 1 'freshman' 2 'sophomore' 3 'junior' 4 'senior'/
major 1 'humanities' 2 'sciences' 3 'business'.



*** PART A.

UNIANOVA score BY class major
  /DESIGN=class major class*major.

*** PART B: main effects are constant: ordinal effect. 

UNIANOVA score BY class major
  /PLOT=PROFILE(class*major)
  /DESIGN=class major class*major.


*** PART C: 4 groups of 12, df_w=36, MS_w = 4.236 
      --> q_crit = 3.79 (more than 3.85)
      --> HSD = 3.79*sqrt(4.236/12)=2.25.

   * All pairs of classes are difference.

UNIANOVA score BY class major
  /EMMEANS=TABLES(class) COMPARE ADJ(LSD)
  /DESIGN=class major class*major.


*** PART D: 3 possible 2x2 ANOVA's - Freashman vs. senior..
* F_s = df_inter * F_crit(df_inter, df_w) = 1 * F(1,12) = 4.75.

* humanities vs. sciences: F_inter = 1.901.

TEMPORARY.
SELECT IF (class = 1 or class = 4) and (major = 1 or major = 2).
UNIANOVA score BY class major /DESIGN=class major class*major.


* sciences vs. business: F_inter = 36.481.

TEMPORARY.
SELECT IF (class = 1 or class = 4) and (major = 2 or major = 3).
UNIANOVA score BY class major /DESIGN=class major class*major.


* humanities vs. buisness: F_inter = 52.966.

TEMPORARY.
SELECT IF (class = 1 or class = 4) and (major = 1 or major = 3).
UNIANOVA score BY class major /DESIGN=class major class*major.



v
