
(DECLAIM (NOTINLINE |OrderedAbelianSemiGroup;|)) 

(DEFPARAMETER |OrderedAbelianSemiGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianSemiGroup| ()
  (LET (#:G106)
    (COND (|OrderedAbelianSemiGroup;AL|)
          (T
           (SETQ |OrderedAbelianSemiGroup;AL| (|OrderedAbelianSemiGroup;|)))))) 

(DEFUN |OrderedAbelianSemiGroup;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|OrderedSet|) (|AbelianSemiGroup|))
                   |OrderedAbelianSemiGroup|)
           (SETELT #1# 0 '(|OrderedAbelianSemiGroup|))))) 

(MAKEPROP '|OrderedAbelianSemiGroup| 'NILADIC T) 
