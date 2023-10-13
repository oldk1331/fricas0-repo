
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedAbelianSemiGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianSemiGroup| ()
  (LET (#:G127)
    (COND (|OrderedAbelianSemiGroup;AL|)
          (T
           (SETQ |OrderedAbelianSemiGroup;AL| (|OrderedAbelianSemiGroup;|)))))) 

(DEFUN |OrderedAbelianSemiGroup;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|OrderedSet|) (|AbelianSemiGroup|))
               |OrderedAbelianSemiGroup|)
       (SETELT #1# 0 '(|OrderedAbelianSemiGroup|)))))) 

(MAKEPROP '|OrderedAbelianSemiGroup| 'NILADIC T) 
