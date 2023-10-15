
(DECLAIM (NOTINLINE |SemiRing;|)) 

(DEFPARAMETER |SemiRing;AL| 'NIL) 

(DEFUN |SemiRing| ()
  (LET (#:G106)
    (COND (|SemiRing;AL|) (T (SETQ |SemiRing;AL| (|SemiRing;|)))))) 

(DEFUN |SemiRing;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|NonAssociativeSemiRing|) (|SemiRng|) (|Monoid|))
                   |SemiRing|)
           (SETELT #1# 0 '(|SemiRing|))))) 

(MAKEPROP '|SemiRing| 'NILADIC T) 
