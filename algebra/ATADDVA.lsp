
(DECLAIM (NOTINLINE |additiveValuation;|)) 

(DEFPARAMETER |additiveValuation;AL| 'NIL) 

(DEFUN |additiveValuation| ()
  (COND (|additiveValuation;AL|)
        (T (SETQ |additiveValuation;AL| (|additiveValuation;|))))) 

(DEFUN |additiveValuation;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL NIL NIL))
                   |additiveValuation|)
           (SETELT #1# 0 '(|additiveValuation|))))) 

(MAKEPROP '|additiveValuation| 'NILADIC T) 
