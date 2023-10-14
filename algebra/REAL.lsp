
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |RealConstant;|)) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (LET (#:G107)
    (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|)))))) 

(DEFUN |RealConstant;| ()
  (PROG (#1=#:G105)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(#2=#:G103 #3=#:G104)
                      (LIST '(|DoubleFloat|) '(|Float|)))
                (|Join| (|ConvertibleTo| '#2#) (|ConvertibleTo| '#3#)))
               |RealConstant|)
       (SETELT #1# 0 '(|RealConstant|)))))) 

(MAKEPROP '|RealConstant| 'NILADIC T) 
