
(DECLAIM (NOTINLINE |ConvertibleTo;|)) 

(DEFPARAMETER |ConvertibleTo;AL| 'NIL) 

(DEFUN |ConvertibleTo| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |ConvertibleTo;AL|)) (CDR #1#))
          (T
           (SETQ |ConvertibleTo;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|ConvertibleTo;| #2#)))
                            |ConvertibleTo;AL|))
           #1#)))) 

(DEFUN |ConvertibleTo;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory| '(((|convert| (|t#1| $)) T)) NIL
                                             NIL NIL)))
                   |ConvertibleTo|)
           (SETELT #1# 0 (LIST '|ConvertibleTo| |t#1|))))) 
