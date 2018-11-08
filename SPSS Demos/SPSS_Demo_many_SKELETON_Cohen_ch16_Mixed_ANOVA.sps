* Encoding: windows-1252.
*** ======================================== ***.
*** Chap 16B Text Example (in the chapter).
*** ======================================== ***.

* DATA: 'PublicSpeaking.sav'.


* Suppose that you have devised a new treatment for people afraid of public speaking. 

* To show that the effects of your new treatment are greater than a placebo effect, 
* half the subjects (all of whom have this phobia) are randomly assigned to a control group; 
* their treatment consists of hearing inspirational talks about the joys of public speaking. 

* Suppose further that you wish to demonstrate that the beneficial effects of your treatment 
* last beyond the end of the treatment period. Consequently, you measure the degree of 
* each subject’s phobia not only before and after the treatment period, 
* but also 6 months after the end of treatment (follow-up).


* perform mixed-design ANOVA:



* Plot Cell means: describe.




*** ======================================== ***.
*** Chap 16A - #3.
*** ======================================== ***.

* DATA:'Cohen_eps4e_MoviePopcorn.sav'.

* A psychologist is studying the relationship between emotion and eating. 

* All of his subjects view the same two film segments. 
* One segment evokes happiness and one segment evokes fear; 
* the order in which subjects view the film segments is counterbalanced. 

* Half of the subjects are randomly assigned to a condition that 
* requires them to eat a full meal just before viewing the film segments (preload condition); 
* the remaining half are not permitted to eat 
* during the 4 hours preceding the experiment (no load condition). 

* The subjects are offered an unlimited amount of popcorn while viewing the film segments. 
* The amount of popcorn (in ounces) consumed by each subject 
* in each condition appears in the following table.


* A) perform mixed-design ANOVA:


* B) Plot Cell means: describe.


* C) Calcuate diff scores & perform 2-group t-test, relationship.







*** ...for plotting on homework: Chap 16-A #4:

* restructure the dataset so that the recall scores are in long format.

VARSTOCASES
  /MAKE popcorn FROM Happiness Fear
  /INDEX=Film(2) 
  /KEEP=ID Preload
  /NULL=KEEP.

VARIABLE LABELS Film "Emotion evoked by Film".
VALUE LABELS    Film 1 'happiness' 2 'fear'.

* double-click on the plot to add interpolation lines.


