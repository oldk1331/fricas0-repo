
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |finiteAggregate;|)) 

(DEFPARAMETER |finiteAggregate;AL| 'NIL) 

(DEFUN |finiteAggregate| ()
  (LET (#:G129)
    (COND (|finiteAggregate;AL|)
          (T (SETQ |finiteAggregate;AL| (|finiteAggregate;|)))))) 

(DEFUN |finiteAggregate;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |finiteAggregate|)
       (SETELT #1# 0 '(|finiteAggregate|)))))) 

(MAKEPROP '|finiteAggregate| 'NILADIC T) 
