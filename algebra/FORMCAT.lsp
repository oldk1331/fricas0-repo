
(DECLAIM (NOTINLINE |OutputFormaterCategory;|)) 

(DEFPARAMETER |OutputFormaterCategory;AL| 'NIL) 

(DEFUN |OutputFormaterCategory| ()
  (LET (#:G106)
    (COND (|OutputFormaterCategory;AL|)
          (T (SETQ |OutputFormaterCategory;AL| (|OutputFormaterCategory;|)))))) 

(DEFUN |OutputFormaterCategory;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|convert| ($ (|OutputForm|) (|Integer|))) T)
                       ((|display| ((|Void|) $)) T))
                     NIL '((|Void|) (|OutputForm|) (|Integer|)) NIL))
                   |OutputFormaterCategory|)
           (SETELT #1# 0 '(|OutputFormaterCategory|))))) 

(MAKEPROP '|OutputFormaterCategory| 'NILADIC T) 
