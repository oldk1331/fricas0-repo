
(DECLAIM (NOTINLINE |TwoSidedRecip;|)) 

(DEFPARAMETER |TwoSidedRecip;AL| 'NIL) 

(DEFUN |TwoSidedRecip| ()
  (LET (#:G106)
    (COND (|TwoSidedRecip;AL|)
          (T (SETQ |TwoSidedRecip;AL| (|TwoSidedRecip;|)))))) 

(DEFUN |TwoSidedRecip;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |TwoSidedRecip|)
           (SETELT #1# 0 '(|TwoSidedRecip|))))) 

(MAKEPROP '|TwoSidedRecip| 'NILADIC T) 