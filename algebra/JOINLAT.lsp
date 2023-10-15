
(DECLAIM (NOTINLINE |JoinSemilattice;|)) 

(DEFPARAMETER |JoinSemilattice;AL| 'NIL) 

(DEFUN |JoinSemilattice| ()
  (LET (#:G106)
    (COND (|JoinSemilattice;AL|)
          (T (SETQ |JoinSemilattice;AL| (|JoinSemilattice;|)))))) 

(DEFUN |JoinSemilattice;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|\\/| ($ $ $)) T)) NIL 'NIL NIL))
                   |JoinSemilattice|)
           (SETELT #1# 0 '(|JoinSemilattice|))))) 

(MAKEPROP '|JoinSemilattice| 'NILADIC T) 