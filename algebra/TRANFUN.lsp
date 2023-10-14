
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |TranscendentalFunctionCategory;|)) 

(DEFPARAMETER |TranscendentalFunctionCategory;AL| 'NIL) 

(DEFUN |TranscendentalFunctionCategory| ()
  (LET (#:G129)
    (COND (|TranscendentalFunctionCategory;AL|)
          (T
           (SETQ |TranscendentalFunctionCategory;AL|
                   (|TranscendentalFunctionCategory;|)))))) 

(DEFUN |TranscendentalFunctionCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|TrigonometricFunctionCategory|)
                       (|ArcTrigonometricFunctionCategory|)
                       (|HyperbolicFunctionCategory|)
                       (|ArcHyperbolicFunctionCategory|)
                       (|ElementaryFunctionCategory|)
                       (|mkCategory| '(((|pi| ($)) T)) NIL 'NIL NIL))
               |TranscendentalFunctionCategory|)
       (SETELT #1# 0 '(|TranscendentalFunctionCategory|)))))) 

(MAKEPROP '|TranscendentalFunctionCategory| 'NILADIC T) 
