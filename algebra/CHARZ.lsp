
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CharacteristicZero;|)) 

(DEFPARAMETER |CharacteristicZero;AL| 'NIL) 

(DEFUN |CharacteristicZero| ()
  (LET (#:G129)
    (COND (|CharacteristicZero;AL|)
          (T (SETQ |CharacteristicZero;AL| (|CharacteristicZero;|)))))) 

(DEFUN |CharacteristicZero;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1 (LETT #1# (|Join| (|Ring|)) |CharacteristicZero|)
       (SETELT #1# 0 '(|CharacteristicZero|)))))) 

(MAKEPROP '|CharacteristicZero| 'NILADIC T) 
