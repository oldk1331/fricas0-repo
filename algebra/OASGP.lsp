
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |OrderedAbelianSemiGroup;|)) 

(DEFPARAMETER |OrderedAbelianSemiGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianSemiGroup| ()
  (LET (#:G129)
    (COND (|OrderedAbelianSemiGroup;AL|)
          (T
           (SETQ |OrderedAbelianSemiGroup;AL| (|OrderedAbelianSemiGroup;|)))))) 

(DEFUN |OrderedAbelianSemiGroup;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|OrderedSet|) (|AbelianSemiGroup|))
               |OrderedAbelianSemiGroup|)
       (SETELT #1# 0 '(|OrderedAbelianSemiGroup|)))))) 

(MAKEPROP '|OrderedAbelianSemiGroup| 'NILADIC T) 
