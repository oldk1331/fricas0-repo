
(SDEFUN |CRFP;complexZeros;UPRL;1|
        ((|p| UP) (|eps| R) ($ |List| (|Complex| R)))
        (SPROG
         ((#1=#:G127 NIL) (|linfac| NIL) (#2=#:G126 NIL)
          (|facs| (|Factored| UP)) (|eps0| (R)))
         (SEQ
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 27)
                                    (SPADCALL |p| (QREFELT $ 31))
                                    (QREFELT $ 32))
                          (QREFELT $ 14))
                . #3=(|CRFP;complexZeros;UPRL;1|))
          (LETT |facs| (SPADCALL |p| |eps0| (QREFELT $ 34)) . #3#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |linfac| NIL . #3#)
                 (LETT #1# (SPADCALL |facs| (QREFELT $ 38)) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |linfac| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (SPADCALL
                           (SPADCALL (QVELT |linfac| 1) 0 (QREFELT $ 40))
                           (QREFELT $ 41))
                          #2#)
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |CRFP;complexZeros;UPL;2| ((|p| UP) ($ |List| (|Complex| R)))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 43))) 

(SDEFUN |CRFP;setErrorBound;2R;3| ((|r| R) ($ R))
        (SPROG ((|lof| (|List| (|OutputForm|))) (|rd| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |r| (|spadConstant| $ 45) (QREFELT $ 48))
                  (|error| "setErrorBound: need error bound greater 0"))
                 ('T
                  (SEQ (SETELT $ 15 |r|)
                       (COND
                        ((|HasCategory| (QREFELT $ 6)
                                        (LIST '|QuotientFieldCategory|
                                              '(|Integer|)))
                         (SEQ
                          (LETT |rd|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 12) |r|
                                           (QREFELT $ 14))
                                 (QREFELT $ 49))
                                . #1=(|CRFP;setErrorBound;2R;3|))
                          (SETELT $ 9 (* (* |rd| |rd|) 10))
                          (LETT |lof|
                                (LIST
                                 (SPADCALL
                                  "setErrorBound: internal digits set to"
                                  (QREFELT $ 18))
                                 (SPADCALL (QREFELT $ 9) (QREFELT $ 50)))
                                . #1#)
                          (EXIT
                           (SPADCALL (SPADCALL |lof| (QREFELT $ 52))
                                     (QREFELT $ 54))))))
                       (SPADCALL "setErrorBound: internal error bound set to"
                                 (QREFELT $ 55))
                       (EXIT (QREFELT $ 15)))))))) 

