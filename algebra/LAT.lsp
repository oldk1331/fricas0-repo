
(DECLAIM (NOTINLINE |Lattice;|)) 

(DEFPARAMETER |Lattice;AL| 'NIL) 

(DEFUN |Lattice| () (COND (|Lattice;AL|) (T (SETQ |Lattice;AL| (|Lattice;|))))) 

(DEFUN |Lattice;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|MeetSemilattice|) (|JoinSemilattice|))
                   |Lattice|)
           (SETELT #1# 0 '(|Lattice|))))) 

(MAKEPROP '|Lattice| 'NILADIC T) 
