
(DEFPARAMETER |BinaryRecursiveAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BinaryRecursiveAggregate;|)) 

(DEFPARAMETER |BinaryRecursiveAggregate;AL| 'NIL) 

(DEFUN |BinaryRecursiveAggregate| (#1=#:G133)
  (LET (#2=#:G134)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BinaryRecursiveAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |BinaryRecursiveAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|BinaryRecursiveAggregate;| #1#)))
                       |BinaryRecursiveAggregate;AL|))
      #2#)))) 

(DEFUN |BinaryRecursiveAggregate;| (|t#1|)
  (SPROG ((#1=#:G132 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|BinaryRecursiveAggregate;CAT|)
                                    ('T
                                     (LETT |BinaryRecursiveAggregate;CAT|
                                           (|Join|
                                            (|RecursiveAggregate| '|t#1|)
                                            (|mkCategory|
                                             '(((|left| ($ $)) T)
                                               ((|elt| ($ $ "left")) T)
                                               ((|right| ($ $)) T)
                                               ((|elt| ($ $ "right")) T)
                                               ((|setelt| ($ $ "left" $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setleft!| ($ $ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt| ($ $ "right" $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setright!| ($ $ $))
                                                (|has| $
                                                       (|shallowlyMutable|))))
                                             NIL 'NIL NIL))
                                           . #2=(|BinaryRecursiveAggregate|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|BinaryRecursiveAggregate| (|devaluate| |t#1|)))))) 
