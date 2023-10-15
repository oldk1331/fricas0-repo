
(SDEFUN |SOLVERAD;New| ((|s| |Expression| R) ($ |Expression| R))
        (SPROG ((S (|Expression| R)))
               (SEQ
                (COND
                 ((SPADCALL |s| (|spadConstant| $ 13) (QREFELT $ 15))
                  (|spadConstant| $ 13))
                 ('T
                  (SEQ
                   (LETT S
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT $ 17)) (QREFELT $ 19))
                           (QREFELT $ 21))
                          (QREFELT $ 22))
                         |SOLVERAD;New|)
                   (SETELT $ 7
                           (APPEND (LIST (SPADCALL S |s| (QREFELT $ 23)))
                                   (QREFELT $ 7)))
                   (EXIT S))))))) 

(SDEFUN |SOLVERAD;linear|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (LIST
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |u| 0 (QREFELT $ 26)) (QREFELT $ 27))
                    (QREFELT $ 28))
          (SPADCALL (SPADCALL |u| 1 (QREFELT $ 26)) (QREFELT $ 28))
          (QREFELT $ 31)))) 

(SDEFUN |SOLVERAD;quadratic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 38))) 

(SDEFUN |SOLVERAD;cubic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 39))) 

(SDEFUN |SOLVERAD;quartic|
        ((|u| |SparseUnivariatePolynomial| (|Polynomial| R))
         ($ |List| (|Expression| R)))
        (SPADCALL (SPADCALL (ELT $ 28) |u| (QREFELT $ 35)) (QREFELT $ 40))) 

(SDEFUN |SOLVERAD;rad| ((|n| |PositiveInteger|) ($ |Expression| R))
        (SPADCALL |n| (QREFELT $ 42))) 

