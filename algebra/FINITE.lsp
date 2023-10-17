
(DECLAIM (NOTINLINE |Finite;|)) 

(DEFPARAMETER |Finite;AL| 'NIL) 

(DEFUN |Finite| () (COND (|Finite;AL|) (T (SETQ |Finite;AL| (|Finite;|))))) 

(DEFUN |Finite;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G103) (LIST '(|InputForm|))
                                   (|Join| (|SetCategory|)
                                           (|ConvertibleTo| '#2#)
                                           (|Comparable|)
                                           (|mkCategory|
                                            '(((|size|
                                                ((|NonNegativeInteger|)))
                                               T)
                                              ((|index|
                                                ($ (|PositiveInteger|)))
                                               T)
                                              ((|lookup|
                                                ((|PositiveInteger|) $))
                                               T)
                                              ((|random| ($)) T)
                                              ((|enumerate| ((|List| $))) T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|Finite|))))) 

(MAKEPROP '|Finite| 'NILADIC T) 
