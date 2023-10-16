
(SDEFUN |SFQCMPK;squareFreeFactors| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|lsflp| (|List| P)) (|lsfp| (|List| P)) (#1=#:G173 NIL) (|p| NIL))
         (SEQ (LETT |lsflp| NIL)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |lsfp| (SPADCALL |p| (QREFELT $ 13)))
                        (EXIT
                         (LETT |lsflp|
                               (SPADCALL |lsfp| |lsflp| (QREFELT $ 14)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 16) (SPADCALL |lsflp| (QREFELT $ 17))
                         (QREFELT $ 19)))))) 

(SDEFUN |SFQCMPK;startTable!;3SV;2|
        ((|ok| |String|) (|ko| |String|) (|domainName| |String|) ($ |Void|))
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

(SDEFUN |SFQCMPK;stopTable!;V;3| (($ |Void|))
        (SEQ (COND ((SPADCALL (QREFELT $ 30)) (SPADCALL (QREFELT $ 31))))
             (EXIT (SPADCALL (QREFELT $ 32))))) 

(SDEFUN |SFQCMPK;supDimElseRittWu?;2TSB;4| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((|lp2| #1=(|List| P)) (|lp1| #1#))
               (SEQ
                (COND
                 ((< (SPADCALL |ts| (QREFELT $ 35))
                     (SPADCALL |us| (QREFELT $ 35)))
                  'T)
                 ((SPADCALL (SPADCALL |ts| (QREFELT $ 35))
                            (SPADCALL |us| (QREFELT $ 35)) (QREFELT $ 36))
                  NIL)
                 ('T
                  (SEQ (LETT |lp1| (SPADCALL |ts| (QREFELT $ 37)))
                       (LETT |lp2| (SPADCALL |us| (QREFELT $ 37)))
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND ((NULL |lp1|) NIL)
                                     ('T
                                      (NULL
                                       (SPADCALL (|SPADfirst| |lp2|)
                                                 (|SPADfirst| |lp1|)
                                                 (QREFELT $ 16))))))
                              (GO G191)))
                            (SEQ (LETT |lp1| (CDR |lp1|))
                                 (EXIT (LETT |lp2| (CDR |lp2|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (NULL (NULL |lp1|))))))))) 

(SDEFUN |SFQCMPK;algebraicSort;2L;5| ((|lts| |List| TS) ($ |List| TS))
        (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)))
             (EXIT (SPADCALL (ELT $ 38) |lts| (QREFELT $ 42))))) 

