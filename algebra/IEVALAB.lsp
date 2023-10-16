
(DECLAIM (NOTINLINE |InnerEvalable;|)) 

(DEFPARAMETER |InnerEvalable;AL| 'NIL) 

(DEFUN |InnerEvalable| (|t#1| |t#2|)
  (LET (#1=#:G105 (#2=#:G106 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |InnerEvalable;AL|)) (CDR #1#))
          (T
           (SETQ |InnerEvalable;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|InnerEvalable;| #2#)))
                    |InnerEvalable;AL|))
           #1#)))) 

(DEFUN |InnerEvalable;| (|t#1| |t#2|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|Join|
                               (|mkCategory|
                                '(((|eval| ($ $ |t#1| |t#2|)) T)
                                  ((|eval| ($ $ (|List| |t#1|) (|List| |t#2|)))
                                   T))
                                NIL NIL NIL)))
                   |InnerEvalable|)
           (SETELT #1# 0 (LIST '|InnerEvalable| |t#1| |t#2|))))) 
