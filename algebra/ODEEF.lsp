
(/VERSIONCHECK 2) 

(DEFUN |ODEEF;solve;EBoSU;1| (|diffeq| |y| |x| $)
  (SPADCALL
   (SPADCALL (SPADCALL |diffeq| (QREFELT $ 9))
             (SPADCALL |diffeq| (QREFELT $ 10)) (QREFELT $ 11))
   |y| |x| (QREFELT $ 16))) 

(DEFUN |ODEEF;solve;LLSU;2| (|leq| |lop| |x| $)
  (PROG (#1=#:G157 |eq| #2=#:G156)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|ODEEF;solve;LLSU;2|))
        (SEQ (LETT |eq| NIL . #3#) (LETT #1# |leq| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 9))
                                (SPADCALL |eq| (QREFELT $ 10)) (QREFELT $ 11))
                      #2#)
                     . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       |lop| |x| (QREFELT $ 22)))))) 

(DEFUN |ODEEF;solve;EBoELU;3| (|diffeq| |y| |center| |y0| $)
  (SPADCALL
   (SPADCALL (SPADCALL |diffeq| (QREFELT $ 9))
             (SPADCALL |diffeq| (QREFELT $ 10)) (QREFELT $ 11))
   |y| |center| |y0| (QREFELT $ 26))) 

(DEFUN |ODEEF;solve;MSU;4| (|m| |x| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL |m| (MAKEARR1 (QVSIZE |m|) (|spadConstant| $ 28)) |x|
                      (QREFELT $ 31))
            |ODEEF;solve;MSU;4|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCDR (QCDR |u|)))))))))) 

