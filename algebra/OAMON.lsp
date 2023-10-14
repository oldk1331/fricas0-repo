
(DECLAIM (NOTINLINE |OrderedAbelianMonoid;|)) 

(DEFPARAMETER |OrderedAbelianMonoid;AL| 'NIL) 

(DEFUN |OrderedAbelianMonoid| ()
  (LET (#:G105)
    (COND (|OrderedAbelianMonoid;AL|)
          (T (SETQ |OrderedAbelianMonoid;AL| (|OrderedAbelianMonoid;|)))))) 

(DEFUN |OrderedAbelianMonoid;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|OrderedAbelianSemiGroup|) (|AbelianMonoid|))
               |OrderedAbelianMonoid|)
       (SETELT #1# 0 '(|OrderedAbelianMonoid|)))))) 

(MAKEPROP '|OrderedAbelianMonoid| 'NILADIC T) 