(SDEFUN |CRFP;pleskenSplit;UPRBF;4|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|fp| (|Factored| UP)) (#1=#:G150 NIL) (|fac| NIL)
          (|notFoundSplit| (|Boolean|))
          (|split| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
          (|splits|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|tp| (UP)) (|psR| (|Rep|)) (|sR| (|Rep|)) (|nm| (R)) (|st| (UP))
          (|p| (UP)) (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|md| (|NonNegativeInteger|)))
         (SEQ
          (LETT |p| (|CRFP;makeMonic| |poly| $)
                . #2=(|CRFP;pleskenSplit;UPRBF;4|))
          (COND
           ((NULL (ZEROP (LETT |md| (SPADCALL |p| (QREFELT $ 57)) . #2#)))
            (SEQ
             (LETT |fp|
                   (SPADCALL (SPADCALL (|spadConstant| $ 58) 1 (QREFELT $ 59))
                             |md| (QREFELT $ 60))
                   . #2#)
             (EXIT
              (LETT |p|
                    (SPADCALL |p|
                              (SPADCALL (|spadConstant| $ 58) |md|
                                        (QREFELT $ 59))
                              (QREFELT $ 61))
                    . #2#)))))
          (LETT |sP| (SPADCALL |p| (QREFELT $ 63)) . #2#)
          (LETT |fp| (QCDR |sP|) . #2#)
          (COND
           ((NULL (SPADCALL |fp| (|spadConstant| $ 64) (QREFELT $ 65)))
            (SEQ
             (LETT |qr|
                   (SPADCALL |p|
                             (|CRFP;makeMonic| (SPADCALL |fp| (QREFELT $ 66))
                              $)
                             (QREFELT $ 68))
                   . #2#)
             (EXIT (LETT |p| (QCAR |qr|) . #2#)))))
          (LETT |st| (QCAR |sP|) . #2#)
          (EXIT
           (COND ((ZEROP (SPADCALL |st| (QREFELT $ 31))) |fp|)
                 ('T
                  (SEQ (SPADCALL |p| (QREFELT $ 69)) (LETT |nm| |eps| . #2#)
                       (LETT |sR| (SPADCALL |st| (QREFELT $ 70)) . #2#)
                       (LETT |psR|
                             (SPADCALL |sR| (SPADCALL |poly| (QREFELT $ 31))
                                       (QREFELT $ 71))
                             . #2#)
                       (LETT |notFoundSplit| 'T . #2#)
                       (SEQ G190 (COND ((NULL |notFoundSplit|) (GO G191)))
                            (SEQ
                             (LETT |psR|
                                   (SPADCALL
                                    (SPADCALL |psR| |psR| (QREFELT $ 72)) |sR|
                                    (QREFELT $ 72))
                                   . #2#)
                             (LETT |tp| (SPADCALL |psR| (QREFELT $ 73)) . #2#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL |tp| (QREFELT $ 31)))
                                (SEQ
                                 (COND
                                  (|info|
                                   (SPADCALL
                                    "we leave as we got constant factor"
                                    (QREFELT $ 55))))
                                 (EXIT (SPADCALL |poly| 1 (QREFELT $ 74)))))
                               ('T
                                (SEQ
                                 (LETT |splits|
                                       (SPADCALL |p| (|CRFP;makeMonic| |tp| $)
                                                 |info| (QREFELT $ 77))
                                       . #2#)
                                 (LETT |split|
                                       (SPADCALL
                                        (CONS (|function| |CRFP;min|) $)
                                        |splits| (QREFELT $ 79))
                                       . #2#)
                                 (EXIT
                                  (LETT |notFoundSplit|
                                        (SPADCALL |eps| (QCDR |split|)
                                                  (QREFELT $ 48))
                                        . #2#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (SEQ (LETT |fac| NIL . #2#)
                            (LETT #1# (QCAR |split|) . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |fac| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |fp|
                                    (COND
                                     ((EQL (SPADCALL |fac| (QREFELT $ 31)) 1)
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 74))
                                                (QREFELT $ 80)))
                                     ('T
                                      (SPADCALL |fp|
                                                (SPADCALL |fac| 1
                                                          (QREFELT $ 60))
                                                (QREFELT $ 80))))
                                    . #2#)))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |fp|)))))))) 

(SDEFUN |CRFP;startPolynomial;UPR;5|
        ((|p| UP)
         ($ |Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
        (SPROG
         ((|po| (|Integer|)) (|maxq| (R)) (#1=#:G169 NIL) (|qq| (R)) (|rd| (R))
          (|r1| (R)) (#2=#:G173 NIL) (|q| NIL) (|j| NIL)
          (|sP| (|Record| (|:| |start| UP) (|:| |factors| (|Factored| UP))))
          (|fp| (|Factored| UP)) (|centerIsRoot| (|Boolean|)) (|pp| (UP))
          (|mD| (|NonNegativeInteger|)) (#3=#:G172 NIL) (|i| NIL)
          (|lp| (|List| UP)) (#4=#:G171 NIL) (|v| NIL) (#5=#:G170 NIL)
          (|listOfCenters| (|List| (|Complex| R))) (|startPoly| (UP))
          (|u| (|Complex| R)) (|eps| (R)))
         (SEQ
          (LETT |fp| (|spadConstant| $ 64) . #6=(|CRFP;startPolynomial;UPR;5|))
          (EXIT
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 31)) 1)
             (SEQ (LETT |p| (|CRFP;makeMonic| |p| $) . #6#)
                  (EXIT (CONS |p| (SPADCALL |p| 1 (QREFELT $ 60))))))
            (#7='T
             (SEQ
              (LETT |startPoly|
                    (SPADCALL (|spadConstant| $ 58) 1 (QREFELT $ 59)) . #6#)
              (LETT |eps| (QREFELT $ 29) . #6#)
              (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 82)) . #6#)
              (LETT |rd|
                    (SPADCALL (|spadConstant| $ 12)
                              (SPADCALL (SPADCALL |p| (QREFELT $ 83)) |eps|
                                        (QREFELT $ 82))
                              (QREFELT $ 14))
                    . #6#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |r1| |rd| (QREFELT $ 14))
                           (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                     (SPADCALL 2 (QREFELT $ 11))
                                     (QREFELT $ 14))
                           (QREFELT $ 84))
                 (CONS |startPoly| |fp|))
                (#7#
                 (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 85)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |u| 0 (QREFELT $ 59))
                                      (QREFELT $ 86))
                            . #6#)
                      (LETT |p|
                            (|CRFP;shift| |p| (SPADCALL |u| (QREFELT $ 41)) $)
                            . #6#)
                      (LETT |r1| (SPADCALL |p| |eps| (QREFELT $ 82)) . #6#)
                      (LETT |startPoly|
                            (SPADCALL |startPoly|
                                      (SPADCALL |r1| (QREFELT $ 87))
                                      (QREFELT $ 88))
                            . #6#)
                      (LETT |listOfCenters|
                            (LIST
                             (SPADCALL |r1| (|spadConstant| $ 45)
                                       (QREFELT $ 89))
                             (SPADCALL (|spadConstant| $ 45) |r1|
                                       (QREFELT $ 89))
                             (SPADCALL (SPADCALL |r1| (QREFELT $ 90))
                                       (|spadConstant| $ 45) (QREFELT $ 89))
                             (SPADCALL (|spadConstant| $ 45)
                                       (SPADCALL |r1| (QREFELT $ 90))
                                       (QREFELT $ 89)))
                            . #6#)
                      (LETT |lp|
                            (PROGN
                             (LETT #5# NIL . #6#)
                             (SEQ (LETT |v| NIL . #6#)
                                  (LETT #4# |listOfCenters| . #6#) G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (|CRFP;shift| |p| |v| $) #5#)
                                          . #6#)))
                                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                  (EXIT (NREVERSE #5#))))
                            . #6#)
                      (LETT |centerIsRoot| NIL . #6#)
                      (SEQ (LETT |i| 1 . #6#)
                           (LETT #3# (SPADCALL |lp| (QREFELT $ 92)) . #6#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (LETT |mD|
                                  (SPADCALL (SPADCALL |lp| |i| (QREFELT $ 93))
                                            (QREFELT $ 57))
                                  . #6#)
                            (EXIT
                             (COND
                              ((SPADCALL |mD| 0 (QREFELT $ 94))
                               (SEQ
                                (LETT |pp|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 58) 1
                                                 (QREFELT $ 59))
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |listOfCenters| |i|
                                                   (QREFELT $ 95))
                                         |u| (QREFELT $ 96))
                                        0 (QREFELT $ 59))
                                       (QREFELT $ 86))
                                      . #6#)
                                (LETT |centerIsRoot| 'T . #6#)
                                (EXIT
                                 (LETT |fp|
                                       (SPADCALL |fp|
                                                 (SPADCALL |pp| |mD|
                                                           (QREFELT $ 60))
                                                 (QREFELT $ 80))
                                       . #6#)))))))
                           (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        (|centerIsRoot|
                         (SEQ
                          (LETT |p|
                                (SPADCALL (|CRFP;shift| |p| |u| $)
                                          (SPADCALL |fp| (QREFELT $ 66))
                                          (QREFELT $ 61))
                                . #6#)
                          (EXIT
                           (COND
                            ((ZEROP (SPADCALL |p| (QREFELT $ 31)))
                             (CONS |p| |fp|))
                            (#7#
                             (SEQ
                              (LETT |sP| (SPADCALL |p| (QREFELT $ 63)) . #6#)
                              (EXIT (CONS (QCAR |sP|) |fp|))))))))
                        (#7#
                         (SEQ (LETT |po| 1 . #6#)
                              (LETT |maxq| (|spadConstant| $ 12) . #6#)
                              (SEQ
                               (EXIT
                                (SEQ (LETT |j| 1 . #6#) (LETT |q| NIL . #6#)
                                     (LETT #2# |lp| . #6#) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN
                                            (LETT |q| (CAR #2#) . #6#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |r1|
                                            (SPADCALL |q| |eps| (QREFELT $ 82))
                                            . #6#)
                                      (LETT |rd|
                                            (SPADCALL (|spadConstant| $ 12)
                                                      (SPADCALL
                                                       (SPADCALL |q|
                                                                 (QREFELT $
                                                                          83))
                                                       |eps| (QREFELT $ 82))
                                                      (QREFELT $ 14))
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (LETT |qq|
                                                (SPADCALL |r1| |rd|
                                                          (QREFELT $ 14))
                                                . #6#)
                                          (SPADCALL (SPADCALL 3 (QREFELT $ 11))
                                                    (SPADCALL 2 (QREFELT $ 11))
                                                    (QREFELT $ 14))
                                          (QREFELT $ 84))
                                         (SEQ (LETT |po| |j| . #6#)
                                              (EXIT
                                               (PROGN
                                                (LETT #1# |$NoValue| . #6#)
                                                (GO #8=#:G163)))))
                                        ('T
                                         (SEQ
                                          (COND
                                           ((EQL |j| 1)
                                            (LETT |maxq| |qq| . #6#)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |qq| |maxq|
                                                       (QREFELT $ 84))
                                             (SEQ (LETT |maxq| |qq| . #6#)
                                                  (EXIT
                                                   (LETT |po| |j|
                                                         . #6#)))))))))))
                                     (LETT #2#
                                           (PROG1 (CDR #2#)
                                             (LETT |j| (|inc_SI| |j|) . #6#))
                                           . #6#)
                                     (GO G190) G191 (EXIT NIL)))
                               #8# (EXIT #1#))
                              (EXIT
                               (CONS
                                (SPADCALL |startPoly|
                                          (SPADCALL
                                           (SPADCALL |listOfCenters| |po|
                                                     (QREFELT $ 95))
                                           0 (QREFELT $ 59))
                                          (QREFELT $ 86))
                                |fp|))))))))))))))))) 

(SDEFUN |CRFP;norm;UPR;6| ((|p| UP) ($ R))
        (SPROG ((|nm| (R)) (#1=#:G177 NIL) (|c| NIL))
               (SEQ (LETT |nm| (|spadConstant| $ 45) . #2=(|CRFP;norm;UPR;6|))
                    (SEQ (LETT |c| NIL . #2#)
                         (LETT #1# (SPADCALL |p| (QREFELT $ 97)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |nm|
                                 (SPADCALL |nm| (|CRFP;absC| |c| $)
                                           (QREFELT $ 98))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |nm|)))) 

(SDEFUN |CRFP;pleskenSplit;UPRF;7| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 81))) 

(SDEFUN |CRFP;graeffe;2UP;8| ((|p| UP) ($ UP))
        (SPROG
         ((|aBack| #1=(|List| (|Complex| R))) (|gp| (UP)) (#2=#:G182 NIL)
          (|const| (|Integer|)) (|aBackCopy| #1#)
          (|aForthCopy| (|List| (|Complex| R))) (|sum| (|Complex| R))
          (#3=#:G189 NIL) (|aminus| NIL) (#4=#:G190 NIL) (|aplus| NIL)
          (|aForth| (|List| (|Complex| R))) (|ak| (|Complex| R))
          (#5=#:G188 NIL) (|k| NIL) (#6=#:G187 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |p| (QREFELT $ 31)) . #7=(|CRFP;graeffe;2UP;8|))
          (LETT |aForth| NIL . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #6# |n| . #7#) G190
               (COND ((|greater_SI| |k| #6#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |aForth|
                       (CONS (SPADCALL |p| |k| (QREFELT $ 40)) |aForth|)
                       . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |aBack| NIL . #7#) (LETT |gp| (|spadConstant| $ 46) . #7#)
          (SEQ (LETT |k| 0 . #7#) (LETT #5# |n| . #7#) G190
               (COND ((|greater_SI| |k| #5#) (GO G191)))
               (SEQ (LETT |ak| (|SPADfirst| |aForth|) . #7#)
                    (LETT |aForth| (CDR |aForth|) . #7#)
                    (LETT |aForthCopy| |aForth| . #7#)
                    (LETT |aBackCopy| |aBack| . #7#)
                    (LETT |sum| (|spadConstant| $ 101) . #7#)
                    (LETT |const| -1 . #7#)
                    (SEQ (LETT |aplus| NIL . #7#) (LETT #4# |aForth| . #7#)
                         (LETT |aminus| NIL . #7#) (LETT #3# |aBack| . #7#)
                         G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |aminus| (CAR #3#) . #7#) NIL)
                               (ATOM #4#)
                               (PROGN (LETT |aplus| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |sum|
                                (SPADCALL |sum|
                                          (SPADCALL
                                           (SPADCALL |const| |aminus|
                                                     (QREFELT $ 102))
                                           |aplus| (QREFELT $ 103))
                                          (QREFELT $ 104))
                                . #7#)
                          (LETT |aForthCopy| (CDR |aForthCopy|) . #7#)
                          (LETT |aBackCopy| (CDR |aBackCopy|) . #7#)
                          (EXIT (LETT |const| (- |const|) . #7#)))
                         (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |gp|
                          (SPADCALL |gp|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |ak| |ak| (QREFELT $ 103))
                                      (SPADCALL 2 |sum| (QREFELT $ 105))
                                      (QREFELT $ 104))
                                     (PROG1 (LETT #2# (- |n| |k|) . #7#)
                                       (|check_subtype2| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                     (QREFELT $ 59))
                                    (QREFELT $ 106))
                          . #7#)
                    (EXIT (LETT |aBack| (CONS |ak| |aBack|) . #7#)))
               (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |gp|)))) 

(SDEFUN |CRFP;rootRadius;UP2R;9| ((|p| UP) (|errorQuotient| R) ($ R))
        (SPROG
         ((|pp| (UP)) (|rR| (R)) (|expo| (|NonNegativeInteger|)) (|rho| (R))
          (|currentError| (R)) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |errorQuotient| (|spadConstant| $ 12) (QREFELT $ 48))
            (|error| "rootRadius: second Parameter must be greater than 1"))
           ('T
            (SEQ (LETT |pp| |p| . #1=(|CRFP;rootRadius;UP2R;9|))
                 (LETT |rho|
                       (|CRFP;calculateScale| (|CRFP;makeMonic| |pp| $) $)
                       . #1#)
                 (LETT |rR| |rho| . #1#)
                 (LETT |pp|
                       (|CRFP;makeMonic|
                        (|CRFP;scale| |pp|
                         (SPADCALL |rho| (|spadConstant| $ 45) (QREFELT $ 89))
                         $)
                        $)
                       . #1#)
                 (LETT |expo| 1 . #1#)
                 (LETT |d| (SPADCALL |p| (QREFELT $ 31)) . #1#)
                 (LETT |currentError|
                       (|CRFP;nthRoot| (SPADCALL 2 (QREFELT $ 11)) 2 $) . #1#)
                 (LETT |currentError|
                       (SPADCALL (* |d| 20) |currentError| (QREFELT $ 108))
                       . #1#)
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |currentError| |errorQuotient|
                                   (QREFELT $ 109)))
                        (GO G191)))
                      (SEQ (LETT |pp| (SPADCALL |pp| (QREFELT $ 107)) . #1#)
                           (LETT |rho| (|CRFP;calculateScale| |pp| $) . #1#)
                           (LETT |expo| (SPADCALL 2 |expo| (QREFELT $ 110))
                                 . #1#)
                           (LETT |errorQuotient|
                                 (SPADCALL |errorQuotient| |errorQuotient|
                                           (QREFELT $ 111))
                                 . #1#)
                           (LETT |rR|
                                 (SPADCALL (|CRFP;nthRoot| |rho| |expo| $) |rR|
                                           (QREFELT $ 111))
                                 . #1#)
                           (EXIT
                            (LETT |pp|
                                  (|CRFP;makeMonic|
                                   (|CRFP;scale| |pp|
                                    (SPADCALL |rho| (|spadConstant| $ 45)
                                              (QREFELT $ 89))
                                    $)
                                   $)
                                  . #1#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rR|))))))) 

(SDEFUN |CRFP;rootRadius;UPR;10| ((|p| UP) ($ R))
        (SPADCALL |p|
                  (SPADCALL (|spadConstant| $ 12) (QREFELT $ 15)
                            (QREFELT $ 98))
                  (QREFELT $ 82))) 

(SDEFUN |CRFP;schwerpunkt;UPC;11| ((|p| UP) ($ |Complex| R))
        (SPROG
         ((|denom| (|Union| (|Complex| R) "failed")) (|nC| #1=(|Complex| R))
          (|lC| #1#) (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 113)) (|spadConstant| $ 101))
                ((ZEROP
                  (LETT |d| (SPADCALL |p| (QREFELT $ 31))
                        . #2=(|CRFP;schwerpunkt;UPC;11|)))
                 (|error|
                  "schwerpunkt: non-zero const. polynomial has no roots and no schwerpunkt"))
                (#3='T
                 (SEQ (LETT |lC| (SPADCALL |p| |d| (QREFELT $ 40)) . #2#)
                      (LETT |nC| (SPADCALL |p| (- |d| 1) (QREFELT $ 40)) . #2#)
                      (LETT |denom|
                            (SPADCALL
                             (SPADCALL (SPADCALL |d| (QREFELT $ 114)) |lC|
                                       (QREFELT $ 103))
                             (QREFELT $ 116))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |denom| 1)
                         (|error|
                          "schwerpunkt:          degree * leadingCoefficient not invertible in ring of coefficients"))
                        (#3#
                         (SPADCALL
                          (SPADCALL |nC| (QCDR |denom|) (QREFELT $ 103))
                          (QREFELT $ 41))))))))))) 

(SDEFUN |CRFP;reciprocalPolynomial;2UP;12| ((|p| UP) ($ UP))
        (SPROG
         ((|sol| (UP)) (|lm| (|List| UP)) (#1=#:G204 NIL) (#2=#:G212 NIL)
          (|i| NIL) (#3=#:G211 NIL) (|md| (|NonNegativeInteger|))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 113)) (|spadConstant| $ 46))
                ('T
                 (SEQ
                  (LETT |d| (SPADCALL |p| (QREFELT $ 31))
                        . #4=(|CRFP;reciprocalPolynomial;2UP;12|))
                  (LETT |md| (+ |d| (SPADCALL |p| (QREFELT $ 57))) . #4#)
                  (LETT |lm|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |i| 0 . #4#) (LETT #2# |d| . #4#) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |p| |i| (QREFELT $ 40))
                                        (PROG1 (LETT #1# (- |md| |i|) . #4#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 59))
                                       #3#)
                                      . #4#)))
                              (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT
                   (LETT |sol| (SPADCALL (ELT $ 106) |lm| (QREFELT $ 118))
                         . #4#)))))))) 

(SDEFUN |CRFP;divisorCascade;2UPBL;13|
        ((|p| UP) (|tp| UP) (|info| |Boolean|)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPROG
         ((|lof| (|List| (|OutputForm|)))
          (|lfae|
           (|List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
          (|listOfFactors| (|List| UP)) (|nm| (R)) (|factor2| (UP))
          (|factor1| (UP))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (#1=#:G221 NIL) (|i| NIL))
         (SEQ (LETT |lfae| NIL . #2=(|CRFP;divisorCascade;2UPBL;13|))
              (SEQ (LETT |i| 1 . #2#)
                   (LETT #1# (SPADCALL |tp| (QREFELT $ 31)) . #2#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#)
                         (NULL
                          (SPADCALL (SPADCALL |tp| (QREFELT $ 31)) 0
                                    (QREFELT $ 94))))
                     (GO G191)))
                   (SEQ (LETT |qr| (SPADCALL |p| |tp| (QREFELT $ 68)) . #2#)
                        (LETT |factor1| |tp| . #2#)
                        (LETT |factor2| (|CRFP;makeMonic| (QCAR |qr|) $) . #2#)
                        (LETT |tp| (QCDR |qr|) . #2#)
                        (LETT |nm| (SPADCALL |tp| (QREFELT $ 99)) . #2#)
                        (LETT |listOfFactors| (CONS |factor2| NIL) . #2#)
                        (LETT |listOfFactors| (CONS |factor1| |listOfFactors|)
                              . #2#)
                        (LETT |lfae| (CONS (CONS |listOfFactors| |nm|) |lfae|)
                              . #2#)
                        (EXIT
                         (COND
                          (|info|
                           (SEQ (SPADCALL (QREFELT $ 19) (QREFELT $ 54))
                                (LETT |lof|
                                      (LIST
                                       (SPADCALL "error polynomial has degree "
                                                 (QREFELT $ 18))
                                       (SPADCALL (SPADCALL |tp| (QREFELT $ 31))
                                                 (QREFELT $ 119))
                                       (SPADCALL " and norm " (QREFELT $ 18))
                                       (SPADCALL |nm| (QREFELT $ 120)))
                                      . #2#)
                                (SPADCALL
                                 (SPADCALL (SPADCALL |lof| (QREFELT $ 52))
                                           (QREFELT $ 20))
                                 (QREFELT $ 54))
                                (LETT |lof|
                                      (LIST
                                       (SPADCALL "degrees of factors:"
                                                 (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL |factor1| (QREFELT $ 31))
                                        (QREFELT $ 119))
                                       (SPADCALL "  " (QREFELT $ 18))
                                       (SPADCALL
                                        (SPADCALL |factor2| (QREFELT $ 31))
                                        (QREFELT $ 119)))
                                      . #2#)
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |lof| (QREFELT $ 52))
                                            (QREFELT $ 20))
                                  (QREFELT $ 54))))))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (COND (|info| (SPADCALL (QREFELT $ 19) (QREFELT $ 54))))
              (EXIT (REVERSE |lfae|))))) 

(SDEFUN |CRFP;divisorCascade;2UPL;14|
        ((|p| UP) (|tp| UP)
         ($ |List| (|Record| (|:| |factors| (|List| UP)) (|:| |error| R))))
        (SPADCALL |p| |tp| NIL (QREFELT $ 77))) 

(SDEFUN |CRFP;factor;UPRF;15| ((|poly| UP) (|eps| R) ($ |Factored| UP))
        (SPADCALL |poly| |eps| NIL (QREFELT $ 122))) 

(SDEFUN |CRFP;factor;UPF;16| ((|p| UP) ($ |Factored| UP))
        (SPADCALL |p| (QREFELT $ 15) (QREFELT $ 34))) 

(SDEFUN |CRFP;factor;UPRBF;17|
        ((|poly| UP) (|eps| R) (|info| |Boolean|) ($ |Factored| UP))
        (SPROG
         ((|listOfFactors|
           (|List|
            (|Record| (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|result| (|Factored| UP)) (|expOfFactor| (|NonNegativeInteger|))
          (|newFactor| (UP)) (#1=#:G240 NIL) (|rec| NIL)
          (|lof| (|List| (|OutputForm|))) (|split| (|Factored| UP))
          (|exponentOfp| (|NonNegativeInteger|)) (|p| (UP)) (|eps0| (R))
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |result|
                (SPADCALL
                 (SPADCALL (SPADCALL |poly| (QREFELT $ 124)) 0 (QREFELT $ 59))
                 (QREFELT $ 125))
                . #2=(|CRFP;factor;UPRBF;17|))
          (LETT |d| (SPADCALL |poly| (QREFELT $ 31)) . #2#)
          (LETT |eps0|
                (SPADCALL |eps|
                          (SPADCALL (QREFELT $ 27) (QREFELT $ 27)
                                    (QREFELT $ 111))
                          (QREFELT $ 14))
                . #2#)
          (EXIT
           (COND ((EQL |d| 1) (SPADCALL |poly| 1 (QREFELT $ 60)))
                 ('T
                  (SEQ
                   (LETT |listOfFactors|
                         (SPADCALL (CONS (|CRFP;makeMonic| |poly| $) 1)
                                   (QREFELT $ 128))
                         . #2#)
                   (COND
                    (|info|
                     (SEQ
                      (LETT |lof|
                            (LIST (QREFELT $ 21) (QREFELT $ 22)
                                  (SPADCALL "list of Factors:" (QREFELT $ 18))
                                  (QREFELT $ 22)
                                  (SPADCALL |listOfFactors| (QREFELT $ 129))
                                  (QREFELT $ 21)
                                  (SPADCALL "list of Linear Factors:"
                                            (QREFELT $ 18))
                                  (QREFELT $ 22)
                                  (SPADCALL |result| (QREFELT $ 130))
                                  (QREFELT $ 22) (QREFELT $ 21))
                            . #2#)
                      (EXIT
                       (SPADCALL (SPADCALL |lof| (QREFELT $ 131))
                                 (QREFELT $ 54))))))
                   (SEQ G190
                        (COND ((NULL (NULL (NULL |listOfFactors|))) (GO G191)))
                        (SEQ
                         (LETT |p| (QCAR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |exponentOfp|
                               (QCDR (|SPADfirst| |listOfFactors|)) . #2#)
                         (LETT |listOfFactors| (CDR |listOfFactors|) . #2#)
                         (COND
                          (|info|
                           (SEQ
                            (LETT |lof|
                                  (LIST
                                   (SPADCALL
                                    "just now we try to split the polynomial:"
                                    (QREFELT $ 18))
                                   (SPADCALL |p| (QREFELT $ 132)))
                                  . #2#)
                            (EXIT
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 131))
                                       (QREFELT $ 54))))))
                         (LETT |split|
                               (SPADCALL |p| |eps0| |info| (QREFELT $ 81))
                               . #2#)
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |split| (QREFELT $ 133)) 1)
                            (SEQ
                             (LETT |lof|
                                   (LIST
                                    (SPADCALL "factor: couldn't split factor"
                                              (QREFELT $ 18))
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 132))
                                              (QREFELT $ 20))
                                    (SPADCALL "with required error bound"
                                              (QREFELT $ 18)))
                                   . #2#)
                             (SPADCALL (SPADCALL |lof| (QREFELT $ 131))
                                       (QREFELT $ 54))
                             (EXIT
                              (LETT |result|
                                    (SPADCALL |result|
                                              (SPADCALL |p| |exponentOfp|
                                                        (QREFELT $ 74))
                                              (QREFELT $ 80))
                                    . #2#))))
                           ('T
                            (SEQ (LETT |rec| NIL . #2#)
                                 (LETT #1# (SPADCALL |split| (QREFELT $ 38))
                                       . #2#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN
                                        (LETT |rec| (CAR #1#) . #2#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ (LETT |newFactor| (QVELT |rec| 1) . #2#)
                                      (LETT |expOfFactor|
                                            (* |exponentOfp| (QVELT |rec| 2))
                                            . #2#)
                                      (EXIT
                                       (COND
                                        ((EQL
                                          (SPADCALL |newFactor| (QREFELT $ 31))
                                          1)
                                         (LETT |result|
                                               (SPADCALL |result|
                                                         (SPADCALL |newFactor|
                                                                   |expOfFactor|
                                                                   (QREFELT $
                                                                            74))
                                                         (QREFELT $ 80))
                                               . #2#))
                                        ('T
                                         (LETT |listOfFactors|
                                               (CONS
                                                (CONS |newFactor|
                                                      |expOfFactor|)
                                                |listOfFactors|)
                                               . #2#)))))
                                 (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                 (EXIT NIL))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |result|)))))))) 

(SDEFUN |CRFP;absC| ((|c| |Complex| R) ($ R))
        (|CRFP;nthRoot| (SPADCALL |c| (QREFELT $ 134)) 2 $)) 

(SDEFUN |CRFP;absR| ((|r| R) ($ R))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 45) (QREFELT $ 135))
          (SPADCALL |r| (QREFELT $ 90)))
         ('T |r|))) 

(SDEFUN |CRFP;min|
        ((|fae1| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         (|fae2| |Record| (|:| |factors| (|List| UP)) (|:| |error| R))
         ($ |Record| (|:| |factors| (|List| UP)) (|:| |error| R)))
        (COND ((SPADCALL (QCDR |fae2|) (QCDR |fae1|) (QREFELT $ 135)) |fae2|)
              ('T |fae1|))) 

(SDEFUN |CRFP;calculateScale| ((|p| UP) ($ R))
        (SPROG
         ((|rho| (R)) (|maxi| (R)) (|locmax| (R)) (|ic| (R)) (|rc| (R))
          (|cof| (|Complex| R)) (|j| (|NonNegativeInteger|)) (#1=#:G255 NIL)
          (|mon| NIL) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |p| (QREFELT $ 31)) . #2=(|CRFP;calculateScale|))
          (LETT |maxi| (|spadConstant| $ 45) . #2#)
          (SEQ (LETT |mon| NIL . #2#)
               (LETT #1# (CDR (SPADCALL |p| (QREFELT $ 136))) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |mon| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |j| (- |d| (SPADCALL |mon| (QREFELT $ 31))) . #2#)
                    (LETT |cof| (SPADCALL |mon| (QREFELT $ 124)) . #2#)
                    (LETT |rc| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 137)) $)
                          . #2#)
                    (LETT |ic| (|CRFP;absR| (SPADCALL |cof| (QREFELT $ 138)) $)
                          . #2#)
                    (LETT |locmax| (SPADCALL |rc| |ic| (QREFELT $ 139)) . #2#)
                    (EXIT
                     (LETT |maxi|
                           (SPADCALL
                            (|CRFP;nthRoot|
                             (SPADCALL |locmax|
                                       (SPADCALL
                                        (SPADCALL |d| |j| (QREFELT $ 141))
                                        (QREFELT $ 11))
                                       (QREFELT $ 14))
                             |j| $)
                            |maxi| (QREFELT $ 139))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |maxi| (|spadConstant| $ 45) (QREFELT $ 142))
             (|error| "Internal Error: scale cannot be 0"))
            (#3='T
             (SEQ (LETT |rho| (QREFELT $ 23) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL |rho| |maxi| (QREFELT $ 135))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |rho| |maxi| (QREFELT $ 135)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL (QREFELT $ 27) |rho|
                                             (QREFELT $ 111))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL |rho| (QREFELT $ 27) (QREFELT $ 14)))))
                    (#3#
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |maxi| |rho| (QREFELT $ 135)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |rho|
                                   (SPADCALL |rho| (QREFELT $ 27)
                                             (QREFELT $ 14))
                                   . #2#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |rho| (|spadConstant| $ 45) (QREFELT $ 142))
                         (QREFELT $ 23))
                        (#3# |rho|)))))))))))))) 

(SDEFUN |CRFP;makeMonic| ((|p| UP) ($ UP))
        (COND ((SPADCALL |p| (|spadConstant| $ 46) (QREFELT $ 143)) |p|)
              ('T
               (SPADCALL
                (SPADCALL (|spadConstant| $ 58) (SPADCALL |p| (QREFELT $ 31))
                          (QREFELT $ 59))
                (SPADCALL (SPADCALL |p| (QREFELT $ 144))
                          (SPADCALL |p| (QREFELT $ 124)) (QREFELT $ 88))
                (QREFELT $ 106))))) 

(SDEFUN |CRFP;scale| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)))
               (SEQ
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 58) 1 (QREFELT $ 59))
                       (SPADCALL |c| 1 (QREFELT $ 59)) (QREFELT $ 146))
                      |CRFP;scale|)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 148)))))) 

(SDEFUN |CRFP;shift| ((|p| UP) (|c| |Complex| R) ($ UP))
        (SPROG ((|eq| (|Equation| UP)) (|rhs| (UP)))
               (SEQ
                (LETT |rhs|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 58) 1 (QREFELT $ 59))
                       (SPADCALL |c| 0 (QREFELT $ 59)) (QREFELT $ 106))
                      . #1=(|CRFP;shift|))
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 58) 1 (QREFELT $ 59)) |rhs|
                       (QREFELT $ 146))
                      . #1#)
                (EXIT (SPADCALL |p| |eq| (QREFELT $ 148)))))) 

(SDEFUN |CRFP;nthRoot| ((|r| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG ((|num| #1=(|Integer|)) (|den| #1#))
               (SEQ
                (COND
                 ((|HasCategory| (QREFELT $ 6) '(|RealNumberSystem|))
                  (SPADCALL |r| (SPADCALL 1 |n| (QREFELT $ 150))
                            (QREFELT $ 151)))
                 ((|HasCategory| (QREFELT $ 6)
                                 (LIST '|QuotientFieldCategory| '(|Integer|)))
                  (SEQ
                   (LETT |den|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 152))) |n|
                          (QREFELT $ 154))
                         . #2=(|CRFP;nthRoot|))
                   (LETT |num|
                         (SPADCALL
                          (* (QREFELT $ 9) (SPADCALL |r| (QREFELT $ 155))) |n|
                          (QREFELT $ 154))
                         . #2#)
                   (EXIT (SPADCALL |num| |den| (QREFELT $ 156)))))
                 ('T (|error| "unimplemented")))))) 

(DECLAIM (NOTINLINE |ComplexRootFindingPackage;|)) 

(DEFUN |ComplexRootFindingPackage| (&REST #1=#:G263)
  (SPROG NIL
         (PROG (#2=#:G264)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexRootFindingPackage|)
                                               '|domainEqualList|)
                    . #3=(|ComplexRootFindingPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexRootFindingPackage;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ComplexRootFindingPackage|)))))))))) 

(DEFUN |ComplexRootFindingPackage;| (|#1| |#2|)
  (SPROG ((|a| NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (SEQ
          (PROGN
           (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexRootFindingPackage|))
           (LETT DV$2 (|devaluate| |#2|) . #1#)
           (LETT |dv$| (LIST '|ComplexRootFindingPackage| DV$1 DV$2) . #1#)
           (LETT $ (GETREFV 157) . #1#)
           (QSETREFV $ 0 |dv$|)
           (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
           (|haddProp| |$ConstructorCache| '|ComplexRootFindingPackage|
                       (LIST DV$1 DV$2) (CONS 1 $))
           (|stuffDomainSlots| $)
           (QSETREFV $ 6 |#1|)
           (QSETREFV $ 7 |#2|)
           (SETF |pv$| (QREFELT $ 3))
           (QSETREFV $ 8 (|ModMonic| (|Complex| |#1|) |#2|))
           (QSETREFV $ 9 (EXPT 10 7))
           (QSETREFV $ 15
                     (SEQ (LETT |a| (SPADCALL 1000 (QREFELT $ 11)) . #1#)
                          (EXIT
                           (SPADCALL (|spadConstant| $ 12) |a|
                                     (QREFELT $ 14)))))
           (QSETREFV $ 19 (SPADCALL "  " (QREFELT $ 18)))
           (QSETREFV $ 21
                     (SPADCALL
                      (SPADCALL
                       "---------------------------------------------------"
                       (QREFELT $ 18))
                      (QREFELT $ 20)))
           (QSETREFV $ 22
                     (SPADCALL
                      (SPADCALL
                       "..................................................."
                       (QREFELT $ 18))
                      (QREFELT $ 20)))
           (QSETREFV $ 23 (|spadConstant| $ 12))
           (QSETREFV $ 26 (SPADCALL 2 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 27 (SPADCALL 10 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 28 (SPADCALL 11 (QREFELT $ 23) (QREFELT $ 25)))
           (QSETREFV $ 29
                     (SPADCALL (QREFELT $ 28) (QREFELT $ 27) (QREFELT $ 14)))
           $)))) 

(MAKEPROP '|ComplexRootFindingPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              '|globalDigits| (|Integer|) (0 . |coerce|) (5 . |One|)
              (9 . |One|) (13 . /) '|globalEps| (|String|) (|OutputForm|)
              (19 . |message|) '|emptyLine| (24 . |center|) '|dashes| '|dots|
              '|one| (|PositiveInteger|) (29 . *) '|two| '|ten| '|eleven|
              '|weakEps| (|NonNegativeInteger|) (35 . |degree|) (40 . ^)
              (|Factored| 7) |CRFP;factor;UPRF;15|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 35) (|:| |factor| 7) (|:| |exponent| 30))
              (|List| 36) (46 . |factorList|) (|Complex| 6)
              (51 . |coefficient|) (57 . -) (|List| 39)
              |CRFP;complexZeros;UPRL;1| |CRFP;complexZeros;UPL;2|
              (62 . |Zero|) (66 . |Zero|) (|Boolean|) (70 . <=)
              (76 . |ceiling|) (81 . |coerce|) (|List| $) (86 . |hconcat|)
              (|Void|) (91 . |print|) (96 . |messagePrint|)
              |CRFP;setErrorBound;2R;3| (101 . |minimumDegree|) (106 . |One|)
              (110 . |monomial|) (116 . |irreducibleFactor|) (122 . |quo|)
              (|Record| (|:| |start| 7) (|:| |factors| 33))
              |CRFP;startPolynomial;UPR;5| (128 . |One|) (132 . =)
              (138 . |expand|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (143 . |divide|) (149 . |setPoly|) (154 . |coerce|) (159 . ^)
              (165 . *) (171 . |lift|) (176 . |nilFactor|)
              (|Record| (|:| |factors| 91) (|:| |error| 6)) (|List| 75)
              |CRFP;divisorCascade;2UPBL;13| (|Mapping| 75 75 75)
              (182 . |reduce|) (188 . *) |CRFP;pleskenSplit;UPRBF;4|
              |CRFP;rootRadius;UP2R;9| |CRFP;reciprocalPolynomial;2UP;12|
              (194 . >) |CRFP;schwerpunkt;UPC;11| (200 . -) (206 . |coerce|)
              (211 . /) (217 . |complex|) (223 . -) (|List| 7)
              (228 . |maxIndex|) (233 . |elt|) (239 . >) (245 . |elt|)
              (251 . -) (257 . |coefficients|) (262 . +) |CRFP;norm;UPR;6|
              |CRFP;pleskenSplit;UPRF;7| (268 . |Zero|) (272 . *) (278 . *)
              (284 . +) (290 . *) (296 . +) |CRFP;graeffe;2UP;8| (302 . *)
              (308 . >=) (314 . *) (320 . *) |CRFP;rootRadius;UPR;10|
              (326 . |zero?|) (331 . |coerce|) (|Union| $ '"failed")
              (336 . |recip|) (|Mapping| 7 7 7) (341 . |reduce|)
              (347 . |coerce|) (352 . |coerce|) |CRFP;divisorCascade;2UPL;14|
              |CRFP;factor;UPRBF;17| |CRFP;factor;UPF;16|
              (357 . |leadingCoefficient|) (362 . |coerce|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 30)) (|List| 126)
              (367 . |list|) (372 . |coerce|) (377 . |coerce|)
              (382 . |vconcat|) (387 . |coerce|) (392 . |numberOfFactors|)
              (397 . |norm|) (402 . <) (408 . |monomials|) (413 . |real|)
              (418 . |imag|) (423 . |max|) (|IntegerCombinatoricFunctions| 10)
              (429 . |binomial|) (435 . =) (441 . =) (447 . |reductum|)
              (|Equation| 7) (452 . |equation|) (|Equation| $) (458 . |eval|)
              (|Fraction| 10) (464 . /) (470 . ^) (476 . |denom|)
              (|IntegerRoots| 10) (481 . |approxNthRoot|) (487 . |numer|)
              (492 . /))
           '#(|startPolynomial| 498 |setErrorBound| 503 |schwerpunkt| 508
              |rootRadius| 513 |reciprocalPolynomial| 524 |pleskenSplit| 529
              |norm| 542 |graeffe| 547 |factor| 552 |divisorCascade| 570
              |complexZeros| 583)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 156
                                                 '(1 6 0 10 11 0 6 0 12 0 7 0
                                                   13 2 6 0 0 0 14 1 17 0 16 18
                                                   1 17 0 0 20 2 6 0 24 0 25 1
                                                   7 30 0 31 2 6 0 0 30 32 1 33
                                                   37 0 38 2 7 39 0 30 40 1 39
                                                   0 0 41 0 6 0 45 0 7 0 46 2 6
                                                   47 0 0 48 1 6 10 0 49 1 10
                                                   17 0 50 1 17 0 51 52 1 17 53
                                                   0 54 1 17 53 16 55 1 7 30 0
                                                   57 0 39 0 58 2 7 0 39 30 59
                                                   2 33 0 7 30 60 2 7 0 0 0 61
                                                   0 33 0 64 2 33 47 0 0 65 1
                                                   33 7 0 66 2 7 67 0 0 68 1 8
                                                   7 7 69 1 8 0 7 70 2 8 0 0 30
                                                   71 2 8 0 0 0 72 1 8 7 0 73 2
                                                   33 0 7 30 74 2 76 75 78 0 79
                                                   2 33 0 0 0 80 2 6 47 0 0 84
                                                   2 7 0 0 0 86 1 39 0 6 87 2 7
                                                   0 0 39 88 2 39 0 6 6 89 1 6
                                                   0 0 90 1 91 10 0 92 2 91 7 0
                                                   10 93 2 30 47 0 0 94 2 42 39
                                                   0 10 95 2 39 0 0 0 96 1 7 42
                                                   0 97 2 6 0 0 0 98 0 39 0 101
                                                   2 39 0 10 0 102 2 39 0 0 0
                                                   103 2 39 0 0 0 104 2 39 0 24
                                                   0 105 2 7 0 0 0 106 2 6 0 10
                                                   0 108 2 6 47 0 0 109 2 30 0
                                                   24 0 110 2 6 0 0 0 111 1 7
                                                   47 0 113 1 39 0 10 114 1 39
                                                   115 0 116 2 91 7 117 0 118 1
                                                   30 17 0 119 1 6 17 0 120 1 7
                                                   39 0 124 1 33 0 7 125 1 127
                                                   0 126 128 1 127 17 0 129 1
                                                   33 17 0 130 1 17 0 51 131 1
                                                   7 17 0 132 1 33 30 0 133 1
                                                   39 6 0 134 2 6 47 0 0 135 1
                                                   7 51 0 136 1 39 6 0 137 1 39
                                                   6 0 138 2 6 0 0 0 139 2 140
                                                   10 10 10 141 2 6 47 0 0 142
                                                   2 7 47 0 0 143 1 7 0 0 144 2
                                                   145 0 7 7 146 2 7 0 0 147
                                                   148 2 149 0 10 10 150 2 6 0
                                                   0 149 151 1 6 10 0 152 2 153
                                                   10 10 30 154 1 6 10 0 155 2
                                                   6 0 10 10 156 1 0 62 7 63 1
                                                   0 6 6 56 1 0 39 7 85 1 0 6 7
                                                   112 2 0 6 7 6 82 1 0 7 7 83
                                                   3 0 33 7 6 47 81 2 0 33 7 6
                                                   100 1 0 6 7 99 1 0 7 7 107 2
                                                   0 33 7 6 34 3 0 33 7 6 47
                                                   122 1 0 33 7 123 2 0 76 7 7
                                                   121 3 0 76 7 7 47 77 2 0 42
                                                   7 6 43 1 0 42 7 44)))))
           '|lookupComplete|)) 
