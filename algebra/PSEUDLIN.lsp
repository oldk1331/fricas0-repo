
(SDEFUN |PSEUDLIN;inv| ((|m| |Matrix| K) ($ |Matrix| K))
        (SPROG ((#1=#:G108 NIL))
               (PROG2 (LETT #1# (SPADCALL |m| (QREFELT $ 9)) |PSEUDLIN;inv|)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0) (|Matrix| (QREFELT $ 6)) #1#)))) 

(SDEFUN |PSEUDLIN;changeBase;2MAMM;2|
        ((M |Matrix| K) (A |Matrix| K) (|sig| |Automorphism| K)
         (|der| |Mapping| K K) ($ |Matrix| K))
        (SPROG NIL
               (SPADCALL (|PSEUDLIN;inv| A $)
                         (SPADCALL
                          (SPADCALL M
                                    (SPADCALL
                                     (CONS #'|PSEUDLIN;changeBase;2MAMM;2!0|
                                           (VECTOR $ |sig|))
                                     A (QREFELT $ 13))
                                    (QREFELT $ 14))
                          (SPADCALL |der| A (QREFELT $ 13)) (QREFELT $ 15))
                         (QREFELT $ 14)))) 

(SDEFUN |PSEUDLIN;changeBase;2MAMM;2!0| ((|k1| NIL) ($$ NIL))
        (PROG (|sig| $)
          (LETT |sig| (QREFELT $$ 1) . #1=(|PSEUDLIN;changeBase;2MAMM;2|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |sig| |k1| (QREFELT $ 11)))))) 

(SDEFUN |PSEUDLIN;normalForm;MAMR;3|
        ((M |Matrix| K) (|sig| |Automorphism| K) (|der| |Mapping| K K)
         ($ |Record| (|:| R (|Matrix| K)) (|:| A (|Matrix| K))
          (|:| |Ainv| (|Matrix| K))))
        (|PSEUDLIN;normalForm0| M |sig| (SPADCALL |sig| (QREFELT $ 17)) |der|
         $)) 

(SDEFUN |PSEUDLIN;companionBlocks;MVL;4|
        ((R |Matrix| K) (|w| |Vector| K)
         ($ |List| (|Record| (|:| C (|Matrix| K)) (|:| |g| (|Vector| K)))))
        (SPROG
         ((|i| #1=(|Integer|))
          (|l| (|List| (|Record| (|:| C (|Matrix| K)) (|:| |g| (|Vector| K)))))
          (|k| NIL) (|v| (|Vector| K)) (#2=#:G145 NIL) (|j| #1#)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |i| 1 . #3=(|PSEUDLIN;companionBlocks;MVL;4|))
              (LETT |n| (ANROWS R) . #3#) (LETT |l| NIL . #3#)
              (SEQ G190
                   (COND ((NULL (SPADCALL |i| |n| (QREFELT $ 22))) (GO G191)))
                   (SEQ (LETT |j| |i| . #3#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((SPADCALL (+ |j| 1) |n| (QREFELT $ 22))
                                  (SPADCALL
                                   (SPADCALL R |j| (+ |j| 1) (QREFELT $ 24))
                                   (|spadConstant| $ 23) (QREFELT $ 25)))
                                 ('T 'NIL)))
                               (GO G191)))
                             (SEQ (EXIT (LETT |j| (+ |j| 1) . #3#))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (LETT |v|
                              (MAKEARR1
                               (PROG1 (LETT #2# (+ (- |j| |i|) 1) . #3#)
                                 (|check_subtype| (>= #2# 0)
                                                  '(|NonNegativeInteger|) #2#))
                               (|spadConstant| $ 26))
                              . #3#)
                        (SEQ (LETT |k| |i| . #3#) G190
                             (COND ((> |k| |j|) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |v| (+ (- |k| |i|) 1)
                                         (SPADCALL |w| |k| (QREFELT $ 28))
                                         (QREFELT $ 29))))
                             (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |l|
                              (CONS
                               (CONS
                                (SPADCALL R |i| |j| |i| |j| (QREFELT $ 30))
                                |v|)
                               |l|)
                              . #3#)
                        (EXIT (LETT |i| (+ |j| 1) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |l|)))) 

(SDEFUN |PSEUDLIN;normalForm0|
        ((M |Matrix| K) (|sig| |Automorphism| K) (|siginv| |Automorphism| K)
         (|der| |Mapping| K K)
         ($ |Record| (|:| R (|Matrix| K)) (|:| A (|Matrix| K))
          (|:| |Ainv| (|Matrix| K))))
        (SPROG
         ((|i| (|Integer|)) (|Binv| (|Matrix| K)) (B (|Matrix| K))
          (E (|Matrix| K)) (#1=#:G184 NIL) (|k| NIL) (#2=#:G185 NIL)
          (|recOfMatrices|
           (|Record| (|:| R (|Matrix| K)) (|:| A (|Matrix| K))
                     (|:| |Ainv| (|Matrix| K))))
          (|j| (|Integer|)) (#3=#:G181 NIL) (#4=#:G182 NIL) (#5=#:G183 NIL)
          (N (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT N (ANROWS M) . #6=(|PSEUDLIN;normalForm0|))
                (LETT B
                      (SPADCALL
                       (PROGN
                        (LETT #5# (GETREFV N) . #6#)
                        (SEQ (LETT |k| 1 . #6#) (LETT #4# 0 . #6#) G190
                             (COND ((|greater_SI| |k| N) (GO G191)))
                             (SEQ
                              (EXIT (SETELT #5# #4# (|spadConstant| $ 23))))
                             (LETT #4#
                                   (PROG1 (|inc_SI| #4#)
                                     (LETT |k| (|inc_SI| |k|) . #6#))
                                   . #6#)
                             (GO G190) G191 (EXIT NIL))
                        #5#)
                       (QREFELT $ 34))
                      . #6#)
                (LETT |Binv| (SPADCALL B (QREFELT $ 35)) . #6#)
                (COND
                 ((SPADCALL M (QREFELT $ 36))
                  (PROGN (LETT #3# (VECTOR M B |Binv|) . #6#) (GO #7=#:G180))))
                (LETT |i| 1 . #6#)
                (SEQ G190 (COND ((NULL (< |i| N)) (GO G191)))
                     (SEQ (LETT |j| (+ |i| 1) . #6#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |j| N (QREFELT $ 22))
                                    (SPADCALL
                                     (SPADCALL M |i| |j| (QREFELT $ 24))
                                     (|spadConstant| $ 26) (QREFELT $ 25)))
                                   ('T 'NIL)))
                                 (GO G191)))
                               (SEQ (EXIT (LETT |j| (+ |j| 1) . #6#))) NIL
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            ((SPADCALL |j| N (QREFELT $ 22))
                             (SEQ
                              (COND
                               ((SPADCALL |j| (+ |i| 1) (QREFELT $ 38))
                                (SEQ
                                 (LETT E
                                       (|PSEUDLIN;permutationMatrix| N
                                        (+ |i| 1) |j| $)
                                       . #6#)
                                 (LETT M
                                       (SPADCALL M E |sig| |der|
                                                 (QREFELT $ 16))
                                       . #6#)
                                 (LETT B (SPADCALL B E (QREFELT $ 14)) . #6#)
                                 (EXIT
                                  (LETT |Binv|
                                        (SPADCALL E |Binv| (QREFELT $ 14))
                                        . #6#)))))
                              (LETT E
                                    (|PSEUDLIN;mulMatrix| N (+ |i| 1)
                                     (SPADCALL |siginv|
                                               (SPADCALL
                                                (SPADCALL M |i| (+ |i| 1)
                                                          (QREFELT $ 24))
                                                (QREFELT $ 39))
                                               (QREFELT $ 11))
                                     $)
                                    . #6#)
                              (LETT M (SPADCALL M E |sig| |der| (QREFELT $ 16))
                                    . #6#)
                              (LETT B (SPADCALL B E (QREFELT $ 14)) . #6#)
                              (LETT |Binv|
                                    (SPADCALL (|PSEUDLIN;inv| E $) |Binv|
                                              (QREFELT $ 14))
                                    . #6#)
                              (SEQ (LETT |j| 1 . #6#) G190
                                   (COND ((|greater_SI| |j| N) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL |j| (+ |i| 1) (QREFELT $ 38))
                                       (SEQ
                                        (LETT E
                                              (|PSEUDLIN;addMatrix| N (+ |i| 1)
                                               |j|
                                               (SPADCALL |siginv|
                                                         (SPADCALL
                                                          (SPADCALL M |i| |j|
                                                                    (QREFELT $
                                                                             24))
                                                          (QREFELT $ 40))
                                                         (QREFELT $ 11))
                                               $)
                                              . #6#)
                                        (LETT M
                                              (SPADCALL M E |sig| |der|
                                                        (QREFELT $ 16))
                                              . #6#)
                                        (LETT B (SPADCALL B E (QREFELT $ 14))
                                              . #6#)
                                        (EXIT
                                         (LETT |Binv|
                                               (SPADCALL (|PSEUDLIN;inv| E $)
                                                         |Binv| (QREFELT $ 14))
                                               . #6#)))))))
                                   (LETT |j| (|inc_SI| |j|) . #6#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT (LETT |i| (+ |i| 1) . #6#))))
                            ('T
                             (SEQ
                              (SEQ (LETT |j| |i| . #6#) G190
                                   (COND ((< |j| 2) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |k| (+ |i| 1) . #6#) G190
                                          (COND ((> |k| N) (GO G191)))
                                          (SEQ
                                           (LETT E
                                                 (|PSEUDLIN;addMatrix| N |k|
                                                  (- |j| 1)
                                                  (SPADCALL M |k| |j|
                                                            (QREFELT $ 24))
                                                  $)
                                                 . #6#)
                                           (LETT M
                                                 (SPADCALL M E |sig| |der|
                                                           (QREFELT $ 16))
                                                 . #6#)
                                           (LETT B
                                                 (SPADCALL B E (QREFELT $ 14))
                                                 . #6#)
                                           (EXIT
                                            (LETT |Binv|
                                                  (SPADCALL
                                                   (|PSEUDLIN;inv| E $) |Binv|
                                                   (QREFELT $ 14))
                                                  . #6#)))
                                          (LETT |k| (+ |k| 1) . #6#) (GO G190)
                                          G191 (EXIT NIL))))
                                   (LETT |j| (+ |j| -1) . #6#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |j| (+ |i| 1) . #6#)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((SPADCALL |j| N (QREFELT $ 22))
                                        (SPADCALL
                                         (SPADCALL M |j| 1 (QREFELT $ 24))
                                         (|spadConstant| $ 26) (QREFELT $ 25)))
                                       ('T 'NIL)))
                                     (GO G191)))
                                   (SEQ (EXIT (LETT |j| (+ |j| 1) . #6#))) NIL
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((SPADCALL |j| N (QREFELT $ 22))
                                 (SEQ
                                  (LETT E
                                        (|PSEUDLIN;permutationMatrix| N 1 |j|
                                         $)
                                        . #6#)
                                  (LETT M
                                        (SPADCALL M E |sig| |der|
                                                  (QREFELT $ 16))
                                        . #6#)
                                  (LETT B (SPADCALL B E (QREFELT $ 14)) . #6#)
                                  (LETT |Binv|
                                        (SPADCALL E |Binv| (QREFELT $ 14))
                                        . #6#)
                                  (EXIT (LETT |i| 1 . #6#))))
                                ('T
                                 (SEQ
                                  (LETT |recOfMatrices|
                                        (SPADCALL
                                         (SPADCALL M (+ |i| 1) N (+ |i| 1) N
                                                   (QREFELT $ 30))
                                         |sig| |der| (QREFELT $ 19))
                                        . #6#)
                                  (SPADCALL M (+ |i| 1) (+ |i| 1)
                                            (QVELT |recOfMatrices| 0)
                                            (QREFELT $ 41))
                                  (LETT E
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# (GETREFV N) . #6#)
                                          (SEQ (LETT |k| 1 . #6#)
                                               (LETT #1# 0 . #6#) G190
                                               (COND
                                                ((|greater_SI| |k| N)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SETELT #2# #1#
                                                         (|spadConstant| $
                                                                         23))))
                                               (LETT #1#
                                                     (PROG1 (|inc_SI| #1#)
                                                       (LETT |k| (|inc_SI| |k|)
                                                             . #6#))
                                                     . #6#)
                                               (GO G190) G191 (EXIT NIL))
                                          #2#)
                                         (QREFELT $ 34))
                                        . #6#)
                                  (SPADCALL E (+ |i| 1) (+ |i| 1)
                                            (QVELT |recOfMatrices| 1)
                                            (QREFELT $ 41))
                                  (LETT B (SPADCALL B E (QREFELT $ 14)) . #6#)
                                  (SPADCALL E (+ |i| 1) (+ |i| 1)
                                            (QVELT |recOfMatrices| 2)
                                            (QREFELT $ 41))
                                  (LETT |Binv|
                                        (SPADCALL E |Binv| (QREFELT $ 14))
                                        . #6#)
                                  (EXIT (LETT |i| N . #6#)))))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (VECTOR M B |Binv|))))
          #7# (EXIT #3#)))) 

(SDEFUN |PSEUDLIN;mulMatrix|
        ((N |Integer|) (|i| |Integer|) (|a| K) ($ |Matrix| K))
        (SPROG ((M (|Matrix| K)) (#1=#:G189 NIL) (|j| NIL) (#2=#:G190 NIL))
               (SEQ
                (LETT M
                      (SPADCALL
                       (PROGN
                        (LETT #2# (GETREFV N) . #3=(|PSEUDLIN;mulMatrix|))
                        (SEQ (LETT |j| 1 . #3#) (LETT #1# 0 . #3#) G190
                             (COND ((|greater_SI| |j| N) (GO G191)))
                             (SEQ
                              (EXIT (SETELT #2# #1# (|spadConstant| $ 23))))
                             (LETT #1#
                                   (PROG1 (|inc_SI| #1#)
                                     (LETT |j| (|inc_SI| |j|) . #3#))
                                   . #3#)
                             (GO G190) G191 (EXIT NIL))
                        #2#)
                       (QREFELT $ 34))
                      . #3#)
                (SPADCALL M |i| |i| |a| (QREFELT $ 42)) (EXIT M)))) 

(SDEFUN |PSEUDLIN;addMatrix|
        ((N |Integer|) (|i| |Integer|) (|k| |Integer|) (|a| K) ($ |Matrix| K))
        (SPROG ((A (|Matrix| K)) (#1=#:G194 NIL) (|j| NIL) (#2=#:G195 NIL))
               (SEQ
                (LETT A
                      (SPADCALL
                       (PROGN
                        (LETT #2# (GETREFV N) . #3=(|PSEUDLIN;addMatrix|))
                        (SEQ (LETT |j| 1 . #3#) (LETT #1# 0 . #3#) G190
                             (COND ((|greater_SI| |j| N) (GO G191)))
                             (SEQ
                              (EXIT (SETELT #2# #1# (|spadConstant| $ 23))))
                             (LETT #1#
                                   (PROG1 (|inc_SI| #1#)
                                     (LETT |j| (|inc_SI| |j|) . #3#))
                                   . #3#)
                             (GO G190) G191 (EXIT NIL))
                        #2#)
                       (QREFELT $ 34))
                      . #3#)
                (SPADCALL A |i| |k| |a| (QREFELT $ 42)) (EXIT A)))) 

(SDEFUN |PSEUDLIN;permutationMatrix|
        ((N |Integer|) (|i| |Integer|) (|k| |Integer|) ($ |Matrix| K))
        (SPROG ((P (|Matrix| K)) (#1=#:G199 NIL) (|j| NIL) (#2=#:G200 NIL))
               (SEQ
                (LETT P
                      (SPADCALL
                       (PROGN
                        (LETT #2# (GETREFV N)
                              . #3=(|PSEUDLIN;permutationMatrix|))
                        (SEQ (LETT |j| 1 . #3#) (LETT #1# 0 . #3#) G190
                             (COND ((|greater_SI| |j| N) (GO G191)))
                             (SEQ
                              (EXIT (SETELT #2# #1# (|spadConstant| $ 23))))
                             (LETT #1#
                                   (PROG1 (|inc_SI| #1#)
                                     (LETT |j| (|inc_SI| |j|) . #3#))
                                   . #3#)
                             (GO G190) G191 (EXIT NIL))
                        #2#)
                       (QREFELT $ 34))
                      . #3#)
                (SPADCALL P |i| |i|
                          (SPADCALL P |k| |k| (|spadConstant| $ 26)
                                    (QREFELT $ 42))
                          (QREFELT $ 42))
                (SPADCALL P |i| |k|
                          (SPADCALL P |k| |i| (|spadConstant| $ 23)
                                    (QREFELT $ 42))
                          (QREFELT $ 42))
                (EXIT P)))) 

(DECLAIM (NOTINLINE |PseudoLinearNormalForm;|)) 

(DEFUN |PseudoLinearNormalForm| (#1=#:G201)
  (SPROG NIL
         (PROG (#2=#:G202)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PseudoLinearNormalForm|)
                                               '|domainEqualList|)
                    . #3=(|PseudoLinearNormalForm|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PseudoLinearNormalForm;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PseudoLinearNormalForm|)))))))))) 

(DEFUN |PseudoLinearNormalForm;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PseudoLinearNormalForm|))
          (LETT |dv$| (LIST '|PseudoLinearNormalForm| DV$1) . #1#)
          (LETT $ (GETREFV 43) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PseudoLinearNormalForm| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PseudoLinearNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Union| $ '"failed")
              (|Matrix| 6) (0 . |inverse|) (|Automorphism| 6) (5 . |elt|)
              (|Mapping| 6 6) (11 . |map|) (17 . *) (23 . +)
              |PSEUDLIN;changeBase;2MAMM;2| (29 . |inv|)
              (|Record| (|:| R 8) (|:| A 8) (|:| |Ainv| 8))
              |PSEUDLIN;normalForm;MAMR;3| (|Boolean|) (|Integer|) (34 . <=)
              (40 . |One|) (44 . |elt|) (51 . =) (57 . |Zero|) (|Vector| 6)
              (61 . |elt|) (67 . |setelt|) (74 . |subMatrix|)
              (|Record| (|:| C 8) (|:| |g| 27)) (|List| 31)
              |PSEUDLIN;companionBlocks;MVL;4| (83 . |diagonalMatrix|)
              (88 . |copy|) (93 . |diagonal?|) (98 . |One|) (102 . ~=)
              (108 . |inv|) (113 . -) (118 . |setsubMatrix!|) (126 . |setelt|))
           '#(|normalForm| 134 |companionBlocks| 141 |changeBase| 147) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 42
                                                 '(1 8 7 0 9 2 10 6 0 6 11 2 8
                                                   0 12 0 13 2 8 0 0 0 14 2 8 0
                                                   0 0 15 1 10 0 0 17 2 21 20 0
                                                   0 22 0 6 0 23 3 8 6 0 21 21
                                                   24 2 6 20 0 0 25 0 6 0 26 2
                                                   27 6 0 21 28 3 27 6 0 21 6
                                                   29 5 8 0 0 21 21 21 21 30 1
                                                   8 0 27 34 1 8 0 0 35 1 8 20
                                                   0 36 0 10 0 37 2 21 20 0 0
                                                   38 1 6 0 0 39 1 6 0 0 40 4 8
                                                   0 0 21 21 0 41 4 8 6 0 21 21
                                                   6 42 3 0 18 8 10 12 19 2 0
                                                   32 8 27 33 4 0 8 8 8 10 12
                                                   16)))))
           '|lookupComplete|)) 
