
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
           (SPADCALL "polys" (SPADCALL |polys| (QREFELT $ 110))
                     (QREFELT $ 111))
           (QREFELT $ 113))
          (LETT |gbase| (SPADCALL |polys| (QREFELT $ 115)) . #1#)
          (EXIT (SPADCALL (ELT $ 16) |gbase| (QREFELT $ 118)))))) 

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
           (SPADCALL "groebnerSimp: #"
                     (SPADCALL (LENGTH |sysL|) (QREFELT $ 119))
                     (QREFELT $ 111))
           (QREFELT $ 113))
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
          (LETT |resDep| (SPADCALL (ELT $ 120) |tmp| NIL (QREFELT $ 123))
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
                          (QREFELT $ 125))
                . #9#)
          (SPADCALL "END groebnerSimp" (QREFELT $ 113))
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
                          (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT $ 128))
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
          (|newFun| ($)) (#1=#:G273 NIL)
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
                   (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT $ 131)) . #5#)
                        (LETT |sysL| (CDR |sysL|) . #5#)
                        (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))) . #5#)
                        (LETT |s|
                              (SPADCALL (QVELT |rec| 0) |ld| (QREFELT $ 132))
                              . #5#)
                        (LETT |solved?| (QEQCAR |s| 0) . #5#)
                        (EXIT
                         (COND
                          (|solved?|
                           (SEQ (LETT |srec| |rec| . #5#)
                                (EXIT (LETT |sld| |ld| . #5#))))
                          ('T
                           (LETT |rsysL|
                                 (SPADCALL |rec| |rsysL| (QREFELT $ 133))
                                 . #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |rsysL|
                    (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT $ 134)) . #5#)
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
                                         (QREFELT $ 135))
                               (QREFELT $ 106))
                              . #5#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |newFun| (QREFELT $ 105)))
                           (SEQ
                            (LETT |newJMR|
                                  (SPADCALL
                                   (SPADCALL (LIST |newFun|) (LIST |ind|)
                                             (QREFELT $ 125))
                                   1 (QREFELT $ 128))
                                  . #5#)
                            (LETT |newDep|
                                  (SPADCALL (APPEND (QVELT |rec| 2) |sdep|)
                                            (QREFELT $ 136))
                                  . #5#)
                            (EXIT
                             (LETT |res|
                                   (SPADCALL
                                    (VECTOR |newFun| |newJMR| |newDep|) |res|
                                    (QREFELT $ 133))
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
                  (LETT |frec| (SPADCALL |sysL| (QREFELT $ 131))
                        . #3=(|JBE;simpRec|))
                  (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))) . #3#)
                  (LETT |sysL| (CDR |sysL|) . #3#)
                  (LETT |srec| (SPADCALL |sysL| (QREFELT $ 131)) . #3#)
                  (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |fld| |sld| (QREFELT $ 108))
                     (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| $)
                               (QREFELT $ 133)))
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
                                      (SPADCALL |srec| |eqLD| (QREFELT $ 133))
                                      . #3#)
                                (LETT |sysL| (CDR |sysL|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |sysL|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |sysL| (QREFELT $ 131))
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
                                          (QREFELT $ 138))
                                . #3#)
                          (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 131)) . #3#)
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
                                      (SPADCALL |srec| |resLD| (QREFELT $ 133))
                                      . #3#)
                                (LETT |eqLD| (CDR |eqLD|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |eqLD|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |eqLD| (QREFELT $ 131))
                                          . #3#)
                                    (EXIT
                                     (LETT |sld|
                                           (|SPADfirst|
                                            (QCAR (QVELT |srec| 1)))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |newSysL|
                                (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                          |eqLD| |sysL| (QREFELT $ 139))
                                . #3#)
                          (EXIT
                           (SPADCALL (NREVERSE |resLD|)
                                     (|JBE;simpRec| |newSysL| |ind| $)
                                     (QREFELT $ 134))))))))))))) 

(SDEFUN |JBE;simplify;LSemR;21|
        ((|sys| |List| . #1=($)) (|jm| |SparseEchelonMatrix| JB . #1#)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|resSys| (|List| $)) (#2=#:G323 NIL) (|rec| NIL) (|i| NIL)
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
          (|neq| ($)) (#3=#:G322 NIL) (|eq| NIL) (|inds| (|List| JB)))
         (SEQ
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 140))
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
                         ((SPADCALL |neq| |eq| (QREFELT $ 141))
                          (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 128)) . #4#))
                         ('T
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (LIST |neq|)
                                           (LIST
                                            (QCAR
                                             (SPADCALL |jm| |i|
                                                       (QREFELT $ 128))))
                                           (QREFELT $ 125))
                                 1 (QREFELT $ 128))
                                . #4#)))
                        (COND
                         ((OR (NULL (QCAR |r|))
                              (EQUAL
                               (SPADCALL (|SPADfirst| (QCAR |r|))
                                         (QREFELT $ 143))
                               '|Indep|))
                          (EXIT (|error| "inconsistent system"))))
                        (EXIT
                         (LETT |sysL|
                               (SPADCALL (VECTOR |neq| |r| (LIST |i|)) |sysL|
                                         (QREFELT $ 133))
                               . #4#)))))))
               (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |sysL|)
             (VECTOR (SPADCALL (QREFELT $ 144))
                     (SPADCALL NIL 0 (QREFELT $ 145)) (CONS 1 NIL)))
            ('T
             (SEQ
              (LETT |sysL|
                    (|JBE;simpRec|
                     (SPADCALL (CONS (|function| |JBE;greaterLD|) $) |sysL|
                               (QREFELT $ 138))
                     |inds| $)
                    . #4#)
              (LETT |resSys| (SPADCALL (QREFELT $ 144)) . #4#)
              (LETT |resJM| (SPADCALL |inds| (LENGTH |sysL|) (QREFELT $ 145))
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
                                     (SPADCALL 1 (QREFELT $ 147))
                                     (QREFELT $ 148)))
                       (|error| "inconsistent system"))
                      ('T
                       (SEQ
                        (LETT |resSys|
                              (SPADCALL (QVELT |rec| 0) |resSys|
                                        (QREFELT $ 149))
                              . #4#)
                        (SPADCALL |resJM| |i| (QVELT |rec| 1) (QREFELT $ 150))
                        (EXIT
                         (LETT |resDep| (CONS (QVELT |rec| 2) |resDep|)
                               . #4#)))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (SPADCALL |resSys| (QREFELT $ 151)) |resJM|
                       (CONS 1 (NREVERSE |resDep|))))))))))) 

(SDEFUN |JBE;jetVariables;$L;22| ((|Phi| $) ($ |List| JB))
        (SPROG
         ((JV (|List| JB)) (#1=#:G338 NIL)
          (|pmindex| (|List| (|NonNegativeInteger|))) (#2=#:G335 NIL)
          (#3=#:G353 NIL) (|i| NIL) (#4=#:G352 NIL)
          (|mindex| (|List| (|Integer|))) (#5=#:G351 NIL) (#6=#:G350 NIL)
          (|pupindex| #7=(|Integer|)) (#8=#:G332 NIL) (|uindex| #7#)
          (#9=#:G329 NIL) (|xindex| #7#) (|arg| (|List| $)) (|typ| (|Symbol|))
          (#10=#:G326 NIL) (#11=#:G348 NIL) (|Ke| NIL) (#12=#:G349 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#13=#:G347 NIL)
          (#14=#:G346 NIL) (|LKernels| (|List| (|Kernel| $))))
         (SEQ (LETT JV NIL . #15=(|JBE;jetVariables;$L;22|))
              (LETT |LKernels| (SPADCALL |Phi| (QREFELT $ 156)) . #15#)
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
                                  (CONS (SPADCALL |Ke| (QREFELT $ 158)) #14#)
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
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 159))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 161))
                                        . #15#)
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#))
                              . #15#)
                        (LETT |arg| (SPADCALL |Ke| (QREFELT $ 162)) . #15#)
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Indep|)
                           (SEQ
                            (LETT |xindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 163))
                                            (QREFELT $ 164))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #9# |xindex| . #15#)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 165))
                                    JV)
                                   . #15#))))
                          ((EQUAL |typ| '|Dep|)
                           (SEQ
                            (LETT |uindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 163))
                                            (QREFELT $ 164))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #8# |uindex| . #15#)
                                       (|check_subtype2| (> #8# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #8#))
                                     (QREFELT $ 147))
                                    JV)
                                   . #15#))))
                          ('T
                           (SEQ
                            (LETT |pupindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 163))
                                            (QREFELT $ 164))
                                  . #15#)
                            (LETT |mindex|
                                  (PROGN
                                   (LETT #6# NIL . #15#)
                                   (SEQ (LETT |i| NIL . #15#)
                                        (LETT #5#
                                              (SPADCALL
                                               (SPADCALL |arg| (QREFELT $ 166))
                                               (QREFELT $ 166))
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
                                                 (SPADCALL |i| (QREFELT $ 164))
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
                                     |pmindex| (QREFELT $ 167))
                                    JV)
                                   . #15#)))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #15#))
                         . #15#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 108) (SPADCALL JV (QREFELT $ 168))
                         (QREFELT $ 170)))))) 

(SDEFUN |JBE;differentiate;$JB$;23| ((|fun| $) (|jv| JB) ($ $))
        (SPROG ((|x| (|Symbol|)))
               (SEQ
                (LETT |x| (SPADCALL |jv| (QREFELT $ 172))
                      |JBE;differentiate;$JB$;23|)
                (EXIT (SPADCALL |fun| |x| (QREFELT $ 173)))))) 

(SDEFUN |JBE;differentiate;$S$;24| ((|fun| $) (|x| |Symbol|) ($ $))
        (SPADCALL (SPADCALL |fun| (QREFELT $ 11)) |x| (QREFELT $ 175))) 

(SDEFUN |JBE;subst;$JB2$;25| ((|f| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG ((|res| ($)))
               (SEQ
                (LETT |res|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) |exp|
                                          (QREFELT $ 178))
                                (QREFELT $ 180))
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
          (LETT |var| (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) (QREFELT $ 181))
                . #2#)
          (LETT |md|
                (SPADCALL |fun| (SPADCALL |var| (QREFELT $ 182)) |var|
                          (QREFELT $ 183))
                . #2#)
          (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT $ 27)) . #2#)
          (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT $ 27)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |var| (APPEND |vrem| |vquo|) (QREFELT $ 67))
             (CONS 1 "failed"))
            ((SPADCALL (QCDR |md|) (QREFELT $ 184))
             (COND ((NULL |vquo|) (CONS 0 (|spadConstant| $ 45)))
                   (#3='T (CONS 1 "failed"))))
            (#3#
             (CONS 0
                   (SPADCALL (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT $ 15))
                             (QREFELT $ 185))))))))) 

(SDEFUN |JBE;kernel0| ((|op| |BasicOperator|) (|ls| |List| $) ($ $))
        (SPADCALL |op| |ls| (QREFELT $ 186))) 

(SDEFUN |JBE;sy2jbe| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 187))) 

(SDEFUN |JBE;hidedisp| ((|l| |List| $) ($ |OutputForm|))
        (SPROG
         ((|op| (|OutputForm|)) (#1=#:G379 NIL) (|e| NIL) (#2=#:G378 NIL)
          (#3=#:G377 NIL) (|k| NIL) (|args| (|List| (|OutputForm|)))
          (#4=#:G376 NIL) (|show| #5=(|Integer|)) (|num| #5#)
          (|name| (|Symbol|)))
         (SEQ
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 188)) (QREFELT $ 189))
                . #6=(|JBE;hidedisp|))
          (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #6#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 188)) (QREFELT $ 164))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #6#)
          (LETT |show|
                (SPADCALL (SPADCALL |l| (QREFELT $ 188)) (QREFELT $ 164))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #6#)
          (LETT |args| NIL . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #4# |show| . #6#) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ
                (LETT |args|
                      (SPADCALL |args|
                                (LIST
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 188))
                                           (QREFELT $ 190)))
                                (QREFELT $ 192))
                      . #6#)
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #6#)))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (+ |show| 1) . #6#) (LETT #3# |num| . #6#) G190
               (COND ((> |k| #3#) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #6#)))
               (LETT |k| (+ |k| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |l| (QREFELT $ 193))
            (LETT |op| (SPADCALL |name| (QREFELT $ 194)) . #6#))
           (#7='T
            (LETT |op|
                  (SPADCALL (SPADCALL |name| (QREFELT $ 194))
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
                                           (CONS (SPADCALL |e| (QREFELT $ 190))
                                                 #2#)
                                           . #6#)))
                                   (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 195))
                            (QREFELT $ 196))
                  . #6#)))
          (EXIT
           (COND ((NULL |args|) |op|)
                 (#7# (SPADCALL |op| |args| (QREFELT $ 197)))))))) 

(SDEFUN |JBE;hidediff| ((|l| |List| $) (|x| |Symbol|) ($ $))
        (SPROG
         ((|res| ($)) (|newarg| (|List| $)) (#1=#:G402 NIL) (|j| NIL)
          (#2=#:G401 NIL) (|da| ($)) (|k| NIL) (#3=#:G400 NIL) (|arg| NIL)
          (|op| (|BasicOperator|)) (|oldarg| (|List| $)) (#4=#:G383 NIL)
          (|diff| (|List| (|Integer|))) (#5=#:G399 NIL) (#6=#:G398 NIL)
          (|args| (|List| $)) (#7=#:G397 NIL) (|show| #8=(|Integer|))
          (|num| #8#) (|name| (|Symbol|)))
         (SEQ
          (LETT |oldarg| (SPADCALL |l| (QREFELT $ 198)) . #9=(|JBE;hidediff|))
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 188)) (QREFELT $ 189))
                . #9#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #9#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 188)) (QREFELT $ 164))
                . #9#)
          (EXIT
           (COND ((ZEROP |num|) (|spadConstant| $ 45))
                 ('T
                  (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #9#)
                       (LETT |show|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 188))
                                       (QREFELT $ 164))
                             . #9#)
                       (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #9#)
                       (LETT |args| (SPADCALL (QREFELT $ 144)) . #9#)
                       (SEQ (LETT |k| 1 . #9#) (LETT #7# |num| . #9#) G190
                            (COND ((|greater_SI| |k| #7#) (GO G191)))
                            (SEQ
                             (LETT |args|
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 188))
                                             |args| (QREFELT $ 149))
                                   . #9#)
                             (EXIT
                              (LETT |l| (SPADCALL |l| (QREFELT $ 166)) . #9#)))
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
                                           (CONS (SPADCALL |k| (QREFELT $ 164))
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
                                       (QREFELT $ 199))
                             . #9#)
                       (LETT |op| (SPADCALL |name| (QREFELT $ 200)) . #9#)
                       (SPADCALL |op| '|%specialDisp|
                                 (CONS (|function| |JBE;hidedisp|) $)
                                 (QREFELT $ 202))
                       (SPADCALL |op| '|%specialDiff|
                                 (CONS (|function| |JBE;hidediff|) $)
                                 (QREFELT $ 202))
                       (LETT |res| (|spadConstant| $ 45) . #9#)
                       (SEQ (LETT |arg| NIL . #9#) (LETT #3# |args| . #9#)
                            (LETT |k| |num| . #9#) G190
                            (COND
                             ((OR (< |k| 1) (ATOM #3#)
                                  (PROGN (LETT |arg| (CAR #3#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |da| (SPADCALL |arg| |x| (QREFELT $ 173))
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
                                                                        $ 203))
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
                                                                           204))
                                                                #2#)
                                                               . #9#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #9#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 (QREFELT $ 205))
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
                (LETT |op| (SPADCALL |f| (QREFELT $ 200))
                      . #1=(|JBE;function;SLNni$;31|))
                (SPADCALL |op| '|%specialDisp|
                          (CONS (|function| |JBE;hidedisp|) $) (QREFELT $ 202))
                (SPADCALL |op| '|%specialDiff|
                          (CONS (|function| |JBE;hidediff|) $) (QREFELT $ 202))
                (LETT |args|
                      (SPADCALL
                       (LIST (|JBE;sy2jbe| |f| $)
                             (SPADCALL (SPADCALL |arg| (QREFELT $ 206))
                                       (QREFELT $ 204))
                             (SPADCALL |show| (QREFELT $ 204)))
                       |arg| (QREFELT $ 205))
                      . #1#)
                (EXIT (|JBE;kernel0| |op| |args| $))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression| (#1=#:G461)
  (SPROG NIL
         (PROG (#2=#:G462)
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
  (SPROG
   ((|pv$| NIL) (#1=#:G459 NIL) (#2=#:G460 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleExpression|))
    (LETT |dv$| (LIST '|JetBundleExpression| DV$1) . #3#)
    (LETT $ (GETREFV 257) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Integer|) '(|Ring|))
                                        (|HasCategory| (|Integer|) '(|Group|))
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
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              . #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Group|)))
                                         (|HasCategory| (|Integer|) '(|Ring|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 65536))
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
              |JBE;simpOne;2$;15| (318 . =) (324 . >) (|OutputForm|)
              (330 . |coerce|) (335 . |assign|) (|Void|) (341 . |print|)
              (|GroebnerPackage| 24 (|IndexedExponents| 34) 34 12)
              (346 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (351 . |map|)
              (357 . |coerce|) (362 . |setUnion|) (|Mapping| 40 40 40)
              (|List| 40) (368 . |reduce|) (|List| 39) (375 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (381 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 126) (|:| |Depend| 40))
              (|List| 129) (387 . |first|) |JBE;solveFor;$JBU;26|
              (392 . |cons|) (398 . |concat!|) |JBE;subst;$JB2$;25|
              (404 . |removeDuplicates!|) (|Mapping| 65 129 129)
              (409 . |sort!|) (415 . |merge|) (422 . |allIndices|) (427 . =)
              (|Symbol|) (433 . |type|) (438 . |empty|) (442 . |new|)
              (|PositiveInteger|) (448 . U) (453 . <) (459 . |cons|)
              (465 . |setRow!|) (472 . |reverse!|) (|Union| '"failed" 122)
              (|Record| (|:| |Sys| 20) (|:| JM 85) (|:| |Depend| 152))
              |JBE;simplify;LSemR;21| (|List| 28) (477 . |tower|)
              (|BasicOperator|) (482 . |operator|) (487 . |has?|)
              (|Union| 201 '"failed") (493 . |property|) (499 . |argument|)
              (504 . |second|) (509 . |retract|) (514 . X) (519 . |rest|)
              (524 . P) (530 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (535 . |sort|) |JBE;jetVariables;$L;22| (541 . |name|)
              |JBE;differentiate;$S$;24| |JBE;differentiate;$JB$;23|
              (546 . |differentiate|) (552 . =) (|Equation| $$) (558 . =)
              (|Equation| $) (564 . |eval|) (570 . |retract|) (575 . |coerce|)
              (580 . |monicDivide|) (587 . |zero?|) (592 . -) (597 . |kernel|)
              (603 . |coerce|) (608 . |first|) (613 . |retract|)
              (618 . |coerce|) (|List| 109) (623 . |concat!|) (629 . |empty?|)
              (634 . |coerce|) (639 . |commaSeparate|) (644 . |sub|)
              (650 . |prefix|) (656 . |copy|) (661 . |first|)
              (667 . |operator|) (|None|) (672 . |setProperty|) (679 . |merge|)
              (685 . |coerce|) (690 . |append|) (696 . |#|)
              |JBE;function;SLNni$;31| (|Union| 209 '#1#) (|Fraction| 24)
              (|Union| 20 '#2="failed")
              (|Record| (|:| |coef| 24) (|:| |var| 28)) (|Union| 211 '#2#)
              (|List| 142) (|List| 157) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 24) (|Factored| $) (|Polynomial| 209) (|Fraction| 92)
              (|Fraction| 219) (|Fraction| 239) (|Union| 222 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 24 $)
              (|Record| (|:| |mat| 229) (|:| |vec| (|Vector| 24))) (|Matrix| $)
              (|Vector| $) (|Matrix| 24)
              (|Record| (|:| |var| 28) (|:| |exponent| 24)) (|Union| 230 '#2#)
              (|Mapping| $ $) (|List| 232)
              (|Record| (|:| |val| $) (|:| |exponent| 24)) (|Union| 234 '#2#)
              (|Mapping| $ 20) (|List| 236) (|Union| 239 '#1#)
              (|Polynomial| 24) (|SegmentBinding| $)
              (|Record| (|:| |coef| 20) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 242 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Polynomial| $) (|Union| 28 '#1#) (|List| 179)
              (|Union| 142 '#1#) (|Union| 24 '#1#)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 39))
              (|Record| (|:| |DSys| 20) (|:| |JVars| 124))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 701 |zerosOf| 707 |zeroOf| 734 |zero?| 761 |whittakerW| 766
              |whittakerM| 773 |weierstrassZeta| 780 |weierstrassSigma| 787
              |weierstrassPPrime| 794 |weierstrassPInverse| 801 |weierstrassP|
              808 |weberE| 815 |variables| 821 |univariate| 831 |unitNormal|
              837 |unitCanonical| 842 |unit?| 847 |tower| 852 |tanh| 862 |tan|
              867 |symbol| 872 |summation| 877 |subtractIfCan| 889 |subst| 895
              |struveL| 921 |struveH| 927 |squareFreePart| 933 |squareFree| 938
              |sqrt| 943 |sortLD| 948 |solveFor| 953 |smaller?| 959 |sizeLess?|
              965 |sinh| 971 |sin| 976 |simplify| 981 |simpOne| 987 |simpMod|
              992 |setNotation| 1005 |sech| 1010 |sec| 1015 |sample| 1020
              |rootsOf| 1024 |rootSum| 1051 |rootOf| 1058 |riemannZeta| 1085
              |retractIfCan| 1090 |retract| 1125 |rem| 1160 |reducedSystem|
              1166 |reduceMod| 1177 |reduce| 1183 |recip| 1188 |quo| 1193
              |product| 1199 |principalIdeal| 1211 |prime?| 1216 |polylog| 1221
              |polygamma| 1227 |pi| 1233 |permutation| 1237 |patternMatch| 1243
              |paren| 1257 |orderDim| 1267 |order| 1274 |opposite?| 1279
              |operators| 1285 |operator| 1290 |one?| 1295 |odd?| 1300
              |numerator| 1305 |numerJP| 1310 |numer| 1315 |numIndVar| 1320
              |numDepVar| 1324 |nthRoot| 1328 |multiEuclidean| 1334 |minPoly|
              1340 |meixnerM| 1345 |meijerG| 1353 |map| 1362 |mainKernel| 1368
              |lommelS2| 1373 |lommelS1| 1380 |log| 1387 |li| 1392 |lerchPhi|
              1397 |legendreQ| 1404 |legendreP| 1411 |leadingDer| 1418
              |lcmCoef| 1423 |lcm| 1429 |latex| 1440 |lambertW| 1445
              |laguerreL| 1450 |kummerU| 1457 |kummerM| 1464 |kernels| 1471
              |kernel| 1481 |kelvinKer| 1493 |kelvinKei| 1499 |kelvinBer| 1505
              |kelvinBei| 1511 |jetVariables| 1517 |jacobiZeta| 1522
              |jacobiTheta| 1528 |jacobiSn| 1534 |jacobiP| 1540 |jacobiMatrix|
              1548 |jacobiDn| 1559 |jacobiCn| 1565 |isTimes| 1571 |isPower|
              1576 |isPlus| 1581 |isMult| 1586 |isExpt| 1591 |is?| 1608 |inv|
              1620 |integral| 1625 |hypergeometricF| 1637 |hermiteH| 1644
              |height| 1650 |hashUpdate!| 1655 |hash| 1661 |hankelH2| 1666
              |hankelH1| 1672 |ground?| 1678 |ground| 1683 |getNotation| 1688
              |gcdPolynomial| 1692 |gcd| 1698 |function| 1709 |fresnelS| 1716
              |fresnelC| 1721 |freeOf?| 1726 |formalDiff2| 1744 |formalDiff|
              1758 |factorials| 1776 |factorial| 1787 |factor| 1792
              |extractSymbol| 1797 |extendedEuclidean| 1802 |exquo| 1815
              |expressIdealMember| 1821 |exp| 1827 |even?| 1832 |eval| 1837
              |euclideanSize| 1998 |erfi| 2003 |erf| 2008 |elt| 2013
              |ellipticPi| 2109 |ellipticK| 2116 |ellipticF| 2121 |ellipticE|
              2127 |divide| 2138 |distribute| 2144 |dimension| 2155 |dilog|
              2162 |digamma| 2167 |differentiate| 2172 |denominator| 2204
              |denom| 2209 |definingPolynomial| 2214 |dSubst| 2219 |csch| 2226
              |csc| 2231 |coth| 2236 |cot| 2241 |cosh| 2246 |cos| 2251
              |convert| 2256 |const?| 2276 |conjugate| 2281 |commutator| 2287
              |coerce| 2293 |class| 2368 |charthRoot| 2373 |charlierC| 2378
              |characteristic| 2385 |box| 2389 |binomial| 2399 |besselY| 2405
              |besselK| 2411 |besselJ| 2417 |besselI| 2423 |belong?| 2429
              |autoReduce| 2434 |atanh| 2439 |atan| 2444 |associates?| 2449
              |asinh| 2455 |asin| 2460 |asech| 2465 |asec| 2470 |applyQuote|
              2475 |annihilate?| 2511 |angerJ| 2517 |algtower| 2523
              |airyBiPrime| 2533 |airyBi| 2538 |airyAiPrime| 2543 |airyAi| 2548
              |acsch| 2553 |acsc| 2558 |acoth| 2563 |acot| 2568 |acosh| 2573
              |acos| 2578 |abs| 2583 ^ 2588 |Zero| 2618 X 2622 U 2631 |Si| 2640
              |Shi| 2645 P 2650 |One| 2672 |Gamma| 2676 |Ei| 2687 D 2692 |Ci|
              2718 |Chi| 2723 |Beta| 2728 = 2734 / 2740 - 2752 + 2763 * 2769)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3 4
                                  5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0 0
                                  0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |Algebra&| |FullyLinearlyExplicitRingOver&|
                |PartialDifferentialRing&| |Module&| NIL |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL |Group&| NIL
                |ExpressionSpace&| |AbelianMonoid&| |Monoid&| NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 24) (|Field|)
                 (|EuclideanDomain|) (|JetBundleFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 209) (|LeftOreRing|) (|Algebra| $$) (|Algebra| 24)
                 (|FullyLinearlyExplicitRingOver| 24)
                 (|PartialDifferentialRing| 142) (|Module| 209)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$) (|Module| 24)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 24) (|BiModule| 209 209)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 24 24)
                 (|RightModule| 209) (|LeftModule| 209) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|LeftModule| 24)
                 (|RightModule| 24) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|Group|)
                 (|FullyPatternMatchable| 24) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 24) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 24)
                 (|Patternable| 24) (|Evalable| $$) (|SetCategory|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 24) (|Type|) (|RetractableTo| 142)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 34 $$)
                 (|RetractableTo| 34) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 109) (|RetractableTo| 209)
                 (|RetractableTo| 222) (|RetractableTo| 239)
                 (|ConvertibleTo| 215) (|ConvertibleTo| 216)
                 (|ConvertibleTo| 217))
              (|makeByteWordVec2| 256
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
                                    1 74 109 0 110 2 109 0 0 0 111 1 109 112 0
                                    113 1 114 74 74 115 2 117 76 116 74 118 1
                                    33 109 0 119 2 40 0 0 0 120 3 122 40 121 0
                                    40 123 2 0 85 20 124 125 2 127 126 0 24 128
                                    1 130 129 0 131 2 130 0 129 0 133 2 130 0 0
                                    0 134 1 40 0 0 136 2 130 0 137 0 138 3 130
                                    0 137 0 0 139 1 127 39 0 140 2 0 65 0 0 141
                                    1 6 142 0 143 0 76 0 144 2 127 0 39 24 145
                                    1 6 0 146 147 2 6 65 0 0 148 2 76 0 2 0 149
                                    3 127 112 0 24 126 150 1 76 0 0 151 1 0 155
                                    0 156 1 34 157 0 158 2 157 65 0 142 159 2
                                    157 160 0 142 161 1 34 76 0 162 1 76 2 0
                                    163 1 0 24 0 164 1 6 0 146 165 1 76 0 0 166
                                    2 6 0 146 40 167 1 39 0 0 168 2 39 0 169 0
                                    170 1 6 142 0 172 2 7 0 0 142 175 2 7 65 0
                                    0 176 2 177 0 2 2 178 2 0 0 0 179 180 1 0
                                    28 0 181 1 12 0 34 182 3 12 102 0 0 34 183
                                    1 12 65 0 184 1 0 0 0 185 2 5 0 157 20 186
                                    1 5 0 142 187 1 76 2 0 188 1 0 142 0 189 1
                                    0 109 0 190 2 191 0 0 0 192 1 76 65 0 193 1
                                    142 109 0 194 1 109 0 20 195 2 109 0 0 0
                                    196 2 109 0 0 20 197 1 76 0 0 198 2 76 0 0
                                    33 199 1 157 0 142 200 3 157 0 0 142 201
                                    202 2 22 0 0 0 203 1 0 0 24 204 2 76 0 0 0
                                    205 1 76 33 0 206 2 0 65 0 0 1 1 0 20 245 1
                                    2 0 20 92 142 1 1 0 20 92 1 1 0 20 0 1 2 0
                                    20 0 142 1 1 0 0 245 1 2 0 0 92 142 1 1 0 0
                                    92 1 1 0 0 0 1 2 0 0 0 142 1 1 0 65 0 105 3
                                    0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 213 0 1 1 0 213 20
                                    1 2 1 220 0 28 1 1 0 252 0 1 1 0 0 0 1 1 0
                                    65 0 1 1 0 155 0 156 1 0 155 20 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 85 20 1 2 0 0 0 240 1 2 0 0 0
                                    142 1 2 0 57 0 0 1 2 0 0 0 179 1 3 0 0 0
                                    155 20 1 2 0 0 0 247 1 3 0 0 0 6 0 135 2 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 218 0 1 1
                                    0 0 0 1 1 0 20 20 1 2 0 57 0 6 132 2 0 65 0
                                    0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    153 20 85 154 1 0 0 0 106 2 0 20 20 20 1 3
                                    0 153 20 85 20 1 1 0 112 142 1 1 0 0 0 1 1
                                    0 0 0 1 0 0 0 1 1 0 20 245 1 2 0 20 92 142
                                    1 1 0 20 92 1 1 0 20 0 1 2 0 20 0 142 1 3 0
                                    0 0 92 142 1 1 0 0 245 1 2 0 0 92 142 1 1 0
                                    0 92 1 1 0 0 0 1 2 0 0 0 142 1 1 0 0 0 1 1
                                    2 208 0 1 1 1 223 0 1 1 6 238 0 1 1 0 246 0
                                    1 1 0 248 0 1 1 0 249 0 1 1 0 30 0 31 1 2
                                    209 0 1 1 1 222 0 1 1 6 239 0 1 1 0 28 0
                                    181 1 0 142 0 189 1 0 24 0 164 1 0 6 0 1 2
                                    0 0 0 0 1 2 6 226 227 228 1 1 6 229 227 1 2
                                    0 20 20 20 1 1 0 0 0 1 1 0 57 0 61 2 0 0 0
                                    0 1 2 0 0 0 142 1 2 0 0 0 240 1 1 0 241 20
                                    1 1 0 65 0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0
                                    1 2 0 0 0 0 1 3 11 224 0 216 224 1 3 12 225
                                    0 217 225 1 1 0 0 0 1 1 0 0 20 1 3 0 33 20
                                    85 33 88 1 0 33 0 62 2 0 65 0 0 1 1 0 214 0
                                    1 1 0 157 157 1 1 0 65 0 1 1 17 65 0 1 1 0
                                    0 0 1 1 0 17 0 44 1 6 14 0 19 0 0 146 1 0 0
                                    146 1 2 0 0 0 24 1 2 0 210 20 0 1 1 16 92
                                    28 1 4 0 0 0 0 0 0 1 5 17 0 20 20 20 20 0 1
                                    2 0 0 232 28 1 1 0 246 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0
                                    253 0 0 1 1 0 0 20 1 2 0 0 0 0 1 1 0 254 0
                                    1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 1 0 155 0 1 1 0 155 20 1 2 0 0
                                    157 0 1 2 0 0 157 20 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 39 0 171 2
                                    0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0
                                    0 0 1 1 0 85 20 1 2 0 85 20 124 125 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 15 210 0 1 1 6 235 0 1 1
                                    14 210 0 1 1 14 212 0 1 2 6 231 0 157 1 2 6
                                    231 0 142 1 1 15 231 0 1 2 0 65 0 142 1 2 0
                                    65 0 157 1 1 0 0 0 1 2 0 0 0 240 1 2 0 0 0
                                    142 1 3 17 0 20 20 0 1 2 0 0 0 0 1 1 0 33 0
                                    1 2 0 256 256 0 1 1 0 255 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 65 0 1 1 0 24 0 1 0 0 142 1 2
                                    0 92 92 92 1 2 0 0 0 0 56 1 0 0 20 1 3 0 0
                                    142 20 33 207 1 0 0 0 1 1 0 0 0 1 2 0 65 0
                                    142 1 2 0 65 0 0 1 2 0 65 0 6 1 3 0 250 0
                                    146 85 1 3 0 251 20 146 85 1 2 0 20 20 146
                                    1 2 0 0 0 146 1 2 0 0 0 40 1 1 0 0 0 1 2 0
                                    0 0 142 1 1 0 0 0 1 1 0 218 0 1 1 0 85 85 1
                                    3 0 243 0 0 0 1 2 0 244 0 0 1 2 0 57 0 0 59
                                    2 0 210 20 0 1 1 0 0 0 1 1 17 65 0 1 2 8 0
                                    0 213 1 2 8 0 0 142 1 1 8 0 0 1 4 8 0 0 214
                                    20 142 1 4 8 0 0 157 0 142 1 4 6 0 0 213 40
                                    233 1 4 6 0 0 142 33 236 1 4 6 0 0 213 40
                                    237 1 4 6 0 0 142 33 232 1 3 0 0 0 155 20 1
                                    3 0 0 0 28 0 1 2 0 0 0 247 1 3 0 0 0 0 0 1
                                    2 0 0 0 179 180 3 0 0 0 20 20 1 3 0 0 0 213
                                    233 1 3 0 0 0 142 236 1 3 0 0 0 213 237 1 3
                                    0 0 0 142 232 1 3 0 0 0 214 237 1 3 0 0 0
                                    214 233 1 3 0 0 0 157 236 1 3 0 0 0 157 232
                                    1 1 0 33 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 157
                                    0 0 1 2 0 0 157 0 1 4 0 0 157 0 0 0 1 6 0 0
                                    157 0 0 0 0 0 1 5 0 0 157 0 0 0 0 1 7 0 0
                                    157 0 0 0 0 0 0 1 9 0 0 157 0 0 0 0 0 0 0 0
                                    1 8 0 0 157 0 0 0 0 0 0 0 1 10 0 0 157 0 0
                                    0 0 0 0 0 0 0 1 2 0 0 157 20 1 3 0 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 2 0 102 0 0 1 2 0 0 0 0 1 1 0 0 0 1 3 0
                                    33 20 85 33 86 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    6 174 3 0 0 0 213 40 1 3 0 0 0 142 33 1 2 0
                                    0 0 142 173 2 0 0 0 213 1 1 0 0 0 1 1 1 14
                                    0 1 1 16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 8 215 0 1 1 9 216 0 1 1 10 217 0 1 1 1
                                    0 218 1 1 0 65 0 1 2 7 0 0 0 1 2 7 0 0 0 1
                                    1 1 0 219 1 1 1 0 221 1 1 1 0 222 1 1 6 0
                                    239 1 1 0 0 14 16 1 0 0 17 54 1 0 5 0 11 1
                                    0 0 5 10 1 0 0 209 1 1 0 0 28 29 1 0 0 142
                                    1 1 0 0 6 9 1 0 0 0 1 1 0 0 24 204 1 0 109
                                    0 190 1 0 33 0 1 1 4 57 0 1 3 0 0 0 0 0 1 0
                                    0 33 1 1 0 0 0 1 1 0 0 20 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 65 157 1 1 0 20 20 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 0 142 0 1 3 0 0 142 0 0 1 5
                                    0 0 142 0 0 0 0 1 4 0 0 142 0 0 0 1 2 0 0
                                    142 20 1 2 0 65 0 0 1 2 0 0 0 0 1 1 1 155
                                    20 1 1 1 155 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 24 1 2 0 0 0 209 1 2 0 0 0
                                    33 51 2 0 0 0 146 1 0 0 0 45 0 0 0 1 1 0 0
                                    146 1 0 0 0 1 1 0 0 146 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 146 33 1 1 0 0 33 1 1 0 0 40 1 2 0
                                    0 146 40 1 0 0 0 36 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 0 142 33 1 3 0 0 0 213 40 1 2
                                    0 0 0 213 1 2 0 0 0 142 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 65 0 0 141 2 1 0 14 14 15
                                    2 0 0 0 0 60 2 0 0 0 0 1 1 0 0 0 185 2 0 0
                                    0 0 53 2 3 0 0 24 1 2 0 0 209 0 1 2 0 0 0
                                    209 1 2 0 0 0 0 52 2 0 0 24 0 1 2 0 0 33 0
                                    1 2 0 0 146 0 1)))))
           '|lookupComplete|)) 
