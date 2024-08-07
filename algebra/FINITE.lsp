
(DECLAIM (NOTINLINE |Finite;|)) 

(DEFPARAMETER |Finite;AL| 'NIL) 

(DEFUN |Finite| () (COND (|Finite;AL|) (T (SETQ |Finite;AL| (|Finite;|))))) 

(DEFUN |Finite;| ()
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G0) (LIST '(|InputForm|))
                                   (|Join| (|SetCategory|)
                                           (|ConvertibleTo| '#2#)
                                           (|Comparable|) (|Hashable|)
                                           (|mkCategory|
                                            '(((|size|
                                                ((|NonNegativeInteger|)))
                                               T)
                                              ((|index|
                                                (% (|PositiveInteger|)))
                                               T)
                                              ((|lookup|
                                                ((|PositiveInteger|) %))
                                               T)
                                              ((|random| (%)) T)
                                              ((|enumerate| ((|List| %))) T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|Finite|))))) 
