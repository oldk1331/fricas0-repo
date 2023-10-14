
(SDEFUN |REP;evalvect|
        ((|vect| |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         (|alg| |Expression| (|Integer|)) (|x| |Symbol|)
         ($ |Matrix| (|Expression| (|Integer|))))
        (SPROG
         ((|v| (|Expression| (|Integer|))) (|i| NIL)
          (|w| (|Matrix| (|Expression| (|Integer|))))
          (|xx| (|Kernel| (|Expression| (|Integer|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |vect|) . #1=(|REP;evalvect|))
              (LETT |xx| (SPADCALL |x| (QREFELT $ 9)) . #1#)
              (LETT |w| (SPADCALL |n| 1 (QREFELT $ 14)) . #1#)
              (SEQ (LETT |i| 1 . #1#) G190
                   (COND ((|greater_SI| |i| |n|) (GO G191)))
                   (SEQ
                    (LETT |v|
                          (SPADCALL
                           (SPADCALL (SPADCALL |vect| |i| 1 (QREFELT $ 18))
                                     (QREFELT $ 19))
                           |xx| |alg| (QREFELT $ 21))
                          . #1#)
                    (EXIT (SPADCALL |w| |i| 1 |v| (QREFELT $ 22))))
                   (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |REP;innerprod|
        ((|v1| |Matrix| (|Expression| (|Integer|)))
         (|v2| |Matrix| (|Expression| (|Integer|)))
         ($ |Expression| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |v1| (QREFELT $ 23)) |v2| (QREFELT $ 24))
                  1 1 (QREFELT $ 25))) 

(SDEFUN |REP;normalise;2M;3|
        ((|v| |Matrix| (|Expression| (|Integer|)))
         ($ |Matrix| (|Expression| (|Integer|))))
        (SPROG ((|normv| (|Expression| (|Integer|))))
               (SEQ
                (LETT |normv|
                      (SPADCALL (|REP;innerprod| |v| |v| $) (QREFELT $ 26))
                      |REP;normalise;2M;3|)
                (EXIT
                 (COND
                  ((SPADCALL |normv| (|spadConstant| $ 27) (QREFELT $ 29)) |v|)
                  ('T
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 11) |normv| (QREFELT $ 30)) |v|
                    (QREFELT $ 31)))))))) 

(SDEFUN |REP;radicalEigenvalues;ML;4|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Expression| (|Integer|))))
        (SPROG
         ((|pol| (|Fraction| (|Polynomial| (|Integer|)))) (|x| (|Symbol|)))
         (SEQ
          (LETT |x| (SPADCALL (QREFELT $ 33))
                . #1=(|REP;radicalEigenvalues;ML;4|))
          (LETT |pol| (SPADCALL (SPADCALL A |x| (QREFELT $ 36)) (QREFELT $ 37))
                . #1#)
          (EXIT (SPADCALL |pol| |x| (QREFELT $ 39)))))) 

(SDEFUN |REP;radicalEigenvector;EML;5|
        ((|alpha| |Expression| (|Integer|))
         (A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((#1=#:G123 NIL) (|v| NIL) (#2=#:G122 NIL) (|j| NIL) (|i| NIL)
          (B (|Matrix| (|Expression| (|Integer|))))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS A) . #3=(|REP;radicalEigenvector;EML;5|))
              (LETT B (SPADCALL |n| |n| (QREFELT $ 14)) . #3#)
              (SEQ (LETT |i| 1 . #3#) G190
                   (COND ((|greater_SI| |i| |n|) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1 . #3#) G190
                         (COND ((|greater_SI| |j| |n|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL A |i| |j| (QREFELT $ 18))
                                      (QREFELT $ 19))
                                     (QREFELT $ 22))))
                         (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT $ 25))
                                         |alpha| (QREFELT $ 41))
                               (QREFELT $ 22))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |v| NIL . #3#)
                     (LETT #1# (SPADCALL B (QREFELT $ 43)) . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 45)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |REP;radicalEigenvectors;ML;6|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List|
          #1=(|Record| (|:| |radval| (|Expression| (|Integer|)))
                       (|:| |radmult| (|Integer|))
                       (|:| |radvect|
                            (|List| (|Matrix| (|Expression| (|Integer|))))))))
        (SPROG
         ((|sln|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|))))))))
          (|nsl| #1#) (#2=#:G147 NIL) (|ep| NIL) (#3=#:G146 NIL)
          (#4=#:G145 NIL) (|alg| NIL)
          (|lval| (|List| (|Expression| (|Integer|)))) (|xx| (|Symbol|))
          (|sym| (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|))))
          (#5=#:G128 NIL) (#6=#:G127 NIL)
          (|veclist| (|List| (|Matrix| (|Expression| (|Integer|))))) (|i| NIL)
          (|m| (|Matrix| (|Expression| (|Integer|)))) (#7=#:G144 NIL)
          (|ll| NIL) (#8=#:G143 NIL) (|eig| NIL) (|n| (|NonNegativeInteger|))
          (|leig|
           (|List|
            (|Record|
             (|:| |eigval|
                  (|Union| (|Fraction| (|Polynomial| (|Integer|)))
                           (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|)))))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List|
                   (|Matrix| (|Fraction| (|Polynomial| (|Integer|))))))))))
         (SEQ
          (LETT |leig| (SPADCALL A (QREFELT $ 51))
                . #9=(|REP;radicalEigenvectors;ML;6|))
          (LETT |n| (ANROWS A) . #9#) (LETT |sln| NIL . #9#)
          (SEQ (LETT |eig| NIL . #9#) (LETT #8# |leig| . #9#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |eig| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((QEQCAR (QVELT |eig| 0) 0)
                   (SEQ (LETT |veclist| NIL . #9#)
                        (SEQ (LETT |ll| NIL . #9#)
                             (LETT #7# (QVELT |eig| 2) . #9#) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |ll| (CAR #7#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |m| (SPADCALL |n| 1 (QREFELT $ 14)) . #9#)
                              (SEQ (LETT |i| 1 . #9#) G190
                                   (COND ((|greater_SI| |i| |n|) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |m| |i| 1
                                               (SPADCALL
                                                (SPADCALL |ll| |i| 1
                                                          (QREFELT $ 18))
                                                (QREFELT $ 19))
                                               (QREFELT $ 22))))
                                   (LETT |i| (|inc_SI| |i|) . #9#) (GO G190)
                                   G191 (EXIT NIL))
                              (EXIT
                               (LETT |veclist| (CONS |m| |veclist|) . #9#)))
                             (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |sln|
                               (CONS
                                (VECTOR
                                 (SPADCALL
                                  (PROG2 (LETT #6# (QVELT |eig| 0) . #9#)
                                      (QCDR #6#)
                                    (|check_union| (QEQCAR #6# 0)
                                                   (|Fraction|
                                                    (|Polynomial| (|Integer|)))
                                                   #6#))
                                  (QREFELT $ 19))
                                 (QVELT |eig| 1) |veclist|)
                                |sln|)
                               . #9#))))
                  ('T
                   (SEQ
                    (LETT |sym|
                          (PROG2 (LETT #5# (QVELT |eig| 0) . #9#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|SuchThat| (|Symbol|)
                                                       (|Polynomial|
                                                        (|Integer|)))
                                           #5#))
                          . #9#)
                    (LETT |xx| (SPADCALL |sym| (QREFELT $ 53)) . #9#)
                    (LETT |lval|
                          (SPADCALL
                           (SPADCALL (SPADCALL |sym| (QREFELT $ 54))
                                     (QREFELT $ 37))
                           |xx| (QREFELT $ 39))
                          . #9#)
                    (EXIT
                     (SEQ (LETT |alg| NIL . #9#) (LETT #4# |lval| . #9#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |alg| (CAR #4#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |nsl|
                                 (VECTOR |alg| (QVELT |eig| 1)
                                         (PROGN
                                          (LETT #3# NIL . #9#)
                                          (SEQ (LETT |ep| NIL . #9#)
                                               (LETT #2# (QVELT |eig| 2) . #9#)
                                               G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |ep| (CAR #2#)
                                                            . #9#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #3#
                                                       (CONS
                                                        (|REP;evalvect| |ep|
                                                         |alg| |xx| $)
                                                        #3#)
                                                       . #9#)))
                                               (LETT #2# (CDR #2#) . #9#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #3#)))))
                                 . #9#)
                           (EXIT (LETT |sln| (CONS |nsl| |sln|) . #9#)))
                          (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                          (EXIT NIL))))))))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |sln|)))) 

(SDEFUN |REP;gramschmidt;2L;7|
        ((|lvect| |List| (|Matrix| (|Expression| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((|orth| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (|pol| (|Matrix| (|Expression| (|Integer|)))) (#1=#:G155 NIL)
          (#2=#:G154 (RMR)) (#3=#:G156 (RMR)) (#4=#:G162 NIL) (|w| NIL)
          (#5=#:G161 NIL) (|v| (|Matrix| (|Expression| (|Integer|))))
          (RMR
           (|Join|
            (|RectangularMatrixCategory|
             #6=(PROG1
                    (LET #7=#:G149
                      |n|)
                  (|check_subtype| (> #7# 0) '(|PositiveInteger|) #7#))
             #8=(|call| (XLAM |ignore| 1)) #9=(|Expression| (|Integer|))
             (|DirectProduct| #8# #9#) (|DirectProduct| #6# #9#))
            (|CoercibleTo| (|Matrix| #9#))
            (CATEGORY |domain|
             (IF (|has| #9# (|Field|))
                 (ATTRIBUTE (|VectorSpace| #9#))
                 |noBranch|)
             (IF (|has| #9# (|ConvertibleTo| (|InputForm|)))
                 (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                 |noBranch|)
             (SIGNATURE |rectangularMatrix| ($ (|Matrix| #9#)))
             (SIGNATURE |coerce| ((|Matrix| #9#) $)))))
          (#10=#:G150 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |lvect| NIL (QREFELT $ 58)) NIL)
                ('T
                 (SEQ
                  (LETT |v| (|SPADfirst| |lvect|)
                        . #11=(|REP;gramschmidt;2L;7|))
                  (LETT |n| (ANROWS |v|) . #11#)
                  (LETT RMR
                        (|RectangularMatrix|
                         (PROG1 (LETT #10# |n| . #11#)
                           (|check_subtype| (> #10# 0) '(|PositiveInteger|)
                                            #10#))
                         1 (|Expression| (|Integer|)))
                        . #11#)
                  (LETT |orth| (LIST (SPADCALL |v| (QREFELT $ 32))) . #11#)
                  (SEQ (LETT |v| NIL . #11#) (LETT #5# (CDR |lvect|) . #11#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |v| (CAR #5#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pol|
                              (SPADCALL
                               (SPADCALL |v|
                                         (PROGN
                                          (LETT #1# NIL . #11#)
                                          (SEQ (LETT |w| NIL . #11#)
                                               (LETT #4# |orth| . #11#) G190
                                               (COND
                                                ((OR (ATOM #4#)
                                                     (PROGN
                                                      (LETT |w| (CAR #4#)
                                                            . #11#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #3#
                                                        (SPADCALL
                                                         (|REP;innerprod| |w|
                                                          |v| $)
                                                         |w| (QREFELT $ 31))
                                                        . #11#)
                                                  (COND
                                                   (#1#
                                                    (LETT #2#
                                                          (SPADCALL #2# #3#
                                                                    (|compiledLookupCheck|
                                                                     '+
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     RMR))
                                                          . #11#))
                                                   ('T
                                                    (PROGN
                                                     (LETT #2# #3# . #11#)
                                                     (LETT #1# 'T . #11#)))))))
                                               (LETT #4# (CDR #4#) . #11#)
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#1# #2#)
                                                ('T
                                                 (SPADCALL
                                                  (|compiledLookupCheck|
                                                   '|Zero| (LIST '$) RMR)))))
                                         (|compiledLookupCheck| '-
                                                                (LIST '$ '$ '$)
                                                                RMR))
                               (|compiledLookupCheck| '|coerce|
                                                      (LIST
                                                       (LIST '|Matrix|
                                                             (LIST
                                                              '|Expression|
                                                              (LIST
                                                               '|Integer|)))
                                                       '$)
                                                      RMR))
                              . #11#)
                        (EXIT
                         (LETT |orth|
                               (CONS (SPADCALL |pol| (QREFELT $ 32)) |orth|)
                               . #11#)))
                       (LETT #5# (CDR #5#) . #11#) (GO G190) G191 (EXIT NIL))
                  (EXIT |orth|))))))) 

(SDEFUN |REP;eigenMatrix;MU;8|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |Union| (|Matrix| (|Expression| (|Integer|))) "failed"))
        (SPROG
         ((|d| (|Matrix| (|Expression| (|Integer|)))) (#1=#:G178 NIL) (|v| NIL)
          (|n| (|NonNegativeInteger|))
          (|lef| #2=(|List| (|Matrix| (|Expression| (|Integer|)))))
          (#3=#:G168 NIL) (#4=#:G167 #2#) (#5=#:G169 #2#) (#6=#:G177 NIL)
          (|eiv| NIL))
         (SEQ
          (LETT |lef|
                (PROGN
                 (LETT #3# NIL . #7=(|REP;eigenMatrix;MU;8|))
                 (SEQ (LETT |eiv| NIL . #7#)
                      (LETT #6# (SPADCALL A (QREFELT $ 57)) . #7#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |eiv| (CAR #6#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5# (QVELT |eiv| 2) . #7#)
                         (COND (#3# (LETT #4# (APPEND #4# #5#) . #7#))
                               ('T
                                (PROGN
                                 (LETT #4# #5# . #7#)
                                 (LETT #3# 'T . #7#)))))))
                      (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#8='T NIL)))
                . #7#)
          (LETT |n| (ANROWS A) . #7#)
          (EXIT
           (COND ((< (LENGTH |lef|) |n|) (CONS 1 "failed"))
                 (#8#
                  (SEQ
                   (LETT |d| (SPADCALL (|SPADfirst| |lef|) (QREFELT $ 60))
                         . #7#)
                   (SEQ (LETT |v| NIL . #7#) (LETT #1# (CDR |lef|) . #7#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |v| (CAR #1#) . #7#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |d| (SPADCALL |d| |v| (QREFELT $ 61)) . #7#)))
                        (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |d|))))))))) 

(SDEFUN |REP;orthonormalBasis;ML;9|
        ((A |Matrix| (|Fraction| (|Polynomial| (|Integer|))))
         ($ |List| (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((|basis| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (|lvec| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (#1=#:G187 NIL) (|alterm| NIL) (|n| (|NonNegativeInteger|))
          (|alglist|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|)))))))))
         (SEQ
          (COND
           ((NULL (SPADCALL A (QREFELT $ 64)))
            (|error| "the matrix is not symmetric"))
           ('T
            (SEQ (LETT |basis| NIL . #2=(|REP;orthonormalBasis;ML;9|))
                 (LETT |lvec| NIL . #2#)
                 (LETT |alglist| (SPADCALL A (QREFELT $ 57)) . #2#)
                 (LETT |n| (ANROWS A) . #2#)
                 (SEQ (LETT |alterm| NIL . #2#) (LETT #1# |alglist| . #2#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |alterm| (CAR #1#) . #2#) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |lvec| (QVELT |alterm| 2) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL |lvec| NIL (QREFELT $ 58))
                               (|error| "sorry ")))))
                       (EXIT
                        (COND
                         ((SPADCALL (LENGTH |lvec|) 1 (QREFELT $ 65))
                          (SEQ
                           (LETT |lvec| (SPADCALL |lvec| (QREFELT $ 59)) . #2#)
                           (EXIT
                            (LETT |basis| (APPEND |lvec| |basis|) . #2#))))
                         ('T
                          (LETT |basis|
                                (CONS
                                 (SPADCALL (|SPADfirst| |lvec|) (QREFELT $ 32))
                                 |basis|)
                                . #2#)))))
                      (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                 (EXIT |basis|))))))) 

(DECLAIM (NOTINLINE |RadicalEigenPackage;|)) 

(DEFUN |RadicalEigenPackage| ()
  (SPROG NIL
         (PROG (#1=#:G189)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RadicalEigenPackage|)
                    . #2=(|RadicalEigenPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RadicalEigenPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|RadicalEigenPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RadicalEigenPackage|)))))))))) 

(DEFUN |RadicalEigenPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RadicalEigenPackage|) . #1=(|RadicalEigenPackage|))
          (LETT $ (GETREFV 67) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RadicalEigenPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|RadicalSolvePackage| (|Integer|)))
          $))) 

(MAKEPROP '|RadicalEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'RSP (|Symbol|) (|Kernel| 10)
              (0 . |kernel|) (|Expression| 16) (5 . |One|)
              (|NonNegativeInteger|) (|Matrix| 10) (9 . |zero|) (|Fraction| 34)
              (|Integer|) (|Matrix| 15) (15 . |elt|) (22 . |coerce|)
              (|Kernel| $) (27 . |eval|) (34 . |setelt|) (42 . |transpose|)
              (47 . *) (53 . |elt|) (60 . |sqrt|) (65 . |Zero|) (|Boolean|)
              (69 . =) (75 . /) (81 . *) |REP;normalise;2M;3| (87 . |new|)
              (|Polynomial| 16) (|EigenPackage| 16)
              (91 . |characteristicPolynomial|) (97 . |coerce|) (|List| 10)
              (102 . |radicalRoots|) |REP;radicalEigenvalues;ML;4| (108 . -)
              (|List| 44) (114 . |nullSpace|) (|Vector| 10) (119 . |coerce|)
              (|List| 13) |REP;radicalEigenvector;EML;5| (|Union| 15 52)
              (|Record| (|:| |eigval| 48) (|:| |eigmult| 12)
                        (|:| |eigvec| (|List| 17)))
              (|List| 49) (124 . |eigenvectors|) (|SuchThat| 7 34)
              (129 . |lhs|) (134 . |rhs|)
              (|Record| (|:| |radval| 10) (|:| |radmult| 16)
                        (|:| |radvect| 46))
              (|List| 55) |REP;radicalEigenvectors;ML;6| (139 . =)
              |REP;gramschmidt;2L;7| (145 . |copy|) (150 . |horizConcat|)
              (|Union| 13 '"failed") |REP;eigenMatrix;MU;8|
              (156 . |symmetric?|) (161 . >) |REP;orthonormalBasis;ML;9|)
           '#(|radicalEigenvectors| 167 |radicalEigenvector| 172
              |radicalEigenvalues| 178 |orthonormalBasis| 183 |normalise| 188
              |gramschmidt| 193 |eigenMatrix| 198)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 8 0 7 9 0 10 0 11 2 13 0
                                                   12 12 14 3 17 15 0 16 16 18
                                                   1 10 0 15 19 3 10 0 0 20 0
                                                   21 4 13 10 0 16 16 10 22 1
                                                   13 0 0 23 2 13 0 0 0 24 3 13
                                                   10 0 16 16 25 1 10 0 0 26 0
                                                   10 0 27 2 10 28 0 0 29 2 10
                                                   0 0 0 30 2 13 0 10 0 31 0 7
                                                   0 33 2 35 34 17 7 36 1 15 0
                                                   34 37 2 6 38 15 7 39 2 10 0
                                                   0 0 41 1 13 42 0 43 1 13 0
                                                   44 45 1 35 50 17 51 1 52 7 0
                                                   53 1 52 34 0 54 2 46 28 0 0
                                                   58 1 13 0 0 60 2 13 0 0 0 61
                                                   1 17 28 0 64 2 12 28 0 0 65
                                                   1 0 56 17 57 2 0 46 10 17 47
                                                   1 0 38 17 40 1 0 46 17 66 1
                                                   0 13 13 32 1 0 46 46 59 1 0
                                                   62 17 63)))))
           '|lookupComplete|)) 

(MAKEPROP '|RadicalEigenPackage| 'NILADIC T) 
