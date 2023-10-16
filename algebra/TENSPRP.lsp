
(DECLAIM (NOTINLINE |TensorProductProperty;|)) 

(DEFPARAMETER |TensorProductProperty;AL| 'NIL) 

(DEFUN |TensorProductProperty| (|t#1| |t#2| |t#3| |t#4| |t#5|)
  (LET (#1=#:G105
        (#2=#:G106
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|)
               (|devaluate| |t#4|) (|devaluate| |t#5|))))
    (COND ((SETQ #1# (|assoc| #2# |TensorProductProperty;AL|)) (CDR #1#))
          (T
           (SETQ |TensorProductProperty;AL|
                   (|cons5|
                    (CONS #2#
                          (SETQ #1# (APPLY #'|TensorProductProperty;| #2#)))
                    |TensorProductProperty;AL|))
           #1#)))) 

(DEFUN |TensorProductProperty;| (|t#1| |t#2| |t#3| |t#4| |t#5|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4| |t#5|)
                          (LIST |t#1| |t#2| |t#3| |t#4| |t#5|))
                    (|Join|
                     (|mkCategory|
                      '(((|eval| (|t#5| |t#4| (|Mapping| |t#5| |t#2| |t#3|)))
                         T))
                      NIL NIL NIL)))
                   |TensorProductProperty|)
           (SETELT #1# 0
                   (LIST '|TensorProductProperty| |t#1| |t#2| |t#3| |t#4|
                         |t#5|))))) 
