
(DEFPARAMETER |LeftModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LeftModule;|)) 

(DEFPARAMETER |LeftModule;AL| 'NIL) 

(DEFUN |LeftModule| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |LeftModule;AL|)) (CDR #1#))
          (T
           (SETQ |LeftModule;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|LeftModule;| #2#)))
                            |LeftModule;AL|))
           #1#)))) 

(DEFUN |LeftModule;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|LeftModule;CAT|)
                                    ('T
                                     (LETT |LeftModule;CAT|
                                           (|Join| (|AbelianSemiGroup|)
                                                   (|mkCategory|
                                                    '(((* ($ |t#1| $)) T))
                                                    '(((|AbelianMonoid|)
                                                       (|has| |t#1|
                                                              (|AbelianMonoid|)))
                                                      ((|AbelianGroup|)
                                                       (|has| |t#1|
                                                              (|AbelianGroup|))))
                                                    'NIL NIL))
                                           . #2=(|LeftModule|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LeftModule| (|devaluate| |t#1|)))))) 
