
(DEFPARAMETER |PatternMatchable;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PatternMatchable;|)) 

(DEFPARAMETER |PatternMatchable;AL| 'NIL) 

(DEFUN |PatternMatchable| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PatternMatchable;AL|)) (CDR #1#))
          (T
           (SETQ |PatternMatchable;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|PatternMatchable;| #2#)))
                            |PatternMatchable;AL|))
           #1#)))) 

(DEFUN |PatternMatchable;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|PatternMatchable;CAT|)
                                    ('T
                                     (LETT |PatternMatchable;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|mkCategory|
                                                    '(((|patternMatch|
                                                        ((|PatternMatchResult|
                                                          |t#1| $)
                                                         $ (|Pattern| |t#1|)
                                                         (|PatternMatchResult|
                                                          |t#1| $)))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|PatternMatchable| |t#1|))))) 
