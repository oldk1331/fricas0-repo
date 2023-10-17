
(DECLAIM (NOTINLINE |BitAggregate;|)) 

(DEFPARAMETER |BitAggregate;AL| 'NIL) 

(DEFUN |BitAggregate| ()
  (COND (|BitAggregate;AL|) (T (SETQ |BitAggregate;AL| (|BitAggregate;|))))) 

(DEFUN |BitAggregate;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G103) (LIST '(|Boolean|))
                                   (|Join| (|OrderedSet|) (|Logic|)
                                           (|OneDimensionalArrayAggregate|
                                            '#2#)
                                           (|mkCategory|
                                            '(((|not| ($ $)) T)
                                              ((|nand| ($ $ $)) T)
                                              ((|nor| ($ $ $)) T)
                                              ((|and| ($ $ $)) T)
                                              ((|or| ($ $ $)) T)
                                              ((|xor| ($ $ $)) T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|BitAggregate|))))) 

(MAKEPROP '|BitAggregate| 'NILADIC T) 
