
(DECLAIM (NOTINLINE |DivisionRing;|)) 

(DEFPARAMETER |DivisionRing;AL| 'NIL) 

(DEFUN |DivisionRing| ()
  (COND (|DivisionRing;AL|) (T (SETQ |DivisionRing;AL| (|DivisionRing;|))))) 

(DEFUN |DivisionRing;| ()
  (SPROG ((#1=#:G3 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G2) (LIST '(|Fraction| (|Integer|)))
                                   (|Join| (|EntireRing|) (|Algebra| '#2#)
                                           (|TwoSidedRecip|)
                                           (|mkCategory|
                                            '(((^ (% % (|Integer|))) T)
                                              ((|inv| (% %)) T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|DivisionRing|))))) 
