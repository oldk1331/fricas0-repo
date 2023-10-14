
(DECLAIM (NOTINLINE |CommutativeRing;|)) 

(DEFPARAMETER |CommutativeRing;AL| 'NIL) 

(DEFUN |CommutativeRing| ()
  (LET (#:G105)
    (COND (|CommutativeRing;AL|)
          (T (SETQ |CommutativeRing;AL| (|CommutativeRing;|)))))) 

(DEFUN |CommutativeRing;| ()
  (SPROG ((#1=#:G103 NIL))
         (PROG1
             (LETT #1# (|Join| (|Ring|) (|BiModule| '$ '$) (|CommutativeStar|))
                   |CommutativeRing|)
           (SETELT #1# 0 '(|CommutativeRing|))))) 

(MAKEPROP '|CommutativeRing| 'NILADIC T) 
