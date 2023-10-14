
(/VERSIONCHECK 2) 

(DEFPARAMETER |CachableSet;AL| 'NIL) 

(DEFUN |CachableSet| ()
  (LET (#:G129)
    (COND (|CachableSet;AL|) (T (SETQ |CachableSet;AL| (|CachableSet;|)))))) 

(DEFUN |CachableSet;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((|position| ((|NonNegativeInteger|) $)) T)
                          ((|setPosition| ((|Void|) $ (|NonNegativeInteger|)))
                           T))
                        NIL '((|Void|) (|NonNegativeInteger|)) NIL))
               |CachableSet|)
       (SETELT #1# 0 '(|CachableSet|)))))) 

(MAKEPROP '|CachableSet| 'NILADIC T) 
