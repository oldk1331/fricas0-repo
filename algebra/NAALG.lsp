
(/VERSIONCHECK 2) 

(DEFPARAMETER |NonAssociativeAlgebra;CAT| 'NIL) 

(DEFPARAMETER |NonAssociativeAlgebra;AL| 'NIL) 

(DEFUN |NonAssociativeAlgebra| (#1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |NonAssociativeAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |NonAssociativeAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (|NonAssociativeAlgebra;| #1#)))
                       |NonAssociativeAlgebra;AL|))
      #2#)))) 

(DEFUN |NonAssociativeAlgebra;| (|t#1|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|NonAssociativeAlgebra;CAT|)
                                ('T
                                 (LETT |NonAssociativeAlgebra;CAT|
                                       (|Join| (|NonAssociativeRng|)
                                               (|Module| '|t#1|)
                                               (|mkCategory|
                                                '(((|plenaryPower|
                                                    ($ $ (|PositiveInteger|)))
                                                   T))
                                                NIL '((|PositiveInteger|))
                                                NIL))
                                       . #2=(|NonAssociativeAlgebra|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|NonAssociativeAlgebra| (|devaluate| |t#1|))))))) 
