
(SDEFUN |PERM;smallerElement?| ((|a| S) (|b| S) ($ |Boolean|))
        (COND
         ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
          (SPADCALL |a| |b| (QREFELT $ 9)))
         ((|HasCategory| (QREFELT $ 6) '(|Finite|))
          (< (SPADCALL |a| (QREFELT $ 11)) (SPADCALL |b| (QREFELT $ 11))))
         ('T NIL))) 

(SDEFUN |PERM;rotateCycle| ((|cyc| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G136 NIL) (#2=#:G135 NIL) (|minpos| (|Integer|)) (|min| (S))
          (#3=#:G139 NIL) (|i| NIL))
         (SEQ (LETT |min| (|SPADfirst| |cyc|)) (LETT |minpos| 1)
              (SEQ (LETT |i| 2) (LETT #3# (SPADCALL |cyc| (QREFELT $ 14))) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|PERM;smallerElement?|
                        (SPADCALL |cyc| |i| (QREFELT $ 15)) |min| $)
                       (SEQ (LETT |min| (SPADCALL |cyc| |i| (QREFELT $ 15)))
                            (EXIT (LETT |minpos| |i|)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |minpos| 1) |cyc|)
                     ('T
                      (SPADCALL
                       (SPADCALL |cyc|
                                 (PROG1
                                     (LETT #2#
                                           (+ (- (LENGTH |cyc|) |minpos|) 1))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 18))
                       (SPADCALL |cyc|
                                 (PROG1 (LETT #1# (- |minpos| 1))
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 19))
                       (QREFELT $ 20)))))))) 

(SDEFUN |PERM;coerceCycle| ((|lls| |List| (|List| S)) ($ $))
        (SPROG ((|perm| ($)) (#1=#:G143 NIL) (|lists| NIL))
               (SEQ (LETT |perm| (|spadConstant| $ 16))
                    (SEQ (LETT |lists| NIL) (LETT #1# (REVERSE |lls|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |lists| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |perm|
                                 (SPADCALL (SPADCALL |lists| (QREFELT $ 21))
                                           |perm| (QREFELT $ 22)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |perm|)))) 

(SDEFUN |PERM;smallerCycle?|
        ((|cyca| |List| S) (|cycb| |List| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G149 NIL) (#2=#:G150 NIL) (#3=#:G151 NIL) (|i| NIL)
          (#4=#:G152 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH |cyca|) (LENGTH |cycb|) (QREFELT $ 23))
             (< (LENGTH |cyca|) (LENGTH |cycb|)))
            ('T
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |j| NIL) (LETT #4# |cycb|) (LETT |i| NIL)
                     (LETT #3# |cyca|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)
                           (ATOM #4#) (PROGN (LETT |j| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |i| |j| (QREFELT $ 24))
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2# (|PERM;smallerElement?| |i| |j| $))
                                 (GO #5=#:G148)))
                          (GO #6=#:G145))))))
                     (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                     (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #1#))
              (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PERM;shorterCycle?|
        ((|cyca| |List| S) (|cycb| |List| S) ($ |Boolean|))
        (< (LENGTH |cyca|) (LENGTH |cycb|))) 

(SDEFUN |PERM;permord|
        ((|pa| |Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))
         (|pb| |Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G159 NIL) (#2=#:G160 NIL) (#3=#:G161 NIL) (|i| NIL)
          (#4=#:G162 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |j| NIL) (LETT #4# (QCAR |pb|)) (LETT |i| NIL)
                   (LETT #3# (QCAR |pa|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL) (ATOM #4#)
                         (PROGN (LETT |j| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |j| (QREFELT $ 25))
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2# (|PERM;smallerCycle?| |i| |j| $))
                               (GO #5=#:G158)))
                        (GO #6=#:G156))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#)))) (GO G190)
                   G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (< (LENGTH (QCAR |pa|)) (LENGTH (QCAR |pb|))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PERM;coerceToCycle|
        ((|p| $) (|doSorting?| |Boolean|) ($ |List| (|List| S)))
        (SPROG
         ((|cycles| (|List| (|List| S))) (|nextCycle| (|List| S))
          (|im| #1=(|List| S)) (|nextEltInCycle| (S)) (|preim| #1#)
          (|i| (|Integer|)) (|firstEltInCycle| (S)))
         (SEQ (LETT |preim| (SPADCALL |p| 1 (QREFELT $ 26)))
              (LETT |im| (SPADCALL |p| 2 (QREFELT $ 26))) (LETT |cycles| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |preim|))) (GO G191)))
                   (SEQ (LETT |firstEltInCycle| (|SPADfirst| |preim|))
                        (LETT |nextCycle|
                              (SPADCALL |firstEltInCycle| (QREFELT $ 27)))
                        (LETT |preim| (CDR |preim|))
                        (LETT |nextEltInCycle| (|SPADfirst| |im|))
                        (LETT |im| (CDR |im|))
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |nextEltInCycle| |firstEltInCycle|
                                          (QREFELT $ 24)))
                               (GO G191)))
                             (SEQ
                              (LETT |nextCycle|
                                    (CONS |nextEltInCycle| |nextCycle|))
                              (LETT |i|
                                    (SPADCALL |nextEltInCycle| |preim|
                                              (QREFELT $ 28)))
                              (LETT |preim|
                                    (SPADCALL |preim| |i| (QREFELT $ 29)))
                              (LETT |nextEltInCycle|
                                    (SPADCALL |im| |i| (QREFELT $ 15)))
                              (EXIT
                               (LETT |im| (SPADCALL |im| |i| (QREFELT $ 29)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (LETT |nextCycle| (REVERSE |nextCycle|))
                        (EXIT
                         (COND
                          ((NULL (NULL (CDR |nextCycle|)))
                           (SEQ
                            (COND
                             (|doSorting?|
                              (COND
                               ((OR
                                 (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                                 (|HasCategory| (QREFELT $ 6) '(|Finite|)))
                                (LETT |nextCycle|
                                      (|PERM;rotateCycle| |nextCycle| $))))))
                            (EXIT
                             (LETT |cycles| (CONS |nextCycle| |cycles|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                (|doSorting?|
                 (COND
                  ((OR (|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                       (|HasCategory| (QREFELT $ 6) '(|Finite|)))
                   (SPADCALL (CONS (|function| |PERM;smallerCycle?|) $)
                             |cycles| (QREFELT $ 32)))
                  ('T
                   (SPADCALL (CONS (|function| |PERM;shorterCycle?|) $)
                             |cycles| (QREFELT $ 32)))))
                ('T |cycles|)))))) 

(SDEFUN |PERM;duplicates?| ((|ls| |List| S) ($ |Boolean|))
        (SPROG ((|x| (|List| S)) (#1=#:G183 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |x| (SPADCALL |ls| (QREFELT $ 33)))
                      (SEQ G190 (COND ((NULL (NULL (NULL |x|))) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (|SPADfirst| |x|) (CDR |x|)
                                         (QREFELT $ 34))
                               (PROGN (LETT #1# 'T) (GO #2=#:G182)))
                              ('T (LETT |x| (CDR |x|))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |PERM;listRepresentation;$R;9|
        ((|p| $)
         ($
          . #1=(|Record| (|:| |preimage| (|List| S))
                         (|:| |image| (|List| S)))))
        (SPROG ((|s| #1#))
               (LETT |s|
                     (CONS (SPADCALL |p| 1 (QREFELT $ 26))
                           (SPADCALL |p| 2 (QREFELT $ 26)))))) 

(SDEFUN |PERM;coercePreimagesImages;L$;10|
        ((|preImageAndImage| |List| (|List| S)) ($ $))
        (SPROG
         ((|image| (|List| S)) (|preImage| (|List| S)) (#1=#:G192 NIL)
          (|i| NIL) (#2=#:G193 NIL) (|pi| NIL))
         (SEQ (LETT |preImage| NIL) (LETT |image| NIL)
              (SEQ (LETT |pi| NIL)
                   (LETT #2# (SPADCALL |preImageAndImage| 2 (QREFELT $ 37)))
                   (LETT |i| NIL)
                   (LETT #1# (SPADCALL |preImageAndImage| 1 (QREFELT $ 37)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |pi| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |pi| (QREFELT $ 24))
                       (SEQ (LETT |preImage| (CONS |i| |preImage|))
                            (EXIT (LETT |image| (CONS |pi| |image|))))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (VECTOR |preImage| |image|))))) 

(SDEFUN |PERM;movedPoints;$S;11| ((|p| $) ($ |Set| S))
        (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 40))) 

(SDEFUN |PERM;degree;$Nni;12| ((|p| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 42))) 

(SDEFUN |PERM;=;2$B;13| ((|p| $) (|q| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G204 NIL) (#2=#:G205 NIL) (|pos| (|Integer|)) (#3=#:G206 NIL)
          (|i| NIL) (|preimq| #4=(|List| S)) (|preimp| #4#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LENGTH (LETT |preimp| (SPADCALL |p| 1 (QREFELT $ 26))))
                       (LENGTH (LETT |preimq| (SPADCALL |q| 1 (QREFELT $ 26))))
                       (QREFELT $ 23))
             NIL)
            ('T
             (SEQ
              (SEQ (LETT |i| 1) (LETT #3# (SPADCALL |preimp| (QREFELT $ 14)))
                   G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |pos|
                          (SPADCALL (SPADCALL |preimp| |i| (QREFELT $ 15))
                                    |preimq| (QREFELT $ 28)))
                    (EXIT
                     (COND
                      ((EQL |pos| 0) (PROGN (LETT #2# NIL) (GO #5=#:G203)))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |i|
                                      (QREFELT $ 15))
                            (SPADCALL (SPADCALL |q| 2 (QREFELT $ 26)) |pos|
                                      (QREFELT $ 15))
                            (QREFELT $ 24))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# NIL) (GO #5#)))
                            (GO #6=#:G198)))))
                        #6# (EXIT #1#))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PERM;orbit;$SS;14| ((|p| $) (|el| S) ($ |Set| S))
        (SPROG ((|el2| (S)) (|out| (|Set| S)))
               (SEQ
                (LETT |out|
                      (SPADCALL (SPADCALL |el| (QREFELT $ 27)) (QREFELT $ 45)))
                (LETT |el2| (SPADCALL |p| |el| (QREFELT $ 46)))
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |el2| |el| (QREFELT $ 24))) (GO G191)))
                     (SEQ (SPADCALL |el2| |out| (QREFELT $ 47))
                          (EXIT
                           (LETT |el2| (SPADCALL |p| |el2| (QREFELT $ 46)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |out|)))) 

(SDEFUN |PERM;cyclePartition;$P;15| ((|p| $) ($ |Partition|))
        (SPROG ((#1=#:G214 NIL) (|c| NIL) (#2=#:G213 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |c| NIL)
                       (LETT #1# (|PERM;coerceToCycle| |p| NIL $)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (LENGTH |c|) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 51))))) 

(SDEFUN |PERM;order;$Nni;16| ((|p| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G215 NIL) (|ord| (|Integer|)))
               (SEQ
                (LETT |ord|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 52)) (QREFELT $ 53))
                        (QREFELT $ 54))
                       (QREFELT $ 56)))
                (EXIT
                 (PROG1 (LETT #1# |ord|)
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))))) 

(SDEFUN |PERM;sign;$I;17| ((|p| $) ($ |Integer|))
        (COND ((SPADCALL |p| (QREFELT $ 58)) 1) ('T -1))) 

(SDEFUN |PERM;even?;$B;18| ((|p| $) ($ |Boolean|))
        (EVENP
         (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26)))
            (SPADCALL |p| (QREFELT $ 60))))) 

(SDEFUN |PERM;odd?;$B;19| ((|p| $) ($ |Boolean|))
        (ODDP
         (- (LENGTH (SPADCALL |p| 1 (QREFELT $ 26)))
            (SPADCALL |p| (QREFELT $ 60))))) 

(SDEFUN |PERM;<;2$B;20| ((|pa| $) (|pb| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G226 NIL) (#2=#:G227 NIL) (#3=#:G228 NIL) (|i| NIL)
          (#4=#:G229 NIL) (|j| NIL) (|pbcyc| #5=(|List| (|List| S)))
          (|pacyc| #5#))
         (SEQ
          (EXIT
           (SEQ (LETT |pacyc| (|PERM;coerceToCycle| |pa| 'T $))
                (LETT |pbcyc| (|PERM;coerceToCycle| |pb| 'T $))
                (SEQ
                 (EXIT
                  (SEQ (LETT |j| NIL) (LETT #4# |pbcyc|) (LETT |i| NIL)
                       (LETT #3# |pacyc|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)
                             (ATOM #4#) (PROGN (LETT |j| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |i| |j| (QREFELT $ 25))
                           (PROGN
                            (LETT #1#
                                  (PROGN
                                   (LETT #2# (|PERM;smallerCycle?| |i| |j| $))
                                   (GO #6=#:G225)))
                            (GO #7=#:G223))))))
                       (LETT #3# (PROG1 (CDR #3#) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))
                 #7# (EXIT #1#))
                (EXIT
                 (< (SPADCALL |pacyc| (QREFELT $ 62))
                    (SPADCALL |pbcyc| (QREFELT $ 62))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PERM;coerce;L$;21| ((|lls| |List| (|List| S)) ($ $))
        (|PERM;coerceCycle| |lls| $)) 

(SDEFUN |PERM;coerce;L$;22| ((|ls| |List| S) ($ $))
        (SPADCALL |ls| (QREFELT $ 21))) 

(SDEFUN |PERM;sort;2L;23| ((|inList| |List| $) ($ |List| $))
        (SPROG
         ((|outList| (|List| $)) (#1=#:G242 NIL) (|rec| NIL)
          (|ownList|
           (|List|
            (|Record| (|:| |cycl| (|List| (|List| S))) (|:| |permut| $))))
          (#2=#:G241 NIL) (|sigma| NIL))
         (SEQ
          (COND
           ((NULL (|HasCategory| (QREFELT $ 6) '(|OrderedSet|)))
            (COND
             ((NULL (|HasCategory| (QREFELT $ 6) '(|Finite|)))
              (EXIT |inList|)))))
          (LETT |ownList| NIL)
          (SEQ (LETT |sigma| NIL) (LETT #2# |inList|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |sigma| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |ownList|
                       (SPADCALL
                        (CONS (|PERM;coerceToCycle| |sigma| 'T $) |sigma|)
                        |ownList| (QREFELT $ 68)))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (LETT |ownList|
                (SPADCALL (CONS (|function| |PERM;permord|) $) |ownList|
                          (QREFELT $ 70)))
          (LETT |outList| NIL)
          (SEQ (LETT |rec| NIL) (LETT #1# |ownList|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outList|
                       (SPADCALL (QCDR |rec|) |outList| (QREFELT $ 72)))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |outList| (QREFELT $ 73)))))) 

(SDEFUN |PERM;coerce;$Of;24| ((|p| $) ($ |OutputForm|))
        (SPROG
         ((|outfmL| (|List| (|OutputForm|)))
          (|outcycL| (|List| (|OutputForm|))) (#1=#:G250 NIL) (|elt| NIL)
          (#2=#:G249 NIL) (|cycle| NIL) (|cycles| (|List| (|List| S))))
         (SEQ (LETT |cycles| (|PERM;coerceToCycle| |p| 'T $))
              (LETT |outfmL| NIL)
              (SEQ (LETT |cycle| NIL) (LETT #2# |cycles|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |cycle| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |outcycL| NIL)
                        (SEQ (LETT |elt| NIL) (LETT #1# |cycle|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |elt| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |outcycL|
                                     (CONS (SPADCALL |elt| (QREFELT $ 76))
                                           |outcycL|))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |outfmL|
                               (CONS
                                (SPADCALL
                                 (SPADCALL (REVERSE |outcycL|) (QREFELT $ 77))
                                 (QREFELT $ 78))
                                |outfmL|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |outfmL|) (SPADCALL 1 (QREFELT $ 79)))
                     ((NULL (CDR |outfmL|)) (|SPADfirst| |outfmL|))
                     ('T (SPADCALL (REVERSE |outfmL|) (QREFELT $ 80)))))))) 

(SDEFUN |PERM;cycles;L$;25| ((|vs| |List| (|List| S)) ($ $))
        (|PERM;coerceCycle| |vs| $)) 

(SDEFUN |PERM;cycle;L$;26| ((|ls| |List| S) ($ $))
        (COND ((< (LENGTH |ls|) 2) (|spadConstant| $ 16))
              ((|PERM;duplicates?| |ls| $)
               (|error| "cycle: the input contains duplicates"))
              ('T
               (VECTOR |ls|
                       (SPADCALL (CDR |ls|)
                                 (SPADCALL (|SPADfirst| |ls|) (QREFELT $ 27))
                                 (QREFELT $ 83)))))) 

(SDEFUN |PERM;coerceListOfPairs;L$;27| ((|loP| |List| (|List| S)) ($ $))
        (SPROG
         ((|im| (|List| S)) (|preim| (|List| S)) (#1=#:G263 NIL) (|pair| NIL))
         (SEQ (LETT |preim| NIL) (LETT |im| NIL)
              (SEQ (LETT |pair| NIL) (LETT #1# |loP|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |pair| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (|SPADfirst| |pair|)
                                 (SPADCALL |pair| (QREFELT $ 84))
                                 (QREFELT $ 24))
                       (SEQ (LETT |preim| (CONS (|SPADfirst| |pair|) |preim|))
                            (EXIT
                             (LETT |im|
                                   (CONS (SPADCALL |pair| (QREFELT $ 84))
                                         |im|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((OR (|PERM;duplicates?| |preim| $)
                    (OR (|PERM;duplicates?| |im| $)
                        (SPADCALL (SPADCALL |preim| (QREFELT $ 45))
                                  (SPADCALL |im| (QREFELT $ 45))
                                  (QREFELT $ 85))))
                (EXIT
                 (|error|
                  "coerceListOfPairs: the input cannot be interpreted as a permutation"))))
              (EXIT (VECTOR |preim| |im|))))) 

(SDEFUN |PERM;*;3$;28| ((|q| $) (|p| $) ($ $))
        (SPROG
         ((|imOfq| #1=(|List| S)) (|preimOfq| #1#) (|imOfqp| (|List| S))
          (|preimOfqp| (|List| S)) (|el| (S)) (|j| (|Integer|)) (#2=#:G274 NIL)
          (|i| NIL) (|imOfp| #3=(|Vector| S)) (|preimOfp| #3#))
         (SEQ
          (LETT |preimOfp|
                (SPADCALL (SPADCALL |p| 1 (QREFELT $ 26)) (QREFELT $ 88)))
          (LETT |imOfp|
                (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) (QREFELT $ 88)))
          (LETT |preimOfq| (SPADCALL |q| 1 (QREFELT $ 26)))
          (LETT |imOfq| (SPADCALL |q| 2 (QREFELT $ 26))) (LETT |preimOfqp| NIL)
          (LETT |imOfqp| NIL)
          (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |preimOfp|)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (LETT |j|
                      (SPADCALL (SPADCALL |imOfp| |i| (QREFELT $ 89))
                                |preimOfq| (QREFELT $ 28)))
                (EXIT
                 (COND
                  ((EQL |j| 0)
                   (SEQ
                    (LETT |preimOfqp|
                          (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 89))
                                |preimOfqp|))
                    (EXIT
                     (LETT |imOfqp|
                           (CONS (SPADCALL |imOfp| |i| (QREFELT $ 89))
                                 |imOfqp|)))))
                  ('T
                   (SEQ (LETT |el| (SPADCALL |imOfq| |j| (QREFELT $ 15)))
                        (COND
                         ((SPADCALL |el|
                                    (SPADCALL |preimOfp| |i| (QREFELT $ 89))
                                    (QREFELT $ 24))
                          (SEQ
                           (LETT |preimOfqp|
                                 (CONS (SPADCALL |preimOfp| |i| (QREFELT $ 89))
                                       |preimOfqp|))
                           (EXIT (LETT |imOfqp| (CONS |el| |imOfqp|))))))
                        (LETT |preimOfq|
                              (SPADCALL |preimOfq| |j| (QREFELT $ 29)))
                        (EXIT
                         (LETT |imOfq|
                               (SPADCALL |imOfq| |j| (QREFELT $ 29)))))))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (VECTOR (SPADCALL |preimOfqp| |preimOfq| (QREFELT $ 83))
                   (SPADCALL |imOfqp| |imOfq| (QREFELT $ 83))))))) 

(PUT '|PERM;One;$;29| '|SPADreplace| '(XLAM NIL (MAKEARR1 2 NIL))) 

(SDEFUN |PERM;One;$;29| (($ $)) (MAKEARR1 2 NIL)) 

(SDEFUN |PERM;inv;2$;30| ((|p| $) ($ $))
        (VECTOR (SPADCALL |p| 2 (QREFELT $ 26))
                (SPADCALL |p| 1 (QREFELT $ 26)))) 

(SDEFUN |PERM;eval;$2S;31| ((|p| $) (|el| S) ($ S))
        (SPROG ((|pos| (|Integer|)))
               (SEQ
                (LETT |pos|
                      (SPADCALL |el| (SPADCALL |p| 1 (QREFELT $ 26))
                                (QREFELT $ 28)))
                (EXIT
                 (COND ((EQL |pos| 0) |el|)
                       ('T
                        (SPADCALL (SPADCALL |p| 2 (QREFELT $ 26)) |pos|
                                  (QREFELT $ 15)))))))) 

(SDEFUN |PERM;elt;$2S;32| ((|p| $) (|el| S) ($ S))
        (SPADCALL |p| |el| (QREFELT $ 46))) 

(SDEFUN |PERM;numberOfCycles;$Nni;33| ((|p| $) ($ |NonNegativeInteger|))
        (LENGTH (|PERM;coerceToCycle| |p| NIL $))) 

(SDEFUN |PERM;coerceImages;L$;34| ((|image| |List| S) ($ $))
        (SPROG
         ((|preImage| (|List| S)) (#1=#:G285 NIL) (|i| NIL) (#2=#:G284 NIL))
         (SEQ
          (LETT |preImage|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |image| (QREFELT $ 14)))
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 92)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38)))))) 

(SDEFUN |PERM;coerceImages;L$;35| ((|image| |List| S) ($ $))
        (SPROG
         ((|preImage| (|List| S)) (#1=#:G287 NIL) (#2=#:G292 NIL) (|i| NIL)
          (#3=#:G291 NIL))
         (SEQ
          (LETT |preImage|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (SPADCALL |image| (QREFELT $ 14)))
                      G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i|)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT $ 94))
                               #3#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL (LIST |preImage| |image|) (QREFELT $ 38)))))) 

(SDEFUN |PERM;fixedPoints;$S;36| ((|p| $) ($ |Set| S))
        (SPADCALL (SPADCALL |p| (QREFELT $ 41)) (QREFELT $ 95))) 

(SDEFUN |PERM;cyclePartition;$P;37| ((|p| $) ($ |Partition|))
        (SPROG ((|pt| (|Partition|)) (#1=#:G298 NIL) (|c| NIL) (#2=#:G297 NIL))
               (SEQ
                (LETT |pt|
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |c| NIL)
                             (LETT #1# (|PERM;coerceToCycle| |p| NIL $)) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #2# (CONS (LENGTH |c|) #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 51)))
                (EXIT
                 (SPADCALL |pt|
                           (SPADCALL
                            (SPADCALL
                             (LIST
                              (SPADCALL (SPADCALL |p| (QREFELT $ 96))
                                        (QREFELT $ 42)))
                             (QREFELT $ 51))
                            (QREFELT $ 97))
                           (QREFELT $ 98)))))) 

(DECLAIM (NOTINLINE |Permutation;|)) 

(DEFUN |Permutation| (#1=#:G303)
  (SPROG NIL
         (PROG (#2=#:G304)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Permutation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Permutation;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Permutation|)))))))))) 

(DEFUN |Permutation;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G302 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Permutation| DV$1))
          (LETT $ (GETREFV 103))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|Finite|)))
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|OrderedSet|)))
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|IntegerNumberSystem|)))))))
          (|haddProp| |$ConstructorCache| '|Permutation| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Vector| (|List| |#1|)))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV $ 93
                      (CONS (|dispatchFunction| |PERM;coerceImages;L$;34|)
                            $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 93
                       (CONS (|dispatchFunction| |PERM;coerceImages;L$;35|) $))
             (QSETREFV $ 96
                       (CONS (|dispatchFunction| |PERM;fixedPoints;$S;36|) $))
             (QSETREFV $ 52
                       (CONS (|dispatchFunction| |PERM;cyclePartition;$P;37|)
                             $)))))
          $))) 

(MAKEPROP '|Permutation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|) (0 . <)
              (|PositiveInteger|) (6 . |lookup|) (|Integer|) (|List| 6)
              (11 . |maxIndex|) (16 . |elt|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PERM;One;$;29|) $))
              (|NonNegativeInteger|) (22 . |last|) (28 . |first|)
              (34 . |concat|) |PERM;cycle;L$;26| |PERM;*;3$;28| (40 . ~=)
              (46 . ~=) (52 . ~=) (58 . |elt|) (64 . |list|) (69 . |position|)
              (75 . |delete|) (|Mapping| 8 13 13) (|List| 13) (81 . |sort|)
              (87 . |copy|) (92 . |member?|)
              (|Record| (|:| |preimage| 13) (|:| |image| 13))
              |PERM;listRepresentation;$R;9| (98 . |elt|)
              |PERM;coercePreimagesImages;L$;10| (|Set| 6) (104 . |construct|)
              |PERM;movedPoints;$S;11| (109 . |#|) |PERM;degree;$Nni;12|
              |PERM;=;2$B;13| (114 . |set|) |PERM;eval;$2S;31|
              (119 . |insert!|) |PERM;orbit;$SS;14| (|List| 12) (|Partition|)
              (125 . |partition|) |PERM;cyclePartition;$P;15| (130 . |convert|)
              (135 . |removeDuplicates|) (|List| $) (140 . |lcm|)
              |PERM;order;$Nni;16| |PERM;even?;$B;18| |PERM;sign;$I;17|
              |PERM;numberOfCycles;$Nni;33| |PERM;odd?;$B;19|
              (145 . |maxIndex|) |PERM;<;2$B;20| |PERM;coerce;L$;21|
              |PERM;coerce;L$;22| (|Record| (|:| |cycl| 31) (|:| |permut| $$))
              (|List| 66) (150 . |cons|) (|Mapping| 8 66 66) (156 . |sort|)
              (|List| $$) (162 . |cons|) (168 . |reverse|) |PERM;sort;2L;23|
              (|OutputForm|) (173 . |coerce|) (178 . |blankSeparate|)
              (183 . |paren|) (188 . |outputForm|) (193 . |hconcat|)
              |PERM;coerce;$Of;24| |PERM;cycles;L$;25| (198 . |append|)
              (204 . |second|) (209 . ~=) |PERM;coerceListOfPairs;L$;27|
              (|Vector| 6) (215 . |construct|) (220 . |elt|) |PERM;inv;2$;30|
              |PERM;elt;$2S;32| (226 . |coerce|) (231 . |coerceImages|)
              (236 . |index|) (241 . |complement|) (246 . |fixedPoints|)
              (251 . |conjugate|) (256 . +) (|Union| $ '"failed") (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 262 |sort| 268 |smaller?| 273 |sign| 279 |sample| 284
              |rightRecip| 288 |rightPower| 293 |recip| 305 |order| 310 |orbit|
              315 |one?| 321 |odd?| 326 |numberOfCycles| 331 |movedPoints| 336
              |min| 341 |max| 347 |listRepresentation| 353 |leftRecip| 358
              |leftPower| 363 |latex| 375 |inv| 380 |hashUpdate!| 385 |hash|
              391 |fixedPoints| 396 |even?| 401 |eval| 406 |elt| 412 |degree|
              418 |cycles| 423 |cyclePartition| 428 |cycle| 433 |conjugate| 438
              |commutator| 444 |coercePreimagesImages| 450 |coerceListOfPairs|
              455 |coerceImages| 460 |coerce| 465 ^ 480 |One| 498 >= 502 > 508
              = 514 <= 520 < 526 / 532 * 538)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 2 0 2 0 0 0 0 0 2))
                 (CONS
                  '#(NIL |Group&| NIL NIL |MagmaWithUnit&| |OrderedSet&|
                     |Magma&| NIL |SetCategory&| NIL NIL |BasicType&| NIL
                     |PartialOrder&|)
                  (CONS
                   '#((|PermutationCategory| 6) (|Group|) (|Monoid|)
                      (|SemiGroup|) (|MagmaWithUnit|) (|OrderedSet|) (|Magma|)
                      (|Comparable|) (|SetCategory|) (|unitsKnown|)
                      (|TwoSidedRecip|) (|BasicType|) (|CoercibleTo| 75)
                      (|PartialOrder|))
                   (|makeByteWordVec2| 102
                                       '(2 6 8 0 0 9 1 6 10 0 11 1 13 12 0 14 2
                                         13 6 0 12 15 2 13 0 0 17 18 2 13 0 0
                                         17 19 2 13 0 0 0 20 2 12 8 0 0 23 2 6
                                         8 0 0 24 2 13 8 0 0 25 2 7 13 0 12 26
                                         1 13 0 6 27 2 13 12 6 0 28 2 13 0 0 12
                                         29 2 31 0 30 0 32 1 13 0 0 33 2 13 8 6
                                         0 34 2 31 13 0 12 37 1 39 0 13 40 1 39
                                         17 0 42 1 39 0 13 45 2 39 0 6 0 47 1
                                         50 0 49 51 1 50 49 0 53 1 49 0 0 54 1
                                         12 0 55 56 1 31 12 0 62 2 67 0 66 0 68
                                         2 67 0 69 0 70 2 71 0 2 0 72 1 71 0 0
                                         73 1 6 75 0 76 1 75 0 55 77 1 75 0 0
                                         78 1 75 0 12 79 1 75 0 55 80 2 13 0 0
                                         0 83 1 13 6 0 84 2 39 8 0 0 85 1 87 0
                                         13 88 2 87 6 0 12 89 1 6 0 12 92 1 0 0
                                         13 93 1 6 0 10 94 1 39 0 0 95 1 0 39 0
                                         96 1 50 0 0 97 2 50 0 0 0 98 2 0 8 0 0
                                         1 1 0 55 55 74 2 2 8 0 0 1 1 0 12 0 59
                                         0 0 0 1 1 0 99 0 1 2 0 0 0 17 1 2 0 0
                                         0 10 1 1 0 99 0 1 1 0 17 0 57 2 0 39 0
                                         6 48 1 0 8 0 1 1 0 8 0 61 1 0 17 0 60
                                         1 0 39 0 41 2 2 0 0 0 1 2 2 0 0 0 1 1
                                         0 35 0 36 1 0 99 0 1 2 0 0 0 17 1 2 0
                                         0 0 10 1 1 0 101 0 1 1 0 0 0 90 2 0
                                         100 100 0 1 1 0 102 0 1 1 1 39 0 96 1
                                         0 8 0 58 2 0 6 0 6 46 2 0 6 0 6 91 1 0
                                         17 0 43 1 0 0 31 82 1 0 50 0 52 1 0 0
                                         13 21 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 31
                                         38 1 0 0 31 86 1 3 0 13 93 1 0 0 13 65
                                         1 0 0 31 64 1 0 75 0 81 2 0 0 0 12 1 2
                                         0 0 0 17 1 2 0 0 0 10 1 0 0 0 16 2 2 8
                                         0 0 1 2 2 8 0 0 1 2 0 8 0 0 44 2 2 8 0
                                         0 1 2 0 8 0 0 63 2 0 0 0 0 1 2 0 0 0 0
                                         22)))))
           '|lookupComplete|)) 
