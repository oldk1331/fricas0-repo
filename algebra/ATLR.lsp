
(/VERSIONCHECK 2) 

(DEFPARAMETER |lazyRepresentation;AL| 'NIL) 

(DEFUN |lazyRepresentation| ()
  (LET (#:G127)
    (COND (|lazyRepresentation;AL|)
          (T (SETQ |lazyRepresentation;AL| (|lazyRepresentation;|)))))) 

(DEFUN |lazyRepresentation;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
               |lazyRepresentation|)
       (SETELT #1# 0 '(|lazyRepresentation|)))))) 

(MAKEPROP '|lazyRepresentation| 'NILADIC T) 
