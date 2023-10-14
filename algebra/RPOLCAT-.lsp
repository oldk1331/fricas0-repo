
(DEFUN |RPOLCAT-;coerce;SOf;1| (|p| $)
  (PROG (#1=#:G255 |dp| |tp| |ip|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |p| (QREFELT $ 11))
         (SPADCALL (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 14)))
        (#2='T
         (SEQ
          (SEQ
           (LETT |ip| (SPADCALL |p| (QREFELT $ 15))
                 . #3=(|RPOLCAT-;coerce;SOf;1|))
           (EXIT
            (COND
             ((SPADCALL |ip| (|spadConstant| $ 16) (QREFELT $ 18))
              (COND
               ((SPADCALL (LETT |tp| (SPADCALL |p| (QREFELT $ 19)) . #3#)
                          (QREFELT $ 20))
                (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)) . #3#)
                     (EXIT
                      (COND
                       ((EQL |dp| 1)
                        (PROGN
                         (LETT #1#
                               (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                         (QREFELT $ 24))
                               . #3#)
                         (GO #1#)))
                       (#2#
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                          (QREFELT $ 24))
                                (SPADCALL |dp| (QREFELT $ 25)) (QREFELT $ 26))
                               . #3#)
                         (GO #1#)))))))
               (#2#
                (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)) . #3#)
                     (EXIT
                      (COND
                       ((EQL |dp| 1)
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                          (QREFELT $ 24))
                                (SPADCALL |tp| (QREFELT $ 27)) (QREFELT $ 28))
                               . #3#)
                         (GO #1#)))
                       (#2#
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                           (QREFELT $ 24))
                                 (SPADCALL |dp| (QREFELT $ 25)) (QREFELT $ 26))
                                (SPADCALL |tp| (QREFELT $ 27)) (QREFELT $ 28))
                               . #3#)
                         (GO #1#)))))))))
             ((SPADCALL (LETT |tp| (SPADCALL |p| (QREFELT $ 19)) . #3#)
                        (QREFELT $ 20))
              (SEQ (LETT |dp| (SPADCALL |p| (QREFELT $ 22)) . #3#)
                   (EXIT
                    (COND
                     ((EQL |dp| 1)
                      (PROGN
                       (LETT #1#
                             (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                 (QREFELT $ 24))
                                       (QREFELT $ 29))
                             . #3#)
                       (GO #1#)))
                     (#2#
                      (PROGN
                       (LETT #1#
                             (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        (SPADCALL |dp| (QREFELT $ 25))
                                        (QREFELT $ 26))
                                       (QREFELT $ 29))
                             . #3#)
                       (GO #1#)))))))
             ((EQL (SPADCALL |p| (QREFELT $ 22)) 1)
              (PROGN
               (LETT #1#
                     (SPADCALL
                      (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                                          (QREFELT $ 24))
                                (QREFELT $ 29))
                      (SPADCALL |tp| (QREFELT $ 27)) (QREFELT $ 28))
                     . #3#)
               (GO #1#))))))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ip| (QREFELT $ 27))
                      (SPADCALL
                       (SPADCALL (SPADCALL |p| (QREFELT $ 23)) (QREFELT $ 24))
                       (SPADCALL (SPADCALL |p| (QREFELT $ 22)) (QREFELT $ 25))
                       (QREFELT $ 26))
                      (QREFELT $ 29))
            (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 27))
            (QREFELT $ 28)))))))
      #1# (EXIT #1#))))) 

(DEFUN |RPOLCAT-;mvar;SV;2| (|p| $)
  (PROG (#1=#:G257)
    (RETURN
     (COND
      ((SPADCALL |p| (QREFELT $ 11))
       (|error| "Error in mvar from RPOLCAT : #1 is constant."))
      ('T
       (PROG2 (LETT #1# (SPADCALL |p| (QREFELT $ 32)) |RPOLCAT-;mvar;SV;2|)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))))))) 

(DEFUN |RPOLCAT-;mdeg;SNni;3| (|p| $)
  (PROG (#1=#:G262)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 11)) 0)
           ('T
            (SPADCALL |p|
                      (PROG2
                          (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                                |RPOLCAT-;mdeg;SNni;3|)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                      (QREFELT $ 34))))))) 

(DEFUN |RPOLCAT-;init;2S;4| (|p| $)
  (PROG (|v| #1=#:G267)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 11))
        (|error| "Error in mvar from RPOLCAT : #1 is constant."))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                         . #2=(|RPOLCAT-;init;2S;4|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
               . #2#)
         (EXIT
          (SPADCALL |p| |v| (SPADCALL |p| |v| (QREFELT $ 34))
                    (QREFELT $ 36)))))))))) 

(DEFUN |RPOLCAT-;leadingCoefficient;SVS;5| (|p| |v| $)
  (PROG (|d|)
    (RETURN
     (COND
      ((ZEROP
        (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34))
              |RPOLCAT-;leadingCoefficient;SVS;5|))
       |p|)
      ('T (SPADCALL |p| |v| |d| (QREFELT $ 36))))))) 

(DEFUN |RPOLCAT-;head;2S;6| (|p| $)
  (PROG (|d| |v| #1=#:G275)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
            ('T
             (SEQ
              (LETT |v|
                    (PROG2
                        (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                              . #2=(|RPOLCAT-;head;2S;6|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                    . #2#)
              (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34)) . #2#)
              (EXIT
               (SPADCALL (SPADCALL |p| |v| |d| (QREFELT $ 36)) |v| |d|
                         (QREFELT $ 39)))))))))) 

(DEFUN |RPOLCAT-;reductum;SVS;7| (|p| |v| $)
  (PROG (|d|)
    (RETURN
     (COND
      ((ZEROP
        (LETT |d| (SPADCALL |p| |v| (QREFELT $ 34)) |RPOLCAT-;reductum;SVS;7|))
       (|spadConstant| $ 41))
      ('T
       (SPADCALL |p|
                 (SPADCALL (SPADCALL |p| |v| |d| (QREFELT $ 36)) |v| |d|
                           (QREFELT $ 39))
                 (QREFELT $ 42))))))) 

(DEFUN |RPOLCAT-;tail;2S;8| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 41))
        ('T (SPADCALL |p| (SPADCALL |p| (QREFELT $ 44)) (QREFELT $ 42))))) 

(DEFUN |RPOLCAT-;deepestTail;2S;9| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 41))
        ((OR (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 11))
             (SPADCALL (SPADCALL |p| (QREFELT $ 23))
                       (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 23))
                       (QREFELT $ 46)))
         (SPADCALL |p| (QREFELT $ 19)))
        ('T (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 47))))) 

(DEFUN |RPOLCAT-;iteratedInitials;SL;10| (|p| $)
  (SEQ
   (COND ((SPADCALL |p| (QREFELT $ 11)) NIL)
         ('T
          (SEQ
           (LETT |p| (SPADCALL |p| (QREFELT $ 15))
                 |RPOLCAT-;iteratedInitials;SL;10|)
           (EXIT (CONS |p| (SPADCALL |p| (QREFELT $ 50))))))))) 

(DEFUN |RPOLCAT-;localDeepestInitial| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
        ('T (|RPOLCAT-;localDeepestInitial| (SPADCALL |p| (QREFELT $ 15)) $)))) 

(DEFUN |RPOLCAT-;deepestInitial;2S;12| (|p| $)
  (COND
   ((SPADCALL |p| (QREFELT $ 11))
    (|error| "Error in deepestInitial from RPOLCAT : #1 is constant."))
   ('T (|RPOLCAT-;localDeepestInitial| (SPADCALL |p| (QREFELT $ 15)) $)))) 

(DEFUN |RPOLCAT-;monic?;SB;13| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 11)) 'NIL)
        ('T
         (QEQCAR (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 54)) 0)))) 

(DEFUN |RPOLCAT-;quasiMonic?;SB;14| (|p| $)
  (COND ((SPADCALL |p| (QREFELT $ 11)) 'NIL)
        ('T (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 11))))) 

(DEFUN |RPOLCAT-;mainMonomial;2S;15| (|p| $)
  (PROG (|v| #1=#:G303)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 20))
        (|error| "Error in mainMonomial from RPOLCAT : #1 is zero"))
       ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 16))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                         . #2=(|RPOLCAT-;mainMonomial;2S;15|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
               . #2#)
         (EXIT
          (SPADCALL (|spadConstant| $ 16) |v| (SPADCALL |p| |v| (QREFELT $ 34))
                    (QREFELT $ 39)))))))))) 

(DEFUN |RPOLCAT-;leastMonomial;2S;16| (|p| $)
  (PROG (|v| #1=#:G310)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 20))
        (|error| "Error in leastMonomial from RPOLCAT : #1 is zero"))
       ((SPADCALL |p| (QREFELT $ 11)) (|spadConstant| $ 16))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                         . #2=(|RPOLCAT-;leastMonomial;2S;16|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
               . #2#)
         (EXIT
          (SPADCALL (|spadConstant| $ 16) |v| (SPADCALL |p| |v| (QREFELT $ 58))
                    (QREFELT $ 39)))))))))) 

(DEFUN |RPOLCAT-;mainCoefficients;SL;17| (|p| $)
  (PROG (|v| #1=#:G317)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 20))
        (|error| "Error in mainCoefficients from RPOLCAT : #1 is zero"))
       ((SPADCALL |p| (QREFELT $ 11)) (LIST |p|))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                         . #2=(|RPOLCAT-;mainCoefficients;SL;17|))
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
               . #2#)
         (EXIT
          (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61)) (QREFELT $ 64)))))))))) 

(DEFUN |RPOLCAT-;mainMonomials;SL;18| (|p| $)
  (PROG (#1=#:G332 |m| #2=#:G331 |lm| |v| #3=#:G324)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 20))
        (|error| "Error in mainMonomials from RPOLCAT : #1 is zero"))
       ((SPADCALL |p| (QREFELT $ 11)) (LIST (|spadConstant| $ 16)))
       ('T
        (SEQ
         (LETT |v|
               (PROG2
                   (LETT #3# (SPADCALL |p| (QREFELT $ 32))
                         . #4=(|RPOLCAT-;mainMonomials;SL;18|))
                   (QCDR #3#)
                 (|check_union| (QEQCAR #3# 0) (QREFELT $ 9) #3#))
               . #4#)
         (LETT |lm| (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61)) (QREFELT $ 66))
               . #4#)
         (EXIT
          (PROGN
           (LETT #2# NIL . #4#)
           (SEQ (LETT |m| NIL . #4#) (LETT #1# |lm| . #4#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #2#
                        (CONS
                         (SPADCALL (|spadConstant| $ 16) |v|
                                   (SPADCALL |m| (QREFELT $ 67))
                                   (QREFELT $ 39))
                         #2#)
                        . #4#)))
                (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |RPOLCAT-;RittWuCompare;2SU;19| (|a| |b| $)
  (PROG (|lc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (COND ((SPADCALL |a| (QREFELT $ 11)) (EXIT (CONS 1 "failed"))))))
      (EXIT
       (COND ((SPADCALL |b| (QREFELT $ 11)) (CONS 0 'NIL))
             ((OR (SPADCALL |a| (QREFELT $ 11))
                  (SPADCALL (SPADCALL |a| (QREFELT $ 23))
                            (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 69)))
              (CONS 0 'T))
             ((SPADCALL (SPADCALL |a| (QREFELT $ 23))
                        (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 46))
              (CONS 0 'NIL))
             ((< (SPADCALL |a| (QREFELT $ 22)) (SPADCALL |b| (QREFELT $ 22)))
              (CONS 0 'T))
             ((SPADCALL (SPADCALL |a| (QREFELT $ 22))
                        (SPADCALL |b| (QREFELT $ 22)) (QREFELT $ 71))
              (CONS 0 'NIL))
             (#1='T
              (SEQ
               (LETT |lc|
                     (SPADCALL (SPADCALL |a| (QREFELT $ 15))
                               (SPADCALL |b| (QREFELT $ 15)) (QREFELT $ 73))
                     |RPOLCAT-;RittWuCompare;2SU;19|)
               (EXIT
                (COND ((QEQCAR |lc| 0) |lc|)
                      (#1#
                       (SPADCALL (SPADCALL |a| (QREFELT $ 19))
                                 (SPADCALL |b| (QREFELT $ 19))
                                 (QREFELT $ 73))))))))))))) 

(DEFUN |RPOLCAT-;infRittWu?;2SB;20| (|a| |b| $)
  (PROG (|lc|)
    (RETURN
     (SEQ
      (LETT |lc| (SPADCALL |a| |b| (QREFELT $ 73))
            |RPOLCAT-;infRittWu?;2SB;20|)
      (EXIT (COND ((QEQCAR |lc| 0) (QCDR |lc|)) ('T 'NIL))))))) 

(DEFUN |RPOLCAT-;supRittWu?;2SB;21| (|a| |b| $)
  (SPADCALL |b| |a| (QREFELT $ 76))) 

(DEFUN |RPOLCAT-;prem;3S;22| (|a| |b| $)
  (PROG (|cP|)
    (RETURN
     (SEQ (LETT |cP| (SPADCALL |a| |b| (QREFELT $ 79)) |RPOLCAT-;prem;3S;22|)
          (EXIT
           (SPADCALL (SPADCALL (QVELT |cP| 0) (QVELT |cP| 1) (QREFELT $ 80))
                     (QVELT |cP| 2) (QREFELT $ 81))))))) 

(DEFUN |RPOLCAT-;pquo;3S;23| (|a| |b| $)
  (PROG (|c| |cPS|)
    (RETURN
     (SEQ
      (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 84))
            . #1=(|RPOLCAT-;pquo;3S;23|))
      (LETT |c| (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80))
            . #1#)
      (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81))))))) 

(DEFUN |RPOLCAT-;prem;2SVS;24| (|a| |b| |v| $)
  (PROG (|cP|)
    (RETURN
     (SEQ
      (LETT |cP| (SPADCALL |a| |b| |v| (QREFELT $ 86)) |RPOLCAT-;prem;2SVS;24|)
      (EXIT
       (SPADCALL (SPADCALL (QVELT |cP| 0) (QVELT |cP| 1) (QREFELT $ 80))
                 (QVELT |cP| 2) (QREFELT $ 81))))))) 

(DEFUN |RPOLCAT-;pquo;2SVS;25| (|a| |b| |v| $)
  (PROG (|c| |cPS|)
    (RETURN
     (SEQ
      (LETT |cPS| (SPADCALL |a| |b| |v| (QREFELT $ 88))
            . #1=(|RPOLCAT-;pquo;2SVS;25|))
      (LETT |c| (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80))
            . #1#)
      (EXIT (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81))))))) 

(DEFUN |RPOLCAT-;lazyPrem;3S;26| (|a| |b| $)
  (SEQ
   (COND
    ((NULL (SPADCALL |b| (QREFELT $ 11)))
     (COND
      ((SPADCALL |b| (QREFELT $ 90))
       (EXIT (SPADCALL |a| |b| (QREFELT $ 91)))))))
   (EXIT (QVELT (SPADCALL |a| |b| (QREFELT $ 79)) 2)))) 

(DEFUN |RPOLCAT-;lazyPquo;3S;27| (|a| |b| $)
  (QVELT (SPADCALL |a| |b| (QREFELT $ 84)) 2)) 

(DEFUN |RPOLCAT-;lazyPrem;2SVS;28| (|a| |b| |v| $)
  (PROG (|test| |term| #1=#:G374 |lcav| |lcbv| |dav| |dbv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 20))
        (|error| "Error in lazyPrem : (%,%,V) -> % from RPOLCAT : #2 is zero"))
       ((SPADCALL |b| (QREFELT $ 11)) (|spadConstant| $ 41))
       ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
        (SPADCALL |a| |b| (QREFELT $ 95)))
       (#2='T
        (SEQ
         (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34))
               . #3=(|RPOLCAT-;lazyPrem;2SVS;28|))
         (EXIT
          (COND ((ZEROP |dbv|) (|spadConstant| $ 41))
                (#2#
                 (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)) . #3#)
                      (EXIT
                       (COND ((ZEROP |dav|) |a|)
                             (#2#
                              (SEQ (LETT |test| (- |dav| |dbv|) . #3#)
                                   (LETT |lcbv|
                                         (SPADCALL |b| |v| (QREFELT $ 96))
                                         . #3#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND
                                            ((OR (SPADCALL |a| (QREFELT $ 20))
                                                 (MINUSP |test|))
                                             'NIL)
                                            ('T 'T)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |lcav|
                                               (SPADCALL |a| |v|
                                                         (QREFELT $ 96))
                                               . #3#)
                                         (LETT |term|
                                               (SPADCALL |lcav| |v|
                                                         (PROG1
                                                             (LETT #1# |test|
                                                                   . #3#)
                                                           (|check_subtype|
                                                            (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                                         (QREFELT $ 39))
                                               . #3#)
                                         (LETT |a|
                                               (SPADCALL
                                                (SPADCALL |lcbv| |a|
                                                          (QREFELT $ 81))
                                                (SPADCALL |term| |b|
                                                          (QREFELT $ 81))
                                                (QREFELT $ 42))
                                               . #3#)
                                         (EXIT
                                          (LETT |test|
                                                (-
                                                 (SPADCALL |a| |v|
                                                           (QREFELT $ 34))
                                                 |dbv|)
                                                . #3#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT |a|)))))))))))))))) 

(DEFUN |RPOLCAT-;lazyPquo;2SVS;29| (|a| |b| |v| $)
  (QVELT (SPADCALL |a| |b| |v| (QREFELT $ 88)) 2)) 

(DEFUN |RPOLCAT-;headReduce;3S;30| (|a| |b| $)
  (PROG (|lrc| |ha|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (|error|
         "Error in headReduce : (%,%) -> Boolean from TSETCAT : #2 is constant"))
       ((SPADCALL |a| (QREFELT $ 11)) |a|)
       ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
                  (QREFELT $ 94))
        (SPADCALL |a| |b| (QREFELT $ 95)))
       ('T
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((SPADCALL
                    (LETT |ha| (SPADCALL |a| (QREFELT $ 44))
                          . #1=(|RPOLCAT-;headReduce;3S;30|))
                    |b| (QREFELT $ 99))
                   'NIL)
                  ('T 'T)))
                (GO G191)))
              (SEQ (LETT |lrc| (SPADCALL |ha| |b| (QREFELT $ 101)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |a| (QREFELT $ 19)) (QREFELT $ 20))
                      (LETT |a| (QVELT |lrc| 0) . #1#))
                     ('T
                      (LETT |a|
                            (SPADCALL (QVELT |lrc| 0)
                                      (SPADCALL
                                       (SPADCALL (QVELT |lrc| 1)
                                                 (QVELT |lrc| 2)
                                                 (QREFELT $ 80))
                                       (SPADCALL |a| (QREFELT $ 19))
                                       (QREFELT $ 81))
                                      (QREFELT $ 102))
                            . #1#)))))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |a|)))))))) 

(DEFUN |RPOLCAT-;initiallyReduce;3S;31| (|a| |b| $)
  (PROG (|ia| |ma| |ta| |iamodb| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (|error|
         "Error in initiallyReduce : (%,%) -> Boolean from TSETCAT : #2 is constant"))
       ((SPADCALL |a| (QREFELT $ 11)) |a|)
       (#1='T
        (SEQ
         (LETT |v| (SPADCALL |b| (QREFELT $ 23))
               . #2=(|RPOLCAT-;initiallyReduce;3S;31|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) |v| (QREFELT $ 94))
            (SPADCALL |a| |b| (QREFELT $ 95)))
           (#1#
            (SEQ (LETT |ia| |a| . #2#) (LETT |ma| (|spadConstant| $ 16) . #2#)
                 (LETT |ta| (|spadConstant| $ 41) . #2#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((SPADCALL |ia| (QREFELT $ 11)) 'NIL)
                               ('T
                                (SPADCALL (SPADCALL |ia| (QREFELT $ 23))
                                          (SPADCALL |b| (QREFELT $ 23))
                                          (QREFELT $ 104)))))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL (SPADCALL |ia| (QREFELT $ 23))
                                   (SPADCALL |b| (QREFELT $ 23))
                                   (QREFELT $ 94))
                         (COND
                          ((>= (SPADCALL |ia| (QREFELT $ 22))
                               (SPADCALL |b| (QREFELT $ 22)))
                           (SEQ
                            (LETT |iamodb| (SPADCALL |ia| |b| (QREFELT $ 101))
                                  . #2#)
                            (LETT |ia| (QVELT |iamodb| 0) . #2#)
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |ta| (QREFELT $ 20)))
                               (LETT |ta|
                                     (SPADCALL
                                      (SPADCALL (QVELT |iamodb| 1)
                                                (QVELT |iamodb| 2)
                                                (QREFELT $ 80))
                                      |ta| (QREFELT $ 81))
                                     . #2#)))))))))
                       (EXIT
                        (COND
                         ((SPADCALL |ia| (QREFELT $ 20))
                          (SEQ (LETT |ia| |ta| . #2#)
                               (LETT |ma| (|spadConstant| $ 16) . #2#)
                               (EXIT (LETT |ta| (|spadConstant| $ 41) . #2#))))
                         ((NULL (SPADCALL |ia| (QREFELT $ 11)))
                          (SEQ
                           (LETT |ta|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |ia| (QREFELT $ 19)) |ma|
                                            (QREFELT $ 81))
                                  |ta| (QREFELT $ 102))
                                 . #2#)
                           (LETT |ma|
                                 (SPADCALL (SPADCALL |ia| (QREFELT $ 105)) |ma|
                                           (QREFELT $ 81))
                                 . #2#)
                           (EXIT
                            (LETT |ia| (SPADCALL |ia| (QREFELT $ 15))
                                  . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (SPADCALL (SPADCALL |ia| |ma| (QREFELT $ 81)) |ta|
                            (QREFELT $ 102)))))))))))))) 

(DEFUN |RPOLCAT-;lazyPremWithDefault;2SR;32| (|a| |b| $)
  (PROG (#1=#:G423 |test| |delta| |term| #2=#:G419 #3=#:G413 |db| |lcb| |xb|
         |xa|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (|error| "Error in lazyPremWithDefault from RPOLCAT : #2 is constant"))
       ((SPADCALL |a| (QREFELT $ 11)) (VECTOR (|spadConstant| $ 16) 0 |a|))
       (#4='T
        (SEQ
         (LETT |xa| (SPADCALL |a| (QREFELT $ 23))
               . #5=(|RPOLCAT-;lazyPremWithDefault;2SR;32|))
         (LETT |xb| (SPADCALL |b| (QREFELT $ 23)) . #5#)
         (EXIT
          (COND
           ((SPADCALL |xa| |xb| (QREFELT $ 69))
            (VECTOR (|spadConstant| $ 16) 0 |a|))
           (#4#
            (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)) . #5#)
                 (LETT |db| (SPADCALL |b| (QREFELT $ 22)) . #5#)
                 (LETT |test| (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                       . #5#)
                 (LETT |delta| (MAX (+ |test| 1) 0) . #5#)
                 (COND
                  ((SPADCALL |xa| |xb| (QREFELT $ 94))
                   (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)) . #5#)
                        (EXIT
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((OR (SPADCALL |a| (QREFELT $ 20))
                                       (MINUSP |test|))
                                   'NIL)
                                  ('T 'T)))
                                (GO G191)))
                              (SEQ
                               (LETT |term|
                                     (SPADCALL (SPADCALL |a| (QREFELT $ 15))
                                               |xb|
                                               (PROG1 (LETT #3# |test| . #5#)
                                                 (|check_subtype| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #3#))
                                               (QREFELT $ 39))
                                     . #5#)
                               (LETT |a|
                                     (SPADCALL
                                      (SPADCALL |lcb|
                                                (SPADCALL |a| (QREFELT $ 19))
                                                (QREFELT $ 81))
                                      (SPADCALL |term| |b| (QREFELT $ 81))
                                      (QREFELT $ 42))
                                     . #5#)
                               (LETT |delta| (- |delta| 1) . #5#)
                               (EXIT
                                (LETT |test|
                                      (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                         |db|)
                                      . #5#)))
                              NIL (GO G190) G191 (EXIT NIL)))))
                  (#4#
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((OR (SPADCALL |a| (QREFELT $ 20)) (MINUSP |test|))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL (SPADCALL |a| |xb| (QREFELT $ 96))
                                         |xb|
                                         (PROG1 (LETT #2# |test| . #5#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 39))
                               . #5#)
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 81))
                                         (SPADCALL |term| |b| (QREFELT $ 81))
                                         (QREFELT $ 42))
                               . #5#)
                         (LETT |delta| (- |delta| 1) . #5#)
                         (EXIT
                          (LETT |test|
                                (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                                . #5#)))
                        NIL (GO G190) G191 (EXIT NIL))))
                 (EXIT
                  (VECTOR |lcb|
                          (PROG1 (LETT #1# |delta| . #5#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          |a|))))))))))))) 

(DEFUN |RPOLCAT-;lazyPremWithDefault;2SVR;33| (|a| |b| |v| $)
  (PROG (#1=#:G437 |test| |delta| |term| #2=#:G433 |lcav| |lcbv| |dav| |dbv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 20))
        (|error|
         "Error in lazyPremWithDefault : (%,%,V) -> % from RPOLCAT : #2 is zero"))
       ((SPADCALL |b| (QREFELT $ 11)) (VECTOR |b| 1 (|spadConstant| $ 41)))
       ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
        (SPADCALL |a| |b| (QREFELT $ 79)))
       (#3='T
        (SEQ
         (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34))
               . #4=(|RPOLCAT-;lazyPremWithDefault;2SVR;33|))
         (EXIT
          (COND ((ZEROP |dbv|) (VECTOR |b| 1 (|spadConstant| $ 41)))
                (#3#
                 (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)) . #4#)
                      (EXIT
                       (COND
                        ((ZEROP |dav|) (VECTOR (|spadConstant| $ 16) 0 |a|))
                        (#3#
                         (SEQ (LETT |test| (- |dav| |dbv|) . #4#)
                              (LETT |delta| (MAX (+ |test| 1) 0) . #4#)
                              (LETT |lcbv| (SPADCALL |b| |v| (QREFELT $ 96))
                                    . #4#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((OR (SPADCALL |a| (QREFELT $ 20))
                                            (MINUSP |test|))
                                        'NIL)
                                       ('T 'T)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |lcav|
                                          (SPADCALL |a| |v| (QREFELT $ 96))
                                          . #4#)
                                    (LETT |term|
                                          (SPADCALL |lcav| |v|
                                                    (PROG1
                                                        (LETT #2# |test| . #4#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 39))
                                          . #4#)
                                    (LETT |a|
                                          (SPADCALL
                                           (SPADCALL |lcbv| |a| (QREFELT $ 81))
                                           (SPADCALL |term| |b| (QREFELT $ 81))
                                           (QREFELT $ 42))
                                          . #4#)
                                    (LETT |delta| (- |delta| 1) . #4#)
                                    (EXIT
                                     (LETT |test|
                                           (- (SPADCALL |a| |v| (QREFELT $ 34))
                                              |dbv|)
                                           . #4#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (VECTOR |lcbv|
                                       (PROG1 (LETT #1# |delta| . #4#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       |a|))))))))))))))))) 

(DEFUN |RPOLCAT-;pseudoDivide;2SR;34| (|a| |b| $)
  (PROG (|c| |cPS|)
    (RETURN
     (SEQ
      (LETT |cPS| (SPADCALL |a| |b| (QREFELT $ 84))
            . #1=(|RPOLCAT-;pseudoDivide;2SR;34|))
      (LETT |c| (SPADCALL (QVELT |cPS| 0) (QVELT |cPS| 1) (QREFELT $ 80))
            . #1#)
      (EXIT
       (CONS (SPADCALL |c| (QVELT |cPS| 2) (QREFELT $ 81))
             (SPADCALL |c| (QVELT |cPS| 3) (QREFELT $ 81)))))))) 

(DEFUN |RPOLCAT-;lazyPseudoDivide;2SR;35| (|a| |b| $)
  (PROG (#1=#:G463 |test| |delta| |q| |term| #2=#:G459 #3=#:G453 |db| |lcb|
         |xb| |xa|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (|error| "Error in lazyPseudoDivide from RPOLCAT : #2 is constant"))
       ((SPADCALL |a| (QREFELT $ 11))
        (VECTOR (|spadConstant| $ 16) 0 (|spadConstant| $ 41) |a|))
       (#4='T
        (SEQ
         (LETT |xa| (SPADCALL |a| (QREFELT $ 23))
               . #5=(|RPOLCAT-;lazyPseudoDivide;2SR;35|))
         (LETT |xb| (SPADCALL |b| (QREFELT $ 23)) . #5#)
         (EXIT
          (COND
           ((SPADCALL |xa| |xb| (QREFELT $ 69))
            (VECTOR (|spadConstant| $ 16) 0 (|spadConstant| $ 41) |a|))
           (#4#
            (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)) . #5#)
                 (LETT |db| (SPADCALL |b| (QREFELT $ 22)) . #5#)
                 (LETT |q| (|spadConstant| $ 41) . #5#)
                 (LETT |test| (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                       . #5#)
                 (LETT |delta| (MAX (+ |test| 1) 0) . #5#)
                 (COND
                  ((SPADCALL |xa| |xb| (QREFELT $ 94))
                   (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)) . #5#)
                        (EXIT
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((OR (SPADCALL |a| (QREFELT $ 20))
                                       (MINUSP |test|))
                                   'NIL)
                                  ('T 'T)))
                                (GO G191)))
                              (SEQ
                               (LETT |term|
                                     (SPADCALL (SPADCALL |a| (QREFELT $ 15))
                                               |xb|
                                               (PROG1 (LETT #3# |test| . #5#)
                                                 (|check_subtype| (>= #3# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #3#))
                                               (QREFELT $ 39))
                                     . #5#)
                               (LETT |a|
                                     (SPADCALL
                                      (SPADCALL |lcb|
                                                (SPADCALL |a| (QREFELT $ 19))
                                                (QREFELT $ 81))
                                      (SPADCALL |term| |b| (QREFELT $ 81))
                                      (QREFELT $ 42))
                                     . #5#)
                               (LETT |q|
                                     (SPADCALL
                                      (SPADCALL |lcb| |q| (QREFELT $ 81))
                                      |term| (QREFELT $ 102))
                                     . #5#)
                               (LETT |delta| (- |delta| 1) . #5#)
                               (EXIT
                                (LETT |test|
                                      (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                         |db|)
                                      . #5#)))
                              NIL (GO G190) G191 (EXIT NIL)))))
                  (#4#
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((OR (SPADCALL |a| (QREFELT $ 20)) (MINUSP |test|))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL (SPADCALL |a| |xb| (QREFELT $ 96))
                                         |xb|
                                         (PROG1 (LETT #2# |test| . #5#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 39))
                               . #5#)
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 81))
                                         (SPADCALL |term| |b| (QREFELT $ 81))
                                         (QREFELT $ 42))
                               . #5#)
                         (LETT |q|
                               (SPADCALL (SPADCALL |lcb| |q| (QREFELT $ 81))
                                         |term| (QREFELT $ 102))
                               . #5#)
                         (LETT |delta| (- |delta| 1) . #5#)
                         (EXIT
                          (LETT |test|
                                (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                                . #5#)))
                        NIL (GO G190) G191 (EXIT NIL))))
                 (EXIT
                  (VECTOR |lcb|
                          (PROG1 (LETT #1# |delta| . #5#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          |q| |a|))))))))))))) 

(DEFUN |RPOLCAT-;lazyPseudoDivide;2SVR;36| (|a| |b| |v| $)
  (PROG (#1=#:G477 |test| |delta| |q| |term| #2=#:G473 |lcav| |lcbv| |dav|
         |dbv|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 20))
        (|error|
         "Error in lazyPseudoDivide : (%,%,V) -> % from RPOLCAT : #2 is zero"))
       ((SPADCALL |b| (QREFELT $ 11)) (VECTOR |b| 1 |a| (|spadConstant| $ 41)))
       ((SPADCALL |v| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 94))
        (SPADCALL |a| |b| (QREFELT $ 84)))
       (#3='T
        (SEQ
         (LETT |dbv| (SPADCALL |b| |v| (QREFELT $ 34))
               . #4=(|RPOLCAT-;lazyPseudoDivide;2SVR;36|))
         (EXIT
          (COND ((ZEROP |dbv|) (VECTOR |b| 1 |a| (|spadConstant| $ 41)))
                (#3#
                 (SEQ (LETT |dav| (SPADCALL |a| |v| (QREFELT $ 34)) . #4#)
                      (EXIT
                       (COND
                        ((ZEROP |dav|)
                         (VECTOR (|spadConstant| $ 16) 0 (|spadConstant| $ 41)
                                 |a|))
                        (#3#
                         (SEQ (LETT |test| (- |dav| |dbv|) . #4#)
                              (LETT |delta| (MAX (+ |test| 1) 0) . #4#)
                              (LETT |lcbv| (SPADCALL |b| |v| (QREFELT $ 96))
                                    . #4#)
                              (LETT |q| (|spadConstant| $ 41) . #4#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((OR (SPADCALL |a| (QREFELT $ 20))
                                            (MINUSP |test|))
                                        'NIL)
                                       ('T 'T)))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |lcav|
                                          (SPADCALL |a| |v| (QREFELT $ 96))
                                          . #4#)
                                    (LETT |term|
                                          (SPADCALL |lcav| |v|
                                                    (PROG1
                                                        (LETT #2# |test| . #4#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 39))
                                          . #4#)
                                    (LETT |a|
                                          (SPADCALL
                                           (SPADCALL |lcbv| |a| (QREFELT $ 81))
                                           (SPADCALL |term| |b| (QREFELT $ 81))
                                           (QREFELT $ 42))
                                          . #4#)
                                    (LETT |q|
                                          (SPADCALL
                                           (SPADCALL |lcbv| |q| (QREFELT $ 81))
                                           |term| (QREFELT $ 102))
                                          . #4#)
                                    (LETT |delta| (- |delta| 1) . #4#)
                                    (EXIT
                                     (LETT |test|
                                           (- (SPADCALL |a| |v| (QREFELT $ 34))
                                              |dbv|)
                                           . #4#)))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (VECTOR |lcbv|
                                       (PROG1 (LETT #1# |delta| . #4#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       |q| |a|))))))))))))))))) 

(DEFUN |RPOLCAT-;monicModulo;3S;37| (|a| |b| $)
  (PROG (#1=#:G486 |rec| |ib|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 11))
        (|error| "Error in monicModulo from RPOLCAT : #2 is constant"))
       (#2='T
        (SEQ
         (LETT |rec|
               (SPADCALL
                (LETT |ib| (SPADCALL |b| (QREFELT $ 15))
                      . #3=(|RPOLCAT-;monicModulo;3S;37|))
                (QREFELT $ 54))
               . #3#)
         (EXIT
          (COND
           ((QEQCAR |rec| 1)
            (|error| "Error in monicModulo from RPOLCAT : #2 is not monic"))
           ((SPADCALL |a| (QREFELT $ 11)) |a|)
           (#2#
            (SPADCALL |ib|
                      (QVELT
                       (SPADCALL
                        (SPADCALL
                         (PROG2 (LETT #1# |rec| . #3#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                         |a| (QREFELT $ 81))
                        (SPADCALL
                         (PROG2 (LETT #1# |rec| . #3#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
                         |b| (QREFELT $ 81))
                        (QREFELT $ 79))
                       2)
                      (QREFELT $ 81)))))))))))) 

(DEFUN |RPOLCAT-;lazyResidueClass;2SR;38| (|a| |b| $)
  (PROG (|test| |pow| |term| #1=#:G502 #2=#:G496 |db| |lcb| |xb| |xa|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 20)) (VECTOR |a| (|spadConstant| $ 16) 0))
       ((SPADCALL |b| (QREFELT $ 11))
        (VECTOR (|spadConstant| $ 41) (|spadConstant| $ 16) 0))
       ((SPADCALL |a| (QREFELT $ 11)) (VECTOR |a| (|spadConstant| $ 16) 0))
       (#3='T
        (SEQ
         (LETT |xa| (SPADCALL |a| (QREFELT $ 23))
               . #4=(|RPOLCAT-;lazyResidueClass;2SR;38|))
         (LETT |xb| (SPADCALL |b| (QREFELT $ 23)) . #4#)
         (EXIT
          (COND
           ((SPADCALL |xa| |xb| (QREFELT $ 69))
            (VECTOR |a| (|spadConstant| $ 16) 0))
           ((SPADCALL |b| (QREFELT $ 90))
            (VECTOR (SPADCALL |a| |b| (QREFELT $ 91)) (|spadConstant| $ 16) 0))
           (#3#
            (SEQ (LETT |lcb| (SPADCALL |b| (QREFELT $ 15)) . #4#)
                 (LETT |db| (SPADCALL |b| (QREFELT $ 22)) . #4#)
                 (LETT |test| (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                       . #4#)
                 (LETT |pow| 0 . #4#)
                 (COND
                  ((SPADCALL |xa| |xb| (QREFELT $ 94))
                   (SEQ (LETT |b| (SPADCALL |b| (QREFELT $ 19)) . #4#)
                        (EXIT
                         (SEQ G190
                              (COND
                               ((NULL
                                 (COND
                                  ((OR (SPADCALL |a| (QREFELT $ 20))
                                       (MINUSP |test|))
                                   'NIL)
                                  ('T 'T)))
                                (GO G191)))
                              (SEQ
                               (LETT |term|
                                     (SPADCALL (SPADCALL |a| (QREFELT $ 15))
                                               |xb|
                                               (PROG1 (LETT #2# |test| . #4#)
                                                 (|check_subtype| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#))
                                               (QREFELT $ 39))
                                     . #4#)
                               (LETT |a|
                                     (SPADCALL
                                      (SPADCALL |lcb|
                                                (SPADCALL |a| (QREFELT $ 19))
                                                (QREFELT $ 81))
                                      (SPADCALL |term| |b| (QREFELT $ 81))
                                      (QREFELT $ 42))
                                     . #4#)
                               (LETT |pow| (+ |pow| 1) . #4#)
                               (EXIT
                                (LETT |test|
                                      (- (SPADCALL |a| |xb| (QREFELT $ 34))
                                         |db|)
                                      . #4#)))
                              NIL (GO G190) G191 (EXIT NIL)))))
                  (#3#
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((OR (SPADCALL |a| (QREFELT $ 20)) (MINUSP |test|))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |term|
                               (SPADCALL (SPADCALL |a| |xb| (QREFELT $ 96))
                                         |xb|
                                         (PROG1 (LETT #1# |test| . #4#)
                                           (|check_subtype| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                         (QREFELT $ 39))
                               . #4#)
                         (LETT |a|
                               (SPADCALL (SPADCALL |lcb| |a| (QREFELT $ 81))
                                         (SPADCALL |term| |b| (QREFELT $ 81))
                                         (QREFELT $ 42))
                               . #4#)
                         (LETT |pow| (+ |pow| 1) . #4#)
                         (EXIT
                          (LETT |test|
                                (- (SPADCALL |a| |xb| (QREFELT $ 34)) |db|)
                                . #4#)))
                        NIL (GO G190) G191 (EXIT NIL))))
                 (EXIT (VECTOR |a| |lcb| |pow|))))))))))))) 

(DEFUN |RPOLCAT-;reduced?;2SB;39| (|a| |b| $)
  (< (SPADCALL |a| (SPADCALL |b| (QREFELT $ 23)) (QREFELT $ 34))
     (SPADCALL |b| (QREFELT $ 22)))) 

(DEFUN |RPOLCAT-;reduced?;SLB;40| (|p| |lq| $)
  (SEQ
   (COND ((SPADCALL |p| (QREFELT $ 11)) 'T)
         ('T
          (SEQ
           (SEQ G190
                (COND
                 ((NULL
                   (COND ((NULL |lq|) 'NIL)
                         ('T
                          (SPADCALL |p| (|SPADfirst| |lq|) (QREFELT $ 99)))))
                  (GO G191)))
                (SEQ (EXIT (LETT |lq| (CDR |lq|) |RPOLCAT-;reduced?;SLB;40|)))
                NIL (GO G190) G191 (EXIT NIL))
           (EXIT (NULL |lq|))))))) 

(DEFUN |RPOLCAT-;headReduced?;2SB;41| (|a| |b| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 44)) |b| (QREFELT $ 99))) 

(DEFUN |RPOLCAT-;headReduced?;SLB;42| (|p| |lq| $)
  (SPADCALL (SPADCALL |p| (QREFELT $ 44)) |lq| (QREFELT $ 118))) 

(DEFUN |RPOLCAT-;initiallyReduced?;2SB;43| (|a| |b| $)
  (COND
   ((SPADCALL |b| (QREFELT $ 11))
    (|error|
     "Error in initiallyReduced? : (%,%) -> Bool. from RPOLCAT : #2 is constant"))
   ((OR (SPADCALL |a| (QREFELT $ 11))
        (SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
                  (QREFELT $ 69)))
    'T)
   ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
              (QREFELT $ 94))
    (SPADCALL |a| |b| (QREFELT $ 99)))
   ('T (SPADCALL (SPADCALL |a| (QREFELT $ 15)) |b| (QREFELT $ 120))))) 

(DEFUN |RPOLCAT-;initiallyReduced?;SLB;44| (|p| |lq| $)
  (SEQ
   (COND ((SPADCALL |p| (QREFELT $ 11)) 'T)
         ('T
          (SEQ
           (SEQ G190
                (COND
                 ((NULL
                   (COND ((NULL |lq|) 'NIL)
                         ('T
                          (SPADCALL |p| (|SPADfirst| |lq|) (QREFELT $ 120)))))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT |lq| (CDR |lq|) |RPOLCAT-;initiallyReduced?;SLB;44|)))
                NIL (GO G190) G191 (EXIT NIL))
           (EXIT (NULL |lq|))))))) 

(DEFUN |RPOLCAT-;normalized?;2SB;45| (|a| |b| $)
  (COND
   ((SPADCALL |b| (QREFELT $ 11))
    (|error|
     "Error in  normalized? : (%,%) -> Boolean from TSETCAT : #2 is constant"))
   ((OR (SPADCALL |a| (QREFELT $ 11))
        (SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
                  (QREFELT $ 69)))
    'T)
   ((SPADCALL (SPADCALL |a| (QREFELT $ 23)) (SPADCALL |b| (QREFELT $ 23))
              (QREFELT $ 94))
    'NIL)
   ('T (SPADCALL (SPADCALL |a| (QREFELT $ 15)) |b| (QREFELT $ 123))))) 

(DEFUN |RPOLCAT-;normalized?;SLB;46| (|p| |lq| $)
  (SEQ
   (SEQ G190
        (COND
         ((NULL
           (COND ((NULL |lq|) 'NIL)
                 ('T (SPADCALL |p| (|SPADfirst| |lq|) (QREFELT $ 123)))))
          (GO G191)))
        (SEQ (EXIT (LETT |lq| (CDR |lq|) |RPOLCAT-;normalized?;SLB;46|))) NIL
        (GO G190) G191 (EXIT NIL))
   (EXIT (NULL |lq|)))) 

(DEFUN |RPOLCAT-;iexactQuo;3R;47| (|r| |s| $)
  (SPADCALL |r| |s| (QREFELT $ 126))) 

(DEFUN |RPOLCAT-;iexactQuo;3R;48| (|r| |s| $)
  (PROG (#1=#:G541)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL |r| |s| (QREFELT $ 128))
               |RPOLCAT-;iexactQuo;3R;48|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))) 

(DEFUN |RPOLCAT-;exactQuo| (|r| |s| $) (SPADCALL |r| |s| (QREFELT $ 129))) 

(DEFUN |RPOLCAT-;exactQuotient;SRS;50| (|p| |r| $)
  (PROG (#1=#:G546)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL |p| |r| (QREFELT $ 130))
               |RPOLCAT-;exactQuotient;SRS;50|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))) 

(DEFUN |RPOLCAT-;exactQuotient;3S;51| (|a| |b| $)
  (PROG (#1=#:G550)
    (RETURN
     (COND
      ((SPADCALL |b| (QREFELT $ 11))
       (SPADCALL |a| (SPADCALL |b| (QREFELT $ 12)) (QREFELT $ 132)))
      ('T
       (PROG2
           (LETT #1# (SPADCALL |a| |b| (QREFELT $ 133))
                 |RPOLCAT-;exactQuotient;3S;51|)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))))))) 

(DEFUN |RPOLCAT-;exactQuotient!;3S;52| (|a| |b| $)
  (PROG (#1=#:G555)
    (RETURN
     (COND
      ((SPADCALL |b| (QREFELT $ 11))
       (SPADCALL |a| (SPADCALL |b| (QREFELT $ 12)) (QREFELT $ 135)))
      ('T
       (LETT |a|
             (PROG2
                 (LETT #1# (SPADCALL |a| |b| (QREFELT $ 133))
                       . #2=(|RPOLCAT-;exactQuotient!;3S;52|))
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
             . #2#)))))) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;53| (|p| $)
  (SPADCALL |p| (QREFELT $ 137))) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;54| (|p| $)
  (LETT |p| (SPADCALL |p| (QREFELT $ 137))
        |RPOLCAT-;primPartElseUnitCanonical!;2S;54|)) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;55| (|p| $)
  (SPADCALL |p| (QREFELT $ 140))) 

(DEFUN |RPOLCAT-;primitivePart!;2S;56| (|p| $)
  (PROG (|cp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
            (#1='T
             (SEQ
              (SEQ
               (LETT |cp| (SPADCALL |p| (QREFELT $ 141))
                     . #2=(|RPOLCAT-;primitivePart!;2S;56|))
               (EXIT
                (COND
                 ((SPADCALL |cp| (|spadConstant| $ 17) (QREFELT $ 142))
                  (LETT |p| (SPADCALL |p| (QREFELT $ 137)) . #2#))
                 (#1#
                  (LETT |p|
                        (SPADCALL (SPADCALL |p| |cp| (QREFELT $ 135))
                                  (QREFELT $ 137))
                        . #2#)))))
              (EXIT |p|)))))))) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;57| (|p| $)
  (SPADCALL |p| (QREFELT $ 144))) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical;2S;58| (|p| $)
  (SPADCALL |p| (QREFELT $ 137))) 

(DEFUN |RPOLCAT-;primPartElseUnitCanonical!;2S;59| (|p| $)
  (LETT |p| (SPADCALL |p| (QREFELT $ 137))
        |RPOLCAT-;primPartElseUnitCanonical!;2S;59|)) 

(DEFUN |RPOLCAT-;gcd;RSR;60| (|r| |p| $)
  (COND
   ((OR (SPADCALL |r| (|spadConstant| $ 17) (QREFELT $ 142))
        (SPADCALL |p| (QREFELT $ 20)))
    |r|)
   ((SPADCALL |p| (QREFELT $ 11))
    (SPADCALL |r| (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 145)))
   ('T
    (SPADCALL (SPADCALL |r| (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 146))
              (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 146))))) 

(DEFUN |RPOLCAT-;mainContent;2S;61| (|p| $)
  (PROG (#1=#:G573 #2=#:G572 #3=#:G574 #4=#:G577 #5=#:G103)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
            (#6='T
             (PROGN
              (LETT #1# NIL . #7=(|RPOLCAT-;mainContent;2S;61|))
              (SEQ (LETT #5# NIL . #7#)
                   (LETT #4# (SPADCALL |p| (QREFELT $ 148)) . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# #5# . #7#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 149)) . #7#))
                       ('T
                        (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#6# (|spadConstant| $ 41)))))))))) 

(DEFUN |RPOLCAT-;mainPrimitivePart;2S;62| (|p| $)
  (PROG (#1=#:G579)
    (RETURN
     (COND ((SPADCALL |p| (QREFELT $ 20)) |p|)
           ('T
            (QVELT
             (SPADCALL
              (PROG2
                  (LETT #1#
                        (SPADCALL |p| (SPADCALL |p| (QREFELT $ 151))
                                  (QREFELT $ 133))
                        |RPOLCAT-;mainPrimitivePart;2S;62|)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#))
              (QREFELT $ 153))
             1)))))) 

(DEFUN |RPOLCAT-;mainSquareFreePart;2S;63| (|p| $)
  (PROG (|sfp| |v| #1=#:G585)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 11)) |p|)
            ('T
             (SEQ
              (LETT |v|
                    (PROG2
                        (LETT #1# (SPADCALL |p| (QREFELT $ 32))
                              . #2=(|RPOLCAT-;mainSquareFreePart;2S;63|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                    . #2#)
              (LETT |sfp|
                    (SPADCALL (SPADCALL |p| |v| (QREFELT $ 61))
                              (QREFELT $ 155))
                    . #2#)
              (EXIT (SPADCALL |sfp| |v| (QREFELT $ 156)))))))))) 

(DEFUN |RPOLCAT-;convert;SP;64| (|p| $)
  (PROG (|d| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 11))
        (SPADCALL (SPADCALL |p| (QREFELT $ 12)) (QREFELT $ 159)))
       ('T
        (SEQ
         (LETT |v| (SPADCALL |p| (QREFELT $ 23))
               . #1=(|RPOLCAT-;convert;SP;64|))
         (LETT |d| (SPADCALL |p| (QREFELT $ 22)) . #1#)
         (EXIT
          (SPADCALL
           (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 160))
                     (SPADCALL
                      (SPADCALL (SPADCALL |v| (QREFELT $ 162)) (QREFELT $ 163))
                      |d| (QREFELT $ 164))
                     (QREFELT $ 165))
           (SPADCALL (SPADCALL |p| (QREFELT $ 19)) (QREFELT $ 160))
           (QREFELT $ 166)))))))))) 

(DEFUN |RPOLCAT-;coerce;SP;65| (|p| $) (SPADCALL |p| (QREFELT $ 160))) 

(DEFUN |RPOLCAT-;localRetract| (|p| $)
  (PROG (|newp| |xvimvp| |c| |d| |vimvp| |imvp| #1=#:G603 |mvp| #2=#:G601)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |p| (QREFELT $ 174))
        (SPADCALL (SPADCALL |p| (QREFELT $ 175)) (QREFELT $ 176)))
       ('T
        (SEQ
         (LETT |mvp|
               (PROG2
                   (LETT #2# (SPADCALL |p| (QREFELT $ 178))
                         . #3=(|RPOLCAT-;localRetract|))
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 0) (|Symbol|) #2#))
               . #3#)
         (LETT |imvp|
               (PROG1
                   (LETT #1# (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180))
                         . #3#)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
               . #3#)
         (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)) . #3#)
         (LETT |newp| (|spadConstant| $ 41) . #3#)
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((ZEROP
                    (LETT |d| (SPADCALL |p| |mvp| (QREFELT $ 181)) . #3#))
                   'NIL)
                  ('T 'T)))
                (GO G191)))
              (SEQ
               (LETT |c|
                     (|RPOLCAT-;localRetract|
                      (SPADCALL |p| |mvp| |d| (QREFELT $ 182)) $)
                     . #3#)
               (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)) . #3#)
               (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)) . #3#)
               (EXIT
                (LETT |p|
                      (SPADCALL |p|
                                (SPADCALL
                                 (SPADCALL |p| |mvp| |d| (QREFELT $ 182)) |mvp|
                                 |d| (QREFELT $ 183))
                                (QREFELT $ 184))
                      . #3#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (SPADCALL |newp| (|RPOLCAT-;localRetract| |p| $)
                    (QREFELT $ 102)))))))))) 

(DEFUN |RPOLCAT-;localRetractPQ| (|pq| $)
  (PROG (|newp| |xvimvp| |c| |d| |vimvp| |imvp| #1=#:G613 |mvp| #2=#:G611)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pq| (QREFELT $ 186))
        (SPADCALL (SPADCALL (SPADCALL |pq| (QREFELT $ 188)) (QREFELT $ 189))
                  (QREFELT $ 176)))
       ('T
        (SEQ
         (LETT |mvp|
               (PROG2
                   (LETT #2# (SPADCALL |pq| (QREFELT $ 190))
                         . #3=(|RPOLCAT-;localRetractPQ|))
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 0) (|Symbol|) #2#))
               . #3#)
         (LETT |imvp|
               (PROG1
                   (LETT #1# (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180))
                         . #3#)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
               . #3#)
         (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)) . #3#)
         (LETT |newp| (|spadConstant| $ 41) . #3#)
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((ZEROP
                    (LETT |d| (SPADCALL |pq| |mvp| (QREFELT $ 191)) . #3#))
                   'NIL)
                  ('T 'T)))
                (GO G191)))
              (SEQ
               (LETT |c|
                     (|RPOLCAT-;localRetractPQ|
                      (SPADCALL |pq| |mvp| |d| (QREFELT $ 192)) $)
                     . #3#)
               (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)) . #3#)
               (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)) . #3#)
               (EXIT
                (LETT |pq|
                      (SPADCALL |pq|
                                (SPADCALL
                                 (SPADCALL |pq| |mvp| |d| (QREFELT $ 192))
                                 |mvp| |d| (QREFELT $ 193))
                                (QREFELT $ 194))
                      . #3#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (SPADCALL |newp| (|RPOLCAT-;localRetractPQ| |pq| $)
                    (QREFELT $ 102)))))))))) 

(DEFUN |RPOLCAT-;localRetractPZ| (|pz| $)
  (PROG (|newp| |xvimvp| |c| |d| |vimvp| |imvp| #1=#:G623 |mvp| #2=#:G621)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pz| (QREFELT $ 196))
        (SPADCALL (SPADCALL (SPADCALL |pz| (QREFELT $ 197)) (QREFELT $ 198))
                  (QREFELT $ 176)))
       ('T
        (SEQ
         (LETT |mvp|
               (PROG2
                   (LETT #2# (SPADCALL |pz| (QREFELT $ 199))
                         . #3=(|RPOLCAT-;localRetractPZ|))
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 0) (|Symbol|) #2#))
               . #3#)
         (LETT |imvp|
               (PROG1
                   (LETT #1# (SPADCALL |mvp| (QREFELT $ 173) (QREFELT $ 180))
                         . #3#)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
               . #3#)
         (LETT |vimvp| (SPADCALL |imvp| (QREFELT $ 172)) . #3#)
         (LETT |newp| (|spadConstant| $ 41) . #3#)
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((ZEROP
                    (LETT |d| (SPADCALL |pz| |mvp| (QREFELT $ 200)) . #3#))
                   'NIL)
                  ('T 'T)))
                (GO G191)))
              (SEQ
               (LETT |c|
                     (|RPOLCAT-;localRetractPZ|
                      (SPADCALL |pz| |mvp| |d| (QREFELT $ 201)) $)
                     . #3#)
               (LETT |xvimvp| (SPADCALL |c| |vimvp| |d| (QREFELT $ 39)) . #3#)
               (LETT |newp| (SPADCALL |newp| |xvimvp| (QREFELT $ 102)) . #3#)
               (EXIT
                (LETT |pz|
                      (SPADCALL |pz|
                                (SPADCALL
                                 (SPADCALL |pz| |mvp| |d| (QREFELT $ 201))
                                 |mvp| |d| (QREFELT $ 202))
                                (QREFELT $ 203))
                      . #3#)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (SPADCALL |newp| (|RPOLCAT-;localRetractPZ| |pz| $)
                    (QREFELT $ 102)))))))))) 

(DEFUN |RPOLCAT-;retractable?| (|p| $)
  (PROG (|lvp|)
    (RETURN
     (SEQ
      (LETT |lvp| (SPADCALL |p| (QREFELT $ 204))
            . #1=(|RPOLCAT-;retractable?|))
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |lvp|) 'NIL)
                    ('T
                     (SPADCALL (|SPADfirst| |lvp|) (QREFELT $ 173)
                               (QREFELT $ 205)))))
             (GO G191)))
           (SEQ (EXIT (LETT |lvp| (CDR |lvp|) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT (NULL |lvp|)))))) 

(DEFUN |RPOLCAT-;retractablePQ?| (|p| $)
  (PROG (|lvp|)
    (RETURN
     (SEQ
      (LETT |lvp| (SPADCALL |p| (QREFELT $ 206))
            . #1=(|RPOLCAT-;retractablePQ?|))
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |lvp|) 'NIL)
                    ('T
                     (SPADCALL (|SPADfirst| |lvp|) (QREFELT $ 173)
                               (QREFELT $ 205)))))
             (GO G191)))
           (SEQ (EXIT (LETT |lvp| (CDR |lvp|) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT (NULL |lvp|)))))) 

(DEFUN |RPOLCAT-;retractablePZ?| (|p| $)
  (PROG (|lvp|)
    (RETURN
     (SEQ
      (LETT |lvp| (SPADCALL |p| (QREFELT $ 207))
            . #1=(|RPOLCAT-;retractablePZ?|))
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |lvp|) 'NIL)
                    ('T
                     (SPADCALL (|SPADfirst| |lvp|) (QREFELT $ 173)
                               (QREFELT $ 205)))))
             (GO G191)))
           (SEQ (EXIT (LETT |lvp| (CDR |lvp|) . #1#))) NIL (GO G190) G191
           (EXIT NIL))
      (EXIT (NULL |lvp|)))))) 

(DEFUN |RPOLCAT-;localRetractIfCan| (|p| $)
  (COND ((NULL (|RPOLCAT-;retractable?| |p| $)) (CONS 1 "failed"))
        ('T (CONS 0 (|RPOLCAT-;localRetract| |p| $))))) 

(DEFUN |RPOLCAT-;localRetractIfCanPQ| (|p| $)
  (COND ((NULL (|RPOLCAT-;retractablePQ?| |p| $)) (CONS 1 "failed"))
        ('T (CONS 0 (|RPOLCAT-;localRetractPQ| |p| $))))) 

(DEFUN |RPOLCAT-;localRetractIfCanPZ| (|p| $)
  (COND ((NULL (|RPOLCAT-;retractablePZ?| |p| $)) (CONS 1 "failed"))
        ('T (CONS 0 (|RPOLCAT-;localRetractPZ| |p| $))))) 

(DEFUN |RPOLCAT-;ZToR| (|z| $) (SPADCALL |z| (QREFELT $ 198))) 

(DEFUN |RPOLCAT-;PZToPR| (|pz| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;ZToR|) $) |pz| (QREFELT $ 210))) 

(DEFUN |RPOLCAT-;QToR| (|q| $) (SPADCALL |q| (QREFELT $ 189))) 

(DEFUN |RPOLCAT-;PQToPR| (|pq| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;QToR|) $) |pq| (QREFELT $ 213))) 

(DEFUN |RPOLCAT-;retract;PS;79| (|pz| $)
  (PROG (|rif|)
    (RETURN
     (SEQ (LETT |rif| (SPADCALL |pz| (QREFELT $ 214)) |RPOLCAT-;retract;PS;79|)
          (EXIT
           (COND
            ((QEQCAR |rif| 1)
             (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
            ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;80| (|pz| $) (SPADCALL |pz| (QREFELT $ 216))) 

(DEFUN |RPOLCAT-;retract;PS;81| (|pq| $)
  (PROG (|rif|)
    (RETURN
     (SEQ (LETT |rif| (SPADCALL |pq| (QREFELT $ 218)) |RPOLCAT-;retract;PS;81|)
          (EXIT
           (COND
            ((QEQCAR |rif| 1)
             (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
            ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;82| (|pq| $) (SPADCALL |pq| (QREFELT $ 220))) 

(DEFUN |RPOLCAT-;ZToQ| (|z| $) (SPADCALL |z| (QREFELT $ 224))) 

(DEFUN |RPOLCAT-;RToQ| (|r| $) (SPADCALL |r| (QREFELT $ 225))) 

(DEFUN |RPOLCAT-;PZToPQ| (|pz| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;ZToQ|) $) |pz| (QREFELT $ 227))) 

(DEFUN |RPOLCAT-;PRToPQ| (|pr| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;RToQ|) $) |pr| (QREFELT $ 229))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;87| (|pz| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (|RPOLCAT-;PZToPQ| |pz| $) |RPOLCAT-;retractIfCan;PU;87|)
          (EXIT (SPADCALL |pq| (QREFELT $ 218))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;88| (|pq| $)
  (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(DEFUN |RPOLCAT-;convert;PS;89| (|pr| $)
  (PROG (|lrif|)
    (RETURN
     (SEQ
      (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $)
            |RPOLCAT-;convert;PS;89|)
      (EXIT
       (COND
        ((QEQCAR |lrif| 1) (|error| "failed in convert: PR->% from RPOLCAT"))
        ('T (QCDR |lrif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;90| (|pr| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (|RPOLCAT-;PRToPQ| |pr| $) |RPOLCAT-;convert;PS;90|)
          (EXIT (SPADCALL |pq| (QREFELT $ 220))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;91| (|pr| $)
  (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;92| (|pq| $)
  (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;93| (|pq| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PQToPR| |pq| $) |RPOLCAT-;retractIfCan;PU;93|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;94| (|pz| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $) |RPOLCAT-;retractIfCan;PU;94|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retract;PS;95| (|pr| $)
  (PROG (|rif|)
    (RETURN
     (SEQ (LETT |rif| (SPADCALL |pr| (QREFELT $ 234)) |RPOLCAT-;retract;PS;95|)
          (EXIT
           (COND
            ((QEQCAR |rif| 1)
             (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
            ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;96| (|pr| $) (SPADCALL |pr| (QREFELT $ 236))) 

(DEFUN |RPOLCAT-;retract;PS;97| (|pz| $)
  (PROG (|rif|)
    (RETURN
     (SEQ (LETT |rif| (SPADCALL |pz| (QREFELT $ 214)) |RPOLCAT-;retract;PS;97|)
          (EXIT
           (COND
            ((QEQCAR |rif| 1)
             (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
            ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;98| (|pz| $) (SPADCALL |pz| (QREFELT $ 216))) 

(DEFUN |RPOLCAT-;RToZ| (|r| $) (SPADCALL |r| (QREFELT $ 238))) 

(DEFUN |RPOLCAT-;PRToPZ| (|pr| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;RToZ|) $) |pr| (QREFELT $ 240))) 

(DEFUN |RPOLCAT-;convert;PS;101| (|pr| $)
  (PROG (|lrif|)
    (RETURN
     (SEQ
      (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $)
            |RPOLCAT-;convert;PS;101|)
      (EXIT
       (COND
        ((QEQCAR |lrif| 1) (|error| "failed in convert: PR->% from RPOLCAT"))
        ('T (QCDR |lrif|)))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;102| (|pz| $)
  (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(DEFUN |RPOLCAT-;convert;PS;103| (|pr| $)
  (PROG (|pz|)
    (RETURN
     (SEQ (LETT |pz| (|RPOLCAT-;PRToPZ| |pr| $) |RPOLCAT-;convert;PS;103|)
          (EXIT (SPADCALL |pz| (QREFELT $ 216))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;104| (|pr| $)
  (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;105| (|pz| $)
  (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;106| (|pz| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $) |RPOLCAT-;retractIfCan;PU;106|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retract;PS;107| (|pr| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pr| (QREFELT $ 234)) |RPOLCAT-;retract;PS;107|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;108| (|pr| $) (SPADCALL |pr| (QREFELT $ 236))) 

(DEFUN |RPOLCAT-;ZToR| (|z| $) (SPADCALL |z| (QREFELT $ 198))) 

(DEFUN |RPOLCAT-;PZToPR| (|pz| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;ZToR|) $) |pz| (QREFELT $ 210))) 

(DEFUN |RPOLCAT-;QToR| (|q| $) (SPADCALL |q| (QREFELT $ 189))) 

(DEFUN |RPOLCAT-;PQToPR| (|pq| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;QToR|) $) |pq| (QREFELT $ 213))) 

(DEFUN |RPOLCAT-;retract;PS;113| (|pz| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pz| (QREFELT $ 214)) |RPOLCAT-;retract;PS;113|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;114| (|pz| $) (SPADCALL |pz| (QREFELT $ 216))) 

(DEFUN |RPOLCAT-;retract;PS;115| (|pq| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pq| (QREFELT $ 218)) |RPOLCAT-;retract;PS;115|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;116| (|pq| $) (SPADCALL |pq| (QREFELT $ 220))) 

(DEFUN |RPOLCAT-;ZToQ| (|z| $) (SPADCALL |z| (QREFELT $ 224))) 

(DEFUN |RPOLCAT-;RToQ| (|r| $) (SPADCALL |r| (QREFELT $ 225))) 

(DEFUN |RPOLCAT-;PZToPQ| (|pz| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;ZToQ|) $) |pz| (QREFELT $ 227))) 

(DEFUN |RPOLCAT-;PRToPQ| (|pr| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;RToQ|) $) |pr| (QREFELT $ 229))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;121| (|pz| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (|RPOLCAT-;PZToPQ| |pz| $) |RPOLCAT-;retractIfCan;PU;121|)
          (EXIT (SPADCALL |pq| (QREFELT $ 218))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;122| (|pq| $)
  (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(DEFUN |RPOLCAT-;convert;PS;123| (|pr| $)
  (PROG (|lrif|)
    (RETURN
     (SEQ
      (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $)
            |RPOLCAT-;convert;PS;123|)
      (EXIT
       (COND
        ((QEQCAR |lrif| 1) (|error| "failed in convert: PR->% from RPOLCAT"))
        ('T (QCDR |lrif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;124| (|pr| $)
  (PROG (|pq|)
    (RETURN
     (SEQ (LETT |pq| (|RPOLCAT-;PRToPQ| |pr| $) |RPOLCAT-;convert;PS;124|)
          (EXIT (SPADCALL |pq| (QREFELT $ 220))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;125| (|pr| $)
  (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;126| (|pq| $)
  (|RPOLCAT-;localRetractIfCanPQ| |pq| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;127| (|pq| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PQToPR| |pq| $) |RPOLCAT-;retractIfCan;PU;127|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;128| (|pz| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $) |RPOLCAT-;retractIfCan;PU;128|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retract;PS;129| (|pr| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pr| (QREFELT $ 234)) |RPOLCAT-;retract;PS;129|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;130| (|pr| $) (SPADCALL |pr| (QREFELT $ 236))) 

(DEFUN |RPOLCAT-;retract;PS;131| (|pz| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pz| (QREFELT $ 214)) |RPOLCAT-;retract;PS;131|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;132| (|pz| $) (SPADCALL |pz| (QREFELT $ 216))) 

(DEFUN |RPOLCAT-;RToZ| (|r| $) (SPADCALL |r| (QREFELT $ 238))) 

(DEFUN |RPOLCAT-;PRToPZ| (|pr| $)
  (SPADCALL (CONS (|function| |RPOLCAT-;RToZ|) $) |pr| (QREFELT $ 240))) 

(DEFUN |RPOLCAT-;convert;PS;135| (|pr| $)
  (PROG (|lrif|)
    (RETURN
     (SEQ
      (LETT |lrif| (|RPOLCAT-;localRetractIfCan| |pr| $)
            |RPOLCAT-;convert;PS;135|)
      (EXIT
       (COND
        ((QEQCAR |lrif| 1) (|error| "failed in convert: PR->% from RPOLCAT"))
        ('T (QCDR |lrif|)))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;136| (|pz| $)
  (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(DEFUN |RPOLCAT-;convert;PS;137| (|pr| $)
  (PROG (|pz|)
    (RETURN
     (SEQ (LETT |pz| (|RPOLCAT-;PRToPZ| |pr| $) |RPOLCAT-;convert;PS;137|)
          (EXIT (SPADCALL |pz| (QREFELT $ 216))))))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;138| (|pr| $)
  (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;139| (|pz| $)
  (|RPOLCAT-;localRetractIfCanPZ| |pz| $)) 

(DEFUN |RPOLCAT-;retractIfCan;PU;140| (|pz| $)
  (PROG (|pr|)
    (RETURN
     (SEQ (LETT |pr| (|RPOLCAT-;PZToPR| |pz| $) |RPOLCAT-;retractIfCan;PU;140|)
          (EXIT (SPADCALL |pr| (QREFELT $ 234))))))) 

(DEFUN |RPOLCAT-;retract;PS;141| (|pr| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pr| (QREFELT $ 234)) |RPOLCAT-;retract;PS;141|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;142| (|pr| $) (SPADCALL |pr| (QREFELT $ 236))) 

(DEFUN |RPOLCAT-;retractIfCan;PU;143| (|pr| $)
  (|RPOLCAT-;localRetractIfCan| |pr| $)) 

(DEFUN |RPOLCAT-;retract;PS;144| (|pr| $)
  (PROG (|rif|)
    (RETURN
     (SEQ
      (LETT |rif| (SPADCALL |pr| (QREFELT $ 234)) |RPOLCAT-;retract;PS;144|)
      (EXIT
       (COND
        ((QEQCAR |rif| 1)
         (|error| "failed in retract: POLY Z -> % from RPOLCAT"))
        ('T (QCDR |rif|)))))))) 

(DEFUN |RPOLCAT-;convert;PS;145| (|pr| $) (SPADCALL |pr| (QREFELT $ 236))) 

(DEFUN |RPOLCAT-;convert;SS;146| (|pol| $)
  (PROG (|stpol| |n| |sdpol| |svpol| |sipol| |tpol| |dpol| |vpol| |ipol|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pol| (QREFELT $ 11))
        (STRINGIMAGE
         (SPADCALL (SPADCALL |pol| (QREFELT $ 12)) (QREFELT $ 238))))
       (#1='T
        (SEQ
         (LETT |ipol| (SPADCALL |pol| (QREFELT $ 15))
               . #2=(|RPOLCAT-;convert;SS;146|))
         (LETT |vpol| (SPADCALL |pol| (QREFELT $ 23)) . #2#)
         (LETT |dpol| (SPADCALL |pol| (QREFELT $ 22)) . #2#)
         (LETT |tpol| (SPADCALL |pol| (QREFELT $ 19)) . #2#)
         (COND
          ((SPADCALL |ipol| (|spadConstant| $ 16) (QREFELT $ 18))
           (LETT |sipol| (|make_full_CVEC| 0) . #2#))
          ((SPADCALL (SPADCALL |ipol| (QREFELT $ 241)) (|spadConstant| $ 16)
                     (QREFELT $ 18))
           (LETT |sipol| "-" . #2#))
          (#1#
           (SEQ (LETT |sipol| (SPADCALL |ipol| (QREFELT $ 243)) . #2#)
                (EXIT
                 (COND
                  ((SPADCALL |ipol| (QREFELT $ 244))
                   (LETT |sipol| (STRCONC |sipol| "*") . #2#))
                  (#1#
                   (LETT |sipol|
                         (SPADCALL (LIST "(" |sipol| ")*") (QREFELT $ 245))
                         . #2#)))))))
         (LETT |svpol|
               (SPADCALL (SPADCALL |vpol| (QREFELT $ 162)) (QREFELT $ 246))
               . #2#)
         (COND ((EQL |dpol| 1) (LETT |sdpol| (|make_full_CVEC| 0) . #2#))
               (#1# (LETT |sdpol| (STRCONC "^" (STRINGIMAGE |dpol|)) . #2#)))
         (COND
          ((SPADCALL |tpol| (QREFELT $ 20))
           (LETT |stpol| (|make_full_CVEC| 0) . #2#))
          ((SPADCALL |tpol| (QREFELT $ 11))
           (SEQ
            (LETT |n|
                  (SPADCALL (SPADCALL |tpol| (QREFELT $ 12)) (QREFELT $ 238))
                  . #2#)
            (EXIT
             (COND
              ((SPADCALL |n| 0 (QREFELT $ 71))
               (LETT |stpol| (STRCONC " +" (STRINGIMAGE |n|)) . #2#))
              (#1# (LETT |stpol| (STRINGIMAGE |n|) . #2#))))))
          (#1#
           (SEQ (LETT |stpol| (SPADCALL |tpol| (QREFELT $ 243)) . #2#)
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL
                     (SPADCALL (SPADCALL |stpol| 1 (QREFELT $ 250))
                               (QREFELT $ 251))
                     (LIST "+" "-") (QREFELT $ 253)))
                   (LETT |stpol| (STRCONC " + " |stpol|) . #2#)))))))
         (EXIT
          (SPADCALL (LIST |sipol| |svpol| |sdpol| |stpol|)
                    (QREFELT $ 245)))))))))) 

(DECLAIM (NOTINLINE |RecursivePolynomialCategory&;|)) 

(DEFUN |RecursivePolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G598 #2=#:G895 |i| #3=#:G894 |pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #4=(|RecursivePolynomialCategory&|))
       (LETT DV$2 (|devaluate| |#2|) . #4#)
       (LETT DV$3 (|devaluate| |#3|) . #4#)
       (LETT DV$4 (|devaluate| |#4|) . #4#)
       (LETT |dv$| (LIST '|RecursivePolynomialCategory&| DV$1 DV$2 DV$3 DV$4)
             . #4#)
       (LETT $ (GETREFV 261) . #4#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (|HasCategory| |#2| '(|GcdDomain|))
                                           (|HasCategory| |#2|
                                                          '(|IntegralDomain|))
                                           (|HasCategory| |#2|
                                                          '(|RetractableTo|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|IntegerNumberSystem|))
                                           (|HasCategory| |#2|
                                                          '(|Algebra|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|QuotientFieldCategory|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#4|
                                                          '(|ConvertibleTo|
                                                            (|Symbol|)))))
                       . #4#))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (QSETREFV $ 8 |#3|)
       (QSETREFV $ 9 |#4|)
       (SETF |pv$| (QREFELT $ 3))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (COND
           ((|HasCategory| |#2| '(|EuclideanDomain|))
            (QSETREFV $ 127
                      (CONS (|dispatchFunction| |RPOLCAT-;iexactQuo;3R;47|)
                            $)))
           ('T
            (QSETREFV $ 127
                      (CONS (|dispatchFunction| |RPOLCAT-;iexactQuo;3R;48|)
                            $))))
          (QSETREFV $ 131
                    (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient;SRS;50|)
                          $))
          (QSETREFV $ 134
                    (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient;3S;51|)
                          $))
          (QSETREFV $ 136
                    (CONS (|dispatchFunction| |RPOLCAT-;exactQuotient!;3S;52|)
                          $))
          (COND
           ((|testBitVector| |pv$| 1)
            (COND
             ((|HasCategory| |#2| '(|Field|))
              (PROGN
               (QSETREFV $ 138
                         (CONS
                          (|dispatchFunction|
                           |RPOLCAT-;primPartElseUnitCanonical;2S;53|)
                          $))
               (QSETREFV $ 139
                         (CONS
                          (|dispatchFunction|
                           |RPOLCAT-;primPartElseUnitCanonical!;2S;54|)
                          $))))
             ('T
              (PROGN
               (QSETREFV $ 138
                         (CONS
                          (|dispatchFunction|
                           |RPOLCAT-;primPartElseUnitCanonical;2S;55|)
                          $))
               (QSETREFV $ 143
                         (CONS
                          (|dispatchFunction| |RPOLCAT-;primitivePart!;2S;56|)
                          $))
               (QSETREFV $ 139
                         (CONS
                          (|dispatchFunction|
                           |RPOLCAT-;primPartElseUnitCanonical!;2S;57|)
                          $))))))
           ('T
            (PROGN
             (QSETREFV $ 138
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical;2S;58|)
                        $))
             (QSETREFV $ 139
                       (CONS
                        (|dispatchFunction|
                         |RPOLCAT-;primPartElseUnitCanonical!;2S;59|)
                        $))))))))
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV $ 147 (CONS (|dispatchFunction| |RPOLCAT-;gcd;RSR;60|) $))
          (QSETREFV $ 150
                    (CONS (|dispatchFunction| |RPOLCAT-;mainContent;2S;61|) $))
          (QSETREFV $ 154
                    (CONS
                     (|dispatchFunction| |RPOLCAT-;mainPrimitivePart;2S;62|)
                     $))
          (QSETREFV $ 157
                    (CONS
                     (|dispatchFunction| |RPOLCAT-;mainSquareFreePart;2S;63|)
                     $)))))
       (COND
        ((|testBitVector| |pv$| 8)
         (PROGN
          (QSETREFV $ 167
                    (CONS (|dispatchFunction| |RPOLCAT-;convert;SP;64|) $))
          (QSETREFV $ 168
                    (CONS (|dispatchFunction| |RPOLCAT-;coerce;SP;65|) $))
          NIL
          NIL
          NIL
          NIL
          NIL
          NIL
          (COND
           ((|HasCategory| |#4| '(|Finite|))
            (PROGN
             (QSETREFV $ 170 (SPADCALL (QREFELT $ 169)))
             NIL
             (QSETREFV $ 173
                       (PROGN
                        (LETT #3# NIL . #4#)
                        (SEQ (LETT |i| 1 . #4#)
                             (LETT #2# (QREFELT $ 170) . #4#) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (PROG1 (LETT #1# |i| . #4#)
                                          (|check_subtype| (> #1# 0)
                                                           '(|PositiveInteger|)
                                                           #1#))
                                        (QREFELT $ 172))
                                       (QREFELT $ 162))
                                      #3#)
                                     . #4#)))
                             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #3#)))))
             (COND ((|testBitVector| |pv$| 7)))
             (COND ((|testBitVector| |pv$| 5))))))
          (COND
           ((|testBitVector| |pv$| 5)
            (PROGN
             (QSETREFV $ 208
                       (|MPolyCatFunctions2| (|Symbol|)
                                             (|IndexedExponents| (|Symbol|))
                                             (|IndexedExponents| (|Symbol|))
                                             (|Integer|) |#2|
                                             (|Polynomial| (|Integer|))
                                             (|Polynomial| |#2|)))
             (COND
              ((|testBitVector| |pv$| 7)
               (PROGN
                (QSETREFV $ 211
                          (|MPolyCatFunctions2| (|Symbol|)
                                                (|IndexedExponents| (|Symbol|))
                                                (|IndexedExponents| (|Symbol|))
                                                (|Fraction| (|Integer|)) |#2|
                                                (|Polynomial|
                                                 (|Fraction| (|Integer|)))
                                                (|Polynomial| |#2|)))
                (QSETREFV $ 215
                          (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;79|)
                                $))
                (QSETREFV $ 217
                          (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;80|)
                                $))
                (QSETREFV $ 219
                          (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;81|)
                                $))
                (QSETREFV $ 221
                          (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;82|)
                                $))
                (COND
                 ((|testBitVector| |pv$| 6)
                  (PROGN
                   (QSETREFV $ 222
                             (|MPolyCatFunctions2| (|Symbol|)
                                                   (|IndexedExponents|
                                                    (|Symbol|))
                                                   (|IndexedExponents|
                                                    (|Symbol|))
                                                   (|Integer|)
                                                   (|Fraction| (|Integer|))
                                                   (|Polynomial| (|Integer|))
                                                   (|Polynomial|
                                                    (|Fraction| (|Integer|)))))
                   (QSETREFV $ 223
                             (|MPolyCatFunctions2| (|Symbol|)
                                                   (|IndexedExponents|
                                                    (|Symbol|))
                                                   (|IndexedExponents|
                                                    (|Symbol|))
                                                   |#2|
                                                   (|Fraction| (|Integer|))
                                                   (|Polynomial| |#2|)
                                                   (|Polynomial|
                                                    (|Fraction| (|Integer|)))))
                   (QSETREFV $ 230
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;87|)
                              $))
                   (COND
                    ((|HasCategory| |#4| '(|Finite|))
                     (PROGN
                      (QSETREFV $ 231
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;88|)
                                 $))
                      (QSETREFV $ 232
                                (CONS
                                 (|dispatchFunction| |RPOLCAT-;convert;PS;89|)
                                 $))))
                    ('T
                     (QSETREFV $ 232
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;convert;PS;90|)
                                $))))))
                 ('T
                  (PROGN
                   (COND
                    ((|HasCategory| |#4| '(|Finite|))
                     (PROGN
                      (QSETREFV $ 233
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;91|)
                                 $))
                      (QSETREFV $ 231
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;92|)
                                 $))))
                    ('T
                     (QSETREFV $ 231
                               (CONS
                                (|dispatchFunction|
                                 |RPOLCAT-;retractIfCan;PU;93|)
                                $))))
                   (QSETREFV $ 230
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;94|)
                              $))
                   (QSETREFV $ 235
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;retract;PS;95|) $))
                   (QSETREFV $ 232
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;convert;PS;96|)
                              $))))))))
             (COND
              ((|testBitVector| |pv$| 5)
               (COND ((|testBitVector| |pv$| 7))
                     ('T
                      (PROGN
                       (QSETREFV $ 215
                                 (CONS
                                  (|dispatchFunction| |RPOLCAT-;retract;PS;97|)
                                  $))
                       (QSETREFV $ 217
                                 (CONS
                                  (|dispatchFunction| |RPOLCAT-;convert;PS;98|)
                                  $))
                       (COND
                        ((|testBitVector| |pv$| 4)
                         (PROGN
                          (QSETREFV $ 237
                                    (|MPolyCatFunctions2| (|Symbol|)
                                                          (|IndexedExponents|
                                                           (|Symbol|))
                                                          (|IndexedExponents|
                                                           (|Symbol|))
                                                          |#2| (|Integer|)
                                                          (|Polynomial| |#2|)
                                                          (|Polynomial|
                                                           (|Integer|))))
                          (COND
                           ((|HasCategory| |#4| '(|Finite|))
                            (PROGN
                             (QSETREFV $ 232
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;convert;PS;101|)
                                        $))
                             (QSETREFV $ 230
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;102|)
                                        $))))
                           ('T
                            (QSETREFV $ 232
                                      (CONS
                                       (|dispatchFunction|
                                        |RPOLCAT-;convert;PS;103|)
                                       $))))))
                        ('T
                         (PROGN
                          (COND
                           ((|HasCategory| |#4| '(|Finite|))
                            (PROGN
                             (QSETREFV $ 233
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;104|)
                                        $))
                             (QSETREFV $ 230
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;105|)
                                        $))))
                           ('T
                            (QSETREFV $ 230
                                      (CONS
                                       (|dispatchFunction|
                                        |RPOLCAT-;retractIfCan;PU;106|)
                                       $))))
                          (QSETREFV $ 235
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;retract;PS;107|)
                                     $))
                          (QSETREFV $ 232
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;convert;PS;108|)
                                     $))))))))))))
           ((|testBitVector| |pv$| 7)
            (PROGN
             (SETELT $ 208
                     (|MPolyCatFunctions2| (|Symbol|)
                                           (|IndexedExponents| (|Symbol|))
                                           (|IndexedExponents| (|Symbol|))
                                           (|Integer|) |#2|
                                           (|Polynomial| (|Integer|))
                                           (|Polynomial| |#2|)))
             (COND
              ((|testBitVector| |pv$| 7)
               (PROGN
                (SETELT $ 211
                        (|MPolyCatFunctions2| (|Symbol|)
                                              (|IndexedExponents| (|Symbol|))
                                              (|IndexedExponents| (|Symbol|))
                                              (|Fraction| (|Integer|)) |#2|
                                              (|Polynomial|
                                               (|Fraction| (|Integer|)))
                                              (|Polynomial| |#2|)))
                (QSETREFV $ 215
                          (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;113|)
                                $))
                (QSETREFV $ 217
                          (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;114|)
                                $))
                (QSETREFV $ 219
                          (CONS (|dispatchFunction| |RPOLCAT-;retract;PS;115|)
                                $))
                (QSETREFV $ 221
                          (CONS (|dispatchFunction| |RPOLCAT-;convert;PS;116|)
                                $))
                (COND
                 ((|testBitVector| |pv$| 6)
                  (PROGN
                   (SETELT $ 222
                           (|MPolyCatFunctions2| (|Symbol|)
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|Integer|)
                                                 (|Fraction| (|Integer|))
                                                 (|Polynomial| (|Integer|))
                                                 (|Polynomial|
                                                  (|Fraction| (|Integer|)))))
                   (SETELT $ 223
                           (|MPolyCatFunctions2| (|Symbol|)
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 (|IndexedExponents|
                                                  (|Symbol|))
                                                 |#2| (|Fraction| (|Integer|))
                                                 (|Polynomial| |#2|)
                                                 (|Polynomial|
                                                  (|Fraction| (|Integer|)))))
                   (QSETREFV $ 230
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;121|)
                              $))
                   (COND
                    ((|HasCategory| |#4| '(|Finite|))
                     (PROGN
                      (QSETREFV $ 231
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;122|)
                                 $))
                      (QSETREFV $ 232
                                (CONS
                                 (|dispatchFunction| |RPOLCAT-;convert;PS;123|)
                                 $))))
                    ('T
                     (QSETREFV $ 232
                               (CONS
                                (|dispatchFunction| |RPOLCAT-;convert;PS;124|)
                                $))))))
                 ('T
                  (PROGN
                   (COND
                    ((|HasCategory| |#4| '(|Finite|))
                     (PROGN
                      (QSETREFV $ 233
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;125|)
                                 $))
                      (QSETREFV $ 231
                                (CONS
                                 (|dispatchFunction|
                                  |RPOLCAT-;retractIfCan;PU;126|)
                                 $))))
                    ('T
                     (QSETREFV $ 231
                               (CONS
                                (|dispatchFunction|
                                 |RPOLCAT-;retractIfCan;PU;127|)
                                $))))
                   (QSETREFV $ 230
                             (CONS
                              (|dispatchFunction|
                               |RPOLCAT-;retractIfCan;PU;128|)
                              $))
                   (QSETREFV $ 235
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;retract;PS;129|)
                              $))
                   (QSETREFV $ 232
                             (CONS
                              (|dispatchFunction| |RPOLCAT-;convert;PS;130|)
                              $))))))))
             (COND
              ((|testBitVector| |pv$| 5)
               (COND ((|testBitVector| |pv$| 7))
                     ('T
                      (PROGN
                       (QSETREFV $ 215
                                 (CONS
                                  (|dispatchFunction|
                                   |RPOLCAT-;retract;PS;131|)
                                  $))
                       (QSETREFV $ 217
                                 (CONS
                                  (|dispatchFunction|
                                   |RPOLCAT-;convert;PS;132|)
                                  $))
                       (COND
                        ((|testBitVector| |pv$| 4)
                         (PROGN
                          (SETELT $ 237
                                  (|MPolyCatFunctions2| (|Symbol|)
                                                        (|IndexedExponents|
                                                         (|Symbol|))
                                                        (|IndexedExponents|
                                                         (|Symbol|))
                                                        |#2| (|Integer|)
                                                        (|Polynomial| |#2|)
                                                        (|Polynomial|
                                                         (|Integer|))))
                          (COND
                           ((|HasCategory| |#4| '(|Finite|))
                            (PROGN
                             (QSETREFV $ 232
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;convert;PS;135|)
                                        $))
                             (QSETREFV $ 230
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;136|)
                                        $))))
                           ('T
                            (QSETREFV $ 232
                                      (CONS
                                       (|dispatchFunction|
                                        |RPOLCAT-;convert;PS;137|)
                                       $))))))
                        ('T
                         (PROGN
                          (COND
                           ((|HasCategory| |#4| '(|Finite|))
                            (PROGN
                             (QSETREFV $ 233
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;138|)
                                        $))
                             (QSETREFV $ 230
                                       (CONS
                                        (|dispatchFunction|
                                         |RPOLCAT-;retractIfCan;PU;139|)
                                        $))))
                           ('T
                            (QSETREFV $ 230
                                      (CONS
                                       (|dispatchFunction|
                                        |RPOLCAT-;retractIfCan;PU;140|)
                                       $))))
                          (QSETREFV $ 235
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;retract;PS;141|)
                                     $))
                          (QSETREFV $ 232
                                    (CONS
                                     (|dispatchFunction|
                                      |RPOLCAT-;convert;PS;142|)
                                     $)))))))))))))
          (COND ((OR (|testBitVector| |pv$| 5) (|testBitVector| |pv$| 7)))
                ('T
                 (PROGN
                  (COND
                   ((|HasCategory| |#4| '(|Finite|))
                    (QSETREFV $ 233
                              (CONS
                               (|dispatchFunction|
                                |RPOLCAT-;retractIfCan;PU;143|)
                               $))))
                  (QSETREFV $ 235
                            (CONS
                             (|dispatchFunction| |RPOLCAT-;retract;PS;144|) $))
                  (QSETREFV $ 232
                            (CONS
                             (|dispatchFunction| |RPOLCAT-;convert;PS;145|)
                             $)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 254
                      (CONS (|dispatchFunction| |RPOLCAT-;convert;SS;146|)
                            $)))))))
       $))))) 

(MAKEPROP '|RecursivePolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (0 . |ground?|)
              (5 . |ground|) (|OutputForm|) (10 . |coerce|) (15 . |init|)
              (20 . |One|) (24 . |One|) (28 . =) (34 . |tail|) (39 . |zero?|)
              (|NonNegativeInteger|) (44 . |mdeg|) (49 . |mvar|)
              (54 . |coerce|) (59 . |coerce|) (64 . ^) (70 . |coerce|) (75 . +)
              (81 . *) |RPOLCAT-;coerce;SOf;1| (|Union| 9 '"failed")
              (87 . |mainVariable|) |RPOLCAT-;mvar;SV;2| (92 . |degree|)
              |RPOLCAT-;mdeg;SNni;3| (98 . |coefficient|) |RPOLCAT-;init;2S;4|
              |RPOLCAT-;leadingCoefficient;SVS;5| (105 . |monomial|)
              |RPOLCAT-;head;2S;6| (112 . |Zero|) (116 . -)
              |RPOLCAT-;reductum;SVS;7| (122 . |head|) |RPOLCAT-;tail;2S;8|
              (127 . >) (133 . |deepestTail|) |RPOLCAT-;deepestTail;2S;9|
              (|List| $) (138 . |iteratedInitials|)
              |RPOLCAT-;iteratedInitials;SL;10| |RPOLCAT-;deepestInitial;2S;12|
              (|Union| $ '"failed") (143 . |recip|) |RPOLCAT-;monic?;SB;13|
              |RPOLCAT-;quasiMonic?;SB;14| |RPOLCAT-;mainMonomial;2S;15|
              (148 . |minimumDegree|) |RPOLCAT-;leastMonomial;2S;16|
              (|SparseUnivariatePolynomial| $) (154 . |univariate|) (|List| 6)
              (|SparseUnivariatePolynomial| 6) (160 . |coefficients|)
              |RPOLCAT-;mainCoefficients;SL;17| (165 . |monomials|)
              (170 . |degree|) |RPOLCAT-;mainMonomials;SL;18| (175 . <)
              (|Integer|) (181 . >) (|Union| 10 '"failed")
              (187 . |RittWuCompare|) |RPOLCAT-;RittWuCompare;2SU;19|
              |RPOLCAT-;infRittWu?;2SB;20| (193 . |infRittWu?|)
              |RPOLCAT-;supRittWu?;2SB;21|
              (|Record| (|:| |coef| $) (|:| |gap| 21) (|:| |remainder| $))
              (199 . |lazyPremWithDefault|) (205 . ^) (211 . *)
              |RPOLCAT-;prem;3S;22|
              (|Record| (|:| |coef| $) (|:| |gap| 21) (|:| |quotient| $)
                        (|:| |remainder| $))
              (217 . |lazyPseudoDivide|) |RPOLCAT-;pquo;3S;23|
              (223 . |lazyPremWithDefault|) |RPOLCAT-;prem;2SVS;24|
              (230 . |lazyPseudoDivide|) |RPOLCAT-;pquo;2SVS;25|
              (237 . |monic?|) (242 . |monicModulo|) |RPOLCAT-;lazyPrem;3S;26|
              |RPOLCAT-;lazyPquo;3S;27| (248 . =) (254 . |lazyPrem|)
              (260 . |leadingCoefficient|) |RPOLCAT-;lazyPrem;2SVS;28|
              |RPOLCAT-;lazyPquo;2SVS;29| (266 . |reduced?|)
              (|Record| (|:| |polnum| $) (|:| |polden| $) (|:| |power| 21))
              (272 . |lazyResidueClass|) (278 . +) |RPOLCAT-;headReduce;3S;30|
              (284 . >=) (290 . |mainMonomial|)
              |RPOLCAT-;initiallyReduce;3S;31|
              |RPOLCAT-;lazyPremWithDefault;2SR;32|
              |RPOLCAT-;lazyPremWithDefault;2SVR;33|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |RPOLCAT-;pseudoDivide;2SR;34| |RPOLCAT-;lazyPseudoDivide;2SR;35|
              |RPOLCAT-;lazyPseudoDivide;2SVR;36| |RPOLCAT-;monicModulo;3S;37|
              |RPOLCAT-;lazyResidueClass;2SR;38| |RPOLCAT-;reduced?;2SB;39|
              |RPOLCAT-;reduced?;SLB;40| |RPOLCAT-;headReduced?;2SB;41|
              (295 . |reduced?|) |RPOLCAT-;headReduced?;SLB;42|
              (301 . |initiallyReduced?|) |RPOLCAT-;initiallyReduced?;2SB;43|
              |RPOLCAT-;initiallyReduced?;SLB;44| (307 . |normalized?|)
              |RPOLCAT-;normalized?;2SB;45| |RPOLCAT-;normalized?;SLB;46|
              (313 . |quo|) (319 . |iexactQuo|) (325 . |exquo|)
              (331 . |iexactQuo|) (337 . |exquo|) (343 . |exactQuotient|)
              (349 . |exactQuotient|) (355 . |exquo|) (361 . |exactQuotient|)
              (367 . |exactQuotient!|) (373 . |exactQuotient!|)
              (379 . |unitCanonical|) (384 . |primPartElseUnitCanonical|)
              (389 . |primPartElseUnitCanonical!|) (394 . |primitivePart|)
              (399 . |content|) (404 . =) (410 . |primitivePart!|)
              (415 . |primitivePart!|) (420 . |gcd|) (426 . |gcd|)
              (432 . |gcd|) (438 . |mainCoefficients|) (443 . |gcd|)
              (449 . |mainContent|) (454 . |mainContent|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (459 . |unitNormal|) (464 . |mainPrimitivePart|)
              (469 . |squareFreePart|) (474 . |multivariate|)
              (480 . |mainSquareFreePart|) (|Polynomial| 7) (485 . |coerce|)
              (490 . |convert|) (|Symbol|) (495 . |convert|) (500 . |coerce|)
              (505 . ^) (511 . *) (517 . +) (523 . |convert|) (528 . |coerce|)
              (533 . |size|) '|sizeV| (|PositiveInteger|) (537 . |index|) '|lv|
              (542 . |ground?|) (547 . |ground|) (552 . |coerce|)
              (|Union| 161 '"failed") (557 . |mainVariable|) (|List| 161)
              (562 . |position|) (568 . |degree|) (574 . |coefficient|)
              (581 . |monomial|) (588 . -) (|Polynomial| 187) (594 . |ground?|)
              (|Fraction| 70) (599 . |ground|) (604 . |coerce|)
              (609 . |mainVariable|) (614 . |degree|) (620 . |coefficient|)
              (627 . |monomial|) (634 . -) (|Polynomial| 70) (640 . |ground?|)
              (645 . |ground|) (650 . |coerce|) (655 . |mainVariable|)
              (660 . |degree|) (666 . |coefficient|) (673 . |monomial|)
              (680 . -) (686 . |variables|) (691 . |member?|)
              (697 . |variables|) (702 . |variables|) '|mpc2Z| (|Mapping| 7 70)
              (707 . |map|) '|mpc2Q| (|Mapping| 7 187) (713 . |map|)
              (719 . |retractIfCan|) (724 . |retract|) (729 . |retract|)
              (734 . |convert|) (739 . |retractIfCan|) (744 . |retract|)
              (749 . |retract|) (754 . |convert|) '|mpc2ZQ| '|mpc2RQ|
              (759 . |coerce|) (764 . |retract|) (|Mapping| 187 70)
              (769 . |map|) (|Mapping| 187 7) (775 . |map|)
              (781 . |retractIfCan|) (786 . |retractIfCan|) (791 . |convert|)
              (796 . |retractIfCan|) (801 . |retractIfCan|) (806 . |retract|)
              (811 . |retract|) '|mpc2RZ| (816 . |retract|) (|Mapping| 70 7)
              (821 . |map|) (827 . -) (|String|) (832 . |convert|)
              (837 . |monomial?|) (842 . |concat|) (847 . |string|)
              (852 . |Zero|) (856 . |One|) (|Character|) (860 . |elt|)
              (866 . |coerce|) (|List| 242) (871 . |member?|) (877 . |convert|)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 70)
              (|Union| 70 '#1="failed") (|Union| 187 '#1#) (|Union| 7 '#1#))
           '#(|tail| 882 |supRittWu?| 887 |retractIfCan| 893 |retract| 908
              |reductum| 923 |reduced?| 929 |quasiMonic?| 941 |pseudoDivide|
              946 |primitivePart!| 952 |primPartElseUnitCanonical!| 957
              |primPartElseUnitCanonical| 962 |prem| 967 |pquo| 980
              |normalized?| 993 |mvar| 1005 |monicModulo| 1010 |monic?| 1016
              |mdeg| 1021 |mainSquareFreePart| 1026 |mainPrimitivePart| 1031
              |mainMonomials| 1036 |mainMonomial| 1041 |mainContent| 1046
              |mainCoefficients| 1051 |leastMonomial| 1056 |leadingCoefficient|
              1061 |lazyResidueClass| 1067 |lazyPseudoDivide| 1073
              |lazyPremWithDefault| 1086 |lazyPrem| 1099 |lazyPquo| 1112
              |iteratedInitials| 1125 |initiallyReduced?| 1130
              |initiallyReduce| 1142 |init| 1148 |infRittWu?| 1153 |iexactQuo|
              1159 |headReduced?| 1165 |headReduce| 1177 |head| 1183 |gcd| 1188
              |exactQuotient!| 1194 |exactQuotient| 1200 |deepestTail| 1212
              |deepestInitial| 1217 |convert| 1222 |coerce| 1247
              |RittWuCompare| 1257)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 254
                                                 '(1 6 10 0 11 1 6 7 0 12 1 7
                                                   13 0 14 1 6 0 0 15 0 6 0 16
                                                   0 7 0 17 2 6 10 0 0 18 1 6 0
                                                   0 19 1 6 10 0 20 1 6 21 0 22
                                                   1 6 9 0 23 1 9 13 0 24 1 21
                                                   13 0 25 2 13 0 0 0 26 1 6 13
                                                   0 27 2 13 0 0 0 28 2 13 0 0
                                                   0 29 1 6 31 0 32 2 6 21 0 9
                                                   34 3 6 0 0 9 21 36 3 6 0 0 9
                                                   21 39 0 6 0 41 2 6 0 0 0 42
                                                   1 6 0 0 44 2 9 10 0 0 46 1 6
                                                   0 0 47 1 6 49 0 50 1 6 53 0
                                                   54 2 6 21 0 9 58 2 6 60 0 9
                                                   61 1 63 62 0 64 1 63 49 0 66
                                                   1 63 21 0 67 2 9 10 0 0 69 2
                                                   70 10 0 0 71 2 6 72 0 0 73 2
                                                   6 10 0 0 76 2 6 78 0 0 79 2
                                                   6 0 0 21 80 2 6 0 0 0 81 2 6
                                                   83 0 0 84 3 6 78 0 0 9 86 3
                                                   6 83 0 0 9 88 1 6 10 0 90 2
                                                   6 0 0 0 91 2 9 10 0 0 94 2 6
                                                   0 0 0 95 2 6 0 0 9 96 2 6 10
                                                   0 0 99 2 6 100 0 0 101 2 6 0
                                                   0 0 102 2 9 10 0 0 104 1 6 0
                                                   0 105 2 6 10 0 49 118 2 6 10
                                                   0 0 120 2 6 10 0 0 123 2 7 0
                                                   0 0 126 2 0 7 7 7 127 2 7 53
                                                   0 0 128 2 6 7 7 7 129 2 6 53
                                                   0 7 130 2 0 0 0 7 131 2 6 0
                                                   0 7 132 2 6 53 0 0 133 2 0 0
                                                   0 0 134 2 6 0 0 7 135 2 0 0
                                                   0 0 136 1 6 0 0 137 1 0 0 0
                                                   138 1 0 0 0 139 1 6 0 0 140
                                                   1 6 7 0 141 2 7 10 0 0 142 1
                                                   0 0 0 143 1 6 0 0 144 2 7 0
                                                   0 0 145 2 6 7 7 0 146 2 0 7
                                                   7 0 147 1 6 49 0 148 2 6 0 0
                                                   0 149 1 0 0 0 150 1 6 0 0
                                                   151 1 6 152 0 153 1 0 0 0
                                                   154 1 63 0 0 155 2 6 0 60 9
                                                   156 1 0 0 0 157 1 158 0 7
                                                   159 1 6 158 0 160 1 9 161 0
                                                   162 1 158 0 161 163 2 158 0
                                                   0 21 164 2 158 0 0 0 165 2
                                                   158 0 0 0 166 1 0 158 0 167
                                                   1 0 158 0 168 0 9 21 169 1 9
                                                   0 171 172 1 158 10 0 174 1
                                                   158 7 0 175 1 6 0 7 176 1
                                                   158 177 0 178 2 179 70 161 0
                                                   180 2 158 21 0 161 181 3 158
                                                   0 0 161 21 182 3 158 0 0 161
                                                   21 183 2 158 0 0 0 184 1 185
                                                   10 0 186 1 185 187 0 188 1 7
                                                   0 187 189 1 185 177 0 190 2
                                                   185 21 0 161 191 3 185 0 0
                                                   161 21 192 3 185 0 0 161 21
                                                   193 2 185 0 0 0 194 1 195 10
                                                   0 196 1 195 70 0 197 1 7 0
                                                   70 198 1 195 177 0 199 2 195
                                                   21 0 161 200 3 195 0 0 161
                                                   21 201 3 195 0 0 161 21 202
                                                   2 195 0 0 0 203 1 158 179 0
                                                   204 2 179 10 161 0 205 1 185
                                                   179 0 206 1 195 179 0 207 2
                                                   208 158 209 195 210 2 211
                                                   158 212 185 213 1 6 53 195
                                                   214 1 0 0 195 215 1 6 0 195
                                                   216 1 0 0 195 217 1 6 53 185
                                                   218 1 0 0 185 219 1 6 0 185
                                                   220 1 0 0 185 221 1 187 0 70
                                                   224 1 7 187 0 225 2 222 185
                                                   226 195 227 2 223 185 228
                                                   158 229 1 0 53 195 230 1 0
                                                   53 185 231 1 0 0 158 232 1 0
                                                   53 158 233 1 6 53 158 234 1
                                                   0 0 158 235 1 6 0 158 236 1
                                                   7 70 0 238 2 237 195 239 158
                                                   240 1 6 0 0 241 1 6 242 0
                                                   243 1 6 10 0 244 1 242 0 49
                                                   245 1 161 242 0 246 0 7 0
                                                   247 0 63 0 248 2 242 249 0
                                                   70 250 1 242 0 249 251 2 252
                                                   10 242 0 253 1 0 242 0 254 1
                                                   0 0 0 45 2 0 10 0 0 77 1 0
                                                   53 158 233 1 0 53 195 230 1
                                                   0 53 185 231 1 0 0 158 235 1
                                                   0 0 195 215 1 0 0 185 219 2
                                                   0 0 0 9 43 2 0 10 0 0 115 2
                                                   0 10 0 49 116 1 0 10 0 56 2
                                                   0 109 0 0 110 1 0 0 0 143 1
                                                   0 0 0 139 1 0 0 0 138 3 0 0
                                                   0 0 9 87 2 0 0 0 0 82 3 0 0
                                                   0 0 9 89 2 0 0 0 0 85 2 0 10
                                                   0 49 125 2 0 10 0 0 124 1 0
                                                   9 0 33 2 0 0 0 0 113 1 0 10
                                                   0 55 1 0 21 0 35 1 0 0 0 157
                                                   1 0 0 0 154 1 0 49 0 68 1 0
                                                   0 0 57 1 0 0 0 150 1 0 49 0
                                                   65 1 0 0 0 59 2 0 0 0 9 38 2
                                                   0 100 0 0 114 3 0 83 0 0 9
                                                   112 2 0 83 0 0 111 2 0 78 0
                                                   0 107 3 0 78 0 0 9 108 3 0 0
                                                   0 0 9 97 2 0 0 0 0 92 3 0 0
                                                   0 0 9 98 2 0 0 0 0 93 1 0 49
                                                   0 51 2 0 10 0 49 122 2 0 10
                                                   0 0 121 2 0 0 0 0 106 1 0 0
                                                   0 37 2 0 10 0 0 75 2 0 7 7 7
                                                   127 2 0 10 0 49 119 2 0 10 0
                                                   0 117 2 0 0 0 0 103 1 0 0 0
                                                   40 2 0 7 7 0 147 2 0 0 0 0
                                                   136 2 0 0 0 0 134 2 0 0 0 7
                                                   131 1 0 0 0 48 1 0 0 0 52 1
                                                   0 158 0 167 1 0 242 0 254 1
                                                   0 0 158 232 1 0 0 195 217 1
                                                   0 0 185 221 1 0 158 0 168 1
                                                   0 13 0 30 2 0 72 0 0 74)))))
           '|lookupComplete|)) 
