
(/VERSIONCHECK 2) 

(DEFPARAMETER |VariablesCommuteWithCoefficients;AL| 'NIL) 

(DEFUN |VariablesCommuteWithCoefficients| ()
  (LET (#:G129)
    (COND (|VariablesCommuteWithCoefficients;AL|)
          (T
           (SETQ |VariablesCommuteWithCoefficients;AL|
                   (|VariablesCommuteWithCoefficients;|)))))) 

(DEFUN |VariablesCommuteWithCoefficients;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |VariablesCommuteWithCoefficients|)
       (SETELT #1# 0 '(|VariablesCommuteWithCoefficients|)))))) 

(MAKEPROP '|VariablesCommuteWithCoefficients| 'NILADIC T) 
