
(DECLAIM (NOTINLINE |Comparable;|)) 

(DEFPARAMETER |Comparable;AL| 'NIL) 

(DEFUN |Comparable| ()
  (COND (|Comparable;AL|) (T (SETQ |Comparable;AL| (|Comparable;|))))) 

(DEFUN |Comparable;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|smaller?| ((|Boolean|) % %)) T))
                                         NIL NIL NIL)))
           (SETELT #1# 0 '(|Comparable|))))) 
