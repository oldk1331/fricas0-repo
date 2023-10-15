
(SDEFUN |PRS;*;R2V;1| ((|r| R) (|v| |Vector| |polR|) ($ |Vector| |polR|))
        (SPADCALL (SPADCALL |r| (QREFELT $ 12)) |v| (QREFELT $ 14))) 

(SDEFUN |PRS;exquo;VRV;2| ((|v| |Vector| |polR|) (|r| R) ($ |Vector| |polR|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|PRS;exquo;VRV;2!0| (VECTOR (QREFELT $ 7) $ |r|)) |v|
                (QREFELT $ 19)))) 

(SDEFUN |PRS;exquo;VRV;2!0| ((|p1| NIL) ($$ NIL))
        (PROG (|r| $ |polR|)
          (LETT |r| (QREFELT $$ 2) . #1=(|PRS;exquo;VRV;2|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |polR| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G277 NIL))
                   (PROG2 (LETT #2# (SPADCALL |p1| |r| (QREFELT $ 17)) NIL)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) |polR|
                                     (|Union| |polR| "failed") #2#))))))) 

(SDEFUN |PRS;divide;2polRR;3|
        ((F |polR|) (G |polR|)
         ($ |Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
        (SPROG
         ((#1=#:G296 NIL) (|quot| (|polR|)) (|mon| (|polR|)) (#2=#:G289 NIL)
          (#3=#:G287 NIL) (|delta| (|Integer|)) (#4=#:G283 NIL)
          (|degG| (|NonNegativeInteger|)) (|lcG| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lcG| (SPADCALL G (QREFELT $ 21))
                  . #5=(|PRS;divide;2polRR;3|))
            (LETT |degG| (SPADCALL G (QREFELT $ 22)) . #5#)
            (EXIT
             (COND
              ((ZEROP |degG|)
               (SEQ
                (LETT F
                      (PROG2 (LETT #4# (SPADCALL F |lcG| (QREFELT $ 17)) . #5#)
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #4#))
                      . #5#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS F (|spadConstant| $ 24)) . #5#)
                  (GO #6=#:G295)))))
              ('T
               (SEQ (LETT G (SPADCALL G (QREFELT $ 25)) . #5#)
                    (LETT |quot| (|spadConstant| $ 24) . #5#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (>=
                             (LETT |delta|
                                   (- (SPADCALL F (QREFELT $ 22)) |degG|)
                                   . #5#)
                             0))
                           (GO G191)))
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL F (QREFELT $ 21)) |lcG|
                                            (QREFELT $ 26))
                                           . #5#)
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0) (QREFELT $ 6)
                                                   (|Union| (QREFELT $ 6)
                                                            "failed")
                                                   #3#))
                                 (PROG1 (LETT #2# |delta| . #5#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 10))
                                . #5#)
                          (LETT |quot| (SPADCALL |quot| |mon| (QREFELT $ 27))
                                . #5#)
                          (EXIT
                           (LETT F
                                 (SPADCALL (SPADCALL F (QREFELT $ 25))
                                           (SPADCALL |mon| G (QREFELT $ 28))
                                           (QREFELT $ 29))
                                 . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS |quot| F) . #5#) (GO #6#)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |PRS;resultant_naif;2polRR;4| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|#G19| (|polR|)) (|#G18| (|polR|)) (|a| (R)) (#1=#:G301 NIL)
          (U (|polR|)) (#2=#:G308 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G17| #3#) (|#G16| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #4=(|PRS;resultant_naif;2polRR;4|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #2# (|spadConstant| $ 23) . #4#)
                       (GO #5=#:G307)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G16| (SPADCALL P (QREFELT $ 22)) . #4#)
                        (LETT |#G17| (SPADCALL Q (QREFELT $ 22)) . #4#)
                        (LETT |degP| |#G16| . #4#)
                        (LETT |degQ| |#G17| . #4#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 34)) . #4#)))))
                       (EXIT
                        (COND
                         ((ZEROP |degQ|)
                          (PROGN
                           (LETT #2#
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT $ 21)) |degP|
                                            (QREFELT $ 35))
                                           (QREFELT $ 36))
                                 . #4#)
                           (GO #5#)))
                         ('T
                          (SEQ
                           (LETT U (QCDR (SPADCALL P Q (QREFELT $ 31))) . #4#)
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT $ 21))
                                            (PROG1
                                                (LETT #1#
                                                      (- |degP|
                                                         (SPADCALL U
                                                                   (QREFELT $
                                                                            22)))
                                                      . #4#)
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 35))
                                           (QREFELT $ 36))
                                 . #4#)
                           (EXIT
                            (PROGN
                             (LETT |#G18| Q . #4#)
                             (LETT |#G19| U . #4#)
                             (LETT P |#G18| . #4#)
                             (LETT Q |#G19| . #4#))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean_naif;2polRR;5|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|cf1| (|polR|)) (|old_cf2| (|polR|))
          (|old_cf1| (|polR|)) (|#G29| (|polR|)) (|#G28| (|polR|))
          (|#G27| (|polR|)) (|#G26| (|polR|)) (|#G25| (|polR|))
          (|#G24| (|polR|)) (|a| (R)) (#1=#:G318 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G325 NIL) (#3=#:G313 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G23| #4#) (|#G22| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;resultantEuclidean_naif;2polRR;5|))
            (LETT |old_cf1| (|spadConstant| $ 38) . #5#)
            (LETT |cf1| (|spadConstant| $ 24) . #5#)
            (LETT |old_cf2| (|spadConstant| $ 24) . #5#)
            (LETT |cf2| (|spadConstant| $ 38) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (|spadConstant| $ 24)
                                     (|spadConstant| $ 23))
                             . #5#)
                       (GO #6=#:G324)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G22| (SPADCALL P (QREFELT $ 22)) . #5#)
                        (LETT |#G23| (SPADCALL Q (QREFELT $ 22)) . #5#)
                        (LETT |degP| |#G22| . #5#)
                        (LETT |degQ| |#G23| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 34)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                                    (QREFELT $ 35))
                                          (QREFELT $ 36))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (VECTOR (SPADCALL |a| |cf1| (QREFELT $ 39))
                                          (SPADCALL |a| |cf2| (QREFELT $ 39))
                                          (SPADCALL |a|
                                                    (SPADCALL Q (QREFELT $ 21))
                                                    (QREFELT $ 36)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 31)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 22)))
                                                           . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 35))
                                       (QREFELT $ 36))
                             . #5#)
                       (PROGN
                        (LETT |#G24| Q . #5#)
                        (LETT |#G25| (QCDR |divid|) . #5#)
                        (LETT P |#G24| . #5#)
                        (LETT Q |#G25| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G26| |cf1| . #5#)
                         (LETT |#G27| |cf2| . #5#)
                         (LETT |#G28|
                               (SPADCALL |old_cf1|
                                         (SPADCALL (QCAR |divid|) |cf1|
                                                   (QREFELT $ 28))
                                         (QREFELT $ 29))
                               . #5#)
                         (LETT |#G29|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 28))
                                         (QREFELT $ 29))
                               . #5#)
                         (LETT |old_cf1| |#G26| . #5#)
                         (LETT |old_cf2| |#G27| . #5#)
                         (LETT |cf1| |#G28| . #5#)
                         (LETT |cf2| |#G29| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean_naif;2polRR;6|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|old_cf2| (|polR|)) (|#G37| (|polR|))
          (|#G36| (|polR|)) (|#G35| (|polR|)) (|#G34| (|polR|)) (|a| (R))
          (#1=#:G335 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G342 NIL) (#3=#:G330 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G33| #4#) (|#G32| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;semiResultantEuclidean_naif;2polRR;6|))
            (LETT |old_cf2| (|spadConstant| $ 24) . #5#)
            (LETT |cf2| (|spadConstant| $ 38) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 24) (|spadConstant| $ 23))
                             . #5#)
                       (GO #6=#:G341)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G32| (SPADCALL P (QREFELT $ 22)) . #5#)
                        (LETT |#G33| (SPADCALL Q (QREFELT $ 22)) . #5#)
                        (LETT |degP| |#G32| . #5#)
                        (LETT |degQ| |#G33| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 34)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                                    (QREFELT $ 35))
                                          (QREFELT $ 36))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (CONS (SPADCALL |a| |cf2| (QREFELT $ 39))
                                        (SPADCALL |a|
                                                  (SPADCALL Q (QREFELT $ 21))
                                                  (QREFELT $ 36)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 31)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 22)))
                                                           . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 35))
                                       (QREFELT $ 36))
                             . #5#)
                       (PROGN
                        (LETT |#G34| Q . #5#)
                        (LETT |#G35| (QCDR |divid|) . #5#)
                        (LETT P |#G34| . #5#)
                        (LETT Q |#G35| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G36| |cf2| . #5#)
                         (LETT |#G37|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 28))
                                         (QREFELT $ 29))
                               . #5#)
                         (LETT |old_cf2| |#G36| . #5#)
                         (LETT |cf2| |#G37| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;Lazard;2RNniR;7|
        ((|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG
         ((#1=#:G348 NIL) (|c| (R)) (#2=#:G346 NIL)
          (|a| (|NonNegativeInteger|)) (#3=#:G355 NIL) (#4=#:G344 NIL)
          (|b| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|error| "Lazard$PRS : n = 0")) ((EQL |n| 1) |x|)
                 ('T
                  (SEQ (LETT |a| 1 . #5=(|PRS;Lazard;2RNniR;7|))
                       (SEQ G190
                            (COND
                             ((NULL
                               (>= |n|
                                   (LETT |b| (SPADCALL 2 |a| (QREFELT $ 45))
                                         . #5#)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |a| |b| . #5#))) NIL (GO G190)
                            G191 (EXIT NIL))
                       (LETT |c| |x| . #5#)
                       (LETT |n|
                             (PROG1 (LETT #4# (- |n| |a|) . #5#)
                               (|check_subtype2| (>= #4# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #4#))
                             . #5#)
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL |a| 1)
                                 (PROGN (LETT #3# |c| . #5#) (GO #6=#:G354)))
                                ('T
                                 (SEQ (LETT |a| (QUOTIENT2 |a| 2) . #5#)
                                      (LETT |c|
                                            (PROG2
                                                (LETT #2#
                                                      (SPADCALL
                                                       (SPADCALL |c| |c|
                                                                 (QREFELT $
                                                                          36))
                                                       |y| (QREFELT $ 26))
                                                      . #5#)
                                                (QCDR #2#)
                                              (|check_union2| (QEQCAR #2# 0)
                                                              (QREFELT $ 6)
                                                              (|Union|
                                                               (QREFELT $ 6)
                                                               #7="failed")
                                                              #2#))
                                            . #5#)
                                      (EXIT
                                       (COND
                                        ((>= |n| |a|)
                                         (SEQ
                                          (LETT |c|
                                                (PROG2
                                                    (LETT #2#
                                                          (SPADCALL
                                                           (SPADCALL |c| |x|
                                                                     (QREFELT $
                                                                              36))
                                                           |y| (QREFELT $ 26))
                                                          . #5#)
                                                    (QCDR #2#)
                                                  (|check_union2|
                                                   (QEQCAR #2# 0) (QREFELT $ 6)
                                                   (|Union| (QREFELT $ 6) #7#)
                                                   #2#))
                                                . #5#)
                                          (EXIT
                                           (LETT |n|
                                                 (PROG1
                                                     (LETT #1# (- |n| |a|)
                                                           . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 . #5#)))))))))))
                             NIL (GO G190) G191 (EXIT NIL)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PRS;Lazard2;polR2RNnipolR;8|
        ((F |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ |polR|))
        (SPROG ((#1=#:G363 NIL) (#2=#:G358 NIL) (#3=#:G356 NIL))
               (SEQ
                (EXIT
                 (COND ((ZEROP |n|) (|error| "Lazard2$PRS : n = 0"))
                       ((EQL |n| 1) F)
                       ('T
                        (SEQ
                         (LETT |x|
                               (SPADCALL |x| |y|
                                         (PROG1
                                             (LETT #3# (- |n| 1)
                                                   . #4=(|PRS;Lazard2;polR2RNnipolR;8|))
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT $ 46))
                               . #4#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL
                                            (SPADCALL |x| F (QREFELT $ 39)) |y|
                                            (QREFELT $ 17))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            "failed")
                                                   #2#))
                                 . #4#)
                           (GO #5=#:G362)))))))
                #5# (EXIT #1#)))) 

(SDEFUN |PRS;Lazard3|
        ((V |Vector| |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|)
         ($ |Vector| |polR|))
        (SPROG ((#1=#:G368 NIL) (#2=#:G364 NIL))
               (SEQ
                (EXIT
                 (COND ((ZEROP |n|) (|error| "Lazard3$prs : n = 0"))
                       ((EQL |n| 1) V)
                       ('T
                        (SEQ
                         (LETT |x|
                               (SPADCALL |x| |y|
                                         (PROG1
                                             (LETT #2# (- |n| 1)
                                                   . #3=(|PRS;Lazard3|))
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 46))
                               . #3#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (SPADCALL |x| V (QREFELT $ 15)) |y|
                                           (QREFELT $ 20))
                                 . #3#)
                           (GO #4=#:G367)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PRS;next_sousResultant2;3polRRpolR;10|
        ((P |polR|) (Q |polR|) (Z |polR|) (|s| R) ($ |polR|))
        (SPROG
         ((#1=#:G380 NIL) (A (|polR|)) (#2=#:G370 NIL) (H (|polR|))
          (#3=#:G381 NIL) (|i| NIL) (|#G62| (|polR|)) (|#G61| (|polR|))
          (|#G60| (|polR|)) (|e| #4=(|NonNegativeInteger|)) (|d| #4#)
          (|#G59| #4#) (|#G58| #4#) (|se| (R)) (|c| (R)) (|lcP| (R))
          (|#G57| (R)) (|#G56| (R)) (|#G55| (R)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G55| (SPADCALL P (QREFELT $ 21))
                   . #5=(|PRS;next_sousResultant2;3polRRpolR;10|))
             (LETT |#G56| (SPADCALL Q (QREFELT $ 21)) . #5#)
             (LETT |#G57| (SPADCALL Z (QREFELT $ 21)) . #5#)
             (LETT |lcP| |#G55| . #5#)
             (LETT |c| |#G56| . #5#)
             (LETT |se| |#G57| . #5#))
            (PROGN
             (LETT |#G58| (SPADCALL P (QREFELT $ 22)) . #5#)
             (LETT |#G59| (SPADCALL Q (QREFELT $ 22)) . #5#)
             (LETT |d| |#G58| . #5#)
             (LETT |e| |#G59| . #5#))
            (PROGN
             (LETT |#G60| (SPADCALL P (QREFELT $ 25)) . #5#)
             (LETT |#G61| (SPADCALL Q (QREFELT $ 25)) . #5#)
             (LETT |#G62| (SPADCALL (SPADCALL Z (QREFELT $ 25)) (QREFELT $ 48))
                   . #5#)
             (LETT P |#G60| . #5#)
             (LETT Q |#G61| . #5#)
             (LETT H |#G62| . #5#))
            (LETT A (SPADCALL (SPADCALL P |e| (QREFELT $ 49)) H (QREFELT $ 39))
                  . #5#)
            (SEQ (LETT |i| (+ |e| 1) . #5#) (LETT #3# (- |d| 1) . #5#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (LETT H
                        (COND
                         ((EQL (SPADCALL H (QREFELT $ 22)) (- |e| 1))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 11) (SPADCALL H (QREFELT $ 25))
                                     (QREFELT $ 28))
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL H (QREFELT $ 21)) Q
                                                (QREFELT $ 39))
                                      |c| (QREFELT $ 17))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7)
                                                      #6="failed")
                                             #2#))
                           (QREFELT $ 29)))
                         ('T (SPADCALL (QREFELT $ 11) H (QREFELT $ 28))))
                        . #5#)
                  (EXIT
                   (LETT A
                         (SPADCALL
                          (SPADCALL (SPADCALL P |i| (QREFELT $ 49)) H
                                    (QREFELT $ 39))
                          A (QREFELT $ 27))
                         . #5#)))
                 (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (SEQ G190
                 (COND ((NULL (>= (SPADCALL P (QREFELT $ 22)) |e|)) (GO G191)))
                 (SEQ (EXIT (LETT P (SPADCALL P (QREFELT $ 25)) . #5#))) NIL
                 (GO G190) G191 (EXIT NIL))
            (LETT A
                  (SPADCALL A (SPADCALL |se| P (QREFELT $ 39)) (QREFELT $ 27))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |lcP| (QREFELT $ 17)) . #5#)
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) #6#) #2#))
                  . #5#)
            (LETT A
                  (COND
                   ((EQL (SPADCALL H (QREFELT $ 22)) (- |e| 1))
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (QREFELT $ 11)
                                          (SPADCALL H (QREFELT $ 25))
                                          (QREFELT $ 28))
                                A (QREFELT $ 27))
                               (QREFELT $ 39))
                     (SPADCALL (SPADCALL H (QREFELT $ 21)) Q (QREFELT $ 39))
                     (QREFELT $ 29)))
                   (#7='T
                    (SPADCALL |c|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 11) H (QREFELT $ 28)) A
                               (QREFELT $ 27))
                              (QREFELT $ 39))))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |s| (QREFELT $ 17)) . #5#)
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) #6#) #2#))
                  . #5#)
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP (- |d| |e|)) A)
                          (#7# (SPADCALL A (QREFELT $ 48))))
                    . #5#)
              (GO #8=#:G379)))))
          #8# (EXIT #1#)))) 

(SDEFUN |PRS;next_sousResultant3|
        ((VP |Vector| |polR|) (VQ |Vector| |polR|) (|s| R) (|ss| R)
         ($ |Vector| |polR|))
        (SPROG
         ((#1=#:G395 NIL) (#2=#:G386 NIL) (#3=#:G396 NIL) (|i| NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (|rr| (R)) (|r| (R)) (|#G73| (R)) (|#G72| (R)) (#4=#:G382 NIL)
          (|delta| (|Integer|)) (|e| (|NonNegativeInteger|)) (|c| (R))
          (|lcP| (R)) (|#G71| (R)) (|#G70| (R)) (Q (|polR|)) (P (|polR|))
          (|#G69| (|polR|)) (|#G68| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G68| (SPADCALL VP 1 (QREFELT $ 52))
                   . #5=(|PRS;next_sousResultant3|))
             (LETT |#G69| (SPADCALL VQ 1 (QREFELT $ 52)) . #5#)
             (LETT P |#G68| . #5#)
             (LETT Q |#G69| . #5#))
            (PROGN
             (LETT |#G70| (SPADCALL P (QREFELT $ 21)) . #5#)
             (LETT |#G71| (SPADCALL Q (QREFELT $ 21)) . #5#)
             (LETT |lcP| |#G70| . #5#)
             (LETT |c| |#G71| . #5#))
            (LETT |e| (SPADCALL Q (QREFELT $ 22)) . #5#)
            (SEQ (LETT |delta| (- (SPADCALL P (QREFELT $ 22)) |e|) . #5#)
                 (EXIT
                  (COND
                   ((EQL |delta| 1)
                    (SEQ
                     (LETT VP
                           (SPADCALL (SPADCALL |c| VP (QREFELT $ 15))
                                     (SPADCALL (SPADCALL P |e| (QREFELT $ 49))
                                               VQ (QREFELT $ 15))
                                     (QREFELT $ 53))
                           . #5#)
                     (LETT VP (SPADCALL VP |lcP| (QREFELT $ 20)) . #5#)
                     (LETT VP
                           (SPADCALL
                            (SPADCALL |c|
                                      (SPADCALL VP
                                                (SPADCALL (QREFELT $ 11) VQ
                                                          (QREFELT $ 14))
                                                (QREFELT $ 53))
                                      (QREFELT $ 15))
                            (SPADCALL
                             (SPADCALL Q
                                       (PROG1 (LETT #4# (- |e| 1) . #5#)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       (QREFELT $ 49))
                             VQ (QREFELT $ 15))
                            (QREFELT $ 54))
                           . #5#)
                     (EXIT (LETT VP (SPADCALL VP |s| (QREFELT $ 20)) . #5#))))
                   (#6='T
                    (SEQ
                     (PROGN
                      (LETT |#G72| (SPADCALL |s| |lcP| (QREFELT $ 36)) . #5#)
                      (LETT |#G73| (SPADCALL |ss| |c| (QREFELT $ 36)) . #5#)
                      (LETT |r| |#G72| . #5#)
                      (LETT |rr| |#G73| . #5#))
                     (LETT |divid|
                           (SPADCALL (SPADCALL |rr| P (QREFELT $ 39)) Q
                                     (QREFELT $ 31))
                           . #5#)
                     (SPADCALL VP 1
                               (PROG2
                                   (LETT #2#
                                         (SPADCALL (QCDR |divid|) |r|
                                                   (QREFELT $ 17))
                                         . #5#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7)
                                                          #7="failed")
                                                 #2#))
                               (QREFELT $ 55))
                     (EXIT
                      (SEQ (LETT |i| 2 . #5#) (LETT #3# (QVSIZE VP) . #5#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (SPADCALL VP |i|
                                      (SPADCALL
                                       (SPADCALL |rr|
                                                 (SPADCALL VP |i|
                                                           (QREFELT $ 52))
                                                 (QREFELT $ 39))
                                       (SPADCALL
                                        (SPADCALL VQ |i| (QREFELT $ 52))
                                        (QCAR |divid|) (QREFELT $ 28))
                                       (QREFELT $ 29))
                                      (QREFELT $ 55))
                            (EXIT
                             (SPADCALL VP |i|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL VP |i|
                                                            (QREFELT $ 52))
                                                  |r| (QREFELT $ 17))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #7#)
                                                         #2#))
                                       (QREFELT $ 55))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))))))))
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP |delta|) VP)
                          (#6# (SPADCALL VP (QREFELT $ 56))))
                    . #5#)
              (GO #8=#:G394)))))
          #8# (EXIT #1#)))) 

(SDEFUN |PRS;algo_new| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|s| (R)) (|#G80| (|polR|)) (|#G79| (|polR|)) (#1=#:G405 NIL)
          (Z (|polR|)) (|delta| (|NonNegativeInteger|)) (#2=#:G398 NIL)
          (|#G78| (|polR|)) (|#G77| (|polR|)) (#3=#:G397 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |delta|
                  (PROG1
                      (LETT #3#
                            (- (SPADCALL P (QREFELT $ 22))
                               (SPADCALL Q (QREFELT $ 22)))
                            . #4=(|PRS;algo_new|))
                    (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #3#))
                  . #4#)
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 21)) |delta| (QREFELT $ 35))
                  . #4#)
            (PROGN
             (LETT |#G77| Q . #4#)
             (LETT |#G78|
                   (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 57))
                   . #4#)
             (LETT P |#G77| . #4#)
             (LETT Q |#G78| . #4#))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #1# (|spadConstant| $ 23) . #4#)
                       (GO #5=#:G404)))
                     ('T
                      (SEQ
                       (LETT |delta|
                             (PROG1
                                 (LETT #2#
                                       (- (SPADCALL P (QREFELT $ 22))
                                          (SPADCALL Q (QREFELT $ 22)))
                                       . #4#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             . #4#)
                       (LETT Z
                             (SPADCALL Q (SPADCALL Q (QREFELT $ 21)) |s|
                                       |delta| (QREFELT $ 47))
                             . #4#)
                       (EXIT
                        (COND
                         ((ZEROP (SPADCALL Z (QREFELT $ 22)))
                          (PROGN
                           (LETT #1# (SPADCALL Z (QREFELT $ 21)) . #4#)
                           (GO #5#)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G79| Q . #4#)
                            (LETT |#G80| (SPADCALL P Q Z |s| (QREFELT $ 50))
                                  . #4#)
                            (LETT P |#G79| . #4#)
                            (LETT Q |#G80| . #4#))
                           (EXIT
                            (LETT |s| (SPADCALL Z (QREFELT $ 21))
                                  . #4#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;resultant;2polRR;13| ((P |polR|) (Q |polR|) ($ R))
        (SPROG ((#1=#:G413 NIL) (|#G84| (|polR|)) (|#G83| (|polR|)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
                   (|spadConstant| $ 23))
                  ('T
                   (SEQ
                    (COND
                     ((< (SPADCALL P (QREFELT $ 22))
                         (SPADCALL Q (QREFELT $ 22)))
                      (SEQ
                       (PROGN
                        (LETT |#G83| Q . #2=(|PRS;resultant;2polRR;13|))
                        (LETT |#G84| P . #2#)
                        (LETT P |#G83| . #2#)
                        (LETT Q |#G84| . #2#))
                       (EXIT
                        (COND
                         ((ODDP (SPADCALL P (QREFELT $ 22)))
                          (COND
                           ((ODDP (SPADCALL Q (QREFELT $ 22)))
                            (LETT Q (SPADCALL Q (QREFELT $ 48)) . #2#)))))))))
                    (EXIT
                     (COND
                      ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                       (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                 (SPADCALL P (QREFELT $ 22)) (QREFELT $ 35)))
                      ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                       (SPADCALL P Q (QREFELT $ 37)))
                      ('T
                       (PROGN
                        (LETT #1# (|PRS;algo_new| P Q $) . #2#)
                        (GO #3=#:G412)))))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PRS;subResultantEuclidean|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G90| (|Vector| |polR|)) (|#G89| #1#) (|ss| (R)) (#2=#:G426 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G418 NIL) (|e| (|NonNegativeInteger|)) (|#G88| (|polR|))
          (|#G87| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G416 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 21))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 22))
                                         (SPADCALL Q (QREFELT $ 22)))
                                      . #5=(|PRS;subResultantEuclidean|))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            (QREFELT $ 35))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 38))
                  . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                  . #5#)
            (LETT VQ
                  (VECTOR (QVELT |pdiv| 2)
                          (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                          (QVELT |pdiv| 1))
                  . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G87| (SPADCALL VP 1 (QREFELT $ 52)) . #5#)
                    (LETT |#G88| (SPADCALL VQ 1 (QREFELT $ 52)) . #5#)
                    (LETT P |#G87| . #5#)
                    (LETT Q |#G88| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (|spadConstant| $ 24)
                                     (|spadConstant| $ 23))
                             . #5#)
                       (GO #6=#:G425)))
                     ('T
                      (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 22)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 22)) |e|)
                                           . #5#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 . #5#)
                           (COND
                            ((ZEROP |e|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT $ 21)) |s| |delta| $)
                                    . #5#)
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (VECTOR (SPADCALL |l| 2 (QREFELT $ 52))
                                              (SPADCALL |l| 3 (QREFELT $ 52))
                                              (SPADCALL
                                               (SPADCALL |l| 1 (QREFELT $ 52))
                                               (QREFELT $ 21)))
                                      . #5#)
                                (GO #6#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 21)) |s|
                                           |delta| (QREFELT $ 46))
                                 . #5#)
                           (PROGN
                            (LETT |#G89| VQ . #5#)
                            (LETT |#G90|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #5#)
                            (LETT VP |#G89| . #5#)
                            (LETT VQ |#G90| . #5#))
                           (EXIT (LETT |s| |ss| . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;15|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((#1=#:G440 NIL) (|s| (R)) (#2=#:G434 NIL)
          (|degP| (|NonNegativeInteger|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|e| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL P (QREFELT $ 33)) (SPADCALL Q (QREFELT $ 33)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 23)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (SPADCALL P (QREFELT $ 22)))
                         (COND ((ODDP (SPADCALL Q (QREFELT $ 22))) -1)
                               (#3='T 1)))
                        (#3# 1))
                       . #4=(|PRS;resultantEuclidean;2polRR;15|))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 61))
                                 (QREFELT $ 62))
                       . #4#)
                 (EXIT
                  (PROGN
                   (LETT #1#
                         (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 61))
                                 (QVELT |l| 0) (QVELT |l| 2))
                         . #4#)
                   (GO #5=#:G439))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 22)) . #4#)
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "resultantEuclidean$PRS : constant polynomials"))
                       (#3#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                         (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 35))
                               . #4#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (VECTOR (|spadConstant| $ 24)
                                         (SPADCALL |s| (QREFELT $ 12))
                                         (SPADCALL |s|
                                                   (SPADCALL Q (QREFELT $ 21))
                                                   (QREFELT $ 36)))
                                 . #4#)
                           (GO #5#))))))))))
              (EXIT
               (COND
                ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                 (SPADCALL P Q (QREFELT $ 41)))
                (#3#
                 (PROGN
                  (LETT #1# (|PRS;subResultantEuclidean| P Q $) . #4#)
                  (GO #5#)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;semiSubResultantEuclidean|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G98| (|Vector| |polR|)) (|#G97| #1#) (|ss| (R)) (#2=#:G453 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G445 NIL) (|e| (|NonNegativeInteger|)) (|#G96| (|polR|))
          (|#G95| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G443 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 21))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 22))
                                         (SPADCALL Q (QREFELT $ 22)))
                                      . #5=(|PRS;semiSubResultantEuclidean|))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            (QREFELT $ 35))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 38)) . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                  . #5#)
            (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G95| (SPADCALL VP 1 (QREFELT $ 52)) . #5#)
                    (LETT |#G96| (SPADCALL VQ 1 (QREFELT $ 52)) . #5#)
                    (LETT P |#G95| . #5#)
                    (LETT Q |#G96| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 24) (|spadConstant| $ 23))
                             . #5#)
                       (GO #6=#:G452)))
                     ('T
                      (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 22)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 22)) |e|)
                                           . #5#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 . #5#)
                           (COND
                            ((ZEROP |e|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT $ 21)) |s| |delta| $)
                                    . #5#)
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (CONS (SPADCALL |l| 2 (QREFELT $ 52))
                                            (SPADCALL
                                             (SPADCALL |l| 1 (QREFELT $ 52))
                                             (QREFELT $ 21)))
                                      . #5#)
                                (GO #6#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 21)) |s|
                                           |delta| (QREFELT $ 46))
                                 . #5#)
                           (PROGN
                            (LETT |#G97| VQ . #5#)
                            (LETT |#G98|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #5#)
                            (LETT VP |#G97| . #5#)
                            (LETT VQ |#G98| . #5#))
                           (EXIT (LETT |s| |ss| . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;17|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((#1=#:G464 NIL) (|s| (R)) (#2=#:G457 NIL)
          (|degP| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL P (QREFELT $ 33)) (SPADCALL Q (QREFELT $ 33)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 23)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
               (|error| "semiResultantEuclidean2 : bad degrees"))
              (#3='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                  (SEQ
                   (LETT |degP| (SPADCALL P (QREFELT $ 22))
                         . #4=(|PRS;semiResultantEuclidean2;2polRR;17|))
                   (EXIT
                    (COND
                     ((ZEROP |degP|)
                      (|error|
                       "semiResultantEuclidean2 : constant polynomials"))
                     (#3#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                       (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 35))
                             . #4#)
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| (SPADCALL Q (QREFELT $ 21))
                                               (QREFELT $ 36)))
                               . #4#)
                         (GO #5=#:G463))))))))))
                (EXIT
                 (COND
                  ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                   (SPADCALL P Q (QREFELT $ 43)))
                  (#3#
                   (PROGN
                    (LETT #1# (|PRS;semiSubResultantEuclidean| P Q $) . #4#)
                    (GO #5#)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;semiResultantEuclidean1;2polRR;18|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 62))
                |PRS;semiResultantEuclidean1;2polRR;18|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;indiceSubResultant;2polRNnipolR;19|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G113| (|polR|)) (|#G112| (|polR|)) (#1=#:G491 NIL)
          (Z (|polR|)) (#2=#:G483 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G111| #3#) (|#G110| #3#) (|#G109| (|polR|))
          (|#G108| (|polR|)) (#4=#:G481 NIL) (#5=#:G476 NIL)
          (|delta| (|NonNegativeInteger|)) (#6=#:G474 NIL) (|#G107| (|polR|))
          (|#G106| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (PROGN
                  (LETT |#G106| Q
                        . #7=(|PRS;indiceSubResultant;2polRNnipolR;19|))
                  (LETT |#G107| P . #7#)
                  (LETT P |#G106| . #7#)
                  (LETT Q |#G107| . #7#))
                 (EXIT
                  (COND
                   ((ODDP (- (SPADCALL P (QREFELT $ 22)) |i|))
                    (COND
                     ((ODDP (- (SPADCALL Q (QREFELT $ 22)) |i|))
                      (LETT Q (SPADCALL Q (QREFELT $ 48)) . #7#)))))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 22))
                                    (SPADCALL Q (QREFELT $ 22)))
                                 . #7#)
                         (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultant$PRS : bad degrees"))
                   (#8='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 35))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #1# (SPADCALL |s| Q (QREFELT $ 39)) . #7#)
                       (GO #9=#:G490))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                 (|spadConstant| $ 24))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #7#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  (QREFELT $ 35))
                        . #7#)
                  (PROGN
                   (LETT |#G108| Q . #7#)
                   (LETT |#G109|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                   (QREFELT $ 57))
                         . #7#)
                   (LETT P |#G108| . #7#)
                   (LETT Q |#G109| . #7#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G110| (SPADCALL P (QREFELT $ 22)) . #7#)
                          (LETT |#G111| (SPADCALL Q (QREFELT $ 22)) . #7#)
                          (LETT |degP| |#G110| . #7#)
                          (LETT |degQ| |#G111| . #7#))
                         (EXIT
                          (COND
                           ((EQL |i| (- |degP| 1))
                            (PROGN (LETT #1# Q . #7#) (GO #9#)))
                           ((OR (SPADCALL Q (QREFELT $ 33))
                                (SPADCALL |i| |degQ| (QREFELT $ 66)))
                            (PROGN
                             (LETT #1# (|spadConstant| $ 24) . #7#)
                             (GO #9#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 21)) |s|
                                             (PROG1
                                                 (LETT #2# (- |degP| |degQ|)
                                                       . #7#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 47))
                                   . #7#)
                             (EXIT
                              (COND
                               ((EQL |i| |degQ|)
                                (PROGN (LETT #1# Z . #7#) (GO #9#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G112| Q . #7#)
                                  (LETT |#G113|
                                        (SPADCALL P Q Z |s| (QREFELT $ 50))
                                        . #7#)
                                  (LETT P |#G112| . #7#)
                                  (LETT Q |#G113| . #7#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 21))
                                        . #7#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;indiceSubResultantEuclidean;2polRNniR;20|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G126| (|Vector| |polR|)) (|#G125| #1#) (|ss| (R)) (#2=#:G517 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G508 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G124| #4#)
          (|#G123| #4#) (|#G122| (|polR|)) (|#G121| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G506 NIL) (#6=#:G501 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G499 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (|e| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (- (SPADCALL P (QREFELT $ 22)) |i|))
                         (COND
                          ((ODDP (- (SPADCALL Q (QREFELT $ 22)) |i|))
                           (SPADCALL (|spadConstant| $ 8) (QREFELT $ 34)))
                          (#8='T (|spadConstant| $ 8))))
                        (#8# (|spadConstant| $ 8)))
                       . #9=(|PRS;indiceSubResultantEuclidean;2polRNniR;20|))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 39)) |i|
                                 (QREFELT $ 69))
                       . #9#)
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 39))
                                 (QVELT |l| 0) (QVELT |l| 2))
                         . #9#)
                   (GO #10=#:G516))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #7#
                                 (- (SPADCALL P (QREFELT $ 22))
                                    (SPADCALL Q (QREFELT $ 22)))
                                 . #9#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       . #9#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultantEuclidean$PRS : bad degrees"))
                   (#8#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                     (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#))
                                     (QREFELT $ 35))
                           . #9#)
                     (EXIT
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 39)))
                             . #9#)
                       (GO #10#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                  (PROG1
                                      (LETT #5#
                                            (- (SPADCALL P (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #9#)
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  (QREFELT $ 35))
                        . #9#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 38))
                        . #9#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                        . #9#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                (QVELT |pdiv| 1))
                        . #9#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G121| (SPADCALL VP 1 (QREFELT $ 52)) . #9#)
                          (LETT |#G122| (SPADCALL VQ 1 (QREFELT $ 52)) . #9#)
                          (LETT P |#G121| . #9#)
                          (LETT Q |#G122| . #9#))
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 33))
                            (PROGN
                             (LETT #2#
                                   (VECTOR (|spadConstant| $ 24)
                                           (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                   . #9#)
                             (GO #10#)))
                           ('T
                            (SEQ
                             (PROGN
                              (LETT |#G123| (SPADCALL P (QREFELT $ 22)) . #9#)
                              (LETT |#G124| (SPADCALL Q (QREFELT $ 22)) . #9#)
                              (LETT |degP| |#G123| . #9#)
                              (LETT |degQ| |#G124| . #9#))
                             (EXIT
                              (COND
                               ((EQL |i| (- |degP| 1))
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (SPADCALL VQ 2 (QREFELT $ 52))
                                               (SPADCALL VQ 3 (QREFELT $ 52))
                                               (SPADCALL VQ 1 (QREFELT $ 52)))
                                       . #9#)
                                 (GO #10#)))
                               ((SPADCALL |i| |degQ| (QREFELT $ 66))
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (|spadConstant| $ 24)
                                               (|spadConstant| $ 24)
                                               (|spadConstant| $ 24))
                                       . #9#)
                                 (GO #10#)))
                               ('T
                                (SEQ
                                 (LETT VZ
                                       (|PRS;Lazard3| VQ
                                        (SPADCALL Q (QREFELT $ 21)) |s|
                                        (PROG1
                                            (LETT #3# (- |degP| |degQ|) . #9#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        $)
                                       . #9#)
                                 (EXIT
                                  (COND
                                   ((EQL |i| |degQ|)
                                    (PROGN
                                     (LETT #2#
                                           (VECTOR
                                            (SPADCALL VZ 2 (QREFELT $ 52))
                                            (SPADCALL VZ 3 (QREFELT $ 52))
                                            (SPADCALL VZ 1 (QREFELT $ 52)))
                                           . #9#)
                                     (GO #10#)))
                                   ('T
                                    (SEQ
                                     (LETT |ss|
                                           (SPADCALL
                                            (SPADCALL VZ 1 (QREFELT $ 52))
                                            (QREFELT $ 21))
                                           . #9#)
                                     (PROGN
                                      (LETT |#G125| VQ . #9#)
                                      (LETT |#G126|
                                            (|PRS;next_sousResultant3| VP VQ
                                             |s| |ss| $)
                                            . #9#)
                                      (LETT VP |#G125| . #9#)
                                      (LETT VQ |#G126| . #9#))
                                     (EXIT (LETT |s| |ss| . #9#)))))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;semiIndiceSubResultantEuclidean;2polRNniR;21|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G135| (|Vector| |polR|)) (|#G134| #1#) (|ss| (R)) (#2=#:G541 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G530 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G133| #4#)
          (|#G132| #4#) (|#G131| (|polR|)) (|#G130| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G528 NIL) (#6=#:G523 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G521 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
               (|error| "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
              (#8='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #7#
                                   (- (SPADCALL P (QREFELT $ 22))
                                      (SPADCALL Q (QREFELT $ 22)))
                                   . #9=(|PRS;semiIndiceSubResultantEuclidean;2polRNniR;21|))
                           (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #7#))
                         . #9#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
                     (#8#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                       (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                         (|check_subtype2| (>= #6# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #6#))
                                       (QREFELT $ 35))
                             . #9#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 39)))
                               . #9#)
                         (GO #10=#:G540))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                   (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
                  (#8#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                    (PROG1
                                        (LETT #5#
                                              (- (SPADCALL P (QREFELT $ 22))
                                                 (SPADCALL Q (QREFELT $ 22)))
                                              . #9#)
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#))
                                    (QREFELT $ 35))
                          . #9#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 38)) . #9#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                    (QREFELT $ 60))
                          . #9#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #9#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G130| (SPADCALL VP 1 (QREFELT $ 52)) . #9#)
                            (LETT |#G131| (SPADCALL VQ 1 (QREFELT $ 52)) . #9#)
                            (LETT P |#G130| . #9#)
                            (LETT Q |#G131| . #9#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 33))
                              (PROGN
                               (LETT #2#
                                     (CONS (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                     . #9#)
                               (GO #10#)))
                             ('T
                              (SEQ
                               (PROGN
                                (LETT |#G132| (SPADCALL P (QREFELT $ 22))
                                      . #9#)
                                (LETT |#G133| (SPADCALL Q (QREFELT $ 22))
                                      . #9#)
                                (LETT |degP| |#G132| . #9#)
                                (LETT |degQ| |#G133| . #9#))
                               (EXIT
                                (COND
                                 ((EQL |i| (- |degP| 1))
                                  (PROGN
                                   (LETT #2#
                                         (CONS (SPADCALL VQ 2 (QREFELT $ 52))
                                               (SPADCALL VQ 1 (QREFELT $ 52)))
                                         . #9#)
                                   (GO #10#)))
                                 ((SPADCALL |i| |degQ| (QREFELT $ 66))
                                  (PROGN
                                   (LETT #2#
                                         (CONS (|spadConstant| $ 24)
                                               (|spadConstant| $ 24))
                                         . #9#)
                                   (GO #10#)))
                                 ('T
                                  (SEQ
                                   (LETT VZ
                                         (|PRS;Lazard3| VQ
                                          (SPADCALL Q (QREFELT $ 21)) |s|
                                          (PROG1
                                              (LETT #3# (- |degP| |degQ|)
                                                    . #9#)
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          $)
                                         . #9#)
                                   (EXIT
                                    (COND
                                     ((EQL |i| |degQ|)
                                      (PROGN
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL VZ 2 (QREFELT $ 52))
                                              (SPADCALL VZ 1 (QREFELT $ 52)))
                                             . #9#)
                                       (GO #10#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL VZ 1 (QREFELT $ 52))
                                              (QREFELT $ 21))
                                             . #9#)
                                       (PROGN
                                        (LETT |#G134| VQ . #9#)
                                        (LETT |#G135|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #9#)
                                        (LETT VP |#G134| . #9#)
                                        (LETT VQ |#G135| . #9#))
                                       (EXIT
                                        (LETT |s| |ss| . #9#)))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultant;2polRNnipolR;22|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G148| (|polR|)) (|#G147| (|polR|)) (Z (|polR|))
          (#1=#:G555 NIL) (#2=#:G562 NIL) (|#G146| (|polR|)) (|#G145| (|polR|))
          (#3=#:G552 NIL) (#4=#:G547 NIL) (|delta| (|NonNegativeInteger|))
          (#5=#:G545 NIL) (|#G144| (|polR|)) (|#G143| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (PROGN
                 (LETT |#G143| Q
                       . #6=(|PRS;degreeSubResultant;2polRNnipolR;22|))
                 (LETT |#G144| P . #6#)
                 (LETT P |#G143| . #6#)
                 (LETT Q |#G144| . #6#))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #5#
                                 (- (SPADCALL P (QREFELT $ 22))
                                    (SPADCALL Q (QREFELT $ 22)))
                                 . #6#)
                         (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #5#))
                       . #6#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultant$PRS : bad degrees"))
                   (#7='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                     (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT $ 35))
                           . #6#)
                     (EXIT
                      (PROGN
                       (LETT #2# (SPADCALL |s| Q (QREFELT $ 39)) . #6#)
                       (GO #8=#:G561))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                 (|spadConstant| $ 24))
                (#7#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #6#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT $ 35))
                        . #6#)
                  (PROGN
                   (LETT |#G145| Q . #6#)
                   (LETT |#G146|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                   (QREFELT $ 57))
                         . #6#)
                   (LETT P |#G145| . #6#)
                   (LETT Q |#G146| . #6#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((OR (SPADCALL Q (QREFELT $ 33))
                                (SPADCALL |i| (SPADCALL Q (QREFELT $ 22))
                                          (QREFELT $ 66)))
                            (PROGN
                             (LETT #2# (|spadConstant| $ 24) . #6#)
                             (GO #8#)))
                           ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                            (PROGN (LETT #2# Q . #6#) (GO #8#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 21)) |s|
                                             (PROG1
                                                 (LETT #1#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           22))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           22)))
                                                       . #6#)
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 47))
                                   . #6#)
                             (PROGN
                              (LETT |#G147| Q . #6#)
                              (LETT |#G148| (SPADCALL P Q Z |s| (QREFELT $ 50))
                                    . #6#)
                              (LETT P |#G147| . #6#)
                              (LETT Q |#G148| . #6#))
                             (EXIT
                              (LETT |s| (SPADCALL Z (QREFELT $ 21))
                                    . #6#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultantEuclidean;2polRNniR;23|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G158| (|Vector| |polR|)) (|#G157| #1#) (|ss| (R)) (#2=#:G579 NIL)
          (#3=#:G586 NIL) (|#G156| (|polR|)) (|#G155| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G575 NIL) (#5=#:G570 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G568 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |l| (SPADCALL Q P |i| (QREFELT $ 73))
                       . #7=(|PRS;degreeSubResultantEuclidean;2polRNniR;23|))
                 (EXIT
                  (PROGN
                   (LETT #3# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #7#)
                   (GO #8=#:G585))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 22))
                                    (SPADCALL Q (QREFELT $ 22)))
                                 . #7#)
                         (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultantEuclidean$PRS : bad degrees"))
                   (#9='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 35))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #3#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 39)))
                             . #7#)
                       (GO #8#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))
                (#9#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #7#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  (QREFELT $ 35))
                        . #7#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 38))
                        . #7#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                        . #7#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                (QVELT |pdiv| 1))
                        . #7#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G155| (SPADCALL VP 1 (QREFELT $ 52)) . #7#)
                          (LETT |#G156| (SPADCALL VQ 1 (QREFELT $ 52)) . #7#)
                          (LETT P |#G155| . #7#)
                          (LETT Q |#G156| . #7#))
                         (COND
                          ((OR (SPADCALL Q (QREFELT $ 33))
                               (SPADCALL |i| (SPADCALL Q (QREFELT $ 22))
                                         (QREFELT $ 66)))
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (VECTOR (|spadConstant| $ 24)
                                           (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                   . #7#)
                             (GO #8#)))))
                         (EXIT
                          (COND
                           ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                            (PROGN
                             (LETT #3#
                                   (VECTOR (SPADCALL VQ 2 (QREFELT $ 52))
                                           (SPADCALL VQ 3 (QREFELT $ 52))
                                           (SPADCALL VQ 1 (QREFELT $ 52)))
                                   . #7#)
                             (GO #8#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL Q (QREFELT $ 21)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           22))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           22)))
                                                       . #7#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 46))
                                   . #7#)
                             (PROGN
                              (LETT |#G157| VQ . #7#)
                              (LETT |#G158|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #7#)
                              (LETT VP |#G157| . #7#)
                              (LETT VQ |#G158| . #7#))
                             (EXIT (LETT |s| |ss| . #7#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |PRS;semiDegreeSubResultantEuclidean;2polRNniR;24|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G165| (|Vector| |polR|)) (|#G164| #1#) (|ss| (R)) (#2=#:G601 NIL)
          (#3=#:G609 NIL) (|#G163| (|polR|)) (|#G162| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G597 NIL) (#5=#:G592 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G590 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
               (|error| "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
              (#7='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #6#
                                   (- (SPADCALL P (QREFELT $ 22))
                                      (SPADCALL Q (QREFELT $ 22)))
                                   . #8=(|PRS;semiDegreeSubResultantEuclidean;2polRNniR;24|))
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#))
                         . #8#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
                     (#7#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                       (PROG1 (LETT #5# (- |delta| 1) . #8#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 35))
                             . #8#)
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 39)))
                               . #8#)
                         (GO #9=#:G608))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 22)) (QREFELT $ 66))
                   (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
                  (#7#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 22))
                                                 (SPADCALL Q (QREFELT $ 22)))
                                              . #8#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 35))
                          . #8#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 38)) . #8#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                    (QREFELT $ 60))
                          . #8#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #8#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G162| (SPADCALL VP 1 (QREFELT $ 52)) . #8#)
                            (LETT |#G163| (SPADCALL VQ 1 (QREFELT $ 52)) . #8#)
                            (LETT P |#G162| . #8#)
                            (LETT Q |#G163| . #8#))
                           (COND
                            ((OR (SPADCALL Q (QREFELT $ 33))
                                 (SPADCALL |i| (SPADCALL Q (QREFELT $ 22))
                                           (QREFELT $ 66)))
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (CONS (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                     . #8#)
                               (GO #9#)))))
                           (EXIT
                            (COND
                             ((EQL |i| (SPADCALL Q (QREFELT $ 22)))
                              (PROGN
                               (LETT #3#
                                     (CONS (SPADCALL VQ 2 (QREFELT $ 52))
                                           (SPADCALL VQ 1 (QREFELT $ 52)))
                                     . #8#)
                               (GO #9#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT $ 21)) |s|
                                               (PROG1
                                                   (LETT #2#
                                                         (-
                                                          (SPADCALL P
                                                                    (QREFELT $
                                                                             22))
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             22)))
                                                         . #8#)
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QREFELT $ 46))
                                     . #8#)
                               (PROGN
                                (LETT |#G164| VQ . #8#)
                                (LETT |#G165|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #8#)
                                (LETT VP |#G164| . #8#)
                                (LETT VQ |#G165| . #8#))
                               (EXIT (LETT |s| |ss| . #8#)))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |PRS;lastSubResultant;3polR;25| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G176| (|polR|)) (|#G175| (|polR|)) (#1=#:G623 NIL)
          (Z (|polR|)) (#2=#:G615 NIL) (|#G174| (|polR|)) (|#G173| (|polR|))
          (#3=#:G614 NIL) (|#G172| (|polR|)) (|#G171| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (PROGN
                 (LETT |#G171| Q . #4=(|PRS;lastSubResultant;3polR;25|))
                 (LETT |#G172| P . #4#)
                 (LETT P |#G171| . #4#)
                 (LETT Q |#G172| . #4#))))
              (EXIT
               (COND
                ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                 (SPADCALL
                  (SPADCALL (SPADCALL Q (QREFELT $ 21))
                            (SPADCALL P (QREFELT $ 22)) (QREFELT $ 35))
                  (QREFELT $ 12)))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #4#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT $ 35))
                        . #4#)
                  (PROGN
                   (LETT |#G173| Q . #4#)
                   (LETT |#G174|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                   (QREFELT $ 57))
                         . #4#)
                   (LETT P |#G173| . #4#)
                   (LETT Q |#G174| . #4#))
                  (LETT Z P . #4#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 33))
                            (PROGN (LETT #1# Z . #4#) (GO #5=#:G622)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 21)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           22))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           22)))
                                                       . #4#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 47))
                                   . #4#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL Z (QREFELT $ 22)))
                                (PROGN (LETT #1# Z . #4#) (GO #5#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G175| Q . #4#)
                                  (LETT |#G176|
                                        (SPADCALL P Q Z |s| (QREFELT $ 50))
                                        . #4#)
                                  (LETT P |#G175| . #4#)
                                  (LETT Q |#G176| . #4#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 21))
                                        . #4#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;lastSubResultantEuclidean;2polRR;26|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G182| (|Vector| |polR|)) (|#G181| #1#) (|ss| (R)) (#2=#:G644 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G637 NIL) (Z (|polR|))
          (|#G180| (|polR|)) (|#G179| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G635 NIL) (#5=#:G630 NIL) (|degP| (|NonNegativeInteger|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (LETT |l| (SPADCALL Q P (QREFELT $ 76))
                       . #6=(|PRS;lastSubResultantEuclidean;2polRR;26|))
                 (EXIT
                  (PROGN
                   (LETT #2# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #6#)
                   (GO #7=#:G643))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 22)) . #6#)
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "lastSubResultantEuclidean$PRS : constant polynomials"))
                       ('T
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                         (PROG1 (LETT #5# (- |degP| 1) . #6#)
                                           (|check_subtype2| (>= #5# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #5#))
                                         (QREFELT $ 35))
                               . #6#)
                         (EXIT
                          (PROGN
                           (LETT #2#
                                 (VECTOR (|spadConstant| $ 24)
                                         (SPADCALL |s| (QREFELT $ 12))
                                         (SPADCALL |s| Q (QREFELT $ 39)))
                                 . #6#)
                           (GO #7#))))))))))
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 21))
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL P (QREFELT $ 22))
                                           (SPADCALL Q (QREFELT $ 22)))
                                        . #6#)
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              (QREFELT $ 35))
                    . #6#)
              (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 38))
                    . #6#)
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                    . #6#)
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                            (QVELT |pdiv| 1))
                    . #6#)
              (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #6#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G179| (SPADCALL VQ 1 (QREFELT $ 52)) . #6#)
                      (LETT |#G180| (SPADCALL VZ 1 (QREFELT $ 52)) . #6#)
                      (LETT Q |#G179| . #6#)
                      (LETT Z |#G180| . #6#))
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT $ 33))
                        (PROGN
                         (LETT #2#
                               (VECTOR (SPADCALL VZ 2 (QREFELT $ 52))
                                       (SPADCALL VZ 3 (QREFELT $ 52))
                                       (SPADCALL VZ 1 (QREFELT $ 52)))
                               . #6#)
                         (GO #7#)))
                       ('T
                        (SEQ
                         (LETT VZ
                               (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 21))
                                |s|
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL Z (QREFELT $ 22))
                                             (SPADCALL Q (QREFELT $ 22)))
                                          . #6#)
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                $)
                               . #6#)
                         (EXIT
                          (COND
                           ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                            (PROGN
                             (LETT #2#
                                   (VECTOR (SPADCALL VZ 2 (QREFELT $ 52))
                                           (SPADCALL VZ 3 (QREFELT $ 52))
                                           (SPADCALL VZ 1 (QREFELT $ 52)))
                                   . #6#)
                             (GO #7#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL VZ 1 (QREFELT $ 52))
                                             (QREFELT $ 21))
                                   . #6#)
                             (PROGN
                              (LETT |#G181| VQ . #6#)
                              (LETT |#G182|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #6#)
                              (LETT VP |#G181| . #6#)
                              (LETT VQ |#G182| . #6#))
                             (EXIT (LETT |s| |ss| . #6#)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |PRS;semiLastSubResultantEuclidean;2polRR;27|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G188| (|Vector| |polR|)) (|#G187| #1#) (|ss| (R)) (#2=#:G664 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G656 NIL) (Z (|polR|))
          (|#G186| (|polR|)) (|#G185| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G654 NIL) (#5=#:G649 NIL) (|degP| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
               (|error| "semiLastSubResultantEuclidean$PRS : bad degrees"))
              (#6='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                  (SEQ
                   (LETT |degP| (SPADCALL P (QREFELT $ 22))
                         . #7=(|PRS;semiLastSubResultantEuclidean;2polRR;27|))
                   (EXIT
                    (COND
                     ((ZEROP |degP|)
                      (|error|
                       "semiLastSubResultantEuclidean$PRS : constant polynomials"))
                     (#6#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                       (PROG1 (LETT #5# (- |degP| 1) . #7#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 35))
                             . #7#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 39)))
                               . #7#)
                         (GO #8=#:G663))))))))))
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                (PROG1
                                    (LETT #4#
                                          (- (SPADCALL P (QREFELT $ 22))
                                             (SPADCALL Q (QREFELT $ 22)))
                                          . #7#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 35))
                      . #7#)
                (LETT VP (VECTOR Q (|spadConstant| $ 38)) . #7#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 48)) (QREFELT $ 60))
                      . #7#)
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #7#)
                (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #7#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G185| (SPADCALL VQ 1 (QREFELT $ 52)) . #7#)
                        (LETT |#G186| (SPADCALL VZ 1 (QREFELT $ 52)) . #7#)
                        (LETT Q |#G185| . #7#)
                        (LETT Z |#G186| . #7#))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 33))
                          (PROGN
                           (LETT #2#
                                 (CONS (SPADCALL VZ 2 (QREFELT $ 52))
                                       (SPADCALL VZ 1 (QREFELT $ 52)))
                                 . #7#)
                           (GO #8#)))
                         ('T
                          (SEQ
                           (LETT VZ
                                 (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 21))
                                  |s|
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL Z (QREFELT $ 22))
                                               (SPADCALL Q (QREFELT $ 22)))
                                            . #7#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  $)
                                 . #7#)
                           (EXIT
                            (COND
                             ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                              (PROGN
                               (LETT #2#
                                     (CONS (SPADCALL VZ 2 (QREFELT $ 52))
                                           (SPADCALL VZ 1 (QREFELT $ 52)))
                                     . #7#)
                               (GO #8#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL VZ 1 (QREFELT $ 52))
                                               (QREFELT $ 21))
                                     . #7#)
                               (PROGN
                                (LETT |#G187| VQ . #7#)
                                (LETT |#G188|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #7#)
                                (LETT VP |#G187| . #7#)
                                (LETT VQ |#G188| . #7#))
                               (EXIT (LETT |s| |ss| . #7#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;chainSubResultants;2polRL;28|
        ((P |polR|) (Q |polR|) ($ |List| |polR|))
        (SPROG
         ((|s| (R)) (|#G198| (|polR|)) (|#G197| (|polR|)) (#1=#:G680 NIL)
          (L (|List| |polR|)) (Z (|polR|)) (|delta| (|NonNegativeInteger|))
          (#2=#:G672 NIL) (|#G196| (|polR|)) (|#G195| (|polR|)) (#3=#:G671 NIL)
          (|#G194| (|polR|)) (|#G193| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (SEQ
                 (PROGN
                  (LETT |#G193| Q . #4=(|PRS;chainSubResultants;2polRL;28|))
                  (LETT |#G194| P . #4#)
                  (LETT P |#G193| . #4#)
                  (LETT Q |#G194| . #4#))
                 (EXIT
                  (COND
                   ((ODDP (SPADCALL P (QREFELT $ 22)))
                    (COND
                     ((ODDP (SPADCALL Q (QREFELT $ 22)))
                      (LETT Q (SPADCALL Q (QREFELT $ 48)) . #4#)))))))))
              (LETT L NIL . #4#)
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 22))) L)
                     ('T
                      (SEQ (LETT L (LIST Q) . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 22))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         22)))
                                                     . #4#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 35))
                                 . #4#)
                           (PROGN
                            (LETT |#G195| Q . #4#)
                            (LETT |#G196|
                                  (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                            (QREFELT $ 57))
                                  . #4#)
                            (LETT P |#G195| . #4#)
                            (LETT Q |#G196| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 33))
                                     (PROGN (LETT #1# L . #4#) (GO #5=#:G679)))
                                    ('T
                                     (SEQ (LETT L (CONS Q L) . #4#)
                                          (LETT |delta|
                                                (PROG1
                                                    (LETT #2#
                                                          (-
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              22))
                                                           (SPADCALL Q
                                                                     (QREFELT $
                                                                              22)))
                                                          . #4#)
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                . #4#)
                                          (LETT Z
                                                (SPADCALL Q
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             21))
                                                          |s| |delta|
                                                          (QREFELT $ 47))
                                                . #4#)
                                          (COND
                                           ((SPADCALL |delta| 1 (QREFELT $ 66))
                                            (LETT L (CONS Z L) . #4#)))
                                          (EXIT
                                           (COND
                                            ((ZEROP
                                              (SPADCALL Z (QREFELT $ 22)))
                                             (PROGN
                                              (LETT #1# L . #4#)
                                              (GO #5#)))
                                            ('T
                                             (SEQ
                                              (PROGN
                                               (LETT |#G197| Q . #4#)
                                               (LETT |#G198|
                                                     (SPADCALL P Q Z |s|
                                                               (QREFELT $ 50))
                                                     . #4#)
                                               (LETT P |#G197| . #4#)
                                               (LETT Q |#G198| . #4#))
                                              (EXIT
                                               (LETT |s|
                                                     (SPADCALL Z
                                                               (QREFELT $ 21))
                                                     . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;schema;2polRL;29|
        ((P |polR|) (Q |polR|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|s| (R)) (|#G206| (|polR|)) (|#G205| (|polR|)) (#1=#:G694 NIL)
          (L (|List| (|NonNegativeInteger|))) (Z (|polR|))
          (|delta| (|NonNegativeInteger|)) (#2=#:G686 NIL)
          (|e| (|NonNegativeInteger|)) (|#G204| (|polR|)) (|#G203| (|polR|))
          (#3=#:G685 NIL) (|#G202| (|polR|)) (|#G201| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 33)) (SPADCALL P (QREFELT $ 33))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                (PROGN
                 (LETT |#G201| Q . #4=(|PRS;schema;2polRL;29|))
                 (LETT |#G202| P . #4#)
                 (LETT P |#G201| . #4#)
                 (LETT Q |#G202| . #4#))))
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 22))) (LIST 0))
                     ('T
                      (SEQ (LETT L NIL . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 22))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         22)))
                                                     . #4#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 35))
                                 . #4#)
                           (PROGN
                            (LETT |#G203| Q . #4#)
                            (LETT |#G204| (SPADCALL P Q (QREFELT $ 57)) . #4#)
                            (LETT P |#G203| . #4#)
                            (LETT Q |#G204| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 33))
                                     (PROGN (LETT #1# L . #4#) (GO #5=#:G693)))
                                    ('T
                                     (SEQ
                                      (LETT |e| (SPADCALL Q (QREFELT $ 22))
                                            . #4#)
                                      (LETT L (CONS |e| L) . #4#)
                                      (LETT |delta|
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT $
                                                                          22))
                                                       |e|)
                                                      . #4#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            . #4#)
                                      (LETT Z
                                            (SPADCALL Q
                                                      (SPADCALL Q
                                                                (QREFELT $ 21))
                                                      |s| |delta|
                                                      (QREFELT $ 47))
                                            . #4#)
                                      (COND
                                       ((SPADCALL |delta| 1 (QREFELT $ 66))
                                        (LETT L (CONS |e| L) . #4#)))
                                      (EXIT
                                       (COND
                                        ((ZEROP |e|)
                                         (PROGN (LETT #1# L . #4#) (GO #5#)))
                                        ('T
                                         (SEQ
                                          (PROGN
                                           (LETT |#G205| Q . #4#)
                                           (LETT |#G206|
                                                 (SPADCALL P Q Z |s|
                                                           (QREFELT $ 50))
                                                 . #4#)
                                           (LETT P |#G205| . #4#)
                                           (LETT Q |#G206| . #4#))
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL Z (QREFELT $ 21))
                                                 . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;subResultantGcd;3polR;30| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G214| (|polR|)) (|#G213| (|polR|)) (Z (|polR|))
          (#1=#:G700 NIL) (#2=#:G710 NIL) (|#G212| (|polR|)) (|#G211| (|polR|))
          (#3=#:G699 NIL) (|#G210| (|polR|)) (|#G209| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 33))
              (COND
               ((SPADCALL Q (QREFELT $ 33)) (EXIT (|spadConstant| $ 24))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 33)) Q)
                   ((SPADCALL Q (QREFELT $ 33)) P)
                   (#4='T
                    (SEQ
                     (COND
                      ((< (SPADCALL P (QREFELT $ 22))
                          (SPADCALL Q (QREFELT $ 22)))
                       (PROGN
                        (LETT |#G209| Q . #5=(|PRS;subResultantGcd;3polR;30|))
                        (LETT |#G210| P . #5#)
                        (LETT P |#G209| . #5#)
                        (LETT Q |#G210| . #5#))))
                     (EXIT
                      (COND
                       ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                        (|spadConstant| $ 38))
                       (#4#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                         (PROG1
                                             (LETT #3#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 22))
                                                    (SPADCALL Q
                                                              (QREFELT $ 22)))
                                                   . #5#)
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT $ 35))
                               . #5#)
                         (PROGN
                          (LETT |#G211| Q . #5#)
                          (LETT |#G212|
                                (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                          (QREFELT $ 57))
                                . #5#)
                          (LETT P |#G211| . #5#)
                          (LETT Q |#G212| . #5#))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL Q (QREFELT $ 33))
                                   (PROGN (LETT #2# P . #5#) (GO #6=#:G709)))
                                  ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                                   (PROGN
                                    (LETT #2# (|spadConstant| $ 38) . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT Z
                                          (SPADCALL Q
                                                    (SPADCALL Q (QREFELT $ 21))
                                                    |s|
                                                    (PROG1
                                                        (LETT #1#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          22))
                                                               (SPADCALL Q
                                                                         (QREFELT
                                                                          $
                                                                          22)))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 47))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G213| Q . #5#)
                                     (LETT |#G214|
                                           (SPADCALL P Q Z |s| (QREFELT $ 50))
                                           . #5#)
                                     (LETT P |#G213| . #5#)
                                     (LETT Q |#G214| . #5#))
                                    (EXIT
                                     (LETT |s| (SPADCALL Z (QREFELT $ 21))
                                           . #5#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;subResultantGcdEuclidean;2polRR;31|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G220| (|Vector| |polR|)) (|#G219| #1#) (|ss| (R)) (#2=#:G719 NIL)
          (#3=#:G729 NIL) (|e| (|NonNegativeInteger|)) (|#G218| (|polR|))
          (|#G217| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G717 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 33))
              (COND
               ((SPADCALL Q (QREFELT $ 33))
                (EXIT
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))))))
            (EXIT
             (COND
              ((SPADCALL P (QREFELT $ 33))
               (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 38) Q))
              ((SPADCALL Q (QREFELT $ 33))
               (VECTOR (|spadConstant| $ 38) (|spadConstant| $ 24) P))
              (#5='T
               (SEQ
                (COND
                 ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                  (SEQ
                   (LETT |l| (SPADCALL Q P (QREFELT $ 85))
                         . #6=(|PRS;subResultantGcdEuclidean;2polRR;31|))
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                           . #6#)
                     (GO #7=#:G728))))))
                (EXIT
                 (COND
                  ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                   (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 38) Q))
                  (#5#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 22))
                                                 (SPADCALL Q (QREFELT $ 22)))
                                              . #6#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 35))
                          . #6#)
                    (LETT VP
                          (VECTOR Q (|spadConstant| $ 24)
                                  (|spadConstant| $ 38))
                          . #6#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                    (QREFELT $ 60))
                          . #6#)
                    (LETT VQ
                          (VECTOR (QVELT |pdiv| 2)
                                  (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                  (QVELT |pdiv| 1))
                          . #6#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G217| (SPADCALL VP 1 (QREFELT $ 52)) . #6#)
                            (LETT |#G218| (SPADCALL VQ 1 (QREFELT $ 52)) . #6#)
                            (LETT P |#G217| . #6#)
                            (LETT Q |#G218| . #6#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 33))
                              (PROGN
                               (LETT #3#
                                     (VECTOR (SPADCALL VP 2 (QREFELT $ 52))
                                             (SPADCALL VP 3 (QREFELT $ 52)) P)
                                     . #6#)
                               (GO #7#)))
                             ('T
                              (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 22)) . #6#)
                                   (EXIT
                                    (COND
                                     ((ZEROP |e|)
                                      (PROGN
                                       (LETT #3#
                                             (VECTOR
                                              (SPADCALL VQ 2 (QREFELT $ 52))
                                              (SPADCALL VQ 3 (QREFELT $ 52)) Q)
                                             . #6#)
                                       (GO #7#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL Q (QREFELT $ 21)) |s|
                                              (PROG1
                                                  (LETT #2#
                                                        (-
                                                         (SPADCALL P
                                                                   (QREFELT $
                                                                            22))
                                                         |e|)
                                                        . #6#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 46))
                                             . #6#)
                                       (PROGN
                                        (LETT |#G219| VQ . #6#)
                                        (LETT |#G220|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #6#)
                                        (LETT VP |#G219| . #6#)
                                        (LETT VQ |#G220| . #6#))
                                       (EXIT (LETT |s| |ss| . #6#)))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean2;2polRR;32|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G226| (|Vector| |polR|)) (|#G225| #1#) (|ss| (R)) (#2=#:G736 NIL)
          (#3=#:G748 NIL) (|e| (|NonNegativeInteger|)) (|#G224| (|polR|))
          (|#G223| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G734 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 33))
              (COND
               ((SPADCALL Q (QREFELT $ 33))
                (EXIT (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 33)) (CONS (|spadConstant| $ 38) Q))
                   ((SPADCALL Q (QREFELT $ 33)) (CONS (|spadConstant| $ 24) P))
                   ((< (SPADCALL P (QREFELT $ 22)) (SPADCALL Q (QREFELT $ 22)))
                    (|error|
                     "semiSubResultantGcdEuclidean2$PRS : bad degrees"))
                   ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                    (CONS (|spadConstant| $ 38) Q))
                   ('T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                     (PROG1
                                         (LETT #4#
                                               (- (SPADCALL P (QREFELT $ 22))
                                                  (SPADCALL Q (QREFELT $ 22)))
                                               . #5=(|PRS;semiSubResultantGcdEuclidean2;2polRR;32|))
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT $ 35))
                           . #5#)
                     (LETT VP (VECTOR Q (|spadConstant| $ 38)) . #5#)
                     (LETT |pdiv|
                           (SPADCALL P (SPADCALL Q (QREFELT $ 48))
                                     (QREFELT $ 60))
                           . #5#)
                     (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (PROGN
                             (LETT |#G223| (SPADCALL VP 1 (QREFELT $ 52))
                                   . #5#)
                             (LETT |#G224| (SPADCALL VQ 1 (QREFELT $ 52))
                                   . #5#)
                             (LETT P |#G223| . #5#)
                             (LETT Q |#G224| . #5#))
                            (EXIT
                             (COND
                              ((SPADCALL Q (QREFELT $ 33))
                               (PROGN
                                (LETT #3#
                                      (CONS (SPADCALL VP 2 (QREFELT $ 52)) P)
                                      . #5#)
                                (GO #6=#:G747)))
                              ('T
                               (SEQ
                                (LETT |e| (SPADCALL Q (QREFELT $ 22)) . #5#)
                                (EXIT
                                 (COND
                                  ((ZEROP |e|)
                                   (PROGN
                                    (LETT #3#
                                          (CONS (SPADCALL VQ 2 (QREFELT $ 52))
                                                Q)
                                          . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT |ss|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 21))
                                                    |s|
                                                    (PROG1
                                                        (LETT #2#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          22))
                                                               |e|)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 46))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G225| VQ . #5#)
                                     (LETT |#G226|
                                           (|PRS;next_sousResultant3| VP VQ |s|
                                            |ss| $)
                                           . #5#)
                                     (LETT VP |#G225| . #5#)
                                     (LETT VQ |#G226| . #5#))
                                    (EXIT (LETT |s| |ss| . #5#)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean1;2polRR;33|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 85))
                |PRS;semiSubResultantGcdEuclidean1;2polRR;33|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;discriminant;polRR;34| ((P |polR|) ($ R))
        (SPROG
         ((#1=#:G764 NIL) (#2=#:G759 NIL) (#3=#:G756 NIL) (|d| (|Integer|))
          (|r| (R)) (|dP| (|polR|)) (|a| (|Integer|)) (#4=#:G754 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 22))
                  . #5=(|PRS;discriminant;polRR;34|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#6='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #5#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #4# |a| . #5#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          . #5#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #5#)
                    (LETT |r| (SPADCALL P |dP| (QREFELT $ 58)) . #5#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 22))) 1)
                          . #5#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (COND
                             ((ZEROP |d|)
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #3#
                                                  (SPADCALL |r|
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 21))
                                                            (QREFELT $ 26))
                                                  . #5#)
                                            (QCDR #3#)
                                          (|check_union2| (QEQCAR #3# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #3#))
                                        (QREFELT $ 91)))
                             (#6#
                              (SPADCALL (SPADCALL |a| |r| (QREFELT $ 91))
                                        (SPADCALL (SPADCALL P (QREFELT $ 21))
                                                  (PROG1
                                                      (LETT #2# (- |d| 1)
                                                            . #5#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 35))
                                        (QREFELT $ 36))))
                            . #5#)
                      (GO #7=#:G763)))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |PRS;discriminantEuclidean;polRR;35|
        ((P |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G790 NIL) (|cr| (R)) (#2=#:G783 NIL) (|c2| (|polR|))
          (#3=#:G781 NIL) (|c1| (|polR|)) (#4=#:G777 NIL) (#5=#:G771 NIL)
          (#6=#:G768 NIL) (|d| (|Integer|))
          (|rE|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#7=#:G766 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 22))
                  . #8=(|PRS;discriminantEuclidean;polRR;35|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#9='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #8#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #7# |a| . #8#)
                                  (|check_subtype2| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #7#)))
                          . #8#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #8#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 62)) . #8#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 22))) 1)
                          . #8#)
                    (COND
                     ((ZEROP |d|)
                      (SEQ
                       (LETT |c1|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL (QVELT |rE| 0)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 17))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #10="failed")
                                                         #6#))
                                       (QREFELT $ 61))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL (QVELT |rE| 1)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 17))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #10#)
                                                         #6#))
                                       (QREFELT $ 61))
                             . #8#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #5#
                                                  (SPADCALL (QVELT |rE| 2)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 21))
                                                            (QREFELT $ 26))
                                                  . #8#)
                                            (QCDR #5#)
                                          (|check_union2| (QEQCAR #5# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #5#))
                                        (QREFELT $ 91))
                              . #8#))))
                     (#9#
                      (SEQ
                       (LETT |c1|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 0) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 21))
                                        (PROG1 (LETT #4# (- |d| 1) . #8#)
                                          (|check_subtype2| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                        (QREFELT $ 35))
                              (QREFELT $ 93))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 1) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 21))
                                        (PROG1 (LETT #3# (- |d| 1) . #8#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        (QREFELT $ 35))
                              (QREFELT $ 93))
                             . #8#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QVELT |rE| 2) (QREFELT $ 91))
                               (SPADCALL (SPADCALL P (QREFELT $ 21))
                                         (PROG1 (LETT #2# (- |d| 1) . #8#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 35))
                               (QREFELT $ 36))
                              . #8#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (VECTOR |c1| |c2| |cr|) . #8#)
                      (GO #11=#:G789)))))))))
          #11# (EXIT #1#)))) 

(SDEFUN |PRS;semiDiscriminantEuclidean;polRR;36|
        ((P |polR|) ($ |Record| (|:| |coef2| |polR|) (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G812 NIL) (|cr| (R)) (#2=#:G805 NIL) (|c2| (|polR|))
          (#3=#:G803 NIL) (#4=#:G797 NIL) (#5=#:G794 NIL) (|d| (|Integer|))
          (|rE| (|Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#6=#:G792 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 22))
                  . #7=(|PRS;semiDiscriminantEuclidean;polRR;36|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#8='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #7#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #6# |a| . #7#)
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#)))
                          . #7#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #7#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 63)) . #7#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 22))) 1)
                          . #7#)
                    (COND
                     ((ZEROP |d|)
                      (SEQ
                       (LETT |c2|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #5#
                                                 (SPADCALL (QCAR |rE|)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              21))
                                                           (QREFELT $ 17))
                                                 . #7#)
                                           (QCDR #5#)
                                         (|check_union2| (QEQCAR #5# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  "failed")
                                                         #5#))
                                       (QREFELT $ 61))
                             . #7#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #4#
                                                  (SPADCALL (QCDR |rE|)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 21))
                                                            (QREFELT $ 26))
                                                  . #7#)
                                            (QCDR #4#)
                                          (|check_union2| (QEQCAR #4# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #4#))
                                        (QREFELT $ 91))
                              . #7#))))
                     (#8#
                      (SEQ
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QCAR |rE|) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 21))
                                        (PROG1 (LETT #3# (- |d| 1) . #7#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        (QREFELT $ 35))
                              (QREFELT $ 93))
                             . #7#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QCDR |rE|) (QREFELT $ 91))
                               (SPADCALL (SPADCALL P (QREFELT $ 21))
                                         (PROG1 (LETT #2# (- |d| 1) . #7#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 35))
                               (QREFELT $ 36))
                              . #7#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (CONS |c2| |cr|) . #7#)
                      (GO #9=#:G811)))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduit;2polRR;37| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((#1=#:G820 NIL) (#2=#:G815 NIL) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #3=(|PRS;resultantReduit;2polRR;37|))
            (LETT |UVs| (QVELT UV 2) . #3#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 22)) 0 (QREFELT $ 66))
               (|spadConstant| $ 23))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                                (QREFELT $ 100))
                      . #3#)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (PROG2
                            (LETT #2#
                                  (SPADCALL (SPADCALL |UVs| (QREFELT $ 21))
                                            (SPADCALL |l| (QREFELT $ 102))
                                            (QREFELT $ 26))
                                  . #3#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #2#))
                        . #3#)
                  (GO #4=#:G819)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduitEuclidean;2polRR;38|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G833 NIL) (|rr| (R)) (#2=#:G827 NIL) (|c2| (|polR|))
          (#3=#:G824 NIL) (|c1| (|polR|)) (|gl| (R)) (|l| (|List| R))
          (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #4=(|PRS;resultantReduitEuclidean;2polRR;38|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 22)) 0 (QREFELT $ 66))
               (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                       (|spadConstant| $ 23)))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                                (QREFELT $ 100))
                      . #4#)
                (LETT |gl| (SPADCALL |l| (QREFELT $ 102)) . #4#)
                (LETT |c1|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 0) |gl| (QREFELT $ 17))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) #5="failed")
                                        #3#))
                      . #4#)
                (LETT |c2|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 17))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) #5#) #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 21)) |gl|
                                          (QREFELT $ 26))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (VECTOR |c1| |c2| |rr|) . #4#)
                  (GO #6=#:G832)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |PRS;semiResultantReduitEuclidean;2polRR;39|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G846 NIL) (|rr| (R)) (#2=#:G840 NIL) (|c2| (|polR|))
          (#3=#:G837 NIL) (|gl| (R)) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #4=(|PRS;semiResultantReduitEuclidean;2polRR;39|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 22)) 0 (QREFELT $ 66))
               (CONS (|spadConstant| $ 24) (|spadConstant| $ 23)))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                                (QREFELT $ 100))
                      . #4#)
                (LETT |gl| (SPADCALL |l| (QREFELT $ 102)) . #4#)
                (LETT |c2|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 17))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 21)) |gl|
                                          (QREFELT $ 26))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS |c2| |rr|) . #4#)
                  (GO #5=#:G845)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;gcd_naif| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|#G246| (|polR|)) (|#G245| (|polR|)) (#1=#:G856 NIL)
          (#2=#:G848 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL P (QREFELT $ 33))
             (PROG2
                 (LETT #2#
                       (SPADCALL Q (SPADCALL Q (QREFELT $ 21)) (QREFELT $ 17))
                       . #3=(|PRS;gcd_naif|))
                 (QCDR #2#)
               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                               (|Union| (QREFELT $ 7) #4="failed") #2#)))
            ('T
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 33))
                      (PROGN
                       (LETT #1#
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL P (SPADCALL P (QREFELT $ 21))
                                                 (QREFELT $ 17))
                                       . #3#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) #4#)
                                               #2#))
                             . #3#)
                       (GO #5=#:G855)))
                     ((ZEROP (SPADCALL Q (QREFELT $ 22)))
                      (PROGN (LETT #1# (|spadConstant| $ 38) . #3#) (GO #5#)))
                     ('T
                      (PROGN
                       (LETT |#G245| Q . #3#)
                       (LETT |#G246| (QCDR (SPADCALL P Q (QREFELT $ 31)))
                             . #3#)
                       (LETT P |#G245| . #3#)
                       (LETT Q |#G246| . #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;gcd;3polR;41| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((#1=#:G864 NIL) (G (|polR|)) (#2=#:G858 NIL) (|cQ| (R)) (|cP| (R)))
         (SEQ
          (EXIT
           (COND
            ((|HasCategory| (QREFELT $ 6) '(|Finite|)) (|PRS;gcd_naif| P Q $))
            ((SPADCALL P (QREFELT $ 33)) Q) ((SPADCALL Q (QREFELT $ 33)) P)
            ('T
             (SEQ
              (LETT |cP| (SPADCALL P (QREFELT $ 108))
                    . #3=(|PRS;gcd;3polR;41|))
              (LETT |cQ| (SPADCALL Q (QREFELT $ 108)) . #3#)
              (LETT P
                    (PROG2 (LETT #2# (SPADCALL P |cP| (QREFELT $ 17)) . #3#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #4="failed") #2#))
                    . #3#)
              (LETT Q
                    (PROG2 (LETT #2# (SPADCALL Q |cQ| (QREFELT $ 17)) . #3#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                      (|Union| (QREFELT $ 7) #4#) #2#))
                    . #3#)
              (LETT G (SPADCALL P Q (QREFELT $ 83)) . #3#)
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL (SPADCALL |cP| |cQ| (QREFELT $ 109))
                                (SPADCALL G (QREFELT $ 110)) (QREFELT $ 39))
                      . #3#)
                (GO #5=#:G863)))))))
          #5# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PseudoRemainderSequence;|)) 

(DEFUN |PseudoRemainderSequence| (&REST #1=#:G865)
  (SPROG NIL
         (PROG (#2=#:G866)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PseudoRemainderSequence|)
                                               '|domainEqualList|)
                    . #3=(|PseudoRemainderSequence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PseudoRemainderSequence;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PseudoRemainderSequence|)))))))))) 

(DEFUN |PseudoRemainderSequence;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PseudoRemainderSequence|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PseudoRemainderSequence| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 112) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PseudoRemainderSequence|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 10)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 103
                       (CONS
                        (|dispatchFunction| |PRS;resultantReduit;2polRR;37|)
                        $))
             (QSETREFV $ 105
                       (CONS
                        (|dispatchFunction|
                         |PRS;resultantReduitEuclidean;2polRR;38|)
                        $))
             (QSETREFV $ 107
                       (CONS
                        (|dispatchFunction|
                         |PRS;semiResultantReduitEuclidean;2polRR;39|)
                        $))
             (QSETREFV $ 111
                       (CONS (|dispatchFunction| |PRS;gcd;3polR;41|) $)))))
          $))) 

(MAKEPROP '|PseudoRemainderSequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (|NonNegativeInteger|) (4 . |monomial|) 'X (10 . |coerce|)
              (|Vector| 7) (15 . *) |PRS;*;R2V;1| (|Union| $ '"failed")
              (21 . |exquo|) (|Mapping| 7 7) (27 . |map|) |PRS;exquo;VRV;2|
              (33 . |leadingCoefficient|) (38 . |degree|) (43 . |Zero|)
              (47 . |Zero|) (51 . |reductum|) (56 . |exquo|) (62 . +) (68 . *)
              (74 . -) (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;divide;2polRR;3| (|Boolean|) (80 . |zero?|) (85 . -)
              (90 . ^) (96 . *) |PRS;resultant_naif;2polRR;4| (102 . |One|)
              (106 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;resultantEuclidean_naif;2polRR;5|
              (|Record| (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean_naif;2polRR;6| (|PositiveInteger|)
              (112 . *) |PRS;Lazard;2RNniR;7| |PRS;Lazard2;polR2RNnipolR;8|
              (118 . -) (123 . |coefficient|)
              |PRS;next_sousResultant2;3polRRpolR;10| (|Integer|) (129 . |elt|)
              (135 . -) (141 . +) (147 . |setelt!|) (154 . -)
              (159 . |pseudoRemainder|) |PRS;resultant;2polRR;13|
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (165 . |pseudoDivide|) (171 . *)
              |PRS;resultantEuclidean;2polRR;15|
              |PRS;semiResultantEuclidean2;2polRR;17|
              (|Record| (|:| |coef1| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean1;2polRR;18| (177 . >)
              |PRS;indiceSubResultant;2polRNnipolR;19|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;indiceSubResultantEuclidean;2polRNniR;20|
              (|Record| (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;semiIndiceSubResultantEuclidean;2polRNniR;21|
              |PRS;degreeSubResultant;2polRNnipolR;22|
              |PRS;degreeSubResultantEuclidean;2polRNniR;23|
              |PRS;semiDegreeSubResultantEuclidean;2polRNniR;24|
              |PRS;lastSubResultant;3polR;25|
              |PRS;lastSubResultantEuclidean;2polRR;26| (183 . |copy|)
              |PRS;semiLastSubResultantEuclidean;2polRR;27| (|List| 7)
              |PRS;chainSubResultants;2polRL;28| (|List| 9)
              |PRS;schema;2polRL;29| |PRS;subResultantGcd;3polR;30|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;subResultantGcdEuclidean;2polRR;31|
              (|Record| (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean2;2polRR;32|
              (|Record| (|:| |coef1| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean1;2polRR;33|
              (188 . |differentiate|) (193 . *) |PRS;discriminant;polRR;34|
              (199 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;discriminantEuclidean;polRR;35|
              (|Record| (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;semiDiscriminantEuclidean;polRR;36| (|List| 6)
              (205 . |coefficients|) (210 . |concat|) (|List| $) (216 . |gcd|)
              (221 . |resultantReduit|)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7)
                        (|:| |resultantReduit| 6))
              (227 . |resultantReduitEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultantReduit| 6))
              (233 . |semiResultantReduitEuclidean|) (239 . |content|)
              (244 . |gcd|) (250 . |primitivePart|) (255 . |gcd|))
           '#(|subResultantGcdEuclidean| 261 |subResultantGcd| 267
              |semiSubResultantGcdEuclidean2| 273
              |semiSubResultantGcdEuclidean1| 279
              |semiResultantReduitEuclidean| 285 |semiResultantEuclidean_naif|
              291 |semiResultantEuclidean2| 297 |semiResultantEuclidean1| 303
              |semiLastSubResultantEuclidean| 309
              |semiIndiceSubResultantEuclidean| 315 |semiDiscriminantEuclidean|
              322 |semiDegreeSubResultantEuclidean| 327 |schema| 334
              |resultant_naif| 340 |resultantReduitEuclidean| 346
              |resultantReduit| 352 |resultantEuclidean_naif| 358
              |resultantEuclidean| 364 |resultant| 370 |next_sousResultant2|
              376 |lastSubResultantEuclidean| 384 |lastSubResultant| 390
              |indiceSubResultantEuclidean| 396 |indiceSubResultant| 403 |gcd|
              410 |exquo| 416 |divide| 422 |discriminantEuclidean| 428
              |discriminant| 433 |degreeSubResultantEuclidean| 438
              |degreeSubResultant| 445 |chainSubResultants| 452 |Lazard2| 458
              |Lazard| 466 * 473)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(0 6 0 8 2 7 0 6 9 10 1 7 0 6
                                                   12 2 13 0 7 0 14 2 7 16 0 6
                                                   17 2 13 0 18 0 19 1 7 6 0 21
                                                   1 7 9 0 22 0 6 0 23 0 7 0 24
                                                   1 7 0 0 25 2 6 16 0 0 26 2 7
                                                   0 0 0 27 2 7 0 0 0 28 2 7 0
                                                   0 0 29 1 7 32 0 33 1 6 0 0
                                                   34 2 6 0 0 9 35 2 6 0 0 0 36
                                                   0 7 0 38 2 7 0 6 0 39 2 9 0
                                                   44 0 45 1 7 0 0 48 2 7 6 0 9
                                                   49 2 13 7 0 51 52 2 13 0 0 0
                                                   53 2 13 0 0 0 54 3 13 7 0 51
                                                   7 55 1 13 0 0 56 2 7 0 0 0
                                                   57 2 7 59 0 0 60 2 7 0 51 0
                                                   61 2 9 32 0 0 66 1 13 0 0 77
                                                   1 7 0 0 90 2 6 0 51 0 91 2 7
                                                   0 0 6 93 1 7 98 0 99 2 98 0
                                                   0 0 100 1 6 0 101 102 2 0 6
                                                   7 7 103 2 0 104 7 7 105 2 0
                                                   106 7 7 107 1 7 6 0 108 2 6
                                                   0 0 0 109 1 7 0 0 110 2 0 7
                                                   7 7 111 2 0 84 7 7 85 2 0 7
                                                   7 7 83 2 0 86 7 7 87 2 0 88
                                                   7 7 89 2 1 106 7 7 107 2 0
                                                   42 7 7 43 2 0 42 7 7 63 2 0
                                                   64 7 7 65 2 0 70 7 7 78 3 0
                                                   70 7 7 9 71 1 0 96 7 97 3 0
                                                   70 7 7 9 74 2 0 81 7 7 82 2
                                                   0 6 7 7 37 2 1 104 7 7 105 2
                                                   1 6 7 7 103 2 0 40 7 7 41 2
                                                   0 40 7 7 62 2 0 6 7 7 58 4 0
                                                   7 7 7 7 6 50 2 0 68 7 7 76 2
                                                   0 7 7 7 75 3 0 68 7 7 9 69 3
                                                   0 7 7 7 9 67 2 1 7 7 7 111 2
                                                   0 13 13 6 20 2 0 30 7 7 31 1
                                                   0 94 7 95 1 0 6 7 92 3 0 68
                                                   7 7 9 73 3 0 7 7 7 9 72 2 0
                                                   79 7 7 80 4 0 7 7 6 6 9 47 3
                                                   0 6 6 6 9 46 2 0 13 6 13
                                                   15)))))
           '|lookupComplete|)) 
