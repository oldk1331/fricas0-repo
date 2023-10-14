
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |OrderedCancellationAbelianMonoid;|)) 

(DEFPARAMETER |OrderedCancellationAbelianMonoid;AL| 'NIL) 

(DEFUN |OrderedCancellationAbelianMonoid| ()
  (LET (#:G105)
    (COND (|OrderedCancellationAbelianMonoid;AL|)
          (T
           (SETQ |OrderedCancellationAbelianMonoid;AL|
                   (|OrderedCancellationAbelianMonoid;|)))))) 

(DEFUN |OrderedCancellationAbelianMonoid;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|))
               |OrderedCancellationAbelianMonoid|)
       (SETELT #1# 0 '(|OrderedCancellationAbelianMonoid|)))))) 

(MAKEPROP '|OrderedCancellationAbelianMonoid| 'NILADIC T) 
