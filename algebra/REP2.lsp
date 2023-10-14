
(/VERSIONCHECK 2) 

(DEFUN |REP2;blockMultiply| (|a| |b| |li| |n| $)
  (PROG (#1=#:G147 #2=#:G146 #3=#:G148 |s| #4=#:G155 |j| #5=#:G154 #6=#:G153
         |i| #7=#:G152)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #7# NIL . #8=(|REP2;blockMultiply|))
        (SEQ (LETT |i| NIL . #8#) (LETT #6# |li| . #8#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #8#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #7#
                     (CONS
                      (PROGN
                       (LETT #5# NIL . #8#)
                       (SEQ (LETT |j| NIL . #8#) (LETT #4# |li| . #8#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |j| (CAR #4#) . #8#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #5#
                                    (CONS
                                     (PROGN
                                      (LETT #1# NIL . #8#)
                                      (SEQ (LETT |s| 1 . #8#) G190
                                           (COND
                                            ((|greater_SI| |s| |n|) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (PROGN
                                              (LETT #3#
                                                    (SPADCALL
                                                     (SPADCALL |a| |i| |s|
                                                               (QREFELT $ 9))
                                                     (SPADCALL |b| |s| |j|
                                                               (QREFELT $ 9))
                                                     (QREFELT $ 10))
                                                    . #8#)
                                              (COND
                                               (#1#
                                                (LETT #2#
                                                      (SPADCALL #2# #3#
                                                                (QREFELT $ 11))
                                                      . #8#))
                                               ('T
                                                (PROGN
                                                 (LETT #2# #3# . #8#)
                                                 (LETT #1# 'T . #8#)))))))
                                           (LETT |s| (|inc_SI| |s|) . #8#)
                                           (GO G190) G191 (EXIT NIL))
                                      (COND (#1# #2#)
                                            ('T (|spadConstant| $ 12))))
                                     #5#)
                                    . #8#)))
                            (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      #7#)
                     . #8#)))
             (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT (NREVERSE #7#))))
       (QREFELT $ 14)))))) 

(DEFUN |REP2;fingerPrint| (|i| |a| |b| |x| $)
  (PROG (#1=#:G171 #2=#:G169 #3=#:G167 #4=#:G165 #5=#:G163 #6=#:G161)
    (RETURN
     (SEQ
      (COND
       ((EQL
         (PROG1 (LETT #6# |i| . #7=(|REP2;fingerPrint|))
           (|check_subtype| (> #6# 0) '(|PositiveInteger|) #6#))
         1)
        (LETT |x|
              (SPADCALL (SPADCALL |a| |b| (QREFELT $ 16))
                        (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))
              . #7#))
       ((EQL
         (PROG1 (LETT #5# |i| . #7#)
           (|check_subtype| (> #5# 0) '(|PositiveInteger|) #5#))
         2)
        (LETT |x|
              (SPADCALL
               (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))
               |b| (QREFELT $ 17))
              . #7#))
       ((EQL
         (PROG1 (LETT #4# |i| . #7#)
           (|check_subtype| (> #4# 0) '(|PositiveInteger|) #4#))
         3)
        (LETT |x|
              (SPADCALL |a| (SPADCALL |b| |x| (QREFELT $ 17)) (QREFELT $ 16))
              . #7#))
       ((EQL
         (PROG1 (LETT #3# |i| . #7#)
           (|check_subtype| (> #3# 0) '(|PositiveInteger|) #3#))
         4)
        (LETT |x| (SPADCALL |x| |b| (QREFELT $ 16)) . #7#))
       ((EQL
         (PROG1 (LETT #2# |i| . #7#)
           (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
         5)
        (LETT |x|
              (SPADCALL |x| (SPADCALL |a| |b| (QREFELT $ 17)) (QREFELT $ 16))
              . #7#))
       ((EQL
         (PROG1 (LETT #1# |i| . #7#)
           (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
         6)
        (LETT |x|
              (SPADCALL (SPADCALL |x| |a| (QREFELT $ 18))
                        (SPADCALL |b| |a| (QREFELT $ 17)) (QREFELT $ 16))
              . #7#))
       ('T
        (SEQ (|error| "Sorry, but there are only 6 fingerprints!")
             (EXIT |x|)))))))) 

(DEFUN |REP2;completeEchelonBasis;VM;3| (|basis| $)
  (PROG (|j| |newStart| |indexOfVectorToBeScanned| |row| |completedBasis| |i|
         |n| |dimensionOfSubmodule|)
    (RETURN
     (SEQ
      (LETT |dimensionOfSubmodule| (QVSIZE |basis|)
            . #1=(|REP2;completeEchelonBasis;VM;3|))
      (LETT |n| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 21))) . #1#)
      (LETT |indexOfVectorToBeScanned| 1 . #1#)
      (LETT |row| |dimensionOfSubmodule| . #1#)
      (LETT |completedBasis| (SPADCALL |n| |n| (QREFELT $ 23)) . #1#)
      (SEQ (LETT |i| 1 . #1#) G190
           (COND ((|greater_SI| |i| |dimensionOfSubmodule|) (GO G191)))
           (SEQ
            (EXIT
             (LETT |completedBasis|
                   (SPADCALL |completedBasis| |i|
                             (SPADCALL |basis| |i| (QREFELT $ 21))
                             (QREFELT $ 24))
                   . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL (QVSIZE |basis|) |n| (QREFELT $ 26))
        (SEQ (LETT |newStart| 1 . #1#)
             (SEQ (LETT |j| 1 . #1#) G190
                  (COND
                   ((OR (|greater_SI| |j| |n|)
                        (NULL
                         (SPADCALL |indexOfVectorToBeScanned|
                                   |dimensionOfSubmodule| (QREFELT $ 26))))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL |basis| |indexOfVectorToBeScanned|
                                 (QREFELT $ 21))
                       |j| (QREFELT $ 27))
                      (|spadConstant| $ 12) (QREFELT $ 28))
                     (SEQ
                      (SPADCALL |completedBasis| (+ 1 |row|) |j|
                                (|spadConstant| $ 15) (QREFELT $ 29))
                      (EXIT (LETT |row| (+ |row| 1) . #1#))))
                    ('T
                     (LETT |indexOfVectorToBeScanned|
                           (+ |indexOfVectorToBeScanned| 1) . #1#)))
                   (EXIT (LETT |newStart| (+ |j| 1) . #1#)))
                  (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (SEQ (LETT |j| |newStart| . #1#) G190
                   (COND ((> |j| |n|) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |completedBasis| |j| |j| (|spadConstant| $ 15)
                               (QREFELT $ 29))))
                   (LETT |j| (+ |j| 1) . #1#) (GO G190) G191 (EXIT NIL))))))
      (EXIT |completedBasis|))))) 

(DEFUN |REP2;createRandomElement;L2M;4| (|aG| |algElt| $)
  (PROG (|randomIndex| |numberOfGenerators|)
    (RETURN
     (SEQ
      (LETT |numberOfGenerators| (LENGTH |aG|)
            . #1=(|REP2;createRandomElement;L2M;4|))
      (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #1#)
      (LETT |algElt|
            (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                      (QREFELT $ 17))
            . #1#)
      (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #1#)
      (EXIT
       (SPADCALL |algElt| (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                 (QREFELT $ 16))))))) 

(DEFUN |REP2;cyclicSubmodule;LVV;5| (|lm| |v| $)
  (PROG (#1=#:G199 |i| #2=#:G198 |furtherElts| |updateFurtherElts| #3=#:G197
         #4=#:G196 |basis| |addedToBasis| |nextVector| |w| #5=#:G195 #6=#:G194)
    (RETURN
     (SEQ
      (LETT |basis|
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                       (QREFELT $ 14))
             (QREFELT $ 37))
            . #7=(|REP2;cyclicSubmodule;LVV;5|))
      (LETT |furtherElts|
            (PROGN
             (LETT #6# NIL . #7#)
             (SEQ (LETT |i| 1 . #7#)
                  (LETT #5# (SPADCALL |lm| (QREFELT $ 38)) . #7#) G190
                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6#
                          (CONS
                           (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32)) |v|
                                     (QREFELT $ 39))
                           #6#)
                          . #7#)))
                  (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |furtherElts|) 'NIL)
                    ('T (< (QVSIZE |basis|) (QVSIZE |v|)))))
             (GO G191)))
           (SEQ (LETT |w| (|SPADfirst| |furtherElts|) . #7#)
                (LETT |nextVector|
                      (SPADCALL
                       (SPADCALL (SPADCALL |w| (QREFELT $ 35)) (QREFELT $ 36))
                       (QREFELT $ 14))
                      . #7#)
                (LETT |addedToBasis|
                      (SPADCALL |basis| |nextVector| (QREFELT $ 40)) . #7#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                             (QVSIZE |basis|) (QREFELT $ 42))
                   (SEQ
                    (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 37))
                          . #7#)
                    (LETT |updateFurtherElts|
                          (PROGN
                           (LETT #4# NIL . #7#)
                           (SEQ (LETT |i| 1 . #7#)
                                (LETT #3# (SPADCALL |lm| (QREFELT $ 38)) . #7#)
                                G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |lm| |i| (QREFELT $ 32))
                                          |w| (QREFELT $ 39))
                                         #4#)
                                        . #7#)))
                                (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          . #7#)
                    (EXIT
                     (LETT |furtherElts|
                           (APPEND (CDR |furtherElts|) |updateFurtherElts|)
                           . #7#))))
                  ('T (LETT |furtherElts| (CDR |furtherElts|) . #7#)))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #7#)
         (SEQ (LETT |i| 1 . #7#)
              (LETT #1# (SPADCALL |basis| (QREFELT $ 43)) . #7#) G190
              (COND ((|greater_SI| |i| #1#) (GO G191)))
              (SEQ
               (EXIT
                (LETT #2# (CONS (SPADCALL |basis| |i| (QREFELT $ 44)) #2#)
                      . #7#)))
              (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
              (EXIT (NREVERSE #2#))))
        (QREFELT $ 46))))))) 

(DEFUN |REP2;standardBasisOfCyclicSubmodule;LVM;6| (|lm| |v| $)
  (PROG (|furtherElts| |updateFurtherElts| #1=#:G210 |i| #2=#:G209 |basis|
         |standardBasis| |addedToBasis| |nextVector| |w| #3=#:G208 #4=#:G207
         |dim|)
    (RETURN
     (SEQ
      (LETT |dim| (QVSIZE |v|)
            . #5=(|REP2;standardBasisOfCyclicSubmodule;LVM;6|))
      (LETT |standardBasis|
            (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36)) . #5#)
      (LETT |basis|
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |v| (QREFELT $ 35)) (QREFELT $ 36))
                       (QREFELT $ 14))
             (QREFELT $ 37))
            . #5#)
      (LETT |furtherElts|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |i| 1 . #5#)
                  (LETT #3# (SPADCALL |lm| (QREFELT $ 38)) . #5#) G190
                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL (SPADCALL |lm| |i| (QREFELT $ 32)) |v|
                                     (QREFELT $ 39))
                           #4#)
                          . #5#)))
                  (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |furtherElts|) 'NIL)
                    ('T (< (QVSIZE |basis|) (QVSIZE |v|)))))
             (GO G191)))
           (SEQ (LETT |w| (|SPADfirst| |furtherElts|) . #5#)
                (LETT |nextVector|
                      (SPADCALL
                       (SPADCALL (SPADCALL |w| (QREFELT $ 35)) (QREFELT $ 36))
                       (QREFELT $ 14))
                      . #5#)
                (LETT |addedToBasis|
                      (SPADCALL |basis| |nextVector| (QREFELT $ 40)) . #5#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |addedToBasis| (QREFELT $ 41))
                             (QVSIZE |basis|) (QREFELT $ 42))
                   (SEQ
                    (LETT |standardBasis|
                          (CONS (SPADCALL |w| (QREFELT $ 35)) |standardBasis|)
                          . #5#)
                    (LETT |basis| (SPADCALL |addedToBasis| (QREFELT $ 37))
                          . #5#)
                    (LETT |updateFurtherElts|
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |i| 1 . #5#)
                                (LETT #1# (SPADCALL |lm| (QREFELT $ 38)) . #5#)
                                G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |lm| |i| (QREFELT $ 32))
                                          |w| (QREFELT $ 39))
                                         #2#)
                                        . #5#)))
                                (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          . #5#)
                    (EXIT
                     (LETT |furtherElts|
                           (APPEND (CDR |furtherElts|) |updateFurtherElts|)
                           . #5#))))
                  ('T (LETT |furtherElts| (CDR |furtherElts|) . #5#)))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (SPADCALL |standardBasis| (QREFELT $ 14)) (QREFELT $ 48))))))) 

(DEFUN |REP2;splitInternal| (|algebraGenerators| |vector| |doSplitting?| $)
  (PROG (|factormoduleRepresentation| |submoduleRepresentation| |helpMatrix|
         #1=#:G225 |i| |inverseTransitionMatrix| |transitionMatrix|
         |factormoduleIndices| #2=#:G224 |submoduleIndices| #3=#:G223
         |rankOfSubmodule| |submodule| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |vector|) . #4=(|REP2;splitInternal|))
          (LETT |submodule|
                (SPADCALL |algebraGenerators| |vector| (QREFELT $ 47)) . #4#)
          (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #4#)
          (LETT |submoduleRepresentation| NIL . #4#)
          (LETT |factormoduleRepresentation| NIL . #4#)
          (EXIT
           (COND
            ((SPADCALL |n| |rankOfSubmodule| (QREFELT $ 50))
             (SEQ
              (SPADCALL "  A proper cyclic submodule is found." (QREFELT $ 54))
              (COND
               (|doSplitting?|
                (SEQ
                 (LETT |submoduleIndices|
                       (PROGN
                        (LETT #3# NIL . #4#)
                        (SEQ (LETT |i| 1 . #4#) G190
                             (COND
                              ((|greater_SI| |i| |rankOfSubmodule|) (GO G191)))
                             (SEQ (EXIT (LETT #3# (CONS |i| #3#) . #4#)))
                             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       . #4#)
                 (LETT |factormoduleIndices|
                       (PROGN
                        (LETT #2# NIL . #4#)
                        (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #4#) G190
                             (COND ((> |i| |n|) (GO G191)))
                             (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #4#)))
                             (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #4#)
                 (LETT |transitionMatrix|
                       (SPADCALL (SPADCALL |submodule| (QREFELT $ 30))
                                 (QREFELT $ 48))
                       . #4#)
                 (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
                 (LETT |inverseTransitionMatrix|
                       (QCDR (SPADCALL |transitionMatrix| (QREFELT $ 56)))
                       . #4#)
                 (SPADCALL "  The inverse of the transition matrix computed"
                           (QREFELT $ 54))
                 (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
                 (EXIT
                  (SEQ (LETT |i| 1 . #4#)
                       (LETT #1# (SPADCALL |algebraGenerators| (QREFELT $ 38))
                             . #4#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (LETT |helpMatrix|
                              (SPADCALL |inverseTransitionMatrix|
                                        (SPADCALL |algebraGenerators| |i|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 17))
                              . #4#)
                        (LETT |submoduleRepresentation|
                              (CONS
                               (|REP2;blockMultiply| |helpMatrix|
                                |transitionMatrix| |submoduleIndices| |n| $)
                               |submoduleRepresentation|)
                              . #4#)
                        (EXIT
                         (LETT |factormoduleRepresentation|
                               (CONS
                                (|REP2;blockMultiply| |helpMatrix|
                                 |transitionMatrix| |factormoduleIndices| |n|
                                 $)
                                |factormoduleRepresentation|)
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))))))
              (EXIT
               (LIST (REVERSE |submoduleRepresentation|)
                     (REVERSE |factormoduleRepresentation|)))))
            ('T
             (SEQ
              (SPADCALL "  The generated cyclic submodule was not proper"
                        (QREFELT $ 54))
              (EXIT (LIST |algebraGenerators|)))))))))) 

(DEFUN |REP2;irreducibilityTestInternal|
       (|algebraGenerators| |singularMatrix| |split?| $)
  (PROG (|mat| #1=#:G242 |j| #2=#:G241 |i| |result| |kernel| |xt|
         |algebraGeneratorsTranspose| #3=#:G240 #4=#:G239)
    (RETURN
     (SEQ
      (LETT |algebraGeneratorsTranspose|
            (PROGN
             (LETT #4# NIL . #5=(|REP2;irreducibilityTestInternal|))
             (SEQ (LETT |j| 1 . #5#)
                  (LETT #3# (SPADCALL |algebraGenerators| (QREFELT $ 38))
                        . #5#)
                  G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (SPADCALL
                            (SPADCALL |algebraGenerators| |j| (QREFELT $ 32))
                            (QREFELT $ 48))
                           #4#)
                          . #5#)))
                  (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |xt| (SPADCALL |singularMatrix| (QREFELT $ 48)) . #5#)
      (SPADCALL "  We know that all the cyclic submodules generated by all"
                (QREFELT $ 54))
      (SPADCALL "    non-trivial element of the singular matrix under view are"
                (QREFELT $ 54))
      (SPADCALL
       "    not proper, hence Norton's irreducibility test can be done:"
       (QREFELT $ 54))
      (LETT |kernel| (SPADCALL |xt| (QREFELT $ 57)) . #5#)
      (LETT |result|
            (|REP2;splitInternal| |algebraGeneratorsTranspose|
             (|SPADfirst| |kernel|) |split?| $)
            . #5#)
      (COND
       ((NULL (CDR |result|))
        (COND
         ((EQL 1 (LENGTH |kernel|))
          (SPADCALL "  Representation is absolutely irreducible"
                    (QREFELT $ 54)))
         (#6='T
          (SEQ
           (SPADCALL "  Representation is irreducible, but we don't know "
                     (QREFELT $ 54))
           (EXIT
            (SPADCALL "    whether it is absolutely irreducible"
                      (QREFELT $ 54)))))))
       (|split?|
        (SEQ
         (SPADCALL "  Representation is not irreducible and it will be split:"
                   (QREFELT $ 54))
         (EXIT
          (SEQ (LETT |i| 1 . #5#)
               (LETT #2# (SPADCALL |result| (QREFELT $ 59)) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #5#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |result| |i| (QREFELT $ 60))
                                      (QREFELT $ 38))
                            . #5#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (LETT |mat|
                             (SPADCALL (SPADCALL |result| |i| (QREFELT $ 60))
                                       |j| (QREFELT $ 32))
                             . #5#)
                       (EXIT
                        (SPADCALL (SPADCALL |result| |i| (QREFELT $ 60)) |j|
                                  (SPADCALL
                                   (QCDR (SPADCALL |mat| (QREFELT $ 56)))
                                   (QREFELT $ 48))
                                  (QREFELT $ 61))))
                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL)))))
       (#6#
        (SPADCALL "  Representation is not irreducible, use meatAxe to split"
                  (QREFELT $ 54))))
      (EXIT (REVERSE |result|)))))) 

(DEFUN |REP2;areEquivalent?;2LM;9| (|aG0| |aG1| $)
  (SPADCALL |aG0| |aG1| 'T 25 (QREFELT $ 62))) 

(DEFUN |REP2;areEquivalent?;2LIM;10| (|aG0| |aG1| |numberOfTries| $)
  (SPADCALL |aG0| |aG1| 'T |numberOfTries| (QREFELT $ 62))) 

(DEFUN |REP2;areEquivalent?;2LBIM;11|
       (|aG0| |aG1| |randomelements| |numberOfTries| $)
  (PROG (|transitionM| |result| |j| |foundResult| |baseChange1| |baseChange0|
         |kernel1| |kernel0| |rk1| |rk0| |x1| |x0| |randomIndex| |i| #1=#:G272
         |n| |numberOfGenerators|)
    (RETURN
     (SEQ (LETT |result| 'NIL . #2=(|REP2;areEquivalent?;2LBIM;11|))
          (LETT |transitionM| (SPADCALL 1 1 (QREFELT $ 23)) . #2#)
          (LETT |numberOfGenerators| (LENGTH |aG0|) . #2#)
          (COND
           (|randomelements|
            (SEQ (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
                 (LETT |x0| (SPADCALL |aG0| |randomIndex| (QREFELT $ 32))
                       . #2#)
                 (EXIT
                  (LETT |x1| (SPADCALL |aG1| |randomIndex| (QREFELT $ 32))
                        . #2#)))))
          (LETT |n| (QVSIZE (SPADCALL |x0| 1 (QREFELT $ 44))) . #2#)
          (LETT |foundResult| 'NIL . #2#)
          (SEQ (LETT #1# NIL . #2#) (LETT |i| 1 . #2#) G190
               (COND ((OR (|greater_SI| |i| |numberOfTries|) #1#) (GO G191)))
               (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #2#)))
                    (COND
                     (|randomelements|
                      (SEQ
                       (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                             . #2#)
                       (LETT |x0|
                             (SPADCALL |x0|
                                       (SPADCALL |aG0| |randomIndex|
                                                 (QREFELT $ 32))
                                       (QREFELT $ 17))
                             . #2#)
                       (LETT |x1|
                             (SPADCALL |x1|
                                       (SPADCALL |aG1| |randomIndex|
                                                 (QREFELT $ 32))
                                       (QREFELT $ 17))
                             . #2#)
                       (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                             . #2#)
                       (LETT |x0|
                             (SPADCALL |x0|
                                       (SPADCALL |aG0| |randomIndex|
                                                 (QREFELT $ 32))
                                       (QREFELT $ 16))
                             . #2#)
                       (EXIT
                        (LETT |x1|
                              (SPADCALL |x1|
                                        (SPADCALL |aG1| |randomIndex|
                                                  (QREFELT $ 32))
                                        (QREFELT $ 16))
                              . #2#))))
                     ('T
                      (SEQ
                       (LETT |x0|
                             (|REP2;fingerPrint| |i|
                              (SPADCALL |aG0| 0 (QREFELT $ 32))
                              (SPADCALL |aG0| 1 (QREFELT $ 32)) |x0| $)
                             . #2#)
                       (EXIT
                        (LETT |x1|
                              (|REP2;fingerPrint| |i|
                               (SPADCALL |aG1| 0 (QREFELT $ 32))
                               (SPADCALL |aG1| 1 (QREFELT $ 32)) |x1| $)
                              . #2#)))))
                    (LETT |rk0| (SPADCALL |x0| (QREFELT $ 41)) . #2#)
                    (LETT |rk1| (SPADCALL |x1| (QREFELT $ 41)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |rk0| |rk1| (QREFELT $ 42))
                       (SEQ
                        (SPADCALL "Dimensions of kernels differ"
                                  (QREFELT $ 54))
                        (LETT |foundResult| 'T . #2#)
                        (EXIT (LETT |result| 'NIL . #2#))))
                      ((SPADCALL |rk0| (- |n| 1) (QREFELT $ 50))
                       (COND
                        (|randomelements|
                         (SEQ
                          (SPADCALL "Random element in generated algebra does"
                                    (QREFELT $ 54))
                          (EXIT
                           (SPADCALL "  not have a one-dimensional kernel"
                                     (QREFELT $ 54)))))
                        ('T
                         (SEQ
                          (SPADCALL
                           "Fingerprint element in generated algebra does"
                           (QREFELT $ 54))
                          (EXIT
                           (SPADCALL "  not have a one-dimensional kernel"
                                     (QREFELT $ 54)))))))
                      ('T
                       (SEQ
                        (COND
                         (|randomelements|
                          (SEQ
                           (SPADCALL "Random element in generated algebra has"
                                     (QREFELT $ 54))
                           (EXIT
                            (SPADCALL "  one-dimensional kernel"
                                      (QREFELT $ 54)))))
                         ('T
                          (SEQ
                           (SPADCALL
                            "Fingerprint element in generated algebra has"
                            (QREFELT $ 54))
                           (EXIT
                            (SPADCALL "  one-dimensional kernel"
                                      (QREFELT $ 54))))))
                        (LETT |kernel0| (SPADCALL |x0| (QREFELT $ 57)) . #2#)
                        (LETT |kernel1| (SPADCALL |x1| (QREFELT $ 57)) . #2#)
                        (LETT |baseChange0|
                              (SPADCALL |aG0|
                                        (SPADCALL |kernel0| 1 (QREFELT $ 65))
                                        (QREFELT $ 49))
                              . #2#)
                        (LETT |baseChange1|
                              (SPADCALL |aG1|
                                        (SPADCALL |kernel1| 1 (QREFELT $ 65))
                                        (QREFELT $ 49))
                              . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |baseChange0| (QREFELT $ 66))
                                     (SPADCALL |baseChange1| (QREFELT $ 66))
                                     (QREFELT $ 42))
                           (SEQ
                            (SPADCALL
                             "  Dimensions of generated cyclic submodules differ"
                             (QREFELT $ 54))
                            (LETT |foundResult| 'T . #2#)
                            (EXIT (LETT |result| 'NIL . #2#))))
                          ((EQL (SPADCALL |baseChange0| (QREFELT $ 66)) |n|)
                           (SEQ
                            (LETT |transitionM|
                                  (SPADCALL |baseChange0|
                                            (QCDR
                                             (SPADCALL |baseChange1|
                                                       (QREFELT $ 56)))
                                            (QREFELT $ 17))
                                  . #2#)
                            (LETT |foundResult| 'T . #2#)
                            (LETT |result| 'T . #2#)
                            (EXIT
                             (SEQ (LETT |j| 1 . #2#) G190
                                  (COND
                                   ((OR (|greater_SI| |j| |numberOfGenerators|)
                                        (NULL |result|))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL
                                        (SPADCALL |aG0| |j| (QREFELT $ 32))
                                        |transitionM| (QREFELT $ 17))
                                       (SPADCALL |transitionM|
                                                 (SPADCALL |aG1| |j|
                                                           (QREFELT $ 32))
                                                 (QREFELT $ 17))
                                       (QREFELT $ 67))
                                      (SEQ (LETT |result| 'NIL . #2#)
                                           (LETT |transitionM|
                                                 (SPADCALL 1 1 (QREFELT $ 23))
                                                 . #2#)
                                           (SPADCALL
                                            "  There is no isomorphism, as the only possible one"
                                            (QREFELT $ 54))
                                           (EXIT
                                            (SPADCALL
                                             "    fails to do the necessary base change"
                                             (QREFELT $ 54))))))))
                                  (LETT |j| (|inc_SI| |j|) . #2#) (GO G190)
                                  G191 (EXIT NIL)))))
                          ('T
                           (SEQ
                            (SPADCALL
                             "  Generated cyclic submodules have equal, but not full"
                             (QREFELT $ 54))
                            (EXIT
                             (SPADCALL
                              "    dimension, hence we can not draw any conclusion"
                              (QREFELT $ 54))))))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# |foundResult| . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (COND
           (|foundResult|
            (COND
             (|result|
              (SEQ (SPADCALL " " (QREFELT $ 54))
                   (EXIT
                    (SPADCALL "Representations are equivalent."
                              (QREFELT $ 54)))))
             (#3='T
              (SEQ (SPADCALL " " (QREFELT $ 54))
                   (EXIT
                    (SPADCALL "Representations are not equivalent."
                              (QREFELT $ 54)))))))
           (#3#
            (SEQ (SPADCALL " " (QREFELT $ 54))
                 (SPADCALL "Can neither prove equivalence nor inequivalence."
                           (QREFELT $ 54))
                 (EXIT (SPADCALL "  Try again." (QREFELT $ 54))))))
          (EXIT |transitionM|))))) 

(DEFUN |REP2;isAbsolutelyIrreducible?;LB;12| (|aG| $)
  (SPADCALL |aG| 25 (QREFELT $ 68))) 

(DEFUN |REP2;isAbsolutelyIrreducible?;LIB;13| (|aG| |numberOfTries| $)
  (PROG (|result| |kernel| |foundResult| |rk| |x| |randomIndex| |i| #1=#:G281
         |n| |numberOfGenerators|)
    (RETURN
     (SEQ (LETT |result| 'NIL . #2=(|REP2;isAbsolutelyIrreducible?;LIB;13|))
          (LETT |numberOfGenerators| (LENGTH |aG|) . #2#)
          (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
          (LETT |x| (SPADCALL |aG| |randomIndex| (QREFELT $ 32)) . #2#)
          (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #2#)
          (LETT |foundResult| 'NIL . #2#)
          (SEQ (LETT #1# NIL . #2#) (LETT |i| 1 . #2#) G190
               (COND ((OR (|greater_SI| |i| |numberOfTries|) #1#) (GO G191)))
               (SEQ
                (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
                (LETT |x|
                      (SPADCALL |x|
                                (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                                (QREFELT $ 17))
                      . #2#)
                (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #2#)
                (LETT |x|
                      (SPADCALL |x|
                                (SPADCALL |aG| |randomIndex| (QREFELT $ 32))
                                (QREFELT $ 16))
                      . #2#)
                (LETT |rk| (SPADCALL |x| (QREFELT $ 41)) . #2#)
                (EXIT
                 (COND
                  ((EQL |rk| (- |n| 1))
                   (SEQ (LETT |foundResult| 'T . #2#)
                        (SPADCALL "Random element in generated algebra has"
                                  (QREFELT $ 54))
                        (SPADCALL "  one-dimensional kernel" (QREFELT $ 54))
                        (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #2#)
                        (EXIT
                         (COND
                          ((EQL |n|
                                (QVSIZE
                                 (SPADCALL |aG| (|SPADfirst| |kernel|)
                                           (QREFELT $ 47))))
                           (LETT |result|
                                 (SPADCALL
                                  (SPADCALL
                                   (|REP2;irreducibilityTestInternal| |aG| |x|
                                    'NIL $)
                                   1 (QREFELT $ 60))
                                  NIL (QREFELT $ 70))
                                 . #2#))
                          ('T (LETT |result| 'NIL . #2#))))))
                  ('T
                   (SEQ
                    (SPADCALL "Random element in generated algebra does"
                              (QREFELT $ 54))
                    (EXIT
                     (SPADCALL "  not have a one-dimensional kernel"
                               (QREFELT $ 54))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# |foundResult| . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL |foundResult|)
            (SEQ
             (SPADCALL "We have not found a one-dimensional kernel so far,"
                       (QREFELT $ 54))
             (EXIT
              (SPADCALL "  as we do a random search you could try again"
                        (QREFELT $ 54))))))
          (EXIT |result|))))) 

(DEFUN |REP2;split;LVL;14| (|algebraGenerators| |vector| $)
  (|REP2;splitInternal| |algebraGenerators| |vector| 'T $)) 

(DEFUN |REP2;split;LVL;15| (|algebraGenerators| |submodule| $)
  (PROG (|factormoduleRepresentation| |submoduleRepresentation| |helpMatrix|
         #1=#:G294 |i| |inverseTransitionMatrix| |transitionMatrix|
         |factormoduleIndices| #2=#:G293 |submoduleIndices| #3=#:G292
         |rankOfSubmodule| |n|)
    (RETURN
     (SEQ
      (LETT |n| (QVSIZE (SPADCALL |submodule| 1 (QREFELT $ 21)))
            . #4=(|REP2;split;LVL;15|))
      (LETT |rankOfSubmodule| (QVSIZE |submodule|) . #4#)
      (LETT |submoduleRepresentation| NIL . #4#)
      (LETT |factormoduleRepresentation| NIL . #4#)
      (LETT |submoduleIndices|
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |i| 1 . #4#) G190
                  (COND ((|greater_SI| |i| |rankOfSubmodule|) (GO G191)))
                  (SEQ (EXIT (LETT #3# (CONS |i| #3#) . #4#)))
                  (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            . #4#)
      (LETT |factormoduleIndices|
            (PROGN
             (LETT #2# NIL . #4#)
             (SEQ (LETT |i| (+ 1 |rankOfSubmodule|) . #4#) G190
                  (COND ((> |i| |n|) (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #4#)))
                  (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #4#)
      (LETT |transitionMatrix|
            (SPADCALL (SPADCALL |submodule| (QREFELT $ 30)) (QREFELT $ 48))
            . #4#)
      (SPADCALL "  Transition matrix computed" (QREFELT $ 54))
      (LETT |inverseTransitionMatrix|
            (QCDR (SPADCALL |transitionMatrix| (QREFELT $ 56))) . #4#)
      (SPADCALL "  The inverse of the transition matrix computed"
                (QREFELT $ 54))
      (SPADCALL "  Now transform the matrices" (QREFELT $ 54))
      (SEQ (LETT |i| 1 . #4#)
           (LETT #1# (SPADCALL |algebraGenerators| (QREFELT $ 38)) . #4#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |helpMatrix|
                  (SPADCALL |inverseTransitionMatrix|
                            (SPADCALL |algebraGenerators| |i| (QREFELT $ 32))
                            (QREFELT $ 17))
                  . #4#)
            (LETT |submoduleRepresentation|
                  (CONS
                   (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                    |submoduleIndices| |n| $)
                   |submoduleRepresentation|)
                  . #4#)
            (EXIT
             (LETT |factormoduleRepresentation|
                   (CONS
                    (|REP2;blockMultiply| |helpMatrix| |transitionMatrix|
                     |factormoduleIndices| |n| $)
                    |factormoduleRepresentation|)
                   . #4#)))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS (REVERSE |submoduleRepresentation|)
             (SPADCALL (REVERSE |factormoduleRepresentation|)
                       (QREFELT $ 72)))))))) 

(DEFUN |REP2;my_min| (|m| |n| $)
  (PROG (|xi| |res| #1=#:G311 |i| |x| |j| |depe| |depm| #2=#:G310 |v| #3=#:G309
         |depl| #4=#:G308 |zz| #5=#:G296)
    (RETURN
     (SEQ
      (LETT |zz|
            (SPADCALL
             (PROG1 (LETT #5# |n| . #6=(|REP2;my_min|))
               (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
             (QREFELT $ 75))
            . #6#)
      (LETT |v| |zz| . #6#)
      (SEQ G190 (COND ((NULL (SPADCALL |v| |zz| (QREFELT $ 76))) (GO G191)))
           (SEQ
            (EXIT
             (LETT |v|
                   (SPADCALL
                    (PROGN
                     (LETT #4# NIL . #6#)
                     (SEQ (LETT |i| 1 . #6#) G190
                          (COND ((|greater_SI| |i| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4# (CONS (SPADCALL (QREFELT $ 77)) #4#)
                                  . #6#)))
                          (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    (QREFELT $ 78))
                   . #6#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |depl| (LIST |v|) . #6#)
      (SEQ (LETT |i| 1 . #6#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |v| (SPADCALL |m| |v| (QREFELT $ 39)) . #6#)
                (EXIT (LETT |depl| (CONS |v| |depl|) . #6#)))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |depl| (REVERSE |depl|) . #6#)
      (LETT |depm|
            (SPADCALL
             (PROGN
              (LETT #3# NIL . #6#)
              (SEQ (LETT |v| NIL . #6#) (LETT #2# |depl| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #3# (CONS (SPADCALL |v| (QREFELT $ 79)) #3#)
                           . #6#)))
                   (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                   (EXIT (NREVERSE #3#))))
             (QREFELT $ 14))
            . #6#)
      (LETT |depe| (SPADCALL (SPADCALL |depm| (QREFELT $ 48)) (QREFELT $ 37))
            . #6#)
      (LETT |j| 1 . #6#)
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL |j| |n| (QREFELT $ 80))
                (SPADCALL (QAREF2O |depe| |j| |j| 1 1) (|spadConstant| $ 12)
                          (QREFELT $ 81)))
               ('T 'NIL)))
             (GO G191)))
           (SEQ (EXIT (LETT |j| (+ |j| 1) . #6#))) NIL (GO G190) G191
           (EXIT NIL))
      (LETT |res| (|spadConstant| $ 83) . #6#)
      (LETT |x| (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 84)) . #6#)
      (LETT |xi| (|spadConstant| $ 82) . #6#)
      (SEQ (LETT |i| 1 . #6#) (LETT #1# (- |j| 1) . #6#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |res|
                  (SPADCALL |res|
                            (SPADCALL (SPADCALL |depe| |i| |j| (QREFELT $ 9))
                                      |xi| (QREFELT $ 85))
                            (QREFELT $ 86))
                  . #6#)
            (EXIT (LETT |xi| (SPADCALL |x| |xi| (QREFELT $ 87)) . #6#)))
           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |xi| |res| (QREFELT $ 88))))))) 

(DEFUN |REP2;m_eval| (|p| |m| |n| $)
  (PROG (|old_deg| |res| #1=#:G321 |i| |ndeg| |c0| |id| #2=#:G319 #3=#:G320
         |nn| #4=#:G312)
    (RETURN
     (SEQ
      (LETT |nn|
            (PROG1 (LETT #4# |n| . #5=(|REP2;m_eval|))
              (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
            . #5#)
      (LETT |res| (SPADCALL |nn| |nn| (QREFELT $ 23)) . #5#)
      (LETT |id|
            (SPADCALL
             (PROGN
              (LETT #3# (GETREFV |n|) . #5#)
              (SEQ (LETT |i| 1 . #5#) (LETT #2# 0 . #5#) G190
                   (COND ((|greater_SI| |i| |n|) (GO G191)))
                   (SEQ (EXIT (SETELT #3# #2# (|spadConstant| $ 15))))
                   (LETT #2#
                         (PROG1 (|inc_SI| #2#) (LETT |i| (|inc_SI| |i|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              #3#)
             (QREFELT $ 89))
            . #5#)
      (LETT |old_deg| (SPADCALL |p| (QREFELT $ 90)) . #5#)
      (SEQ G190
           (COND
            ((NULL (SPADCALL |p| (|spadConstant| $ 83) (QREFELT $ 91)))
             (GO G191)))
           (SEQ (LETT |c0| (SPADCALL |p| (QREFELT $ 92)) . #5#)
                (LETT |res|
                      (SPADCALL |res| (SPADCALL |c0| |id| (QREFELT $ 93))
                                (QREFELT $ 16))
                      . #5#)
                (LETT |p| (SPADCALL |p| (QREFELT $ 94)) . #5#)
                (LETT |ndeg| (SPADCALL |p| (QREFELT $ 90)) . #5#)
                (SEQ (LETT |i| 1 . #5#) (LETT #1# (- |old_deg| |ndeg|) . #5#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |m| |res| (QREFELT $ 17)) . #5#)))
                     (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |old_deg| |ndeg| . #5#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |REP2;meatAxe1| (|algebraGenerators| |x| |n| |m| $)
  (PROG (#1=#:G332 |pres| |v| |good| |kernel| |xx| |mm| |fpol| #2=#:G333 |fac|
         |fl| |mp|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |mp| (|REP2;my_min| |x| |n| $) . #3=(|REP2;meatAxe1|))
            (LETT |fl|
                  (SPADCALL (SPADCALL |mp| (QREFELT $ 97)) (QREFELT $ 100))
                  . #3#)
            (SEQ (LETT |fac| NIL . #3#) (LETT #2# |fl| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fpol| (QCAR |fac|) . #3#)
                      (LETT |mm| (SPADCALL |fpol| (QREFELT $ 90)) . #3#)
                      (EXIT
                       (COND ((SPADCALL |mm| |m| (QREFELT $ 101)) "iterate")
                             ('T
                              (SEQ
                               (LETT |xx| (|REP2;m_eval| |fpol| |x| |n| $)
                                     . #3#)
                               (LETT |kernel| (SPADCALL |xx| (QREFELT $ 57))
                                     . #3#)
                               (LETT |good| (EQL (LENGTH |kernel|) |mm|) . #3#)
                               (LETT |v| (|SPADfirst| |kernel|) . #3#)
                               (LETT |pres|
                                     (SPADCALL |algebraGenerators| |v|
                                               (QREFELT $ 71))
                                     . #3#)
                               (COND
                                ((NULL (NULL (CDR |pres|)))
                                 (PROGN
                                  (LETT #1# (CONS 0 |pres|) . #3#)
                                  (GO #1#))))
                               (EXIT
                                (COND
                                 (|good|
                                  (SEQ
                                   (SPADCALL "Found good factor"
                                             (QREFELT $ 54))
                                   (EXIT
                                    (PROGN
                                     (LETT #1#
                                           (CONS 0
                                                 (|REP2;irreducibilityTestInternal|
                                                  |algebraGenerators| |xx| 'T
                                                  $))
                                           . #3#)
                                     (GO #1#))))))))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (SPADCALL "All factors were bad" (QREFELT $ 54))
            (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |REP2;meatAxe;LB2IL;19|
       (|algebraGenerators| |randomelements| |numberOfTries| |maxTests| $)
  (PROG (|result| #1=#:G348 |j| |numberOfTests|
         |numberOfOneDimSubspacesInKernel| |kernel| |pp| |n| |x| |randomIndex|
         |i| |q| #2=#:G334 |numberOfGenerators|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |numberOfGenerators| (LENGTH |algebraGenerators|)
              . #3=(|REP2;meatAxe;LB2IL;19|))
        (LETT |result| NIL . #3#)
        (LETT |q|
              (PROG1 (LETT #2# (SPADCALL (QREFELT $ 102)) . #3#)
                (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
              . #3#)
        (COND
         (|randomelements|
          (SEQ (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|)) . #3#)
               (EXIT
                (LETT |x|
                      (SPADCALL |algebraGenerators| |randomIndex|
                                (QREFELT $ 32))
                      . #3#)))))
        (SEQ (LETT |i| 1 . #3#) G190
             (COND ((|greater_SI| |i| |numberOfTries|) (GO G191)))
             (SEQ (COND ((EQL |i| 7) (LETT |randomelements| 'T . #3#)))
                  (COND
                   (|randomelements|
                    (SEQ
                     (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                           . #3#)
                     (LETT |x|
                           (SPADCALL |x|
                                     (SPADCALL |algebraGenerators|
                                               |randomIndex| (QREFELT $ 32))
                                     (QREFELT $ 17))
                           . #3#)
                     (LETT |randomIndex| (+ 1 (RANDOM |numberOfGenerators|))
                           . #3#)
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (SPADCALL |algebraGenerators|
                                                |randomIndex| (QREFELT $ 32))
                                      (QREFELT $ 16))
                            . #3#))))
                   ('T
                    (LETT |x|
                          (|REP2;fingerPrint| |i|
                           (SPADCALL |algebraGenerators| 1 (QREFELT $ 32))
                           (SPADCALL |algebraGenerators| 2 (QREFELT $ 32)) |x|
                           $)
                          . #3#)))
                  (LETT |n| (QVSIZE (SPADCALL |x| 1 (QREFELT $ 44))) . #3#)
                  (COND
                   ((OR (SPADCALL |q| 2 (QREFELT $ 106))
                        (OR (SPADCALL |i| (QREFELT $ 107))
                            (SPADCALL |i| 15 (QREFELT $ 108))))
                    (EXIT
                     (SEQ
                      (LETT |pp|
                            (|REP2;meatAxe1| |algebraGenerators| |x| |n|
                             (EXPT 2 |i|) $)
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |pp| 0)
                         (PROGN (LETT #1# (QCDR |pp|) . #3#) (GO #1#)))))))))
                  (LETT |kernel| (SPADCALL |x| (QREFELT $ 57)) . #3#)
                  (EXIT
                   (COND
                    ((NULL |kernel|)
                     (COND
                      (|randomelements|
                       (SPADCALL
                        "Random element in generated algebra is non-singular"
                        (QREFELT $ 54)))
                      ('T
                       (SPADCALL
                        "Fingerprint element in generated algebra is non-singular"
                        (QREFELT $ 54)))))
                    ('T
                     (SEQ
                      (COND
                       (|randomelements|
                        (SPADCALL
                         "Random element in generated algebra is singular"
                         (QREFELT $ 54)))
                       ('T
                        (SPADCALL
                         "Fingerprint element in generated algebra is singular"
                         (QREFELT $ 54))))
                      (LETT |numberOfOneDimSubspacesInKernel|
                            (QUOTIENT2 (- (EXPT |q| (LENGTH |kernel|)) 1)
                                       (- |q| 1))
                            . #3#)
                      (LETT |numberOfTests|
                            (MIN |numberOfOneDimSubspacesInKernel| |maxTests|)
                            . #3#)
                      (EXIT
                       (SEQ (LETT |j| 1 . #3#) G190
                            (COND
                             ((|greater_SI| |j| |numberOfTests|) (GO G191)))
                            (SEQ
                             (LETT |result|
                                   (SPADCALL |algebraGenerators|
                                             (SPADCALL |kernel| |j|
                                                       (QREFELT $ 109))
                                             (QREFELT $ 71))
                                   . #3#)
                             (EXIT
                              (COND
                               ((NULL (CDR |result|))
                                (COND
                                 ((SPADCALL (+ |j| 1)
                                            |numberOfOneDimSubspacesInKernel|
                                            (QREFELT $ 101))
                                  (PROGN
                                   (LETT #1#
                                         (|REP2;irreducibilityTestInternal|
                                          |algebraGenerators| |x| 'T $)
                                         . #3#)
                                   (GO #1#)))))
                               ('T
                                (PROGN (LETT #1# |result| . #3#) (GO #1#))))))
                            (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                            (EXIT NIL))))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (LETT |result| (LIST NIL NIL) . #3#) (SPADCALL " " (QREFELT $ 54))
        (SPADCALL "Sorry, no result, try meatAxe(...,true)" (QREFELT $ 54))
        (SPADCALL "  or consider using an extension field." (QREFELT $ 54))
        (EXIT |result|)))
      #1# (EXIT #1#))))) 

(DEFUN |REP2;meatAxe;LL;20| (|algebraGenerators| $)
  (SPADCALL |algebraGenerators| 'NIL 25 7 (QREFELT $ 110))) 

(DEFUN |REP2;meatAxe;LBL;21| (|algebraGenerators| |randomElements?| $)
  (COND
   (|randomElements?| (SPADCALL |algebraGenerators| 'T 25 7 (QREFELT $ 110)))
   ('T (SPADCALL |algebraGenerators| 'NIL 6 7 (QREFELT $ 110))))) 

(DEFUN |REP2;meatAxe;LPiL;22| (|algebraGenerators| |numberOfTries| $)
  (SPADCALL |algebraGenerators| 'T |numberOfTries| 7 (QREFELT $ 110))) 

(DEFUN |REP2;scanOneDimSubspaces;LIV;23| (|basis| |n| $)
  (PROG (|j| |newAdd| #1=#:G363 |i| |result| #2=#:G354 #3=#:G362 |iR|
         |coefficients| |nred| |pos| #4=#:G361 |q| |nn| |dim|)
    (RETURN
     (SEQ
      (LETT |dim| (LENGTH |basis|) . #5=(|REP2;scanOneDimSubspaces;LIV;23|))
      (LETT |nn| (QVSIZE (SPADCALL |basis| 1 (QREFELT $ 65))) . #5#)
      (LETT |q| (SPADCALL (QREFELT $ 102)) . #5#)
      (LETT |nred| (REM |n| (QUOTIENT2 (- (EXPT |q| |dim|) 1) (- |q| 1)))
            . #5#)
      (LETT |pos| |nred| . #5#) (LETT |i| 0 . #5#)
      (SEQ (LETT |i| 0 . #5#) (LETT #4# (- |dim| 1) . #5#) G190
           (COND ((OR (|greater_SI| |i| #4#) (NULL (>= |nred| 0))) (GO G191)))
           (SEQ (LETT |pos| |nred| . #5#)
                (EXIT (LETT |nred| (- |nred| (EXPT |q| |i|)) . #5#)))
           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
      (LETT |i| (COND ((EQL |i| 0) 0) ('T (- |i| 1))) . #5#)
      (LETT |coefficients| (MAKEARR1 |dim| (|spadConstant| $ 12)) . #5#)
      (SPADCALL |coefficients| (- |dim| |i|) (|spadConstant| $ 15)
                (QREFELT $ 114))
      (LETT |iR|
            (SPADCALL
             (SPADCALL |pos|
                       (|compiledLookupCheck| '|coerce|
                                              (LIST '$ (LIST '|Integer|))
                                              (|RadixExpansion| |q|)))
             (|compiledLookupCheck| '|wholeRagits|
                                    (LIST (LIST '|List| (LIST '|Integer|)) '$)
                                    (|RadixExpansion| |q|)))
            . #5#)
      (SEQ (LETT |j| 1 . #5#) (LETT #3# (SPADCALL |iR| (QREFELT $ 116)) . #5#)
           G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |coefficients| (+ (- |dim| (LENGTH |iR|)) |j|)
                       (SPADCALL
                        (PROG1
                            (LETT #2#
                                  (+ (SPADCALL |iR| |j| (QREFELT $ 117)) |q|)
                                  . #5#)
                          (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                        (QREFELT $ 118))
                       (QREFELT $ 114))))
           (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
      (LETT |result| (MAKEARR1 |nn| (|spadConstant| $ 12)) . #5#)
      (SEQ (LETT |i| 1 . #5#) (LETT #1# (QVSIZE |coefficients|) . #5#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |newAdd|
                  (SPADCALL (SPADCALL |coefficients| |i| (QREFELT $ 27))
                            (SPADCALL |basis| |i| (QREFELT $ 65))
                            (QREFELT $ 119))
                  . #5#)
            (EXIT
             (SEQ (LETT |j| 1 . #5#) G190
                  (COND ((|greater_SI| |j| |nn|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |result| |j|
                              (SPADCALL (SPADCALL |result| |j| (QREFELT $ 27))
                                        (SPADCALL |newAdd| |j| (QREFELT $ 27))
                                        (QREFELT $ 11))
                              (QREFELT $ 114))))
                  (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT |result|))))) 

(DECLAIM (NOTINLINE |RepresentationPackage2;|)) 

(DEFUN |RepresentationPackage2| (#1=#:G365)
  (PROG ()
    (RETURN
     (PROG (#2=#:G366)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|RepresentationPackage2|)
                                           '|domainEqualList|)
                . #3=(|RepresentationPackage2|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|RepresentationPackage2;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|RepresentationPackage2|))))))))))) 

(DEFUN |RepresentationPackage2;| (|#1|)
  (PROG (|pv$| #1=#:G364 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|RepresentationPackage2|))
      (LETT |dv$| (LIST '|RepresentationPackage2| DV$1) . #2#)
      (LETT $ (GETREFV 120) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #1#
                                                (|HasCategory| |#1| '(|Field|))
                                                . #2#)
                                          (AND #1#
                                               (|HasCategory| |#1|
                                                              '(|Finite|)))
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|RepresentationPackage2| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 47
                   (CONS (|dispatchFunction| |REP2;cyclicSubmodule;LVV;5|) $))
         (QSETREFV $ 49
                   (CONS
                    (|dispatchFunction|
                     |REP2;standardBasisOfCyclicSubmodule;LVM;6|)
                    $)))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |REP2;areEquivalent?;2LM;9|) $))
         (QSETREFV $ 64
                   (CONS (|dispatchFunction| |REP2;areEquivalent?;2LIM;10|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |REP2;areEquivalent?;2LBIM;11|)
                         $))
         (QSETREFV $ 69
                   (CONS
                    (|dispatchFunction| |REP2;isAbsolutelyIrreducible?;LB;12|)
                    $))
         (QSETREFV $ 68
                   (CONS
                    (|dispatchFunction| |REP2;isAbsolutelyIrreducible?;LIB;13|)
                    $))
         (QSETREFV $ 71 (CONS (|dispatchFunction| |REP2;split;LVL;14|) $))
         (QSETREFV $ 73 (CONS (|dispatchFunction| |REP2;split;LVL;15|) $))
         (COND
          ((|HasCategory| |#1| '(|FiniteFieldCategory|))
           (PROGN
            (QSETREFV $ 74 (|SparseUnivariatePolynomial| |#1|))
            (QSETREFV $ 110
                      (CONS (|dispatchFunction| |REP2;meatAxe;LB2IL;19|) $))
            (QSETREFV $ 111 (CONS (|dispatchFunction| |REP2;meatAxe;LL;20|) $))
            (QSETREFV $ 112
                      (CONS (|dispatchFunction| |REP2;meatAxe;LBL;21|) $))
            (QSETREFV $ 113
                      (CONS (|dispatchFunction| |REP2;meatAxe;LPiL;22|) $))
            (QSETREFV $ 109
                      (CONS
                       (|dispatchFunction| |REP2;scanOneDimSubspaces;LIV;23|)
                       $))))))))
      $)))) 

(MAKEPROP '|RepresentationPackage2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|) (|Matrix| 6)
              (0 . |elt|) (7 . *) (13 . +) (19 . |Zero|) (|List| 34)
              (23 . |matrix|) (28 . |One|) (32 . +) (38 . *) (44 . -)
              (|Vector| 6) (|Vector| 19) (50 . |elt|) (|NonNegativeInteger|)
              (56 . |zero|) (62 . |setRow!|) (|Boolean|) (69 . <=) (75 . |elt|)
              (81 . =) (87 . |setelt|) |REP2;completeEchelonBasis;VM;3|
              (|List| 8) (95 . |elt|) |REP2;createRandomElement;L2M;4|
              (|List| 6) (101 . |entries|) (106 . |list|) (111 . |rowEchelon|)
              (116 . |maxIndex|) (121 . *) (127 . |vertConcat|) (133 . |rank|)
              (138 . ~=) (144 . |maxRowIndex|) (149 . |row|) (|List| 19)
              (155 . |vector|) (160 . |cyclicSubmodule|) (166 . |transpose|)
              (171 . |standardBasisOfCyclicSubmodule|) (177 . ~=) (|Void|)
              (|String|) (|OutputForm|) (183 . |messagePrint|)
              (|Union| $ '"failed") (188 . |inverse|) (193 . |nullSpace|)
              (|List| 31) (198 . |maxIndex|) (203 . |elt|) (209 . |setelt|)
              (216 . |areEquivalent?|) (224 . |areEquivalent?|)
              (230 . |areEquivalent?|) (237 . |elt|) (243 . |ncols|) (248 . ~=)
              (254 . |isAbsolutelyIrreducible?|)
              (260 . |isAbsolutelyIrreducible?|) (265 . ~=) (271 . |split|)
              (277 . |list|) (282 . |split|) '|Smp| (288 . |zero|) (293 . =)
              (299 . |random|) (303 . |vector|) (308 . |parts|) (313 . <=)
              (319 . ~=) (325 . |One|) (329 . |Zero|) (333 . |monomial|)
              (339 . *) (345 . -) (351 . *) (357 . +) (363 . |diagonalMatrix|)
              (368 . |degree|) (373 . ~=) (379 . |leadingCoefficient|)
              (384 . *) (390 . |reductum|) (|Factored| 74)
              (|DistinctDegreeFactorize| 6 74) (395 . |factor|)
              (|Record| (|:| |factor| 74) (|:| |exponent| 7)) (|List| 98)
              (400 . |factors|) (405 . >) (411 . |size|)
              (|SparseUnivariatePolynomial| 6) (415 . |One|)
              (|PositiveInteger|) (419 . >) (425 . |even?|) (430 . >)
              (436 . |scanOneDimSubspaces|) (442 . |meatAxe|) (450 . |meatAxe|)
              (455 . |meatAxe|) (461 . |meatAxe|) (467 . |setelt|) (|List| 7)
              (474 . |maxIndex|) (479 . |elt|) (485 . |index|) (490 . *))
           '#(|standardBasisOfCyclicSubmodule| 496 |split| 502
              |scanOneDimSubspaces| 514 |meatAxe| 520
              |isAbsolutelyIrreducible?| 545 |cyclicSubmodule| 556
              |createRandomElement| 562 |completeEchelonBasis| 568
              |areEquivalent?| 573)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 119
                                                 '(3 8 6 0 7 7 9 2 6 0 0 0 10 2
                                                   6 0 0 0 11 0 6 0 12 1 8 0 13
                                                   14 0 6 0 15 2 8 0 0 0 16 2 8
                                                   0 0 0 17 2 8 0 0 0 18 2 20
                                                   19 0 7 21 2 8 0 22 22 23 3 8
                                                   0 0 7 19 24 2 22 25 0 0 26 2
                                                   19 6 0 7 27 2 6 25 0 0 28 4
                                                   8 6 0 7 7 6 29 2 31 8 0 7 32
                                                   1 19 34 0 35 1 13 0 34 36 1
                                                   8 0 0 37 1 31 7 0 38 2 8 19
                                                   0 19 39 2 8 0 0 0 40 1 8 22
                                                   0 41 2 22 25 0 0 42 1 8 7 0
                                                   43 2 8 19 0 7 44 1 20 0 45
                                                   46 2 0 20 31 19 47 1 8 0 0
                                                   48 2 0 8 31 19 49 2 7 25 0 0
                                                   50 1 53 51 52 54 1 8 55 0 56
                                                   1 8 45 0 57 1 58 7 0 59 2 58
                                                   31 0 7 60 3 31 8 0 7 8 61 4
                                                   0 8 31 31 25 7 62 2 0 8 31
                                                   31 63 3 0 8 31 31 7 64 2 45
                                                   19 0 7 65 1 8 22 0 66 2 8 25
                                                   0 0 67 2 0 25 31 7 68 1 0 25
                                                   31 69 2 31 25 0 0 70 2 0 58
                                                   31 19 71 1 58 0 31 72 2 0 58
                                                   31 20 73 1 19 0 22 75 2 19
                                                   25 0 0 76 0 6 0 77 1 19 0 34
                                                   78 1 19 34 0 79 2 7 25 0 0
                                                   80 2 6 25 0 0 81 0 74 0 82 0
                                                   74 0 83 2 74 0 6 22 84 2 74
                                                   0 6 0 85 2 74 0 0 0 86 2 74
                                                   0 0 0 87 2 74 0 0 0 88 1 8 0
                                                   19 89 1 74 22 0 90 2 74 25 0
                                                   0 91 1 74 6 0 92 2 8 0 6 0
                                                   93 1 74 0 0 94 1 96 95 74 97
                                                   1 95 99 0 100 2 7 25 0 0 101
                                                   0 6 22 102 0 103 0 104 2 105
                                                   25 0 0 106 1 7 25 0 107 2 22
                                                   25 0 0 108 2 0 19 45 7 109 4
                                                   0 58 31 25 7 7 110 1 0 58 31
                                                   111 2 0 58 31 25 112 2 0 58
                                                   31 105 113 3 19 6 0 7 6 114
                                                   1 115 7 0 116 2 115 7 0 7
                                                   117 1 6 0 105 118 2 19 0 6 0
                                                   119 2 3 8 31 19 49 2 1 58 31
                                                   19 71 2 1 58 31 20 73 2 2 19
                                                   45 7 109 4 2 58 31 25 7 7
                                                   110 2 2 58 31 25 112 1 2 58
                                                   31 111 2 2 58 31 105 113 2 1
                                                   25 31 7 68 1 1 25 31 69 2 3
                                                   20 31 19 47 2 0 8 31 8 33 1
                                                   0 8 20 30 2 1 8 31 31 63 4 1
                                                   8 31 31 25 7 62 3 1 8 31 31
                                                   7 64)))))
           '|lookupComplete|)) 
