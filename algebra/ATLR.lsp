
(DECLAIM (NOTINLINE |lazyRepresentation;|)) 

(DEFPARAMETER |lazyRepresentation;AL| 'NIL) 

(DEFUN |lazyRepresentation| ()
  (COND (|lazyRepresentation;AL|)
        (T (SETQ |lazyRepresentation;AL| (|lazyRepresentation;|))))) 

(DEFUN |lazyRepresentation;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |lazyRepresentation|)
           (SETELT #1# 0 '(|lazyRepresentation|))))) 

(MAKEPROP '|lazyRepresentation| 'NILADIC T) 
