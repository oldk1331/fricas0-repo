
(/VERSIONCHECK 2) 

(DEFPARAMETER |BinaryTreeCategory;CAT| 'NIL) 

(DEFPARAMETER |BinaryTreeCategory;AL| 'NIL) 

(DEFUN |BinaryTreeCategory| (#1=#:G130)
  (LET (#2=#:G131)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BinaryTreeCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |BinaryTreeCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|BinaryTreeCategory;| #1#)))
                       |BinaryTreeCategory;AL|))
      #2#)))) 

(DEFUN |BinaryTreeCategory;| (|t#1|)
  (PROG (#1=#:G129)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|BinaryTreeCategory;CAT|)
                                ('T
                                 (LETT |BinaryTreeCategory;CAT|
                                       (|Join|
                                        (|BinaryRecursiveAggregate| '|t#1|)
                                        (|shallowlyMutable|)
                                        (|finiteAggregate|)
                                        (|mkCategory|
                                         '(((|node| ($ $ |t#1| $)) T)) NIL 'NIL
                                         NIL))
                                       . #2=(|BinaryTreeCategory|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|BinaryTreeCategory| (|devaluate| |t#1|))))))) 
