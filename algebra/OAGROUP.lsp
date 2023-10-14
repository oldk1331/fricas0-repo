
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedAbelianGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianGroup| ()
  (LET (#:G129)
    (COND (|OrderedAbelianGroup;AL|)
          (T (SETQ |OrderedAbelianGroup;AL| (|OrderedAbelianGroup;|)))))) 

(DEFUN |OrderedAbelianGroup;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|))
               |OrderedAbelianGroup|)
       (SETELT #1# 0 '(|OrderedAbelianGroup|)))))) 

(MAKEPROP '|OrderedAbelianGroup| 'NILADIC T) 
