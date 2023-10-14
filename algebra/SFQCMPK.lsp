
(/VERSIONCHECK 2) 

(DEFUN |SFQCMPK;squareFreeFactors| (|lp| $)
  (PROG (|lsflp| |lsfp| #1=#:G172 |p|)
    (RETURN
     (SEQ (LETT |lsflp| NIL . #2=(|SFQCMPK;squareFreeFactors|))
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

(DEFUN |SFQCMPK;startTable!;3SV;2| (|ok| |ko| |domainName| $)
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

(DEFUN |SFQCMPK;stopTable!;V;3| ($)
  (SEQ (COND ((SPADCALL (QREFELT $ 30)) (SPADCALL (QREFELT $ 31))))
       (EXIT (SPADCALL (QREFELT $ 32))))) 

(DEFUN |SFQCMPK;supDimElseRittWu?;2TSB;4| (|ts| |us| $)
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
               . #2=(|SFQCMPK;supDimElseRittWu?;2TSB;4|))
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

(DEFUN |SFQCMPK;algebraicSort;2L;5| (|lts| $)
  (SEQ
   (LETT |lts| (SPADCALL |lts| (QREFELT $ 40)) |SFQCMPK;algebraicSort;2L;5|)
   (EXIT (SPADCALL (ELT $ 38) |lts| (QREFELT $ 42))))) 

(DEFUN |SFQCMPK;moreAlgebraic?;2TSB;6| (|ts| |us| $)
  (PROG (#1=#:G194 #2=#:G199 #3=#:G200 |p|)
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
                 (SEQ (LETT |p| NIL . #4=(|SFQCMPK;moreAlgebraic?;2TSB;6|))
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

(DEFUN |SFQCMPK;subTriSet?;2TSB;7| (|ts| |us| $)
  (PROG (#1=#:G202 #2=#:G205)
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
                                . #3=(|SFQCMPK;subTriSet?;2TSB;7|))
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

(DEFUN |SFQCMPK;internalSubPolSet?;2LB;8| (|lp1| |lp2| $)
  (COND ((NULL |lp1|) 'T) ((NULL |lp2|) 'NIL)
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 57))
         (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 58)))
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 16))
         'NIL)
        ('T (SPADCALL |lp1| (CDR |lp2|) (QREFELT $ 58))))) 

(DEFUN |SFQCMPK;subPolSet?;2LB;9| (|lp1| |lp2| $)
  (SEQ
   (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19))
         . #1=(|SFQCMPK;subPolSet?;2LB;9|))
   (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)) . #1#)
   (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 58))))) 

(DEFUN |SFQCMPK;infRittWu?;2LB;10| (|lp1| |lp2| $)
  (SEQ
   (LETT |lp1| (SPADCALL (ELT $ 16) |lp1| (QREFELT $ 19))
         . #1=(|SFQCMPK;infRittWu?;2LB;10|))
   (LETT |lp2| (SPADCALL (ELT $ 16) |lp2| (QREFELT $ 19)) . #1#)
   (EXIT (SPADCALL |lp1| |lp2| (QREFELT $ 60))))) 

(DEFUN |SFQCMPK;internalInfRittWu?;2LB;11| (|lp1| |lp2| $)
  (COND ((NULL |lp1|) (COND ((NULL |lp2|) 'NIL) (#1='T 'T)))
        ((NULL |lp2|) 'NIL)
        ((SPADCALL (|SPADfirst| |lp1|) (|SPADfirst| |lp2|) (QREFELT $ 16)) 'T)
        ((SPADCALL (|SPADfirst| |lp2|) (|SPADfirst| |lp1|) (QREFELT $ 16))
         'NIL)
        (#1# (SPADCALL (CDR |lp1|) (CDR |lp2|) (QREFELT $ 61))))) 

(DEFUN |SFQCMPK;subCase?;2RB;12| (|lpwt1| |lpwt2| $)
  (COND ((NULL (SPADCALL (QCAR |lpwt2|) (QCAR |lpwt1|) (QREFELT $ 58))) 'NIL)
        ('T (SPADCALL (QCDR |lpwt1|) (QCDR |lpwt2|) (QREFELT $ 62))))) 

(DEFUN |SFQCMPK;internalSubQuasiComponent?;2TSU;13| (|ts| |us| $)
  (PROG (#1=#:G259 |b| #2=#:G262 |p| |lsfp| #3=#:G251 #4=#:G261 #5=#:G249
         #6=#:G246 #7=#:G260)
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
                        . #8=(|SFQCMPK;internalSubQuasiComponent?;2TSU;13|))
                  (LETT #7# (SPADCALL |us| (QREFELT $ 37)) . #8#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |p| (QREFELT $ 65))
                         (SPADCALL
                          (PROG2
                              (LETT #6#
                                    (SPADCALL |ts|
                                              (SPADCALL |p| (QREFELT $ 45))
                                              (QREFELT $ 66))
                                    . #8#)
                              (QCDR #6#)
                            (|check_union| (QEQCAR #6# 0) (QREFELT $ 9) #6#))
                          (QREFELT $ 65)))
                      (PROGN
                       (LETT #5#
                             (PROGN
                              (LETT #1# (CONS 1 "failed") . #8#)
                              (GO #1#))
                             . #8#)
                       (GO #5#))))))
                  (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL)))
                #5# (EXIT #5#))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #8#)
                      (LETT #4# (SPADCALL |us| (QREFELT $ 37)) . #8#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #8#) NIL))
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
                                  (LETT #1# (CONS 1 "failed") . #8#)
                                  (GO #1#))
                                 . #8#)
                           (GO #3#))))))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191 (EXIT NIL)))
                #3# (EXIT #3#))
               (LETT |lsfp|
                     (|SFQCMPK;squareFreeFactors|
                      (SPADCALL |us| (QREFELT $ 69)) $)
                     . #8#)
               (SEQ (LETT |p| NIL . #8#) (LETT #2# |lsfp| . #8#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #8#) NIL))
                      (GO G191)))
                    (SEQ (LETT |b| (SPADCALL |p| |ts| (QREFELT $ 70)) . #8#)
                         (EXIT
                          (COND
                           ((NULL |b|)
                            (PROGN (LETT #1# (CONS 0 'NIL) . #8#) (GO #1#))))))
                    (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
               (EXIT (CONS 0 'T))))))
      #1# (EXIT #1#))))) 

(DEFUN |SFQCMPK;internalSubQuasiComponent?;2TSU;14| (|ts| |us| $)
  (PROG (#1=#:G273 #2=#:G276 #3=#:G278 |p| #4=#:G271 #5=#:G268 #6=#:G277)
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
                        . #7=(|SFQCMPK;internalSubQuasiComponent?;2TSU;14|))
                  (LETT #6# (SPADCALL |us| (QREFELT $ 37)) . #7#) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |p| (QREFELT $ 65))
                         (SPADCALL
                          (PROG2
                              (LETT #5#
                                    (SPADCALL |ts|
                                              (SPADCALL |p| (QREFELT $ 45))
                                              (QREFELT $ 66))
                                    . #7#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 0) (QREFELT $ 9) #5#))
                          (QREFELT $ 65)))
                      (PROGN
                       (LETT #4#
                             (PROGN
                              (LETT #2# (CONS 1 "failed") . #7#)
                              (GO #2#))
                             . #7#)
                       (GO #4#))))))
                  (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #4#))
               (SEQ
                (EXIT
                 (SEQ (LETT |p| NIL . #7#)
                      (LETT #3# (SPADCALL |us| (QREFELT $ 37)) . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #7#) NIL))
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
                                  (LETT #2# (CONS 1 "failed") . #7#)
                                  (GO #2#))
                                 . #7#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT (CONS 0 'T))))))
      #2# (EXIT #2#))))) 

(DEFUN |SFQCMPK;subQuasiComponent?;2TSB;15| (|ts| |us| $)
  (PROG (|b| |ubf| |e| |k|)
    (RETURN
     (SEQ
      (LETT |k| (CONS |ts| |us|) . #1=(|SFQCMPK;subQuasiComponent?;2TSB;15|))
      (LETT |e| (SPADCALL |k| (QREFELT $ 74)) . #1#)
      (EXIT
       (COND ((QEQCAR |e| 0) (QCDR |e|))
             (#2='T
              (SEQ (LETT |ubf| (SPADCALL |ts| |us| (QREFELT $ 72)) . #1#)
                   (LETT |b| (COND ((QEQCAR |ubf| 0) (QCDR |ubf|)) (#2# 'NIL))
                         . #1#)
                   (SPADCALL |k| |b| (QREFELT $ 75)) (EXIT |b|))))))))) 

(DEFUN |SFQCMPK;subQuasiComponent?;TSLB;16| (|ts| |lus| $)
  (PROG (#1=#:G287 #2=#:G289 #3=#:G290 |us|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |us| NIL . #4=(|SFQCMPK;subQuasiComponent?;TSLB;16|))
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

(DEFUN |SFQCMPK;removeSuperfluousCases;2L;17| (|cases| $)
  (PROG (|toSee| |headmaxcases| |copymaxcases| |maxcases| |toSave| |lpwt1|
         #1=#:G317 |lpwt2|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |cases|) 2) |cases|)
            ('T
             (SEQ
              (LETT |toSee|
                    (SPADCALL
                     (CONS #'|SFQCMPK;removeSuperfluousCases;2L;17!0| $)
                     |cases| (QREFELT $ 79))
                    . #2=(|SFQCMPK;removeSuperfluousCases;2L;17|))
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
                                             (QREFELT $ 80))
                                   (EXIT
                                    (LETT |headmaxcases| (CDR |headmaxcases|)
                                          . #2#)))))))))
                        (EXIT (LETT |toSee| (REVERSE |toSave|) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |maxcases|)))))))) 

(DEFUN |SFQCMPK;removeSuperfluousCases;2L;17!0| (|x| |y| $)
  (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 38))) 

(DEFUN |SFQCMPK;removeSuperfluousQuasiComponents;2L;18| (|lts| $)
  (PROG (|toSee| |headmaxlts| |copymaxlts| |maxlts| |toSave| |ts| #1=#:G334
         |us|)
    (RETURN
     (SEQ
      (LETT |lts| (SPADCALL |lts| (QREFELT $ 40))
            . #2=(|SFQCMPK;removeSuperfluousQuasiComponents;2L;18|))
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
                                                  (QREFELT $ 82))
                                        (EXIT
                                         (LETT |headmaxlts| (CDR |headmaxlts|)
                                               . #2#)))))))))
                             (EXIT (LETT |toSee| (REVERSE |toSave|) . #2#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |maxlts| (QREFELT $ 43))))))))))) 

(DEFUN |SFQCMPK;removeAssociates| (|lp| $)
  (PROG (#1=#:G338 |p| #2=#:G337)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|SFQCMPK;removeAssociates|))
        (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 84)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 17)))))) 

(DEFUN |SFQCMPK;branchIfCan;LTSL5BU;20|
       (|leq| |ts| |lineq| |b1| |b2| |b3| |b4| |b5| $)
  (PROG (|newleq| #1=#:G373 |newp| #2=#:G359 |g| #3=#:G377 |q| #4=#:G376 |p|
         #5=#:G357 #6=#:G375 #7=#:G352 #8=#:G374 |ps| #9=#:G346)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         (|b1|
          (SEQ
           (EXIT
            (SEQ
             (LETT |leq| (|SFQCMPK;removeAssociates| |leq| $)
                   . #10=(|SFQCMPK;branchIfCan;LTSL5BU;20|))
             (LETT |leq| (SPADCALL (ELT $ 68) |leq| (QREFELT $ 86)) . #10#)
             (EXIT
              (COND
               ((SPADCALL (ELT $ 87) |leq| (QREFELT $ 88))
                (PROGN
                 (LETT #9# (PROGN (LETT #1# (CONS 1 "failed") . #10#) (GO #1#))
                       . #10#)
                 (GO #9#)))))))
           #9# (EXIT #9#))))
        (COND
         (|b2|
          (COND
           ((SPADCALL (ELT $ 68) |lineq| (QREFELT $ 88))
            (PROGN (LETT #1# (CONS 1 "failed") . #10#) (GO #1#)))
           ('T (LETT |lineq| (SPADCALL |lineq| (QREFELT $ 89)) . #10#)))))
        (COND
         (|b3|
          (SEQ (LETT |ps| (SPADCALL |leq| (QREFELT $ 91)) . #10#)
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
                            (QVELT (SPADCALL |q| |ps| (QREFELT $ 93)) 1)
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
                                         (QREFELT $ 94))
                               (SEQ
                                (LETT |g| (SPADCALL |p| |q| (QREFELT $ 95))
                                      . #10#)
                                (LETT |newp|
                                      (PROG2
                                          (LETT #2#
                                                (SPADCALL |p| |g|
                                                          (QREFELT $ 96))
                                                . #10#)
                                          (QCDR #2#)
                                        (|check_union| (QEQCAR #2# 0)
                                                       (QREFELT $ 9) #2#))
                                      . #10#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |newp| (QREFELT $ 87))
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

(DEFUN |SFQCMPK;prepareDecompose;LL2BL;21| (|lp| |lts| |b1| |b2| $)
  (PROG (#1=#:G415 |ts| #2=#:G414 |toSee| |lq| |branches| #3=#:G386 |newBranch|
         |lineq| |leq| |ubf2| |ubf1| #4=#:G413 |branch| #5=#:G412 |f| |lsfp|
         #6=#:G411 |p| #7=#:G410 #8=#:G409)
    (RETURN
     (SEQ
      (LETT |lp|
            (SPADCALL (ELT $ 16)
                      (SPADCALL (ELT $ 68) (|SFQCMPK;removeAssociates| |lp| $)
                                (QREFELT $ 86))
                      (QREFELT $ 19))
            . #9=(|SFQCMPK;prepareDecompose;LL2BL;21|))
      (EXIT
       (COND ((OR (SPADCALL (ELT $ 87) |lp| (QREFELT $ 88)) (NULL |lts|)) NIL)
             ('T
              (SEQ
               (COND (|b1| (LETT |lts| (SPADCALL |lts| (QREFELT $ 83)) . #9#)))
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
                                                    (|SFQCMPK;squareFreeFactors|
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
                                                                           99))
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
                                                             (QREFELT $ 99))
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
                                                                           99))
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
                                  (CONS #'|SFQCMPK;prepareDecompose;LL2BL;21!0|
                                        $)
                                  |toSee| (QREFELT $ 102)))))))))
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
                                         (|SFQCMPK;squareFreeFactors|
                                          (SPADCALL |ts| (QREFELT $ 69)) $))
                                 #2#)
                                . #9#)))
                        (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))))))))) 

(DEFUN |SFQCMPK;prepareDecompose;LL2BL;21!0| (|x| |y| $)
  (SPADCALL (QVELT |x| 1) (QVELT |y| 1) (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |SquareFreeQuasiComponentPackage;|)) 

(DEFUN |SquareFreeQuasiComponentPackage| (&REST #1=#:G416)
  (PROG ()
    (RETURN
     (PROG (#2=#:G417)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SquareFreeQuasiComponentPackage|)
                                           '|domainEqualList|)
                . #3=(|SquareFreeQuasiComponentPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |SquareFreeQuasiComponentPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|SquareFreeQuasiComponentPackage|))))))))))) 

(DEFUN |SquareFreeQuasiComponentPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SquareFreeQuasiComponentPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|SquareFreeQuasiComponentPackage| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 104) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
      $)))) 

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
