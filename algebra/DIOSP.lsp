
(SDEFUN |DIOSP;dioSolve;ER;1|
        ((|eq| |Equation| (|Polynomial| (|Integer|)))
         ($ |Record| (|:| |varOrder| (|List| (|Symbol|)))
          (|:| |inhom|
               (|Union| (|List| (|Vector| (|NonNegativeInteger|))) "failed"))
          (|:| |hom| (|List| (|Vector| (|NonNegativeInteger|))))))
        (SPROG
         ((|vars| (|List| (|Symbol|))) (#1=#:G135 NIL) (|x| NIL)
          (#2=#:G134 NIL) (|ihs| #3=(|List| (|Vector| (|NonNegativeInteger|))))
          (|hs| #3#) (|sol| (|Vector| (|NonNegativeInteger|)))
          (|graph|
           (|Record|
            (|:| |vn|
                 (|Vector|
                  (|Record| (|:| |vert| (|Vector| (|Integer|)))
                            (|:| |is_free| (|Boolean|)))))
            (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|))))
          (|mon| (|List| (|Polynomial| (|Integer|)))) (|c| (|Integer|))
          (#4=#:G133 NIL) (|n| (|NonNegativeInteger|))
          (|p| (|Polynomial| (|Integer|))))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL |eq| (QREFELT $ 8))
                          (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 10))
                . #5=(|DIOSP;dioSolve;ER;1|))
          (LETT |n| (SPADCALL |p| (QREFELT $ 12)) . #5#)
          (COND
           ((OR (EQL |n| 0) (SPADCALL |n| 1 (QREFELT $ 14)))
            (EXIT (|error| "a linear Diophantine equation is expected"))))
          (LETT |mon| NIL . #5#) (LETT |c| 0 . #5#)
          (SEQ (LETT |x| NIL . #5#)
               (LETT #4# (SPADCALL |p| (QREFELT $ 16)) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 17))
                   (LETT |c| (SPADCALL |x| (QREFELT $ 19)) . #5#))
                  ('T (LETT |mon| (CONS |x| |mon|) . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |graph| (|DIOSP;initializeGraph| |mon| |c| $) . #5#)
          (LETT |sol| (SPADCALL (QVELT |graph| 1) (QREFELT $ 21)) . #5#)
          (LETT |hs|
                (|DIOSP;findSolutions| |sol| (QVELT |graph| 2) 1 1 |graph| 'T
                 $)
                . #5#)
          (LETT |ihs|
                (COND ((EQL |c| 0) (LIST |sol|))
                      (#6='T
                       (|DIOSP;findSolutions| |sol| (+ (QVELT |graph| 2) |c|) 1
                        1 |graph| 'NIL $)))
                . #5#)
          (LETT |vars|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |x| NIL . #5#) (LETT #1# |mon| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (|SPADfirst| (SPADCALL |x| (QREFELT $ 23)))
                                    #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT
           (VECTOR |vars|
                   (COND ((NULL |ihs|) (CONS 1 "failed")) (#6# (CONS 0 |ihs|)))
                   |hs|))))) 

(SDEFUN |DIOSP;initializeGraph|
        ((|mon| |List| (|Polynomial| (|Integer|))) (|c| |Integer|)
         ($ |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| (|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|))))
        (SPROG
         ((#1=#:G148 NIL) (|i| NIL) (#2=#:G149 NIL) (|n| (|Integer|))
          (|m| (|Integer|)) (|k| (|NonNegativeInteger|))
          (|coeffs| (|Vector| (|Integer|))) (#3=#:G147 NIL) (|x| NIL)
          (#4=#:G146 NIL))
         (SEQ
          (LETT |coeffs|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5=(|DIOSP;initializeGraph|))
                  (SEQ (LETT |x| NIL . #5#) (LETT #3# |mon| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (|SPADfirst| (SPADCALL |x| (QREFELT $ 28)))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (QREFELT $ 30))
                . #5#)
          (LETT |k| (QVSIZE |coeffs|) . #5#)
          (LETT |m| (MIN |c| (SPADCALL (ELT $ 31) |coeffs| (QREFELT $ 33)))
                . #5#)
          (LETT |n| (MAX |c| (SPADCALL (ELT $ 34) |coeffs| (QREFELT $ 33)))
                . #5#)
          (EXIT
           (VECTOR
            (PROGN
             (LETT #2# (GETREFV (|inc_SI| (- |n| |m|))) . #5#)
             (SEQ (LETT |i| |m| . #5#) (LETT #1# 0 . #5#) G190
                  (COND ((> |i| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #2# #1#
                            (|DIOSP;createNode| |i| |coeffs| |k| (- 1 |m|)
                             $))))
                  (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #5#))
                        . #5#)
                  (GO G190) G191 (EXIT NIL))
             #2#)
            |k| (- 1 |m|)))))) 

(SDEFUN |DIOSP;createNode|
        ((|ind| |Integer|) (|coeffs| |Vector| (|Integer|))
         (|k| |NonNegativeInteger|) (|zeroNode| |Integer|)
         ($ |Record| (|:| |vert| (|Vector| (|Integer|)))
          (|:| |is_free| (|Boolean|))))
        (SPROG
         ((#1=#:G157 NIL) (#2=#:G156 NIL) (|i| NIL)
          (|v| (|Vector| (|Integer|))))
         (SEQ
          (LETT |v| (SPADCALL |k| (QREFELT $ 35)) . #3=(|DIOSP;createNode|))
          (SEQ (LETT |i| 1 . #3#) G190
               (COND ((|greater_SI| |i| |k|) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |ind| 0 (QREFELT $ 36))
                   (SEQ
                    (EXIT
                     (COND
                      ((< (SPADCALL |coeffs| |i| (QREFELT $ 37)) 0)
                       (PROGN
                        (LETT #2#
                              (SPADCALL |v| |i|
                                        (+ (+ |zeroNode| |ind|)
                                           (SPADCALL |coeffs| |i|
                                                     (QREFELT $ 37)))
                                        (QREFELT $ 38))
                              . #3#)
                        (GO #4=#:G151)))))
                    #4# (EXIT #2#)))
                  ('T
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |coeffs| |i| (QREFELT $ 37)) 0
                                 (QREFELT $ 36))
                       (PROGN
                        (LETT #1#
                              (SPADCALL |v| |i|
                                        (+ (+ |zeroNode| |ind|)
                                           (SPADCALL |coeffs| |i|
                                                     (QREFELT $ 37)))
                                        (QREFELT $ 38))
                              . #3#)
                        (GO #5=#:G152)))))
                    #5# (EXIT #1#))))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |v| 'T))))) 

(SDEFUN |DIOSP;findSolutions|
        ((|sol| |Vector| (|NonNegativeInteger|)) (|ind| |Integer|)
         (|m| |Integer|) (|n| . #1=(|Integer|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| #2=(|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         (|flag| |Boolean|) ($ |List| (|Vector| (|NonNegativeInteger|))))
        (SPROG
         ((|sols| (|List| (|Vector| (|NonNegativeInteger|))))
          (|s| (|List| (|Vector| (|NonNegativeInteger|))))
          (|x| (|NonNegativeInteger|)) (#3=#:G172 NIL) (|i| NIL) (|k| #1#)
          (|v| #2#)
          (|node|
           (|Record| (|:| |vert| (|Vector| (|Integer|)))
                     (|:| |is_free| (|Boolean|)))))
         (SEQ (LETT |sols| NIL . #4=(|DIOSP;findSolutions|))
              (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41))
                    . #4#)
              (EXIT
               (COND
                ((QCDR |node|)
                 (SEQ (PROGN (RPLACD |node| 'NIL) (QCDR |node|))
                      (LETT |v| (QCAR |node|) . #4#)
                      (LETT |k|
                            (COND ((< |ind| (QVELT |graph| 2)) |m|)
                                  (#5='T |n|))
                            . #4#)
                      (SEQ (LETT |i| |k| . #4#)
                           (LETT #3# (QVELT |graph| 1) . #4#) G190
                           (COND ((> |i| #3#) (GO G191)))
                           (SEQ
                            (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42))
                                  . #4#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37)) 0
                                         (QREFELT $ 36))
                               (SEQ
                                (SPADCALL |sol| |i| (+ |x| 1) (QREFELT $ 43))
                                (EXIT
                                 (COND
                                  ((EQL (SPADCALL |v| |i| (QREFELT $ 37))
                                        (QVELT |graph| 2))
                                   (COND
                                    ((|DIOSP;verifyMinimality| |sol| |graph|
                                      |flag| $)
                                     (SEQ
                                      (LETT |sols|
                                            (CONS
                                             (SPADCALL |sol| (QREFELT $ 44))
                                             |sols|)
                                            . #4#)
                                      (EXIT
                                       (SPADCALL |sol| |i| |x|
                                                 (QREFELT $ 43)))))
                                    ('T
                                     (SPADCALL |sol| |i| |x| (QREFELT $ 43)))))
                                  ('T
                                   (SEQ
                                    (LETT |s|
                                          (COND
                                           ((< |ind| (QVELT |graph| 2))
                                            (|DIOSP;findSolutions| |sol|
                                             (SPADCALL |v| |i| (QREFELT $ 37))
                                             |i| |n| |graph| |flag| $))
                                           ('T
                                            (|DIOSP;findSolutions| |sol|
                                             (SPADCALL |v| |i| (QREFELT $ 37))
                                             |m| |i| |graph| |flag| $)))
                                          . #4#)
                                    (LETT |sols| (APPEND |s| |sols|) . #4#)
                                    (EXIT
                                     (SPADCALL |sol| |i| |x|
                                               (QREFELT $ 43))))))))))))
                           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (PROGN (RPLACD |node| 'T) (QCDR |node|)) (EXIT |sols|)))
                (#5# |sols|)))))) 

(SDEFUN |DIOSP;verifyMinimality|
        ((|sol| |Vector| (|NonNegativeInteger|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| (|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         (|flag| |Boolean|) ($ |Boolean|))
        (SPROG
         ((#1=#:G175 NIL) (|x| (|NonNegativeInteger|))
          (|i| (|NonNegativeInteger|)))
         (SEQ
          (COND
           (|flag|
            (SEQ (LETT |i| 1 . #2=(|DIOSP;verifyMinimality|))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |sol| |i| (QREFELT $ 42)) 0))
                        (GO G191)))
                      (SEQ (EXIT (LETT |i| (+ |i| 1) . #2#))) NIL (GO G190)
                      G191 (EXIT NIL))
                 (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)) . #2#)
                 (SPADCALL |sol| |i|
                           (PROG1 (LETT #1# (- |x| 1) . #2#)
                             (|check_subtype| (>= #1# 0)
                                              '(|NonNegativeInteger|) #1#))
                           (QREFELT $ 43))
                 (LETT |flag|
                       (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1
                        |graph| $)
                       . #2#)
                 (SPADCALL |sol| |i| |x| (QREFELT $ 43)) (EXIT |flag|)))
           ('T
            (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1 |graph| $)))))) 

(SDEFUN |DIOSP;verifySolution|
        ((|sol| |Vector| (|NonNegativeInteger|)) (|ind| |Integer|)
         (|m| |Integer|) (|n| . #1=(|Integer|))
         (|graph| |Record|
          (|:| |vn|
               (|Vector|
                (|Record| (|:| |vert| #2=(|Vector| (|Integer|)))
                          (|:| |is_free| (|Boolean|)))))
          (|:| |dim| (|NonNegativeInteger|)) (|:| |zeroNode| (|Integer|)))
         ($ |Boolean|))
        (SPROG
         ((#3=#:G191 NIL) (|flag| (|Boolean|)) (#4=#:G181 NIL)
          (|x| (|NonNegativeInteger|)) (#5=#:G192 NIL) (|i| NIL) (|k| #1#)
          (|v| #2#)
          (|node|
           (|Record| (|:| |vert| (|Vector| (|Integer|)))
                     (|:| |is_free| (|Boolean|)))))
         (SEQ (LETT |flag| 'T . #6=(|DIOSP;verifySolution|))
              (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41))
                    . #6#)
              (LETT |v| (QCAR |node|) . #6#)
              (LETT |k| (COND ((< |ind| (QVELT |graph| 2)) |m|) ('T |n|))
                    . #6#)
              (SEQ (LETT |i| |k| . #6#) (LETT #5# (QVELT |graph| 1) . #6#) G190
                   (COND ((OR (> |i| #5#) (NULL |flag|)) (GO G191)))
                   (SEQ (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)) . #6#)
                        (EXIT
                         (COND
                          ((SPADCALL |x| 0 (QREFELT $ 14))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37)) 0
                                         (QREFELT $ 36))
                               (PROGN
                                (LETT #3#
                                      (SEQ
                                       (SPADCALL |sol| |i|
                                                 (PROG1
                                                     (LETT #4# (- |x| 1) . #6#)
                                                   (|check_subtype| (>= #4# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #4#))
                                                 (QREFELT $ 43))
                                       (EXIT
                                        (COND
                                         ((EQL
                                           (SPADCALL |v| |i| (QREFELT $ 37))
                                           (QVELT |graph| 2))
                                          (SEQ (LETT |flag| 'NIL . #6#)
                                               (EXIT
                                                (SPADCALL |sol| |i| |x|
                                                          (QREFELT $ 43)))))
                                         ('T
                                          (SEQ
                                           (LETT |flag|
                                                 (COND
                                                  ((< |ind| (QVELT |graph| 2))
                                                   (|DIOSP;verifySolution|
                                                    |sol|
                                                    (SPADCALL |v| |i|
                                                              (QREFELT $ 37))
                                                    |i| |n| |graph| $))
                                                  ('T
                                                   (|DIOSP;verifySolution|
                                                    |sol|
                                                    (SPADCALL |v| |i|
                                                              (QREFELT $ 37))
                                                    |m| |i| |graph| $)))
                                                 . #6#)
                                           (EXIT
                                            (SPADCALL |sol| |i| |x|
                                                      (QREFELT $ 43))))))))
                                      . #6#)
                                (GO #7=#:G186)))))
                            #7# (EXIT #3#))))))
                   (LETT |i| (+ |i| 1) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |flag|)))) 

(DECLAIM (NOTINLINE |DiophantineSolutionPackage;|)) 

(DEFUN |DiophantineSolutionPackage| ()
  (SPROG NIL
         (PROG (#1=#:G194)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DiophantineSolutionPackage|)
                    . #2=(|DiophantineSolutionPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DiophantineSolutionPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DiophantineSolutionPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DiophantineSolutionPackage|)))))))))) 

(DEFUN |DiophantineSolutionPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DiophantineSolutionPackage|)
                . #1=(|DiophantineSolutionPackage|))
          (LETT $ (GETREFV 45) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DiophantineSolutionPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|DiophantineSolutionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Polynomial| 18) (|Equation| 6)
              (0 . |lhs|) (5 . |rhs|) (10 . -) (|NonNegativeInteger|)
              (16 . |totalDegree|) (|Boolean|) (21 . >) (|List| $)
              (27 . |monomials|) (32 . |ground?|) (|Integer|) (37 . |ground|)
              (|Vector| 11) (42 . |zero|) (|List| (|Symbol|))
              (47 . |variables|) (|Union| (|List| 20) '"failed")
              (|Record| (|:| |varOrder| 22) (|:| |inhom| 24)
                        (|:| |hom| (|List| 20)))
              |DIOSP;dioSolve;ER;1| (|List| 18) (52 . |coefficients|)
              (|Vector| 18) (57 . |vector|) (62 . |min|) (|Mapping| 18 18 18)
              (68 . |reduce|) (74 . |max|) (80 . |zero|) (85 . >) (91 . |elt|)
              (97 . |setelt!|) (|Record| (|:| |vert| 29) (|:| |is_free| 13))
              (|Vector| 39) (104 . |elt|) (110 . |elt|) (116 . |setelt!|)
              (123 . |copy|))
           '#(|dioSolve| 128) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 44
                                                 '(1 7 6 0 8 1 7 6 0 9 2 6 0 0
                                                   0 10 1 6 11 0 12 2 11 13 0 0
                                                   14 1 6 15 0 16 1 6 13 0 17 1
                                                   6 18 0 19 1 20 0 11 21 1 6
                                                   22 0 23 1 6 27 0 28 1 29 0
                                                   27 30 2 18 0 0 0 31 2 29 18
                                                   32 0 33 2 18 0 0 0 34 1 29 0
                                                   11 35 2 18 13 0 0 36 2 29 18
                                                   0 18 37 3 29 18 0 18 18 38 2
                                                   40 39 0 18 41 2 20 11 0 18
                                                   42 3 20 11 0 18 11 43 1 20 0
                                                   0 44 1 0 25 7 26)))))
           '|lookupComplete|)) 

(MAKEPROP '|DiophantineSolutionPackage| 'NILADIC T) 
