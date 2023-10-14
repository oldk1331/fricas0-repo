
(DECLAIM (NOTINLINE |StringCategory;|)) 

(DEFPARAMETER |StringCategory;AL| 'NIL) 

(DEFUN |StringCategory| ()
  (LET (#:G105)
    (COND (|StringCategory;AL|)
          (T (SETQ |StringCategory;AL| (|StringCategory;|)))))) 

(DEFUN |StringCategory;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|StringAggregate|) (|SetCategory|) (|OpenMath|)
                           (|mkCategory| '(((|string| ($ (|Integer|))) T)) NIL
                                         '((|Integer|)) NIL))
                   |StringCategory|)
           (SETELT #1# 0 '(|StringCategory|))))) 

(MAKEPROP '|StringCategory| 'NILADIC T) 
