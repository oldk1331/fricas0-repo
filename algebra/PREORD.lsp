
(DEFPARAMETER |Preorder;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Preorder;|)) 

(DEFPARAMETER |Preorder;AL| 'NIL) 

(DEFUN |Preorder| (|t#1|)
  (LET (#1=#:G1 (#2=#:G2 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Preorder;AL|)) (CDR #1#))
          (T
           (SETQ |Preorder;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Preorder;| #2#)))
                            |Preorder;AL|))
           #1#)))) 

(DEFUN |Preorder;| (|t#1|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|Preorder;CAT|)
                                         ('T
                                          (LETT |Preorder;CAT|
                                                (|Join| (|FiniteGraph| '|t#1|)
                                                        (|mkCategory|
                                                         '(((|le|
                                                             ((|Boolean|) %
                                                              |t#1| |t#1|))
                                                            T))
                                                         NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|Preorder| |t#1|))))) 
