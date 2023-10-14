
(DECLAIM (NOTINLINE |noZeroDivisors;|)) 

(DEFPARAMETER |noZeroDivisors;AL| 'NIL) 

(DEFUN |noZeroDivisors| ()
  (LET (#:G105)
    (COND (|noZeroDivisors;AL|)
          (T (SETQ |noZeroDivisors;AL| (|noZeroDivisors;|)))))) 

(DEFUN |noZeroDivisors;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |noZeroDivisors|)
       (SETELT #1# 0 '(|noZeroDivisors|)))))) 

(MAKEPROP '|noZeroDivisors| 'NILADIC T) 
