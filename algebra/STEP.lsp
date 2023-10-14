
(DECLAIM (NOTINLINE |StepThrough;|)) 

(DEFPARAMETER |StepThrough;AL| 'NIL) 

(DEFUN |StepThrough| ()
  (LET (#:G105)
    (COND (|StepThrough;AL|) (T (SETQ |StepThrough;AL| (|StepThrough;|)))))) 

(DEFUN |StepThrough;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((|init| ($) |constant|) T)
                          ((|nextItem| ((|Union| $ "failed") $)) T))
                        NIL 'NIL NIL))
               |StepThrough|)
       (SETELT #1# 0 '(|StepThrough|)))))) 

(MAKEPROP '|StepThrough| 'NILADIC T) 
