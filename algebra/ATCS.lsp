
(DECLAIM (NOTINLINE |CommutativeStar;|)) 

(DEFPARAMETER |CommutativeStar;AL| 'NIL) 

(DEFUN |CommutativeStar| ()
  (LET (#:G106)
    (COND (|CommutativeStar;AL|)
          (T (SETQ |CommutativeStar;AL| (|CommutativeStar;|)))))) 

(DEFUN |CommutativeStar;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL))
                   |CommutativeStar|)
           (SETELT #1# 0 '(|CommutativeStar|))))) 

(MAKEPROP '|CommutativeStar| 'NILADIC T) 
