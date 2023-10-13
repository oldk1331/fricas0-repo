
(/VERSIONCHECK 2) 

(DEFPARAMETER |FullyRetractableTo;CAT| 'NIL) 

(DEFPARAMETER |FullyRetractableTo;AL| 'NIL) 

(DEFUN |FullyRetractableTo| (#1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FullyRetractableTo;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyRetractableTo;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FullyRetractableTo;| #1#)))
                       |FullyRetractableTo;AL|))
      #2#)))) 

(DEFUN |FullyRetractableTo;| (|t#1|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|FullyRetractableTo;CAT|)
                                ('T
                                 (LETT |FullyRetractableTo;CAT|
                                       (|Join| (|RetractableTo| '|t#1|)
                                               (|mkCategory| NIL
                                                             '(((|RetractableTo|
                                                                 (|Integer|))
                                                                (|has| |t#1|
                                                                       (|RetractableTo|
                                                                        (|Integer|))))
                                                               ((|RetractableTo|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                                (|has| |t#1|
                                                                       (|RetractableTo|
                                                                        (|Fraction|
                                                                         (|Integer|))))))
                                                             'NIL NIL))
                                       . #2=(|FullyRetractableTo|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|FullyRetractableTo| (|devaluate| |t#1|))))))) 
