
(DECLAIM (NOTINLINE |GuessPolynomialInteger;|)) 

(DEFUN |GuessPolynomialInteger| ()
  (SPROG NIL
         (PROG (#1=#:G15)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GuessPolynomialInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GuessPolynomialInteger|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|GuessPolynomialInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GuessPolynomialInteger|)))))))))) 

(DEFUN |GuessPolynomialInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GuessPolynomialInteger|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Fraction|
                                                 (|Polynomial| (|Integer|)))
                                                '(|RetractableTo| (|Symbol|)))
                                               (|HasCategory|
                                                (|Polynomial| (|Integer|))
                                                '(|RetractableTo|
                                                  (|Symbol|))))))))
          (|haddProp| |$ConstructorCache| '|GuessPolynomialInteger| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|GuessPolynomialInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|GuessPolynomial| (|Integer|))
              (|Mapping|
               (|Stream|
                (|UnivariateFormalPowerSeries|
                 (|Fraction| (|Polynomial| (|Integer|)))))
               (|UnivariateFormalPowerSeries|
                (|Fraction| (|Polynomial| (|Integer|)))))
              (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                         (|Integer|) (|Integer|))
              (|Mapping| 7 (|NonNegativeInteger|))
              (|Mapping|
               (|Vector|
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial|
                  (|Fraction| (|Polynomial| (|Integer|)))
                  (|NonNegativeInteger|))))
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial|
                 (|Fraction| (|Polynomial| (|Integer|)))
                 (|NonNegativeInteger|))))
              (|Mapping| 9 (|List| (|PositiveInteger|)))
              (|Mapping| (|Stream| (|Expression| (|Integer|)))
                         (|Expression| (|Integer|)) 24)
              (|Mapping| (|Polynomial| (|Integer|)) (|NonNegativeInteger|)
                         (|NonNegativeInteger|)
                         (|SparseUnivariatePolynomial|
                          (|Polynomial| (|Integer|))))
              (|Mapping|
               (|SparseMultivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|))) (|NonNegativeInteger|))
               (|NonNegativeInteger|) (|NonNegativeInteger|)
               (|UnivariateFormalPowerSeries|
                (|SparseMultivariatePolynomial|
                 (|Fraction| (|Polynomial| (|Integer|)))
                 (|NonNegativeInteger|))))
              (|Mapping| (|Expression| (|Integer|)) (|NonNegativeInteger|) 24
                         (|Expression| (|Integer|)))
              (|Mapping| (|List| (|Polynomial| (|Integer|)))
                         (|NonNegativeInteger|))
              (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                        (|:| |guessStream| 6) (|:| |guessModGen| 8)
                        (|:| |testGen| 10) (|:| |exprStream| 11)
                        (|:| |kind| 24) (|:| |qvar| 24) (|:| A 12) (|:| AF 13)
                        (|:| AX 14) (|:| C 15))
              (|List| (|GuessOption|)) (|List| (|Expression| (|Integer|)))
              (|List| (|Fraction| (|Polynomial| (|Integer|)))) (|List| 19)
              (|Mapping| 18 19 17) (|List| 21) (|List| 24) (|Symbol|)
              (|Mapping| 16 17))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|guess|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List|
                                   (|Fraction|
                                    (|Polynomial| #1=(|Integer|))))))
                                T)
                              '((|guess|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guess|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List|
                                   (|Mapping|
                                    (|List| (|Expression| (|Integer|)))
                                    (|List| (|Fraction| (|Polynomial| #1#)))
                                    (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))))
                                T)
                              '((|guess|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List|
                                   (|Mapping|
                                    (|List| (|Expression| (|Integer|)))
                                    (|List| (|Fraction| (|Polynomial| #1#)))
                                    (|List| (|GuessOption|))))
                                  (|List| (|Symbol|))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessExpRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessBinRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessBinRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessExpRat|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessBinRat|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessAlgDep|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| #1#))))))
                                T)
                              '((|guessAlgDep|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| #1#))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessADE|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessADE|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessFE|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessFE|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessAlg|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessAlg|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessHolo|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessHolo|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPade|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessRec|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessRec|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessPRec|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|guessRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|guessRat|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|List| (|Fraction| (|Polynomial| #1#)))))
                                T)
                              '((|algDepHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| #1#)))))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping|
                                         (|Stream| (|Expression| (|Integer|)))
                                         (|Expression| (|Integer|))
                                         (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| #1#)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| #1#))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| #1#))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| (|Expression| (|Integer|))
                                                   (|NonNegativeInteger|)
                                                   (|Symbol|)
                                                   (|Expression| (|Integer|))))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| #1#))
                                                   (|NonNegativeInteger|))))
                                  (|List|
                                   (|List| (|Fraction| (|Polynomial| #1#))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|diffHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| #1#)))))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping|
                                         (|Stream| (|Expression| (|Integer|)))
                                         (|Expression| (|Integer|))
                                         (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| #1#)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| #1#))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| #1#))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| (|Expression| (|Integer|))
                                                   (|NonNegativeInteger|)
                                                   (|Symbol|)
                                                   (|Expression| (|Integer|))))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| #1#))
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|substHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| #1#)))))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping|
                                         (|Stream| (|Expression| (|Integer|)))
                                         (|Expression| (|Integer|))
                                         (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| #1#)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| #1#))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| #1#))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| (|Expression| (|Integer|))
                                                   (|NonNegativeInteger|)
                                                   (|Symbol|)
                                                   (|Expression| (|Integer|))))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| #1#))
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|shiftHP|
                                 ((|Record|
                                   (|:| |degreeStream|
                                        (|Stream| (|NonNegativeInteger|)))
                                   (|:| |guessStream|
                                        (|Mapping|
                                         (|Stream|
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#))))
                                         (|UnivariateFormalPowerSeries|
                                          (|Fraction| (|Polynomial| #1#)))))
                                   (|:| |guessModGen|
                                        (|Mapping|
                                         (|Mapping| (|Vector| (|U32Vector|))
                                                    (|List| (|U32Vector|))
                                                    (|Integer|) (|Integer|))
                                         (|NonNegativeInteger|)))
                                   (|:| |testGen|
                                        (|Mapping|
                                         (|Mapping|
                                          (|Vector|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|))))
                                         (|List| (|PositiveInteger|))))
                                   (|:| |exprStream|
                                        (|Mapping|
                                         (|Stream| (|Expression| (|Integer|)))
                                         (|Expression| (|Integer|))
                                         (|Symbol|)))
                                   (|:| |kind| (|Symbol|))
                                   (|:| |qvar| (|Symbol|))
                                   (|:| A
                                        (|Mapping| (|Polynomial| #1#)
                                                   (|NonNegativeInteger|)
                                                   (|NonNegativeInteger|)
                                                   (|SparseUnivariatePolynomial|
                                                    (|Polynomial| #1#))))
                                   (|:| AF
                                        (|Mapping|
                                         (|SparseMultivariatePolynomial|
                                          (|Fraction| (|Polynomial| #1#))
                                          (|NonNegativeInteger|))
                                         (|NonNegativeInteger|)
                                         (|NonNegativeInteger|)
                                         (|UnivariateFormalPowerSeries|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|)))))
                                   (|:| AX
                                        (|Mapping| (|Expression| (|Integer|))
                                                   (|NonNegativeInteger|)
                                                   (|Symbol|)
                                                   (|Expression| (|Integer|))))
                                   (|:| C
                                        (|Mapping| (|List| (|Polynomial| #1#))
                                                   (|NonNegativeInteger|))))
                                  (|List| (|GuessOption|))))
                                T)
                              '((|shiftHP|
                                 ((|Mapping|
                                   (|Record|
                                    (|:| |degreeStream|
                                         (|Stream| (|NonNegativeInteger|)))
                                    (|:| |guessStream|
                                         (|Mapping|
                                          (|Stream|
                                           (|UnivariateFormalPowerSeries|
                                            (|Fraction| (|Polynomial| #1#))))
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#)))))
                                    (|:| |guessModGen|
                                         (|Mapping|
                                          (|Mapping| (|Vector| (|U32Vector|))
                                                     (|List| (|U32Vector|))
                                                     (|Integer|) (|Integer|))
                                          (|NonNegativeInteger|)))
                                    (|:| |testGen|
                                         (|Mapping|
                                          (|Mapping|
                                           (|Vector|
                                            (|UnivariateFormalPowerSeries|
                                             (|SparseMultivariatePolynomial|
                                              (|Fraction| (|Polynomial| #1#))
                                              (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping|
                                          (|Stream| (|Expression| (|Integer|)))
                                          (|Expression| (|Integer|))
                                          (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| (|Polynomial| #1#)
                                                    (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     (|Polynomial| #1#))))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| (|Expression| (|Integer|))
                                                    (|NonNegativeInteger|)
                                                    (|Symbol|)
                                                    (|Expression|
                                                     (|Integer|))))
                                    (|:| C
                                         (|Mapping| (|List| (|Polynomial| #1#))
                                                    (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|diffHP|
                                 ((|Mapping|
                                   (|Record|
                                    (|:| |degreeStream|
                                         (|Stream| (|NonNegativeInteger|)))
                                    (|:| |guessStream|
                                         (|Mapping|
                                          (|Stream|
                                           (|UnivariateFormalPowerSeries|
                                            (|Fraction| (|Polynomial| #1#))))
                                          (|UnivariateFormalPowerSeries|
                                           (|Fraction| (|Polynomial| #1#)))))
                                    (|:| |guessModGen|
                                         (|Mapping|
                                          (|Mapping| (|Vector| (|U32Vector|))
                                                     (|List| (|U32Vector|))
                                                     (|Integer|) (|Integer|))
                                          (|NonNegativeInteger|)))
                                    (|:| |testGen|
                                         (|Mapping|
                                          (|Mapping|
                                           (|Vector|
                                            (|UnivariateFormalPowerSeries|
                                             (|SparseMultivariatePolynomial|
                                              (|Fraction| (|Polynomial| #1#))
                                              (|NonNegativeInteger|))))
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (|Fraction| (|Polynomial| #1#))
                                             (|NonNegativeInteger|))))
                                          (|List| (|PositiveInteger|))))
                                    (|:| |exprStream|
                                         (|Mapping|
                                          (|Stream| (|Expression| (|Integer|)))
                                          (|Expression| (|Integer|))
                                          (|Symbol|)))
                                    (|:| |kind| (|Symbol|))
                                    (|:| |qvar| (|Symbol|))
                                    (|:| A
                                         (|Mapping| (|Polynomial| #1#)
                                                    (|NonNegativeInteger|)
                                                    (|NonNegativeInteger|)
                                                    (|SparseUnivariatePolynomial|
                                                     (|Polynomial| #1#))))
                                    (|:| AF
                                         (|Mapping|
                                          (|SparseMultivariatePolynomial|
                                           (|Fraction| (|Polynomial| #1#))
                                           (|NonNegativeInteger|))
                                          (|NonNegativeInteger|)
                                          (|NonNegativeInteger|)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (|Fraction| (|Polynomial| #1#))
                                            (|NonNegativeInteger|)))))
                                    (|:| AX
                                         (|Mapping| (|Expression| (|Integer|))
                                                    (|NonNegativeInteger|)
                                                    (|Symbol|)
                                                    (|Expression|
                                                     (|Integer|))))
                                    (|:| C
                                         (|Mapping| (|List| (|Polynomial| #1#))
                                                    (|NonNegativeInteger|))))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessRec|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessPRec|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessRat|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessADE|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24))))
                              '((|guessHolo|
                                 ((|Mapping|
                                   (|List| (|Expression| (|Integer|)))
                                   (|List| (|Fraction| (|Polynomial| #1#)))
                                   (|List| (|GuessOption|)))
                                  (|Symbol|)))
                                (AND
                                 (|has| (|Polynomial| (|Integer|))
                                        (|RetractableTo| 24))
                                 (|has| (|Fraction| (|Polynomial| (|Integer|)))
                                        (|RetractableTo| 24)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
