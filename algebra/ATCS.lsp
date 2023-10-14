
(DECLAIM (NOTINLINE |CommutativeStar;|)) 

(DEFPARAMETER |CommutativeStar;AL| 'NIL) 

(DEFUN |CommutativeStar| ()
  (LET (#:G105)
    (COND (|CommutativeStar;AL|)
          (T (SETQ |CommutativeStar;AL| (|CommutativeStar;|)))))) 

(DEFUN |CommutativeStar;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|mkCategory| NIL NIL 'NIL NIL)) |CommutativeStar|)
       (SETELT #1# 0 '(|CommutativeStar|)))))) 

(MAKEPROP '|CommutativeStar| 'NILADIC T) 
