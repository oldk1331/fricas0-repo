
(DECLAIM (NOTINLINE |multiplicativeValuation;|)) 

(DEFPARAMETER |multiplicativeValuation;AL| 'NIL) 

(DEFUN |multiplicativeValuation| ()
  (LET (#:G105)
    (COND (|multiplicativeValuation;AL|)
          (T
           (SETQ |multiplicativeValuation;AL| (|multiplicativeValuation;|)))))) 

(DEFUN |multiplicativeValuation;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |multiplicativeValuation|)
           (SETELT #1# 0 '(|multiplicativeValuation|))))) 

(MAKEPROP '|multiplicativeValuation| 'NILADIC T) 
