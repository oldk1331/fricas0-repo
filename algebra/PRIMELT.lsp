
(/VERSIONCHECK 2) 

(DEFUN |PRIMELT;multi| (|p| |v| $)
  (SPADCALL (SPADCALL (LIST #'|PRIMELT;multi!0|) |p| (QREFELT $ 9)) |v|
            (QREFELT $ 12))) 

(DEFUN |PRIMELT;multi!0| (|f1| $$) |f1|) 

(DEFUN |PRIMELT;randomInts| (|n| |m| $)
  (PROG (|i| #1=#:G140)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #2=(|PRIMELT;randomInts|))
       (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
            (SEQ
             (EXIT
              (LETT #1# (CONS (SPADCALL (RANDOM |m|) |m| (QREFELT $ 14)) #1#)
                    . #2#)))
            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
            (EXIT (NREVERSE #1#)))))))) 

(DEFUN |PRIMELT;incl?| (|a| |b| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PRIMELT;incl?!0| (VECTOR $ |b|)) |a| (QREFELT $ 19))))) 

(DEFUN |PRIMELT;incl?!0| (|s1| $$)
  (PROG (|b| $)
    (LETT |b| (QREFELT $$ 1) . #1=(|PRIMELT;incl?|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s1| |b| (QREFELT $ 17)))))) 

(DEFUN |PRIMELT;primitiveElement;LLR;4| (|l| |v| $)
  (SPADCALL |l| |v| (SPADCALL (QREFELT $ 20)) (QREFELT $ 23))) 

(DEFUN |PRIMELT;primitiveElement;PSPSR;5| (|p1| |a1| |p2| |a2| $)
  (PROG (#1=#:G147 #2=#:G152 |r| |w| |c| |i| |b| |u|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (SPADCALL |p2| |a1| (QREFELT $ 26)) 1)
         (VECTOR 0 1
                 (SPADCALL (SPADCALL |p1| |p2| |a1| (QREFELT $ 30))
                           (QREFELT $ 31))))
        ('T
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL (QREFELT $ 20)) (QREFELT $ 32))
                . #3=(|PRIMELT;primitiveElement;PSPSR;5|))
          (LETT |b| (SPADCALL |a2| (QREFELT $ 32)) . #3#)
          (EXIT
           (SEQ (LETT |i| 10 . #3#) G190 NIL
                (SEQ
                 (EXIT
                  (SEQ
                   (LETT |c| (SPADCALL (RANDOM |i|) |i| (QREFELT $ 14)) . #3#)
                   (LETT |w|
                         (SPADCALL |u| (SPADCALL |c| |b| (QREFELT $ 33))
                                   (QREFELT $ 34))
                         . #3#)
                   (LETT |r|
                         (SPADCALL
                          (SPADCALL (SPADCALL |p1| |a1| |w| (QREFELT $ 35))
                                    (SPADCALL |p2| |a1| |w| (QREFELT $ 35))
                                    |a2| (QREFELT $ 30))
                          (QREFELT $ 31))
                         . #3#)
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |r| (QREFELT $ 36)))
                      (COND
                       ((SPADCALL |r| (SPADCALL |r| (QREFELT $ 37))
                                  (QREFELT $ 38))
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #2# (VECTOR 1 |c| |r|) . #3#)
                                (GO #2#))
                               . #3#)
                         (GO #1#)))))))))
                 #1# (EXIT #1#))
                (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL)))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRIMELT;findUniv| (|l| |v| |opt| $)
  (PROG (#1=#:G158 #2=#:G160 #3=#:G161 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |p| NIL . #4=(|PRIMELT;findUniv|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |p| |v| (QREFELT $ 26)) 0
                             (QREFELT $ 42))
                   (COND
                    ((|PRIMELT;incl?| (SPADCALL |p| (QREFELT $ 43))
                      (LIST |v| |opt|) $)
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# (CONS 0 |p|) . #4#) (GO #2#))
                            . #4#)
                      (GO #1#))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |PRIMELT;triangularLinearIfCan| (|l| |lv| |w| $)
  (PROG (|ll| |bc| #1=#:G180 #2=#:G190 |p| |u| #3=#:G191 |v| |pw|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |u| (|PRIMELT;findUniv| |l| |w| |w| $)
              . #4=(|PRIMELT;triangularLinearIfCan|))
        (EXIT
         (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
               ('T
                (SEQ (LETT |pw| (SPADCALL (QCDR |u|) (QREFELT $ 31)) . #4#)
                     (LETT |ll| NIL . #4#)
                     (SEQ (LETT |v| NIL . #4#) (LETT #3# |lv| . #4#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |v| (CAR #3#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (SEQ
                              (LETT |u| (|PRIMELT;findUniv| |l| |v| |w| $)
                                    . #4#)
                              (EXIT
                               (COND
                                ((OR (QEQCAR |u| 1)
                                     (SPADCALL
                                      (SPADCALL
                                       (LETT |p|
                                             (SPADCALL (QCDR |u|) |v|
                                                       (QREFELT $ 45))
                                             . #4#)
                                       (QREFELT $ 47))
                                      1 (QREFELT $ 48)))
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2# (CONS 1 "failed") . #4#)
                                         (GO #2#))
                                        . #4#)
                                  (GO #1#))))))
                             (LETT |bc|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 49))
                                              (QREFELT $ 31))
                                    |pw| (|spadConstant| $ 50) (QREFELT $ 53))
                                   . #4#)
                             (EXIT
                              (COND
                               ((QEQCAR |bc| 1) (|error| "Should not happen"))
                               ('T
                                (LETT |ll|
                                      (CONS
                                       (SPADCALL
                                        (LIST
                                         #'|PRIMELT;triangularLinearIfCan!0|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |p| 0 (QREFELT $ 55))
                                            (QREFELT $ 31))
                                           (QCAR (QCDR |bc|)) (QREFELT $ 56))
                                          (QREFELT $ 57))
                                         |pw| (QREFELT $ 58))
                                        (QREFELT $ 9))
                                       |ll|)
                                      . #4#))))))
                           #1# (EXIT #1#))
                          (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (CONS 0
                            (CONS
                             (SPADCALL
                              (LIST #'|PRIMELT;triangularLinearIfCan!1|) |pw|
                              (QREFELT $ 9))
                             (NREVERSE |ll|))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRIMELT;triangularLinearIfCan!1| (|f1| $$) |f1|) 

(DEFUN |PRIMELT;triangularLinearIfCan!0| (|z1| $$) |z1|) 

(DEFUN |PRIMELT;primitiveElement;LLSR;8| (|l| |vars| |uu| $)
  (PROG (#1=#:G204 #2=#:G207 |ltt| |tt| #3=#:G198 #4=#:G197 #5=#:G199 #6=#:G210
         |c| #7=#:G211 |t| |cf| |i| |n| |w| |elim| |vv| #8=#:G209 |v| #9=#:G208
         |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |u| (SPADCALL |uu| (QREFELT $ 32))
              . #10=(|PRIMELT;primitiveElement;LLSR;8|))
        (LETT |vv|
              (PROGN
               (LETT #9# NIL . #10#)
               (SEQ (LETT |v| NIL . #10#) (LETT #8# |vars| . #10#) G190
                    (COND
                     ((OR (ATOM #8#) (PROGN (LETT |v| (CAR #8#) . #10#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #9# (CONS (SPADCALL |v| (QREFELT $ 32)) #9#)
                            . #10#)))
                    (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                    (EXIT (NREVERSE #9#))))
              . #10#)
        (LETT |elim| (SPADCALL |vars| |uu| (QREFELT $ 59)) . #10#)
        (LETT |w| (SPADCALL |uu| (QREFELT $ 32)) . #10#)
        (LETT |n| (LENGTH |l|) . #10#)
        (EXIT
         (SEQ (LETT |i| 10 . #10#) G190 NIL
              (SEQ
               (EXIT
                (SEQ (LETT |cf| (|PRIMELT;randomInts| |n| |i| $) . #10#)
                     (LETT |tt|
                           (|PRIMELT;triangularLinearIfCan|
                            (SPADCALL
                             (CONS
                              (SPADCALL |w|
                                        (PROGN
                                         (LETT #3# NIL . #10#)
                                         (SEQ (LETT |t| NIL . #10#)
                                              (LETT #7# |vv| . #10#)
                                              (LETT |c| NIL . #10#)
                                              (LETT #6# |cf| . #10#) G190
                                              (COND
                                               ((OR (ATOM #6#)
                                                    (PROGN
                                                     (LETT |c| (CAR #6#)
                                                           . #10#)
                                                     NIL)
                                                    (ATOM #7#)
                                                    (PROGN
                                                     (LETT |t| (CAR #7#)
                                                           . #10#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #5#
                                                       (SPADCALL |c| |t|
                                                                 (QREFELT $
                                                                          33))
                                                       . #10#)
                                                 (COND
                                                  (#3#
                                                   (LETT #4#
                                                         (SPADCALL #4# #5#
                                                                   (QREFELT $
                                                                            60))
                                                         . #10#))
                                                  ('T
                                                   (PROGN
                                                    (LETT #4# #5# . #10#)
                                                    (LETT #3# 'T . #10#)))))))
                                              (LETT #6#
                                                    (PROG1 (CDR #6#)
                                                      (LETT #7# (CDR #7#)
                                                            . #10#))
                                                    . #10#)
                                              (GO G190) G191 (EXIT NIL))
                                         (COND (#3# #4#)
                                               ('T (|spadConstant| $ 29))))
                                        (QREFELT $ 34))
                              |l|)
                             |elim| (QREFELT $ 62))
                            |vars| |uu| $)
                           . #10#)
                     (EXIT
                      (COND
                       ((QEQCAR |tt| 0)
                        (PROGN
                         (LETT #1#
                               (SEQ (LETT |ltt| (QCDR |tt|) . #10#)
                                    (EXIT
                                     (PROGN
                                      (LETT #2#
                                            (VECTOR |cf| (CDR |ltt|)
                                                    (|SPADfirst| |ltt|))
                                            . #10#)
                                      (GO #2#))))
                               . #10#)
                         (GO #1#)))))))
               #1# (EXIT #1#))
              (LETT |i| (+ |i| 1) . #10#) (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PrimitiveElement| (#1=#:G212)
  (PROG ()
    (RETURN
     (PROG (#2=#:G213)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PrimitiveElement|)
                                           '|domainEqualList|)
                . #3=(|PrimitiveElement|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PrimitiveElement;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PrimitiveElement|))))))))))) 

(DEFUN |PrimitiveElement;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimitiveElement|))
      (LETT |dv$| (LIST '|PrimitiveElement| DV$1) . #1#)
      (LETT $ (GETREFV 63) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PrimitiveElement| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PrimitiveElement| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6) (0 . |map|) (|Symbol|)
              (|Polynomial| 6) (6 . |multivariate|) (|Integer|)
              (12 . |symmetricRemainder|) (|Boolean|) (|List| 10)
              (18 . |member?|) (|Mapping| 15 10) (24 . |every?|) (30 . |new|)
              (|Record| (|:| |coef| (|List| 13)) (|:| |poly| (|List| 8))
                        (|:| |prim| 8))
              (|List| 11) |PRIMELT;primitiveElement;LLSR;8|
              |PRIMELT;primitiveElement;LLR;4| (|NonNegativeInteger|)
              (34 . |degree|) (40 . |One|) (44 . |Zero|) (48 . |Zero|)
              (52 . |resultant|) (59 . |univariate|) (64 . |coerce|) (69 . *)
              (75 . -) (81 . |eval|) (88 . |zero?|) (93 . |squareFreePart|)
              (98 . =) (104 . |One|)
              (|Record| (|:| |coef1| 13) (|:| |coef2| 13) (|:| |prim| 8))
              |PRIMELT;primitiveElement;PSPSR;5| (108 . >) (114 . |variables|)
              (|SparseUnivariatePolynomial| $) (119 . |univariate|)
              (|SparseUnivariatePolynomial| 11) (125 . |degree|) (130 . ~=)
              (136 . |leadingCoefficient|) (141 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 51 '"failed")
              (145 . |extendedEuclidean|) (152 . |Zero|) (156 . |coefficient|)
              (162 . *) (168 . -) (173 . |rem|) (179 . |concat|) (185 . +)
              (|PolyGroebner| 6) (191 . |lexGroebner|))
           '#(|primitiveElement| 197) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(2 8 0 7 0 9 2 11 0 8 10 12 2
                                                   13 0 0 0 14 2 16 15 10 0 17
                                                   2 16 15 18 0 19 0 10 0 20 2
                                                   11 25 0 10 26 0 6 0 27 0 6 0
                                                   28 0 11 0 29 3 11 0 0 0 10
                                                   30 1 11 8 0 31 1 11 0 10 32
                                                   2 11 0 13 0 33 2 11 0 0 0 34
                                                   3 11 0 0 10 0 35 1 8 15 0 36
                                                   1 8 0 0 37 2 8 15 0 0 38 0
                                                   11 0 39 2 25 15 0 0 42 1 11
                                                   16 0 43 2 11 44 0 10 45 1 46
                                                   25 0 47 2 25 15 0 0 48 1 46
                                                   11 0 49 0 8 0 50 3 8 52 0 0
                                                   0 53 0 8 0 54 2 46 11 0 25
                                                   55 2 8 0 0 0 56 1 8 0 0 57 2
                                                   8 0 0 0 58 2 16 0 0 10 59 2
                                                   11 0 0 0 60 2 61 22 22 16 62
                                                   4 0 40 11 10 11 10 41 3 0 21
                                                   22 16 10 23 2 0 21 22 16
                                                   24)))))
           '|lookupComplete|)) 
