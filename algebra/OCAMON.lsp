
(DECLAIM (NOTINLINE |OrderedCancellationAbelianMonoid;|)) 

(DEFPARAMETER |OrderedCancellationAbelianMonoid;AL| 'NIL) 

(DEFUN |OrderedCancellationAbelianMonoid| ()
  (LET (#:G105)
    (COND (|OrderedCancellationAbelianMonoid;AL|)
          (T
           (SETQ |OrderedCancellationAbelianMonoid;AL|
                   (|OrderedCancellationAbelianMonoid;|)))))) 

(DEFUN |OrderedCancellationAbelianMonoid;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|OrderedAbelianMonoid|)
                           (|CancellationAbelianMonoid|))
                   |OrderedCancellationAbelianMonoid|)
           (SETELT #1# 0 '(|OrderedCancellationAbelianMonoid|))))) 

(MAKEPROP '|OrderedCancellationAbelianMonoid| 'NILADIC T) 
