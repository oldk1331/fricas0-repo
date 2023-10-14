
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CommutativeRing;|)) 

(DEFPARAMETER |CommutativeRing;AL| 'NIL) 

(DEFUN |CommutativeRing| ()
  (LET (#:G129)
    (COND (|CommutativeRing;AL|)
          (T (SETQ |CommutativeRing;AL| (|CommutativeRing;|)))))) 

(DEFUN |CommutativeRing;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|Ring|) (|BiModule| '$ '$) (|CommutativeStar|))
               |CommutativeRing|)
       (SETELT #1# 0 '(|CommutativeRing|)))))) 

(MAKEPROP '|CommutativeRing| 'NILADIC T) 
