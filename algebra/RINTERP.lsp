
(SDEFUN |RINTERP;interpolate;2L2NniF;1|
        ((|xlist| |List| F) (|ylist| |List| F) (|m| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|) ($ |Fraction| (|Polynomial| F)))
        (SPROG
         ((|reslist| (|List| (|List| (|Polynomial| F)))) (|i| NIL)
          (#1=#:G137 NIL) (#2=#:G136 NIL) (|res| (|List| (|Vector| F)))
          (|collist| (|List| (|List| F))) (#3=#:G135 NIL) (#4=#:G134 NIL)
          (#5=#:G133 NIL) (|j| NIL) (#6=#:G132 NIL) (#7=#:G131 NIL)
          (#8=#:G130 NIL) (|tempvec| (|List| F)) (#9=#:G129 NIL)
          (#10=#:G128 NIL) (#11=#:G127 NIL) (#12=#:G126 NIL) (#13=#:G125 NIL)
          (#14=#:G124 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |xlist|) (LENGTH |ylist|) (QREFELT $ 10))
            (|error| "Different number of points and values."))
           ((SPADCALL (LENGTH |xlist|) (+ (+ |m| |k|) 1) (QREFELT $ 10))
            (|error| "wrong number of points"))
           ('T
            (SEQ
             (LETT |tempvec|
                   (PROGN
                    (LETT #14# NIL . #15=(|RINTERP;interpolate;2L2NniF;1|))
                    (SEQ (LETT |i| 1 . #15#)
                         (LETT #13# (+ (+ |m| |k|) 1) . #15#) G190
                         (COND ((|greater_SI| |i| #13#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #14# (CONS (|spadConstant| $ 11) #14#)
                                 . #15#)))
                         (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                         (EXIT (NREVERSE #14#))))
                   . #15#)
             (LETT |collist|
                   (CONS |tempvec|
                         (PROGN
                          (LETT #12# NIL . #15#)
                          (SEQ (LETT |j| 1 . #15#)
                               (LETT #11# (MAX |m| |k|) . #15#) G190
                               (COND ((|greater_SI| |j| #11#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #12#
                                       (CONS
                                        (LETT |tempvec|
                                              (PROGN
                                               (LETT #10# NIL . #15#)
                                               (SEQ (LETT |i| 1 . #15#)
                                                    (LETT #9# (+ (+ |m| |k|) 1)
                                                          . #15#)
                                                    G190
                                                    (COND
                                                     ((|greater_SI| |i| #9#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #10#
                                                            (CONS
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |tempvec| |i|
                                                               (QREFELT $ 14))
                                                              (SPADCALL |xlist|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 14))
                                                              (QREFELT $ 15))
                                                             #10#)
                                                            . #15#)))
                                                    (LETT |i| (|inc_SI| |i|)
                                                          . #15#)
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #10#))))
                                              . #15#)
                                        #12#)
                                       . #15#)))
                               (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                               (EXIT (NREVERSE #12#)))))
                   . #15#)
             (LETT |collist|
                   (APPEND
                    (PROGN
                     (LETT #8# NIL . #15#)
                     (SEQ (LETT |j| 1 . #15#) (LETT #7# (+ |m| 1) . #15#) G190
                          (COND ((|greater_SI| |j| #7#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |collist| |j| (QREFELT $ 19))
                                        #8#)
                                  . #15#)))
                          (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    (PROGN
                     (LETT #6# NIL . #15#)
                     (SEQ (LETT |j| 1 . #15#) (LETT #5# (+ |k| 1) . #15#) G190
                          (COND ((|greater_SI| |j| #5#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (PROGN
                                    (LETT #4# NIL . #15#)
                                    (SEQ (LETT |i| 1 . #15#)
                                         (LETT #3# (+ (+ |m| |k|) 1) . #15#)
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #3#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |collist| |j|
                                                               (QREFELT $ 19))
                                                     |i| (QREFELT $ 14))
                                                    (SPADCALL |ylist| |i|
                                                              (QREFELT $ 14))
                                                    (QREFELT $ 15))
                                                   (QREFELT $ 20))
                                                  #4#)
                                                 . #15#)))
                                         (LETT |i| (|inc_SI| |i|) . #15#)
                                         (GO G190) G191 (EXIT (NREVERSE #4#))))
                                   #6#)
                                  . #15#)))
                          (LETT |j| (|inc_SI| |j|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
                   . #15#)
             (LETT |res|
                   (SPADCALL
                    (SPADCALL (SPADCALL |collist| (QREFELT $ 22))
                              (QREFELT $ 23))
                    (QREFELT $ 25))
                   . #15#)
             (COND
              ((SPADCALL (LENGTH |res|) 1 (QREFELT $ 10))
               (SPADCALL "Warning: unattainable points!" (QREFELT $ 29))))
             (LETT |reslist|
                   (LIST
                    (PROGN
                     (LETT #2# NIL . #15#)
                     (SEQ (LETT |i| 0 . #15#) G190
                          (COND ((|greater_SI| |i| |m|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |res| 1 (QREFELT $ 31))
                                              (+ |i| 1) (QREFELT $ 32))
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 6) (QREFELT $ 35))
                                     |i| (QREFELT $ 36))
                                    (QREFELT $ 37))
                                   #2#)
                                  . #15#)))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (PROGN
                     (LETT #1# NIL . #15#)
                     (SEQ (LETT |i| 0 . #15#) G190
                          (COND ((|greater_SI| |i| |k|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |res| 1 (QREFELT $ 31))
                                              (+ (+ |i| |m|) 2) (QREFELT $ 32))
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 6) (QREFELT $ 35))
                                     |i| (QREFELT $ 36))
                                    (QREFELT $ 37))
                                   #1#)
                                  . #15#)))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
                   . #15#)
             (EXIT
              (SPADCALL
               (SPADCALL (ELT $ 38) (SPADCALL |reslist| 1 (QREFELT $ 41))
                         (QREFELT $ 43))
               (SPADCALL (ELT $ 38) (SPADCALL |reslist| 2 (QREFELT $ 41))
                         (QREFELT $ 43))
               (QREFELT $ 44))))))))) 

(DECLAIM (NOTINLINE |RationalInterpolation;|)) 

(DEFUN |RationalInterpolation| (&REST #1=#:G138)
  (SPROG NIL
         (PROG (#2=#:G139)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RationalInterpolation|)
                                               '|domainEqualList|)
                    . #3=(|RationalInterpolation|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RationalInterpolation;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RationalInterpolation|)))))))))) 

(DEFUN |RationalInterpolation;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RationalInterpolation|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|RationalInterpolation| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 46) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RationalInterpolation|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|RationalInterpolation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (6 . |One|) (|Integer|)
              (|List| 7) (10 . |elt|) (16 . *) (|Fraction| 34) (22 . |One|)
              (|List| 13) (26 . |elt|) (32 . -) (|Matrix| 7) (37 . |matrix|)
              (42 . |transpose|) (|List| 30) (47 . |nullSpace|) (|Void|)
              (|OutputForm|) (|OutputPackage|) (52 . |output|) (|Vector| 7)
              (57 . |elt|) (63 . |elt|) (|Symbol|) (|Polynomial| 7)
              (69 . |coerce|) (74 . ^) (80 . *) (86 . +) (|List| 34)
              (|List| 39) (92 . |elt|) (|Mapping| 34 34 34) (98 . |reduce|)
              (104 . /) |RINTERP;interpolate;2L2NniF;1|)
           '#(|interpolate| 110) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(2 9 8 0 0 10 0 7 0 11 2 13 7
                                                   0 12 14 2 7 0 0 0 15 0 16 0
                                                   17 2 18 13 0 12 19 1 7 0 0
                                                   20 1 21 0 18 22 1 21 0 0 23
                                                   1 21 24 0 25 1 28 26 27 29 2
                                                   24 30 0 12 31 2 30 7 0 12 32
                                                   1 34 0 33 35 2 34 0 0 9 36 2
                                                   34 0 7 0 37 2 34 0 0 0 38 2
                                                   40 39 0 12 41 2 39 34 42 0
                                                   43 2 16 0 34 34 44 4 0 16 13
                                                   13 9 9 45)))))
           '|lookupComplete|)) 
