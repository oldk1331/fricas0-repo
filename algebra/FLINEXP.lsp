
(/VERSIONCHECK 2) 

(DEFPARAMETER |FullyLinearlyExplicitRingOver;CAT| 'NIL) 

(DEFPARAMETER |FullyLinearlyExplicitRingOver;AL| 'NIL) 

(DEFUN |FullyLinearlyExplicitRingOver| (#1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |FullyLinearlyExplicitRingOver;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyLinearlyExplicitRingOver;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|FullyLinearlyExplicitRingOver;| #1#)))
               |FullyLinearlyExplicitRingOver;AL|))
      #2#)))) 

(DEFUN |FullyLinearlyExplicitRingOver;| (|t#1|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|FullyLinearlyExplicitRingOver;CAT|)
                                ('T
                                 (LETT |FullyLinearlyExplicitRingOver;CAT|
                                       (|Join|
                                        (|LinearlyExplicitRingOver| '|t#1|)
                                        (|mkCategory| NIL
                                                      '(((|LinearlyExplicitRingOver|
                                                          (|Integer|))
                                                         (|has| |t#1|
                                                                (|LinearlyExplicitRingOver|
                                                                 (|Integer|)))))
                                                      'NIL NIL))
                                       . #2=(|FullyLinearlyExplicitRingOver|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|FullyLinearlyExplicitRingOver| (|devaluate| |t#1|))))))) 
