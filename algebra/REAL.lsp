
(/VERSIONCHECK 2) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (LET (#:G129)
    (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|)))))) 

(DEFUN |RealConstant;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(#2=#:G125 #3=#:G126)
                      (LIST '(|DoubleFloat|) '(|Float|)))
                (|Join| (|ConvertibleTo| '#2#) (|ConvertibleTo| '#3#)))
               |RealConstant|)
       (SETELT #1# 0 '(|RealConstant|)))))) 

(MAKEPROP '|RealConstant| 'NILADIC T) 
