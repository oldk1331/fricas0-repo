
(SDEFUN |PRS;*;R2V;1| ((|r| R) (|v| |Vector| |polR|) ($ |Vector| |polR|))
        (SPADCALL (SPADCALL |r| (QREFELT $ 13)) |v| (QREFELT $ 15))) 

(SDEFUN |PRS;exquo;VRV;2| ((|v| |Vector| |polR|) (|r| R) ($ |Vector| |polR|))
        (SPROG NIL
               (SPADCALL
                (CONS #'|PRS;exquo;VRV;2!0| (VECTOR (QREFELT $ 7) $ |r|)) |v|
                (QREFELT $ 20)))) 

(SDEFUN |PRS;exquo;VRV;2!0| ((|p1| NIL) ($$ NIL))
        (PROG (|r| $ |polR|)
          (LETT |r| (QREFELT $$ 2) . #1=(|PRS;exquo;VRV;2|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |polR| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G278 NIL))
                   (PROG2 (LETT #2# (SPADCALL |p1| |r| (QREFELT $ 18)) NIL)
                       (QCDR #2#)
                     (|check_union| (QEQCAR #2# 0) |polR| #2#))))))) 

(SDEFUN |PRS;pseudoDivide;2polRR;3|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef| R) (|:| |quotient| |polR|)
          (|:| |remainder| |polR|)))
        (SPROG
         ((#1=#:G294 NIL) (|quot| (|polR|)) (|mon| (|polR|)) (#2=#:G285 NIL)
          (|i| (|NonNegativeInteger|)) (#3=#:G284 NIL) (|delta| (|Integer|))
          (|co| (R)) (#4=#:G283 NIL) (|degQ| #5=(|NonNegativeInteger|))
          (|degP| #5#) (|#G11| #5#) (|#G10| #5#) (|lcQ| (R)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL Q (QREFELT $ 23))
             (|error| "PseudoDivide$PRS : division by 0"))
            ((SPADCALL P (QREFELT $ 23))
             (VECTOR (|spadConstant| $ 8) (|spadConstant| $ 24) P))
            (#6='T
             (SEQ
              (LETT |lcQ| (SPADCALL Q (QREFELT $ 25))
                    . #7=(|PRS;pseudoDivide;2polRR;3|))
              (PROGN
               (LETT |#G10| (SPADCALL P (QREFELT $ 26)) . #7#)
               (LETT |#G11| (SPADCALL Q (QREFELT $ 26)) . #7#)
               (LETT |degP| |#G10| . #7#)
               (LETT |degQ| |#G11| . #7#))
              (EXIT
               (COND
                ((< |degP| |degQ|)
                 (VECTOR (|spadConstant| $ 8) (|spadConstant| $ 24) P))
                (#6#
                 (SEQ (LETT Q (SPADCALL Q (QREFELT $ 27)) . #7#)
                      (LETT |i|
                            (PROG1 (LETT #4# (+ (- |degP| |degQ|) 1) . #7#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            . #7#)
                      (LETT |co| (SPADCALL |lcQ| |i| (QREFELT $ 28)) . #7#)
                      (LETT |quot| (|spadConstant| $ 24) . #7#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (>=
                               (LETT |delta|
                                     (- (SPADCALL P (QREFELT $ 26)) |degQ|)
                                     . #7#)
                               0))
                             (GO G191)))
                           (SEQ
                            (LETT |i|
                                  (PROG1 (LETT #3# (- |i| 1) . #7#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  . #7#)
                            (LETT |mon|
                                  (SPADCALL (SPADCALL P (QREFELT $ 25))
                                            (PROG1 (LETT #2# |delta| . #7#)
                                              (|check_subtype| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               #2#))
                                            (QREFELT $ 11))
                                  . #7#)
                            (LETT |quot|
                                  (SPADCALL |quot|
                                            (SPADCALL
                                             (SPADCALL |lcQ| |i|
                                                       (QREFELT $ 28))
                                             |mon| (QREFELT $ 29))
                                            (QREFELT $ 30))
                                  . #7#)
                            (EXIT
                             (LETT P
                                   (SPADCALL
                                    (SPADCALL |lcQ| (SPADCALL P (QREFELT $ 27))
                                              (QREFELT $ 29))
                                    (SPADCALL |mon| Q (QREFELT $ 31))
                                    (QREFELT $ 32))
                                   . #7#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT P
                            (SPADCALL (SPADCALL |lcQ| |i| (QREFELT $ 28)) P
                                      (QREFELT $ 29))
                            . #7#)
                      (EXIT
                       (PROGN
                        (LETT #1# (VECTOR |co| |quot| P) . #7#)
                        (GO #8=#:G293)))))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |PRS;divide;2polRR;4|
        ((F |polR|) (G |polR|)
         ($ |Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
        (SPROG
         ((#1=#:G310 NIL) (|quot| (|polR|)) (|mon| (|polR|)) (#2=#:G303 NIL)
          (#3=#:G301 NIL) (|delta| (|Integer|)) (#4=#:G297 NIL)
          (|degG| (|NonNegativeInteger|)) (|lcG| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lcG| (SPADCALL G (QREFELT $ 25))
                  . #5=(|PRS;divide;2polRR;4|))
            (LETT |degG| (SPADCALL G (QREFELT $ 26)) . #5#)
            (EXIT
             (COND
              ((ZEROP |degG|)
               (SEQ
                (LETT F
                      (PROG2 (LETT #4# (SPADCALL F |lcG| (QREFELT $ 18)) . #5#)
                          (QCDR #4#)
                        (|check_union| (QEQCAR #4# 0) (QREFELT $ 7) #4#))
                      . #5#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS F (|spadConstant| $ 24)) . #5#)
                  (GO #6=#:G309)))))
              ('T
               (SEQ (LETT G (SPADCALL G (QREFELT $ 27)) . #5#)
                    (LETT |quot| (|spadConstant| $ 24) . #5#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (>=
                             (LETT |delta|
                                   (- (SPADCALL F (QREFELT $ 26)) |degG|)
                                   . #5#)
                             0))
                           (GO G191)))
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL F (QREFELT $ 25)) |lcG|
                                            (QREFELT $ 36))
                                           . #5#)
                                     (QCDR #3#)
                                   (|check_union| (QEQCAR #3# 0) (QREFELT $ 6)
                                                  #3#))
                                 (PROG1 (LETT #2# |delta| . #5#)
                                   (|check_subtype| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    #2#))
                                 (QREFELT $ 11))
                                . #5#)
                          (LETT |quot| (SPADCALL |quot| |mon| (QREFELT $ 30))
                                . #5#)
                          (EXIT
                           (LETT F
                                 (SPADCALL (SPADCALL F (QREFELT $ 27))
                                           (SPADCALL |mon| G (QREFELT $ 31))
                                           (QREFELT $ 32))
                                 . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS |quot| F) . #5#) (GO #6#)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |PRS;resultant_naif;2polRR;5| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|#G23| (|polR|)) (|#G22| (|polR|)) (|a| (R)) (#1=#:G315 NIL)
          (U (|polR|)) (#2=#:G322 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G21| #3#) (|#G20| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #4=(|PRS;resultant_naif;2polRR;5|))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #2# (|spadConstant| $ 35) . #4#)
                       (GO #5=#:G321)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G20| (SPADCALL P (QREFELT $ 26)) . #4#)
                        (LETT |#G21| (SPADCALL Q (QREFELT $ 26)) . #4#)
                        (LETT |degP| |#G20| . #4#)
                        (LETT |degQ| |#G21| . #4#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #4#)))))
                       (EXIT
                        (COND
                         ((ZEROP |degQ|)
                          (PROGN
                           (LETT #2#
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT $ 25)) |degP|
                                            (QREFELT $ 28))
                                           (QREFELT $ 40))
                                 . #4#)
                           (GO #5#)))
                         ('T
                          (SEQ
                           (LETT U (QCDR (SPADCALL P Q (QREFELT $ 38))) . #4#)
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT $ 25))
                                            (PROG1
                                                (LETT #1#
                                                      (- |degP|
                                                         (SPADCALL U
                                                                   (QREFELT $
                                                                            26)))
                                                      . #4#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 28))
                                           (QREFELT $ 40))
                                 . #4#)
                           (EXIT
                            (PROGN
                             (LETT |#G22| Q . #4#)
                             (LETT |#G23| U . #4#)
                             (LETT P |#G22| . #4#)
                             (LETT Q |#G23| . #4#))))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean_naif;2polRR;6|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|cf1| (|polR|)) (|old_cf2| (|polR|))
          (|old_cf1| (|polR|)) (|#G33| (|polR|)) (|#G32| (|polR|))
          (|#G31| (|polR|)) (|#G30| (|polR|)) (|#G29| (|polR|))
          (|#G28| (|polR|)) (|a| (R)) (#1=#:G332 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G339 NIL) (#3=#:G327 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G27| #4#) (|#G26| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;resultantEuclidean_naif;2polRR;6|))
            (LETT |old_cf1| (|spadConstant| $ 9) . #5#)
            (LETT |cf1| (|spadConstant| $ 24) . #5#)
            (LETT |old_cf2| (|spadConstant| $ 24) . #5#)
            (LETT |cf2| (|spadConstant| $ 9) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (|spadConstant| $ 24)
                                     (|spadConstant| $ 35))
                             . #5#)
                       (GO #6=#:G338)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G26| (SPADCALL P (QREFELT $ 26)) . #5#)
                        (LETT |#G27| (SPADCALL Q (QREFELT $ 26)) . #5#)
                        (LETT |degP| |#G26| . #5#)
                        (LETT |degQ| |#G27| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                                    (QREFELT $ 28))
                                          (QREFELT $ 40))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (VECTOR (SPADCALL |a| |cf1| (QREFELT $ 29))
                                          (SPADCALL |a| |cf2| (QREFELT $ 29))
                                          (SPADCALL |a|
                                                    (SPADCALL Q (QREFELT $ 25))
                                                    (QREFELT $ 40)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 38)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 26)))
                                                           . #5#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 40))
                             . #5#)
                       (PROGN
                        (LETT |#G28| Q . #5#)
                        (LETT |#G29| (QCDR |divid|) . #5#)
                        (LETT P |#G28| . #5#)
                        (LETT Q |#G29| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G30| |cf1| . #5#)
                         (LETT |#G31| |cf2| . #5#)
                         (LETT |#G32|
                               (SPADCALL |old_cf1|
                                         (SPADCALL (QCAR |divid|) |cf1|
                                                   (QREFELT $ 31))
                                         (QREFELT $ 32))
                               . #5#)
                         (LETT |#G33|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 31))
                                         (QREFELT $ 32))
                               . #5#)
                         (LETT |old_cf1| |#G30| . #5#)
                         (LETT |old_cf2| |#G31| . #5#)
                         (LETT |cf1| |#G32| . #5#)
                         (LETT |cf2| |#G33| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean_naif;2polRR;7|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|old_cf2| (|polR|)) (|#G41| (|polR|))
          (|#G40| (|polR|)) (|#G39| (|polR|)) (|#G38| (|polR|)) (|a| (R))
          (#1=#:G349 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G356 NIL) (#3=#:G344 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G37| #4#) (|#G36| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;semiResultantEuclidean_naif;2polRR;7|))
            (LETT |old_cf2| (|spadConstant| $ 24) . #5#)
            (LETT |cf2| (|spadConstant| $ 9) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 24) (|spadConstant| $ 35))
                             . #5#)
                       (GO #6=#:G355)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G36| (SPADCALL P (QREFELT $ 26)) . #5#)
                        (LETT |#G37| (SPADCALL Q (QREFELT $ 26)) . #5#)
                        (LETT |degP| |#G36| . #5#)
                        (LETT |degQ| |#G37| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       #3#))
                                                    (QREFELT $ 28))
                                          (QREFELT $ 40))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (CONS (SPADCALL |a| |cf2| (QREFELT $ 29))
                                        (SPADCALL |a|
                                                  (SPADCALL Q (QREFELT $ 25))
                                                  (QREFELT $ 40)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 38)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 26)))
                                                           . #5#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 (QREFELT $ 28))
                                       (QREFELT $ 40))
                             . #5#)
                       (PROGN
                        (LETT |#G38| Q . #5#)
                        (LETT |#G39| (QCDR |divid|) . #5#)
                        (LETT P |#G38| . #5#)
                        (LETT Q |#G39| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G40| |cf2| . #5#)
                         (LETT |#G41|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 31))
                                         (QREFELT $ 32))
                               . #5#)
                         (LETT |old_cf2| |#G40| . #5#)
                         (LETT |cf2| |#G41| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;Lazard;2RNniR;8|
        ((|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG
         ((#1=#:G362 NIL) (|c| (R)) (#2=#:G360 NIL)
          (|a| (|NonNegativeInteger|)) (#3=#:G369 NIL) (#4=#:G358 NIL)
          (|b| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|error| "Lazard$PRS : n = 0")) ((EQL |n| 1) |x|)
                 ('T
                  (SEQ (LETT |a| 1 . #5=(|PRS;Lazard;2RNniR;8|))
                       (SEQ G190
                            (COND
                             ((NULL
                               (>= |n|
                                   (LETT |b| (SPADCALL 2 |a| (QREFELT $ 47))
                                         . #5#)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |a| |b| . #5#))) NIL (GO G190)
                            G191 (EXIT NIL))
                       (LETT |c| |x| . #5#)
                       (LETT |n|
                             (PROG1 (LETT #4# (- |n| |a|) . #5#)
                               (|check_subtype| (>= #4# 0)
                                                '(|NonNegativeInteger|) #4#))
                             . #5#)
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL |a| 1)
                                 (PROGN (LETT #3# |c| . #5#) (GO #6=#:G368)))
                                ('T
                                 (SEQ (LETT |a| (QUOTIENT2 |a| 2) . #5#)
                                      (LETT |c|
                                            (PROG2
                                                (LETT #2#
                                                      (SPADCALL
                                                       (SPADCALL |c| |c|
                                                                 (QREFELT $
                                                                          40))
                                                       |y| (QREFELT $ 36))
                                                      . #5#)
                                                (QCDR #2#)
                                              (|check_union| (QEQCAR #2# 0)
                                                             (QREFELT $ 6)
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
                                                                              40))
                                                           |y| (QREFELT $ 36))
                                                          . #5#)
                                                    (QCDR #2#)
                                                  (|check_union| (QEQCAR #2# 0)
                                                                 (QREFELT $ 6)
                                                                 #2#))
                                                . #5#)
                                          (EXIT
                                           (LETT |n|
                                                 (PROG1
                                                     (LETT #1# (- |n| |a|)
                                                           . #5#)
                                                   (|check_subtype| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #1#))
                                                 . #5#)))))))))))
                             NIL (GO G190) G191 (EXIT NIL)))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PRS;Lazard2;polR2RNnipolR;9|
        ((F |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ |polR|))
        (SPROG ((#1=#:G377 NIL) (#2=#:G372 NIL) (#3=#:G370 NIL))
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
                                                   . #4=(|PRS;Lazard2;polR2RNnipolR;9|))
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 48))
                               . #4#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL
                                            (SPADCALL |x| F (QREFELT $ 29)) |y|
                                            (QREFELT $ 18))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union| (QEQCAR #2# 0) (QREFELT $ 7)
                                                  #2#))
                                 . #4#)
                           (GO #5=#:G376)))))))
                #5# (EXIT #1#)))) 

(SDEFUN |PRS;Lazard3|
        ((V |Vector| |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|)
         ($ |Vector| |polR|))
        (SPROG ((#1=#:G382 NIL) (#2=#:G378 NIL))
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
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 48))
                               . #3#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (SPADCALL |x| V (QREFELT $ 16)) |y|
                                           (QREFELT $ 21))
                                 . #3#)
                           (GO #4=#:G381)))))))
                #4# (EXIT #1#)))) 

(SDEFUN |PRS;next_sousResultant2;3polRRpolR;11|
        ((P |polR|) (Q |polR|) (Z |polR|) (|s| R) ($ |polR|))
        (SPROG
         ((#1=#:G394 NIL) (A (|polR|)) (#2=#:G384 NIL) (H (|polR|))
          (#3=#:G395 NIL) (|i| NIL) (|#G66| (|polR|)) (|#G65| (|polR|))
          (|#G64| (|polR|)) (|e| #4=(|NonNegativeInteger|)) (|d| #4#)
          (|#G63| #4#) (|#G62| #4#) (|se| (R)) (|c| (R)) (|lcP| (R))
          (|#G61| (R)) (|#G60| (R)) (|#G59| (R)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G59| (SPADCALL P (QREFELT $ 25))
                   . #5=(|PRS;next_sousResultant2;3polRRpolR;11|))
             (LETT |#G60| (SPADCALL Q (QREFELT $ 25)) . #5#)
             (LETT |#G61| (SPADCALL Z (QREFELT $ 25)) . #5#)
             (LETT |lcP| |#G59| . #5#)
             (LETT |c| |#G60| . #5#)
             (LETT |se| |#G61| . #5#))
            (PROGN
             (LETT |#G62| (SPADCALL P (QREFELT $ 26)) . #5#)
             (LETT |#G63| (SPADCALL Q (QREFELT $ 26)) . #5#)
             (LETT |d| |#G62| . #5#)
             (LETT |e| |#G63| . #5#))
            (PROGN
             (LETT |#G64| (SPADCALL P (QREFELT $ 27)) . #5#)
             (LETT |#G65| (SPADCALL Q (QREFELT $ 27)) . #5#)
             (LETT |#G66| (SPADCALL (SPADCALL Z (QREFELT $ 27)) (QREFELT $ 50))
                   . #5#)
             (LETT P |#G64| . #5#)
             (LETT Q |#G65| . #5#)
             (LETT H |#G66| . #5#))
            (LETT A (SPADCALL (SPADCALL P |e| (QREFELT $ 51)) H (QREFELT $ 29))
                  . #5#)
            (SEQ (LETT |i| (+ |e| 1) . #5#) (LETT #3# (- |d| 1) . #5#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (LETT H
                        (COND
                         ((EQL (SPADCALL H (QREFELT $ 26)) (- |e| 1))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 12) (SPADCALL H (QREFELT $ 27))
                                     (QREFELT $ 31))
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL H (QREFELT $ 25)) Q
                                                (QREFELT $ 29))
                                      |c| (QREFELT $ 18))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                           (QREFELT $ 32)))
                         ('T (SPADCALL (QREFELT $ 12) H (QREFELT $ 31))))
                        . #5#)
                  (EXIT
                   (LETT A
                         (SPADCALL
                          (SPADCALL (SPADCALL P |i| (QREFELT $ 51)) H
                                    (QREFELT $ 29))
                          A (QREFELT $ 30))
                         . #5#)))
                 (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (SEQ G190
                 (COND ((NULL (>= (SPADCALL P (QREFELT $ 26)) |e|)) (GO G191)))
                 (SEQ (EXIT (LETT P (SPADCALL P (QREFELT $ 27)) . #5#))) NIL
                 (GO G190) G191 (EXIT NIL))
            (LETT A
                  (SPADCALL A (SPADCALL |se| P (QREFELT $ 29)) (QREFELT $ 30))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |lcP| (QREFELT $ 18)) . #5#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                  . #5#)
            (LETT A
                  (COND
                   ((EQL (SPADCALL H (QREFELT $ 26)) (- |e| 1))
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (QREFELT $ 12)
                                          (SPADCALL H (QREFELT $ 27))
                                          (QREFELT $ 31))
                                A (QREFELT $ 30))
                               (QREFELT $ 29))
                     (SPADCALL (SPADCALL H (QREFELT $ 25)) Q (QREFELT $ 29))
                     (QREFELT $ 32)))
                   (#6='T
                    (SPADCALL |c|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 12) H (QREFELT $ 31)) A
                               (QREFELT $ 30))
                              (QREFELT $ 29))))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |s| (QREFELT $ 18)) . #5#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                  . #5#)
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP (- |d| |e|)) A)
                          (#6# (SPADCALL A (QREFELT $ 50))))
                    . #5#)
              (GO #7=#:G393)))))
          #7# (EXIT #1#)))) 

(SDEFUN |PRS;next_sousResultant3|
        ((VP |Vector| |polR|) (VQ |Vector| |polR|) (|s| R) (|ss| R)
         ($ |Vector| |polR|))
        (SPROG
         ((#1=#:G409 NIL) (#2=#:G400 NIL) (#3=#:G410 NIL) (|i| NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (|rr| (R)) (|r| (R)) (|#G77| (R)) (|#G76| (R)) (#4=#:G396 NIL)
          (|delta| (|Integer|)) (|e| (|NonNegativeInteger|)) (|c| (R))
          (|lcP| (R)) (|#G75| (R)) (|#G74| (R)) (Q (|polR|)) (P (|polR|))
          (|#G73| (|polR|)) (|#G72| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G72| (SPADCALL VP 1 (QREFELT $ 54))
                   . #5=(|PRS;next_sousResultant3|))
             (LETT |#G73| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
             (LETT P |#G72| . #5#)
             (LETT Q |#G73| . #5#))
            (PROGN
             (LETT |#G74| (SPADCALL P (QREFELT $ 25)) . #5#)
             (LETT |#G75| (SPADCALL Q (QREFELT $ 25)) . #5#)
             (LETT |lcP| |#G74| . #5#)
             (LETT |c| |#G75| . #5#))
            (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
            (SEQ (LETT |delta| (- (SPADCALL P (QREFELT $ 26)) |e|) . #5#)
                 (EXIT
                  (COND
                   ((EQL |delta| 1)
                    (SEQ
                     (LETT VP
                           (SPADCALL (SPADCALL |c| VP (QREFELT $ 16))
                                     (SPADCALL (SPADCALL P |e| (QREFELT $ 51))
                                               VQ (QREFELT $ 16))
                                     (QREFELT $ 55))
                           . #5#)
                     (LETT VP (SPADCALL VP |lcP| (QREFELT $ 21)) . #5#)
                     (LETT VP
                           (SPADCALL
                            (SPADCALL |c|
                                      (SPADCALL VP
                                                (SPADCALL (QREFELT $ 12) VQ
                                                          (QREFELT $ 15))
                                                (QREFELT $ 55))
                                      (QREFELT $ 16))
                            (SPADCALL
                             (SPADCALL Q
                                       (PROG1 (LETT #4# (- |e| 1) . #5#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       (QREFELT $ 51))
                             VQ (QREFELT $ 16))
                            (QREFELT $ 56))
                           . #5#)
                     (EXIT (LETT VP (SPADCALL VP |s| (QREFELT $ 21)) . #5#))))
                   (#6='T
                    (SEQ
                     (PROGN
                      (LETT |#G76| (SPADCALL |s| |lcP| (QREFELT $ 40)) . #5#)
                      (LETT |#G77| (SPADCALL |ss| |c| (QREFELT $ 40)) . #5#)
                      (LETT |r| |#G76| . #5#)
                      (LETT |rr| |#G77| . #5#))
                     (LETT |divid|
                           (SPADCALL (SPADCALL |rr| P (QREFELT $ 29)) Q
                                     (QREFELT $ 38))
                           . #5#)
                     (SPADCALL VP 1
                               (PROG2
                                   (LETT #2#
                                         (SPADCALL (QCDR |divid|) |r|
                                                   (QREFELT $ 18))
                                         . #5#)
                                   (QCDR #2#)
                                 (|check_union| (QEQCAR #2# 0) (QREFELT $ 7)
                                                #2#))
                               (QREFELT $ 57))
                     (EXIT
                      (SEQ (LETT |i| 2 . #5#) (LETT #3# (QVSIZE VP) . #5#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (SPADCALL VP |i|
                                      (SPADCALL
                                       (SPADCALL |rr|
                                                 (SPADCALL VP |i|
                                                           (QREFELT $ 54))
                                                 (QREFELT $ 29))
                                       (SPADCALL
                                        (SPADCALL VQ |i| (QREFELT $ 54))
                                        (QCAR |divid|) (QREFELT $ 31))
                                       (QREFELT $ 32))
                                      (QREFELT $ 57))
                            (EXIT
                             (SPADCALL VP |i|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL VP |i|
                                                            (QREFELT $ 54))
                                                  |r| (QREFELT $ 18))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union| (QEQCAR #2# 0)
                                                        (QREFELT $ 7) #2#))
                                       (QREFELT $ 57))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))))))))
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP |delta|) VP)
                          (#6# (SPADCALL VP (QREFELT $ 58))))
                    . #5#)
              (GO #7=#:G408)))))
          #7# (EXIT #1#)))) 

(SDEFUN |PRS;algo_new| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|s| (R)) (|#G84| (|polR|)) (|#G83| (|polR|)) (#1=#:G419 NIL)
          (Z (|polR|)) (|delta| (|NonNegativeInteger|)) (#2=#:G412 NIL)
          (|#G82| (|polR|)) (|#G81| (|polR|)) (#3=#:G411 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |delta|
                  (PROG1
                      (LETT #3#
                            (- (SPADCALL P (QREFELT $ 26))
                               (SPADCALL Q (QREFELT $ 26)))
                            . #4=(|PRS;algo_new|))
                    (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                  . #4#)
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 25)) |delta| (QREFELT $ 28))
                  . #4#)
            (PROGN
             (LETT |#G81| Q . #4#)
             (LETT |#G82|
                   (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 59))
                   . #4#)
             (LETT P |#G81| . #4#)
             (LETT Q |#G82| . #4#))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #1# (|spadConstant| $ 35) . #4#)
                       (GO #5=#:G418)))
                     ('T
                      (SEQ
                       (LETT |delta|
                             (PROG1
                                 (LETT #2#
                                       (- (SPADCALL P (QREFELT $ 26))
                                          (SPADCALL Q (QREFELT $ 26)))
                                       . #4#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             . #4#)
                       (LETT Z
                             (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                       |delta| (QREFELT $ 49))
                             . #4#)
                       (EXIT
                        (COND
                         ((ZEROP (SPADCALL Z (QREFELT $ 26)))
                          (PROGN
                           (LETT #1# (SPADCALL Z (QREFELT $ 25)) . #4#)
                           (GO #5#)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G83| Q . #4#)
                            (LETT |#G84| (SPADCALL P Q Z |s| (QREFELT $ 52))
                                  . #4#)
                            (LETT P |#G83| . #4#)
                            (LETT Q |#G84| . #4#))
                           (EXIT
                            (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                  . #4#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;resultant;2polRR;14| ((P |polR|) (Q |polR|) ($ R))
        (SPROG ((#1=#:G427 NIL) (|#G88| (|polR|)) (|#G87| (|polR|)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
                   (|spadConstant| $ 35))
                  ('T
                   (SEQ
                    (COND
                     ((< (SPADCALL P (QREFELT $ 26))
                         (SPADCALL Q (QREFELT $ 26)))
                      (SEQ
                       (PROGN
                        (LETT |#G87| Q . #2=(|PRS;resultant;2polRR;14|))
                        (LETT |#G88| P . #2#)
                        (LETT P |#G87| . #2#)
                        (LETT Q |#G88| . #2#))
                       (EXIT
                        (COND
                         ((ODDP (SPADCALL P (QREFELT $ 26)))
                          (COND
                           ((ODDP (SPADCALL Q (QREFELT $ 26)))
                            (LETT Q (SPADCALL Q (QREFELT $ 50)) . #2#)))))))))
                    (EXIT
                     (COND
                      ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (SPADCALL P (QREFELT $ 26)) (QREFELT $ 28)))
                      ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                       (SPADCALL P Q (QREFELT $ 41)))
                      ('T
                       (PROGN
                        (LETT #1# (|PRS;algo_new| P Q $) . #2#)
                        (GO #3=#:G426)))))))))
                #3# (EXIT #1#)))) 

(SDEFUN |PRS;subResultantEuclidean|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G94| (|Vector| |polR|)) (|#G93| #1#) (|ss| (R)) (#2=#:G440 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G432 NIL) (|e| (|NonNegativeInteger|)) (|#G92| (|polR|))
          (|#G91| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G430 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 26))
                                         (SPADCALL Q (QREFELT $ 26)))
                                      . #5=(|PRS;subResultantEuclidean|))
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            (QREFELT $ 28))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                  . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                  . #5#)
            (LETT VQ
                  (VECTOR (QVELT |pdiv| 2)
                          (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                          (QVELT |pdiv| 1))
                  . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G91| (SPADCALL VP 1 (QREFELT $ 54)) . #5#)
                    (LETT |#G92| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
                    (LETT P |#G91| . #5#)
                    (LETT Q |#G92| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (|spadConstant| $ 24)
                                     (|spadConstant| $ 35))
                             . #5#)
                       (GO #6=#:G439)))
                     ('T
                      (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 26)) |e|)
                                           . #5#)
                                   (|check_subtype| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                 . #5#)
                           (COND
                            ((ZEROP |e|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT $ 25)) |s| |delta| $)
                                    . #5#)
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (VECTOR (SPADCALL |l| 2 (QREFELT $ 54))
                                              (SPADCALL |l| 3 (QREFELT $ 54))
                                              (SPADCALL
                                               (SPADCALL |l| 1 (QREFELT $ 54))
                                               (QREFELT $ 25)))
                                      . #5#)
                                (GO #6#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                           |delta| (QREFELT $ 48))
                                 . #5#)
                           (PROGN
                            (LETT |#G93| VQ . #5#)
                            (LETT |#G94|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #5#)
                            (LETT VP |#G93| . #5#)
                            (LETT VQ |#G94| . #5#))
                           (EXIT (LETT |s| |ss| . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;16|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((#1=#:G454 NIL) (|s| (R)) (#2=#:G448 NIL)
          (|degP| (|NonNegativeInteger|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|e| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL P (QREFELT $ 23)) (SPADCALL Q (QREFELT $ 23)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 35)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (SPADCALL P (QREFELT $ 26)))
                         (COND ((ODDP (SPADCALL Q (QREFELT $ 26))) -1)
                               (#3='T 1)))
                        (#3# 1))
                       . #4=(|PRS;resultantEuclidean;2polRR;16|))
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
                   (GO #5=#:G453))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 26)) . #4#)
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "resultantEuclidean$PRS : constant polynomials"))
                       (#3#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                         (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 28))
                               . #4#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (VECTOR (|spadConstant| $ 24)
                                         (SPADCALL |s| (QREFELT $ 13))
                                         (SPADCALL |s|
                                                   (SPADCALL Q (QREFELT $ 25))
                                                   (QREFELT $ 40)))
                                 . #4#)
                           (GO #5#))))))))))
              (EXIT
               (COND
                ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                 (SPADCALL P Q (QREFELT $ 43)))
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
          (|#G102| (|Vector| |polR|)) (|#G101| #1#) (|ss| (R)) (#2=#:G467 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G459 NIL) (|e| (|NonNegativeInteger|)) (|#G100| (|polR|))
          (|#G99| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G457 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 26))
                                         (SPADCALL Q (QREFELT $ 26)))
                                      . #5=(|PRS;semiSubResultantEuclidean|))
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            (QREFELT $ 28))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                  . #5#)
            (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G99| (SPADCALL VP 1 (QREFELT $ 54)) . #5#)
                    (LETT |#G100| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
                    (LETT P |#G99| . #5#)
                    (LETT Q |#G100| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 24) (|spadConstant| $ 35))
                             . #5#)
                       (GO #6=#:G466)))
                     ('T
                      (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 26)) |e|)
                                           . #5#)
                                   (|check_subtype| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                 . #5#)
                           (COND
                            ((ZEROP |e|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT $ 25)) |s| |delta| $)
                                    . #5#)
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (CONS (SPADCALL |l| 2 (QREFELT $ 54))
                                            (SPADCALL
                                             (SPADCALL |l| 1 (QREFELT $ 54))
                                             (QREFELT $ 25)))
                                      . #5#)
                                (GO #6#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                           |delta| (QREFELT $ 48))
                                 . #5#)
                           (PROGN
                            (LETT |#G101| VQ . #5#)
                            (LETT |#G102|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #5#)
                            (LETT VP |#G101| . #5#)
                            (LETT VQ |#G102| . #5#))
                           (EXIT (LETT |s| |ss| . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;18|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((#1=#:G478 NIL) (|s| (R)) (#2=#:G471 NIL)
          (|degP| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL P (QREFELT $ 23)) (SPADCALL Q (QREFELT $ 23)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 35)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
               (|error| "semiResultantEuclidean2 : bad degrees"))
              (#3='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                  (SEQ
                   (LETT |degP| (SPADCALL P (QREFELT $ 26))
                         . #4=(|PRS;semiResultantEuclidean2;2polRR;18|))
                   (EXIT
                    (COND
                     ((ZEROP |degP|)
                      (|error|
                       "semiResultantEuclidean2 : constant polynomials"))
                     (#3#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                       (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                         (|check_subtype| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          #2#))
                                       (QREFELT $ 28))
                             . #4#)
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (CONS (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| (SPADCALL Q (QREFELT $ 25))
                                               (QREFELT $ 40)))
                               . #4#)
                         (GO #5=#:G477))))))))))
                (EXIT
                 (COND
                  ((|HasCategory| (QREFELT $ 6) '(|Finite|))
                   (SPADCALL P Q (QREFELT $ 45)))
                  (#3#
                   (PROGN
                    (LETT #1# (|PRS;semiSubResultantEuclidean| P Q $) . #4#)
                    (GO #5#)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;semiResultantEuclidean1;2polRR;19|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 62))
                |PRS;semiResultantEuclidean1;2polRR;19|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;indiceSubResultant;2polRNnipolR;20|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G117| (|polR|)) (|#G116| (|polR|)) (#1=#:G505 NIL)
          (Z (|polR|)) (#2=#:G497 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G115| #3#) (|#G114| #3#) (|#G113| (|polR|))
          (|#G112| (|polR|)) (#4=#:G495 NIL) (#5=#:G490 NIL)
          (|delta| (|NonNegativeInteger|)) (#6=#:G488 NIL) (|#G111| (|polR|))
          (|#G110| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (PROGN
                  (LETT |#G110| Q
                        . #7=(|PRS;indiceSubResultant;2polRNnipolR;20|))
                  (LETT |#G111| P . #7#)
                  (LETT P |#G110| . #7#)
                  (LETT Q |#G111| . #7#))
                 (EXIT
                  (COND
                   ((ODDP (- (SPADCALL P (QREFELT $ 26)) |i|))
                    (COND
                     ((ODDP (- (SPADCALL Q (QREFELT $ 26)) |i|))
                      (LETT Q (SPADCALL Q (QREFELT $ 50)) . #7#)))))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 26))
                                    (SPADCALL Q (QREFELT $ 26)))
                                 . #7#)
                         (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                          #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultant$PRS : bad degrees"))
                   (#8='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        #5#))
                                     (QREFELT $ 28))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #1# (SPADCALL |s| Q (QREFELT $ 29)) . #7#)
                       (GO #9=#:G504))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                 (|spadConstant| $ 24))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #7#)
                                    (|check_subtype| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     #4#))
                                  (QREFELT $ 28))
                        . #7#)
                  (PROGN
                   (LETT |#G112| Q . #7#)
                   (LETT |#G113|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                   (QREFELT $ 59))
                         . #7#)
                   (LETT P |#G112| . #7#)
                   (LETT Q |#G113| . #7#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G114| (SPADCALL P (QREFELT $ 26)) . #7#)
                          (LETT |#G115| (SPADCALL Q (QREFELT $ 26)) . #7#)
                          (LETT |degP| |#G114| . #7#)
                          (LETT |degQ| |#G115| . #7#))
                         (EXIT
                          (COND
                           ((EQL |i| (- |degP| 1))
                            (PROGN (LETT #1# Q . #7#) (GO #9#)))
                           ((OR (SPADCALL Q (QREFELT $ 23))
                                (SPADCALL |i| |degQ| (QREFELT $ 66)))
                            (PROGN
                             (LETT #1# (|spadConstant| $ 24) . #7#)
                             (GO #9#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                             (PROG1
                                                 (LETT #2# (- |degP| |degQ|)
                                                       . #7#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             (QREFELT $ 49))
                                   . #7#)
                             (EXIT
                              (COND
                               ((EQL |i| |degQ|)
                                (PROGN (LETT #1# Z . #7#) (GO #9#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G116| Q . #7#)
                                  (LETT |#G117|
                                        (SPADCALL P Q Z |s| (QREFELT $ 52))
                                        . #7#)
                                  (LETT P |#G116| . #7#)
                                  (LETT Q |#G117| . #7#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                        . #7#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;indiceSubResultantEuclidean;2polRNniR;21|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G130| (|Vector| |polR|)) (|#G129| #1#) (|ss| (R)) (#2=#:G531 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G522 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G128| #4#)
          (|#G127| #4#) (|#G126| (|polR|)) (|#G125| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G520 NIL) (#6=#:G515 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G513 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (|e| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (- (SPADCALL P (QREFELT $ 26)) |i|))
                         (COND
                          ((ODDP (- (SPADCALL Q (QREFELT $ 26)) |i|))
                           (SPADCALL (|spadConstant| $ 8) (QREFELT $ 39)))
                          (#8='T (|spadConstant| $ 8))))
                        (#8# (|spadConstant| $ 8)))
                       . #9=(|PRS;indiceSubResultantEuclidean;2polRNniR;21|))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 29)) |i|
                                 (QREFELT $ 69))
                       . #9#)
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 29))
                                 (QVELT |l| 0) (QVELT |l| 2))
                         . #9#)
                   (GO #10=#:G530))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #7#
                                 (- (SPADCALL P (QREFELT $ 26))
                                    (SPADCALL Q (QREFELT $ 26)))
                                 . #9#)
                         (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                          #7#))
                       . #9#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultantEuclidean$PRS : bad degrees"))
                   (#8#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                       (|check_subtype| (>= #6# 0)
                                                        '(|NonNegativeInteger|)
                                                        #6#))
                                     (QREFELT $ 28))
                           . #9#)
                     (EXIT
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                             . #9#)
                       (GO #10#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                  (PROG1
                                      (LETT #5#
                                            (- (SPADCALL P (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #9#)
                                    (|check_subtype| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     #5#))
                                  (QREFELT $ 28))
                        . #9#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                        . #9#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                        . #9#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                                (QVELT |pdiv| 1))
                        . #9#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G125| (SPADCALL VP 1 (QREFELT $ 54)) . #9#)
                          (LETT |#G126| (SPADCALL VQ 1 (QREFELT $ 54)) . #9#)
                          (LETT P |#G125| . #9#)
                          (LETT Q |#G126| . #9#))
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 23))
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
                              (LETT |#G127| (SPADCALL P (QREFELT $ 26)) . #9#)
                              (LETT |#G128| (SPADCALL Q (QREFELT $ 26)) . #9#)
                              (LETT |degP| |#G127| . #9#)
                              (LETT |degQ| |#G128| . #9#))
                             (EXIT
                              (COND
                               ((EQL |i| (- |degP| 1))
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (SPADCALL VQ 2 (QREFELT $ 54))
                                               (SPADCALL VQ 3 (QREFELT $ 54))
                                               (SPADCALL VQ 1 (QREFELT $ 54)))
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
                                        (SPADCALL Q (QREFELT $ 25)) |s|
                                        (PROG1
                                            (LETT #3# (- |degP| |degQ|) . #9#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        $)
                                       . #9#)
                                 (EXIT
                                  (COND
                                   ((EQL |i| |degQ|)
                                    (PROGN
                                     (LETT #2#
                                           (VECTOR
                                            (SPADCALL VZ 2 (QREFELT $ 54))
                                            (SPADCALL VZ 3 (QREFELT $ 54))
                                            (SPADCALL VZ 1 (QREFELT $ 54)))
                                           . #9#)
                                     (GO #10#)))
                                   ('T
                                    (SEQ
                                     (LETT |ss|
                                           (SPADCALL
                                            (SPADCALL VZ 1 (QREFELT $ 54))
                                            (QREFELT $ 25))
                                           . #9#)
                                     (PROGN
                                      (LETT |#G129| VQ . #9#)
                                      (LETT |#G130|
                                            (|PRS;next_sousResultant3| VP VQ
                                             |s| |ss| $)
                                            . #9#)
                                      (LETT VP |#G129| . #9#)
                                      (LETT VQ |#G130| . #9#))
                                     (EXIT (LETT |s| |ss| . #9#)))))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;semiIndiceSubResultantEuclidean;2polRNniR;22|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G139| (|Vector| |polR|)) (|#G138| #1#) (|ss| (R)) (#2=#:G555 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G544 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G137| #4#)
          (|#G136| #4#) (|#G135| (|polR|)) (|#G134| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G542 NIL) (#6=#:G537 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G535 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
               (|error| "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
              (#8='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #7#
                                   (- (SPADCALL P (QREFELT $ 26))
                                      (SPADCALL Q (QREFELT $ 26)))
                                   . #9=(|PRS;semiIndiceSubResultantEuclidean;2polRNniR;22|))
                           (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                            #7#))
                         . #9#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
                     (#8#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                       (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                         (|check_subtype| (>= #6# 0)
                                                          '(|NonNegativeInteger|)
                                                          #6#))
                                       (QREFELT $ 28))
                             . #9#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                               . #9#)
                         (GO #10=#:G554))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                   (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
                  (#8#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                    (PROG1
                                        (LETT #5#
                                              (- (SPADCALL P (QREFELT $ 26))
                                                 (SPADCALL Q (QREFELT $ 26)))
                                              . #9#)
                                      (|check_subtype| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       #5#))
                                    (QREFELT $ 28))
                          . #9#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #9#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                    (QREFELT $ 34))
                          . #9#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #9#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G134| (SPADCALL VP 1 (QREFELT $ 54)) . #9#)
                            (LETT |#G135| (SPADCALL VQ 1 (QREFELT $ 54)) . #9#)
                            (LETT P |#G134| . #9#)
                            (LETT Q |#G135| . #9#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 23))
                              (PROGN
                               (LETT #2#
                                     (CONS (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                     . #9#)
                               (GO #10#)))
                             ('T
                              (SEQ
                               (PROGN
                                (LETT |#G136| (SPADCALL P (QREFELT $ 26))
                                      . #9#)
                                (LETT |#G137| (SPADCALL Q (QREFELT $ 26))
                                      . #9#)
                                (LETT |degP| |#G136| . #9#)
                                (LETT |degQ| |#G137| . #9#))
                               (EXIT
                                (COND
                                 ((EQL |i| (- |degP| 1))
                                  (PROGN
                                   (LETT #2#
                                         (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                               (SPADCALL VQ 1 (QREFELT $ 54)))
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
                                          (SPADCALL Q (QREFELT $ 25)) |s|
                                          (PROG1
                                              (LETT #3# (- |degP| |degQ|)
                                                    . #9#)
                                            (|check_subtype| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             #3#))
                                          $)
                                         . #9#)
                                   (EXIT
                                    (COND
                                     ((EQL |i| |degQ|)
                                      (PROGN
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL VZ 2 (QREFELT $ 54))
                                              (SPADCALL VZ 1 (QREFELT $ 54)))
                                             . #9#)
                                       (GO #10#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL VZ 1 (QREFELT $ 54))
                                              (QREFELT $ 25))
                                             . #9#)
                                       (PROGN
                                        (LETT |#G138| VQ . #9#)
                                        (LETT |#G139|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #9#)
                                        (LETT VP |#G138| . #9#)
                                        (LETT VQ |#G139| . #9#))
                                       (EXIT
                                        (LETT |s| |ss| . #9#)))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultant;2polRNnipolR;23|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G152| (|polR|)) (|#G151| (|polR|)) (Z (|polR|))
          (#1=#:G569 NIL) (#2=#:G576 NIL) (|#G150| (|polR|)) (|#G149| (|polR|))
          (#3=#:G566 NIL) (#4=#:G561 NIL) (|delta| (|NonNegativeInteger|))
          (#5=#:G559 NIL) (|#G148| (|polR|)) (|#G147| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (PROGN
                 (LETT |#G147| Q
                       . #6=(|PRS;degreeSubResultant;2polRNnipolR;23|))
                 (LETT |#G148| P . #6#)
                 (LETT P |#G147| . #6#)
                 (LETT Q |#G148| . #6#))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #5#
                                 (- (SPADCALL P (QREFELT $ 26))
                                    (SPADCALL Q (QREFELT $ 26)))
                                 . #6#)
                         (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                          #5#))
                       . #6#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultant$PRS : bad degrees"))
                   (#7='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                       (|check_subtype| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        #4#))
                                     (QREFELT $ 28))
                           . #6#)
                     (EXIT
                      (PROGN
                       (LETT #2# (SPADCALL |s| Q (QREFELT $ 29)) . #6#)
                       (GO #8=#:G575))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                 (|spadConstant| $ 24))
                (#7#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #6#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  (QREFELT $ 28))
                        . #6#)
                  (PROGN
                   (LETT |#G149| Q . #6#)
                   (LETT |#G150|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                   (QREFELT $ 59))
                         . #6#)
                   (LETT P |#G149| . #6#)
                   (LETT Q |#G150| . #6#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((OR (SPADCALL Q (QREFELT $ 23))
                                (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
                                          (QREFELT $ 66)))
                            (PROGN
                             (LETT #2# (|spadConstant| $ 24) . #6#)
                             (GO #8#)))
                           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                            (PROGN (LETT #2# Q . #6#) (GO #8#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                             (PROG1
                                                 (LETT #1#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           26))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           26)))
                                                       . #6#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             (QREFELT $ 49))
                                   . #6#)
                             (PROGN
                              (LETT |#G151| Q . #6#)
                              (LETT |#G152| (SPADCALL P Q Z |s| (QREFELT $ 52))
                                    . #6#)
                              (LETT P |#G151| . #6#)
                              (LETT Q |#G152| . #6#))
                             (EXIT
                              (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                    . #6#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultantEuclidean;2polRNniR;24|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G162| (|Vector| |polR|)) (|#G161| #1#) (|ss| (R)) (#2=#:G593 NIL)
          (#3=#:G600 NIL) (|#G160| (|polR|)) (|#G159| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G589 NIL) (#5=#:G584 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G582 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |l| (SPADCALL Q P |i| (QREFELT $ 73))
                       . #7=(|PRS;degreeSubResultantEuclidean;2polRNniR;24|))
                 (EXIT
                  (PROGN
                   (LETT #3# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #7#)
                   (GO #8=#:G599))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 26))
                                    (SPADCALL Q (QREFELT $ 26)))
                                 . #7#)
                         (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                          #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultantEuclidean$PRS : bad degrees"))
                   (#9='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        #5#))
                                     (QREFELT $ 28))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #3#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                             . #7#)
                       (GO #8#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))
                (#9#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #7#)
                                    (|check_subtype| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     #4#))
                                  (QREFELT $ 28))
                        . #7#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                        . #7#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                        . #7#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                                (QVELT |pdiv| 1))
                        . #7#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G159| (SPADCALL VP 1 (QREFELT $ 54)) . #7#)
                          (LETT |#G160| (SPADCALL VQ 1 (QREFELT $ 54)) . #7#)
                          (LETT P |#G159| . #7#)
                          (LETT Q |#G160| . #7#))
                         (COND
                          ((OR (SPADCALL Q (QREFELT $ 23))
                               (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
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
                           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                            (PROGN
                             (LETT #3#
                                   (VECTOR (SPADCALL VQ 2 (QREFELT $ 54))
                                           (SPADCALL VQ 3 (QREFELT $ 54))
                                           (SPADCALL VQ 1 (QREFELT $ 54)))
                                   . #7#)
                             (GO #8#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           26))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           26)))
                                                       . #7#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             (QREFELT $ 48))
                                   . #7#)
                             (PROGN
                              (LETT |#G161| VQ . #7#)
                              (LETT |#G162|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #7#)
                              (LETT VP |#G161| . #7#)
                              (LETT VQ |#G162| . #7#))
                             (EXIT (LETT |s| |ss| . #7#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |PRS;semiDegreeSubResultantEuclidean;2polRNniR;25|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G169| (|Vector| |polR|)) (|#G168| #1#) (|ss| (R)) (#2=#:G615 NIL)
          (#3=#:G623 NIL) (|#G167| (|polR|)) (|#G166| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G611 NIL) (#5=#:G606 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G604 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
               (|error| "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
              (#7='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #6#
                                   (- (SPADCALL P (QREFELT $ 26))
                                      (SPADCALL Q (QREFELT $ 26)))
                                   . #8=(|PRS;semiDegreeSubResultantEuclidean;2polRNniR;25|))
                           (|check_subtype| (>= #6# 0) '(|NonNegativeInteger|)
                                            #6#))
                         . #8#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
                     (#7#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                       (PROG1 (LETT #5# (- |delta| 1) . #8#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 28))
                             . #8#)
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (CONS (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                               . #8#)
                         (GO #9=#:G622))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
                   (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
                  (#7#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 26))
                                                 (SPADCALL Q (QREFELT $ 26)))
                                              . #8#)
                                      (|check_subtype| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       #4#))
                                    (QREFELT $ 28))
                          . #8#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #8#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                    (QREFELT $ 34))
                          . #8#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #8#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G166| (SPADCALL VP 1 (QREFELT $ 54)) . #8#)
                            (LETT |#G167| (SPADCALL VQ 1 (QREFELT $ 54)) . #8#)
                            (LETT P |#G166| . #8#)
                            (LETT Q |#G167| . #8#))
                           (COND
                            ((OR (SPADCALL Q (QREFELT $ 23))
                                 (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
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
                             ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                              (PROGN
                               (LETT #3#
                                     (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                           (SPADCALL VQ 1 (QREFELT $ 54)))
                                     . #8#)
                               (GO #9#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                               (PROG1
                                                   (LETT #2#
                                                         (-
                                                          (SPADCALL P
                                                                    (QREFELT $
                                                                             26))
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             26)))
                                                         . #8#)
                                                 (|check_subtype| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  #2#))
                                               (QREFELT $ 48))
                                     . #8#)
                               (PROGN
                                (LETT |#G168| VQ . #8#)
                                (LETT |#G169|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #8#)
                                (LETT VP |#G168| . #8#)
                                (LETT VQ |#G169| . #8#))
                               (EXIT (LETT |s| |ss| . #8#)))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |PRS;lastSubResultant;3polR;26| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G180| (|polR|)) (|#G179| (|polR|)) (#1=#:G637 NIL)
          (Z (|polR|)) (#2=#:G629 NIL) (|#G178| (|polR|)) (|#G177| (|polR|))
          (#3=#:G628 NIL) (|#G176| (|polR|)) (|#G175| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (|spadConstant| $ 24))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (PROGN
                 (LETT |#G175| Q . #4=(|PRS;lastSubResultant;3polR;26|))
                 (LETT |#G176| P . #4#)
                 (LETT P |#G175| . #4#)
                 (LETT Q |#G176| . #4#))))
              (EXIT
               (COND
                ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                 (SPADCALL
                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                            (SPADCALL P (QREFELT $ 26)) (QREFELT $ 28))
                  (QREFELT $ 13)))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #4#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  (QREFELT $ 28))
                        . #4#)
                  (PROGN
                   (LETT |#G177| Q . #4#)
                   (LETT |#G178|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                   (QREFELT $ 59))
                         . #4#)
                   (LETT P |#G177| . #4#)
                   (LETT Q |#G178| . #4#))
                  (LETT Z P . #4#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 23))
                            (PROGN (LETT #1# Z . #4#) (GO #5=#:G636)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           26))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           26)))
                                                       . #4#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             (QREFELT $ 49))
                                   . #4#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL Z (QREFELT $ 26)))
                                (PROGN (LETT #1# Z . #4#) (GO #5#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G179| Q . #4#)
                                  (LETT |#G180|
                                        (SPADCALL P Q Z |s| (QREFELT $ 52))
                                        . #4#)
                                  (LETT P |#G179| . #4#)
                                  (LETT Q |#G180| . #4#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                        . #4#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;lastSubResultantEuclidean;2polRR;27|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G186| (|Vector| |polR|)) (|#G185| #1#) (|ss| (R)) (#2=#:G658 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G651 NIL) (Z (|polR|))
          (|#G184| (|polR|)) (|#G183| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G649 NIL) (#5=#:G644 NIL) (|degP| (|NonNegativeInteger|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (LETT |l| (SPADCALL Q P (QREFELT $ 76))
                       . #6=(|PRS;lastSubResultantEuclidean;2polRR;27|))
                 (EXIT
                  (PROGN
                   (LETT #2# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #6#)
                   (GO #7=#:G657))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 26)) . #6#)
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "lastSubResultantEuclidean$PRS : constant polynomials"))
                       ('T
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                         (PROG1 (LETT #5# (- |degP| 1) . #6#)
                                           (|check_subtype| (>= #5# 0)
                                                            '(|NonNegativeInteger|)
                                                            #5#))
                                         (QREFELT $ 28))
                               . #6#)
                         (EXIT
                          (PROGN
                           (LETT #2#
                                 (VECTOR (|spadConstant| $ 24)
                                         (SPADCALL |s| (QREFELT $ 13))
                                         (SPADCALL |s| Q (QREFELT $ 29)))
                                 . #6#)
                           (GO #7#))))))))))
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #6#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 28))
                    . #6#)
              (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                    . #6#)
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                    . #6#)
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                            (QVELT |pdiv| 1))
                    . #6#)
              (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #6#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G183| (SPADCALL VQ 1 (QREFELT $ 54)) . #6#)
                      (LETT |#G184| (SPADCALL VZ 1 (QREFELT $ 54)) . #6#)
                      (LETT Q |#G183| . #6#)
                      (LETT Z |#G184| . #6#))
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT $ 23))
                        (PROGN
                         (LETT #2#
                               (VECTOR (SPADCALL VZ 2 (QREFELT $ 54))
                                       (SPADCALL VZ 3 (QREFELT $ 54))
                                       (SPADCALL VZ 1 (QREFELT $ 54)))
                               . #6#)
                         (GO #7#)))
                       ('T
                        (SEQ
                         (LETT VZ
                               (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25))
                                |s|
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL Z (QREFELT $ 26))
                                             (SPADCALL Q (QREFELT $ 26)))
                                          . #6#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                $)
                               . #6#)
                         (EXIT
                          (COND
                           ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                            (PROGN
                             (LETT #2#
                                   (VECTOR (SPADCALL VZ 2 (QREFELT $ 54))
                                           (SPADCALL VZ 3 (QREFELT $ 54))
                                           (SPADCALL VZ 1 (QREFELT $ 54)))
                                   . #6#)
                             (GO #7#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL VZ 1 (QREFELT $ 54))
                                             (QREFELT $ 25))
                                   . #6#)
                             (PROGN
                              (LETT |#G185| VQ . #6#)
                              (LETT |#G186|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #6#)
                              (LETT VP |#G185| . #6#)
                              (LETT VQ |#G186| . #6#))
                             (EXIT (LETT |s| |ss| . #6#)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |PRS;semiLastSubResultantEuclidean;2polRR;28|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G192| (|Vector| |polR|)) (|#G191| #1#) (|ss| (R)) (#2=#:G678 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G670 NIL) (Z (|polR|))
          (|#G190| (|polR|)) (|#G189| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G668 NIL) (#5=#:G663 NIL) (|degP| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
             (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
               (|error| "semiLastSubResultantEuclidean$PRS : bad degrees"))
              (#6='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                  (SEQ
                   (LETT |degP| (SPADCALL P (QREFELT $ 26))
                         . #7=(|PRS;semiLastSubResultantEuclidean;2polRR;28|))
                   (EXIT
                    (COND
                     ((ZEROP |degP|)
                      (|error|
                       "semiLastSubResultantEuclidean$PRS : constant polynomials"))
                     (#6#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                       (PROG1 (LETT #5# (- |degP| 1) . #7#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 28))
                             . #7#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                               . #7#)
                         (GO #8=#:G677))))))))))
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                (PROG1
                                    (LETT #4#
                                          (- (SPADCALL P (QREFELT $ 26))
                                             (SPADCALL Q (QREFELT $ 26)))
                                          . #7#)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#))
                                (QREFELT $ 28))
                      . #7#)
                (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #7#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                      . #7#)
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #7#)
                (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #7#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G189| (SPADCALL VQ 1 (QREFELT $ 54)) . #7#)
                        (LETT |#G190| (SPADCALL VZ 1 (QREFELT $ 54)) . #7#)
                        (LETT Q |#G189| . #7#)
                        (LETT Z |#G190| . #7#))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 23))
                          (PROGN
                           (LETT #2#
                                 (CONS (SPADCALL VZ 2 (QREFELT $ 54))
                                       (SPADCALL VZ 1 (QREFELT $ 54)))
                                 . #7#)
                           (GO #8#)))
                         ('T
                          (SEQ
                           (LETT VZ
                                 (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25))
                                  |s|
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL Z (QREFELT $ 26))
                                               (SPADCALL Q (QREFELT $ 26)))
                                            . #7#)
                                    (|check_subtype| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     #3#))
                                  $)
                                 . #7#)
                           (EXIT
                            (COND
                             ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                              (PROGN
                               (LETT #2#
                                     (CONS (SPADCALL VZ 2 (QREFELT $ 54))
                                           (SPADCALL VZ 1 (QREFELT $ 54)))
                                     . #7#)
                               (GO #8#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL VZ 1 (QREFELT $ 54))
                                               (QREFELT $ 25))
                                     . #7#)
                               (PROGN
                                (LETT |#G191| VQ . #7#)
                                (LETT |#G192|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #7#)
                                (LETT VP |#G191| . #7#)
                                (LETT VQ |#G192| . #7#))
                               (EXIT (LETT |s| |ss| . #7#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;chainSubResultants;2polRL;29|
        ((P |polR|) (Q |polR|) ($ |List| |polR|))
        (SPROG
         ((|s| (R)) (|#G202| (|polR|)) (|#G201| (|polR|)) (#1=#:G694 NIL)
          (L (|List| |polR|)) (Z (|polR|)) (|delta| (|NonNegativeInteger|))
          (#2=#:G686 NIL) (|#G200| (|polR|)) (|#G199| (|polR|)) (#3=#:G685 NIL)
          (|#G198| (|polR|)) (|#G197| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (SEQ
                 (PROGN
                  (LETT |#G197| Q . #4=(|PRS;chainSubResultants;2polRL;29|))
                  (LETT |#G198| P . #4#)
                  (LETT P |#G197| . #4#)
                  (LETT Q |#G198| . #4#))
                 (EXIT
                  (COND
                   ((ODDP (SPADCALL P (QREFELT $ 26)))
                    (COND
                     ((ODDP (SPADCALL Q (QREFELT $ 26)))
                      (LETT Q (SPADCALL Q (QREFELT $ 50)) . #4#)))))))))
              (LETT L NIL . #4#)
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 26))) L)
                     ('T
                      (SEQ (LETT L (LIST Q) . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 26))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         26)))
                                                     . #4#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           (QREFELT $ 28))
                                 . #4#)
                           (PROGN
                            (LETT |#G199| Q . #4#)
                            (LETT |#G200|
                                  (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                            (QREFELT $ 59))
                                  . #4#)
                            (LETT P |#G199| . #4#)
                            (LETT Q |#G200| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 23))
                                     (PROGN (LETT #1# L . #4#) (GO #5=#:G693)))
                                    ('T
                                     (SEQ (LETT L (CONS Q L) . #4#)
                                          (LETT |delta|
                                                (PROG1
                                                    (LETT #2#
                                                          (-
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              26))
                                                           (SPADCALL Q
                                                                     (QREFELT $
                                                                              26)))
                                                          . #4#)
                                                  (|check_subtype| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #2#))
                                                . #4#)
                                          (LETT Z
                                                (SPADCALL Q
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             25))
                                                          |s| |delta|
                                                          (QREFELT $ 49))
                                                . #4#)
                                          (COND
                                           ((SPADCALL |delta| 1 (QREFELT $ 66))
                                            (LETT L (CONS Z L) . #4#)))
                                          (EXIT
                                           (COND
                                            ((ZEROP
                                              (SPADCALL Z (QREFELT $ 26)))
                                             (PROGN
                                              (LETT #1# L . #4#)
                                              (GO #5#)))
                                            ('T
                                             (SEQ
                                              (PROGN
                                               (LETT |#G201| Q . #4#)
                                               (LETT |#G202|
                                                     (SPADCALL P Q Z |s|
                                                               (QREFELT $ 52))
                                                     . #4#)
                                               (LETT P |#G201| . #4#)
                                               (LETT Q |#G202| . #4#))
                                              (EXIT
                                               (LETT |s|
                                                     (SPADCALL Z
                                                               (QREFELT $ 25))
                                                     . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;schema;2polRL;30|
        ((P |polR|) (Q |polR|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|s| (R)) (|#G210| (|polR|)) (|#G209| (|polR|)) (#1=#:G708 NIL)
          (L (|List| (|NonNegativeInteger|))) (Z (|polR|))
          (|delta| (|NonNegativeInteger|)) (#2=#:G700 NIL)
          (|e| (|NonNegativeInteger|)) (|#G208| (|polR|)) (|#G207| (|polR|))
          (#3=#:G699 NIL) (|#G206| (|polR|)) (|#G205| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (PROGN
                 (LETT |#G205| Q . #4=(|PRS;schema;2polRL;30|))
                 (LETT |#G206| P . #4#)
                 (LETT P |#G205| . #4#)
                 (LETT Q |#G206| . #4#))))
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 26))) (LIST 0))
                     ('T
                      (SEQ (LETT L NIL . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 26))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         26)))
                                                     . #4#)
                                             (|check_subtype| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              #3#))
                                           (QREFELT $ 28))
                                 . #4#)
                           (PROGN
                            (LETT |#G207| Q . #4#)
                            (LETT |#G208| (SPADCALL P Q (QREFELT $ 59)) . #4#)
                            (LETT P |#G207| . #4#)
                            (LETT Q |#G208| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 23))
                                     (PROGN (LETT #1# L . #4#) (GO #5=#:G707)))
                                    ('T
                                     (SEQ
                                      (LETT |e| (SPADCALL Q (QREFELT $ 26))
                                            . #4#)
                                      (LETT L (CONS |e| L) . #4#)
                                      (LETT |delta|
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT $
                                                                          26))
                                                       |e|)
                                                      . #4#)
                                              (|check_subtype| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               #2#))
                                            . #4#)
                                      (LETT Z
                                            (SPADCALL Q
                                                      (SPADCALL Q
                                                                (QREFELT $ 25))
                                                      |s| |delta|
                                                      (QREFELT $ 49))
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
                                           (LETT |#G209| Q . #4#)
                                           (LETT |#G210|
                                                 (SPADCALL P Q Z |s|
                                                           (QREFELT $ 52))
                                                 . #4#)
                                           (LETT P |#G209| . #4#)
                                           (LETT Q |#G210| . #4#))
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL Z (QREFELT $ 25))
                                                 . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;subResultantGcd;3polR;31| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G218| (|polR|)) (|#G217| (|polR|)) (Z (|polR|))
          (#1=#:G714 NIL) (#2=#:G724 NIL) (|#G216| (|polR|)) (|#G215| (|polR|))
          (#3=#:G713 NIL) (|#G214| (|polR|)) (|#G213| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 23))
              (COND
               ((SPADCALL Q (QREFELT $ 23)) (EXIT (|spadConstant| $ 24))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 23)) Q)
                   ((SPADCALL Q (QREFELT $ 23)) P)
                   (#4='T
                    (SEQ
                     (COND
                      ((< (SPADCALL P (QREFELT $ 26))
                          (SPADCALL Q (QREFELT $ 26)))
                       (PROGN
                        (LETT |#G213| Q . #5=(|PRS;subResultantGcd;3polR;31|))
                        (LETT |#G214| P . #5#)
                        (LETT P |#G213| . #5#)
                        (LETT Q |#G214| . #5#))))
                     (EXIT
                      (COND
                       ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                        (|spadConstant| $ 9))
                       (#4#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                         (PROG1
                                             (LETT #3#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 26))
                                                    (SPADCALL Q
                                                              (QREFELT $ 26)))
                                                   . #5#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 28))
                               . #5#)
                         (PROGN
                          (LETT |#G215| Q . #5#)
                          (LETT |#G216|
                                (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                          (QREFELT $ 59))
                                . #5#)
                          (LETT P |#G215| . #5#)
                          (LETT Q |#G216| . #5#))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL Q (QREFELT $ 23))
                                   (PROGN (LETT #2# P . #5#) (GO #6=#:G723)))
                                  ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                                   (PROGN
                                    (LETT #2# (|spadConstant| $ 9) . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT Z
                                          (SPADCALL Q
                                                    (SPADCALL Q (QREFELT $ 25))
                                                    |s|
                                                    (PROG1
                                                        (LETT #1#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          26))
                                                               (SPADCALL Q
                                                                         (QREFELT
                                                                          $
                                                                          26)))
                                                              . #5#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 49))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G217| Q . #5#)
                                     (LETT |#G218|
                                           (SPADCALL P Q Z |s| (QREFELT $ 52))
                                           . #5#)
                                     (LETT P |#G217| . #5#)
                                     (LETT Q |#G218| . #5#))
                                    (EXIT
                                     (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                           . #5#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;subResultantGcdEuclidean;2polRR;32|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G224| (|Vector| |polR|)) (|#G223| #1#) (|ss| (R)) (#2=#:G733 NIL)
          (#3=#:G743 NIL) (|e| (|NonNegativeInteger|)) (|#G222| (|polR|))
          (|#G221| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G731 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 23))
              (COND
               ((SPADCALL Q (QREFELT $ 23))
                (EXIT
                 (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                         (|spadConstant| $ 24)))))))
            (EXIT
             (COND
              ((SPADCALL P (QREFELT $ 23))
               (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 9) Q))
              ((SPADCALL Q (QREFELT $ 23))
               (VECTOR (|spadConstant| $ 9) (|spadConstant| $ 24) P))
              (#5='T
               (SEQ
                (COND
                 ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                  (SEQ
                   (LETT |l| (SPADCALL Q P (QREFELT $ 85))
                         . #6=(|PRS;subResultantGcdEuclidean;2polRR;32|))
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                           . #6#)
                     (GO #7=#:G742))))))
                (EXIT
                 (COND
                  ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                   (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 9) Q))
                  (#5#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 26))
                                                 (SPADCALL Q (QREFELT $ 26)))
                                              . #6#)
                                      (|check_subtype| (>= #4# 0)
                                                       '(|NonNegativeInteger|)
                                                       #4#))
                                    (QREFELT $ 28))
                          . #6#)
                    (LETT VP
                          (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                          . #6#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                    (QREFELT $ 34))
                          . #6#)
                    (LETT VQ
                          (VECTOR (QVELT |pdiv| 2)
                                  (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                                  (QVELT |pdiv| 1))
                          . #6#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G221| (SPADCALL VP 1 (QREFELT $ 54)) . #6#)
                            (LETT |#G222| (SPADCALL VQ 1 (QREFELT $ 54)) . #6#)
                            (LETT P |#G221| . #6#)
                            (LETT Q |#G222| . #6#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 23))
                              (PROGN
                               (LETT #3#
                                     (VECTOR (SPADCALL VP 2 (QREFELT $ 54))
                                             (SPADCALL VP 3 (QREFELT $ 54)) P)
                                     . #6#)
                               (GO #7#)))
                             ('T
                              (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #6#)
                                   (EXIT
                                    (COND
                                     ((ZEROP |e|)
                                      (PROGN
                                       (LETT #3#
                                             (VECTOR
                                              (SPADCALL VQ 2 (QREFELT $ 54))
                                              (SPADCALL VQ 3 (QREFELT $ 54)) Q)
                                             . #6#)
                                       (GO #7#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL Q (QREFELT $ 25)) |s|
                                              (PROG1
                                                  (LETT #2#
                                                        (-
                                                         (SPADCALL P
                                                                   (QREFELT $
                                                                            26))
                                                         |e|)
                                                        . #6#)
                                                (|check_subtype| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #2#))
                                              (QREFELT $ 48))
                                             . #6#)
                                       (PROGN
                                        (LETT |#G223| VQ . #6#)
                                        (LETT |#G224|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #6#)
                                        (LETT VP |#G223| . #6#)
                                        (LETT VQ |#G224| . #6#))
                                       (EXIT (LETT |s| |ss| . #6#)))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean2;2polRR;33|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G230| (|Vector| |polR|)) (|#G229| #1#) (|ss| (R)) (#2=#:G750 NIL)
          (#3=#:G762 NIL) (|e| (|NonNegativeInteger|)) (|#G228| (|polR|))
          (|#G227| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G748 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 23))
              (COND
               ((SPADCALL Q (QREFELT $ 23))
                (EXIT (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 23)) (CONS (|spadConstant| $ 9) Q))
                   ((SPADCALL Q (QREFELT $ 23)) (CONS (|spadConstant| $ 24) P))
                   ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                    (|error|
                     "semiSubResultantGcdEuclidean2$PRS : bad degrees"))
                   ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                    (CONS (|spadConstant| $ 9) Q))
                   ('T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1
                                         (LETT #4#
                                               (- (SPADCALL P (QREFELT $ 26))
                                                  (SPADCALL Q (QREFELT $ 26)))
                                               . #5=(|PRS;semiSubResultantGcdEuclidean2;2polRR;33|))
                                       (|check_subtype| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        #4#))
                                     (QREFELT $ 28))
                           . #5#)
                     (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #5#)
                     (LETT |pdiv|
                           (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                     (QREFELT $ 34))
                           . #5#)
                     (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (PROGN
                             (LETT |#G227| (SPADCALL VP 1 (QREFELT $ 54))
                                   . #5#)
                             (LETT |#G228| (SPADCALL VQ 1 (QREFELT $ 54))
                                   . #5#)
                             (LETT P |#G227| . #5#)
                             (LETT Q |#G228| . #5#))
                            (EXIT
                             (COND
                              ((SPADCALL Q (QREFELT $ 23))
                               (PROGN
                                (LETT #3#
                                      (CONS (SPADCALL VP 2 (QREFELT $ 54)) P)
                                      . #5#)
                                (GO #6=#:G761)))
                              ('T
                               (SEQ
                                (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
                                (EXIT
                                 (COND
                                  ((ZEROP |e|)
                                   (PROGN
                                    (LETT #3#
                                          (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                                Q)
                                          . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT |ss|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                    |s|
                                                    (PROG1
                                                        (LETT #2#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          26))
                                                               |e|)
                                                              . #5#)
                                                      (|check_subtype|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                                    (QREFELT $ 48))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G229| VQ . #5#)
                                     (LETT |#G230|
                                           (|PRS;next_sousResultant3| VP VQ |s|
                                            |ss| $)
                                           . #5#)
                                     (LETT VP |#G229| . #5#)
                                     (LETT VQ |#G230| . #5#))
                                    (EXIT (LETT |s| |ss| . #5#)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean1;2polRR;34|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 85))
                |PRS;semiSubResultantGcdEuclidean1;2polRR;34|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;discriminant;polRR;35| ((P |polR|) ($ R))
        (SPROG
         ((#1=#:G778 NIL) (#2=#:G773 NIL) (#3=#:G770 NIL) (|d| (|Integer|))
          (|r| (R)) (|dP| (|polR|)) (|a| (|Integer|)) (#4=#:G768 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 26))
                  . #5=(|PRS;discriminant;polRR;35|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#6='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #5#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #4# |a| . #5#)
                                  (|check_subtype| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   #4#)))
                          . #5#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #5#)
                    (LETT |r| (SPADCALL P |dP| (QREFELT $ 60)) . #5#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
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
                                                                       $ 25))
                                                            (QREFELT $ 36))
                                                  . #5#)
                                            (QCDR #3#)
                                          (|check_union| (QEQCAR #3# 0)
                                                         (QREFELT $ 6) #3#))
                                        (QREFELT $ 91)))
                             (#6#
                              (SPADCALL (SPADCALL |a| |r| (QREFELT $ 91))
                                        (SPADCALL (SPADCALL P (QREFELT $ 25))
                                                  (PROG1
                                                      (LETT #2# (- |d| 1)
                                                            . #5#)
                                                    (|check_subtype| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     #2#))
                                                  (QREFELT $ 28))
                                        (QREFELT $ 40))))
                            . #5#)
                      (GO #7=#:G777)))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |PRS;discriminantEuclidean;polRR;36|
        ((P |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G806 NIL) (|cr| (R)) (#2=#:G799 NIL) (|c2| (|polR|))
          (#3=#:G797 NIL) (|c1| (|polR|)) (#4=#:G792 NIL) (#5=#:G785 NIL)
          (#6=#:G782 NIL) (|d| (|Integer|))
          (|rE|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#7=#:G780 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 26))
                  . #8=(|PRS;discriminantEuclidean;polRR;36|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#9='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #8#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #7# |a| . #8#)
                                  (|check_subtype| (>= #7# 0)
                                                   '(|NonNegativeInteger|)
                                                   #7#)))
                          . #8#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #8#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 62)) . #8#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
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
                                                                              25))
                                                           (QREFELT $ 18))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union| (QEQCAR #6# 0)
                                                        (QREFELT $ 7) #6#))
                                       (QREFELT $ 61))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL (QVELT |rE| 1)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              25))
                                                           (QREFELT $ 18))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union| (QEQCAR #6# 0)
                                                        (QREFELT $ 7) #6#))
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
                                                                       $ 25))
                                                            (QREFELT $ 36))
                                                  . #8#)
                                            (QCDR #5#)
                                          (|check_union| (QEQCAR #5# 0)
                                                         (QREFELT $ 6) #5#))
                                        (QREFELT $ 91))
                              . #8#))))
                     (#9#
                      (SEQ
                       (LETT |c1|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 0) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 25))
                                        (PROG1 (LETT #4# (- |d| 1) . #8#)
                                          (|check_subtype| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           #4#))
                                        (QREFELT $ 28))
                              (QREFELT $ 93))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 1) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 25))
                                        (PROG1 (LETT #3# (- |d| 1) . #8#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        (QREFELT $ 28))
                              (QREFELT $ 93))
                             . #8#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QVELT |rE| 2) (QREFELT $ 91))
                               (SPADCALL (SPADCALL P (QREFELT $ 25))
                                         (PROG1 (LETT #2# (- |d| 1) . #8#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 28))
                               (QREFELT $ 40))
                              . #8#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (VECTOR |c1| |c2| |cr|) . #8#)
                      (GO #10=#:G805)))))))))
          #10# (EXIT #1#)))) 

(SDEFUN |PRS;semiDiscriminantEuclidean;polRR;37|
        ((P |polR|) ($ |Record| (|:| |coef2| |polR|) (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G829 NIL) (|cr| (R)) (#2=#:G822 NIL) (|c2| (|polR|))
          (#3=#:G820 NIL) (#4=#:G813 NIL) (#5=#:G810 NIL) (|d| (|Integer|))
          (|rE| (|Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#6=#:G808 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 26))
                  . #7=(|PRS;semiDiscriminantEuclidean;polRR;37|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#8='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #7#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #6# |a| . #7#)
                                  (|check_subtype| (>= #6# 0)
                                                   '(|NonNegativeInteger|)
                                                   #6#)))
                          . #7#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #7#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 63)) . #7#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
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
                                                                              25))
                                                           (QREFELT $ 18))
                                                 . #7#)
                                           (QCDR #5#)
                                         (|check_union| (QEQCAR #5# 0)
                                                        (QREFELT $ 7) #5#))
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
                                                                       $ 25))
                                                            (QREFELT $ 36))
                                                  . #7#)
                                            (QCDR #4#)
                                          (|check_union| (QEQCAR #4# 0)
                                                         (QREFELT $ 6) #4#))
                                        (QREFELT $ 91))
                              . #7#))))
                     (#8#
                      (SEQ
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QCAR |rE|) (QREFELT $ 61))
                              (SPADCALL (SPADCALL P (QREFELT $ 25))
                                        (PROG1 (LETT #3# (- |d| 1) . #7#)
                                          (|check_subtype| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           #3#))
                                        (QREFELT $ 28))
                              (QREFELT $ 93))
                             . #7#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QCDR |rE|) (QREFELT $ 91))
                               (SPADCALL (SPADCALL P (QREFELT $ 25))
                                         (PROG1 (LETT #2# (- |d| 1) . #7#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 28))
                               (QREFELT $ 40))
                              . #7#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (CONS |c2| |cr|) . #7#)
                      (GO #9=#:G828)))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduit;2polRR;38| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((#1=#:G837 NIL) (#2=#:G832 NIL) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #3=(|PRS;resultantReduit;2polRR;38|))
            (LETT |UVs| (QVELT UV 2) . #3#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
               (|spadConstant| $ 35))
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
                                  (SPADCALL (SPADCALL |UVs| (QREFELT $ 25))
                                            (SPADCALL |l| (QREFELT $ 102))
                                            (QREFELT $ 36))
                                  . #3#)
                            (QCDR #2#)
                          (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                        . #3#)
                  (GO #4=#:G836)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduitEuclidean;2polRR;39|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G850 NIL) (|rr| (R)) (#2=#:G844 NIL) (|c2| (|polR|))
          (#3=#:G841 NIL) (|c1| (|polR|)) (|gl| (R)) (|l| (|List| R))
          (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #4=(|PRS;resultantReduitEuclidean;2polRR;39|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
               (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                       (|spadConstant| $ 35)))
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
                          (LETT #3# (SPADCALL (QVELT UV 0) |gl| (QREFELT $ 18))
                                . #4#)
                          (QCDR #3#)
                        (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                      . #4#)
                (LETT |c2|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 18))
                                . #4#)
                          (QCDR #3#)
                        (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 25)) |gl|
                                          (QREFELT $ 36))
                                . #4#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (VECTOR |c1| |c2| |rr|) . #4#)
                  (GO #5=#:G849)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;semiResultantReduitEuclidean;2polRR;40|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G863 NIL) (|rr| (R)) (#2=#:G857 NIL) (|c2| (|polR|))
          (#3=#:G854 NIL) (|gl| (R)) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 85))
                  . #4=(|PRS;semiResultantReduitEuclidean;2polRR;40|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
               (CONS (|spadConstant| $ 24) (|spadConstant| $ 35)))
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
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 18))
                                . #4#)
                          (QCDR #3#)
                        (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 25)) |gl|
                                          (QREFELT $ 36))
                                . #4#)
                          (QCDR #2#)
                        (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS |c2| |rr|) . #4#)
                  (GO #5=#:G862)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;gcd_naif| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|#G250| (|polR|)) (|#G249| (|polR|)) (#1=#:G873 NIL)
          (#2=#:G865 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL P (QREFELT $ 23))
             (PROG2
                 (LETT #2#
                       (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) (QREFELT $ 18))
                       . #3=(|PRS;gcd_naif|))
                 (QCDR #2#)
               (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#)))
            ('T
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #1#
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL P (SPADCALL P (QREFELT $ 25))
                                                 (QREFELT $ 18))
                                       . #3#)
                                 (QCDR #2#)
                               (|check_union| (QEQCAR #2# 0) (QREFELT $ 7)
                                              #2#))
                             . #3#)
                       (GO #4=#:G872)))
                     ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                      (PROGN (LETT #1# (|spadConstant| $ 9) . #3#) (GO #4#)))
                     ('T
                      (PROGN
                       (LETT |#G249| Q . #3#)
                       (LETT |#G250| (QCDR (SPADCALL P Q (QREFELT $ 38)))
                             . #3#)
                       (LETT P |#G249| . #3#)
                       (LETT Q |#G250| . #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #1#)))) 

(SDEFUN |PRS;gcd;3polR;42| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((#1=#:G881 NIL) (G (|polR|)) (#2=#:G875 NIL) (|cQ| (R)) (|cP| (R)))
         (SEQ
          (EXIT
           (COND
            ((|HasCategory| (QREFELT $ 6) '(|Finite|)) (|PRS;gcd_naif| P Q $))
            ((SPADCALL P (QREFELT $ 23)) Q) ((SPADCALL Q (QREFELT $ 23)) P)
            ('T
             (SEQ
              (LETT |cP| (SPADCALL P (QREFELT $ 108))
                    . #3=(|PRS;gcd;3polR;42|))
              (LETT |cQ| (SPADCALL Q (QREFELT $ 108)) . #3#)
              (LETT P
                    (PROG2 (LETT #2# (SPADCALL P |cP| (QREFELT $ 18)) . #3#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                    . #3#)
              (LETT Q
                    (PROG2 (LETT #2# (SPADCALL Q |cQ| (QREFELT $ 18)) . #3#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                    . #3#)
              (LETT G (SPADCALL P Q (QREFELT $ 83)) . #3#)
              (EXIT
               (PROGN
                (LETT #1#
                      (SPADCALL (SPADCALL |cP| |cQ| (QREFELT $ 109))
                                (SPADCALL G (QREFELT $ 110)) (QREFELT $ 29))
                      . #3#)
                (GO #4=#:G880)))))))
          #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |PseudoRemainderSequence;|)) 

(DEFUN |PseudoRemainderSequence| (&REST #1=#:G882)
  (SPROG NIL
         (PROG (#2=#:G883)
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
          (QSETREFV $ 12 (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 11)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 103
                       (CONS
                        (|dispatchFunction| |PRS;resultantReduit;2polRR;38|)
                        $))
             (QSETREFV $ 105
                       (CONS
                        (|dispatchFunction|
                         |PRS;resultantReduitEuclidean;2polRR;39|)
                        $))
             (QSETREFV $ 107
                       (CONS
                        (|dispatchFunction|
                         |PRS;semiResultantReduitEuclidean;2polRR;40|)
                        $))
             (QSETREFV $ 111
                       (CONS (|dispatchFunction| |PRS;gcd;3polR;42|) $)))))
          $))) 

(MAKEPROP '|PseudoRemainderSequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|) 'X
              (14 . |coerce|) (|Vector| 7) (19 . *) |PRS;*;R2V;1|
              (|Union| $ '"failed") (25 . |exquo|) (|Mapping| 7 7) (31 . |map|)
              |PRS;exquo;VRV;2| (|Boolean|) (37 . |zero?|) (42 . |Zero|)
              (46 . |leadingCoefficient|) (51 . |degree|) (56 . |reductum|)
              (61 . ^) (67 . *) (73 . +) (79 . *) (85 . -)
              (|Record| (|:| |coef| 6) (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;pseudoDivide;2polRR;3| (91 . |Zero|) (95 . |exquo|)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;divide;2polRR;4| (101 . -) (106 . *)
              |PRS;resultant_naif;2polRR;5|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;resultantEuclidean_naif;2polRR;6|
              (|Record| (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean_naif;2polRR;7| (|PositiveInteger|)
              (112 . *) |PRS;Lazard;2RNniR;8| |PRS;Lazard2;polR2RNnipolR;9|
              (118 . -) (123 . |coefficient|)
              |PRS;next_sousResultant2;3polRRpolR;11| (|Integer|) (129 . |elt|)
              (135 . -) (141 . +) (147 . |setelt|) (154 . -)
              (159 . |pseudoRemainder|) |PRS;resultant;2polRR;14| (165 . *)
              |PRS;resultantEuclidean;2polRR;16|
              |PRS;semiResultantEuclidean2;2polRR;18|
              (|Record| (|:| |coef1| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean1;2polRR;19| (171 . >)
              |PRS;indiceSubResultant;2polRNnipolR;20|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;indiceSubResultantEuclidean;2polRNniR;21|
              (|Record| (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;semiIndiceSubResultantEuclidean;2polRNniR;22|
              |PRS;degreeSubResultant;2polRNnipolR;23|
              |PRS;degreeSubResultantEuclidean;2polRNniR;24|
              |PRS;semiDegreeSubResultantEuclidean;2polRNniR;25|
              |PRS;lastSubResultant;3polR;26|
              |PRS;lastSubResultantEuclidean;2polRR;27| (177 . |copy|)
              |PRS;semiLastSubResultantEuclidean;2polRR;28| (|List| 7)
              |PRS;chainSubResultants;2polRL;29| (|List| 10)
              |PRS;schema;2polRL;30| |PRS;subResultantGcd;3polR;31|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;subResultantGcdEuclidean;2polRR;32|
              (|Record| (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean2;2polRR;33|
              (|Record| (|:| |coef1| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean1;2polRR;34|
              (182 . |differentiate|) (187 . *) |PRS;discriminant;polRR;35|
              (193 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;discriminantEuclidean;polRR;36|
              (|Record| (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;semiDiscriminantEuclidean;polRR;37| (|List| 6)
              (199 . |coefficients|) (204 . |concat|) (|List| $) (210 . |gcd|)
              (215 . |resultantReduit|)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7)
                        (|:| |resultantReduit| 6))
              (221 . |resultantReduitEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultantReduit| 6))
              (227 . |semiResultantReduitEuclidean|) (233 . |content|)
              (238 . |gcd|) (244 . |primitivePart|) (249 . |gcd|))
           '#(|subResultantGcdEuclidean| 255 |subResultantGcd| 261
              |semiSubResultantGcdEuclidean2| 267
              |semiSubResultantGcdEuclidean1| 273
              |semiResultantReduitEuclidean| 279 |semiResultantEuclidean_naif|
              285 |semiResultantEuclidean2| 291 |semiResultantEuclidean1| 297
              |semiLastSubResultantEuclidean| 303
              |semiIndiceSubResultantEuclidean| 309 |semiDiscriminantEuclidean|
              316 |semiDegreeSubResultantEuclidean| 321 |schema| 328
              |resultant_naif| 334 |resultantReduitEuclidean| 340
              |resultantReduit| 346 |resultantEuclidean_naif| 352
              |resultantEuclidean| 358 |resultant| 364 |pseudoDivide| 370
              |next_sousResultant2| 376 |lastSubResultantEuclidean| 384
              |lastSubResultant| 390 |indiceSubResultantEuclidean| 396
              |indiceSubResultant| 403 |gcd| 410 |exquo| 416 |divide| 422
              |discriminantEuclidean| 428 |discriminant| 433
              |degreeSubResultantEuclidean| 438 |degreeSubResultant| 445
              |chainSubResultants| 452 |Lazard2| 458 |Lazard| 466 * 473)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(0 6 0 8 0 7 0 9 2 7 0 6 10
                                                   11 1 7 0 6 13 2 14 0 7 0 15
                                                   2 7 17 0 6 18 2 14 0 19 0 20
                                                   1 7 22 0 23 0 7 0 24 1 7 6 0
                                                   25 1 7 10 0 26 1 7 0 0 27 2
                                                   6 0 0 10 28 2 7 0 6 0 29 2 7
                                                   0 0 0 30 2 7 0 0 0 31 2 7 0
                                                   0 0 32 0 6 0 35 2 6 17 0 0
                                                   36 1 6 0 0 39 2 6 0 0 0 40 2
                                                   10 0 46 0 47 1 7 0 0 50 2 7
                                                   6 0 10 51 2 14 7 0 53 54 2
                                                   14 0 0 0 55 2 14 0 0 0 56 3
                                                   14 7 0 53 7 57 1 14 0 0 58 2
                                                   7 0 0 0 59 2 7 0 53 0 61 2
                                                   10 22 0 0 66 1 14 0 0 77 1 7
                                                   0 0 90 2 6 0 53 0 91 2 7 0 0
                                                   6 93 1 7 98 0 99 2 98 0 0 0
                                                   100 1 6 0 101 102 2 0 6 7 7
                                                   103 2 0 104 7 7 105 2 0 106
                                                   7 7 107 1 7 6 0 108 2 6 0 0
                                                   0 109 1 7 0 0 110 2 0 7 7 7
                                                   111 2 0 84 7 7 85 2 0 7 7 7
                                                   83 2 0 86 7 7 87 2 0 88 7 7
                                                   89 2 1 106 7 7 107 2 0 44 7
                                                   7 45 2 0 44 7 7 63 2 0 64 7
                                                   7 65 2 0 70 7 7 78 3 0 70 7
                                                   7 10 71 1 0 96 7 97 3 0 70 7
                                                   7 10 74 2 0 81 7 7 82 2 0 6
                                                   7 7 41 2 1 104 7 7 105 2 1 6
                                                   7 7 103 2 0 42 7 7 43 2 0 42
                                                   7 7 62 2 0 6 7 7 60 2 0 33 7
                                                   7 34 4 0 7 7 7 7 6 52 2 0 68
                                                   7 7 76 2 0 7 7 7 75 3 0 68 7
                                                   7 10 69 3 0 7 7 7 10 67 2 1
                                                   7 7 7 111 2 0 14 14 6 21 2 0
                                                   37 7 7 38 1 0 94 7 95 1 0 6
                                                   7 92 3 0 68 7 7 10 73 3 0 7
                                                   7 7 10 72 2 0 79 7 7 80 4 0
                                                   7 7 6 6 10 49 3 0 6 6 6 10
                                                   48 2 0 14 6 14 16)))))
           '|lookupComplete|)) 
