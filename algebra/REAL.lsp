
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |RealConstant;|)) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (LET (#:G131)
    (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|)))))) 

(DEFUN |RealConstant;| ()
  (PROG (#1=#:G129)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(#2=#:G127 #3=#:G128)
                      (LIST '(|DoubleFloat|) '(|Float|)))
                (|Join| (|ConvertibleTo| '#2#) (|ConvertibleTo| '#3#)))
               |RealConstant|)
       (SETELT #1# 0 '(|RealConstant|)))))) 

(MAKEPROP '|RealConstant| 'NILADIC T) 
