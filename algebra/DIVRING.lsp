
(DECLAIM (NOTINLINE |DivisionRing;|)) 

(DEFPARAMETER |DivisionRing;AL| 'NIL) 

(DEFUN |DivisionRing| ()
  (LET (#:G108)
    (COND (|DivisionRing;AL|) (T (SETQ |DivisionRing;AL| (|DivisionRing;|)))))) 

(DEFUN |DivisionRing;| ()
  (SPROG ((#1=#:G106 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(#2=#:G105) (LIST '(|Fraction| (|Integer|))))
                    (|Join| (|EntireRing|) (|Algebra| '#2#)
                            (|mkCategory|
                             '(((^ ($ $ (|Integer|))) T) ((|inv| ($ $)) T)) NIL
                             '((|Integer|)) NIL)))
                   |DivisionRing|)
           (SETELT #1# 0 '(|DivisionRing|))))) 

(MAKEPROP '|DivisionRing| 'NILADIC T) 