(SDEFUN |SFQCMPK;moreAlgebraic?;2TSB;6| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((#1=#:G201 NIL) (#2=#:G202 NIL) (#3=#:G203 NIL) (|p| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |ts| (QREFELT $ 44))
                   (SPADCALL |us| (QREFELT $ 44)))
                  ((SPADCALL |us| (QREFELT $ 44)) 'T)
                  ((< (SPADCALL |ts| (QREFELT $ 35))
                      (SPADCALL |us| (QREFELT $ 35)))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |p| NIL)
                           (LETT #3# (SPADCALL |us| (QREFELT $ 37))) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 45)) |ts|
                                          (QREFELT $ 46)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# NIL) (GO #4=#:G200)))
                                (GO #5=#:G195))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #1#))
                    (EXIT 'T)))))
                #4# (EXIT #2#)))) 

(SDEFUN |SFQCMPK;subTriSet?;2TSB;7| ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG ((#1=#:G205 NIL) (#2=#:G208 NIL))
               (COND ((SPADCALL |ts| (QREFELT $ 44)) 'T)
                     ((OR (SPADCALL |us| (QREFELT $ 44))
                          (SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                                    (SPADCALL |us| (QREFELT $ 48))
                                    (QREFELT $ 49)))
                      NIL)
                     ((SPADCALL (SPADCALL |ts| (QREFELT $ 48))
                                (SPADCALL |us| (QREFELT $ 48)) (QREFELT $ 50))
                      (SPADCALL |ts|
                                (PROG2
                                    (LETT #1# (SPADCALL |us| (QREFELT $ 52)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                                  (|Union| (QREFELT $ 10)
                                                           #3="failed")
                                                  #1#))
                                (QREFELT $ 53)))
                     ((SPADCALL
                       (PROG2 (LETT #2# (SPADCALL |ts| (QREFELT $ 55)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) #3#) #2#))
                       (PROG2 (LETT #2# (SPADCALL |us| (QREFELT $ 55)))
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                         (|Union| (QREFELT $ 9) #3#) #2#))
                       (QREFELT $ 56))
                      (SPADCALL
                       (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT $ 52)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #3#) #1#))
                       (PROG2 (LETT #1# (SPADCALL |us| (QREFELT $ 52)))
                           (QCDR #1#)
                         (|check_union2| (QEQCAR #1# 0) (QREFELT $ 10)
                                         (|Union| (QREFELT $ 10) #3#) #1#))
                       (QREFELT $ 53)))
                     ('T NIL)))) 

(SDEFUN |SFQCMPK;internalSubPolSet?;2LB;8|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (COND ((NULL |lp1|) 'T) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 57))
               (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 58)))
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 16))
               NIL)
              ('T (SPADCALL |lp1| (CDR |lp2|) (QREFELT $ 58))))) 

(SDEFUN |SFQCMPK;subPolSet?;2LB;9|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (SEQ (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19)))
             (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 58))))) 

(SDEFUN |SFQCMPK;infRittWu?;2LB;10|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (SEQ (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19)))
             (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)))
             (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 60))))) 

(SDEFUN |SFQCMPK;internalInfRittWu?;2LB;11|
        ((|lp1| |List| P) (|lp2| |List| P) ($ |Boolean|))
        (COND ((NULL |lp1|) (NULL (NULL |lp2|))) ((NULL |lp2|) NIL)
              ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|)
                         (QREFELT $ 16))
               'T)
              ((SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|)
                         (QREFELT $ 16))
               NIL)
              ('T (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 61))))) 

(SDEFUN |SFQCMPK;subCase?;2RB;12|
        ((|lpwt1| |Record| (|:| |val| (|List| P)) (|:| |tower| TS))
         (|lpwt2| |Record| (|:| |val| (|List| P)) (|:| |tower| TS))
         ($ |Boolean|))
        (COND
         ((NULL (SPADCALL (QCAR |lpwt2|) (QCAR |lpwt1|) (QREFELT $ 58))) NIL)
         ('T (SPADCALL (QCDR |lpwt1|) (QCDR |lpwt2|) (QREFELT $ 62))))) 

(SDEFUN |SFQCMPK;internalSubQuasiComponent?;2TSU;13|
        ((|ts| TS) (|us| TS) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G265 NIL) (|b| (|Boolean|)) (#2=#:G268 NIL) (|p| NIL)
          (|lsfp| (|List| P)) (#3=#:G263 NIL) (#4=#:G267 NIL) (#5=#:G264 NIL)
          (#6=#:G249 NIL) (#7=#:G266 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |us| |ts| (QREFELT $ 53)) (CONS 0 'T))
                 ((NULL (SPADCALL |ts| |us| (QREFELT $ 47))) (CONS 0 NIL))
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #7# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((< (SPADCALL |p| (QREFELT $ 65))
                                 (SPADCALL
                                  (PROG2
                                      (LETT #6#
                                            (SPADCALL |ts|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 66)))
                                      (QCDR #6#)
                                    (|check_union2| (QEQCAR #6# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             "failed")
                                                    #6#))
                                  (QREFELT $ 65)))
                              (PROGN
                               (LETT #5#
                                     (PROGN
                                      (LETT #1# (CONS 1 "failed"))
                                      (GO #8=#:G262)))
                               (GO #9=#:G252))))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL)))
                    #9# (EXIT #5#))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #4# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 67))
                                         (QREFELT $ 68)))
                              (PROGN
                               (LETT #3#
                                     (PROGN
                                      (LETT #1# (CONS 1 "failed"))
                                      (GO #8#)))
                               (GO #10=#:G254))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                    #10# (EXIT #3#))
                   (LETT |lsfp|
                         (|SFQCMPK;squareFreeFactors|
                          (SPADCALL |us| (QREFELT $ 69)) $))
                   (SEQ (LETT |p| NIL) (LETT #2# |lsfp|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ (LETT |b| (SPADCALL |p| |ts| (QREFELT $ 70)))
                             (EXIT
                              (COND
                               ((NULL |b|)
                                (PROGN (LETT #1# (CONS 0 NIL)) (GO #8#))))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 'T))))))
          #8# (EXIT #1#)))) 

(SDEFUN |SFQCMPK;internalSubQuasiComponent?;2TSU;14|
        ((|ts| TS) (|us| TS) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((#1=#:G283 NIL) (#2=#:G285 NIL) (#3=#:G287 NIL) (|p| NIL)
          (#4=#:G284 NIL) (#5=#:G274 NIL) (#6=#:G286 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |us| |ts| (QREFELT $ 53)) (CONS 0 'T))
                 ((NULL (SPADCALL |ts| |us| (QREFELT $ 47))) (CONS 0 NIL))
                 ('T
                  (SEQ
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #6# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((< (SPADCALL |p| (QREFELT $ 65))
                                 (SPADCALL
                                  (PROG2
                                      (LETT #5#
                                            (SPADCALL |ts|
                                                      (SPADCALL |p|
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 66)))
                                      (QCDR #5#)
                                    (|check_union2| (QEQCAR #5# 0)
                                                    (QREFELT $ 9)
                                                    (|Union| (QREFELT $ 9)
                                                             "failed")
                                                    #5#))
                                  (QREFELT $ 65)))
                              (PROGN
                               (LETT #4#
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #7=#:G282)))
                               (GO #8=#:G277))))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
                    #8# (EXIT #4#))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL)
                          (LETT #3# (SPADCALL |us| (QREFELT $ 37))) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 73))
                                         (QREFELT $ 68)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (LETT #2# (CONS 1 "failed"))
                                      (GO #7#)))
                               (GO #9=#:G279))))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                    #9# (EXIT #1#))
                   (EXIT (CONS 0 'T))))))
          #7# (EXIT #2#)))) 

(SDEFUN |SFQCMPK;subQuasiComponent?;2TSB;15|
        ((|ts| TS) (|us| TS) ($ |Boolean|))
        (SPROG
         ((|b| (|Boolean|)) (|ubf| (|Union| (|Boolean|) "failed"))
          (|e| (|Union| (|Boolean|) "failed"))
          (|k| (|Record| (|:| |left| TS) (|:| |right| TS))))
         (SEQ (LETT |k| (CONS |ts| |us|))
              (LETT |e| (SPADCALL |k| (QREFELT $ 74)))
              (EXIT
               (COND ((QEQCAR |e| 0) (QCDR |e|))
                     (#1='T
                      (SEQ (LETT |ubf| (SPADCALL |ts| |us| (QREFELT $ 72)))
                           (LETT |b|
                                 (COND ((QEQCAR |ubf| 0) (QCDR |ubf|))
                                       (#1# NIL)))
                           (SPADCALL |k| |b| (QREFELT $ 75)) (EXIT |b|)))))))) 

(SDEFUN |SFQCMPK;subQuasiComponent?;TSLB;16|
        ((|ts| TS) (|lus| |List| TS) ($ |Boolean|))
        (SPROG ((#1=#:G299 NIL) (#2=#:G300 NIL) (#3=#:G301 NIL) (|us| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |us| NIL) (LETT #3# |lus|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |us| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ts| |us| (QREFELT $ 62))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# 'T) (GO #4=#:G298)))
                              (GO #5=#:G296))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |SFQCMPK;removeSuperfluousCases;2L;17|
        ((|cases| |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         ($ |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
        (SPROG
         ((|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|headmaxcases|
           #1=(|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|copymaxcases|
           (|List| #2=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|maxcases| #1#) (|toSave| (|List| #2#))
          (|lpwt1| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (#3=#:G330 NIL) (|lpwt2| NIL))
         (SEQ
          (COND ((< (LENGTH |cases|) 2) |cases|)
                ('T
                 (SEQ
                  (LETT |toSee|
                        (SPADCALL
                         (CONS #'|SFQCMPK;removeSuperfluousCases;2L;17!0| $)
                         |cases| (QREFELT $ 79)))
                  (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                       (SEQ (LETT |lpwt1| (|SPADfirst| |toSee|))
                            (LETT |toSee| (CDR |toSee|)) (LETT |toSave| NIL)
                            (SEQ (LETT |lpwt2| NIL) (LETT #3# |toSee|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |lpwt2| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |lpwt1| |lpwt2| (QREFELT $ 64))
                                     (LETT |lpwt1| |lpwt2|))
                                    ((NULL
                                      (SPADCALL |lpwt2| |lpwt1|
                                                (QREFELT $ 64)))
                                     (LETT |toSave|
                                           (CONS |lpwt2| |toSave|))))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND
                             ((NULL |maxcases|)
                              (SEQ (LETT |headmaxcases| (LIST |lpwt1|))
                                   (EXIT (LETT |maxcases| |headmaxcases|))))
                             ('T
                              (SEQ (LETT |copymaxcases| |maxcases|)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND ((NULL |copymaxcases|) NIL)
                                                 ('T
                                                  (NULL
                                                   (SPADCALL |lpwt1|
                                                             (|SPADfirst|
                                                              |copymaxcases|)
                                                             (QREFELT $
                                                                      64))))))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |copymaxcases|
                                                (CDR |copymaxcases|))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((NULL |copymaxcases|)
                                      (SEQ
                                       (SPADCALL |headmaxcases| (LIST |lpwt1|)
                                                 (QREFELT $ 80))
                                       (EXIT
                                        (LETT |headmaxcases|
                                              (CDR |headmaxcases|))))))))))
                            (EXIT (LETT |toSee| (REVERSE |toSave|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |maxcases|))))))) 

(SDEFUN |SFQCMPK;removeSuperfluousCases;2L;17!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38))) 

(SDEFUN |SFQCMPK;removeSuperfluousQuasiComponents;2L;18|
        ((|lts| |List| TS) ($ |List| TS))
        (SPROG
         ((|toSee| (|List| TS)) (|headmaxlts| #1=(|List| TS))
          (|copymaxlts| (|List| TS)) (|maxlts| #1#) (|toSave| (|List| TS))
          (|ts| (TS)) (#2=#:G347 NIL) (|us| NIL))
         (SEQ (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)))
              (EXIT
               (COND ((< (LENGTH |lts|) 2) |lts|)
                     ('T
                      (SEQ (LETT |toSee| (SPADCALL |lts| (QREFELT $ 43)))
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                                (SEQ (LETT |ts| (|SPADfirst| |toSee|))
                                     (LETT |toSee| (CDR |toSee|))
                                     (LETT |toSave| NIL)
                                     (SEQ (LETT |us| NIL) (LETT #2# |toSee|)
                                          G190
                                          (COND
                                           ((OR (ATOM #2#)
                                                (PROGN
                                                 (LETT |us| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |ts| |us|
                                                        (QREFELT $ 62))
                                              (LETT |ts| |us|))
                                             ((NULL
                                               (SPADCALL |us| |ts|
                                                         (QREFELT $ 62)))
                                              (LETT |toSave|
                                                    (CONS |us| |toSave|))))))
                                          (LETT #2# (CDR #2#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND
                                      ((NULL |maxlts|)
                                       (SEQ (LETT |headmaxlts| (LIST |ts|))
                                            (EXIT
                                             (LETT |maxlts| |headmaxlts|))))
                                      ('T
                                       (SEQ (LETT |copymaxlts| |maxlts|)
                                            (SEQ G190
                                                 (COND
                                                  ((NULL
                                                    (COND
                                                     ((NULL |copymaxlts|) NIL)
                                                     ('T
                                                      (NULL
                                                       (SPADCALL |ts|
                                                                 (|SPADfirst|
                                                                  |copymaxlts|)
                                                                 (QREFELT $
                                                                          62))))))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |copymaxlts|
                                                         (CDR |copymaxlts|))))
                                                 NIL (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (COND
                                              ((NULL |copymaxlts|)
                                               (SEQ
                                                (SPADCALL |headmaxlts|
                                                          (LIST |ts|)
                                                          (QREFELT $ 82))
                                                (EXIT
                                                 (LETT |headmaxlts|
                                                       (CDR
                                                        |headmaxlts|))))))))))
                                     (EXIT (LETT |toSee| (REVERSE |toSave|))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (SPADCALL |maxlts| (QREFELT $ 43)))))))))) 

(SDEFUN |SFQCMPK;removeAssociates| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G351 NIL) (|p| NIL) (#2=#:G350 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 84)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 17))))) 

(SDEFUN |SFQCMPK;branchIfCan;LTSL5BU;20|
        ((|leq| |List| P) (|ts| TS) (|lineq| |List| P) (|b1| |Boolean|)
         (|b2| |Boolean|) (|b3| |Boolean|) (|b4| |Boolean|) (|b5| |Boolean|)
         ($ |Union|
          (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                    (|:| |ineq| (|List| P)))
          "failed"))
        (SPROG
         ((|newleq| (|List| P)) (#1=#:G390 NIL) (|newp| (P)) (#2=#:G372 NIL)
          (|g| (P)) (#3=#:G394 NIL) (|q| NIL) (#4=#:G393 NIL) (|p| NIL)
          (#5=#:G387 NIL) (#6=#:G392 NIL) (#7=#:G388 NIL) (#8=#:G391 NIL)
          (|ps| (|GeneralPolynomialSet| R E V P)) (#9=#:G389 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|b1|
              (SEQ
               (EXIT
                (SEQ (LETT |leq| (|SFQCMPK;removeAssociates| |leq| $))
                     (LETT |leq| (SPADCALL (ELT $ 68) |leq| (QREFELT $ 86)))
                     (EXIT
                      (COND
                       ((SPADCALL (ELT $ 87) |leq| (QREFELT $ 88))
                        (PROGN
                         (LETT #9#
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #10=#:G386)))
                         (GO #11=#:G359)))))))
               #11# (EXIT #9#))))
            (COND
             (|b2|
              (COND
               ((SPADCALL (ELT $ 68) |lineq| (QREFELT $ 88))
                (PROGN (LETT #1# (CONS 1 "failed")) (GO #10#)))
               ('T (LETT |lineq| (SPADCALL |lineq| (QREFELT $ 89)))))))
            (COND
             (|b3|
              (SEQ (LETT |ps| (SPADCALL |leq| (QREFELT $ 91)))
                   (EXIT
                    (SEQ
                     (EXIT
                      (SEQ (LETT |q| NIL) (LETT #8# |lineq|) G190
                           (COND
                            ((OR (ATOM #8#) (PROGN (LETT |q| (CAR #8#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QVELT (SPADCALL |q| |ps| (QREFELT $ 93)) 1)
                                (QREFELT $ 68))
                               (PROGN
                                (LETT #7#
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed"))
                                       (GO #10#)))
                                (GO #12=#:G365))))))
                           (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL)))
                     #12# (EXIT #7#))))))
            (COND
             ((OR (NULL |leq|) (NULL |lineq|))
              (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
            (COND
             (|b4|
              (SEQ
               (EXIT
                (SEQ (LETT |q| NIL) (LETT #6# |lineq|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |q| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |q| |ts| (QREFELT $ 67))
                                   (QREFELT $ 68))
                         (PROGN
                          (LETT #5#
                                (PROGN (LETT #1# (CONS 1 "failed")) (GO #10#)))
                          (GO #13=#:G370))))))
                     (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL)))
               #13# (EXIT #5#))))
            (COND
             (|b5|
              (SEQ (LETT |newleq| NIL)
                   (SEQ (LETT |p| NIL) (LETT #4# |leq|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |q| NIL) (LETT #3# |lineq|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |q| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |p| (QREFELT $ 45))
                                             (SPADCALL |q| (QREFELT $ 45))
                                             (QREFELT $ 94))
                                   (SEQ
                                    (LETT |g|
                                          (SPADCALL |p| |q| (QREFELT $ 95)))
                                    (LETT |newp|
                                          (PROG2
                                              (LETT #2#
                                                    (SPADCALL |p| |g|
                                                              (QREFELT $ 96)))
                                              (QCDR #2#)
                                            (|check_union2| (QEQCAR #2# 0)
                                                            (QREFELT $ 9)
                                                            (|Union|
                                                             (QREFELT $ 9)
                                                             "failed")
                                                            #2#)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |newp| (QREFELT $ 87))
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #10#)))
                                      ('T
                                       (LETT |newleq|
                                             (CONS |newp| |newleq|)))))))
                                  ('T (LETT |newleq| (CONS |p| |newleq|))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |leq| |newleq|)))))
            (LETT |leq|
                  (SPADCALL (ELT $ 16) (SPADCALL |leq| (QREFELT $ 17))
                            (QREFELT $ 19)))
            (EXIT (CONS 0 (VECTOR |leq| |ts| |lineq|)))))
          #10# (EXIT #1#)))) 

(SDEFUN |SFQCMPK;prepareDecompose;LL2BL;21|
        ((|lp| |List| P) (|lts| |List| TS) (|b1| |Boolean|) (|b2| |Boolean|)
         ($ |List|
          (|Record| (|:| |eq| #1=(|List| P)) (|:| |tower| TS)
                    (|:| |ineq| #2=(|List| P)))))
        (SPROG
         ((#3=#:G433 NIL) (|ts| (TS)) (#4=#:G432 NIL)
          (|toSee|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (|lq| (|List| P))
          (|branches|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P)))))
          (#5=#:G403 NIL)
          (|newBranch|
           #6=(|Union|
               (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                         (|:| |ineq| (|List| P)))
               "failed"))
          (|lineq| #2#) (|leq| #1#) (|ubf2| #6#) (|ubf1| #6#) (#7=#:G431 NIL)
          (|branch| NIL) (#8=#:G430 NIL) (|f| NIL) (|lsfp| (|List| P))
          (#9=#:G429 NIL) (|p| NIL) (#10=#:G428 NIL) (#11=#:G427 NIL))
         (SEQ
          (LETT |lp|
                (SPADCALL (ELT $ 16)
                          (SPADCALL (ELT $ 68)
                                    (|SFQCMPK;removeAssociates| |lp| $)
                                    (QREFELT $ 86))
                          (QREFELT $ 19)))
          (EXIT
           (COND
            ((OR (SPADCALL (ELT $ 87) |lp| (QREFELT $ 88)) (NULL |lts|)) NIL)
            ('T
             (SEQ (COND (|b1| (LETT |lts| (SPADCALL |lts| (QREFELT $ 83)))))
                  (EXIT
                   (COND
                    (|b2|
                     (SEQ (LETT |lq| NIL)
                          (LETT |toSee|
                                (PROGN
                                 (LETT #11# NIL)
                                 (SEQ (LETT |ts| NIL) (LETT #10# |lts|) G190
                                      (COND
                                       ((OR (ATOM #10#)
                                            (PROGN (LETT |ts| (CAR #10#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11#
                                              (CONS
                                               (VECTOR |lq| |ts|
                                                       (|SFQCMPK;squareFreeFactors|
                                                        (SPADCALL |ts|
                                                                  (QREFELT $
                                                                           69))
                                                        $))
                                               #11#))))
                                      (LETT #10# (CDR #10#)) (GO G190) G191
                                      (EXIT (NREVERSE #11#)))))
                          (EXIT
                           (COND ((NULL |lp|) |toSee|)
                                 (#12='T
                                  (SEQ
                                   (SEQ (LETT |p| NIL) (LETT #9# |lp|) G190
                                        (COND
                                         ((OR (ATOM #9#)
                                              (PROGN (LETT |p| (CAR #9#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |lsfp|
                                               (SPADCALL |p| (QREFELT $ 13)))
                                         (LETT |branches| NIL) (LETT |lq| NIL)
                                         (SEQ (LETT |f| NIL) (LETT #8# |lsfp|)
                                              G190
                                              (COND
                                               ((OR (ATOM #8#)
                                                    (PROGN
                                                     (LETT |f| (CAR #8#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ (LETT |branch| NIL)
                                                    (LETT #7# |toSee|) G190
                                                    (COND
                                                     ((OR (ATOM #7#)
                                                          (PROGN
                                                           (LETT |branch|
                                                                 (CAR #7#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |leq|
                                                           (QVELT |branch| 0))
                                                     (LETT |ts|
                                                           (QVELT |branch| 1))
                                                     (LETT |lineq|
                                                           (QVELT |branch| 2))
                                                     (LETT |ubf1|
                                                           (SPADCALL |leq| |ts|
                                                                     |lq| NIL
                                                                     NIL 'T 'T
                                                                     'T
                                                                     (QREFELT $
                                                                              99)))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |ubf1| 1)
                                                        "leave")
                                                       ('T
                                                        (SEQ
                                                         (LETT |ubf2|
                                                               (SPADCALL
                                                                (LIST |f|) |ts|
                                                                |lineq| NIL NIL
                                                                'T 'T 'T
                                                                (QREFELT $
                                                                         99)))
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
                                                                      (QREFELT
                                                                       $ 14))
                                                                     (QREFELT $
                                                                              17))
                                                                    (QREFELT $
                                                                             19)))
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
                                                                      (QREFELT
                                                                       $ 14))
                                                                     (QREFELT $
                                                                              17))
                                                                    (QREFELT $
                                                                             19)))
                                                             (LETT |newBranch|
                                                                   (SPADCALL
                                                                    |leq| |ts|
                                                                    |lineq| NIL
                                                                    NIL NIL NIL
                                                                    NIL
                                                                    (QREFELT $
                                                                             99)))
                                                             (EXIT
                                                              (LETT |branches|
                                                                    (CONS
                                                                     (PROG2
                                                                         (LETT
                                                                          #5#
                                                                          |newBranch|)
                                                                         (QCDR
                                                                          #5#)
                                                                       (|check_union2|
                                                                        (QEQCAR
                                                                         #5# 0)
                                                                        (|Record|
                                                                         (|:|
                                                                          |eq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            9)))
                                                                         (|:|
                                                                          |tower|
                                                                          (QREFELT
                                                                           $
                                                                           10))
                                                                         (|:|
                                                                          |ineq|
                                                                          (|List|
                                                                           (QREFELT
                                                                            $
                                                                            9))))
                                                                        (|Union|
                                                                         (|Record|
                                                                          (|:|
                                                                           |eq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             9)))
                                                                          (|:|
                                                                           |tower|
                                                                           (QREFELT
                                                                            $
                                                                            10))
                                                                          (|:|
                                                                           |ineq|
                                                                           (|List|
                                                                            (QREFELT
                                                                             $
                                                                             9))))
                                                                         "failed")
                                                                        #5#))
                                                                     |branches|))))))))))))
                                                    (LETT #7# (CDR #7#))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |lq| (CONS |f| |lq|))))
                                              (LETT #8# (CDR #8#)) (GO G190)
                                              G191 (EXIT NIL))
                                         (EXIT (LETT |toSee| |branches|)))
                                        (LETT #9# (CDR #9#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT
                                    (SPADCALL
                                     (CONS
                                      #'|SFQCMPK;prepareDecompose;LL2BL;21!0|
                                      $)
                                     |toSee| (QREFELT $ 102)))))))))
                    (#12#
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ts| NIL) (LETT #3# |lts|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |ts| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS
                                    (VECTOR |lp| |ts|
                                            (|SFQCMPK;squareFreeFactors|
                                             (SPADCALL |ts| (QREFELT $ 69)) $))
                                    #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#)))))))))))))) 

(SDEFUN |SFQCMPK;prepareDecompose;LL2BL;21!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QVELT |x| 1) (QVELT |y| 1) (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |SquareFreeQuasiComponentPackage;|)) 

(DEFUN |SquareFreeQuasiComponentPackage| (&REST #1=#:G434)
  (SPROG NIL
         (PROG (#2=#:G435)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SquareFreeQuasiComponentPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SquareFreeQuasiComponentPackage;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SquareFreeQuasiComponentPackage|)))))))))) 

(DEFUN |SquareFreeQuasiComponentPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$|
          (LIST '|SquareFreeQuasiComponentPackage| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 104))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|SquareFreeQuasiComponentPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#5|
                     (LIST '|SquareFreeRegularTriangularSetCategory|
                           (|devaluate| |#1|) (|devaluate| |#2|)
                           (|devaluate| |#3|) (|devaluate| |#4|)))
      (QSETREFV $ 72
                (CONS
                 (|dispatchFunction|
                  |SFQCMPK;internalSubQuasiComponent?;2TSU;13|)
                 $)))
     ('T
      (QSETREFV $ 72
                (CONS
                 (|dispatchFunction|
                  |SFQCMPK;internalSubQuasiComponent?;2TSU;14|)
                 $))))
    $))) 

(MAKEPROP '|SquareFreeQuasiComponentPackage| '|infovec|
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
              (43 . |startStats!|) (48 . |void|) |SFQCMPK;startTable!;3SV;2|
              (52 . |makingStats?|) (56 . |printStats!|) (60 . |clearTable!|)
              |SFQCMPK;stopTable!;V;3| (|NonNegativeInteger|) (64 . |#|)
              (69 . >) (75 . |members|) |SFQCMPK;supDimElseRittWu?;2TSB;4|
              (|List| 10) (80 . |removeDuplicates|) (|Mapping| 15 10 10)
              (85 . |sort|) |SFQCMPK;algebraicSort;2L;5| (91 . |empty?|)
              (96 . |mvar|) (101 . |algebraic?|)
              |SFQCMPK;moreAlgebraic?;2TSB;6| (107 . |mvar|) (112 . >)
              (118 . <) (|Union| $ '#1="failed") (124 . |rest|)
              |SFQCMPK;subTriSet?;2TSB;7| (|Union| 9 '#1#) (129 . |first|)
              (134 . =) (140 . |associates?|)
              |SFQCMPK;internalSubPolSet?;2LB;8| |SFQCMPK;subPolSet?;2LB;9|
              |SFQCMPK;internalInfRittWu?;2LB;11| |SFQCMPK;infRittWu?;2LB;10|
              |SFQCMPK;subQuasiComponent?;2TSB;15|
              (|Record| (|:| |val| 11) (|:| |tower| 10))
              |SFQCMPK;subCase?;2RB;12| (146 . |mdeg|) (151 . |select|)
              (157 . |initiallyReduce|) (163 . |zero?|) (168 . |initials|)
              (173 . |invertible?|) (|Union| 15 '"failed")
              (179 . |internalSubQuasiComponent?|) (185 . |reduceByQuasiMonic|)
              (191 . |extractIfCan|) (196 . |insert!|)
              |SFQCMPK;subQuasiComponent?;TSLB;16| (|Mapping| 15 63 63)
              (|List| 63) (202 . |sort|) (208 . |setrest!|)
              |SFQCMPK;removeSuperfluousCases;2L;17| (214 . |setrest!|)
              |SFQCMPK;removeSuperfluousQuasiComponents;2L;18|
              (220 . |primitivePart|) (|Mapping| 15 9) (225 . |remove|)
              (231 . |ground?|) (236 . |any?|) (242 . |removeRedundantFactors|)
              (|GeneralPolynomialSet| 6 7 8 9) (247 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (252 . |remainder|) (258 . =) (264 . |gcd|) (270 . |exquo|)
              (|Record| (|:| |eq| 11) (|:| |tower| 10) (|:| |ineq| 11))
              (|Union| 97 '"failed") |SFQCMPK;branchIfCan;LTSL5BU;20|
              (|Mapping| 15 97 97) (|List| 97) (276 . |sort|)
              |SFQCMPK;prepareDecompose;LL2BL;21|)
           '#(|supDimElseRittWu?| 282 |subTriSet?| 288 |subQuasiComponent?| 294
              |subPolSet?| 306 |subCase?| 312 |stopTable!| 318 |startTable!|
              322 |removeSuperfluousQuasiComponents| 329
              |removeSuperfluousCases| 334 |prepareDecompose| 339
              |moreAlgebraic?| 347 |internalSubQuasiComponent?| 353
              |internalSubPolSet?| 359 |internalInfRittWu?| 365 |infRittWu?|
              371 |branchIfCan| 377 |algebraicSort| 389)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 103
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
                                                   11 0 69 2 10 15 9 0 70 2 0
                                                   71 10 10 72 2 10 9 9 0 73 1
                                                   22 71 21 74 2 22 20 21 15 75
                                                   2 78 0 77 0 79 2 78 0 0 0 80
                                                   2 39 0 0 0 82 1 9 0 0 84 2
                                                   11 0 85 0 86 1 9 15 0 87 2
                                                   11 15 85 0 88 1 12 11 11 89
                                                   1 90 0 11 91 2 90 92 9 0 93
                                                   2 8 15 0 0 94 2 9 0 0 0 95 2
                                                   9 51 0 0 96 2 101 0 100 0
                                                   102 2 0 15 10 10 38 2 0 15
                                                   10 10 53 2 0 15 10 39 76 2 0
                                                   15 10 10 62 2 0 15 11 11 59
                                                   2 0 15 63 63 64 0 0 20 33 3
                                                   0 20 24 24 24 29 1 0 39 39
                                                   83 1 0 78 78 81 4 0 101 11
                                                   39 15 15 103 2 0 15 10 10 47
                                                   2 0 71 10 10 72 2 0 15 11 11
                                                   58 2 0 15 11 11 60 2 0 15 11
                                                   11 61 8 0 98 11 10 11 15 15
                                                   15 15 15 99 1 0 39 39
                                                   43)))))
           '|lookupComplete|)) 
