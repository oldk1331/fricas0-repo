
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CancellationAbelianMonoid;|)) 

(DEFPARAMETER |CancellationAbelianMonoid;AL| 'NIL) 

(DEFUN |CancellationAbelianMonoid| ()
  (LET (#:G129)
    (COND (|CancellationAbelianMonoid;AL|)
          (T
           (SETQ |CancellationAbelianMonoid;AL|
                   (|CancellationAbelianMonoid;|)))))) 

(DEFUN |CancellationAbelianMonoid;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|AbelianMonoid|)
                       (|mkCategory|
                        '(((|subtractIfCan| ((|Union| $ "failed") $ $)) T)) NIL
                        'NIL NIL))
               |CancellationAbelianMonoid|)
       (SETELT #1# 0 '(|CancellationAbelianMonoid|)))))) 

(MAKEPROP '|CancellationAbelianMonoid| 'NILADIC T) 
