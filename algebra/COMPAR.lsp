
(DECLAIM (NOTINLINE |Comparable;|)) 

(DEFPARAMETER |Comparable;AL| 'NIL) 

(DEFUN |Comparable| ()
  (COND (|Comparable;AL|) (T (SETQ |Comparable;AL| (|Comparable;|))))) 

(DEFUN |Comparable;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|smaller?| ((|Boolean|) $ $)) T))
                                         NIL NIL NIL))
                   |Comparable|)
           (SETELT #1# 0 '(|Comparable|))))) 

(MAKEPROP '|Comparable| 'NILADIC T) 
