
(DECLAIM (NOTINLINE |CharacteristicNonZero;|)) 

(DEFPARAMETER |CharacteristicNonZero;AL| 'NIL) 

(DEFUN |CharacteristicNonZero| ()
  (LET (#:G106)
    (COND (|CharacteristicNonZero;AL|)
          (T (SETQ |CharacteristicNonZero;AL| (|CharacteristicNonZero;|)))))) 

(DEFUN |CharacteristicNonZero;| ()
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Ring|)
                           (|mkCategory|
                            '(((|charthRoot| ((|Union| $ "failed") $)) T)) NIL
                            'NIL NIL))
                   |CharacteristicNonZero|)
           (SETELT #1# 0 '(|CharacteristicNonZero|))))) 

(MAKEPROP '|CharacteristicNonZero| 'NILADIC T) 
