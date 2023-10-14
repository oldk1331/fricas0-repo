
(DECLAIM (NOTINLINE |canonicalsClosed;|)) 

(DEFPARAMETER |canonicalsClosed;AL| 'NIL) 

(DEFUN |canonicalsClosed| ()
  (LET (#:G105)
    (COND (|canonicalsClosed;AL|)
          (T (SETQ |canonicalsClosed;AL| (|canonicalsClosed;|)))))) 

(DEFUN |canonicalsClosed;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |canonicalsClosed|)
       (SETELT #1# 0 '(|canonicalsClosed|)))))) 

(MAKEPROP '|canonicalsClosed| 'NILADIC T) 
