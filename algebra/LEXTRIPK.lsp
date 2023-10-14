
(/VERSIONCHECK 2) 

(DEFUN |LEXTRIPK;trueVariables| (|lp| $)
  (PROG (|truels| #1=#:G121 #2=#:G127 |s| |lv|)
    (RETURN
     (SEQ
      (LETT |lv| (SPADCALL (SPADCALL |lp| (QREFELT $ 10)) (QREFELT $ 12))
            . #3=(|LEXTRIPK;trueVariables|))
      (LETT |truels| NIL . #3#)
      (SEQ (LETT |s| NIL . #3#) (LETT #2# (QREFELT $ 7) . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL
                (PROG2 (LETT #1# (SPADCALL |s| (QREFELT $ 16)) . #3#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0)
                                 (|OrderedVariableList| (QREFELT $ 7)) #1#))
                |lv| (QREFELT $ 18))
               (LETT |truels| (CONS |s| |truels|) . #3#)))))
           (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (REVERSE |truels|)))))) 

(DEFUN |LEXTRIPK;zeroDimensional?;LB;2| (|lp| $)
  (PROG (|lq1| #1=#:G132 |p| #2=#:G131 |fglmpack| |truels|)
    (RETURN
     (SEQ
      (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
            . #3=(|LEXTRIPK;zeroDimensional?;LB;2|))
      (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #3#)
      (LETT |lq1|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 21)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT
       (SPADCALL |lq1|
                 (|compiledLookupCheck| '|zeroDimensional?|
                                        (LIST (LIST '|Boolean|)
                                              (LIST '|List|
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT $ 6)))))
                                        |fglmpack|))))))) 

(DEFUN |LEXTRIPK;fglmIfCan;LU;3| (|lp| $)
  (PROG (#1=#:G150 |q1| #2=#:G149 #3=#:G146 |foo| |lq1| #4=#:G148 |p| #5=#:G147
         |fglmpack| |truels|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
              . #6=(|LEXTRIPK;fglmIfCan;LU;3|))
        (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #6#)
        (LETT |lq1|
              (PROGN
               (LETT #5# NIL . #6#)
               (SEQ (LETT |p| NIL . #6#) (LETT #4# |lp| . #6#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #5# (CONS (SPADCALL |p| (QREFELT $ 21)) #5#)
                            . #6#)))
                    (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #6#)
        (LETT |foo|
              (SPADCALL |lq1|
                        (|compiledLookupCheck| '|fglmIfCan|
                                               (LIST
                                                (LIST '|Union|
                                                      (LIST '|List|
                                                            (LIST '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT $ 6))))
                                                      '"failed")
                                                (LIST '|List|
                                                      (LIST '|Polynomial|
                                                            (|devaluate|
                                                             (ELT $ 6)))))
                                               |fglmpack|))
              . #6#)
        (EXIT
         (COND
          ((QEQCAR |foo| 1)
           (PROGN (LETT #3# (CONS 1 "failed") . #6#) (GO #3#)))
          ('T
           (SEQ
            (LETT |lp|
                  (PROGN
                   (LETT #2# NIL . #6#)
                   (SEQ (LETT |q1| NIL . #6#) (LETT #1# (QCDR |foo|) . #6#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |q1| (CAR #1#) . #6#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |q1| (QREFELT $ 23)) #2#)
                                . #6#)))
                        (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  . #6#)
            (EXIT (CONS 0 |lp|))))))))
      #3# (EXIT #3#))))) 

(DEFUN |LEXTRIPK;groebner;2L;4| (|lp| $)
  (PROG (#1=#:G158 |q1| #2=#:G157 |lq1| #3=#:G156 |p| #4=#:G155 |fglmpack|
         |truels|)
    (RETURN
     (SEQ
      (LETT |truels| (|LEXTRIPK;trueVariables| |lp| $)
            . #5=(|LEXTRIPK;groebner;2L;4|))
      (LETT |fglmpack| (|FGLMIfCanPackage| (QREFELT $ 6) |truels|) . #5#)
      (LETT |lq1|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |p| NIL . #5#) (LETT #3# |lp| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |p| (QREFELT $ 21)) #4#) . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |lq1|
            (SPADCALL |lq1|
                      (|compiledLookupCheck| '|groebner|
                                             (LIST
                                              (LIST '|List|
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT $ 6))))
                                              (LIST '|List|
                                                    (LIST '|Polynomial|
                                                          (|devaluate|
                                                           (ELT $ 6)))))
                                             |fglmpack|))
            . #5#)
      (EXIT
       (LETT |lp|
             (PROGN
              (LETT #2# NIL . #5#)
              (SEQ (LETT |q1| NIL . #5#) (LETT #1# |lq1| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |q1| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (SPADCALL |q1| (QREFELT $ 23)) #2#)
                           . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #2#))))
             . #5#)))))) 

(DEFUN |LEXTRIPK;lexTriangular;LBL;5| (|base| |norm?| $)
  (PROG (|toSee| #1=#:G186 |us| |newlp| |lus| |newp| |b| |lbwt| |bwt| |v| |lp|
         |p| |toSave| |ts| |lpwt|)
    (RETURN
     (SEQ
      (LETT |base| (SPADCALL (ELT $ 27) |base| (QREFELT $ 29))
            . #2=(|LEXTRIPK;lexTriangular;LBL;5|))
      (LETT |base| (SPADCALL (ELT $ 30) |base| (QREFELT $ 32)) . #2#)
      (EXIT
       (COND ((SPADCALL (ELT $ 33) |base| (QREFELT $ 34)) NIL)
             ('T
              (SEQ (LETT |ts| (SPADCALL (QREFELT $ 36)) . #2#)
                   (LETT |toSee| (LIST (CONS |base| |ts|)) . #2#)
                   (LETT |toSave| NIL . #2#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #2#)
                             (LETT |toSee| (CDR |toSee|) . #2#)
                             (LETT |lp| (QCAR |lpwt|) . #2#)
                             (LETT |ts| (QCDR |lpwt|) . #2#)
                             (EXIT
                              (COND
                               ((NULL |lp|)
                                (LETT |toSave| (CONS |ts| |toSave|) . #2#))
                               ('T
                                (SEQ (LETT |p| (|SPADfirst| |lp|) . #2#)
                                     (LETT |lp| (CDR |lp|) . #2#)
                                     (LETT |v| (SPADCALL |p| (QREFELT $ 37))
                                           . #2#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |v| |ts| (QREFELT $ 38))
                                        (|error|
                                         "lexTriangular$LEXTRIPK: should never happen !"))
                                       ('T
                                        (SEQ
                                         (COND
                                          (|norm?|
                                           (COND
                                            ((SPADCALL
                                              (QVELT
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 39))
                                                |ts| (QREFELT $ 41))
                                               1)
                                              (QREFELT $ 30))
                                             (EXIT
                                              (LETT |toSee|
                                                    (CONS (CONS |lp| |ts|)
                                                          |toSee|)
                                                    . #2#))))))
                                         (COND
                                          ((NULL |norm?|)
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |p| (QREFELT $ 39))
                                               |ts| (QREFELT $ 42))
                                              (QREFELT $ 30))
                                             (EXIT
                                              (LETT |toSee|
                                                    (CONS (CONS |lp| |ts|)
                                                          |toSee|)
                                                    . #2#))))))
                                         (LETT |lbwt|
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 39))
                                                |ts| (QREFELT $ 45))
                                               . #2#)
                                         (EXIT
                                          (SEQ G190
                                               (COND
                                                ((NULL
                                                  (COND ((NULL |lbwt|) 'NIL)
                                                        ('T 'T)))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |bwt|
                                                      (|SPADfirst| |lbwt|)
                                                      . #2#)
                                                (LETT |lbwt| (CDR |lbwt|)
                                                      . #2#)
                                                (LETT |b| (QCAR |bwt|) . #2#)
                                                (LETT |us| (QCDR |bwt|) . #2#)
                                                (EXIT
                                                 (COND
                                                  (|b|
                                                   (SEQ
                                                    (COND
                                                     (|norm?|
                                                      (SEQ
                                                       (LETT |newp|
                                                             (SPADCALL |p| |us|
                                                                       (QREFELT
                                                                        $ 47))
                                                             . #2#)
                                                       (EXIT
                                                        (LETT |lus|
                                                              (LIST
                                                               (SPADCALL |newp|
                                                                         |us|
                                                                         (QREFELT
                                                                          $
                                                                          48)))
                                                              . #2#))))
                                                     ('T
                                                      (SEQ
                                                       (LETT |newp| |p| . #2#)
                                                       (EXIT
                                                        (LETT |lus|
                                                              (SPADCALL |newp|
                                                                        |us|
                                                                        (QREFELT
                                                                         $ 50))
                                                              . #2#)))))
                                                    (LETT |newlp| |lp| . #2#)
                                                    (SEQ G190
                                                         (COND
                                                          ((NULL
                                                            (COND
                                                             ((NULL |newlp|)
                                                              'NIL)
                                                             ('T
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|SPADfirst|
                                                                 |newlp|)
                                                                (QREFELT $ 37))
                                                               |v|
                                                               (QREFELT $
                                                                        51)))))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT |newlp|
                                                                 (CDR |newlp|)
                                                                 . #2#)))
                                                         NIL (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (SEQ (LETT |us| NIL . #2#)
                                                          (LETT #1# |lus|
                                                                . #2#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #1#)
                                                                (PROGN
                                                                 (LETT |us|
                                                                       (CAR
                                                                        #1#)
                                                                       . #2#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT |toSee|
                                                                  (CONS
                                                                   (CONS
                                                                    |newlp|
                                                                    |us|)
                                                                   |toSee|)
                                                                  . #2#)))
                                                          (LETT #1# (CDR #1#)
                                                                . #2#)
                                                          (GO G190) G191
                                                          (EXIT NIL)))))
                                                  ('T
                                                   (LETT |toSee|
                                                         (CONS (CONS |lp| |us|)
                                                               |toSee|)
                                                         . #2#)))))
                                               NIL (GO G190) G191
                                               (EXIT NIL))))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |toSave| (QREFELT $ 54))))))))))) 

(DEFUN |LEXTRIPK;zeroSetSplit;LBL;6| (|lp| |norm?| $)
  (PROG (|bar|)
    (RETURN
     (SEQ
      (LETT |bar| (SPADCALL |lp| (QREFELT $ 25)) |LEXTRIPK;zeroSetSplit;LBL;6|)
      (EXIT
       (COND
        ((QEQCAR |bar| 1)
         (|error| "zeroSetSplit$LEXTRIPK: #1 not zero-dimensional"))
        ('T (SPADCALL (QCDR |bar|) |norm?| (QREFELT $ 55))))))))) 

(DEFUN |LEXTRIPK;squareFreeLexTriangular;LBL;7| (|base| |norm?| $)
  (PROG (|toSee| #1=#:G218 |us| |newlp| |lus| |newp| |b| |lbwt| |bwt| |v| |lp|
         |p| |toSave| |ts| |lpwt|)
    (RETURN
     (SEQ
      (LETT |base| (SPADCALL (ELT $ 27) |base| (QREFELT $ 29))
            . #2=(|LEXTRIPK;squareFreeLexTriangular;LBL;7|))
      (LETT |base| (SPADCALL (ELT $ 30) |base| (QREFELT $ 32)) . #2#)
      (EXIT
       (COND ((SPADCALL (ELT $ 33) |base| (QREFELT $ 34)) NIL)
             ('T
              (SEQ (LETT |ts| (SPADCALL (QREFELT $ 58)) . #2#)
                   (LETT |toSee| (LIST (CONS |base| |ts|)) . #2#)
                   (LETT |toSave| NIL . #2#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #2#)
                             (LETT |toSee| (CDR |toSee|) . #2#)
                             (LETT |lp| (QCAR |lpwt|) . #2#)
                             (LETT |ts| (QCDR |lpwt|) . #2#)
                             (EXIT
                              (COND
                               ((NULL |lp|)
                                (LETT |toSave| (CONS |ts| |toSave|) . #2#))
                               ('T
                                (SEQ (LETT |p| (|SPADfirst| |lp|) . #2#)
                                     (LETT |lp| (CDR |lp|) . #2#)
                                     (LETT |v| (SPADCALL |p| (QREFELT $ 37))
                                           . #2#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |v| |ts| (QREFELT $ 59))
                                        (|error|
                                         "lexTriangular$LEXTRIPK: should never happen !"))
                                       ('T
                                        (SEQ
                                         (COND
                                          (|norm?|
                                           (COND
                                            ((SPADCALL
                                              (QVELT
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 39))
                                                |ts| (QREFELT $ 60))
                                               1)
                                              (QREFELT $ 30))
                                             (EXIT
                                              (LETT |toSee|
                                                    (CONS (CONS |lp| |ts|)
                                                          |toSee|)
                                                    . #2#))))))
                                         (COND
                                          ((NULL |norm?|)
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL
                                               (SPADCALL |p| (QREFELT $ 39))
                                               |ts| (QREFELT $ 61))
                                              (QREFELT $ 30))
                                             (EXIT
                                              (LETT |toSee|
                                                    (CONS (CONS |lp| |ts|)
                                                          |toSee|)
                                                    . #2#))))))
                                         (LETT |lbwt|
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT $ 39))
                                                |ts| (QREFELT $ 62))
                                               . #2#)
                                         (EXIT
                                          (SEQ G190
                                               (COND
                                                ((NULL
                                                  (COND ((NULL |lbwt|) 'NIL)
                                                        ('T 'T)))
                                                 (GO G191)))
                                               (SEQ
                                                (LETT |bwt|
                                                      (|SPADfirst| |lbwt|)
                                                      . #2#)
                                                (LETT |lbwt| (CDR |lbwt|)
                                                      . #2#)
                                                (LETT |b| (QCAR |bwt|) . #2#)
                                                (LETT |us| (QCDR |bwt|) . #2#)
                                                (EXIT
                                                 (COND
                                                  (|b|
                                                   (SEQ
                                                    (COND
                                                     (|norm?|
                                                      (SEQ
                                                       (LETT |newp|
                                                             (SPADCALL |p| |us|
                                                                       (QREFELT
                                                                        $ 64))
                                                             . #2#)
                                                       (EXIT
                                                        (LETT |lus|
                                                              (SPADCALL |newp|
                                                                        |us|
                                                                        (QREFELT
                                                                         $ 65))
                                                              . #2#))))
                                                     ('T
                                                      (LETT |lus|
                                                            (SPADCALL |p| |us|
                                                                      (QREFELT
                                                                       $ 65))
                                                            . #2#)))
                                                    (LETT |newlp| |lp| . #2#)
                                                    (SEQ G190
                                                         (COND
                                                          ((NULL
                                                            (COND
                                                             ((NULL |newlp|)
                                                              'NIL)
                                                             ('T
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (|SPADfirst|
                                                                 |newlp|)
                                                                (QREFELT $ 37))
                                                               |v|
                                                               (QREFELT $
                                                                        51)))))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT |newlp|
                                                                 (CDR |newlp|)
                                                                 . #2#)))
                                                         NIL (GO G190) G191
                                                         (EXIT NIL))
                                                    (EXIT
                                                     (SEQ (LETT |us| NIL . #2#)
                                                          (LETT #1# |lus|
                                                                . #2#)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #1#)
                                                                (PROGN
                                                                 (LETT |us|
                                                                       (CAR
                                                                        #1#)
                                                                       . #2#)
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT |toSee|
                                                                  (CONS
                                                                   (CONS
                                                                    |newlp|
                                                                    |us|)
                                                                   |toSee|)
                                                                  . #2#)))
                                                          (LETT #1# (CDR #1#)
                                                                . #2#)
                                                          (GO G190) G191
                                                          (EXIT NIL)))))
                                                  ('T
                                                   (LETT |toSee|
                                                         (CONS (CONS |lp| |us|)
                                                               |toSee|)
                                                         . #2#)))))
                                               NIL (GO G190) G191
                                               (EXIT NIL))))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |toSave| (QREFELT $ 68))))))))))) 

(DEFUN |LEXTRIPK;zeroSetSplit;LBL;8| (|lp| |norm?| $)
  (PROG (|bar|)
    (RETURN
     (SEQ
      (LETT |bar| (SPADCALL |lp| (QREFELT $ 25)) |LEXTRIPK;zeroSetSplit;LBL;8|)
      (EXIT
       (COND
        ((QEQCAR |bar| 1)
         (|error| "zeroSetSplit$LEXTRIPK: #1 not zero-dimensional"))
        ('T (SPADCALL (QCDR |bar|) |norm?| (QREFELT $ 69))))))))) 

(DECLAIM (NOTINLINE |LexTriangularPackage;|)) 

(DEFUN |LexTriangularPackage| (&REST #1=#:G224)
  (PROG ()
    (RETURN
     (PROG (#2=#:G225)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LexTriangularPackage|)
                                           '|domainEqualList|)
                . #3=(|LexTriangularPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LexTriangularPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|LexTriangularPackage|))))))))))) 

(DEFUN |LexTriangularPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LexTriangularPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LexTriangularPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 71) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|LexTriangularPackage| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LexTriangularPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 20)
              (|GeneralPolynomialSet| 6 (|IndexedExponents| 15) 15 20)
              (0 . |construct|) (|List| 15) (5 . |variables|)
              (|Union| $ '"failed") (|Symbol|) (|OrderedVariableList| 7)
              (10 . |variable|) (|Boolean|) (15 . |member?|) (|Polynomial| 6)
              (|NewSparseMultivariatePolynomial| 6 15) (21 . |coerce|)
              |LEXTRIPK;zeroDimensional?;LB;2| (26 . |retract|)
              (|Union| 8 '"failed") |LEXTRIPK;fglmIfCan;LU;3|
              |LEXTRIPK;groebner;2L;4| (31 . |infRittWu?|) (|Mapping| 17 20 20)
              (37 . |sort|) (43 . |zero?|) (|Mapping| 17 20) (48 . |remove|)
              (54 . |ground?|) (59 . |any?|) (|RegularChain| 6 7)
              (65 . |empty|) (69 . |mvar|) (74 . |algebraic?|) (80 . |init|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 20) (|:| |den| 6))
              (85 . |remainder|) (91 . |initiallyReduce|)
              (|Record| (|:| |val| 17) (|:| |tower| $)) (|List| 43)
              (97 . |invertible?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 15) 15 20 35)
              (103 . |normalizedAssociate|) (109 . |internalAugment|)
              (|List| $) (115 . |augment|) (121 . =) (|List| 35)
              (|QuasiComponentPackage| 6 (|IndexedExponents| 15) 15 20 35)
              (127 . |algebraicSort|) |LEXTRIPK;lexTriangular;LBL;5|
              |LEXTRIPK;zeroSetSplit;LBL;6|
              (|SquareFreeRegularTriangularSet| 6 (|IndexedExponents| 15) 15
                                                20)
              (132 . |empty|) (136 . |algebraic?|) (142 . |remainder|)
              (148 . |initiallyReduce|) (154 . |invertible?|)
              (|NormalizationPackage| 6 (|IndexedExponents| 15) 15 20 57)
              (160 . |normalizedAssociate|) (166 . |augment|) (|List| 57)
              (|QuasiComponentPackage| 6 (|IndexedExponents| 15) 15 20 57)
              (172 . |algebraicSort|) |LEXTRIPK;squareFreeLexTriangular;LBL;7|
              |LEXTRIPK;zeroSetSplit;LBL;8|)
           '#(|zeroSetSplit| 177 |zeroDimensional?| 189
              |squareFreeLexTriangular| 194 |lexTriangular| 200 |groebner| 206
              |fglmIfCan| 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(1 9 0 8 10 1 9 11 0 12 1 15
                                                   13 14 16 2 11 17 15 0 18 1
                                                   20 19 0 21 1 20 0 19 23 2 20
                                                   17 0 0 27 2 8 0 28 0 29 1 20
                                                   17 0 30 2 8 0 31 0 32 1 20
                                                   17 0 33 2 8 17 31 0 34 0 35
                                                   0 36 1 20 15 0 37 2 35 17 15
                                                   0 38 1 20 0 0 39 2 35 40 20
                                                   0 41 2 35 20 20 0 42 2 35 44
                                                   20 0 45 2 46 20 20 35 47 2
                                                   35 0 20 0 48 2 35 49 20 0 50
                                                   2 15 17 0 0 51 1 53 52 52 54
                                                   0 57 0 58 2 57 17 15 0 59 2
                                                   57 40 20 0 60 2 57 20 20 0
                                                   61 2 57 44 20 0 62 2 63 20
                                                   20 57 64 2 57 49 20 0 65 1
                                                   67 66 66 68 2 0 66 8 17 70 2
                                                   0 52 8 17 56 1 0 17 8 22 2 0
                                                   66 8 17 69 2 0 52 8 17 55 1
                                                   0 8 8 26 1 0 24 8 25)))))
           '|lookupComplete|)) 
