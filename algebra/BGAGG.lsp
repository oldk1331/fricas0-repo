
(/VERSIONCHECK 2) 

(DEFPARAMETER |BagAggregate;CAT| 'NIL) 

(DEFPARAMETER |BagAggregate;AL| 'NIL) 

(DEFUN |BagAggregate| (#1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BagAggregate;AL|)) (CDR #2#))
     (T
      (SETQ |BagAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|BagAggregate;| #1#)))
                       |BagAggregate;AL|))
      #2#)))) 

(DEFUN |BagAggregate;| (|t#1|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|BagAggregate;CAT|)
                                ('T
                                 (LETT |BagAggregate;CAT|
                                       (|Join| (|HomogeneousAggregate| '|t#1|)
                                               (|shallowlyMutable|)
                                               (|mkCategory|
                                                '(((|bag| ($ (|List| |t#1|)))
                                                   T)
                                                  ((|extract!| (|t#1| $)) T)
                                                  ((|insert!| ($ |t#1| $)) T)
                                                  ((|inspect| (|t#1| $)) T))
                                                NIL '((|List| |t#1|)) NIL))
                                       . #2=(|BagAggregate|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|BagAggregate| (|devaluate| |t#1|))))))) 
