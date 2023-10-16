
(DECLAIM (NOTINLINE |RadicalCategory;|)) 

(DEFPARAMETER |RadicalCategory;AL| 'NIL) 

(DEFUN |RadicalCategory| ()
  (COND (|RadicalCategory;AL|)
        (T (SETQ |RadicalCategory;AL| (|RadicalCategory;|))))) 

(DEFUN |RadicalCategory;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|sqrt| ($ $)) T) ((|nthRoot| ($ $ (|Integer|))) T)
                       ((^ ($ $ (|Fraction| (|Integer|)))) T))
                     NIL NIL NIL))
                   |RadicalCategory|)
           (SETELT #1# 0 '(|RadicalCategory|))))) 

(MAKEPROP '|RadicalCategory| 'NILADIC T) 
