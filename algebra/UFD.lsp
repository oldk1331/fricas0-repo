
(/VERSIONCHECK 2) 

(DEFPARAMETER |UniqueFactorizationDomain;AL| 'NIL) 

(DEFUN |UniqueFactorizationDomain| ()
  (LET (#:G129)
    (COND (|UniqueFactorizationDomain;AL|)
          (T
           (SETQ |UniqueFactorizationDomain;AL|
                   (|UniqueFactorizationDomain;|)))))) 

(DEFUN |UniqueFactorizationDomain;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|GcdDomain|)
                       (|mkCategory|
                        '(((|prime?| ((|Boolean|) $)) T)
                          ((|squareFree| ((|Factored| $) $)) T)
                          ((|squareFreePart| ($ $)) T)
                          ((|factor| ((|Factored| $) $)) T))
                        NIL '((|Factored| $) (|Boolean|)) NIL))
               |UniqueFactorizationDomain|)
       (SETELT #1# 0 '(|UniqueFactorizationDomain|)))))) 

(MAKEPROP '|UniqueFactorizationDomain| 'NILADIC T) 
