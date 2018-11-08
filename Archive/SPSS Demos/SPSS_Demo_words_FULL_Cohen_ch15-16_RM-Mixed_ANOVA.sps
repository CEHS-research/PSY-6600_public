* Encoding: windows-1252.

* Read the data in.

DATA LIST LIST
    /ID depression word_type words_recalled.
BEGIN DATA
1	0	1	20
2	0	1	16
3	0	1	8
4	1	1	17
5	1	1	15
6	1	1	10
1	0	2	21
2	0	2	18
3	0	2	7
4	1	2	15
5	1	2	10
6	1	2	4
1	0	3	17
2	0	3	11
3	0	3	4
4	1	3	18
5	1	3	13
6	1	3	10
END DATA.

DATASET NAME DataSet1 WINDOW=FRONT.

FORMATS ID depression word_type words_recalled(F2).
VALUE LABELS 
depression
  0 "not depressed"
  1 "depressed"/
word_type
   1 "neutral"
   2 "positive"
   3 "negative".



** One-way independent ANOVA.

EXAMINE VARIABLES=words_recalled BY word_type
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.

ONEWAY words_recalled BY word_type
  /STATISTICS DESCRIPTIVES HOMOGENEITY 
  /MISSING ANALYSIS.

UNIANOVA words_recalled BY word_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(word_type)
  /EMMEANS=TABLES(word_type) COMPARE ADJ(LSD)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=word_type.


** two-way independent ANOVA.

EXAMINE VARIABLES=words_recalled BY word_type
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL
  /PANEL ROWVAR=depression ROWOP=CROSS.

UNIANOVA words_recalled BY depression word_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(word_type*depression)
  /EMMEANS=TABLES(depression) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(word_type) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(depression*word_type) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=depression word_type depression*word_type.

UNIANOVA words_recalled BY ID word_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(word_type*ID)
  /EMMEANS=TABLES(ID) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(word_type) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(ID*word_type) 
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=ID word_type ID*word_type.





GRAPH /SCATTERPLOT(BIVAR)=word_type WITH words_recalled BY ID.

GRAPH /SCATTERPLOT(BIVAR)=word_type WITH words_recalled BY ID 
      /PANEL ROWVAR=depression .



*** change the form of the dataset.
SORT CASES BY ID depression word_type.
CASESTOVARS
  /ID=ID depression
  /INDEX=word_type
  /GROUPBY=INDEX.

RENAME VARIABLES
(words_recalled.1 = neutral)
(words_recalled.2 = positive)
(words_recalled.3 = negative).


* 1-way repeated measures ANOVA

GLM neutral positive negative
  /WSFACTOR=type 3 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(type)
  /PRINT=DESCRIPTIVE ETASQ OPOWER HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=type.

* mixed design.

GLM neutral positive negative BY depression
  /WSFACTOR=type 3 Polynomial 
  /METHOD=SSTYPE(3)
  /CRITERIA=ALPHA(.05)
  /PLOT=PROFILE(type)
  /PLOT=PROFILE(depression)
  /PLOT=PROFILE(type*depression)
  /PRINT=DESCRIPTIVE ETASQ OPOWER HOMOGENEITY 
  /WSDESIGN=type 
  /DESIGN=depression.


