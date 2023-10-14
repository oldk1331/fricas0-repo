
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |AbelianMonoid;|)) 

(DEFPARAMETER |AbelianMonoid;AL| 'NIL) 

(DEFUN |AbelianMonoid| ()
  (LET (#:G106)
    (COND (|AbelianMonoid;AL|)
          (T (SETQ |AbelianMonoid;AL| (|AbelianMonoid;|)))))) 

(DEFUN |AbelianMonoid;| ()
  (PROG (#1=#:G104)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|AbelianSemiGroup|)
                       (|mkCategory|
                        '(((|Zero| ($) |constant|) T)
                          ((|sample| ($) |constant|) T)
                          ((|zero?| ((|Boolean|) $)) T)
                          ((* ($ (|NonNegativeInteger|) $)) T))
                        NIL '((|NonNegativeInteger|) (|Boolean|)) NIL))
               |AbelianMonoid|)
       (SETELT #1# 0 '(|AbelianMonoid|)))))) 

(MAKEPROP '|AbelianMonoid| 'NILADIC T) 
