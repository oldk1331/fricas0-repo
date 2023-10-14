
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CharacteristicNonZero;|)) 

(DEFPARAMETER |CharacteristicNonZero;AL| 'NIL) 

(DEFUN |CharacteristicNonZero| ()
  (LET (#:G129)
    (COND (|CharacteristicNonZero;AL|)
          (T (SETQ |CharacteristicNonZero;AL| (|CharacteristicNonZero;|)))))) 

(DEFUN |CharacteristicNonZero;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Ring|)
                       (|mkCategory|
                        '(((|charthRoot| ((|Union| $ "failed") $)) T)) NIL 'NIL
                        NIL))
               |CharacteristicNonZero|)
       (SETELT #1# 0 '(|CharacteristicNonZero|)))))) 

(MAKEPROP '|CharacteristicNonZero| 'NILADIC T) 
