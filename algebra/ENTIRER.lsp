
(/VERSIONCHECK 2) 

(DEFPARAMETER |EntireRing;AL| 'NIL) 

(DEFUN |EntireRing| ()
  (LET (#:G127)
    (COND (|EntireRing;AL|) (T (SETQ |EntireRing;AL| (|EntireRing;|)))))) 

(DEFUN |EntireRing;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1# (|Join| (|Ring|) (|BiModule| '$ '$) (|noZeroDivisors|))
               |EntireRing|)
       (SETELT #1# 0 '(|EntireRing|)))))) 

(MAKEPROP '|EntireRing| 'NILADIC T) 
