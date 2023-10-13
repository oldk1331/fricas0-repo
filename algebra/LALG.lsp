
(/VERSIONCHECK 2) 

(DEFPARAMETER |LeftAlgebra;CAT| 'NIL) 

(DEFPARAMETER |LeftAlgebra;AL| 'NIL) 

(DEFUN |LeftAlgebra| (#1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LeftAlgebra;AL|)) (CDR #2#))
     (T
      (SETQ |LeftAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LeftAlgebra;| #1#)))
                       |LeftAlgebra;AL|))
      #2#)))) 

(DEFUN |LeftAlgebra;| (|t#1|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|LeftAlgebra;CAT|)
                                ('T
                                 (LETT |LeftAlgebra;CAT|
                                       (|Join| (|Ring|) (|LeftModule| '|t#1|)
                                               (|mkCategory|
                                                '(((|coerce| ($ |t#1|)) T)) NIL
                                                'NIL NIL))
                                       . #2=(|LeftAlgebra|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|LeftAlgebra| (|devaluate| |t#1|))))))) 
