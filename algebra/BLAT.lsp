
(DECLAIM (NOTINLINE |BoundedLattice;|)) 

(DEFPARAMETER |BoundedLattice;AL| 'NIL) 

(DEFUN |BoundedLattice| ()
  (LET (#:G106)
    (COND (|BoundedLattice;AL|)
          (T (SETQ |BoundedLattice;AL| (|BoundedLattice;|)))))) 

(DEFUN |BoundedLattice;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|BoundedMeetSemilattice|)
                           (|BoundedJoinSemilattice|))
                   |BoundedLattice|)
           (SETELT #1# 0 '(|BoundedLattice|))))) 

(MAKEPROP '|BoundedLattice| 'NILADIC T) 
