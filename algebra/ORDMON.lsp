
(DECLAIM (NOTINLINE |OrderedMonoid;|)) 

(DEFPARAMETER |OrderedMonoid;AL| 'NIL) 

(DEFUN |OrderedMonoid| ()
  (LET (#:G105)
    (COND (|OrderedMonoid;AL|)
          (T (SETQ |OrderedMonoid;AL| (|OrderedMonoid;|)))))) 

(DEFUN |OrderedMonoid;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|OrderedSemiGroup|) (|Monoid|))
                   |OrderedMonoid|)
           (SETELT #1# 0 '(|OrderedMonoid|))))) 

(MAKEPROP '|OrderedMonoid| 'NILADIC T) 
