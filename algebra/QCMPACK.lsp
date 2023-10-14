
(DEFUN |QCMPACK;squareFreeFactors| (|lp| $)
  (PROG (|lsflp| |lsfp| #1=#:G169 |p|)
    (RETURN
     (SEQ (LETT |lsflp| NIL . #2=(|QCMPACK;squareFreeFactors|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# |lp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |lsfp| (SPADCALL |p| (QREFELT $ 13)) . #2#)
                    (EXIT
                     (LETT |lsflp| (SPADCALL |lsfp| |lsflp| (QREFELT $ 14))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 16) (SPADCALL |lsflp| (QREFELT $ 17))
                     (QREFELT $ 19))))))) 

(DEFUN |QCMPACK;startTable!;3SV;2| (|ok| |ko| |domainName| $)
  (SEQ (SPADCALL (QREFELT $ 23))
       (COND
        ((NULL (SPADCALL |ok| (QREFELT $ 25)))
         (COND
          ((NULL (SPADCALL |ko| (QREFELT $ 25)))
           (SPADCALL |ok| |ko| (QREFELT $ 26))))))
       (COND
        ((NULL (SPADCALL |domainName| (QREFELT $ 25)))
         (SPADCALL |domainName| (QREFELT $ 27))))
       (EXIT (SPADCALL (QREFELT $ 28))))) 

(DEFUN |QCMPACK;stopTable!;V;3| ($)
  (SEQ (COND ((SPADCALL (QREFELT $ 30)) (SPADCALL (QREFELT $ 31))))
       (EXIT (SPADCALL (QREFELT $ 32))))) 

(DEFUN |QCMPACK;supDimElseRittWu?;2TSB;4| (|ts| |us| $)
  (PROG (|lp2| |lp1|)
    (RETURN
     (SEQ
      (COND
       ((< (SPADCALL |ts| (QREFELT $ 35)) (SPADCALL |us| (QREFELT $ 35))) 'T)
       ((SPADCALL (SPADCALL |ts| (QREFELT $ 35)) (SPADCALL |us| (QREFELT $ 35))
                  (QREFELT $ 36))
        'NIL)
       (#1='T
        (SEQ
         (LETT |lp1| (SPADCALL |ts| (QREFELT $ 37))
               . #2=(|QCMPACK;supDimElseRittWu?;2TSB;4|))
         (LETT |lp2| (SPADCALL |us| (QREFELT $ 37)) . #2#)
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((OR (NULL |lp1|)
                       (SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|)
                                 (QREFELT $ 16)))
                   'NIL)
                  ('T 'T)))
                (GO G191)))
              (SEQ (LETT |lp1| (CDR |lp1|) . #2#)
                   (EXIT (LETT |lp2| (CDR |lp2|) . #2#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT (COND ((NULL |lp1|) 'NIL) (#1# 'T)))))))))) 

(DEFUN |QCMPACK;algebraicSort;2L;5| (|lts| $)
  (SEQ
   (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)) |QCMPACK;algebraicSort;2L;5|)
   (EXIT (SPADCALL (ELT $ 38) |lts| (QREFELT $ 42))))) 

(DEFUN |QCMPACK;moreAlgebraic?;2TSB;6| (|ts| |us| $)
  (PROG (#1=#:G191 #2=#:G196 #3=#:G197 |p|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |ts| (QREFELT $ 44)) (SPADCALL |us| (QREFELT $ 44)))
             ((SPADCALL |us| (QREFELT $ 44)) 'T)
             ((< (SPADCALL |ts| (QREFELT $ 35)) (SPADCALL |us| (QREFELT $ 35)))
              'NIL)
             ('T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #4=(|QCMPACK;moreAlgebraic?;2TSB;6|))
                      (LETT #3# (SPADCALL |us| (QREFELT $ 37)) . #4#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 45)) |ts|
                                     (QREFELT $ 46)))
                          (PROGN
                           (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#))
                                 . #4#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'T)))))
      #2# (EXIT #2#))))) 

(DEFUN |QCMPACK;subTriSet?;2TSB;7| (|ts| |us| $)
  (PROG (#1=#:G199 #2=#:G202)
    (RETURN
     (COND ((SPADCALL |ts| (QREFELT $ 44)) 'T)
           ((OR (SPADCALL |us| (QREFELT $ 44))
                (SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                          (SPADCALL |us| (QREFELT $ 48)) (QREFELT $ 49)))
            'NIL)
           ((SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                      (SPADCALL |us| (QREFELT $ 48)) (QREFELT $ 50))
            (SPADCALL |ts|
                      (PROG2
                          (LETT #1# (SPADCALL |us| (QREFELT $ 52))
                                . #3=(|QCMPACK;subTriSet?;2TSB;7|))
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 10) #1#))
                      (QREFELT $ 53)))
           ((SPADCALL
             (PROG2 (LETT #2# (SPADCALL |ts| (QREFELT $ 55)) . #3#)
                 (QCDR #2#)
               (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
             (PROG2 (LETT #2# (SPADCALL |us| (QREFELT $ 55)) . #3#)
                 (QCDR #2#)
               (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
             (QREFELT $ 56))
            (SPADCALL
             (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT $ 52)) . #3#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 10) #1#))
             (PROG2 (LETT #1# (SPADCALL |us| (QREFELT $ 52)) . #3#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 10) #1#))
             (QREFELT $ 53)))
           ('T 'NIL))))) 

(DEFUN |QCMPACK;internalSubPolSet?;2LB;8| (|lp1| |lp2| $)
  (COND ((NULL |lp1|) 'T) ((NULL |lp2|) 'NIL)
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 57))
         (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 58)))
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 16))
         'NIL)
        ('T (SPADCALL |lp1| (CDR |lp2|) (QREFELT $ 58))))) 

(DEFUN |QCMPACK;subPolSet?;2LB;9| (|lp1| |lp2| $)
  (SEQ
   (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19))
         . #1=(|QCMPACK;subPolSet?;2LB;9|))
   (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)) . #1#)
   (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 58))))) 

(DEFUN |QCMPACK;infRittWu?;2LB;10| (|lp1| |lp2| $)
  (SEQ
   (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19))
         . #1=(|QCMPACK;infRittWu?;2LB;10|))
   (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)) . #1#)
   (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 60))))) 

(DEFUN |QCMPACK;internalInfRittWu?;2LB;11| (|lp1| |lp2| $)
  (COND ((NULL |lp1|) (COND ((NULL |lp2|) 'NIL) (#1='T 'T)))
        ((NULL |lp2|) 'NIL)
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 16)) 'T)
        ((SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|) (QREFELT $ 16))
         'NIL)
        (#1# (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 61))))) 

(DEFUN |QCMPACK;subCase?;2RB;12| (|lpwt1| |lpwt2| $)
  (COND ((NULL (SPADCALL (QCAR |lpwt2|) (QCAR |lpwt1|) (QREFELT $ 58))) 'NIL)
        ('T (SPADCALL (QCDR |lpwt1|) (QCDR |lpwt2|) (QREFELT $ 62))))) 

(DEFUN |QCMPACK;internalSubQuasiComponent?;2TSU;13| (|ts| |us| $)
  (PROG (#1=#:G250 #2=#:G256 #3=#:G259 |p| |lsfp| #4=#:G248 #5=#:G258 #6=#:G246
         #7=#:G243 #8=#:G257)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |us| |ts| (QREFELT $ 53)) (CONS 0 'T))
             ((NULL (SPADCALL |ts| |us| (QREFELT $ 47))) (CONS 0 'NIL))
             ('T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |p| NIL
                        . #9=(|QCMPACK;internalSubQuasiComponent?;2TSU;13|))
                  (LETT #8# (SPADCALL |us| (QREFELT $ 37)) . #9#) G190
                  (COND
                   ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |p| (QREFELT $ 65))
                         (SPADCALL
                          (PROG2
                              (LETT #7#
                                    (SPADCALL |ts|
                                              (SPADCALL |p| (QREFELT $ 45))
                                              (QREFELT $ 66))
                                    . #9#)
                              (QCDR #7#)
                            (|check_union| (QEQCAR #7# 0) (QREFELT $ 9) #7#))
                          (QREFELT $ 65)))
                      (PROGN
                       (LETT #6#
                             (PROGN
                              (LETT #2# (CONS 1 "failed") . #9#)
                              (GO #2#))
                             . #9#)
                       (GO #6#))))))
                  (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL)))
                #6# (EXIT #6#))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #9#)
                      (LETT #5# (SPADCALL |us| (QREFELT $ 37)) . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 67))
                                     (QREFELT $ 68)))
                          (PROGN
                           (LETT #4#
                                 (PROGN
                                  (LETT #2# (CONS 1 "failed") . #9#)
                                  (GO #2#))
                                 . #9#)
                           (GO #4#))))))
                      (LETT #5# (CDR #5#) . #9#) (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #4#))
               (LETT |lsfp|
                     (|QCMPACK;squareFreeFactors|
                      (SPADCALL |us| (QREFELT $ 69)) $)
                     . #9#)
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #9#) (LETT #3# |lsfp| . #9#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |p| |ts| (QREFELT $ 70)))
                          (PROGN
                           (LETT #1#
                                 (PROGN
                                  (LETT #2# (CONS 0 'NIL) . #9#)
                                  (GO #2#))
                                 . #9#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT (CONS 0 'T))))))
      #2# (EXIT #2#))))) 

(DEFUN |QCMPACK;subQuasiComponent?;2TSB;14| (|ts| |us| $)
  (PROG (|b| |ubf| |e| |k|)
    (RETURN
     (SEQ
      (LETT |k| (CONS |ts| |us|) . #1=(|QCMPACK;subQuasiComponent?;2TSB;14|))
      (LETT |e| (SPADCALL |k| (QREFELT $ 73)) . #1#)
      (EXIT
       (COND ((QEQCAR |e| 0) (QCDR |e|))
             (#2='T
              (SEQ (LETT |ubf| (SPADCALL |ts| |us| (QREFELT $ 72)) . #1#)
                   (LETT |b| (COND ((QEQCAR |ubf| 0) (QCDR |ubf|)) (#2# 'NIL))
                         . #1#)
                   (SPADCALL |k| |b| (QREFELT $ 74)) (EXIT |b|))))))))) 

(DEFUN |QCMPACK;subQuasiComponent?;TSLB;15| (|ts| |lus| $)
  (PROG (#1=#:G268 #2=#:G270 #3=#:G271 |us|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |us| NIL . #4=(|QCMPACK;subQuasiComponent?;TSLB;15|))
               (LETT #3# |lus| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |us| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |ts| |us| (QREFELT $ 62))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |QCMPACK;removeSuperfluousCases;2L;16| (|cases| $)
  (PROG (|toSee| |headmaxcases| |copymaxcases| |maxcases| |toSave| |lpwt1|
         #1=#:G298 |lpwt2|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |cases|) 2) |cases|)
            ('T
             (SEQ
              (LETT |toSee|
                    (SPADCALL
                     (CONS #'|QCMPACK;removeSuperfluousCases;2L;16!0| $)
                     |cases| (QREFELT $ 78))
                    . #2=(|QCMPACK;removeSuperfluousCases;2L;16|))
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ (LETT |lpwt1| (|SPADfirst| |toSee|) . #2#)
                        (LETT |toSee| (CDR |toSee|) . #2#)
                        (LETT |toSave| NIL . #2#)
                        (SEQ (LETT |lpwt2| NIL . #2#) (LETT #1# |toSee| . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |lpwt2| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |lpwt1| |lpwt2| (QREFELT $ 64))
                                 (LETT |lpwt1| |lpwt2| . #2#))
                                ((NULL
                                  (SPADCALL |lpwt2| |lpwt1| (QREFELT $ 64)))
                                 (LETT |toSave| (CONS |lpwt2| |toSave|)
                                       . #2#)))))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL |maxcases|)
                          (SEQ (LETT |headmaxcases| (LIST |lpwt1|) . #2#)
                               (EXIT (LETT |maxcases| |headmaxcases| . #2#))))
                         ('T
                          (SEQ (LETT |copymaxcases| |maxcases| . #2#)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (COND
                                        ((OR (NULL |copymaxcases|)
                                             (SPADCALL |lpwt1|
                                                       (|SPADfirst|
                                                        |copymaxcases|)
                                                       (QREFELT $ 64)))
                                         'NIL)
                                        ('T 'T)))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |copymaxcases| (CDR |copymaxcases|)
                                            . #2#)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT
                                (COND
                                 ((NULL |copymaxcases|)
                                  (SEQ
                                   (SPADCALL |headmaxcases| (LIST |lpwt1|)
                                             (QREFELT $ 79))
                                   (EXIT
                                    (LETT |headmaxcases| (CDR |headmaxcases|)
                                          . #2#)))))))))
                        (EXIT (LETT |toSee| (REVERSE |toSave|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |maxcases|)))))))) 

(DEFUN |QCMPACK;removeSuperfluousCases;2L;16!0| (|x| |y| $)
  (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38))) 

(DEFUN |QCMPACK;removeSuperfluousQuasiComponents;2L;17| (|lts| $)
  (PROG (|toSee| |headmaxlts| |copymaxlts| |maxlts| |toSave| |ts| #1=#:G315
         |us|)
    (RETURN
     (SEQ
      (LETT |lts| (SPADCALL |lts| (QREFELT $ 40))
            . #2=(|QCMPACK;removeSuperfluousQuasiComponents;2L;17|))
      (EXIT
       (COND ((< (LENGTH |lts|) 2) |lts|)
             ('T
              (SEQ (LETT |toSee| (SPADCALL |lts| (QREFELT $ 43)) . #2#)
                   (SEQ G190
                        (COND
                         ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T)))
                          (GO G191)))
                        (SEQ (LETT |ts| (|SPADfirst| |toSee|) . #2#)
                             (LETT |toSee| (CDR |toSee|) . #2#)
                             (LETT |toSave| NIL . #2#)
                             (SEQ (LETT |us| NIL . #2#)
                                  (LETT #1# |toSee| . #2#) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN
                                         (LETT |us| (CAR #1#) . #2#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |ts| |us| (QREFELT $ 62))
                                      (LETT |ts| |us| . #2#))
                                     ((NULL
                                       (SPADCALL |us| |ts| (QREFELT $ 62)))
                                      (LETT |toSave| (CONS |us| |toSave|)
                                            . #2#)))))
                                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                  (EXIT NIL))
                             (COND
                              ((NULL |maxlts|)
                               (SEQ (LETT |headmaxlts| (LIST |ts|) . #2#)
                                    (EXIT (LETT |maxlts| |headmaxlts| . #2#))))
                              ('T
                               (SEQ (LETT |copymaxlts| |maxlts| . #2#)
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND
                                             ((OR (NULL |copymaxlts|)
                                                  (SPADCALL |ts|
                                                            (|SPADfirst|
                                                             |copymaxlts|)
                                                            (QREFELT $ 62)))
                                              'NIL)
                                             ('T 'T)))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |copymaxlts|
                                                 (CDR |copymaxlts|) . #2#)))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((NULL |copymaxlts|)
                                       (SEQ
                                        (SPADCALL |headmaxlts| (LIST |ts|)
                                                  (QREFELT $ 81))
                                        (EXIT
                                         (LETT |headmaxlts| (CDR |headmaxlts|)
                                               . #2#)))))))))
                             (EXIT (LETT |toSee| (REVERSE |toSave|) . #2#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |maxlts| (QREFELT $ 43))))))))))) 

(DEFUN |QCMPACK;removeAssociates| (|lp| $)
  (PROG (#1=#:G319 |p| #2=#:G318)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|QCMPACK;removeAssociates|))
        (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 83)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 17)))))) 

(DEFUN |QCMPACK;branchIfCan;LTSL5BU;19|
       (|leq| |ts| |lineq| |b1| |b2| |b3| |b4| |b5| $)
  (PROG (|newleq| #1=#:G354 |newp| #2=#:G340 |g| #3=#:G358 |q| #4=#:G357 |p|
         #5=#:G338 #6=#:G356 #7=#:G333 #8=#:G355 |ps| #9=#:G327)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         (|b1|
          (SEQ
           (EXIT
            (SEQ
             (LETT |leq| (|QCMPACK;removeAssociates| |leq| $)
                   . #10=(|QCMPACK;branchIfCan;LTSL5BU;19|))
             (LETT |leq| (SPADCALL (ELT $ 68) |leq| (QREFELT $ 85)) . #10#)
             (EXIT
              (COND
               ((SPADCALL (ELT $ 86) |leq| (QREFELT $ 87))
                (PROGN
                 (LETT #9# (PROGN (LETT #1# (CONS 1 "failed") . #10#) (GO #1#))
                       . #10#)
                 (GO #9#)))))))
           #9# (EXIT #9#))))
        (COND
         (|b2|
          (COND
           ((SPADCALL (ELT $ 68) |lineq| (QREFELT $ 87))
            (PROGN (LETT #1# (CONS 1 "failed") . #10#) (GO #1#)))
           ('T (LETT |lineq| (SPADCALL |lineq| (QREFELT $ 88)) . #10#)))))
        (COND
         (|b3|
          (SEQ (LETT |ps| (SPADCALL |leq| (QREFELT $ 90)) . #10#)
               (EXIT
                (SEQ
                 (EXIT
                  (SEQ (LETT |q| NIL . #10#) (LETT #8# |lineq| . #10#) G190
                       (COND
                        ((OR (ATOM #8#)
                             (PROGN (LETT |q| (CAR #8#) . #10#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (QVELT (SPADCALL |q| |ps| (QREFELT $ 92)) 1)
                            (QREFELT $ 68))
                           (PROGN
                            (LETT #7#
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #10#)
                                   (GO #1#))
                                  . #10#)
                            (GO #7#))))))
                       (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL)))
                 #7# (EXIT #7#))))))
        (COND
         ((OR (NULL |leq|) (NULL |lineq|))
          (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
        (COND
         (|b4|
          (SEQ
           (EXIT
            (SEQ (LETT |q| NIL . #10#) (LETT #6# |lineq| . #10#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |q| (CAR #6#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |q| |ts| (QREFELT $ 67))
                               (QREFELT $ 68))
                     (PROGN
                      (LETT #5#
                            (PROGN
                             (LETT #1# (CONS 1 "failed") . #10#)
                             (GO #1#))
                            . #10#)
                      (GO #5#))))))
                 (LETT #6# (CDR #6#) . #10#) (GO G190) G191 (EXIT NIL)))
           #5# (EXIT #5#))))
        (COND
         (|b5|
          (SEQ (LETT |newleq| NIL . #10#)
               (SEQ (LETT |p| NIL . #10#) (LETT #4# |leq| . #10#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #10#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |q| NIL . #10#) (LETT #3# |lineq| . #10#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |q| (CAR #3#) . #10#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                         (SPADCALL |q| (QREFELT $ 45))
                                         (QREFELT $ 93))
                               (SEQ
                                (LETT |g| (SPADCALL |p| |q| (QREFELT $ 94))
                                      . #10#)
                                (LETT |newp|
                                      (PROG2
                                          (LETT #2#
                                                (SPADCALL |p| |g|
                                                          (QREFELT $ 95))
                                                . #10#)
                                          (QCDR #2#)
                                        (|check_union| (QEQCAR #2# 0)
                                                       (QREFELT $ 9) #2#))
                                      . #10#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |newp| (QREFELT $ 86))
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #10#)
                                    (GO #1#)))
                                  ('T
                                   (LETT |newleq| (CONS |newp| |newleq|)
                                         . #10#))))))
                              ('T
                               (LETT |newleq| (CONS |p| |newleq|) . #10#)))))
                           (LETT #3# (CDR #3#) . #10#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT #4# (CDR #4#) . #10#) (GO G190) G191 (EXIT NIL))
               (EXIT (LETT |leq| |newleq| . #10#)))))
        (LETT |leq|
              (SPADCALL (ELT $ 16) (SPADCALL |leq| (QREFELT $ 17))
                        (QREFELT $ 19))
              . #10#)
        (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
      #1# (EXIT #1#))))) 

(DEFUN |QCMPACK;prepareDecompose;LL2BL;20| (|lp| |lts| |b1| |b2| $)
  (PROG (#1=#:G396 |ts| #2=#:G395 |toSee| |lq| |branches| #3=#:G367 |newBranch|
         |lineq| |leq| |ubf2| |ubf1| #4=#:G394 |branch| #5=#:G393 |f| |lsfp|
         #6=#:G392 |p| #7=#:G391 #8=#:G390)
    (RETURN
     (SEQ
      (LETT |lp|
            (SPADCALL (ELT $ 16)
                      (SPADCALL (ELT $ 68) (|QCMPACK;removeAssociates| |lp| $)
                                (QREFELT $ 85))
                      (QREFELT $ 19))
            . #9=(|QCMPACK;prepareDecompose;LL2BL;20|))
      (EXIT
       (COND ((OR (SPADCALL (ELT $ 86) |lp| (QREFELT $ 87)) (NULL |lts|)) NIL)
             ('T
              (SEQ
               (COND (|b1| (LETT |lts| (SPADCALL |lts| (QREFELT $ 82)) . #9#)))
               (EXIT
                (COND
                 (|b2|
                  (SEQ (LETT |lq| NIL . #9#)
                       (LETT |toSee|
                             (PROGN
                              (LETT #8# NIL . #9#)
                              (SEQ (LETT |ts| NIL . #9#) (LETT #7# |lts| . #9#)
                                   G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN
                                          (LETT |ts| (CAR #7#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #8#
                                           (CONS
                                            (VECTOR |lq| |ts|
                                                    (|QCMPACK;squareFreeFactors|
                                                     (SPADCALL |ts|
                                                               (QREFELT $ 69))
                                                     $))
                                            #8#)
                                           . #9#)))
                                   (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                                   (EXIT (NREVERSE #8#))))
                             . #9#)
                       (EXIT
                        (COND ((NULL |lp|) |toSee|)
                              (#10='T
                               (SEQ
                                (SEQ (LETT |p| NIL . #9#) (LETT #6# |lp| . #9#)
                                     G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN
                                            (LETT |p| (CAR #6#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |lsfp|
                                            (SPADCALL |p| (QREFELT $ 13))
                                            . #9#)
                                      (LETT |branches| NIL . #9#)
                                      (LETT |lq| NIL . #9#)
                                      (SEQ (LETT |f| NIL . #9#)
                                           (LETT #5# |lsfp| . #9#) G190
                                           (COND
                                            ((OR (ATOM #5#)
                                                 (PROGN
                                                  (LETT |f| (CAR #5#) . #9#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (SEQ (LETT |branch| NIL . #9#)
                                                 (LETT #4# |toSee| . #9#) G190
                                                 (COND
                                                  ((OR (ATOM #4#)
                                                       (PROGN
                                                        (LETT |branch|
                                                              (CAR #4#) . #9#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |leq|
                                                        (QVELT |branch| 0)
                                                        . #9#)
                                                  (LETT |ts| (QVELT |branch| 1)
                                                        . #9#)
                                                  (LETT |lineq|
                                                        (QVELT |branch| 2)
                                                        . #9#)
                                                  (LETT |ubf1|
                                                        (SPADCALL |leq| |ts|
                                                                  |lq| 'NIL
                                                                  'NIL 'T 'T 'T
                                                                  (QREFELT $
                                                                           98))
                                                        . #9#)
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |ubf1| 1) "leave")
                                                    ('T
                                                     (SEQ
                                                      (LETT |ubf2|
                                                            (SPADCALL
                                                             (LIST |f|) |ts|
                                                             |lineq| 'NIL 'NIL
                                                             'T 'T 'T
                                                             (QREFELT $ 98))
                                                            . #9#)
                                                      (EXIT
                                                       (COND
                                                        ((QEQCAR |ubf2| 1)
                                                         "leave")
                                                        ('T
                                                         (SEQ
                                                          (LETT |leq|
                                                                (SPADCALL
                                                                 (ELT $ 16)
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QVELT
                                                                    (QCDR
                                                                     |ubf1|)
                                                                    0)
                                                                   (QVELT
                                                                    (QCDR
                                                                     |ubf2|)
                                                                    0)
                                                                   (QREFELT $
                                                                            14))
                                                                  (QREFELT $
                                                                           17))
                                                                 (QREFELT $
                                                                          19))
                                                                . #9#)
                                                          (LETT |lineq|
                                                                (SPADCALL
                                                                 (ELT $ 16)
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QVELT
                                                                    (QCDR
                                                                     |ubf1|)
                                                                    2)
                                                                   (QVELT
                                                                    (QCDR
                                                                     |ubf2|)
                                                                    2)
                                                                   (QREFELT $
                                                                            14))
                                                                  (QREFELT $
                                                                           17))
                                                                 (QREFELT $
                                                                          19))
                                                                . #9#)
                                                          (LETT |newBranch|
                                                                (SPADCALL |leq|
                                                                          |ts|
                                                                          |lineq|
                                                                          'NIL
                                                                          'NIL
                                                                          'NIL
                                                                          'NIL
                                                                          'NIL
                                                                          (QREFELT
                                                                           $
                                                                           98))
                                                                . #9#)
                                                          (EXIT
                                                           (LETT |branches|
                                                                 (CONS
                                                                  (PROG2
                                                                      (LETT #3#
                                                                            |newBranch|
                                                                            . #9#)
                                                                      (QCDR
                                                                       #3#)
                                                                    (|check_union|
                                                                     (QEQCAR
                                                                      #3# 0)
                                                                     (|Record|
                                                                      (|:| |eq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             9)))
                                                                      (|:|
                                                                       |tower|
                                                                       (QREFELT
                                                                        $ 10))
                                                                      (|:|
                                                                       |ineq|
                                                                       (|List|
                                                                        (QREFELT
                                                                         $
                                                                         9))))
                                                                     #3#))
                                                                  |branches|)
                                                                 . #9#)))))))))))
                                                 (LETT #4# (CDR #4#) . #9#)
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (LETT |lq| (CONS |f| |lq|)
                                                   . #9#)))
                                           (LETT #5# (CDR #5#) . #9#) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT (LETT |toSee| |branches| . #9#)))
                                     (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (SPADCALL
                                  (CONS #'|QCMPACK;prepareDecompose;LL2BL;20!0|
                                        $)
                                  |toSee| (QREFELT $ 101)))))))))
                 (#10#
                  (PROGN
                   (LETT #2# NIL . #9#)
                   (SEQ (LETT |ts| NIL . #9#) (LETT #1# |lts| . #9#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |ts| (CAR #1#) . #9#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (VECTOR |lp| |ts|
                                         (|QCMPACK;squareFreeFactors|
                                          (SPADCALL |ts| (QREFELT $ 69)) $))
                                 #2#)
                                . #9#)))
                        (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |QCMPACK;prepareDecompose;LL2BL;20!0| (|x| |y| $)
  (SPADCALL (QVELT |x| 1) (QVELT |y| 1) (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |QuasiComponentPackage;|)) 

(DEFUN |QuasiComponentPackage| (&REST #1=#:G397)
  (PROG ()
    (RETURN
     (PROG (#2=#:G398)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|QuasiComponentPackage|)
                                           '|domainEqualList|)
                . #3=(|QuasiComponentPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |QuasiComponentPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|QuasiComponentPackage|))))))))))) 

(DEFUN |QuasiComponentPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|QuasiComponentPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|QuasiComponentPackage| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 103) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|QuasiComponentPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|QuasiComponentPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 9)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (0 . |squareFreeFactors|) (5 . |concat|) (|Boolean|)
              (11 . |infRittWu?|) (17 . |removeDuplicates|) (|Mapping| 15 9 9)
              (22 . |sort|) (|Void|)
              (|Record| (|:| |left| 10) (|:| |right| 10))
              (|TabulatedComputationPackage| 21 15) (28 . |initTable!|)
              (|String|) (32 . |empty?|) (37 . |printInfo!|)
              (43 . |startStats!|) (48 . |void|) |QCMPACK;startTable!;3SV;2|
              (52 . |makingStats?|) (56 . |printStats!|) (60 . |clearTable!|)
              |QCMPACK;stopTable!;V;3| (|NonNegativeInteger|) (64 . |#|)
              (69 . >) (75 . |members|) |QCMPACK;supDimElseRittWu?;2TSB;4|
              (|List| 10) (80 . |removeDuplicates|) (|Mapping| 15 10 10)
              (85 . |sort|) |QCMPACK;algebraicSort;2L;5| (91 . |empty?|)
              (96 . |mvar|) (101 . |algebraic?|)
              |QCMPACK;moreAlgebraic?;2TSB;6| (107 . |mvar|) (112 . >)
              (118 . <) (|Union| $ '#1="failed") (124 . |rest|)
              |QCMPACK;subTriSet?;2TSB;7| (|Union| 9 '#1#) (129 . |first|)
              (134 . =) (140 . |associates?|)
              |QCMPACK;internalSubPolSet?;2LB;8| |QCMPACK;subPolSet?;2LB;9|
              |QCMPACK;internalInfRittWu?;2LB;11| |QCMPACK;infRittWu?;2LB;10|
              |QCMPACK;subQuasiComponent?;2TSB;14|
              (|Record| (|:| |val| 11) (|:| |tower| 10))
              |QCMPACK;subCase?;2RB;12| (146 . |mdeg|) (151 . |select|)
              (157 . |initiallyReduce|) (163 . |zero?|) (168 . |initials|)
              (173 . |invertible?|) (|Union| 15 '"failed")
              |QCMPACK;internalSubQuasiComponent?;2TSU;13|
              (179 . |extractIfCan|) (184 . |insert!|)
              |QCMPACK;subQuasiComponent?;TSLB;15| (|Mapping| 15 63 63)
              (|List| 63) (190 . |sort|) (196 . |setrest!|)
              |QCMPACK;removeSuperfluousCases;2L;16| (202 . |setrest!|)
              |QCMPACK;removeSuperfluousQuasiComponents;2L;17|
              (208 . |primitivePart|) (|Mapping| 15 9) (213 . |remove|)
              (219 . |ground?|) (224 . |any?|) (230 . |removeRedundantFactors|)
              (|GeneralPolynomialSet| 6 7 8 9) (235 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (240 . |remainder|) (246 . =) (252 . |gcd|) (258 . |exquo|)
              (|Record| (|:| |eq| 11) (|:| |tower| 10) (|:| |ineq| 11))
              (|Union| 96 '"failed") |QCMPACK;branchIfCan;LTSL5BU;19|
              (|Mapping| 15 96 96) (|List| 96) (264 . |sort|)
              |QCMPACK;prepareDecompose;LL2BL;20|)
           '#(|supDimElseRittWu?| 270 |subTriSet?| 276 |subQuasiComponent?| 282
              |subPolSet?| 294 |subCase?| 300 |stopTable!| 306 |startTable!|
              310 |removeSuperfluousQuasiComponents| 317
              |removeSuperfluousCases| 322 |prepareDecompose| 327
              |moreAlgebraic?| 335 |internalSubQuasiComponent?| 341
              |internalSubPolSet?| 347 |internalInfRittWu?| 353 |infRittWu?|
              359 |branchIfCan| 365 |algebraicSort| 377)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 102
                                                 '(1 12 11 9 13 2 11 0 0 0 14 2
                                                   9 15 0 0 16 1 11 0 0 17 2 11
                                                   0 18 0 19 0 22 20 23 1 24 15
                                                   0 25 2 22 20 24 24 26 1 22
                                                   20 24 27 0 20 0 28 0 22 15
                                                   30 0 22 20 31 0 22 20 32 1
                                                   10 34 0 35 2 34 15 0 0 36 1
                                                   10 11 0 37 1 39 0 0 40 2 39
                                                   0 41 0 42 1 10 15 0 44 1 9 8
                                                   0 45 2 10 15 8 0 46 1 10 8 0
                                                   48 2 8 15 0 0 49 2 8 15 0 0
                                                   50 1 10 51 0 52 1 10 54 0 55
                                                   2 9 15 0 0 56 2 9 15 0 0 57
                                                   1 9 34 0 65 2 10 54 0 8 66 2
                                                   10 9 9 0 67 1 9 15 0 68 1 10
                                                   11 0 69 2 10 15 9 0 70 1 22
                                                   71 21 73 2 22 20 21 15 74 2
                                                   77 0 76 0 78 2 77 0 0 0 79 2
                                                   39 0 0 0 81 1 9 0 0 83 2 11
                                                   0 84 0 85 1 9 15 0 86 2 11
                                                   15 84 0 87 1 12 11 11 88 1
                                                   89 0 11 90 2 89 91 9 0 92 2
                                                   8 15 0 0 93 2 9 0 0 0 94 2 9
                                                   51 0 0 95 2 100 0 99 0 101 2
                                                   0 15 10 10 38 2 0 15 10 10
                                                   53 2 0 15 10 39 75 2 0 15 10
                                                   10 62 2 0 15 11 11 59 2 0 15
                                                   63 63 64 0 0 20 33 3 0 20 24
                                                   24 24 29 1 0 39 39 82 1 0 77
                                                   77 80 4 0 100 11 39 15 15
                                                   102 2 0 15 10 10 47 2 0 71
                                                   10 10 72 2 0 15 11 11 58 2 0
                                                   15 11 11 60 2 0 15 11 11 61
                                                   8 0 97 11 10 11 15 15 15 15
                                                   15 98 1 0 39 39 43)))))
           '|lookupComplete|)) 
