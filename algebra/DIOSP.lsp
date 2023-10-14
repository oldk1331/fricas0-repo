
(/VERSIONCHECK 2) 

(DEFUN |DIOSP;dioSolve;ER;1| (|eq| $)
  (PROG (|vars| #1=#:G158 |x| #2=#:G157 |ihs| |hs| |sol| |graph| |mon| |c|
         #3=#:G156 |n| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL (SPADCALL |eq| (QREFELT $ 8))
                      (SPADCALL |eq| (QREFELT $ 9)) (QREFELT $ 10))
            . #4=(|DIOSP;dioSolve;ER;1|))
      (LETT |n| (SPADCALL |p| (QREFELT $ 12)) . #4#)
      (COND
       ((OR (EQL |n| 0) (SPADCALL |n| 1 (QREFELT $ 14)))
        (EXIT (|error| "a linear Diophantine equation is expected"))))
      (LETT |mon| NIL . #4#) (LETT |c| 0 . #4#)
      (SEQ (LETT |x| NIL . #4#) (LETT #3# (SPADCALL |p| (QREFELT $ 16)) . #4#)
           G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |x| (QREFELT $ 17))
               (LETT |c| (SPADCALL |x| (QREFELT $ 19)) . #4#))
              ('T (LETT |mon| (CONS |x| |mon|) . #4#)))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (LETT |graph| (|DIOSP;initializeGraph| |mon| |c| $) . #4#)
      (LETT |sol| (SPADCALL (QVELT |graph| 1) (QREFELT $ 21)) . #4#)
      (LETT |hs|
            (|DIOSP;findSolutions| |sol| (QVELT |graph| 2) 1 1 |graph| 'T $)
            . #4#)
      (LETT |ihs|
            (COND ((EQL |c| 0) (LIST |sol|))
                  (#5='T
                   (|DIOSP;findSolutions| |sol| (+ (QVELT |graph| 2) |c|) 1 1
                    |graph| 'NIL $)))
            . #4#)
      (LETT |vars|
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |x| NIL . #4#) (LETT #1# |mon| . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS (|SPADfirst| (SPADCALL |x| (QREFELT $ 23)))
                                #2#)
                          . #4#)))
                  (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #4#)
      (EXIT
       (VECTOR |vars|
               (COND ((NULL |ihs|) (CONS 1 "failed")) (#5# (CONS 0 |ihs|)))
               |hs|)))))) 

(DEFUN |DIOSP;initializeGraph| (|mon| |c| $)
  (PROG (#1=#:G171 |i| #2=#:G172 |n| |m| |k| |coeffs| #3=#:G170 |x| #4=#:G169)
    (RETURN
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
                           (CONS (|SPADfirst| (SPADCALL |x| (QREFELT $ 28)))
                                 #4#)
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                   (EXIT (NREVERSE #4#))))
             (QREFELT $ 30))
            . #5#)
      (LETT |k| (QVSIZE |coeffs|) . #5#)
      (LETT |m| (MIN |c| (SPADCALL (ELT $ 31) |coeffs| (QREFELT $ 33))) . #5#)
      (LETT |n| (MAX |c| (SPADCALL (ELT $ 34) |coeffs| (QREFELT $ 33))) . #5#)
      (EXIT
       (VECTOR
        (PROGN
         (LETT #2# (GETREFV (|inc_SI| (- |n| |m|))) . #5#)
         (SEQ (LETT |i| |m| . #5#) (LETT #1# 0 . #5#) G190
              (COND ((> |i| |n|) (GO G191)))
              (SEQ
               (EXIT
                (SETELT #2# #1#
                        (|DIOSP;createNode| |i| |coeffs| |k| (- 1 |m|) $))))
              (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (+ |i| 1) . #5#))
                    . #5#)
              (GO G190) G191 (EXIT NIL))
         #2#)
        |k| (- 1 |m|))))))) 

(DEFUN |DIOSP;createNode| (|ind| |coeffs| |k| |zeroNode| $)
  (PROG (#1=#:G175 #2=#:G174 |i| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 35)) . #3=(|DIOSP;createNode|))
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
                        (GO #2#)))))
                    #2# (EXIT #2#)))
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
                        (GO #1#)))))
                    #1# (EXIT #1#))))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |v| 'T)))))) 

(DEFUN |DIOSP;findSolutions| (|sol| |ind| |m| |n| |graph| |flag| $)
  (PROG (|sols| |s| |x| #1=#:G193 |i| |k| |v| |node|)
    (RETURN
     (SEQ (LETT |sols| NIL . #2=(|DIOSP;findSolutions|))
          (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41)) . #2#)
          (EXIT
           (COND
            ((QCDR |node|)
             (SEQ (PROGN (RPLACD |node| 'NIL) (QCDR |node|))
                  (LETT |v| (QCAR |node|) . #2#)
                  (LETT |k|
                        (COND ((< |ind| (QVELT |graph| 2)) |m|) (#3='T |n|))
                        . #2#)
                  (SEQ (LETT |i| |k| . #2#) (LETT #1# (QVELT |graph| 1) . #2#)
                       G190 (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37)) 0
                                     (QREFELT $ 36))
                           (SEQ (SPADCALL |sol| |i| (+ |x| 1) (QREFELT $ 43))
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
                                            . #2#)
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
                                          . #2#)
                                    (LETT |sols| (APPEND |s| |sols|) . #2#)
                                    (EXIT
                                     (SPADCALL |sol| |i| |x|
                                               (QREFELT $ 43))))))))))))
                       (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                  (PROGN (RPLACD |node| 'T) (QCDR |node|)) (EXIT |sols|)))
            (#3# |sols|))))))) 

(DEFUN |DIOSP;verifyMinimality| (|sol| |graph| |flag| $)
  (PROG (#1=#:G196 |x| |i|)
    (RETURN
     (SEQ
      (COND
       (|flag|
        (SEQ (LETT |i| 1 . #2=(|DIOSP;verifyMinimality|))
             (SEQ G190
                  (COND
                   ((NULL (EQL (SPADCALL |sol| |i| (QREFELT $ 42)) 0))
                    (GO G191)))
                  (SEQ (EXIT (LETT |i| (+ |i| 1) . #2#))) NIL (GO G190) G191
                  (EXIT NIL))
             (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)) . #2#)
             (SPADCALL |sol| |i|
                       (PROG1 (LETT #1# (- |x| 1) . #2#)
                         (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                          #1#))
                       (QREFELT $ 43))
             (LETT |flag|
                   (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1 |graph|
                    $)
                   . #2#)
             (SPADCALL |sol| |i| |x| (QREFELT $ 43)) (EXIT |flag|)))
       ('T (|DIOSP;verifySolution| |sol| (QVELT |graph| 2) 1 1 |graph| $))))))) 

(DEFUN |DIOSP;verifySolution| (|sol| |ind| |m| |n| |graph| $)
  (PROG (#1=#:G207 |flag| #2=#:G202 |x| #3=#:G212 |i| |k| |v| |node|)
    (RETURN
     (SEQ (LETT |flag| 'T . #4=(|DIOSP;verifySolution|))
          (LETT |node| (SPADCALL (QVELT |graph| 0) |ind| (QREFELT $ 41)) . #4#)
          (LETT |v| (QCAR |node|) . #4#)
          (LETT |k| (COND ((< |ind| (QVELT |graph| 2)) |m|) ('T |n|)) . #4#)
          (SEQ (LETT |i| |k| . #4#) (LETT #3# (QVELT |graph| 1) . #4#) G190
               (COND ((OR (> |i| #3#) (NULL |flag|)) (GO G191)))
               (SEQ (LETT |x| (SPADCALL |sol| |i| (QREFELT $ 42)) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |x| 0 (QREFELT $ 14))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |v| |i| (QREFELT $ 37)) 0
                                     (QREFELT $ 36))
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (SPADCALL |sol| |i|
                                             (PROG1 (LETT #2# (- |x| 1) . #4#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             (QREFELT $ 43))
                                   (EXIT
                                    (COND
                                     ((EQL (SPADCALL |v| |i| (QREFELT $ 37))
                                           (QVELT |graph| 2))
                                      (SEQ (LETT |flag| 'NIL . #4#)
                                           (EXIT
                                            (SPADCALL |sol| |i| |x|
                                                      (QREFELT $ 43)))))
                                     ('T
                                      (SEQ
                                       (LETT |flag|
                                             (COND
                                              ((< |ind| (QVELT |graph| 2))
                                               (|DIOSP;verifySolution| |sol|
                                                (SPADCALL |v| |i|
                                                          (QREFELT $ 37))
                                                |i| |n| |graph| $))
                                              ('T
                                               (|DIOSP;verifySolution| |sol|
                                                (SPADCALL |v| |i|
                                                          (QREFELT $ 37))
                                                |m| |i| |graph| $)))
                                             . #4#)
                                       (EXIT
                                        (SPADCALL |sol| |i| |x|
                                                  (QREFELT $ 43))))))))
                                  . #4#)
                            (GO #1#)))))
                        #1# (EXIT #1#))))))
               (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |flag|))))) 

(DEFUN |DiophantineSolutionPackage| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G214)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DiophantineSolutionPackage|)
                . #2=(|DiophantineSolutionPackage|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DiophantineSolutionPackage|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|DiophantineSolutionPackage;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|DiophantineSolutionPackage|))))))))))) 

(DEFUN |DiophantineSolutionPackage;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
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
      $)))) 

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
              (97 . |setelt|) (|Record| (|:| |vert| 29) (|:| |free| 13))
              (|Vector| 39) (104 . |elt|) (110 . |elt|) (116 . |setelt|)
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
