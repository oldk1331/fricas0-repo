
(DECLAIM (NOTINLINE |NonAssociativeSemiRing;|)) 

(DEFPARAMETER |NonAssociativeSemiRing;AL| 'NIL) 

(DEFUN |NonAssociativeSemiRing| ()
  (LET (#:G106)
    (COND (|NonAssociativeSemiRing;AL|)
          (T (SETQ |NonAssociativeSemiRing;AL| (|NonAssociativeSemiRing;|)))))) 

(DEFUN |NonAssociativeSemiRing;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                           (|MagmaWithUnit|))
                   |NonAssociativeSemiRing|)
           (SETELT #1# 0 '(|NonAssociativeSemiRing|))))) 

(MAKEPROP '|NonAssociativeSemiRing| 'NILADIC T) 
