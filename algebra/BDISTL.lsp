
(DECLAIM (NOTINLINE |BoundedDistributiveLattice;|)) 

(DEFPARAMETER |BoundedDistributiveLattice;AL| 'NIL) 

(DEFUN |BoundedDistributiveLattice| ()
  (LET (#:G106)
    (COND (|BoundedDistributiveLattice;AL|)
          (T
           (SETQ |BoundedDistributiveLattice;AL|
                   (|BoundedDistributiveLattice;|)))))) 

(DEFUN |BoundedDistributiveLattice;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|BoundedLattice|) (|DistributiveLattice|))
                   |BoundedDistributiveLattice|)
           (SETELT #1# 0 '(|BoundedDistributiveLattice|))))) 

(MAKEPROP '|BoundedDistributiveLattice| 'NILADIC T) 
