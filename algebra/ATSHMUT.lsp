
(DECLAIM (NOTINLINE |shallowlyMutable;|)) 

(DEFPARAMETER |shallowlyMutable;AL| 'NIL) 

(DEFUN |shallowlyMutable| ()
  (LET (#:G105)
    (COND (|shallowlyMutable;AL|)
          (T (SETQ |shallowlyMutable;AL| (|shallowlyMutable;|)))))) 

(DEFUN |shallowlyMutable;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |shallowlyMutable|)
       (SETELT #1# 0 '(|shallowlyMutable|)))))) 

(MAKEPROP '|shallowlyMutable| 'NILADIC T) 
