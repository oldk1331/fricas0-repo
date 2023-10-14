
(DECLAIM (NOTINLINE |OrderedAbelianGroup;|)) 

(DEFPARAMETER |OrderedAbelianGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianGroup| ()
  (LET (#:G106)
    (COND (|OrderedAbelianGroup;AL|)
          (T (SETQ |OrderedAbelianGroup;AL| (|OrderedAbelianGroup;|)))))) 

(DEFUN |OrderedAbelianGroup;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|OrderedCancellationAbelianMonoid|)
                           (|AbelianGroup|))
                   |OrderedAbelianGroup|)
           (SETELT #1# 0 '(|OrderedAbelianGroup|))))) 

(MAKEPROP '|OrderedAbelianGroup| 'NILADIC T) 
