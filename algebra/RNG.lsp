
(DECLAIM (NOTINLINE |Rng;|)) 

(DEFPARAMETER |Rng;AL| 'NIL) 

(DEFUN |Rng| ()
  (LET (#:G106)
    (COND (|Rng;AL|) (T (SETQ |Rng;AL| (|Rng;|)))))) 

(DEFUN |Rng;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|AbelianGroup|) (|SemiRng|)
                           (|mkCategory|
                            '(((|annihilate?| ((|Boolean|) $ $)) T)) NIL
                            '((|Boolean|)) NIL))
                   |Rng|)
           (SETELT #1# 0 '(|Rng|))))) 

(MAKEPROP '|Rng| 'NILADIC T) 
