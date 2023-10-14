
(DECLAIM (NOTINLINE |CoercibleTo;|)) 

(DEFPARAMETER |CoercibleTo;AL| 'NIL) 

(DEFUN |CoercibleTo| (#1=#:G104)
  (LET (#2=#:G105)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |CoercibleTo;AL|)) (CDR #2#))
     (T
      (SETQ |CoercibleTo;AL|
              (|cons5| (CONS #3# (SETQ #2# (|CoercibleTo;| #1#)))
                       |CoercibleTo;AL|))
      #2#)))) 

(DEFUN |CoercibleTo;| (|t#1|)
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|Join|
                           (|mkCategory| '(((|coerce| (|t#1| $)) T)) NIL 'NIL
                                         NIL)))
               |CoercibleTo|)
       (SETELT #1# 0 (LIST '|CoercibleTo| (|devaluate| |t#1|))))))) 
