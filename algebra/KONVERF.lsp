
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |ConvertibleFrom;|)) 

(DEFPARAMETER |ConvertibleFrom;AL| 'NIL) 

(DEFUN |ConvertibleFrom| (#1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ConvertibleFrom;AL|)) (CDR #2#))
     (T
      (SETQ |ConvertibleFrom;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ConvertibleFrom;| #1#)))
                       |ConvertibleFrom;AL|))
      #2#)))) 

(DEFUN |ConvertibleFrom;| (|t#1|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|Join|
                           (|mkCategory| '(((|convert| ($ |t#1|)) T)) NIL 'NIL
                                         NIL)))
               |ConvertibleFrom|)
       (SETELT #1# 0 (LIST '|ConvertibleFrom| (|devaluate| |t#1|))))))) 
