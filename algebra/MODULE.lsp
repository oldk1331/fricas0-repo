
(DEFPARAMETER |Module;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Module;|)) 

(DEFPARAMETER |Module;AL| 'NIL) 

(DEFUN |Module| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Module;AL|)) (CDR #1#))
          (T
           (SETQ |Module;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Module;| #2#))) |Module;AL|))
           #1#)))) 

(DEFUN |Module;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|Module;CAT|)
                                    ('T
                                     (LETT |Module;CAT|
                                           (|Join| (|BiModule| '|t#1| '|t#1|))
                                           . #2=(|Module|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Module| |t#1|))))) 
