
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |Patternable;|)) 

(DEFPARAMETER |Patternable;AL| 'NIL) 

(DEFUN |Patternable| (#1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Patternable;AL|)) (CDR #2#))
     (T
      (SETQ |Patternable;AL|
              (|cons5| (CONS #3# (SETQ #2# (|Patternable;| #1#)))
                       |Patternable;AL|))
      #2#)))) 

(DEFUN |Patternable;| (|t#1|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|Join|
                           (|mkCategory| NIL
                                         '(((|ConvertibleTo|
                                             (|Pattern| (|Integer|)))
                                            (|has| |t#1|
                                                   (|ConvertibleTo|
                                                    (|Pattern| (|Integer|)))))
                                           ((|ConvertibleTo|
                                             (|Pattern| (|Float|)))
                                            (|has| |t#1|
                                                   (|ConvertibleTo|
                                                    (|Pattern| (|Float|))))))
                                         'NIL NIL)))
               |Patternable|)
       (SETELT #1# 0 (LIST '|Patternable| (|devaluate| |t#1|))))))) 
