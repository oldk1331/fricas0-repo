
(DEFPARAMETER |BinaryRecursiveAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BinaryRecursiveAggregate;|)) 

(DEFPARAMETER |BinaryRecursiveAggregate;AL| 'NIL) 

(DEFUN |BinaryRecursiveAggregate| (|t#1|)
  (LET (#1=#:G135 (#2=#:G136 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |BinaryRecursiveAggregate;AL|)) (CDR #1#))
          (T
           (SETQ |BinaryRecursiveAggregate;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|BinaryRecursiveAggregate;| #2#)))
                    |BinaryRecursiveAggregate;AL|))
           #1#)))) 

(DEFUN |BinaryRecursiveAggregate;| (|t#1|)
  (SPROG ((#1=#:G134 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
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
                                               ((|setelt!| ($ $ "left" $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setleft!| ($ $ $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setelt!| ($ $ "right" $))
                                                (|has| $ (|shallowlyMutable|)))
                                               ((|setright!| ($ $ $))
                                                (|has| $
                                                       (|shallowlyMutable|))))
                                             NIL NIL NIL))
                                           . #2=(|BinaryRecursiveAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|BinaryRecursiveAggregate| |t#1|))))) 
