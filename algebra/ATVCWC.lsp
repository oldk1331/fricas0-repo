
(DECLAIM (NOTINLINE |VariablesCommuteWithCoefficients;|)) 

(DEFPARAMETER |VariablesCommuteWithCoefficients;AL| 'NIL) 

(DEFUN |VariablesCommuteWithCoefficients| ()
  (LET (#:G105)
    (COND (|VariablesCommuteWithCoefficients;AL|)
          (T
           (SETQ |VariablesCommuteWithCoefficients;AL|
                   (|VariablesCommuteWithCoefficients;|)))))) 

(DEFUN |VariablesCommuteWithCoefficients;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |VariablesCommuteWithCoefficients|)
           (SETELT #1# 0 '(|VariablesCommuteWithCoefficients|))))) 

(MAKEPROP '|VariablesCommuteWithCoefficients| 'NILADIC T) 
