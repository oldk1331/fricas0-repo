
(DECLAIM (NOTINLINE |canonicalsClosed;|)) 

(DEFPARAMETER |canonicalsClosed;AL| 'NIL) 

(DEFUN |canonicalsClosed| ()
  (COND (|canonicalsClosed;AL|)
        (T (SETQ |canonicalsClosed;AL| (|canonicalsClosed;|))))) 

(DEFUN |canonicalsClosed;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL NIL NIL))
                   |canonicalsClosed|)
           (SETELT #1# 0 '(|canonicalsClosed|))))) 

(MAKEPROP '|canonicalsClosed| 'NILADIC T) 
