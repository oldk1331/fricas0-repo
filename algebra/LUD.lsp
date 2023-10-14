
(/VERSIONCHECK 2) 

(DEFUN |LUD;LUDecomp;MR;1| (AA $)
  (PROG (|k| |d| |Pivs| |i0| |s| #1=#:G153 |i| #2=#:G152 #3=#:G151 |j| |PermV|
         #4=#:G134 |maxC| |minC| |maxR| |minR| A)
    (RETURN
     (SEQ (LETT A (SPADCALL AA (QREFELT $ 8)) . #5=(|LUD;LUDecomp;MR;1|))
          (LETT |minR| 1 . #5#) (LETT |maxR| (SPADCALL A (QREFELT $ 10)) . #5#)
          (LETT |minC| 1 . #5#) (LETT |maxC| (SPADCALL A (QREFELT $ 11)) . #5#)
          (EXIT
           (COND
            ((SPADCALL |maxR| |maxC| (QREFELT $ 13))
             (|error| "LU decomposition only of square matrices"))
            ('T
             (SEQ
              (LETT |PermV|
                    (MAKEARR1
                     (PROG1 (LETT #4# (+ (- |maxR| |minR|) 1) . #5#)
                       (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                        #4#))
                     0)
                    . #5#)
              (LETT |Pivs| NIL . #5#)
              (SEQ (LETT |j| |minC| . #5#) G190
                   (COND ((> |j| |maxC|) (GO G191)))
                   (SEQ
                    (SEQ (LETT |i| |minR| . #5#) (LETT #3# (- |j| 1) . #5#)
                         G190 (COND ((> |i| #3#) (GO G191)))
                         (SEQ (LETT |s| (QAREF2O A |i| |j| 1 1) . #5#)
                              (SEQ (LETT |k| |minR| . #5#)
                                   (LETT #2# (- |i| 1) . #5#) G190
                                   (COND ((> |k| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (SPADCALL
                                                      (QAREF2O A |i| |k| 1 1)
                                                      (QAREF2O A |k| |j| 1 1)
                                                      (QREFELT $ 17))
                                                     (QREFELT $ 18))
                                           . #5#)))
                                   (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT (QSETAREF2O A |i| |j| |s| 1 1)))
                         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                    (LETT |i0| -1 . #5#)
                    (SEQ (LETT |i| |j| . #5#) G190
                         (COND ((> |i| |maxR|) (GO G191)))
                         (SEQ (LETT |s| (QAREF2O A |i| |j| 1 1) . #5#)
                              (SEQ (LETT |k| |minC| . #5#)
                                   (LETT #1# (- |j| 1) . #5#) G190
                                   (COND ((> |k| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (SPADCALL
                                                      (QAREF2O A |i| |k| 1 1)
                                                      (QAREF2O A |k| |j| 1 1)
                                                      (QREFELT $ 17))
                                                     (QREFELT $ 18))
                                           . #5#)))
                                   (LETT |k| (+ |k| 1) . #5#) (GO G190) G191
                                   (EXIT NIL))
                              (QSETAREF2O A |i| |j| |s| 1 1)
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 19)))
                                 (COND ((< |i0| 0) (LETT |i0| |i| . #5#)))))))
                         (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((< |i0| 0) (|error| "singular matrix in LUDecomp"))
                           ('T
                            (SEQ
                             (COND
                              ((SPADCALL |j| |i0| (QREFELT $ 13))
                               (SPADCALL A |j| |i0| (QREFELT $ 21))))
                             (QSETAREF1O |PermV| |j| |i0| 1)
                             (LETT |Pivs| (CONS (QAREF2O A |j| |j| 1 1) |Pivs|)
                                   . #5#)
                             (EXIT
                              (COND
                               ((SPADCALL |j| |maxC| (QREFELT $ 13))
                                (SEQ
                                 (LETT |d|
                                       (SPADCALL (|spadConstant| $ 14)
                                                 (QAREF2O A |j| |j| 1 1)
                                                 (QREFELT $ 22))
                                       . #5#)
                                 (EXIT
                                  (SEQ (LETT |k| (+ |j| 1) . #5#) G190
                                       (COND ((> |k| |maxR|) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF2O A |k| |j|
                                                     (SPADCALL |d|
                                                               (QAREF2O A |k|
                                                                        |j| 1
                                                                        1)
                                                               (QREFELT $ 17))
                                                     1 1)))
                                       (LETT |k| (+ |k| 1) . #5#) (GO G190)
                                       G191 (EXIT NIL))))))))))))
                   (LETT |j| (+ |j| 1) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR A |PermV| |Pivs|)))))))))) 

(DEFUN |LUD;LUSolve;MV2V;2| (LU |Perm| XX $)
  (PROG (|s| |j| |i| |ii| #1=#:G164 |ip| |maxR| |minR| X)
    (RETURN
     (SEQ (LETT X (SPADCALL XX (QREFELT $ 26)) . #2=(|LUD;LUSolve;MV2V;2|))
          (LETT |minR| 1 . #2#)
          (LETT |maxR| (SPADCALL LU (QREFELT $ 10)) . #2#)
          (EXIT
           (COND
            ((SPADCALL (QVSIZE X) |maxR| (QREFELT $ 13))
             (|error| "Wrong dimensions in LUSolve"))
            ('T
             (SEQ (LETT |ii| -1 . #2#)
                  (SEQ (LETT |i| |minR| . #2#) G190
                       (COND ((> |i| |maxR|) (GO G191)))
                       (SEQ (LETT |ip| (QAREF1O |Perm| |i| 1) . #2#)
                            (LETT |s| (QAREF1O X |ip| 1) . #2#)
                            (QSETAREF1O X |ip| (QAREF1O X |i| 1) 1)
                            (COND
                             ((>= |ii| 0)
                              (SEQ (LETT |j| |ii| . #2#)
                                   (LETT #1# (- |i| 1) . #2#) G190
                                   (COND ((> |j| #1#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (SPADCALL
                                                      (QAREF2O LU |i| |j| 1 1)
                                                      (QAREF1O X |j| 1)
                                                      (QREFELT $ 17))
                                                     (QREFELT $ 18))
                                           . #2#)))
                                   (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                                   (EXIT NIL)))
                             ((NULL (SPADCALL |s| (QREFELT $ 19)))
                              (LETT |ii| |i| . #2#)))
                            (EXIT (QSETAREF1O X |i| |s| 1)))
                       (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| |maxR| . #2#) G190
                       (COND ((< |i| |minR|) (GO G191)))
                       (SEQ (LETT |s| (QAREF1O X |i| 1) . #2#)
                            (SEQ (LETT |j| (+ |i| 1) . #2#) G190
                                 (COND ((> |j| |maxR|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |s|
                                         (SPADCALL |s|
                                                   (SPADCALL
                                                    (QAREF2O LU |i| |j| 1 1)
                                                    (QAREF1O X |j| 1)
                                                    (QREFELT $ 17))
                                                   (QREFELT $ 18))
                                         . #2#)))
                                 (LETT |j| (+ |j| 1) . #2#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (QSETAREF1O X |i|
                                         (SPADCALL |s| (QAREF2O LU |i| |i| 1 1)
                                                   (QREFELT $ 22))
                                         1)))
                       (LETT |i| (+ |i| -1) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT X))))))))) 

(DEFUN |LUD;LUInverse;MR;3| (A $)
  (PROG (|res| |v| #1=#:G172 |i| |n| |Alu|)
    (RETURN
     (SEQ (LETT |Alu| (SPADCALL A (QREFELT $ 24)) . #2=(|LUD;LUInverse;MR;3|))
          (LETT |n| (SPADCALL A (QREFELT $ 30)) . #2#)
          (LETT |res| (SPADCALL |n| |n| (|spadConstant| $ 20) (QREFELT $ 31))
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL A (QREFELT $ 10)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 20)) . #2#)
                    (QSETAREF1O |v| |i| (|spadConstant| $ 14) 1)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| |i|
                                     (SPADCALL (QVELT |Alu| 0) (QVELT |Alu| 1)
                                               |v| (QREFELT $ 28))
                                     (QREFELT $ 32))
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |res| (QVELT |Alu| 2))))))) 

(DECLAIM (NOTINLINE |LUDecomposition;|)) 

(DEFUN |LUDecomposition| (#1=#:G173)
  (PROG ()
    (RETURN
     (PROG (#2=#:G174)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|LUDecomposition|)
                                           '|domainEqualList|)
                . #3=(|LUDecomposition|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|LUDecomposition;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|LUDecomposition|))))))))))) 

(DEFUN |LUDecomposition;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LUDecomposition|))
      (LETT |dv$| (LIST '|LUDecomposition| DV$1) . #1#)
      (LETT $ (GETREFV 35) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|LUDecomposition| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|LUDecomposition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Matrix| 6) (0 . |copy|)
              (|Integer|) (5 . |maxRowIndex|) (10 . |maxColIndex|) (|Boolean|)
              (15 . ~=) (21 . |One|) (|OutputForm|) (25 . |empty|) (29 . *)
              (35 . -) (41 . |zero?|) (46 . |Zero|) (50 . |swapRows!|) (57 . /)
              (|Record| (|:| LU 7) (|:| |Perm| 27) (|:| |Pivots| (|List| 6)))
              |LUD;LUDecomp;MR;1| (|Vector| 6) (63 . |copy|) (|Vector| 9)
              |LUD;LUSolve;MV2V;2| (|NonNegativeInteger|) (68 . |ncols|)
              (73 . |new|) (80 . |setColumn!|)
              (|Record| (|:| |Inv| 7) (|:| |Pivots| (|List| 6)))
              |LUD;LUInverse;MR;3|)
           '#(|LUSolve| 87 |LUInverse| 94 |LUDecomp| 99) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 34
                                                 '(1 7 0 0 8 1 7 9 0 10 1 7 9 0
                                                   11 2 9 12 0 0 13 0 6 0 14 0
                                                   15 0 16 2 6 0 0 0 17 2 6 0 0
                                                   0 18 1 6 12 0 19 0 6 0 20 3
                                                   7 0 0 9 9 21 2 6 0 0 0 22 1
                                                   25 0 0 26 1 7 29 0 30 3 7 0
                                                   29 29 6 31 3 7 0 0 9 25 32 3
                                                   0 25 7 27 25 28 1 0 33 7 34
                                                   1 0 23 7 24)))))
           '|lookupComplete|)) 
