
(DECLAIM (NOTINLINE |finiteAggregate;|)) 

(DEFPARAMETER |finiteAggregate;AL| 'NIL) 

(DEFUN |finiteAggregate| ()
  (LET (#:G105)
    (COND (|finiteAggregate;AL|)
          (T (SETQ |finiteAggregate;AL| (|finiteAggregate;|)))))) 

(DEFUN |finiteAggregate;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |finiteAggregate|)
           (SETELT #1# 0 '(|finiteAggregate|))))) 

(MAKEPROP '|finiteAggregate| 'NILADIC T) 
