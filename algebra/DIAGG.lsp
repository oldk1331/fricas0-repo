
(DEFPARAMETER |Dictionary;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Dictionary;|)) 

(DEFPARAMETER |Dictionary;AL| 'NIL) 

(DEFUN |Dictionary| (|t#1|)
  (LET (#1=#:G109 (#2=#:G110 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Dictionary;AL|)) (CDR #1#))
          (T
           (SETQ |Dictionary;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Dictionary;| #2#)))
                            |Dictionary;AL|))
           #1#)))) 

(DEFUN |Dictionary;| (|t#1|)
  (SPROG ((#1=#:G108 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|Dictionary;CAT|)
                                    ('T
                                     (LETT |Dictionary;CAT|
                                           (|Join|
                                            (|DictionaryOperations| '|t#1|))
                                           . #2=(|Dictionary|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Dictionary| (|devaluate| |t#1|)))))) 