(SDEFUN |SOLVERAD;wrap| ((|s| |Expression| R) ($ |Expression| R))
        (COND ((QREFELT $ 8) (|SOLVERAD;New| |s| $)) ('T |s|))) 

(SDEFUN |SOLVERAD;findGenZeros|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|List| (|Expression| R)))) (#1=#:G129 NIL) (|vv| NIL)
          (#2=#:G130 NIL) (|p| NIL) (#3=#:G128 NIL) (#4=#:G127 NIL) (|r| NIL)
          (#5=#:G126 NIL) (|v| (|Symbol|)) (|pp| (|Polynomial| R)))
         (SEQ (LETT |pp| (|SPADfirst| |rlp|) . #6=(|SOLVERAD;findGenZeros|))
              (LETT |v| (|SPADfirst| |rlv|) . #6#)
              (LETT |rlv| (CDR |rlv|) . #6#) (LETT |res| NIL . #6#)
              (LETT |res|
                    (APPEND
                     (PROGN
                      (LETT #5# NIL . #6#)
                      (SEQ (LETT |r| NIL . #6#)
                           (LETT #4#
                                 (SPADCALL (SPADCALL |pp| (QREFELT $ 21)) |v|
                                           (QREFELT $ 43))
                                 . #6#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #5#
                                   (CONS
                                    (REVERSE
                                     (CONS |r|
                                           (PROGN
                                            (LETT #3# NIL . #6#)
                                            (SEQ (LETT |p| NIL . #6#)
                                                 (LETT #2# (CDR |rlp|) . #6#)
                                                 (LETT |vv| NIL . #6#)
                                                 (LETT #1# |rlv| . #6#) G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |vv| (CAR #1#)
                                                              . #6#)
                                                        NIL)
                                                       (ATOM #2#)
                                                       (PROGN
                                                        (LETT |p| (CAR #2#)
                                                              . #6#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #3#
                                                         (CONS
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |p|
                                                                         |vv|
                                                                         (QREFELT
                                                                          $
                                                                          45))
                                                               0
                                                               (QREFELT $ 26))
                                                              (QREFELT $ 28))
                                                             (QREFELT $ 46))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |p|
                                                                        |vv|
                                                                        (QREFELT
                                                                         $ 45))
                                                              (QREFELT $ 47))
                                                             (QREFELT $ 28))
                                                            (QREFELT $ 31))
                                                           (SPADCALL |v|
                                                                     (QREFELT $
                                                                              49))
                                                           |r| (QREFELT $ 51))
                                                          #3#)
                                                         . #6#)))
                                                 (LETT #1#
                                                       (PROG1 (CDR #1#)
                                                         (LETT #2# (CDR #2#)
                                                               . #6#))
                                                       . #6#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #3#))))))
                                    #5#)
                                   . #6#)))
                           (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #5#))))
                     |res|)
                    . #6#)
              (EXIT |res|)))) 

(SDEFUN |SOLVERAD;findZeros|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((|res| (|List| (|List| (|Expression| R))))
          (|rlv1| (|List| (|Symbol|)))
          (|lv1| (|List| (|Kernel| (|Expression| R))))
          (|p1| (|List| (|Expression| R))) (|res1| (|List| (|Expression| R)))
          (#1=#:G141 NIL) (|par| NIL)
          (|parRes| (|List| (|List| (|Expression| R)))) (#2=#:G139 NIL)
          (|p| NIL) (#3=#:G140 NIL) (|v| NIL) (#4=#:G138 NIL))
         (SEQ
          (LETT |parRes|
                (PROGN
                 (LETT #4# NIL . #5=(|SOLVERAD;findZeros|))
                 (SEQ (LETT |v| NIL . #5#) (LETT #3# |rlv| . #5#)
                      (LETT |p| NIL . #5#) (LETT #2# |rlp| . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #5#) NIL)
                            (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 21)) |v|
                                         (QREFELT $ 43))
                               #4#)
                              . #5#)))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |parRes| (|SOLVERAD;select| |parRes| $) . #5#)
          (LETT |res| NIL . #5#)
          (SEQ (LETT |par| NIL . #5#) (LETT #1# |parRes| . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |par| (CAR #1#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |res1| (LIST (|SPADfirst| |par|)) . #5#)
                    (LETT |lv1|
                          (LIST (SPADCALL (|SPADfirst| |rlv|) (QREFELT $ 49)))
                          . #5#)
                    (LETT |rlv1| (CDR |rlv|) . #5#)
                    (LETT |p1| (CDR |par|) . #5#)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |p1| NIL (QREFELT $ 52)))
                           (GO G191)))
                         (SEQ
                          (LETT |res1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |p1|) |lv1| |res1|
                                           (QREFELT $ 55))
                                 |res1|)
                                . #5#)
                          (LETT |p1| (CDR |p1|) . #5#)
                          (LETT |lv1|
                                (CONS
                                 (SPADCALL (|SPADfirst| |rlv1|) (QREFELT $ 49))
                                 |lv1|)
                                . #5#)
                          (EXIT (LETT |rlv1| (CDR |rlv1|) . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |res| (CONS |res1| |res|) . #5#)))
               (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |SOLVERAD;radicalSolve;FSL;10|
        ((|pol| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((#1=#:G145 NIL) (|r| NIL) (#2=#:G144 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;FSL;10|))
                 (SEQ (LETT |r| NIL . #3#)
                      (LETT #1# (SPADCALL |pol| |v| (QREFELT $ 43)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |v| (QREFELT $ 56)) |r|
                                         (QREFELT $ 57))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;FL;11|
        ((|p| |Fraction| (|Polynomial| R))
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |p| (QREFELT $ 60))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ
                   (LETT |lv|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| (QREFELT $ 61))
                                     (QREFELT $ 63))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                     (QREFELT $ 63))
                           (QREFELT $ 65))
                          (QREFELT $ 66))
                         |SOLVERAD;radicalSolve;FL;11|)
                   (EXIT
                    (COND ((NULL |lv|) (|error| "inconsistent equation"))
                          ((SPADCALL (LENGTH |lv|) 1 (QREFELT $ 67))
                           (|error| "too many variables"))
                          (#1#
                           (SPADCALL |p| (|SPADfirst| |lv|)
                                     (QREFELT $ 59))))))))))) 

(SDEFUN |SOLVERAD;radicalSolve;EL;12|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R)))
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 70))
                   (SPADCALL |eq| (QREFELT $ 71)) (QREFELT $ 72))
         (QREFELT $ 68))) 

(SDEFUN |SOLVERAD;radicalSolve;ESL;13|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|v| |Symbol|)
         ($ |List| (|Equation| (|Expression| R))))
        (SPADCALL
         (SPADCALL (SPADCALL |eq| (QREFELT $ 70))
                   (SPADCALL |eq| (QREFELT $ 71)) (QREFELT $ 72))
         |v| (QREFELT $ 59))) 

(SDEFUN |SOLVERAD;radicalRoots;LLL;14|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Expression| R))))
        (SPROG
         ((#1=#:G161 NIL) (#2=#:G160 #3=(|List| (|List| (|Expression| R))))
          (#4=#:G162 #3#) (#5=#:G172 NIL) (|res| NIL)
          (|rpRes| (|List| #6=(|List| (|Polynomial| R)))) (#7=#:G171 NIL)
          (|result| (|List| (|List| (|Expression| R)))) (#8=#:G155 NIL)
          (#9=#:G154 #10=(|List| (|List| (|Expression| R)))) (#11=#:G156 #10#)
          (#12=#:G170 NIL) (|listGen| (|List| #6#)) (#13=#:G169 NIL)
          (#14=#:G168 NIL) (#15=#:G167 NIL) (#16=#:G166 NIL)
          (|rlv| (|List| (|Symbol|)))
          (|parRes| (|List| (|List| (|Polynomial| R)))))
         (SEQ
          (LETT |parRes| (SPADCALL |lp| |lv| (QREFELT $ 78))
                . #17=(|SOLVERAD;radicalRoots;LLL;14|))
          (EXIT
           (COND
            ((SPADCALL |parRes| (SPADCALL NIL (QREFELT $ 80)) (QREFELT $ 81))
             NIL)
            (#18='T
             (SEQ (LETT |rlv| (REVERSE |lv|) . #17#)
                  (LETT |rpRes|
                        (PROGN
                         (LETT #16# NIL . #17#)
                         (SEQ (LETT |res| NIL . #17#)
                              (LETT #15# |parRes| . #17#) G190
                              (COND
                               ((OR (ATOM #15#)
                                    (PROGN (LETT |res| (CAR #15#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16# (CONS (REVERSE |res|) #16#)
                                      . #17#)))
                              (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #16#))))
                        . #17#)
                  (LETT |listGen|
                        (PROGN
                         (LETT #14# NIL . #17#)
                         (SEQ (LETT |res| NIL . #17#)
                              (LETT #13# |rpRes| . #17#) G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |res| (CAR #13#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((|SOLVERAD;isGeneric?| |res| |rlv| $)
                                  (LETT #14# (CONS |res| #14#) . #17#)))))
                              (LETT #13# (CDR #13#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #14#))))
                        . #17#)
                  (LETT |result| NIL . #17#)
                  (COND
                   ((SPADCALL |listGen| NIL (QREFELT $ 82))
                    (SEQ
                     (LETT |result|
                           (PROGN
                            (LETT #8# NIL . #17#)
                            (SEQ (LETT |res| NIL . #17#)
                                 (LETT #12# |listGen| . #17#) G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |res| (CAR #12#) . #17#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #11#
                                          (|SOLVERAD;findGenZeros| |res| |rlv|
                                           $)
                                          . #17#)
                                    (COND
                                     (#8# (LETT #9# (APPEND #9# #11#) . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #9# #11# . #17#)
                                       (LETT #8# 'T . #17#)))))))
                                 (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#8# #9#) (#18# NIL)))
                           . #17#)
                     (EXIT
                      (SEQ (LETT |res| NIL . #17#) (LETT #7# |listGen| . #17#)
                           G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |res| (CAR #7#) . #17#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rpRes|
                                   (SPADCALL |rpRes|
                                             (SPADCALL |res| |rpRes|
                                                       (QREFELT $ 83))
                                             (QREFELT $ 84))
                                   . #17#)))
                           (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                           (EXIT NIL))))))
                  (EXIT
                   (COND ((SPADCALL |rpRes| NIL (QREFELT $ 81)) |result|)
                         (#18#
                          (APPEND
                           (PROGN
                            (LETT #1# NIL . #17#)
                            (SEQ (LETT |res| NIL . #17#)
                                 (LETT #5# |rpRes| . #17#) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |res| (CAR #5#) . #17#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|SOLVERAD;findZeros| |res| |rlv| $)
                                          . #17#)
                                    (COND
                                     (#1# (LETT #2# (APPEND #2# #4#) . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #4# . #17#)
                                       (LETT #1# 'T . #17#)))))))
                                 (LETT #5# (CDR #5#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#) (#18# NIL)))
                           |result|))))))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;15|
        ((|lp| |List| (|Fraction| (|Polynomial| R))) (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG ((#1=#:G176 NIL) (|lres| NIL) (#2=#:G175 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SOLVERAD;radicalSolve;LLL;15|))
                 (SEQ (LETT |lres| NIL . #3#)
                      (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |lres| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;16|
        ((|lp| |List| (|Fraction| (|Polynomial| R)))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G185 NIL) (|lres| NIL) (#2=#:G184 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G178 NIL) (#5=#:G177 #3#)
          (#6=#:G179 #3#) (#7=#:G183 NIL) (|p| NIL))
         (SEQ
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #8=(|SOLVERAD;radicalSolve;LL;16|))
                 (SEQ (LETT |p| NIL . #8#) (LETT #7# |lp| . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 61))
                                          (QREFELT $ 63))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                          (QREFELT $ 63))
                                (QREFELT $ 89))
                               . #8#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 89)) . #8#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #8#)
                            (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |lres| NIL . #8#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #8#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LLL;17|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         (|lv| |List| (|Symbol|))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G193 NIL) (|lres| NIL) (#2=#:G192 NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#3=#:G191 NIL)
          (|p| NIL) (#4=#:G190 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #4# NIL . #5=(|SOLVERAD;radicalSolve;LLL;17|))
                 (SEQ (LETT |p| NIL . #5#) (LETT #3# |le| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 71))
                                         (SPADCALL |p| (QREFELT $ 70))
                                         (QREFELT $ 72))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |lres| NIL . #5#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;radicalSolve;LL;18|
        ((|le| |List| (|Equation| (|Fraction| (|Polynomial| R))))
         ($ |List| (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((#1=#:G205 NIL) (|lres| NIL) (#2=#:G204 NIL)
          (|lv| #3=(|List| (|Symbol|))) (#4=#:G196 NIL) (#5=#:G195 #3#)
          (#6=#:G197 #3#) (#7=#:G203 NIL) (|p| NIL)
          (|lp| (|List| (|Fraction| (|Polynomial| R)))) (#8=#:G202 NIL)
          (#9=#:G201 NIL))
         (SEQ
          (LETT |lp|
                (PROGN
                 (LETT #9# NIL . #10=(|SOLVERAD;radicalSolve;LL;18|))
                 (SEQ (LETT |p| NIL . #10#) (LETT #8# |le| . #10#) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL (SPADCALL |p| (QREFELT $ 71))
                                         (SPADCALL |p| (QREFELT $ 70))
                                         (QREFELT $ 72))
                               #9#)
                              . #10#)))
                      (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #10#)
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #10#)
                 (SEQ (LETT |p| NIL . #10#) (LETT #7# |lp| . #10#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #10#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 61))
                                          (QREFELT $ 63))
                                (SPADCALL (SPADCALL |p| (QREFELT $ 64))
                                          (QREFELT $ 63))
                                (QREFELT $ 89))
                               . #10#)
                         (COND
                          (#4#
                           (LETT #5# (SPADCALL #5# #6# (QREFELT $ 89)) . #10#))
                          ('T
                           (PROGN
                            (LETT #5# #6# . #10#)
                            (LETT #4# 'T . #10#)))))))
                      (LETT #7# (CDR #7#) . #10#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|setUnion|))))
                . #10#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #10#)
            (SEQ (LETT |lres| NIL . #10#)
                 (LETT #1# (SPADCALL |lp| |lv| (QREFELT $ 86)) . #10#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |lres| (CAR #1#) . #10#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (|SOLVERAD;makeEq| |lres| |lv| $) #2#)
                         . #10#)))
                 (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |SOLVERAD;contractSolve;ESSt;19|
        ((|eq| |Equation| (|Fraction| (|Polynomial| R))) (|v| |Symbol|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (|SOLVERAD;solveInner|
         (SPADCALL
          (SPADCALL (SPADCALL |eq| (QREFELT $ 70))
                    (SPADCALL |eq| (QREFELT $ 71)) (QREFELT $ 72))
          (QREFELT $ 61))
         |v| 'T $)) 

(SDEFUN |SOLVERAD;contractSolve;FSSt;20|
        ((|pq| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 61)) |v| 'T $)) 

(SDEFUN |SOLVERAD;radicalRoots;FSL;21|
        ((|pq| |Fraction| (|Polynomial| R)) (|v| |Symbol|)
         ($ |List| (|Expression| R)))
        (SPADCALL
         (|SOLVERAD;solveInner| (SPADCALL |pq| (QREFELT $ 61)) |v| NIL $)
         (QREFELT $ 97))) 

(SDEFUN |SOLVERAD;isGeneric?|
        ((|rlp| |List| (|Polynomial| R)) (|rlv| |List| (|Symbol|))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G210 NIL) (#2=#:G209 #3=(|Boolean|)) (#4=#:G211 #3#)
          (#5=#:G213 NIL) (|f| NIL) (#6=#:G214 NIL) (|x| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|SOLVERAD;isGeneric?|))
           (SEQ (LETT |x| NIL . #7#) (LETT #6# (CDR |rlv|) . #7#)
                (LETT |f| NIL . #7#) (LETT #5# (CDR |rlp|) . #7#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #7#) NIL)
                      (ATOM #6#) (PROGN (LETT |x| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (EQL (SPADCALL |f| |x| (QREFELT $ 98)) 1) . #7#)
                   (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL)) . #7#))
                         ('T
                          (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #7#)) . #7#)
                (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 'T)))))) 

(SDEFUN |SOLVERAD;select|
        ((|lp| |List| (|List| (|Expression| R)))
         ($ . #1=(|List| (|List| (|Expression| R)))))
        (SPROG
         ((#2=#:G216 NIL) (#3=#:G215 #1#) (#4=#:G217 #1#) (#5=#:G222 NIL)
          (|lsel| NIL) (#6=#:G221 NIL) (#7=#:G220 NIL) (|f| NIL))
         (SEQ
          (COND
           ((SPADCALL |lp| NIL (QREFELT $ 99)) (SPADCALL NIL (QREFELT $ 100)))
           (#8='T
            (PROGN
             (LETT #2# NIL . #9=(|SOLVERAD;select|))
             (SEQ (LETT |f| NIL . #9#) (LETT #7# (|SPADfirst| |lp|) . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (PROGN
                            (LETT #6# NIL . #9#)
                            (SEQ (LETT |lsel| NIL . #9#)
                                 (LETT #5# (|SOLVERAD;select| (CDR |lp|) $)
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |lsel| (CAR #5#) . #9#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6# (CONS (CONS |f| |lsel|) #6#)
                                         . #9#)))
                                 (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           . #9#)
                     (COND (#2# (LETT #3# (APPEND #3# #4#) . #9#))
                           ('T
                            (PROGN
                             (LETT #3# #4# . #9#)
                             (LETT #2# 'T . #9#)))))))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
             (COND (#2# #3#) (#8# NIL)))))))) 

(SDEFUN |SOLVERAD;makeEq|
        ((|nres| |List| (|Expression| R)) (|lv| |List| (|Symbol|))
         ($ |List| (|Equation| (|Expression| R))))
        (SPROG
         ((#1=#:G226 NIL) (|x| NIL) (#2=#:G227 NIL) (|r| NIL) (#3=#:G225 NIL))
         (SEQ
          (PROGN
           (LETT #3# NIL . #4=(|SOLVERAD;makeEq|))
           (SEQ (LETT |r| NIL . #4#) (LETT #2# |nres| . #4#)
                (LETT |x| NIL . #4#) (LETT #1# |lv| . #4#) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL)
                      (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #4#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #3#
                        (CONS
                         (SPADCALL (SPADCALL |x| (QREFELT $ 56)) |r|
                                   (QREFELT $ 57))
                         #3#)
                        . #4#)))
                (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #4#)) . #4#)
                (GO G190) G191 (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SOLVERAD;solveInner|
        ((|pq| |Polynomial| R) (|v| |Symbol|) (|contractFlag| |Boolean|)
         ($ |SuchThat| (|List| (|Expression| R))
          (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|re| (|List| (|Equation| (|Expression| R))))
          (|solutions| (|List| (|Expression| R))) (#1=#:G242 NIL) (|i| NIL)
          (T0 (|List| (|Expression| R))) (|s| (|Expression| R)) (#2=#:G241 NIL)
          (|l| (|List| (|Expression| R)))
          (|unsolved| (|List| (|Polynomial| R))) (|n| (|NonNegativeInteger|))
          (|u| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (|t|
           (|Record|
            (|:| |pol| (|SparseUnivariatePolynomial| (|Polynomial| R)))
            (|:| |deg| (|PositiveInteger|))))
          (|constants| (|List| (|Polynomial| R))) (|ff| #3=(|Polynomial| R))
          (#4=#:G240 NIL) (|f| NIL)
          (|factors|
           (|List|
            (|Record| (|:| |factor| #3#) (|:| |exponent| (|Integer|))))))
         (SEQ (SETELT $ 7 NIL) (SETELT $ 8 |contractFlag|)
              (LETT |factors|
                    (SPADCALL (SPADCALL |pq| (QREFELT $ 103)) (QREFELT $ 106))
                    . #5=(|SOLVERAD;solveInner|))
              (LETT |constants| NIL . #5#) (LETT |unsolved| NIL . #5#)
              (LETT |solutions| NIL . #5#)
              (SEQ (LETT |f| NIL . #5#) (LETT #4# |factors| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ff| (QCAR |f|) . #5#)
                        (COND
                         ((NULL
                           (SPADCALL |v| (SPADCALL |ff| (QREFELT $ 63))
                                     (QREFELT $ 107)))
                          (EXIT
                           (LETT |constants| (CONS |ff| |constants|) . #5#))))
                        (LETT |u| (SPADCALL |ff| |v| (QREFELT $ 45)) . #5#)
                        (LETT |t| (SPADCALL |u| (QREFELT $ 110)) . #5#)
                        (LETT |u| (QCAR |t|) . #5#)
                        (LETT |n| (SPADCALL |u| (QREFELT $ 111)) . #5#)
                        (LETT |l|
                              (COND ((EQL |n| 1) (|SOLVERAD;linear| |u| $))
                                    ((EQL |n| 2) (|SOLVERAD;quadratic| |u| $))
                                    ((EQL |n| 3) (|SOLVERAD;cubic| |u| $))
                                    ((EQL |n| 4) (|SOLVERAD;quartic| |u| $))
                                    ('T
                                     (SEQ
                                      (LETT |unsolved| (CONS |ff| |unsolved|)
                                            . #5#)
                                      (EXIT NIL))))
                              . #5#)
                        (EXIT
                         (SEQ (LETT |s| NIL . #5#) (LETT #2# |l| . #5#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |s| (CAR #2#) . #5#) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (QCDR |t|) 1 (QREFELT $ 113))
                                 (LETT |s| (|SOLVERAD;wrap| |s| $) . #5#)))
                               (LETT T0
                                     (SPADCALL |s| (QCDR |t|) (QREFELT $ 114))
                                     . #5#)
                               (SEQ (LETT |i| 1 . #5#)
                                    (LETT #1# (QCDR |f|) . #5#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |solutions| (APPEND T0 |solutions|)
                                            . #5#)))
                                    (LETT |i| (|inc_SI| |i|) . #5#) (GO G190)
                                    G191 (EXIT NIL))
                               (EXIT (LETT |re| (QREFELT $ 7) . #5#)))
                              (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |solutions| (QREFELT $ 7) (QREFELT $ 115)))))) 

(DECLAIM (NOTINLINE |RadicalSolvePackage;|)) 

(DEFUN |RadicalSolvePackage| (#1=#:G243)
  (SPROG NIL
         (PROG (#2=#:G244)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RadicalSolvePackage|)
                                               '|domainEqualList|)
                    . #3=(|RadicalSolvePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|RadicalSolvePackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalSolvePackage|)))))))))) 

(DEFUN |RadicalSolvePackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|RadicalSolvePackage|))
          (LETT |dv$| (LIST '|RadicalSolvePackage| DV$1) . #1#)
          (LETT $ (GETREFV 116) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|RadicalSolvePackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 NIL)
          (QSETREFV $ 8 NIL)
          $))) 

(MAKEPROP '|RadicalSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|SideEquations|
              '|ContractSoln| (0 . |Zero|) (|Equation| 12) (4 . |Zero|)
              (|Expression| 6) (8 . |Zero|) (|Boolean|) (12 . =) (|Symbol|)
              (18 . |new|) (|Polynomial| 6) (22 . |coerce|) (|Fraction| 18)
              (27 . |coerce|) (32 . |coerce|) (37 . =) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 18) (43 . |coefficient|) (49 . -)
              (54 . |coerce|) (59 . |One|) (63 . |One|) (67 . /)
              (|SparseUnivariatePolynomial| 12) (|Mapping| 12 18)
              (|SparseUnivariatePolynomialFunctions2| 18 12) (73 . |map|)
              (|List| 12) (|PolynomialSolveByFormulas| 32 12)
              (79 . |quadratic|) (84 . |cubic|) (89 . |quartic|) (|Integer|)
              (94 . |coerce|) |SOLVERAD;radicalRoots;FSL;21|
              (|SparseUnivariatePolynomial| $) (99 . |univariate|) (105 . -)
              (110 . |leadingCoefficient|) (|Kernel| 12) (115 . |kernel|)
              (|Kernel| $) (120 . |eval|) (127 . ~=) (|List| 50) (|List| $)
              (133 . |eval|) (140 . |coerce|) (145 . |equation|) (|List| 10)
              |SOLVERAD;radicalSolve;FSL;10| (151 . |zero?|) (156 . |numer|)
              (|List| 16) (161 . |variables|) (166 . |denom|) (171 . |concat|)
              (177 . |removeDuplicates|) (182 . >)
              |SOLVERAD;radicalSolve;FL;11| (|Equation| 20) (188 . |lhs|)
              (193 . |rhs|) (198 . -) |SOLVERAD;radicalSolve;EL;12|
              |SOLVERAD;radicalSolve;ESL;13| (|List| 79) (|List| 20)
              (|SystemSolvePackage| 6) (204 . |triangularSystems|) (|List| 18)
              (210 . |list|) (215 . =) (221 . ~=) (227 . |position|)
              (233 . |delete|) (|List| 36) |SOLVERAD;radicalRoots;LLL;14|
              (|List| 58) |SOLVERAD;radicalSolve;LLL;15| (239 . |setUnion|)
              |SOLVERAD;radicalSolve;LL;16| (|List| 69)
              |SOLVERAD;radicalSolve;LLL;17| |SOLVERAD;radicalSolve;LL;18|
              (|SuchThat| 36 58) |SOLVERAD;contractSolve;ESSt;19|
              |SOLVERAD;contractSolve;FSSt;20| (245 . |lhs|) (250 . |degree|)
              (256 . =) (262 . |list|) (|Factored| 18)
              (|MultivariateFactorize| 16 (|IndexedExponents| 16) 6 18)
              (267 . |factor|) (|Record| (|:| |factor| 18) (|:| |exponent| 41))
              (|List| 104) (272 . |factors|) (277 . |member?|)
              (|Record| (|:| |pol| 25) (|:| |deg| 112))
              (|DegreeReductionPackage| 18 6) (283 . |reduce|) (288 . |degree|)
              (|PositiveInteger|) (293 . >) (299 . |expand|)
              (305 . |construct|))
           '#(|radicalSolve| 311 |radicalRoots| 355 |contractSolve| 367) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 115
                                                 '(0 6 0 9 0 10 0 11 0 12 0 13
                                                   2 12 14 0 0 15 0 16 0 17 1
                                                   18 0 16 19 1 20 0 18 21 1 12
                                                   0 20 22 2 10 0 12 12 23 2 25
                                                   18 0 24 26 1 18 0 0 27 1 12
                                                   0 18 28 0 6 0 29 0 10 0 30 2
                                                   12 0 0 0 31 2 34 32 33 25 35
                                                   1 37 36 32 38 1 37 36 32 39
                                                   1 37 36 32 40 1 12 0 41 42 2
                                                   18 44 0 16 45 1 12 0 0 46 1
                                                   25 18 0 47 1 48 0 16 49 3 12
                                                   0 0 50 0 51 2 36 14 0 0 52 3
                                                   12 0 0 53 54 55 1 12 0 16 56
                                                   2 10 0 12 12 57 1 20 14 0 60
                                                   1 20 18 0 61 1 18 62 0 63 1
                                                   20 18 0 64 2 62 0 0 0 65 1
                                                   62 0 0 66 2 24 14 0 0 67 1
                                                   69 20 0 70 1 69 20 0 71 2 20
                                                   0 0 0 72 2 77 75 76 62 78 1
                                                   75 0 79 80 2 75 14 0 0 81 2
                                                   75 14 0 0 82 2 75 41 79 0 83
                                                   2 75 0 0 41 84 2 62 0 0 0 89
                                                   1 94 36 0 97 2 18 24 0 16 98
                                                   2 85 14 0 0 99 1 85 0 36 100
                                                   1 102 101 18 103 1 101 105 0
                                                   106 2 62 14 16 0 107 1 109
                                                   108 25 110 1 25 24 0 111 2
                                                   112 14 0 0 113 2 109 36 12
                                                   112 114 2 94 0 36 58 115 2 0
                                                   58 20 16 59 2 0 58 69 16 74
                                                   1 0 58 20 68 1 0 58 69 73 1
                                                   0 87 76 90 2 0 87 76 62 88 2
                                                   0 87 91 62 92 1 0 87 91 93 2
                                                   0 36 20 16 43 2 0 85 76 62
                                                   86 2 0 94 20 16 96 2 0 94 69
                                                   16 95)))))
           '|lookupComplete|)) 
