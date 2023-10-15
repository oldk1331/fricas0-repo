
(DEFPARAMETER |Preorder;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Preorder;|)) 

(DEFPARAMETER |Preorder;AL| 'NIL) 

(DEFUN |Preorder| (#1=#:G105)
  (LET (#2=#:G106)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Preorder;AL|)) (CDR #2#))
          (T
           (SETQ |Preorder;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Preorder;| #1#)))
                            |Preorder;AL|))
           #2#)))) 

(DEFUN |Preorder;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Preorder;CAT|)
                                    ('T
                                     (LETT |Preorder;CAT|
                                           (|Join| (|FiniteGraph| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|le|
                                                        ((|Boolean|) $
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)))
                                                       T))
                                                    NIL
                                                    '((|Boolean|)
                                                      (|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|Preorder|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Preorder| (|devaluate| |t#1|)))))) 
