
(DECLAIM (NOTINLINE |ElementaryFunctionCategory;|)) 

(DEFPARAMETER |ElementaryFunctionCategory;AL| 'NIL) 

(DEFUN |ElementaryFunctionCategory| ()
  (COND (|ElementaryFunctionCategory;AL|)
        (T
         (SETQ |ElementaryFunctionCategory;AL|
                 (|ElementaryFunctionCategory;|))))) 

(DEFUN |ElementaryFunctionCategory;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|log| ($ $)) T) ((|exp| ($ $)) T) ((^ ($ $ $)) T)) NIL
                     'NIL NIL))
                   |ElementaryFunctionCategory|)
           (SETELT #1# 0 '(|ElementaryFunctionCategory|))))) 

(MAKEPROP '|ElementaryFunctionCategory| 'NILADIC T) 
