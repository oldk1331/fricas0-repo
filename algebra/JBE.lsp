
(SDEFUN |JBE;coerce;JB$;1| ((|jv| JB) ($ $)) (SPADCALL |jv| (QREFELT $ 8))) 

(PUT '|JBE;coerce;E$;2| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(SDEFUN |JBE;coerce;E$;2| ((|exp| |Expression| (|Integer|)) ($ $)) |exp|) 

(PUT '|JBE;coerce;$E;3| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |JBE;coerce;$E;3| ((|f| $) ($ |Expression| (|Integer|))) |f|) 

(SDEFUN |JBE;coerce;Smp$;4|
        ((|p| |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)) ($ $))
        (SPADCALL |p| (|spadConstant| $ 13) (QREFELT $ 15))) 

(SDEFUN |JBE;numerJP;$Smp;5|
        ((|f| $)
         ($ |SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
        (SPROG
         ((|res|
           (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
          (|Exp| (|List| (|NonNegativeInteger|))) (JV (|List| JB))
          (|newco| (|Expression| (|Integer|))) (|jv| (|Union| JB "failed"))
          (|vs| ($)) (#1=#:G148 NIL) (|v| NIL) (#2=#:G146 NIL) (|mon| NIL)
          (#3=#:G147 NIL) (|co| NIL) (CO (|List| (|Integer|)))
          (PM
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
         (SEQ (LETT |res| (|spadConstant| $ 18) . #4=(|JBE;numerJP;$Smp;5|))
              (LETT |p| (SPADCALL |f| (QREFELT $ 19)) . #4#)
              (LETT PM (SPADCALL |p| (QREFELT $ 21)) . #4#)
              (LETT CO (SPADCALL |p| (QREFELT $ 23)) . #4#)
              (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#)
                   (LETT |mon| NIL . #4#) (LETT #2# PM . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT JV NIL . #4#) (LETT |Exp| NIL . #4#)
                        (LETT |newco| (SPADCALL |co| (QREFELT $ 25)) . #4#)
                        (SEQ (LETT |v| NIL . #4#)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 27)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |vs| (SPADCALL |v| (QREFELT $ 29)) . #4#)
                              (LETT |jv| (SPADCALL |vs| (QREFELT $ 31)) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |jv| 1)
                                 (LETT |newco|
                                       (SPADCALL |newco|
                                                 (SPADCALL |vs| (QREFELT $ 11))
                                                 (QREFELT $ 32))
                                       . #4#))
                                ('T
                                 (SEQ (LETT JV (CONS (QCDR |jv|) JV) . #4#)
                                      (EXIT
                                       (LETT |Exp|
                                             (CONS
                                              (SPADCALL |mon| |v|
                                                        (QREFELT $ 35))
                                              |Exp|)
                                             . #4#)))))))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |newco|
                                                   (SPADCALL
                                                    (|spadConstant| $ 38)
                                                    (NREVERSE JV)
                                                    (NREVERSE |Exp|)
                                                    (QREFELT $ 41))
                                                   (QREFELT $ 42))
                                         (QREFELT $ 43))
                               . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;coerce;Smp$;6|
        ((|p| |SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB)
         ($ $))
        (SPROG
         ((|res| ($)) (|prod| ($)) (#1=#:G156 NIL) (|v| NIL) (#2=#:G154 NIL)
          (|mon| NIL) (#3=#:G155 NIL) (|co| NIL)
          (CO (|List| (|Expression| (|Integer|))))
          (PM
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))))
         (SEQ (LETT |res| (|spadConstant| $ 45) . #4=(|JBE;coerce;Smp$;6|))
              (LETT PM (SPADCALL |p| (QREFELT $ 46)) . #4#)
              (LETT CO (SPADCALL |p| (QREFELT $ 48)) . #4#)
              (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#)
                   (LETT |mon| NIL . #4#) (LETT #2# PM . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |prod| |co| . #4#)
                        (SEQ (LETT |v| NIL . #4#)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 49)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |prod|
                                     (SPADCALL |prod|
                                               (SPADCALL
                                                (SPADCALL |v| (QREFELT $ 9))
                                                (SPADCALL |p| |v|
                                                          (QREFELT $ 50))
                                                (QREFELT $ 51))
                                               (QREFELT $ 52))
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 53))
                               . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;gcd;3$;7| ((|f1| $) (|f2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |f1| (QREFELT $ 19))
                   (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 55))
         (QREFELT $ 16))) 

(SDEFUN |JBE;exquo;2$U;8| ((|f1| $) (|f2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|p|
           (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))
                    "failed")))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL |f1| (QREFELT $ 19))
                          (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 58))
                |JBE;exquo;2$U;8|)
          (EXIT
           (COND ((QEQCAR |p| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 16))))))))) 

(SDEFUN |JBE;recip;$U;9| ((|f| $) ($ |Union| $ "failed"))
        (CONS 0 (SPADCALL (|spadConstant| $ 36) |f| (QREFELT $ 60)))) 

(SDEFUN |JBE;purge|
        ((|l| |List| (|Kernel| $)) (|q| |NonNegativeInteger|)
         ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G173 NIL) (|k| NIL) (#2=#:G172 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|JBE;purge|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 29))
                                     (QREFELT $ 62))
                           |q|)
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |JBE;dimrec|
        ((|lmv| |List| (|List| (|Kernel| $))) (|indVars| |List| (|Kernel| $))
         (|remVars| . #1=(|List| (|Kernel| $)))
         (|sets| . #2=(|List| (|List| (|Kernel| $))))
         ($ |List| (|List| (|Kernel| $))))
        (SPROG
         ((|res| #2#) (|elem| (|Boolean|)) (#3=#:G190 NIL) (|ik| NIL)
          (#4=#:G189 NIL) (#5=#:G187 NIL) (|m| NIL) (#6=#:G188 NIL)
          (#7=#:G185 NIL) (|lv| NIL) (#8=#:G186 NIL)
          (|indK| (|List| (|Kernel| $))) (|newVars| #1#) (|jk| (|Kernel| $)))
         (SEQ (LETT |res| |sets| . #9=(|JBE;dimrec|))
              (LETT |newVars| |remVars| . #9#)
              (SEQ G190 (COND ((NULL (NULL (NULL |newVars|))) (GO G191)))
                   (SEQ (LETT |jk| (SPADCALL |newVars| (QREFELT $ 63)) . #9#)
                        (LETT |newVars| (CDR |newVars|) . #9#)
                        (LETT |elem| NIL . #9#)
                        (LETT |indK| (SPADCALL |indVars| |jk| (QREFELT $ 64))
                              . #9#)
                        (SEQ (LETT #8# NIL . #9#) (LETT |lv| NIL . #9#)
                             (LETT #7# |lmv| . #9#) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |lv| (CAR #7#) . #9#) NIL) #8#)
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |elem|
                                     (SPADCALL |lv| |indK| (QREFELT $ 66))
                                     . #9#)))
                             (LETT #7#
                                   (PROG1 (CDR #7#) (LETT #8# |elem| . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |elem|)
                           (LETT |res|
                                 (|JBE;dimrec| |lmv| |indK| |newVars| |res| $)
                                 . #9#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |elem| NIL . #9#)
              (SEQ (LETT #6# NIL . #9#) (LETT |m| NIL . #9#)
                   (LETT #5# |res| . #9#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |m| (CAR #5#) . #9#) NIL) #6#)
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |elem|
                           (SPADCALL (ELT $ 68)
                                     (PROGN
                                      (LETT #4# NIL . #9#)
                                      (SEQ (LETT |ik| NIL . #9#)
                                           (LETT #3# |indVars| . #9#) G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |ik| (CAR #3#) . #9#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL |ik| |m|
                                                              (QREFELT $ 67))
                                                    #4#)
                                                   . #9#)))
                                           (LETT #3# (CDR #3#) . #9#) (GO G190)
                                           G191 (EXIT (NREVERSE #4#))))
                                     'T (QREFELT $ 71))
                           . #9#)))
                   (LETT #5# (PROG1 (CDR #5#) (LETT #6# |elem| . #9#)) . #9#)
                   (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |elem|)
                (LETT |res| (SPADCALL |indVars| |res| (QREFELT $ 73)) . #9#)))
              (EXIT |res|)))) 

(SDEFUN |JBE;dimension;LSem2Nni;12|
        ((|sys| |List| . #1=($)) (|jm| |SparseEchelonMatrix| JB . #1#)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#2=#:G201 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#3=#:G194 NIL)
          (|allvars| (|List| (|Kernel| $))) (#4=#:G200 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#5=#:G199 NIL) (|p| NIL)
          (#6=#:G198 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #7=(|JBE;dimension;LSem2Nni;12|))
          (LETT |lmv|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |p| NIL . #7#) (LETT #5# |polys| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                          (QREFELT $ 27))
                                (QREFELT $ 80))
                               #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #7#)
          (SEQ (LETT |lv| NIL . #7#) (LETT #4# (CDR |lmv|) . #7#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |lv| (CAR #4#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |allvars|
                       (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                 (QREFELT $ 83))
                       . #7#)))
               (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |dim0|
                (PROG1
                    (LETT #3#
                          (- (SPADCALL |q| (QREFELT $ 84)) (LENGTH |allvars|))
                          . #7#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #7#)
          (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #7#)
          (LETT |dim| 0 . #7#)
          (SEQ (LETT |ind| NIL . #7#) (LETT #2# |indSets| . #7#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ind| (CAR #2#) . #7#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #7#)))
               (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;orderDim;LSem2Nni;13|
        ((|sys| |List| . #1=($)) (|jm| |SparseEchelonMatrix| JB . #1#)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#2=#:G212 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#3=#:G205 NIL)
          (|allvars| (|List| (|Kernel| $))) (#4=#:G211 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#5=#:G210 NIL) (|p| NIL)
          (#6=#:G209 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #7=(|JBE;orderDim;LSem2Nni;13|))
          (LETT |lmv|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |p| NIL . #7#) (LETT #5# |polys| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS
                               (SPADCALL
                                (|JBE;purge|
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                           (QREFELT $ 27))
                                 |q| $)
                                (QREFELT $ 80))
                               #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #7#)
          (SEQ (LETT |lv| NIL . #7#) (LETT #4# (CDR |lmv|) . #7#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |lv| (CAR #4#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |allvars|
                       (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                 (QREFELT $ 83))
                       . #7#)))
               (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
          (LETT |dim0|
                (PROG1
                    (LETT #3#
                          (- (SPADCALL |q| (QREFELT $ 87)) (LENGTH |allvars|))
                          . #7#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #7#)
          (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #7#)
          (LETT |dim| 0 . #7#)
          (SEQ (LETT |ind| NIL . #7#) (LETT #2# |indSets| . #7#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ind| (CAR #2#) . #7#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #7#)))
               (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;simpSMP|
        ((|p| |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))
         ($ |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|md| (|NonNegativeInteger|))
          (|lc| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
          (|v| (|Kernel| $)) (|tv| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 89)) (|spadConstant| $ 13))
                (#1='T
                 (SEQ
                  (LETT |tv| (SPADCALL |p| (QREFELT $ 91))
                        . #2=(|JBE;simpSMP|))
                  (EXIT
                   (COND ((QEQCAR |tv| 1) (|error| "inconsistent system"))
                         (#1#
                          (SEQ (LETT |v| (QCDR |tv|) . #2#)
                               (LETT |up| (SPADCALL |p| |v| (QREFELT $ 93))
                                     . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 95))
                                  (SEQ
                                   (LETT |lc| (SPADCALL |up| (QREFELT $ 96))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR (SPADCALL |lc| (QREFELT $ 91)) 1)
                                      (SPADCALL (|spadConstant| $ 13) |v| 1
                                                (QREFELT $ 97)))
                                     (#1#
                                      (SPADCALL (|JBE;simpSMP| |lc| $) |v| 1
                                                (QREFELT $ 97)))))))
                                 (#1#
                                  (SEQ
                                   (LETT |md| (SPADCALL |up| (QREFELT $ 98))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |md| 0 (QREFELT $ 100))
                                      (SEQ
                                       (LETT |up|
                                             (QCAR
                                              (SPADCALL |up|
                                                        (SPADCALL
                                                         (|spadConstant| $ 13)
                                                         |md| (QREFELT $ 101))
                                                        (QREFELT $ 103)))
                                             . #2#)
                                       (EXIT
                                        (SPADCALL |up| |v| (QREFELT $ 104)))))
                                     (#1# |p|))))))))))))))))) 

(SDEFUN |JBE;simpOne;2$;15| ((|f| $) ($ $))
        (COND ((SPADCALL |f| (QREFELT $ 105)) (|spadConstant| $ 45))
              ('T
               (SPADCALL (|JBE;simpSMP| (SPADCALL |f| (QREFELT $ 19)) $)
                         (QREFELT $ 16))))) 

(SDEFUN |JBE;greaterLD|
        ((|r1| |Record| (|:| |Fun| $)
          (|:| JMR
               (|Record| (|:| |Indices| (|List| JB))
                         (|:| |Entries| (|List| $))))
          (|:| |Depend| (|List| (|NonNegativeInteger|))))
         (|r2| |Record| (|:| |Fun| $)
          (|:| JMR
               (|Record| (|:| |Indices| #1=(|List| JB))
                         (|:| |Entries| (|List| $))))
          (|:| |Depend| (|List| (|NonNegativeInteger|))))
         ($ |Boolean|))
        (SPROG ((|ind2| #1#) (|ind1| #1#))
               (SEQ
                (COND ((NULL (QCAR (QVELT |r1| 1))) NIL)
                      ((NULL (QCAR (QVELT |r2| 1))) 'T)
                      (#2='T
                       (SEQ
                        (LETT |ind1| (QCAR (QVELT |r1| 1))
                              . #3=(|JBE;greaterLD|))
                        (LETT |ind2| (QCAR (QVELT |r2| 1)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                                     (QREFELT $ 107))
                           (< (LENGTH |ind1|) (LENGTH |ind2|)))
                          (#2#
                           (SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                                     (QREFELT $ 108))))))))))) 

(SDEFUN |JBE;groebner| ((|sys| |List| $) ($ |List| $))
        (SPROG
         ((|gbase|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #1=(|JBE;groebner|))
          (SPADCALL
           (SPADCALL (SPADCALL "polys" (QREFELT $ 111))
                     (SPADCALL |polys| (QREFELT $ 112)) (QREFELT $ 113))
           (QREFELT $ 115))
          (LETT |gbase| (SPADCALL |polys| (QREFELT $ 117)) . #1#)
          (EXIT (SPADCALL (ELT $ 16) |gbase| (QREFELT $ 120)))))) 

(SDEFUN |JBE;groebnerSimp|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((#1=#:G254 NIL) (|fun| NIL) (|i| NIL) (#2=#:G253 NIL)
          (|resJM| (|SparseEchelonMatrix| JB $)) (#3=#:G252 NIL) (|eq| NIL)
          (#4=#:G251 NIL) (|resSys| (|List| $)) (#5=#:G250 NIL) (|rec| NIL)
          (#6=#:G249 NIL) (|resDep| (|List| (|NonNegativeInteger|)))
          (|tmp| (|List| (|List| (|NonNegativeInteger|)))) (#7=#:G248 NIL)
          (#8=#:G247 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL (SPADCALL "groebnerSimp: #" (QREFELT $ 111))
                     (SPADCALL (LENGTH |sysL|) (QREFELT $ 121))
                     (QREFELT $ 113))
           (QREFELT $ 115))
          (LETT |tmp|
                (PROGN
                 (LETT #8# NIL . #9=(|JBE;groebnerSimp|))
                 (SEQ (LETT |rec| NIL . #9#) (LETT #7# |sysL| . #9#) G190
                      (COND
                       ((OR (ATOM #7#)
                            (PROGN (LETT |rec| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (QVELT |rec| 2) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |resDep| (SPADCALL (ELT $ 122) |tmp| NIL (QREFELT $ 125))
                . #9#)
          (LETT |resSys|
                (|JBE;groebner|
                 (PROGN
                  (LETT #6# NIL . #9#)
                  (SEQ (LETT |rec| NIL . #9#) (LETT #5# |sysL| . #9#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |rec| (CAR #5#) . #9#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #6# (CONS (QVELT |rec| 0) #6#) . #9#)))
                       (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 $)
                . #9#)
          (LETT |resJM|
                (SPADCALL |resSys|
                          (PROGN
                           (LETT #4# NIL . #9#)
                           (SEQ (LETT |eq| NIL . #9#) (LETT #3# |resSys| . #9#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #4# (CONS |ind| #4#) . #9#)))
                                (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 127))
                . #9#)
          (SPADCALL (SPADCALL "END groebnerSimp" (QREFELT $ 111))
                    (QREFELT $ 115))
          (EXIT
           (PROGN
            (LETT #2# NIL . #9#)
            (SEQ (LETT |i| 1 . #9#) (LETT |fun| NIL . #9#)
                 (LETT #1# |resSys| . #9#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |fun| (CAR #1#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT $ 130))
                                  |resDep|)
                          #2#)
                         . #9#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #9#))
                       . #9#)
                 (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |JBE;linearSimp|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|newDep| (|List| (|NonNegativeInteger|)))
          (|newJMR|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (|newFun| ($)) (#1=#:G276 NIL)
          (|rec|
           #2=(|Record| (|:| |Fun| $)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| $))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|sdep| (|List| (|NonNegativeInteger|))) (|ssub| ($)) (#3=#:G259 NIL)
          (|rsysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB)) (|srec| #2#) (|solved?| (|Boolean|))
          (|s| (|Union| $ #4="failed")) (|ld| (JB)))
         (SEQ (LETT |solved?| NIL . #5=(|JBE;linearSimp|))
              (LETT |rsysL| NIL . #5#)
              (SEQ G190
                   (COND
                    ((NULL (COND (|solved?| NIL) ('T (NULL (NULL |sysL|)))))
                     (GO G191)))
                   (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT $ 133)) . #5#)
                        (LETT |sysL| (CDR |sysL|) . #5#)
                        (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))) . #5#)
                        (LETT |s|
                              (SPADCALL (QVELT |rec| 0) |ld| (QREFELT $ 134))
                              . #5#)
                        (LETT |solved?| (QEQCAR |s| 0) . #5#)
                        (EXIT
                         (COND
                          (|solved?|
                           (SEQ (LETT |srec| |rec| . #5#)
                                (EXIT (LETT |sld| |ld| . #5#))))
                          ('T
                           (LETT |rsysL|
                                 (SPADCALL |rec| |rsysL| (QREFELT $ 135))
                                 . #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |rsysL|
                    (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT $ 136)) . #5#)
              (EXIT
               (COND
                (|solved?|
                 (SEQ
                  (LETT |ssub|
                        (PROG2 (LETT #3# |s| . #5#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) $ (|Union| $ #4#)
                                          #3#))
                        . #5#)
                  (LETT |res| (LIST |srec|) . #5#)
                  (LETT |sdep| (QVELT |srec| 2) . #5#)
                  (SEQ (LETT |rec| NIL . #5#) (LETT #1# |rsysL| . #5#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |rec| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newFun|
                              (SPADCALL
                               (SPADCALL (QVELT |rec| 0) |sld| |ssub|
                                         (QREFELT $ 137))
                               (QREFELT $ 106))
                              . #5#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |newFun| (QREFELT $ 105)))
                           (SEQ
                            (LETT |newJMR|
                                  (SPADCALL
                                   (SPADCALL (LIST |newFun|) (LIST |ind|)
                                             (QREFELT $ 127))
                                   1 (QREFELT $ 130))
                                  . #5#)
                            (LETT |newDep|
                                  (SPADCALL
                                   (SPADCALL (QVELT |rec| 2) |sdep|
                                             (QREFELT $ 138))
                                   (QREFELT $ 139))
                                  . #5#)
                            (EXIT
                             (LETT |res|
                                   (SPADCALL
                                    (VECTOR |newFun| |newJMR| |newDep|) |res|
                                    (QREFELT $ 135))
                                   . #5#)))))))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))
                ('T (|JBE;groebnerSimp| |rsysL| |ind| $))))))) 

(SDEFUN |JBE;simpRec|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|newSysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB))
          (|srec|
           #1=(|Record| (|:| |Fun| $)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| $))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|eqLD| (|List| #1#))
          (|resLD|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|fld| (JB)) (|frec| #1#))
         (SEQ
          (COND ((< (LENGTH |sysL|) 2) |sysL|)
                (#2='T
                 (SEQ
                  (LETT |frec| (SPADCALL |sysL| (QREFELT $ 133))
                        . #3=(|JBE;simpRec|))
                  (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))) . #3#)
                  (LETT |sysL| (CDR |sysL|) . #3#)
                  (LETT |srec| (SPADCALL |sysL| (QREFELT $ 133)) . #3#)
                  (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |fld| |sld| (QREFELT $ 108))
                     (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| $)
                               (QREFELT $ 135)))
                    (#2#
                     (SEQ (LETT |eqLD| (LIST |frec|) . #3#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |sysL|) NIL)
                                        ('T
                                         (SPADCALL |sld| |fld|
                                                   (QREFELT $ 107)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |eqLD|
                                      (SPADCALL |srec| |eqLD| (QREFELT $ 135))
                                      . #3#)
                                (LETT |sysL| (CDR |sysL|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |sysL|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |sysL| (QREFELT $ 133))
                                          . #3#)
                                    (EXIT
                                     (LETT |sld|
                                           (|SPADfirst|
                                            (QCAR (QVELT |srec| 1)))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |eqLD|
                                (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                          (|JBE;linearSimp| (NREVERSE |eqLD|)
                                           |ind| $)
                                          (QREFELT $ 141))
                                . #3#)
                          (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 133)) . #3#)
                          (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1)))
                                . #3#)
                          (LETT |resLD| NIL . #3#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |eqLD|) NIL)
                                        ('T
                                         (SPADCALL |sld| |fld|
                                                   (QREFELT $ 107)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |resLD|
                                      (SPADCALL |srec| |resLD| (QREFELT $ 135))
                                      . #3#)
                                (LETT |eqLD| (CDR |eqLD|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |eqLD|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |eqLD| (QREFELT $ 133))
                                          . #3#)
                                    (EXIT
                                     (LETT |sld|
                                           (|SPADfirst|
                                            (QCAR (QVELT |srec| 1)))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |newSysL|
                                (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                          |eqLD| |sysL| (QREFELT $ 142))
                                . #3#)
                          (EXIT
                           (SPADCALL (NREVERSE |resLD|)
                                     (|JBE;simpRec| |newSysL| |ind| $)
                                     (QREFELT $ 136))))))))))))) 

(SDEFUN |JBE;simplify;LSemR;21|
        ((|sys| |List| . #1=($)) (|jm| |SparseEchelonMatrix| JB . #1#)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|resSys| (|List| $)) (#2=#:G332 NIL) (|rec| NIL) (|i| NIL)
          (|resJM| (|SparseEchelonMatrix| JB $))
          (|sysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (|neq| ($)) (#3=#:G331 NIL) (|eq| NIL) (|inds| (|List| JB)))
         (SEQ
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 143))
                . #4=(|JBE;simplify;LSemR;21|))
          (LETT |sysL| NIL . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT |eq| NIL . #4#) (LETT #3# |sys| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |eq| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |eq| (QREFELT $ 105)))
                   (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 106)) . #4#)
                        (COND
                         ((SPADCALL |neq| |eq| (QREFELT $ 144))
                          (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 130)) . #4#))
                         ('T
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (LIST |neq|)
                                           (LIST
                                            (QCAR
                                             (SPADCALL |jm| |i|
                                                       (QREFELT $ 130))))
                                           (QREFELT $ 127))
                                 1 (QREFELT $ 130))
                                . #4#)))
                        (COND
                         ((OR (NULL (QCAR |r|))
                              (EQUAL
                               (SPADCALL (|SPADfirst| (QCAR |r|))
                                         (QREFELT $ 146))
                               '|Indep|))
                          (EXIT (|error| "inconsistent system"))))
                        (EXIT
                         (LETT |sysL|
                               (SPADCALL (VECTOR |neq| |r| (LIST |i|)) |sysL|
                                         (QREFELT $ 135))
                               . #4#)))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |sysL|)
             (VECTOR (SPADCALL (QREFELT $ 147))
                     (SPADCALL NIL 0 (QREFELT $ 148)) (CONS 1 NIL)))
            ('T
             (SEQ
              (LETT |sysL|
                    (|JBE;simpRec|
                     (SPADCALL (CONS (|function| |JBE;greaterLD|) $) |sysL|
                               (QREFELT $ 141))
                     |inds| $)
                    . #4#)
              (LETT |resSys| (SPADCALL (QREFELT $ 147)) . #4#)
              (LETT |resJM| (SPADCALL |inds| (LENGTH |sysL|) (QREFELT $ 148))
                    . #4#)
              (LETT |resDep| NIL . #4#)
              (SEQ (LETT |i| 1 . #4#) (LETT |rec| NIL . #4#)
                   (LETT #2# |sysL| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (NULL (QCAR (QVELT |rec| 1)))
                           (SPADCALL (|SPADfirst| (QCAR (QVELT |rec| 1)))
                                     (SPADCALL 1 (QREFELT $ 150))
                                     (QREFELT $ 151)))
                       (|error| "inconsistent system"))
                      ('T
                       (SEQ
                        (LETT |resSys|
                              (SPADCALL (QVELT |rec| 0) |resSys|
                                        (QREFELT $ 152))
                              . #4#)
                        (SPADCALL |resJM| |i| (QVELT |rec| 1) (QREFELT $ 153))
                        (EXIT
                         (LETT |resDep| (CONS (QVELT |rec| 2) |resDep|)
                               . #4#)))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (SPADCALL |resSys| (QREFELT $ 154)) |resJM|
                       (CONS 1 (NREVERSE |resDep|))))))))))) 

(SDEFUN |JBE;jetVariables;$L;22| ((|Phi| $) ($ |List| JB))
        (SPROG
         ((JV (|List| JB)) (#1=#:G347 NIL)
          (|pmindex| (|List| (|NonNegativeInteger|))) (#2=#:G344 NIL)
          (#3=#:G362 NIL) (|i| NIL) (#4=#:G361 NIL)
          (|mindex| (|List| (|Integer|))) (#5=#:G360 NIL) (#6=#:G359 NIL)
          (|pupindex| #7=(|Integer|)) (#8=#:G341 NIL) (|uindex| #7#)
          (#9=#:G338 NIL) (|xindex| #7#) (|arg| (|List| $)) (|typ| (|Symbol|))
          (#10=#:G335 NIL) (#11=#:G357 NIL) (|Ke| NIL) (#12=#:G358 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#13=#:G356 NIL)
          (#14=#:G355 NIL) (|LKernels| (|List| (|Kernel| $))))
         (SEQ (LETT JV NIL . #15=(|JBE;jetVariables;$L;22|))
              (LETT |LKernels| (SPADCALL |Phi| (QREFELT $ 159)) . #15#)
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL . #15#)
                     (SEQ (LETT |Ke| NIL . #15#) (LETT #13# |LKernels| . #15#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |Ke| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 161)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (SEQ (LETT |Op| NIL . #15#) (LETT #12# |LOps| . #15#)
                   (LETT |Ke| NIL . #15#) (LETT #11# |LKernels| . #15#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#) . #15#) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#) . #15#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 162))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 164))
                                        . #15#)
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#))
                              . #15#)
                        (LETT |arg| (SPADCALL |Ke| (QREFELT $ 165)) . #15#)
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Indep|)
                           (SEQ
                            (LETT |xindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 166))
                                            (QREFELT $ 167))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #9# |xindex| . #15#)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 168))
                                    JV)
                                   . #15#))))
                          ((EQUAL |typ| '|Dep|)
                           (SEQ
                            (LETT |uindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 166))
                                            (QREFELT $ 167))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #8# |uindex| . #15#)
                                       (|check_subtype2| (> #8# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #8#))
                                     (QREFELT $ 150))
                                    JV)
                                   . #15#))))
                          ('T
                           (SEQ
                            (LETT |pupindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 166))
                                            (QREFELT $ 167))
                                  . #15#)
                            (LETT |mindex|
                                  (PROGN
                                   (LETT #6# NIL . #15#)
                                   (SEQ (LETT |i| NIL . #15#)
                                        (LETT #5#
                                              (SPADCALL
                                               (SPADCALL |arg| (QREFELT $ 169))
                                               (QREFELT $ 169))
                                              . #15#)
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |i| (CAR #5#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |i| (QREFELT $ 167))
                                                 #6#)
                                                . #15#)))
                                        (LETT #5# (CDR #5#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))
                                  . #15#)
                            (LETT |pmindex|
                                  (PROGN
                                   (LETT #4# NIL . #15#)
                                   (SEQ (LETT |i| NIL . #15#)
                                        (LETT #3# |mindex| . #15#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |i| (CAR #3#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (PROG1 (LETT #2# |i| . #15#)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 #4#)
                                                . #15#)))
                                        (LETT #3# (CDR #3#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #4#))))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #1# |pupindex| . #15#)
                                       (|check_subtype2| (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))
                                     |pmindex| (QREFELT $ 170))
                                    JV)
                                   . #15#)))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #15#))
                         . #15#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 108) (SPADCALL JV (QREFELT $ 171))
                         (QREFELT $ 173)))))) 

(SDEFUN |JBE;differentiate;$JB$;23| ((|fun| $) (|jv| JB) ($ $))
        (SPROG ((|x| (|Symbol|)))
               (SEQ
                (LETT |x| (SPADCALL |jv| (QREFELT $ 175))
                      |JBE;differentiate;$JB$;23|)
                (EXIT (SPADCALL |fun| |x| (QREFELT $ 176)))))) 

(SDEFUN |JBE;differentiate;$S$;24| ((|fun| $) (|x| |Symbol|) ($ $))
        (SPADCALL (SPADCALL |fun| (QREFELT $ 11)) |x| (QREFELT $ 178))) 

(SDEFUN |JBE;subst;$JB2$;25| ((|f| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG ((|res| ($)))
               (SEQ
                (LETT |res|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) |exp|
                                          (QREFELT $ 181))
                                (QREFELT $ 183))
                      |JBE;subst;$JB2$;25|)
                (EXIT |res|)))) 

(SDEFUN |JBE;solveFor;$JBU;26| ((|f| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG
         ((|vquo| #1=(|List| (|Kernel| $))) (|vrem| #1#)
          (|md|
           (|Record|
            (|:| |quotient|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
            (|:| |remainder|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
          (|var| (|Kernel| $))
          (|fun| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
         (SEQ
          (LETT |fun| (SPADCALL |f| (QREFELT $ 19))
                . #2=(|JBE;solveFor;$JBU;26|))
          (LETT |var| (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) (QREFELT $ 184))
                . #2#)
          (LETT |md|
                (SPADCALL |fun| (SPADCALL |var| (QREFELT $ 185)) |var|
                          (QREFELT $ 186))
                . #2#)
          (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT $ 27)) . #2#)
          (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT $ 27)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |var| (SPADCALL |vrem| |vquo| (QREFELT $ 187))
                       (QREFELT $ 67))
             (CONS 1 "failed"))
            ((SPADCALL (QCDR |md|) (QREFELT $ 188))
             (COND ((NULL |vquo|) (CONS 0 (|spadConstant| $ 45)))
                   (#3='T (CONS 1 "failed"))))
            (#3#
             (CONS 0
                   (SPADCALL (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT $ 15))
                             (QREFELT $ 189))))))))) 

(SDEFUN |JBE;kernel0| ((|op| |BasicOperator|) (|ls| |List| $) ($ $))
        (SPADCALL |op| |ls| (QREFELT $ 190))) 

(SDEFUN |JBE;sy2jbe| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 191))) 

(SDEFUN |JBE;hidedisp| ((|l| |List| $) ($ |OutputForm|))
        (SPROG
         ((|op| (|OutputForm|)) (#1=#:G388 NIL) (|e| NIL) (#2=#:G387 NIL)
          (#3=#:G386 NIL) (|k| NIL) (|args| (|List| (|OutputForm|)))
          (#4=#:G385 NIL) (|show| #5=(|Integer|)) (|num| #5#)
          (|name| (|Symbol|)))
         (SEQ
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 192)) (QREFELT $ 193))
                . #6=(|JBE;hidedisp|))
          (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #6#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 192)) (QREFELT $ 167))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #6#)
          (LETT |show|
                (SPADCALL (SPADCALL |l| (QREFELT $ 192)) (QREFELT $ 167))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #6#)
          (LETT |args| NIL . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #4# |show| . #6#) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ
                (LETT |args|
                      (SPADCALL |args|
                                (LIST
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 192))
                                           (QREFELT $ 194)))
                                (QREFELT $ 196))
                      . #6#)
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #6#)))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (+ |show| 1) . #6#) (LETT #3# |num| . #6#) G190
               (COND ((> |k| #3#) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #6#)))
               (LETT |k| (+ |k| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |l| (QREFELT $ 197))
            (LETT |op| (SPADCALL |name| (QREFELT $ 198)) . #6#))
           (#7='T
            (LETT |op|
                  (SPADCALL (SPADCALL |name| (QREFELT $ 198))
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL . #6#)
                              (SEQ (LETT |e| NIL . #6#) (LETT #1# |l| . #6#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |e| (CAR #1#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |e| (QREFELT $ 194))
                                                 #2#)
                                           . #6#)))
                                   (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 199))
                            (QREFELT $ 200))
                  . #6#)))
          (EXIT
           (COND ((NULL |args|) |op|)
                 (#7# (SPADCALL |op| |args| (QREFELT $ 201)))))))) 

(SDEFUN |JBE;hidediff| ((|l| |List| $) (|x| |Symbol|) ($ $))
        (SPROG
         ((|res| ($)) (|newarg| (|List| $)) (#1=#:G411 NIL) (|j| NIL)
          (#2=#:G410 NIL) (|da| ($)) (|k| NIL) (#3=#:G409 NIL) (|arg| NIL)
          (|op| (|BasicOperator|)) (|oldarg| (|List| $)) (#4=#:G392 NIL)
          (|diff| (|List| (|Integer|))) (#5=#:G408 NIL) (#6=#:G407 NIL)
          (|args| (|List| $)) (#7=#:G406 NIL) (|show| #8=(|Integer|))
          (|num| #8#) (|name| (|Symbol|)))
         (SEQ
          (LETT |oldarg| (SPADCALL |l| (QREFELT $ 202)) . #9=(|JBE;hidediff|))
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 192)) (QREFELT $ 193))
                . #9#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #9#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 192)) (QREFELT $ 167))
                . #9#)
          (EXIT
           (COND ((ZEROP |num|) (|spadConstant| $ 45))
                 ('T
                  (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #9#)
                       (LETT |show|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 192))
                                       (QREFELT $ 167))
                             . #9#)
                       (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #9#)
                       (LETT |args| (SPADCALL (QREFELT $ 147)) . #9#)
                       (SEQ (LETT |k| 1 . #9#) (LETT #7# |num| . #9#) G190
                            (COND ((|greater_SI| |k| #7#) (GO G191)))
                            (SEQ
                             (LETT |args|
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 192))
                                             |args| (QREFELT $ 152))
                                   . #9#)
                             (EXIT
                              (LETT |l| (SPADCALL |l| (QREFELT $ 169)) . #9#)))
                            (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |diff|
                             (PROGN
                              (LETT #6# NIL . #9#)
                              (SEQ (LETT |k| NIL . #9#) (LETT #5# |l| . #9#)
                                   G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |k| (CAR #5#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |k| (QREFELT $ 167))
                                                 #6#)
                                           . #9#)))
                                   (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                   (EXIT (NREVERSE #6#))))
                             . #9#)
                       (LETT |oldarg|
                             (SPADCALL |oldarg|
                                       (PROG1 (LETT #4# (+ |num| 3) . #9#)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       (QREFELT $ 203))
                             . #9#)
                       (LETT |op| (SPADCALL |name| (QREFELT $ 204)) . #9#)
                       (SPADCALL |op| '|%specialDisp|
                                 (CONS (|function| |JBE;hidedisp|) $)
                                 (QREFELT $ 206))
                       (SPADCALL |op| '|%specialDiff|
                                 (CONS (|function| |JBE;hidediff|) $)
                                 (QREFELT $ 206))
                       (LETT |res| (|spadConstant| $ 45) . #9#)
                       (SEQ (LETT |arg| NIL . #9#) (LETT #3# |args| . #9#)
                            (LETT |k| |num| . #9#) G190
                            (COND
                             ((OR (< |k| 1) (ATOM #3#)
                                  (PROGN (LETT |arg| (CAR #3#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |da| (SPADCALL |arg| |x| (QREFELT $ 176))
                                   . #9#)
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |da| (QREFELT $ 105)))
                                (SEQ
                                 (LETT |newarg|
                                       (SPADCALL |oldarg|
                                                 (PROGN
                                                  (LETT #2# NIL . #9#)
                                                  (SEQ (LETT |j| NIL . #9#)
                                                       (LETT #1#
                                                             (SPADCALL |diff|
                                                                       (LIST
                                                                        |k|)
                                                                       (QREFELT
                                                                        $ 207))
                                                             . #9#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |j|
                                                                    (CAR #1#)
                                                                    . #9#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (SPADCALL |j|
                                                                          (QREFELT
                                                                           $
                                                                           208))
                                                                #2#)
                                                               . #9#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #9#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 (QREFELT $ 209))
                                       . #9#)
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL
                                                   (|JBE;kernel0| |op| |newarg|
                                                    $)
                                                   |da| (QREFELT $ 52))
                                                  (QREFELT $ 53))
                                        . #9#)))))))
                            (LETT |k|
                                  (PROG1 (+ |k| -1) (LETT #3# (CDR #3#) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |res|)))))))) 

(SDEFUN |JBE;function;SLNni$;31|
        ((|f| |Symbol|) (|arg| |List| $) (|show| |NonNegativeInteger|) ($ $))
        (SPROG ((|args| (|List| $)) (|op| (|BasicOperator|)))
               (SEQ
                (LETT |op| (SPADCALL |f| (QREFELT $ 204))
                      . #1=(|JBE;function;SLNni$;31|))
                (SPADCALL |op| '|%specialDisp|
                          (CONS (|function| |JBE;hidedisp|) $) (QREFELT $ 206))
                (SPADCALL |op| '|%specialDiff|
                          (CONS (|function| |JBE;hidediff|) $) (QREFELT $ 206))
                (LETT |args|
                      (SPADCALL
                       (LIST (|JBE;sy2jbe| |f| $)
                             (SPADCALL (SPADCALL |arg| (QREFELT $ 210))
                                       (QREFELT $ 208))
                             (SPADCALL |show| (QREFELT $ 208)))
                       |arg| (QREFELT $ 209))
                      . #1#)
                (EXIT (|JBE;kernel0| |op| |args| $))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression| (#1=#:G472)
  (SPROG NIL
         (PROG (#2=#:G473)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleExpression|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleExpression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleExpression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleExpression|)))))))))) 

(DEFUN |JetBundleExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G471 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #2=(|JetBundleExpression|))
          (LETT |dv$| (LIST '|JetBundleExpression| DV$1) . #2#)
          (LETT $ (GETREFV 262) . #2#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CommutativeRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Ring|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Group|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Float|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    . #2#)
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
                                              (OR
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Float|))))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|InputForm|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Float|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|RetractableTo|
                                                                 (|Fraction|
                                                                  (|Integer|)))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                #1#)
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|Group|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|Ring|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))
                          . #2#))
          (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 65536))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 131072))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Expression| (|Integer|)))
          $))) 

(MAKEPROP '|JetBundleExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 24) (|local| |#1|) '|Rep|
              (0 . |coerce|) |JBE;coerce;JB$;1| |JBE;coerce;E$;2|
              |JBE;coerce;$E;3| (|SparseMultivariatePolynomial| 24 34)
              (5 . |One|) (|SparseMultivariatePolynomial| 24 28) (9 . /)
              |JBE;coerce;Smp$;4| (|SparseMultivariatePolynomial| 5 6)
              (15 . |Zero|) (19 . |numer|) (|List| $)
              (24 . |primitiveMonomials|) (|List| 24) (29 . |coefficients|)
              (|Integer|) (34 . |coerce|) (|List| 34) (39 . |variables|)
              (|Kernel| $) (44 . |coerce|) (|Union| 6 '#1="failed")
              (49 . |retractIfCan|) (54 . *) (|NonNegativeInteger|)
              (|Kernel| $$) (60 . |degree|) (66 . |One|) (70 . |One|)
              (74 . |One|) (|List| 6) (|List| 33) (78 . |monomial|) (85 . *)
              (91 . +) |JBE;numerJP;$Smp;5| (97 . |Zero|)
              (101 . |primitiveMonomials|) (|List| 5) (106 . |coefficients|)
              (111 . |variables|) (116 . |degree|) (122 . ^) (128 . *)
              (134 . +) |JBE;coerce;Smp$;6| (140 . |gcd|) |JBE;gcd;3$;7|
              (|Union| $ '"failed") (146 . |exquo|) |JBE;exquo;2$U;8| (152 . /)
              |JBE;recip;$U;9| (158 . |order|) (163 . |first|) (168 . |concat|)
              (|Boolean|) (174 . =) (180 . |member?|) (186 . |and|)
              (|Mapping| 65 65 65) (|List| 65) (192 . |reduce|) (|List| 26)
              (199 . |cons|) (|List| 12) (|Mapping| 12 $$) (|List| $$)
              (|FiniteLinearAggregateFunctions2| $$ 76 12 74) (205 . |map|)
              (211 . |leadingMonomial|) (216 . |sort!|) (221 . |first|)
              (226 . |merge|) (232 . |removeDuplicates!|) (237 . |dimJ|)
              (|SparseEchelonMatrix| 6 $) |JBE;dimension;LSem2Nni;12|
              (242 . |dimS|) |JBE;orderDim;LSem2Nni;13| (247 . |ground?|)
              (|Union| 34 '"failed") (252 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (257 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (263 . |monomial?|)
              (268 . |leadingCoefficient|) (273 . |monomial|)
              (280 . |minimumDegree|) (285 . |Zero|) (289 . >)
              (295 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (301 . |monicDivide|) (307 . |multivariate|) (313 . |zero?|)
              |JBE;simpOne;2$;15| (318 . =) (324 . >) (|String|) (|OutputForm|)
              (330 . |message|) (335 . |coerce|) (340 . |assign|) (|Void|)
              (346 . |print|) (|GroebnerPackage| 24 (|IndexedExponents| 34) 12)
              (351 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (356 . |map|)
              (362 . |coerce|) (367 . |setUnion|) (|Mapping| 40 40 40)
              (|List| 40) (373 . |reduce|) (|List| 39) (380 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (386 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 128) (|:| |Depend| 40))
              (|List| 131) (392 . |first|) |JBE;solveFor;$JBU;26|
              (397 . |cons|) (403 . |concat!|) |JBE;subst;$JB2$;25|
              (409 . |append|) (415 . |removeDuplicates!|)
              (|Mapping| 65 131 131) (420 . |sort!|) (426 . |merge|)
              (433 . |allIndices|) (438 . =) (|Symbol|) (444 . |type|)
              (449 . |empty|) (453 . |new|) (|PositiveInteger|) (459 . U)
              (464 . <) (470 . |cons|) (476 . |setRow!|) (483 . |reverse!|)
              (|Union| '"failed" 124)
              (|Record| (|:| |Sys| 20) (|:| JM 85) (|:| |Depend| 155))
              |JBE;simplify;LSemR;21| (|List| 28) (488 . |tower|)
              (|BasicOperator|) (493 . |operator|) (498 . |has?|)
              (|Union| 205 '"failed") (504 . |property|) (510 . |argument|)
              (515 . |second|) (520 . |retract|) (525 . X) (530 . |rest|)
              (535 . P) (541 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (546 . |sort|) |JBE;jetVariables;$L;22| (552 . |name|)
              |JBE;differentiate;$S$;24| |JBE;differentiate;$JB$;23|
              (557 . |differentiate|) (563 . =) (|Equation| $$) (569 . =)
              (|Equation| $) (575 . |eval|) (581 . |retract|) (586 . |coerce|)
              (591 . |monicDivide|) (598 . |append|) (604 . |zero?|) (609 . -)
              (614 . |kernel|) (620 . |coerce|) (625 . |first|)
              (630 . |retract|) (635 . |coerce|) (|List| 110) (640 . |concat!|)
              (646 . |empty?|) (651 . |coerce|) (656 . |commaSeparate|)
              (661 . |sub|) (667 . |prefix|) (673 . |copy|) (678 . |first|)
              (684 . |operator|) (|None|) (689 . |setProperty|) (696 . |merge|)
              (702 . |coerce|) (707 . |append|) (713 . |#|)
              |JBE;function;SLNni$;31| (|Union| 213 '#1#) (|Fraction| 24)
              (|Union| 20 '#2="failed")
              (|Record| (|:| |coef| 24) (|:| |var| 28)) (|Union| 215 '#2#)
              (|List| 160) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 24)
              (|Factored| $) (|Polynomial| 213) (|Fraction| 222)
              (|Fraction| 92) (|Union| 226 '#1#) (|Fraction| 244)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 24 $)
              (|AlgebraicNumber|) (|Union| 229 '#1#) (|Matrix| 24) (|Matrix| $)
              (|Record| (|:| |mat| 231) (|:| |vec| (|Vector| 24))) (|Vector| $)
              (|Record| (|:| |var| 28) (|:| |exponent| 24)) (|Union| 235 '#2#)
              (|List| 145) (|Mapping| $ $) (|List| 238)
              (|Record| (|:| |val| $) (|:| |exponent| 24)) (|Union| 240 '#2#)
              (|Mapping| $ 20) (|List| 242) (|Polynomial| 24)
              (|Union| 244 '#1#) (|SegmentBinding| $)
              (|Record| (|:| |coef| 20) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 249 '"failed") (|Polynomial| $) (|Union| 28 '#1#)
              (|List| 182) (|Union| 145 '#1#) (|Union| 24 '#1#)
              (|Record| (|:| |DSys| 20) (|:| |JVars| 126))
              (|Record| (|:| |DPhi| $) (|:| |JVars| 39))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 718 |zerosOf| 724 |zeroOf| 751 |zero?| 778 |whittakerW| 783
              |whittakerM| 790 |weierstrassZeta| 797 |weierstrassSigma| 804
              |weierstrassPPrime| 811 |weierstrassPInverse| 818 |weierstrassP|
              825 |weberE| 832 |variables| 838 |univariate| 848 |unitNormal|
              854 |unitCanonical| 859 |unit?| 864 |tower| 869 |tanh| 879 |tan|
              884 |symbol| 889 |summation| 894 |subtractIfCan| 906 |subst| 912
              |struveL| 938 |struveH| 944 |squareFreePart| 950 |squareFree| 955
              |sqrt| 960 |sortLD| 965 |solveFor| 970 |smaller?| 976 |sizeLess?|
              982 |sinh| 988 |sin| 993 |simplify| 998 |simpOne| 1004 |simpMod|
              1009 |setNotation| 1022 |sech| 1027 |sec| 1032 |sample| 1037
              |rootsOf| 1041 |rootSum| 1068 |rootOf| 1075 |rightRecip| 1102
              |rightPower| 1107 |riemannZeta| 1119 |retractIfCan| 1124
              |retract| 1164 |rem| 1204 |reducedSystem| 1210 |reduceMod| 1221
              |reduce| 1227 |recip| 1232 |quo| 1237 |product| 1243
              |principalIdeal| 1255 |prime?| 1260 |polylog| 1265 |polygamma|
              1271 |pi| 1277 |permutation| 1281 |patternMatch| 1287 |paren|
              1301 |orderDim| 1306 |order| 1313 |opposite?| 1318 |operators|
              1324 |operator| 1329 |one?| 1334 |odd?| 1339 |numerator| 1344
              |numerJP| 1349 |numer| 1354 |numIndVar| 1359 |numDepVar| 1363
              |nthRoot| 1367 |multiEuclidean| 1373 |minPoly| 1379 |meixnerM|
              1384 |meijerG| 1392 |map| 1401 |mainKernel| 1407 |lommelS2| 1412
              |lommelS1| 1419 |log| 1426 |li| 1431 |lerchPhi| 1436 |legendreQ|
              1443 |legendreP| 1450 |leftRecip| 1457 |leftPower| 1462
              |leadingDer| 1474 |lcmCoef| 1479 |lcm| 1485 |latex| 1496
              |lambertW| 1501 |laguerreL| 1506 |kummerU| 1513 |kummerM| 1520
              |kernels| 1527 |kernel| 1537 |kelvinKer| 1549 |kelvinKei| 1555
              |kelvinBer| 1561 |kelvinBei| 1567 |jetVariables| 1573
              |jacobiZeta| 1578 |jacobiTheta| 1584 |jacobiSn| 1590 |jacobiP|
              1596 |jacobiMatrix| 1604 |jacobiDn| 1615 |jacobiCn| 1621
              |isTimes| 1627 |isPower| 1632 |isPlus| 1637 |isMult| 1642
              |isExpt| 1647 |is?| 1664 |inv| 1676 |integral| 1681
              |hypergeometricF| 1693 |hermiteH| 1700 |height| 1706
              |hashUpdate!| 1711 |hash| 1717 |hankelH2| 1722 |hankelH1| 1728
              |ground?| 1734 |ground| 1739 |getNotation| 1744 |gcdPolynomial|
              1748 |gcd| 1754 |function| 1765 |fresnelS| 1772 |fresnelC| 1777
              |freeOf?| 1782 |formalDiff2| 1800 |formalDiff| 1814 |factorials|
              1832 |factorial| 1843 |factor| 1848 |extractSymbol| 1853
              |extendedEuclidean| 1858 |exquo| 1871 |expressIdealMember| 1877
              |exp| 1883 |even?| 1888 |eval| 1893 |euclideanSize| 2037 |erfi|
              2042 |erf| 2047 |elt| 2052 |ellipticPi| 2148 |ellipticK| 2155
              |ellipticF| 2160 |ellipticE| 2166 |divide| 2177 |distribute| 2183
              |dimension| 2194 |dilog| 2201 |digamma| 2206 |differentiate| 2211
              |denominator| 2243 |denom| 2248 |definingPolynomial| 2253
              |dSubst| 2258 |csch| 2265 |csc| 2270 |coth| 2275 |cot| 2280
              |cosh| 2285 |cos| 2290 |convert| 2295 |const?| 2315 |conjugate|
              2320 |commutator| 2331 |coerce| 2337 |class| 2417 |charthRoot|
              2422 |charlierC| 2427 |characteristic| 2434 |box| 2438 |binomial|
              2443 |besselY| 2449 |besselK| 2455 |besselJ| 2461 |besselI| 2467
              |belong?| 2473 |autoReduce| 2478 |atanh| 2483 |atan| 2488
              |associator| 2493 |associates?| 2500 |asinh| 2506 |asin| 2511
              |asech| 2516 |asec| 2521 |applyQuote| 2526 |antiCommutator| 2562
              |annihilate?| 2568 |angerJ| 2574 |algtower| 2580 |airyBiPrime|
              2590 |airyBi| 2595 |airyAiPrime| 2600 |airyAi| 2605 |acsch| 2610
              |acsc| 2615 |acoth| 2620 |acot| 2625 |acosh| 2630 |acos| 2635
              |abs| 2640 ^ 2645 |Zero| 2675 X 2679 U 2688 |Si| 2697 |Shi| 2702
              P 2707 |One| 2729 |Gamma| 2733 |Ei| 2744 D 2749 |Ci| 2775 |Chi|
              2780 |Beta| 2785 = 2791 / 2797 - 2809 + 2820 * 2826)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 2 3 4 14
                                  0 0 0 0 0 0 2 0 0 0 2 0 0 0 0 0 2 2 0 6 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 10 11 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 1
                                  5 7 8 9 12))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL
                |FullyLinearlyExplicitOver&| |PartialDifferentialRing&|
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL NIL NIL
                |Rng&| NIL |Module&| |Module&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| |Group&| NIL NIL NIL NIL
                |ExpressionSpace&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| NIL |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |RetractableTo&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 24) (|Field|)
                 (|EuclideanDomain|) (|JetBundleFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|CommutativeRing|) (|LeftOreRing|)
                 (|FullyLinearlyExplicitOver| 24)
                 (|PartialDifferentialRing| 145) (|Algebra| 213) (|EntireRing|)
                 (|Algebra| $$) (|Algebra| 24) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 24) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 213) (|Module| $$) (|SemiRng|)
                 (|Module| 24) (|BiModule| 213 213) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 24 24) (|RightModule| 213)
                 (|LeftModule| 213) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| 24) (|RightModule| 24)
                 (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 24) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 24) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 24)
                 (|Patternable| 24) (|Evalable| $$) (|CommutativeStar|)
                 (|SetCategory|) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 24) (|Type|) (|RetractableTo| 145)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 34 $$)
                 (|RetractableTo| 34) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 110) (|RetractableTo| 213)
                 (|RetractableTo| 226) (|RetractableTo| 244)
                 (|ConvertibleTo| 218) (|ConvertibleTo| 219)
                 (|ConvertibleTo| 220) (|RetractableTo| 229))
              (|makeByteWordVec2| 261
                                  '(1 6 5 0 8 0 12 0 13 2 0 0 14 14 15 0 17 0
                                    18 1 0 14 0 19 1 12 20 0 21 1 12 22 0 23 1
                                    5 0 24 25 1 12 26 0 27 1 0 0 28 29 1 0 30 0
                                    31 2 5 0 0 0 32 2 12 33 0 34 35 0 0 0 36 0
                                    6 0 37 0 17 0 38 3 17 0 0 39 40 41 2 17 0 5
                                    0 42 2 17 0 0 0 43 0 0 0 45 1 17 20 0 46 1
                                    17 47 0 48 1 17 39 0 49 2 17 33 0 6 50 2 0
                                    0 0 33 51 2 0 0 0 0 52 2 0 0 0 0 53 2 12 0
                                    0 0 55 2 12 57 0 0 58 2 0 0 0 0 60 1 0 33 0
                                    62 1 26 34 0 63 2 26 0 0 34 64 2 26 65 0 0
                                    66 2 26 65 34 0 67 2 65 0 0 0 68 3 70 65 69
                                    0 65 71 2 72 0 26 0 73 2 77 74 75 76 78 1
                                    12 0 0 79 1 26 0 0 80 1 72 26 0 81 2 26 0 0
                                    0 82 1 26 0 0 83 1 6 33 33 84 1 6 33 33 87
                                    1 12 65 0 89 1 12 90 0 91 2 12 92 0 34 93 1
                                    94 65 0 95 1 94 12 0 96 3 12 0 0 34 33 97 1
                                    94 33 0 98 0 7 0 99 2 33 65 0 0 100 2 94 0
                                    12 33 101 2 94 102 0 0 103 2 12 0 92 34 104
                                    1 0 65 0 105 2 6 65 0 0 107 2 6 65 0 0 108
                                    1 110 0 109 111 1 74 110 0 112 2 110 0 0 0
                                    113 1 110 114 0 115 1 116 74 74 117 2 119
                                    76 118 74 120 1 33 110 0 121 2 40 0 0 0 122
                                    3 124 40 123 0 40 125 2 0 85 20 126 127 2
                                    129 128 0 24 130 1 132 131 0 133 2 132 0
                                    131 0 135 2 132 0 0 0 136 2 40 0 0 0 138 1
                                    40 0 0 139 2 132 0 140 0 141 3 132 0 140 0
                                    0 142 1 129 39 0 143 2 0 65 0 0 144 1 6 145
                                    0 146 0 76 0 147 2 129 0 39 24 148 1 6 0
                                    149 150 2 6 65 0 0 151 2 76 0 2 0 152 3 129
                                    114 0 24 128 153 1 76 0 0 154 1 0 158 0 159
                                    1 34 160 0 161 2 160 65 0 145 162 2 160 163
                                    0 145 164 1 34 76 0 165 1 76 2 0 166 1 0 24
                                    0 167 1 6 0 149 168 1 76 0 0 169 2 6 0 149
                                    40 170 1 39 0 0 171 2 39 0 172 0 173 1 6
                                    145 0 175 2 7 0 0 145 178 2 7 65 0 0 179 2
                                    180 0 2 2 181 2 0 0 0 182 183 1 0 28 0 184
                                    1 12 0 34 185 3 12 102 0 0 34 186 2 26 0 0
                                    0 187 1 12 65 0 188 1 0 0 0 189 2 5 0 160
                                    20 190 1 5 0 145 191 1 76 2 0 192 1 0 145 0
                                    193 1 0 110 0 194 2 195 0 0 0 196 1 76 65 0
                                    197 1 145 110 0 198 1 110 0 20 199 2 110 0
                                    0 0 200 2 110 0 0 20 201 1 76 0 0 202 2 76
                                    0 0 33 203 1 160 0 145 204 3 160 0 0 145
                                    205 206 2 22 0 0 0 207 1 0 0 24 208 2 76 0
                                    0 0 209 1 76 33 0 210 2 0 65 0 0 1 1 0 20
                                    92 1 1 0 20 251 1 2 0 20 92 145 1 1 0 20 0
                                    1 2 0 20 0 145 1 1 0 0 92 1 1 0 0 251 1 2 0
                                    0 92 145 1 1 0 0 0 1 2 0 0 0 145 1 1 0 65 0
                                    105 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 237 0 1 1 0
                                    237 20 1 2 1 224 0 28 1 1 0 258 0 1 1 0 0 0
                                    1 1 0 65 0 1 1 0 158 0 159 1 0 158 20 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 85 20 1 2 0 0 0 145 1 2
                                    0 0 0 246 1 2 0 57 0 0 1 2 0 0 0 182 1 3 0
                                    0 0 158 20 1 2 0 0 0 253 1 3 0 0 0 6 0 137
                                    2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 221 0
                                    1 1 0 0 0 1 1 0 20 20 1 2 0 57 0 6 134 2 0
                                    65 0 0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0 1 2
                                    0 156 20 85 157 1 0 0 0 106 2 0 20 20 20 1
                                    3 0 156 20 85 20 1 1 0 114 145 1 1 0 0 0 1
                                    1 0 0 0 1 0 0 0 1 1 0 20 92 1 1 0 20 251 1
                                    2 0 20 92 145 1 1 0 20 0 1 2 0 20 0 145 1 3
                                    0 0 0 92 145 1 1 0 0 92 1 1 0 0 251 1 2 0 0
                                    92 145 1 1 0 0 0 1 2 0 0 0 145 1 1 0 57 0 1
                                    2 0 0 0 33 1 2 0 0 0 149 1 1 0 0 0 1 1 13
                                    212 0 1 1 1 225 0 1 1 12 230 0 1 1 5 245 0
                                    1 1 0 252 0 1 1 0 254 0 1 1 0 255 0 1 1 0
                                    30 0 31 1 13 213 0 1 1 1 226 0 1 1 12 229 0
                                    1 1 5 244 0 1 1 0 28 0 184 1 0 145 0 193 1
                                    0 24 0 167 1 0 6 0 1 2 0 0 0 0 1 1 5 231
                                    232 1 2 5 233 232 234 1 2 0 20 20 20 1 1 0
                                    0 0 1 1 0 57 0 61 2 0 0 0 0 1 2 0 0 0 145 1
                                    2 0 0 0 246 1 1 0 247 20 1 1 0 65 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3 10
                                    227 0 219 227 1 3 11 228 0 220 228 1 1 0 0
                                    0 1 3 0 33 20 85 33 88 1 0 33 0 62 2 0 65 0
                                    0 1 1 0 217 0 1 1 0 160 160 1 1 0 65 0 1 1
                                    18 65 0 1 1 0 0 0 1 1 0 17 0 44 1 5 14 0 19
                                    0 0 149 1 0 0 149 1 2 0 0 0 24 1 2 0 214 20
                                    0 1 1 17 92 28 1 4 0 0 0 0 0 0 1 5 18 0 20
                                    20 20 20 0 1 2 0 0 238 28 1 1 0 252 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1
                                    0 57 0 1 2 0 0 0 33 1 2 0 0 0 149 1 1 0 6 0
                                    1 2 0 259 0 0 1 2 0 0 0 0 1 1 0 0 20 1 1 0
                                    109 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 1 0 158 0 1 1 0 158 20 1 2
                                    0 0 160 0 1 2 0 0 160 20 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 39 0
                                    174 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 4 0
                                    0 0 0 0 0 1 1 0 85 20 1 2 0 85 20 126 127 2
                                    0 0 0 0 1 2 0 0 0 0 1 1 16 214 0 1 1 5 241
                                    0 1 1 15 214 0 1 1 15 216 0 1 2 5 236 0 160
                                    1 2 5 236 0 145 1 1 16 236 0 1 2 0 65 0 145
                                    1 2 0 65 0 160 1 1 0 0 0 1 2 0 0 0 246 1 2
                                    0 0 0 145 1 3 18 0 20 20 0 1 2 0 0 0 0 1 1
                                    0 33 0 1 2 0 261 261 0 1 1 0 260 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 65 0 1 1 0 24 0 1 0 0
                                    145 1 2 0 92 92 92 1 2 0 0 0 0 56 1 0 0 20
                                    1 3 0 0 145 20 33 211 1 0 0 0 1 1 0 0 0 1 2
                                    0 65 0 0 1 2 0 65 0 145 1 2 0 65 0 6 1 3 0
                                    256 20 149 85 1 3 0 257 0 149 85 1 2 0 0 0
                                    40 1 2 0 20 20 149 1 2 0 0 0 149 1 2 0 0 0
                                    145 1 1 0 0 0 1 1 0 0 0 1 1 0 221 0 1 1 0
                                    85 85 1 2 0 248 0 0 1 3 0 250 0 0 0 1 2 0
                                    57 0 0 59 2 0 214 20 0 1 1 0 0 0 1 1 18 65
                                    0 1 4 7 0 0 217 20 145 1 4 7 0 0 160 0 145
                                    1 4 5 0 0 237 40 239 1 4 5 0 0 237 40 243 1
                                    4 5 0 0 145 33 238 1 4 5 0 0 145 33 242 1 3
                                    0 0 0 158 20 1 3 0 0 0 28 0 1 2 0 0 0 253 1
                                    3 0 0 0 0 0 1 2 0 0 0 182 183 3 0 0 0 20 20
                                    1 3 0 0 0 237 239 1 3 0 0 0 145 242 1 3 0 0
                                    0 237 243 1 3 0 0 0 145 238 1 3 0 0 0 217
                                    243 1 3 0 0 0 217 239 1 3 0 0 0 160 242 1 3
                                    0 0 0 160 238 1 1 0 33 0 1 1 0 0 0 1 1 0 0
                                    0 1 3 0 0 160 0 0 1 2 0 0 160 0 1 4 0 0 160
                                    0 0 0 1 6 0 0 160 0 0 0 0 0 1 5 0 0 160 0 0
                                    0 0 1 7 0 0 160 0 0 0 0 0 0 1 9 0 0 160 0 0
                                    0 0 0 0 0 0 1 8 0 0 160 0 0 0 0 0 0 0 1 10
                                    0 0 160 0 0 0 0 0 0 0 0 0 1 2 0 0 160 20 1
                                    3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 102 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 3 0 33 20 85 33 86 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 6 177 3 0 0 0 237 40 1 2 0 0 0
                                    237 1 3 0 0 0 145 33 1 2 0 0 0 145 176 1 0
                                    0 0 1 1 1 14 0 1 1 17 0 0 1 3 0 0 0 6 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 7 218 0 1 1 8 219 0 1 1 9
                                    220 0 1 1 1 0 221 1 1 0 65 0 1 2 6 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 1 1 0 222 1 1 1 0 223
                                    1 1 1 0 226 1 1 12 0 229 1 1 5 0 244 1 1 0
                                    0 14 16 1 0 0 17 54 1 0 5 0 11 1 0 0 5 10 1
                                    0 0 213 1 1 0 0 28 29 1 0 0 145 1 1 0 0 6 9
                                    1 0 0 0 1 1 0 0 24 208 1 0 110 0 194 1 0 33
                                    0 1 1 3 57 0 1 3 0 0 0 0 0 1 0 0 33 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 65 160 1 1 0 20 20
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2 0 65
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 145 0 1 3 0 0 145 0 0 1 5 0 0 145 0
                                    0 0 0 1 4 0 0 145 0 0 0 1 2 0 0 145 20 1 2
                                    0 0 0 0 1 2 0 65 0 0 1 2 0 0 0 0 1 1 1 158
                                    0 1 1 1 158 20 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 24 1 2 0 0 0 213 1 2 0 0 0
                                    33 51 2 0 0 0 149 1 0 0 0 45 0 0 0 1 1 0 0
                                    149 1 0 0 0 1 1 0 0 149 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 33 1 2 0 0 149 33 1 1 0 0 40 1 2 0
                                    0 149 40 1 0 0 0 36 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 0 237 40 1 3 0 0 0 145 33 1 2
                                    0 0 0 145 1 2 0 0 0 237 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 65 0 0 144 2 1 0 14 14 15
                                    2 0 0 0 0 60 1 0 0 0 189 2 0 0 0 0 1 2 0 0
                                    0 0 53 2 2 0 0 24 1 2 0 0 0 213 1 2 0 0 213
                                    0 1 2 0 0 33 0 1 2 0 0 24 0 1 2 0 0 0 0 52
                                    2 0 0 149 0 1)))))
           '|lookupComplete|)) 
