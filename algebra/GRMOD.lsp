
(/VERSIONCHECK 2) 

(DEFPARAMETER |GradedModule;CAT| 'NIL) 

(DEFPARAMETER |GradedModule;AL| 'NIL) 

(DEFUN |GradedModule| (&REST #1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |GradedModule;AL|))
      (CDR #2#))
     (T
      (SETQ |GradedModule;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|GradedModule;| #1#)))
                       |GradedModule;AL|))
      #2#)))) 

(DEFUN |GradedModule;| (|t#1| |t#2|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (COND (|GradedModule;CAT|)
                      ('T
                       (LETT |GradedModule;CAT|
                             (|Join| (|SetCategory|)
                                     (|mkCategory|
                                      '(((|degree| (|t#2| $)) T)
                                        ((|Zero| ($) |constant|) T)
                                        ((* ($ |t#1| $)) T) ((* ($ $ |t#1|)) T)
                                        ((- ($ $)) T) ((+ ($ $ $)) T)
                                        ((- ($ $ $)) T))
                                      NIL 'NIL NIL))
                             . #2=(|GradedModule|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|GradedModule| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
