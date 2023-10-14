
(DECLAIM (NOTINLINE |AbelianGroup;|)) 

(DEFPARAMETER |AbelianGroup;AL| 'NIL) 

(DEFUN |AbelianGroup| ()
  (LET (#:G107)
    (COND (|AbelianGroup;AL|) (T (SETQ |AbelianGroup;AL| (|AbelianGroup;|)))))) 

(DEFUN |AbelianGroup;| ()
  (SPROG ((#1=#:G105 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|CancellationAbelianMonoid|)
                           (|mkCategory|
                            '(((- ($ $)) T) ((- ($ $ $)) T)
                              ((* ($ (|Integer|) $)) T))
                            NIL '((|Integer|)) NIL))
                   |AbelianGroup|)
           (SETELT #1# 0 '(|AbelianGroup|))))) 

(MAKEPROP '|AbelianGroup| 'NILADIC T) 
