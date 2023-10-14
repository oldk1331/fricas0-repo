
(/VERSIONCHECK 2) 

(DEFPARAMETER |TensorProductCategory;CAT| 'NIL) 

(DEFPARAMETER |TensorProductCategory;AL| 'NIL) 

(DEFUN |TensorProductCategory| (&REST #1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |TensorProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |TensorProductCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|TensorProductCategory;| #1#)))
               |TensorProductCategory;AL|))
      #2#)))) 

(DEFUN |TensorProductCategory;| (|t#1| |t#2| |t#3|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2| |t#3|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                            (|devaluate| |t#3|)))
                (COND (|TensorProductCategory;CAT|)
                      ('T
                       (LETT |TensorProductCategory;CAT|
                             (|Join| (|Module| '|t#1|)
                                     (|mkCategory|
                                      '(((|tensor| ($ |t#2| |t#3|)) T)) NIL
                                      'NIL NIL))
                             . #2=(|TensorProductCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|TensorProductCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|) (|devaluate| |t#3|))))))) 