(DEFUN |ODEEF;solve;MVSU;5| (|m| |v| |x| $)
  (PROG (#1=#:G194 |i| #2=#:G193 |rec| |uu| |Lx|)
    (RETURN
     (SEQ
      (LETT |Lx|
            (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                  (SPADCALL |x|
                                                            (QREFELT $ 36)))
            . #3=(|ODEEF;solve;MVSU;5|))
      (LETT |uu|
            (SPADCALL |m| |v|
                      (CONS #'|ODEEF;solve;MVSU;5!0| (VECTOR |Lx| $ |x|))
                      (|compiledLookupCheck| '|solve|
                                             (LIST
                                              (LIST '|Union|
                                                    (LIST '|Record|
                                                          (LIST '|:|
                                                                '|particular|
                                                                (LIST '|Vector|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7))))
                                                          (LIST '|:| '|basis|
                                                                (LIST '|Matrix|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))))
                                                    '"failed")
                                              (LIST '|Matrix|
                                                    (|devaluate| (ELT $ 7)))
                                              (LIST '|Vector|
                                                    (|devaluate| (ELT $ 7)))
                                              (LIST '|Mapping|
                                                    (LIST '|Union|
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|particular|
                                                                      (|devaluate|
                                                                       (ELT $
                                                                            7)))
                                                                (LIST '|:|
                                                                      '|basis|
                                                                      (LIST
                                                                       '|List|
                                                                       (|devaluate|
                                                                        (ELT $
                                                                             7)))))
                                                          '"failed")
                                                    (|devaluate| |Lx|)
                                                    (|devaluate| (ELT $ 7))))
                                             (|SystemODESolver| (ELT $ 7)
                                                                |Lx|)))
            . #3#)
      (EXIT
       (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |rec| (QCDR |uu|) . #3#)
                   (EXIT
                    (CONS 0
                          (CONS (QCAR |rec|)
                                (PROGN
                                 (LETT #2# NIL . #3#)
                                 (SEQ (LETT |i| 1 . #3#)
                                      (LETT #1#
                                            (SPADCALL (QCDR |rec|)
                                                      (QREFELT $ 38))
                                            . #3#)
                                      G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL (QCDR |rec|) |i|
                                                         (QREFELT $ 40))
                                               #2#)
                                              . #3#)))
                                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                      G191 (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |ODEEF;solve;MVSU;5!0| (|z1| |z2| $$)
  (PROG (|x| $ |Lx|)
    (LETT |x| (QREFELT $$ 2) . #1=(|ODEEF;solve;MVSU;5|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |Lx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |z1| |z2| |x|
                (|compiledLookupCheck| '|solve|
                                       (LIST
                                        (LIST '|Union|
                                              (LIST '|Record|
                                                    (LIST '|:| '|particular|
                                                          (|devaluate|
                                                           (ELT $ 7)))
                                                    (LIST '|:| '|basis|
                                                          (LIST '|List|
                                                                (|devaluate|
                                                                 (ELT $ 7)))))
                                              '"failed")
                                        (|devaluate| |Lx|)
                                        (|devaluate| (ELT $ 7))
                                        (LIST '|Symbol|))
                                       (|ElementaryFunctionLODESolver|
                                        (ELT $ 6) (ELT $ 7) |Lx|))))))) 

(DEFUN |ODEEF;solve;FBoELU;6| (|diffeq| |y| |center| |y0| $)
  (PROG (|p| |op| |Lx| |rec| |u| |rc| |ur| |kx| |x| |a|)
    (RETURN
     (SEQ
      (LETT |a| (SPADCALL |center| (QREFELT $ 10))
            . #1=(|ODEEF;solve;FBoELU;6|))
      (LETT |kx|
            (SPADCALL
             (LETT |x|
                   (SPADCALL (SPADCALL |center| (QREFELT $ 9)) (QREFELT $ 41))
                   . #1#)
             (QREFELT $ 43))
            . #1#)
      (LETT |ur| (|ODEEF;parseODE| |diffeq| |y| |x| $) . #1#)
      (EXIT
       (COND
        ((QEQCAR |ur| 1)
         (COND
          ((NULL (EQL (LENGTH |y0|) 1))
           (|error| "solve: more than one initial condition!"))
          ('T
           (SEQ (LETT |rc| (QCDR |ur|) . #1#)
                (LETT |u|
                      (SPADCALL (QCAR |rc|) (QCDR |rc|) |y| |x| (QREFELT $ 46))
                      . #1#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       (#2='T
                        (CONS 0
                              (SPADCALL (QCDR |u|)
                                        (SPADCALL (QCDR |u|)
                                                  (LIST |kx|
                                                        (SPADCALL
                                                         (SPADCALL |y|
                                                                   (SPADCALL
                                                                    |x|
                                                                    (QREFELT $
                                                                             47))
                                                                   (QREFELT $
                                                                            48))
                                                         (QREFELT $ 50)))
                                                  (LIST |a| (|SPADfirst| |y0|))
                                                  (QREFELT $ 53))
                                        (QREFELT $ 11))))))))))
        (#2#
         (SEQ (LETT |rec| (QCDR |ur|) . #1#) (LETT |p| (QCAR |rec|) . #1#)
              (LETT |Lx|
                    (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                          (SPADCALL |x|
                                                                    (QREFELT $
                                                                             36)))
                    . #1#)
              (LETT |op|
                    (SPADCALL (|compiledLookupCheck| '|Zero| (LIST '$) |Lx|))
                    . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |p| (|spadConstant| $ 56) (QREFELT $ 58)))
                     (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL |op|
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 59))
                                              (SPADCALL |p| (QREFELT $ 60))
                                              (|compiledLookupCheck|
                                               '|monomial|
                                               (LIST '$ (|devaluate| (ELT $ 7))
                                                     (LIST
                                                      '|NonNegativeInteger|))
                                               |Lx|))
                                    (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                           |Lx|))
                          . #1#)
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |op| (QCDR |rec|) |x| |a| |y0|
                         (|compiledLookupCheck| '|solve|
                                                (LIST
                                                 (LIST '|Union|
                                                       (|devaluate| (ELT $ 7))
                                                       '"failed")
                                                 (|devaluate| |Lx|)
                                                 (|devaluate| (ELT $ 7))
                                                 (LIST '|Symbol|)
                                                 (|devaluate| (ELT $ 7))
                                                 (LIST '|List|
                                                       (|devaluate|
                                                        (ELT $ 7))))
                                                (|ElementaryFunctionLODESolver|
                                                 (ELT $ 6) (ELT $ 7)
                                                 |Lx|)))))))))))) 

(DEFUN |ODEEF;solve;LLSU;7| (|leq| |lop| |x| $)
  (PROG (|rec| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|ODEEF;parseSYS| |leq| |lop| |x| $)
            . #1=(|ODEEF;solve;LLSU;7|))
      (EXIT
       (COND
        ((QEQCAR |u| 0)
         (SEQ (LETT |rec| (QCDR |u|) . #1#)
              (EXIT (SPADCALL (QCAR |rec|) (QCDR |rec|) |x| (QREFELT $ 31)))))
        ('T (|error| "solve: not a first order linear system")))))))) 

(DEFUN |ODEEF;solve;FBoSU;8| (|diffeq| |y| |x| $)
  (PROG (|uuu| |p| |op| |Lx| |rec| |uu| |rc| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|ODEEF;parseODE| |diffeq| |y| |x| $)
            . #1=(|ODEEF;solve;FBoSU;8|))
      (EXIT
       (COND
        ((QEQCAR |u| 1)
         (SEQ (LETT |rc| (QCDR |u|) . #1#)
              (LETT |uu|
                    (SPADCALL (QCAR |rc|) (QCDR |rc|) |y| |x| (QREFELT $ 46))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |uu| 1) (CONS 2 "failed"))
                     (#2='T (CONS 1 (QCDR |uu|)))))))
        (#2#
         (SEQ (LETT |rec| (QCDR |u|) . #1#) (LETT |p| (QCAR |rec|) . #1#)
              (LETT |Lx|
                    (|LinearOrdinaryDifferentialOperator| (QREFELT $ 7)
                                                          (SPADCALL |x|
                                                                    (QREFELT $
                                                                             36)))
                    . #1#)
              (LETT |op|
                    (SPADCALL (|compiledLookupCheck| '|Zero| (LIST '$) |Lx|))
                    . #1#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |p| (|spadConstant| $ 56) (QREFELT $ 58)))
                     (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL |op|
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 59))
                                              (SPADCALL |p| (QREFELT $ 60))
                                              (|compiledLookupCheck|
                                               '|monomial|
                                               (LIST '$ (|devaluate| (ELT $ 7))
                                                     (LIST
                                                      '|NonNegativeInteger|))
                                               |Lx|))
                                    (|compiledLookupCheck| '+ (LIST '$ '$ '$)
                                                           |Lx|))
                          . #1#)
                    (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 61)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |uuu|
                    (SPADCALL |op| (QCDR |rec|) |x|
                              (|compiledLookupCheck| '|solve|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|Record|
                                                                  (LIST '|:|
                                                                        '|particular|
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              7)))
                                                                  (LIST '|:|
                                                                        '|basis|
                                                                        (LIST
                                                                         '|List|
                                                                         (|devaluate|
                                                                          (ELT
                                                                           $
                                                                           7)))))
                                                            '"failed")
                                                      (|devaluate| |Lx|)
                                                      (|devaluate| (ELT $ 7))
                                                      (LIST '|Symbol|))
                                                     (|ElementaryFunctionLODESolver|
                                                      (ELT $ 6) (ELT $ 7)
                                                      |Lx|)))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |uuu| 1) (CONS 2 "failed"))
                     (#2# (CONS 0 (QCDR |uuu|))))))))))))) 

(DEFUN |ODEEF;parseSYS| (|eqs| |ly| |x| $)
  (PROG (|rec| #1=#:G261 |u| #2=#:G268 |eq| |lk1| #3=#:G267 |f| #4=#:G266 |lk0|
         #5=#:G265 #6=#:G264 |lf| #7=#:G263 |y| #8=#:G262 |xx| |v| |m| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (LETT |n| (LENGTH |eqs|) . #9=(|ODEEF;parseSYS|))
                   (LENGTH |ly|) (QREFELT $ 62))
         (CONS 1 "failed"))
        ('T
         (SEQ
          (LETT |m| (SPADCALL |n| |n| (|spadConstant| $ 28) (QREFELT $ 63))
                . #9#)
          (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 28)) . #9#)
          (LETT |xx| (SPADCALL |x| (QREFELT $ 47)) . #9#)
          (LETT |lf|
                (PROGN
                 (LETT #8# NIL . #9#)
                 (SEQ (LETT |y| NIL . #9#) (LETT #7# |ly| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |y| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (SPADCALL |y| |xx| (QREFELT $ 48)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |lk0|
                (PROGN
                 (LETT #6# NIL . #9#)
                 (SEQ (LETT |f| NIL . #9#) (LETT #5# |lf| . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |f| (QREFELT $ 50)) #6#)
                              . #9#)))
                      (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #9#)
          (LETT |lk1|
                (PROGN
                 (LETT #4# NIL . #9#)
                 (SEQ (LETT |f| NIL . #9#) (LETT #3# |lf| . #9#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |f| |x| (QREFELT $ 64))
                                         (QREFELT $ 50))
                               #4#)
                              . #9#)))
                      (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #9#)
          (SEQ (LETT |eq| NIL . #9#) (LETT #2# |eqs| . #9#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |u| (|ODEEF;parseSYSeq| |eq| |lk0| |lk1| |lf| |x| $)
                      . #9#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #9#) (GO #1#)))
                  ('T
                   (SEQ (LETT |rec| (QCDR |u|) . #9#)
                        (SPADCALL |m| (QVELT |rec| 0) (QVELT |rec| 1)
                                  (QREFELT $ 65))
                        (EXIT
                         (SPADCALL |v| (QVELT |rec| 0) (QVELT |rec| 2)
                                   (QREFELT $ 66))))))))
               (LETT #2# (CDR #2#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 0 (CONS |m| |v|)))))))
      #1# (EXIT #1#))))) 

(DEFUN |ODEEF;parseSYSeq| (|eq| |l0| |l1| |lf| |x| $)
  (PROG (|ci| #1=#:G293 |y| |i| |v| |c| |n| |k| |l| #2=#:G292 #3=#:G291)
    (RETURN
     (SEQ
      (LETT |l|
            (PROGN
             (LETT #3# NIL . #4=(|ODEEF;parseSYSeq|))
             (SEQ (LETT |k| NIL . #4#)
                  (LETT #2#
                        (SPADCALL (SPADCALL |eq| (QREFELT $ 67)) |x|
                                  (QREFELT $ 70))
                        . #4#)
                  G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL |k| '|%diff| (QREFELT $ 71))
                      (LETT #3# (CONS |k| #3#) . #4#)))))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (COND
       ((OR (OR (NULL |l|) (NULL (NULL (CDR |l|))))
            (ZEROP
             (LETT |n|
                   (SPADCALL (LETT |k| (|SPADfirst| |l|) . #4#) |l1|
                             (QREFELT $ 73))
                   . #4#)))
        (EXIT (CONS 1 "failed"))))
      (LETT |c| (|ODEEF;getfreelincoeff1| |eq| |k| |lf| $) . #4#)
      (LETT |eq|
            (SPADCALL |eq|
                      (SPADCALL |c| (SPADCALL |k| (QREFELT $ 74))
                                (QREFELT $ 75))
                      (QREFELT $ 11))
            . #4#)
      (LETT |v| (MAKEARR1 (LENGTH |l0|) (|spadConstant| $ 28)) . #4#)
      (SEQ (LETT |i| 1 . #4#) (LETT |y| NIL . #4#) (LETT #1# |l0| . #4#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #4#) NIL)) (GO G191)))
           (SEQ (LETT |ci| (|ODEEF;getfreelincoeff1| |eq| |y| |lf| $) . #4#)
                (SPADCALL |v| |i|
                          (SPADCALL (SPADCALL |ci| |c| (QREFELT $ 76))
                                    (QREFELT $ 77))
                          (QREFELT $ 66))
                (EXIT
                 (LETT |eq|
                       (SPADCALL |eq|
                                 (SPADCALL |ci| (SPADCALL |y| (QREFELT $ 74))
                                           (QREFELT $ 75))
                                 (QREFELT $ 11))
                       . #4#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #4#)) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (CONS 0 (VECTOR |n| |v| (SPADCALL |eq| (QREFELT $ 77))))))))) 

(DEFUN |ODEEF;parseODE| (|diffeq| |y| |x| $)
  (PROG (|eqrhs| |d| |u| |k| |l| |ny| |c| |f| |i| |n| #1=#:G301 |m| #2=#:G317)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL |y| (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 48))
            . #3=(|ODEEF;parseODE|))
      (LETT |l| (LIST (SPADCALL |f| (QREFELT $ 50))) . #3#) (LETT |n| 2 . #3#)
      (SEQ (LETT |k| NIL . #3#)
           (LETT #2#
                 (SPADCALL (SPADCALL |diffeq| (QREFELT $ 67)) |x|
                           (QREFELT $ 70))
                 . #3#)
           G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |k| '|%diff| (QREFELT $ 71))
               (SEQ (LETT |m| (SPADCALL |k| (QREFELT $ 78)) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |m| |n| (QREFELT $ 79))
                       (LETT |n| |m| . #3#)))))))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |n|
            (PROG1 (LETT #1# (- |n| 2) . #3#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |l|
                   (CONS
                    (SPADCALL
                     (LETT |f| (SPADCALL |f| |x| (QREFELT $ 64)) . #3#)
                     (QREFELT $ 50))
                    |l|)
                   . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |l|) 'NIL)
                    ('T
                     (SPADCALL
                      (LETT |c|
                            (|ODEEF;getlincoeff| |diffeq|
                             (LETT |k| (|SPADfirst| |l|) . #3#) $)
                            . #3#)
                      (QREFELT $ 80)))))
             (GO G191)))
           (SEQ (EXIT (LETT |l| (CDR |l|) . #3#))) NIL (GO G190) G191
           (EXIT NIL))
      (COND
       ((OR (NULL |l|) (NULL (CDR |l|)))
        (EXIT (|error| "parseODE: equation has order 0"))))
      (LETT |diffeq|
            (SPADCALL |diffeq|
                      (SPADCALL |c| (SPADCALL |k| (QREFELT $ 74))
                                (QREFELT $ 75))
                      (QREFELT $ 11))
            . #3#)
      (LETT |ny| (SPADCALL |y| (QREFELT $ 81)) . #3#)
      (LETT |l| (CDR |l|) . #3#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL |k| (QREFELT $ 78)) 3 (QREFELT $ 79))
         (CONS 0
               (|ODEEF;parseLODE| |diffeq| |l|
                (SPADCALL |c| (LENGTH |l|) (QREFELT $ 84)) |ny| $)))
        (#4='T
         (SEQ
          (LETT |u|
                (|ODEEF;getcoeff| |diffeq| (LETT |k| (|SPADfirst| |l|) . #3#)
                 $)
                . #3#)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 (CONS |diffeq| |c|)))
                 (#4#
                  (SEQ
                   (LETT |eqrhs|
                         (SPADCALL
                          (SPADCALL (LETT |d| (QCDR |u|) . #3#)
                                    (SPADCALL |k| (QREFELT $ 74))
                                    (QREFELT $ 75))
                          |diffeq| (QREFELT $ 11))
                         . #3#)
                   (COND
                    ((SPADCALL |eqrhs| |ny| (QREFELT $ 85))
                     (COND
                      ((SPADCALL |c| |ny| (QREFELT $ 85))
                       (COND
                        ((SPADCALL |d| |ny| (QREFELT $ 85))
                         (EXIT
                          (CONS 0
                                (CONS
                                 (SPADCALL (SPADCALL |c| 1 (QREFELT $ 84))
                                           (SPADCALL |d| (QREFELT $ 87))
                                           (QREFELT $ 88))
                                 |eqrhs|)))))))))
                   (EXIT (CONS 1 (CONS |diffeq| |c|))))))))))))))) 

(DEFUN |ODEEF;parseLODE| (|diffeq| |l| |p| |y| $)
  (PROG (|d| #1=#:G320 |c| #2=#:G325 |k|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 59)) |y| (QREFELT $ 85)))
        (|error| "parseLODE: not a linear ordinary differential equation"))
       ('T
        (SEQ
         (LETT |d| (- (SPADCALL |p| (QREFELT $ 60)) 1)
               . #3=(|ODEEF;parseLODE|))
         (SEQ (LETT |k| NIL . #3#) (LETT #2# |l| . #3#) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (LETT |p|
                     (SPADCALL |p|
                               (SPADCALL
                                (LETT |c|
                                      (|ODEEF;getfreelincoeff| |diffeq| |k| |y|
                                       $)
                                      . #3#)
                                (PROG1 (LETT #1# |d| . #3#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 84))
                               (QREFELT $ 88))
                     . #3#)
               (LETT |d| (- |d| 1) . #3#)
               (EXIT
                (LETT |diffeq|
                      (SPADCALL |diffeq|
                                (SPADCALL |c| (SPADCALL |k| (QREFELT $ 74))
                                          (QREFELT $ 75))
                                (QREFELT $ 11))
                      . #3#)))
              (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND
           ((SPADCALL |diffeq| |y| (QREFELT $ 85))
            (CONS |p| (SPADCALL |diffeq| (QREFELT $ 77))))
           ('T
            (|error|
             "parseLODE: not a linear ordinary differential equation"))))))))))) 

(DEFUN |ODEEF;getfreelincoeff| (|f| |k| |y| $)
  (PROG (|c|)
    (RETURN
     (COND
      ((SPADCALL
        (LETT |c| (|ODEEF;getlincoeff| |f| |k| $) |ODEEF;getfreelincoeff|) |y|
        (QREFELT $ 85))
       |c|)
      ('T
       (|error|
        "getfreelincoeff: not a linear ordinary differential equation")))))) 

(DEFUN |ODEEF;getfreelincoeff1| (|f| |k| |ly| $)
  (PROG (#1=#:G329 #2=#:G332 |y| |c|)
    (RETURN
     (SEQ
      (LETT |c| (|ODEEF;getlincoeff| |f| |k| $)
            . #3=(|ODEEF;getfreelincoeff1|))
      (SEQ
       (EXIT
        (SEQ (LETT |y| NIL . #3#) (LETT #2# |ly| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL (SPADCALL |c| |y| (QREFELT $ 89)))
                 (PROGN
                  (LETT #1#
                        (|error|
                         "getfreelincoeff: not a linear ordinary differential equation")
                        . #3#)
                  (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL)))
       #1# (EXIT #1#))
      (EXIT |c|))))) 

(DEFUN |ODEEF;getlincoeff| (|f| |k| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (|ODEEF;getcoeff| |f| |k| $) |ODEEF;getlincoeff|)
          (EXIT
           (COND
            ((QEQCAR |u| 1)
             (|error|
              "getlincoeff: not an appropriate ordinary differential equation"))
            ('T (QCDR |u|)))))))) 

(DEFUN |ODEEF;getcoeff| (|f| |k| $)
  (PROG (#1=#:G346 |p| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r|
               (SPADCALL
                (SPADCALL (SPADCALL |f| (QREFELT $ 91)) |k| (QREFELT $ 94))
                (QREFELT $ 97))
               . #2=(|ODEEF;getcoeff|))
         (EXIT
          (COND
           ((OR (QEQCAR |r| 1)
                (SPADCALL
                 (SPADCALL
                  (LETT |p|
                        (SPADCALL (SPADCALL |f| (QREFELT $ 98)) |k|
                                  (QREFELT $ 94))
                        . #2#)
                  (QREFELT $ 99))
                 1 (QREFELT $ 79)))
            (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#))))))
        (EXIT
         (CONS 0
               (SPADCALL (SPADCALL |p| 1 (QREFELT $ 100)) (QCDR |r|)
                         (QREFELT $ 101))))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionODESolver;|)) 

(DEFUN |ElementaryFunctionODESolver| (&REST #1=#:G348)
  (PROG ()
    (RETURN
     (PROG (#2=#:G349)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionODESolver|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionODESolver|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryFunctionODESolver;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionODESolver|))))))))))) 

(DEFUN |ElementaryFunctionODESolver;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionODESolver|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionODESolver| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 102) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionODESolver|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ElementaryFunctionODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Equation| 7) (0 . |lhs|) (5 . |rhs|) (10 . -)
              (|Record| (|:| |particular| 7) (|:| |basis| 20))
              (|Union| 12 7 '"failed") (|BasicOperator|) (|Symbol|)
              |ODEEF;solve;FBoSU;8| |ODEEF;solve;EBoSU;1|
              (|Record| (|:| |particular| 30) (|:| |basis| (|List| 30)))
              (|Union| 18 '"failed") (|List| 7) (|List| 14)
              |ODEEF;solve;LLSU;7| (|List| 8) |ODEEF;solve;LLSU;2|
              (|Union| 7 '"failed") |ODEEF;solve;FBoELU;6|
              |ODEEF;solve;EBoELU;3| (16 . |Zero|) (|Matrix| 7) (|Vector| 7)
              |ODEEF;solve;MVSU;5| (|Union| (|List| 30) '"failed")
              |ODEEF;solve;MSU;4| (|Mapping| 7 7) (|ODEIntegration| 6 7)
              (20 . |diff|) (|NonNegativeInteger|) (25 . |ncols|) (|Integer|)
              (30 . |column|) (36 . |retract|) (|Kernel| 7) (41 . |kernel|)
              (46 . |One|) (|NonLinearFirstOrderODESolver| 6 7) (50 . |solve|)
              (58 . |coerce|) (63 . |elt|) (|Kernel| $) (69 . |retract|)
              (|List| 49) (|List| $) (74 . |eval|) (81 . |Zero|)
              (|SparseUnivariatePolynomial| 7) (85 . |Zero|) (|Boolean|)
              (89 . ~=) (95 . |leadingCoefficient|) (100 . |degree|)
              (105 . |reductum|) (110 . ~=) (116 . |new|)
              (123 . |differentiate|) (129 . |setRow!|) (136 . |setelt|)
              (143 . |kernels|) (|List| 42) (|IntegrationTools| 6 7)
              (148 . |varselect|) (154 . |is?|) (160 . |first|)
              (165 . |position|) (171 . |coerce|) (176 . *) (182 . /) (188 . -)
              (193 . |height|) (198 . >) (204 . |zero?|) (209 . |name|)
              (|OutputForm|) (214 . |height|) (218 . |monomial|)
              (224 . |freeOf?|) (230 . |One|) (234 . |coerce|) (239 . +)
              (245 . |freeOf?|) (|SparseMultivariatePolynomial| 6 49)
              (251 . |denom|) (|SparseUnivariatePolynomial| $)
              (|SparseMultivariatePolynomial| 6 42) (256 . |univariate|)
              (|Union| 93 '"failed") (|SparseUnivariatePolynomial| 93)
              (262 . |retractIfCan|) (267 . |numer|) (272 . |degree|)
              (277 . |coefficient|) (283 . /))
           '#(|solve| 289) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 101
                                                 '(1 8 7 0 9 1 8 7 0 10 2 7 0 0
                                                   0 11 0 7 0 28 1 35 34 15 36
                                                   1 29 37 0 38 2 29 30 0 39 40
                                                   1 7 15 0 41 1 42 0 15 43 0 6
                                                   0 44 4 45 25 7 7 14 15 46 1
                                                   7 0 15 47 2 7 0 14 0 48 1 7
                                                   49 0 50 3 7 0 0 51 52 53 0 6
                                                   0 54 0 55 0 56 2 55 57 0 0
                                                   58 1 55 7 0 59 1 55 37 0 60
                                                   1 55 0 0 61 2 37 57 0 0 62 3
                                                   29 0 37 37 7 63 2 7 0 0 15
                                                   64 3 29 0 0 39 30 65 3 30 7
                                                   0 39 7 66 1 7 51 0 67 2 69
                                                   68 68 15 70 2 42 57 0 15 71
                                                   1 68 42 0 72 2 68 39 42 0 73
                                                   1 7 0 49 74 2 7 0 0 0 75 2 7
                                                   0 0 0 76 1 7 0 0 77 1 42 37
                                                   0 78 2 37 57 0 0 79 1 7 57 0
                                                   80 1 14 15 0 81 0 82 39 83 2
                                                   55 0 7 37 84 2 7 57 0 15 85
                                                   0 7 0 86 1 55 0 7 87 2 55 0
                                                   0 0 88 2 7 57 0 0 89 1 7 90
                                                   0 91 2 93 92 0 42 94 1 96 95
                                                   0 97 1 7 90 0 98 1 96 37 0
                                                   99 2 96 93 0 37 100 2 7 0 90
                                                   90 101 2 0 32 29 15 33 3 0
                                                   19 29 30 15 31 3 0 19 20 21
                                                   15 22 3 0 19 23 21 15 24 3 0
                                                   13 7 14 15 16 3 0 13 8 14 15
                                                   17 4 0 25 7 14 8 20 26 4 0
                                                   25 8 14 8 20 27)))))
           '|lookupComplete|)) 
