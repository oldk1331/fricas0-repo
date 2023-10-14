
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |AbelianProductCategory;|)) 

(DEFPARAMETER |AbelianProductCategory;AL| 'NIL) 

(DEFUN |AbelianProductCategory| (#1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |AbelianProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |AbelianProductCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|AbelianProductCategory;| #1#)))
                       |AbelianProductCategory;AL|))
      #2#)))) 

(DEFUN |AbelianProductCategory;| (|t#1|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (|Join|
                           (|mkCategory| NIL
                                         '(((|AbelianMonoid|)
                                            (|has| |t#1| (|AbelianMonoid|)))
                                           ((|CancellationAbelianMonoid|)
                                            (|has| |t#1|
                                                   (|CancellationAbelianMonoid|)))
                                           ((|AbelianGroup|)
                                            (|has| |t#1| (|AbelianGroup|))))
                                         'NIL NIL)))
               |AbelianProductCategory|)
       (SETELT #1# 0 (LIST '|AbelianProductCategory| (|devaluate| |t#1|))))))) 
