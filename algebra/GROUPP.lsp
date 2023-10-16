
(SDEFUN |GROUPP;groupPresentation;LL$;1|
        ((|gens1| |List| (|NonNegativeInteger|))
         (|rels1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((#1=#:G163 NIL) (|r| NIL) (#2=#:G162 NIL)
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |g| (SPADCALL |gens1| (QREFELT $ 9)))
              (EXIT
               (CONS |g|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |r| NIL) (LETT #1# |rels1|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL (NULL |r|)) (LETT #2# (CONS |r| #2#))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |GROUPP;groupPresentation;L$;2|
        ((|gens1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))) (LETT |rels2| NIL)
              (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;$;3| (($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| NIL) (LETT |rels1| NIL)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;mapGen|
        ((|a| |Integer|)
         (|ms| |List|
          (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                    (|:| |NewGen| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((#1=#:G175 NIL) (#2=#:G176 NIL) (|m| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |m| NIL) (LETT #2# |ms|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((EQL (ABS |a|) (QCAR |m|))
                          (PROGN (LETT #1# (QCDR |m|)) (GO #3=#:G174))))
                        (EXIT
                         (COND
                          ((EQL (ABS |a|) (- (QCAR |m|)))
                           (PROGN (LETT #1# (- (QCDR |m|))) (GO #3#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (|error|
                   (SPADCALL
                    (LIST "cant map " (STRINGIMAGE |a|) " in refactor")
                    (QREFELT $ 16)))
                  (EXIT |a|)))
                #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;refactor;2$;5| ((|a| $) ($ $))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|))) (#1=#:G193 NIL) (|gn| NIL)
          (#2=#:G192 NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|newRel| (|List| (|Integer|))) (|newEle| (|Integer|))
          (#3=#:G191 NIL) (|ele| NIL) (#4=#:G190 NIL) (|rel| NIL)
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (#5=#:G188 NIL) (|g| NIL) (#6=#:G189 NIL))
         (SEQ (LETT |gms| NIL)
              (SEQ (LETT |gn| 1)
                   (LETT #6# (SPADCALL (QCAR |a|) (QREFELT $ 19)))
                   (LETT |g| NIL)
                   (LETT #5# (SPADCALL (QCAR |a|) (QREFELT $ 17))) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL)
                         (|greater_SI| |gn| #6#))
                     (GO G191)))
                   (SEQ (LETT |gm| (CONS |g| |gn|))
                        (EXIT
                         (LETT |gms| (SPADCALL |gms| |gm| (QREFELT $ 22)))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT |gn| (|inc_SI| |gn|))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |rels1| NIL)
              (SEQ (LETT |rel| NIL) (LETT #4# (QCDR |a|)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |newRel| NIL)
                        (SEQ (LETT |ele| NIL) (LETT #3# |rel|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ele| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newEle| (|GROUPP;mapGen| |ele| |gms| $))
                              (EXIT
                               (LETT |newRel|
                                     (SPADCALL |newRel| |newEle|
                                               (QREFELT $ 25)))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |newRel| (QREFELT $ 26)))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |gens1|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |gn| 1)
                          (LETT #1# (SPADCALL (QCAR |a|) (QREFELT $ 19))) G190
                          (COND ((|greater_SI| |gn| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |gn| #2#))))
                          (LETT |gn| (|inc_SI| |gn|)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;=;2$B;6| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|brs| #1=(|List| (|List| (|Integer|)))) (|ars| #1#) (#2=#:G198 NIL)
          (|bgs| #3=(|List| (|NonNegativeInteger|))) (|ags| #3#) (|br| ($))
          (|ar| ($)))
         (SEQ
          (EXIT
           (SEQ (LETT |ar| (SPADCALL |a| (QREFELT $ 27)))
                (LETT |br| (SPADCALL |b| (QREFELT $ 27)))
                (LETT |ags| (SPADCALL (QCAR |ar|) (QREFELT $ 17)))
                (LETT |bgs| (SPADCALL (QCAR |br|) (QREFELT $ 17)))
                (COND
                 ((SPADCALL (SPADCALL |ags| (QREFELT $ 29))
                            (SPADCALL |bgs| (QREFELT $ 29)) (QREFELT $ 31))
                  (PROGN (LETT #2# NIL) (GO #4=#:G197))))
                (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT $ 32)))
                (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT $ 32)))
                (EXIT
                 (SPADCALL (SPADCALL |ars| (QREFELT $ 34))
                           (SPADCALL |brs| (QREFELT $ 34)) (QREFELT $ 35)))))
          #4# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGen| ((|i2| |Integer|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G202 NIL) (|n| (|OutputForm|)) (|letters| (|String|))
          (|i| #2=(|Integer|)) (|suffix| #3=(|Integer|))
          (|#G18| (|Record| (|:| |quotient| #3#) (|:| |remainder| #2#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G18| (DIVIDE2 (ABS |i2|) 25))
             (LETT |suffix| (QCAR |#G18|))
             (LETT |i| (QCDR |#G18|))
             |#G18|)
            (LETT |letters| "eabcdfghijklmnopqrstuvwxyz")
            (LETT |n|
                  (SPADCALL (SPADCALL |letters| (+ |i| 1) (QREFELT $ 38))
                            (QREFELT $ 40)))
            (COND
             ((SPADCALL |suffix| 0 (QREFELT $ 41))
              (LETT |n|
                    (SPADCALL |n| (SPADCALL (+ |suffix| 1) (QREFELT $ 42))
                              (QREFELT $ 43)))))
            (COND
             ((< |i2| 0)
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL "-" (QREFELT $ 44)) |n|
                               (QREFELT $ 43)))
               (GO #4=#:G201))))
            (EXIT |n|)))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputRel| ((|r| |List| (|Integer|)) ($ |OutputForm|))
        (SPROG
         ((|seperator| #1=(|OutputForm|)) (|eleout| #1#)
          (|newterm| (|OutputForm|)) (#2=#:G207 NIL) (|ele| NIL))
         (SEQ (LETT |eleout| (SPADCALL "" (QREFELT $ 44)))
              (LETT |seperator| (SPADCALL " " (QREFELT $ 44)))
              (SEQ (LETT |ele| NIL) (LETT #2# |r|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ele| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |newterm| (|GROUPP;outputGen| |ele| $))
                        (LETT |eleout|
                              (SPADCALL (LIST |eleout| |seperator| |newterm|)
                                        (QREFELT $ 45)))
                        (EXIT
                         (LETT |seperator| (SPADCALL "*" (QREFELT $ 44)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |eleout|)))) 

(SDEFUN |GROUPP;outputRelList|
        ((|i2| |List| (|List| (|Integer|))) ($ |OutputForm|))
        (SPROG
         ((#1=#:G212 NIL) (|rels1| (|List| (|OutputForm|))) (#2=#:G213 NIL)
          (|r| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rels1| NIL)
                (SEQ (LETT |r| NIL) (LETT #2# |i2|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |rels1|
                             (SPADCALL |rels1| (|GROUPP;outputRel| |r| $)
                                       (QREFELT $ 47)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |rels1|) 0 (QREFELT $ 41))
                  (PROGN
                   (LETT #1# (SPADCALL |rels1| (QREFELT $ 48)))
                   (GO #3=#:G211))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputGenList|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((#1=#:G218 NIL) (|gens1| (|List| (|OutputForm|))) (#2=#:G219 NIL)
          (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| NIL)
                (SEQ (LETT |p| NIL) (LETT #2# |ps|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |gens1|
                             (SPADCALL |gens1| (|GROUPP;outputGen| |p| $)
                                       (QREFELT $ 47)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |gens1|) 0 (QREFELT $ 49))
                  (PROGN
                   (LETT #1# (SPADCALL |gens1| (QREFELT $ 50)))
                   (GO #3=#:G217))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;indexesOfRelUsingGen|
        ((|s| $) (|gen| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G226 NIL) (|rel| NIL)
          (#2=#:G227 NIL) (|reln| NIL) (|r| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |res| NIL) (LETT |r| (QCDR |s|))
              (SEQ (LETT |reln| 1) (LETT #2# (LENGTH |r|)) (LETT |rel| NIL)
                   (LETT #1# |r|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL)
                         (|greater_SI| |reln| #2#))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |gen| |rel| (QREFELT $ 51))
                      (LETT |res| (SPADCALL |res| |reln| (QREFELT $ 52)))))
                    (EXIT
                     (COND
                      ((SPADCALL |gen| 0 (QREFELT $ 49))
                       (COND
                        ((SPADCALL (- |gen|) |rel| (QREFELT $ 51))
                         (LETT |res|
                               (SPADCALL |res| |reln| (QREFELT $ 52)))))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |reln| (|inc_SI| |reln|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;removeGen|
        ((|gens1| |PrimitiveArray| (|NonNegativeInteger|))
         (|val| |NonNegativeInteger|)
         ($ |PrimitiveArray| (|NonNegativeInteger|)))
        (SPADCALL |val| |gens1| (QREFELT $ 53))) 

(SDEFUN |GROUPP;removeGen2|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG ((#1=#:G232 NIL) (|rel| NIL) (#2=#:G231 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (- |val|)
                                         (SPADCALL |val| |rel| (QREFELT $ 54))
                                         (QREFELT $ 54))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GROUPP;replaceGen|
        ((|rels1| |List| (|List| (|Integer|))) (|val1| |NonNegativeInteger|)
         (|val2| |Integer|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|e| (|Integer|)) (#1=#:G241 NIL) (|ele| NIL) (#2=#:G240 NIL)
          (|rel| NIL))
         (SEQ (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #2# |rels1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL)
                        (SEQ (LETT |ele| NIL) (LETT #1# |rel|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |e| (ABS |ele|))
                                  (COND ((EQL |e| |val1|) (LETT |e| |val2|)))
                                  (COND ((< |ele| 0) (LETT |e| (- |e|))))
                                  (EXIT
                                   (LETT |rel2|
                                         (SPADCALL |rel2| |e|
                                                   (QREFELT $ 25)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |rels2|
                               (SPADCALL |rels2| |rel2| (QREFELT $ 26)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |rels2|)))) 

(SDEFUN |GROUPP;TTRemoveGeneratorIfIdentity|
        ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G247 NIL)
          (|toBeRemoved| (|NonNegativeInteger|)) (#2=#:G248 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |toBeRemoved| 0)
                (SEQ (LETT |rel| NIL) (LETT #2# |rels1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 1)
                         (COND
                          ((EQL |toBeRemoved| 0)
                           (LETT |toBeRemoved| (ABS (|SPADfirst| |rel|)))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |toBeRemoved| 0) (PROGN (LETT #1# |s|) (GO #3=#:G246))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST (SPADCALL "simplify: generator '" (QREFELT $ 44))
                          (|GROUPP;outputGen| |toBeRemoved| $)
                          (SPADCALL "' is identity so remove it"
                                    (QREFELT $ 44)))
                    (QREFELT $ 45))
                   (QREFELT $ 56))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $))
                (LETT |rels1| (|GROUPP;removeGen2| |rels1| |toBeRemoved| $))
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| $)
                            (QREFELT $ 56))))
                (EXIT (CONS |gens1| |rels1|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRenameGenerator| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G256 NIL)
          (|replaceFrom| (|NonNegativeInteger|)) (|replaceTo| (|Integer|))
          (#2=#:G257 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |replaceFrom| 0) (LETT |replaceTo| 0)
                (SEQ (LETT |rel| NIL) (LETT #2# |rels1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 2)
                         (COND
                          ((EQL |replaceFrom| 0)
                           (SEQ
                            (LETT |replaceTo| (SPADCALL |rel| (QREFELT $ 57)))
                            (LETT |replaceFrom| (ABS (|SPADfirst| |rel|)))
                            (COND
                             ((SPADCALL (|SPADfirst| |rel|) 0 (QREFELT $ 41))
                              (LETT |replaceTo| (- |replaceTo|))))
                            (EXIT
                             (COND
                              ((EQL |replaceFrom| (ABS |replaceTo|))
                               (LETT |replaceFrom| 0)))))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |replaceFrom| 0) (PROGN (LETT #1# |s|) (GO #3=#:G255))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST (SPADCALL "simplify: generator '" (QREFELT $ 44))
                          (|GROUPP;outputGen| |replaceFrom| $)
                          (SPADCALL "' is replaced by '" (QREFELT $ 44))
                          (|GROUPP;outputGen| |replaceTo| $)
                          (SPADCALL "'" (QREFELT $ 44)))
                    (QREFELT $ 45))
                   (QREFELT $ 56))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |replaceFrom| $))
                (LETT |rels1|
                      (|GROUPP;replaceGen| |rels1| |replaceFrom| |replaceTo|
                       $))
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| $)
                            (QREFELT $ 56))))
                (EXIT (CONS |gens1| |rels1|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveEmpty| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G262 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |rel|))
                       (LETT |rels2|
                             (SPADCALL |rels2| |rel| (QREFELT $ 26)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTRemoveZero| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |gens1| (|GROUPP;removeGen| |gens1| 0 $))
              (LETT |rels1| (|GROUPP;removeGen2| |rels1| 0 $))
              (EXIT (CONS |gens1| |rels1|))))) 

(SDEFUN |GROUPP;TTRemoveEleTimesInverse| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|lastele| (|Integer|)) (|changed| (|Boolean|)) (#1=#:G280 NIL)
          (|ele| NIL) (#2=#:G279 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL) (LETT |changed| NIL)
              (SEQ (LETT |rel| NIL) (LETT #2# |rels1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL) (LETT |lastele| 0)
                        (SEQ (LETT |ele| NIL) (LETT #1# |rel|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL (ABS |ele|) (ABS |lastele|))
                                 (COND
                                  ((SPADCALL (SPADCALL |ele| (QREFELT $ 58))
                                             (SPADCALL |lastele|
                                                       (QREFELT $ 58))
                                             (QREFELT $ 59))
                                   (SEQ
                                    (COND
                                     (|trace|
                                      (SPADCALL
                                       (SPADCALL
                                        (LIST
                                         (SPADCALL "simplify: generator '"
                                                   (QREFELT $ 44))
                                         (|GROUPP;outputGen| |ele| $)
                                         (SPADCALL
                                          "' is adjacent to its inverse"
                                          (QREFELT $ 44)))
                                        (QREFELT $ 45))
                                       (QREFELT $ 56))))
                                    (LETT |changed| 'T)
                                    (EXIT (LETT |lastele| 0))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                      (LETT |rel2|
                                            (SPADCALL |rel2| |lastele|
                                                      (QREFELT $ 25)))))
                                    (EXIT (LETT |lastele| |ele|))))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                    (LETT |rel2|
                                          (SPADCALL |rel2| |lastele|
                                                    (QREFELT $ 25)))))
                                  (EXIT (LETT |lastele| |ele|)))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (COND
                         ((SPADCALL |lastele| 0 (QREFELT $ 59))
                          (LETT |rel2|
                                (SPADCALL |rel2| |lastele| (QREFELT $ 25)))))
                        (EXIT
                         (COND
                          ((NULL (NULL |rel2|))
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel2| (QREFELT $ 26)))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (COND
               (|trace|
                (COND
                 (|changed|
                  (SPADCALL (|GROUPP;outputRelList| |rels2| $)
                            (QREFELT $ 56))))))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;invertRelation|
        ((|relationIn| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|relationOut| (|List| (|Integer|))) (#1=#:G284 NIL) (|ele| NIL))
         (SEQ (LETT |relationOut| NIL)
              (SEQ (LETT |ele| NIL) (LETT #1# |relationIn|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |relationOut| (CONS (- |ele|) |relationOut|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;cycleRelation|
        ((|relationIn| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|relationOut| (|List| (|Integer|))))
               (SEQ
                (LETT |relationOut|
                      (SPADCALL (CDR |relationIn|) (|SPADfirst| |relationIn|)
                                (QREFELT $ 25)))
                (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;relationEquivalent|
        ((|relA| |List| (|Integer|)) (|relB| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G294 NIL) (|relBCycle| (|List| (|Integer|))) (#2=#:G295 NIL)
          (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |relA|) (LENGTH |relB|) (QREFELT $ 60))
              (PROGN (LETT #1# NIL) (GO #3=#:G293))))
            (COND
             ((SPADCALL |relA| |relB| (QREFELT $ 61))
              (PROGN (LETT #1# 'T) (GO #3#))))
            (COND
             ((SPADCALL |relA| (|GROUPP;invertRelation| |relB| $)
                        (QREFELT $ 61))
              (PROGN (LETT #1# 'T) (GO #3#))))
            (LETT |relBCycle| (SPADCALL |relB| (QREFELT $ 62)))
            (SEQ (LETT |n| 1) (LETT #2# (LENGTH |relA|)) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ (LETT |relBCycle| (|GROUPP;cycleRelation| |relBCycle| $))
                      (COND
                       ((SPADCALL |relA| |relBCycle| (QREFELT $ 61))
                        (PROGN (LETT #1# 'T) (GO #3#))))
                      (EXIT
                       (COND
                        ((SPADCALL |relA|
                                   (|GROUPP;invertRelation| |relBCycle| $)
                                   (QREFELT $ 61))
                         (PROGN (LETT #1# 'T) (GO #3#))))))
                 (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveDuplicateRelation| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|include| (|Boolean|))
          (#1=#:G306 NIL) (|relb| NIL) (#2=#:G307 NIL) (|nrelb| NIL)
          (#3=#:G304 NIL) (|rela| NIL) (#4=#:G305 NIL) (|nrela| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |nrela| 1) (LETT #4# (LENGTH |rels1|))
                   (LETT |rela| NIL) (LETT #3# |rels1|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rela| (CAR #3#)) NIL)
                         (|greater_SI| |nrela| #4#))
                     (GO G191)))
                   (SEQ (LETT |include| 'T)
                        (SEQ (LETT |nrelb| 1) (LETT #2# (LENGTH |rels1|))
                             (LETT |relb| NIL) (LETT #1# |rels1|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |relb| (CAR #1#)) NIL)
                                   (|greater_SI| |nrelb| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |nrela| |nrelb| (QREFELT $ 49))
                                 (COND
                                  ((|GROUPP;relationEquivalent| |rela| |relb|
                                    $)
                                   (SEQ (LETT |include| NIL)
                                        (EXIT
                                         (COND
                                          (|trace|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                "TTRemoveDuplicateRelation duplicate found "
                                                (QREFELT $ 44))
                                               (SPADCALL |rela| (QREFELT $ 63))
                                               (QREFELT $ 43))
                                              (SPADCALL "=" (QREFELT $ 44))
                                              (QREFELT $ 43))
                                             (SPADCALL |relb| (QREFELT $ 63))
                                             (QREFELT $ 43))
                                            (QREFELT $ 56))))))))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |nrelb| (|inc_SI| |nrelb|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          (|include|
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rela| (QREFELT $ 26)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |nrela| (|inc_SI| |nrela|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTMinimiseInverses| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|numNonInverts| #1=(|NonNegativeInteger|)) (|numInverts| #1#)
          (#2=#:G314 NIL) (|ele| NIL) (#3=#:G313 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
              (LETT |rels2| NIL)
              (SEQ (LETT |rel| NIL) (LETT #3# |rels1|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |numInverts| 0) (LETT |numNonInverts| 0)
                        (SEQ (LETT |ele| NIL) (LETT #2# |rel|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< |ele| 0)
                                 (LETT |numInverts| (+ |numInverts| 1)))
                                ('T
                                 (LETT |numNonInverts|
                                       (+ |numNonInverts| 1))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |numInverts| |numNonInverts|
                                     (QREFELT $ 49))
                           (LETT |rels2|
                                 (SPADCALL |rels2|
                                           (|GROUPP;invertRelation| |rel| $)
                                           (QREFELT $ 26))))
                          ('T
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel| (QREFELT $ 26)))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;generatorOccurrences|
        ((|rel| |List| (|Integer|)) (|gen| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G321 NIL) (|g| NIL))
               (SEQ (LETT |res| 0)
                    (SEQ (LETT |g| NIL) (LETT #1# |rel|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (COND ((EQL |g| |gen|) (LETT |res| (+ |res| 1))))
                              (EXIT
                               (COND
                                ((SPADCALL |gen| 0 (QREFELT $ 49))
                                 (COND
                                  ((EQL |g| (- |gen|))
                                   (LETT |res| (+ |res| 1))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |GROUPP;removeRelations|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G327 NIL) (|rel| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |rel| NIL) (LETT #1# |rels1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |val| |rel| (QREFELT $ 51)))
                       (COND
                        ((NULL (SPADCALL (- |val|) |rel| (QREFELT $ 51)))
                         (LETT |res|
                               (SPADCALL |res| |rel| (QREFELT $ 26)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;TTSubstitute| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| #1=(|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|newRel| (|List| (|Integer|))) (#2=#:G351 NIL) (|x| (|Integer|))
          (|replacement| (|List| (|Integer|))) (|postr| (|List| (|Integer|)))
          (|restr| (|List| #3=(|Integer|))) (|prer| (|List| (|Integer|)))
          (|genInverted| #4=(|Boolean|)) (|found| #4#) (#5=#:G349 NIL)
          (|genToBeRemoved| #6=(|NonNegativeInteger|)) (|n2| #6#)
          (|r2| (|List| (|Integer|))) (|n1| #6#) (|r1| (|List| #3#))
          (|n3| (|NonNegativeInteger|)) (|r3| (|List| (|Integer|)))
          (|indexes| (|List| (|NonNegativeInteger|))) (#7=#:G350 NIL) (|g| NIL)
          (|rs| #1#) (|gs| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |gs| (SPADCALL (QCAR |s|) (QREFELT $ 17)))
                (LETT |rs| (QCDR |s|)) (LETT |r1| NIL) (LETT |r2| NIL)
                (LETT |n1| 0) (LETT |n2| 0) (LETT |genToBeRemoved| 0)
                (SEQ (LETT |g| NIL) (LETT #7# |gs|) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |indexes|
                            (|GROUPP;indexesOfRelUsingGen| |s| |g| $))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |indexes| (QREFELT $ 64)) 2)
                         (COND
                          ((EQL |genToBeRemoved| 0)
                           (SEQ (LETT |genToBeRemoved| |g|)
                                (LETT |r1|
                                      (SPADCALL |rs|
                                                (SPADCALL |indexes| 1
                                                          (QREFELT $ 65))
                                                (QREFELT $ 66)))
                                (LETT |r2|
                                      (SPADCALL |rs|
                                                (SPADCALL |indexes| 2
                                                          (QREFELT $ 65))
                                                (QREFELT $ 66)))
                                (LETT |n1|
                                      (|GROUPP;generatorOccurrences| |r1| |g|
                                       $))
                                (LETT |n2|
                                      (|GROUPP;generatorOccurrences| |r2| |g|
                                       $))
                                (COND
                                 ((SPADCALL |n1| 1 (QREFELT $ 60))
                                  (SEQ (LETT |r3| |r1|) (LETT |n3| |n1|)
                                       (LETT |r1| |r2|) (LETT |n1| |n2|)
                                       (LETT |r2| |r3|)
                                       (EXIT (LETT |n2| |n3|)))))
                                (EXIT
                                 (COND
                                  ((SPADCALL |n1| 1 (QREFELT $ 60))
                                   (LETT |genToBeRemoved| 0)))))))))))
                     (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |n1| 1 (QREFELT $ 60))
                  (PROGN (LETT #5# |s|) (GO #8=#:G348))))
                (COND
                 (|trace|
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL "simplify: TTSubstitute (" (QREFELT $ 44))
                      (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
                     (SPADCALL ")" (QREFELT $ 44)) (QREFELT $ 43))
                    (QREFELT $ 56))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL "genToBeRemoved=" (QREFELT $ 44))
                                  (|GROUPP;outputGen| |genToBeRemoved| $)
                                  (QREFELT $ 43))
                        (SPADCALL " r1=" (QREFELT $ 44)) (QREFELT $ 43))
                       (|GROUPP;outputRel| |r1| $) (QREFELT $ 43))
                      (SPADCALL " r2=" (QREFELT $ 44)) (QREFELT $ 43))
                     (|GROUPP;outputRel| |r2| $) (QREFELT $ 43))
                    (QREFELT $ 56))
                   (EXIT
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL "n1=" (QREFELT $ 44))
                                 (SPADCALL |n1| (QREFELT $ 68)) (QREFELT $ 43))
                       (SPADCALL " n2=" (QREFELT $ 44)) (QREFELT $ 43))
                      (SPADCALL |n2| (QREFELT $ 68)) (QREFELT $ 43))
                     (QREFELT $ 56))))))
                (LETT |restr| |r1|) (LETT |prer| NIL) (LETT |found| NIL)
                (LETT |genInverted| NIL)
                (SEQ G190
                     (COND
                      ((NULL (NULL (OR (NULL |restr|) |found|))) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |restr|))
                          (LETT |restr| (CDR |restr|))
                          (EXIT
                           (COND
                            ((OR (EQL |x| |genToBeRemoved|)
                                 (EQL |x| (- |genToBeRemoved|)))
                             (SEQ (LETT |found| 'T)
                                  (EXIT
                                   (COND
                                    ((< |x| 0) (LETT |genInverted| 'T))))))
                            ('T
                             (LETT |prer|
                                   (SPADCALL |prer| |x| (QREFELT $ 25)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |postr| NIL)
                (SEQ G190 (COND ((NULL (NULL (NULL |restr|))) (GO G191)))
                     (SEQ (LETT |x| (|SPADfirst| |restr|))
                          (LETT |restr| (CDR |restr|))
                          (EXIT
                           (LETT |postr|
                                 (SPADCALL |postr| |x| (QREFELT $ 25)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |replacement|
                      (SPADCALL (|GROUPP;invertRelation| |prer| $)
                                (|GROUPP;invertRelation| |postr| $)
                                (QREFELT $ 69)))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL "we will substitute " (QREFELT $ 44))
                        (|GROUPP;outputRel| |replacement| $) (QREFELT $ 43))
                       (SPADCALL " for " (QREFELT $ 44)) (QREFELT $ 43))
                      (|GROUPP;outputGen| |genToBeRemoved| $) (QREFELT $ 43))
                     (SPADCALL " in " (QREFELT $ 44)) (QREFELT $ 43))
                    (|GROUPP;outputRel| |r2| $) (QREFELT $ 43))
                   (QREFELT $ 56))))
                (LETT |newRel| NIL)
                (SEQ (LETT |x| NIL) (LETT #2# |r2|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (ABS |x|) (ABS |genToBeRemoved|))
                         (COND
                          (|genInverted|
                           (LETT |newRel|
                                 (SPADCALL |newRel|
                                           (|GROUPP;invertRelation|
                                            |replacement| $)
                                           (QREFELT $ 69))))
                          ('T
                           (LETT |newRel|
                                 (SPADCALL |newRel| |replacement|
                                           (QREFELT $ 69))))))
                        ('T
                         (LETT |newRel|
                               (SPADCALL |newRel| |x| (QREFELT $ 25)))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL (SPADCALL "newRel=" (QREFELT $ 44))
                             (|GROUPP;outputRel| |newRel| $) (QREFELT $ 43))
                   (QREFELT $ 56))))
                (LETT |gens1| (QCAR |s|)) (LETT |rels1| (QCDR |s|))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |genToBeRemoved| $))
                (LETT |rels1|
                      (|GROUPP;removeRelations| |rels1| |genToBeRemoved| $))
                (LETT |rels1| (SPADCALL |rels1| |newRel| (QREFELT $ 26)))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL "gens=" (QREFELT $ 44))
                               (|GROUPP;outputGenList|
                                (SPADCALL |gens1| (QREFELT $ 17)) $)
                               (QREFELT $ 43))
                     (SPADCALL " rels=" (QREFELT $ 44)) (QREFELT $ 43))
                    (|GROUPP;outputRelList| |rels1| $) (QREFELT $ 43))
                   (QREFELT $ 56))))
                (EXIT (CONS |gens1| |rels1|))))
          #8# (EXIT #5#)))) 

(SDEFUN |GROUPP;isSimpler?| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G358 NIL) (|relationCompleityB| #2=(|NonNegativeInteger|))
          (#3=#:G360 NIL) (|rel| NIL) (|relationCompleityA| #2#)
          (#4=#:G359 NIL) (|relsb| #5=(|List| (|List| (|Integer|))))
          (|gensb| #6=(|PrimitiveArray| (|NonNegativeInteger|))) (|relsa| #5#)
          (|gensa| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |gensa| (QCAR |a|)) (LETT |relsa| (QCDR |a|))
                (LETT |gensb| (QCAR |b|)) (LETT |relsb| (QCDR |b|))
                (COND
                 ((< (SPADCALL |gensa| (QREFELT $ 19))
                     (SPADCALL |gensb| (QREFELT $ 19)))
                  (PROGN (LETT #1# 'T) (GO #7=#:G357))))
                (COND
                 ((< (LENGTH |relsa|) (LENGTH |relsb|))
                  (PROGN (LETT #1# 'T) (GO #7#))))
                (LETT |relationCompleityA| 0)
                (SEQ (LETT |rel| NIL) (LETT #4# |relsa|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityA|
                             (+ |relationCompleityA| (LENGTH |rel|)))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (LETT |relationCompleityB| 0)
                (SEQ (LETT |rel| NIL) (LETT #3# |relsb|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityB|
                             (+ |relationCompleityB| (LENGTH |rel|)))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |relationCompleityA| |relationCompleityB|)
                  (PROGN (LETT #1# 'T) (GO #7#))))
                (EXIT NIL)))
          #7# (EXIT #1#)))) 

(SDEFUN |GROUPP;simplify;2$;29| ((|s| $) ($ $))
        (SPADCALL |s| NIL (QREFELT $ 70))) 

(SDEFUN |GROUPP;simplify;$B$;30| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|lastpass| ($)) (|level| #1=(|NonNegativeInteger|)) (#2=#:G368 NIL)
          (|res| ($)) (|loopBreaker| #1#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "simplify(" (QREFELT $ 44))
                          (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
                (SPADCALL ")" (QREFELT $ 44)) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |res| |s|) (LETT |lastpass| |s|) (LETT |level| 0)
            (LETT |loopBreaker| 0)
            (SEQ G190 (COND ((NULL (< |loopBreaker| 10000)) (GO G191)))
                 (SEQ (LETT |loopBreaker| (+ |loopBreaker| 1))
                      (COND
                       ((EQL |level| 0)
                        (LETT |res| (|GROUPP;TTRemoveEmpty| |res| |trace| $))))
                      (COND
                       ((EQL |level| 1)
                        (LETT |res| (|GROUPP;TTRemoveZero| |res| |trace| $))))
                      (COND
                       ((EQL |level| 2)
                        (LETT |res|
                              (|GROUPP;TTRemoveGeneratorIfIdentity| |res|
                               |trace| $))))
                      (COND
                       ((EQL |level| 3)
                        (LETT |res|
                              (|GROUPP;TTRenameGenerator| |res| |trace| $))))
                      (COND
                       ((EQL |level| 4)
                        (LETT |res|
                              (|GROUPP;TTRemoveEleTimesInverse| |res| |trace|
                               $))))
                      (COND
                       ((EQL |level| 5)
                        (LETT |res|
                              (|GROUPP;TTRemoveDuplicateRelation| |res| |trace|
                               $))))
                      (COND
                       ((EQL |level| 6)
                        (LETT |res| (|GROUPP;TTSubstitute| |res| |trace| $))))
                      (COND
                       ((EQL |level| 7)
                        (PROGN
                         (LETT #2#
                               (|GROUPP;TTMinimiseInverses| |res| |trace| $))
                         (GO #3=#:G367))))
                      (COND
                       ((|GROUPP;isSimpler?| |res| |lastpass| $)
                        (LETT |level| 0))
                       ('T (LETT |level| (+ |level| 1))))
                      (COND
                       (|trace|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL " level=" (QREFELT $ 44))
                                       (SPADCALL |level| (QREFELT $ 68))
                                       (QREFELT $ 43))
                             (SPADCALL " loop=" (QREFELT $ 44)) (QREFELT $ 43))
                            (SPADCALL |loopBreaker| (QREFELT $ 68))
                            (QREFELT $ 43))
                           (SPADCALL " res=" (QREFELT $ 44)) (QREFELT $ 43))
                          (SPADCALL |res| (QREFELT $ 67)) (QREFELT $ 43))
                         (QREFELT $ 56))))
                      (EXIT (LETT |lastpass| |res|)))
                 NIL (GO G190) G191 (EXIT NIL))
            (SPADCALL
             (SPADCALL
              (SPADCALL "simplify excessive time - loop suspected"
                        (QREFELT $ 44))
              (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
             (QREFELT $ 56))
            (EXIT |res|)))
          #3# (EXIT #2#)))) 

(SDEFUN |GROUPP;offsetIndexes| ((|a| $) (|offset| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|rb| (|List| (|List| (|Integer|)))) (#1=#:G379 NIL) (|y| NIL)
          (#2=#:G378 NIL) (#3=#:G377 NIL) (|z| NIL) (#4=#:G376 NIL)
          (|gb| (|List| (|NonNegativeInteger|))) (#5=#:G375 NIL) (|x| NIL)
          (#6=#:G374 NIL) (|ra| (|List| (|List| (|Integer|))))
          (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ga| (SPADCALL (QCAR |a|) (QREFELT $ 17)))
              (LETT |ra| (QCDR |a|))
              (LETT |gb|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |x| NIL) (LETT #5# |ga|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #6# (CONS (+ |x| |offset|) #6#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |rb|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |z| NIL) (LETT #3# |ra|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |z| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |y| NIL) (LETT #1# |z|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |y| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (COND
                                                   ((SPADCALL |y| 0
                                                              (QREFELT $ 41))
                                                    (+ |y| |offset|))
                                                   ('T (- |y| |offset|)))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (EXIT (SPADCALL |gb| |rb| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;quotient;$L$;32|
        ((|a| $) (|remgen| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G384 NIL)
          (|toBeRemoved| NIL))
         (SEQ (LETT |gens1| (QCAR |a|)) (LETT |rels1| (QCDR |a|))
              (SEQ (LETT |toBeRemoved| NIL) (LETT #1# |remgen|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |toBeRemoved| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $))
                    (EXIT
                     (LETT |rels1|
                           (|GROUPP;removeGen2| |rels1| |toBeRemoved| $))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT $ 17)) |rels1|
                          (QREFELT $ 11))
                (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;quotient;$L$;33|
        ((|a| $) (|addrel| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (SPADCALL (QCAR |a|) (QREFELT $ 17)))
              (LETT |rels1| (QCDR |a|))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT $ 73))
                          (SPADCALL |rels1| |addrel| (QREFELT $ 74))
                          (QREFELT $ 11))
                (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;directProduct;3$;34| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|rc| (|List| (|List| (|Integer|)))) (|gcx| (|List| (|Integer|)))
          (#1=#:G393 NIL) (|gbx| NIL) (#2=#:G392 NIL) (|gax| NIL)
          (|rb| #3=(|List| (|List| (|Integer|))))
          (|gb| #4=(|List| (|NonNegativeInteger|))) (|b2| ($))
          (|sa| (|NonNegativeInteger|)) (|ra| #3#) (|ga| #4#) (|a2| ($)))
         (SEQ (LETT |a2| (SPADCALL |a| (QREFELT $ 27)))
              (LETT |ga| (SPADCALL (QCAR |a2|) (QREFELT $ 17)))
              (LETT |ra| (QCDR |a2|))
              (LETT |sa| (SPADCALL |ga| (QREFELT $ 64)))
              (LETT |b2|
                    (|GROUPP;offsetIndexes| (SPADCALL |b| (QREFELT $ 27)) |sa|
                     $))
              (LETT |gb| (SPADCALL (QCAR |b2|) (QREFELT $ 17)))
              (LETT |rb| (QCDR |b2|)) (LETT |rc| NIL)
              (SEQ (LETT |gax| NIL) (LETT #2# |ga|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |gax| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |gbx| NIL) (LETT #1# |gb|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |gbx| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |gcx| (LIST |gax| |gbx| |gax| |gbx|))
                               (EXIT
                                (LETT |rc|
                                      (SPADCALL |rc| |gcx| (QREFELT $ 26)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ga| (QREFELT $ 73)) |gb| (QREFELT $ 76))
                (SPADCALL (LIST |ra| |rb| |rc|) (QREFELT $ 77))
                (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;cyclicGroup;Pi$;35| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((|ra| (|List| (|List| (|Integer|)))) (#1=#:G398 NIL) (|x| NIL)
          (#2=#:G397 NIL) (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ga| (LIST 1))
              (LETT |ra|
                    (LIST
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |x| 1) (LETT #1# |n|) G190
                           (COND ((|greater_SI| |x| #1#) (GO G191)))
                           (SEQ (EXIT (LETT #2# (CONS 1 #2#))))
                           (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))
              (EXIT (SPADCALL |ga| |ra| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;dihedralGroup;Pi$;36| ((|n| |PositiveInteger|) ($ $))
        (SPROG ((|c2| ($)) (|c1| ($)))
               (SEQ (LETT |c1| (SPADCALL |n| (QREFELT $ 80)))
                    (LETT |c2| (SPADCALL 2 (QREFELT $ 80)))
                    (EXIT (SPADCALL |c1| |c2| (QREFELT $ 78)))))) 

(SDEFUN |GROUPP;symmetricGroup;Pi$;37| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((|r| (|List| (|List| (|Integer|)))) (|y| (|List| (|Integer|)))
          (#1=#:G417 NIL) (|b| NIL) (#2=#:G416 NIL) (|a| NIL)
          (|ga| (|List| (|NonNegativeInteger|))) (#3=#:G415 NIL) (|x| NIL)
          (#4=#:G414 NIL) (|m| (|PositiveInteger|)) (#5=#:G401 NIL)
          (#6=#:G413 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| 2)
              (PROGN (LETT #6# (SPADCALL NIL (QREFELT $ 12))) (GO #7=#:G412))))
            (LETT |m|
                  (PROG1 (LETT #5# (- |n| 1))
                    (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                      '(|Integer|) #5#)))
            (LETT |ga|
                  (PROGN
                   (LETT #4# NIL)
                   (SEQ (LETT |x| 1) (LETT #3# |m|) G190
                        (COND ((|greater_SI| |x| #3#) (GO G191)))
                        (SEQ (EXIT (LETT #4# (CONS |x| #4#))))
                        (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                        (EXIT (NREVERSE #4#)))))
            (LETT |r| NIL)
            (SEQ (LETT |a| 1) (LETT #2# |m|) G190
                 (COND ((|greater_SI| |a| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |b| 1) (LETT #1# |m|) G190
                        (COND ((|greater_SI| |b| #1#) (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |a| |b|)
                           (SEQ (LETT |y| (LIST |a| |a|))
                                (EXIT (LETT |r| (CONS |y| |r|))))))
                         (COND
                          ((< (+ |a| 1) |b|)
                           (SEQ (LETT |y| (LIST |a| |b| (- |a|) (- |b|)))
                                (EXIT (LETT |r| (CONS |y| |r|))))))
                         (EXIT
                          (COND
                           ((EQL (+ |a| 1) |b|)
                            (SEQ (LETT |y| (LIST |a| |b| |a| |b| |a| |b|))
                                 (EXIT (LETT |r| (CONS |y| |r|))))))))
                        (LETT |b| (|inc_SI| |b|)) (GO G190) G191 (EXIT NIL))))
                 (LETT |a| (|inc_SI| |a|)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |ga| (NREVERSE |r|) (QREFELT $ 11)))))
          #7# (EXIT #6#)))) 

(SDEFUN |GROUPP;outCosetTable|
        ((|ct| |TwoDimensionalArray| (|NonNegativeInteger|))
         (|np| . #1=(|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|part2| (|NonNegativeInteger|)) (#2=#:G419 NIL) (|part1| #1#)
          (#3=#:G425 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |np| 1)
              (PROGN
               (LETT #3# (SPADCALL |ct| (QREFELT $ 84)))
               (GO #4=#:G424))))
            (COND
             ((SPADCALL (SPADCALL |ct| (QREFELT $ 85)) |np| (QREFELT $ 49))
              (SEQ (LETT |part1| |np|)
                   (LETT |part2|
                         (PROG2
                             (LETT #2#
                                   (SPADCALL (SPADCALL |ct| (QREFELT $ 85))
                                             |np| (QREFELT $ 87)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #2#)))
                   (LETT |cts|
                         (SPADCALL |ct| (LIST |part1| |part2|) (QREFELT $ 88)))
                   (EXIT (LETT |ct| (SPADCALL |cts| 1 (QREFELT $ 90)))))))
            (EXIT (SPADCALL |ct| (QREFELT $ 84)))))
          #4# (EXIT #3#)))) 

(SDEFUN |GROUPP;outStatus|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #2=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         ($ |OutputForm|))
        (SPROG ((|np| #2#) (|ct| #1#))
               (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |np| (QVELT |state| 5))
                    (EXIT (|GROUPP;outCosetTable| |ct| |np| $))))) 

(SDEFUN |GROUPP;find|
        ((|et| |OneDimensionalArray| (|NonNegativeInteger|))
         (|ind| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|nj| (|NonNegativeInteger|))
          (|pj| (|NonNegativeInteger|)))
         (SEQ
          (COND ((OR (EQL |ind| 0) (EQL (QAREF1O |et| |ind| 1) |ind|)) |ind|)
                ('T
                 (SEQ (LETT |j| |ind|) (LETT |pj| 0)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |pj| |j|)
                                (EXIT (LETT |j| (QAREF1O |et| |j| 1))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |j| |ind|)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |nj| (QAREF1O |et| |j| 1))
                                (QSETAREF1O |et| |j| |pj| 1)
                                (EXIT (LETT |j| |nj|)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |pj|))))))) 

(SDEFUN |GROUPP;infer_coincidencies|
        ((|ct| |TwoDimensionalArray| (|NonNegativeInteger|))
         (|et| |OneDimensionalArray| (|NonNegativeInteger|))
         (|pb| . #1=(|NonNegativeInteger|)) (|pe| . #2=(|NonNegativeInteger|))
         (|trace| |Boolean|) ($ |Void|))
        (SPROG
         ((|i2| #3=(|NonNegativeInteger|)) (|i1| #3#) (#4=#:G446 NIL) (|i| NIL)
          (#5=#:G445 NIL) (|nn| (|Integer|)) (|#G135| #1#) (|#G134| #2#))
         (SEQ
          (COND
           (|trace|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL "coincidence: begin=" (QREFELT $ 44))
                         (SPADCALL |pb| (QREFELT $ 68)) (QREFELT $ 43))
               (SPADCALL " end=" (QREFELT $ 44)) (QREFELT $ 43))
              (SPADCALL |pe| (QREFELT $ 68)) (QREFELT $ 43))
             (QREFELT $ 56))))
          (COND
           ((< |pe| |pb|)
            (PROGN
             (LETT |#G134| |pe|)
             (LETT |#G135| |pb|)
             (LETT |pb| |#G134|)
             (LETT |pe| |#G135|))))
          (QSETAREF1O |et| |pe| |pb| 1)
          (LETT |nn| (SPADCALL |ct| (QREFELT $ 91)))
          (SEQ (LETT |i| 1) (LETT #5# |nn|) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1))
                    (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1))
                    (EXIT
                     (COND ((EQL |i2| 0) "skip")
                           ((EQL |i1| 0)
                            (QSETAREF2O |ct| |pb| |i| |i2| 1 1)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| 1) (LETT #4# |nn|) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1))
                     (EXIT
                      (COND ((EQL |i1| 0) "skip")
                            ('T
                             (SEQ (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1))
                                  (EXIT
                                   (COND ((EQL |i2| 0) "skip")
                                         ('T
                                          (SEQ
                                           (LETT |i1|
                                                 (|GROUPP;find| |et| |i1| $))
                                           (LETT |i2|
                                                 (|GROUPP;find| |et| |i2| $))
                                           (EXIT
                                            (COND ((EQL |i1| |i2|) "skip")
                                                  ('T
                                                   (|GROUPP;infer_coincidencies|
                                                    |ct| |et| |i1| |i2| |trace|
                                                    $)))))))))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |GROUPP;inferFromRelations|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table|
               #3=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #4=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|rels| |List| #5=(|List| (|NonNegativeInteger|)))
         (|rrels| |List| (|List| (|NonNegativeInteger|)))
         (|rel_lens| |List| (|NonNegativeInteger|)) (|trace| |Boolean|)
         ($ |Boolean|))
        (SPROG
         ((#6=#:G489 NIL) (|npb| #7=(|NonNegativeInteger|)) (|npe| #7#)
          (|genIn| (|Integer|)) (|pb| #8=(|NonNegativeInteger|))
          (|gb| #9=(|NonNegativeInteger|)) (|gap| (|Integer|))
          (|add_gen| (|Integer|)) (|n_ind| #4#) (|o_size| (|Integer|))
          (|et| #2#) (|ct| #1#) (#10=#:G505 NIL) (|i| #8#) (#11=#:G504 NIL)
          (|j| NIL) (#12=#:G503 NIL)
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|nct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|n_ct_cols| (|Integer|)) (|n_size| (|NonNegativeInteger|))
          (#13=#:G493 NIL) (|prel| #5#) (|add_to| #9#) (#14=#:G502 NIL)
          (#15=#:G501 NIL) (#16=#:G500 NIL) (#17=#:G499 NIL) (|pe| #8#)
          (|ge| #9#) (#18=#:G490 NIL) (|genInv| (|Integer|)) (#19=#:G498 NIL)
          (|genIndex| NIL) (#20=#:G491 NIL) (#21=#:G497 NIL) (#22=#:G494 NIL)
          (|rel| NIL) (#23=#:G495 NIL) (|rrel| NIL) (#24=#:G496 NIL)
          (|r_len| NIL) (#25=#:G492 NIL) (|closed| (|Boolean|)) (|pn| #8#)
          (|add_gap| (|Integer|)) (|inv_tab| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |et| (QVELT |state| 1))
                (LETT |n_ind| (QVELT |state| 5))
                (LETT |inv_tab| (QVELT |state| 2))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL "inferFromRelations rels=" (QREFELT $ 44))
                    (SPADCALL |rels| (QREFELT $ 93)) (QREFELT $ 43))
                   (QREFELT $ 56))))
                (LETT |add_to| 0) (LETT |add_gen| 0) (LETT |add_gap| 0)
                (LETT |pn| (+ (QVELT |state| 3) 1))
                (EXIT
                 (COND ((SPADCALL |pn| |n_ind| (QREFELT $ 49)) NIL)
                       ('T
                        (SEQ (QSETVELT |state| 3 |pn|)
                             (COND
                              ((NULL (EQL (QAREF1O |et| |pn| 1) |pn|))
                               (EXIT 'T)))
                             (LETT |o_size| (SPADCALL |ct| (QREFELT $ 94)))
                             (LETT |closed| NIL)
                             (SEQ
                              (EXIT
                               (SEQ G190
                                    (COND ((NULL (NULL |closed|)) (GO G191)))
                                    (SEQ (LETT |closed| 'T)
                                         (COND
                                          ((NULL
                                            (EQL (QAREF1O |et| |pn| 1) |pn|))
                                           (EXIT
                                            (PROGN
                                             (LETT #25# |$NoValue|)
                                             (GO #26=#:G485)))))
                                         (SEQ (LETT |r_len| NIL)
                                              (LETT #24# |rel_lens|)
                                              (LETT |rrel| NIL)
                                              (LETT #23# |rrels|)
                                              (LETT |rel| NIL)
                                              (LETT #22# |rels|) G190
                                              (COND
                                               ((OR (ATOM #22#)
                                                    (PROGN
                                                     (LETT |rel| (CAR #22#))
                                                     NIL)
                                                    (ATOM #23#)
                                                    (PROGN
                                                     (LETT |rrel| (CAR #23#))
                                                     NIL)
                                                    (ATOM #24#)
                                                    (PROGN
                                                     (LETT |r_len| (CAR #24#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ (LETT |gb| 0)
                                                   (LETT |pb| |pn|)
                                                   (LETT |i| |pn|)
                                                   (LETT |genIn| 0)
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ (LETT |genIndex| NIL)
                                                          (LETT #21# |rel|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #21#)
                                                                (PROGN
                                                                 (LETT
                                                                  |genIndex|
                                                                  (CAR #21#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |genIn|
                                                                 |genIndex|)
                                                           (LETT |i|
                                                                 (QAREF2O |ct|
                                                                          |i|
                                                                          |genIndex|
                                                                          1 1))
                                                           (EXIT
                                                            (COND
                                                             ((EQL |i| 0)
                                                              (PROGN
                                                               (LETT #20#
                                                                     |$NoValue|)
                                                               (GO
                                                                #27=#:G453)))
                                                             ('T
                                                              (SEQ
                                                               (LETT |i|
                                                                     (|GROUPP;find|
                                                                      |et| |i|
                                                                      $))
                                                               (LETT |gb|
                                                                     (+ |gb|
                                                                        1))
                                                               (EXIT
                                                                (LETT |pb|
                                                                      |i|)))))))
                                                          (LETT #21#
                                                                (CDR #21#))
                                                          (GO G190) G191
                                                          (EXIT NIL)))
                                                    #27# (EXIT #20#))
                                                   (LETT |gap|
                                                         (- |r_len| |gb|))
                                                   (LETT |ge| 0)
                                                   (LETT |pe| |pn|)
                                                   (LETT |i| |pn|)
                                                   (LETT |genInv| 0)
                                                   (SEQ
                                                    (EXIT
                                                     (SEQ (LETT |genIndex| NIL)
                                                          (LETT #19# |rrel|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #19#)
                                                                (PROGN
                                                                 (LETT
                                                                  |genIndex|
                                                                  (CAR #19#))
                                                                 NIL)
                                                                (NULL
                                                                 (< |ge|
                                                                    |gap|)))
                                                            (GO G191)))
                                                          (SEQ
                                                           (LETT |genInv|
                                                                 |genIndex|)
                                                           (LETT |i|
                                                                 (QAREF2O |ct|
                                                                          |i|
                                                                          |genIndex|
                                                                          1 1))
                                                           (EXIT
                                                            (COND
                                                             ((EQL |i| 0)
                                                              (PROGN
                                                               (LETT #18#
                                                                     |$NoValue|)
                                                               (GO
                                                                #28=#:G456)))
                                                             ('T
                                                              (SEQ
                                                               (LETT |i|
                                                                     (|GROUPP;find|
                                                                      |et| |i|
                                                                      $))
                                                               (LETT |ge|
                                                                     (+ |ge|
                                                                        1))
                                                               (EXIT
                                                                (LETT |pe|
                                                                      |i|)))))))
                                                          (LETT #19#
                                                                (CDR #19#))
                                                          (GO G190) G191
                                                          (EXIT NIL)))
                                                    #28# (EXIT #18#))
                                                   (LETT |gap| (- |gap| |ge|))
                                                   (COND
                                                    ((SPADCALL |gap| 1
                                                               (QREFELT $ 41))
                                                     (SEQ (LETT |add_to| |pb|)
                                                          (LETT |add_gen|
                                                                |genIn|)
                                                          (SEQ
                                                           (COND
                                                            ((>= |n_ind|
                                                                 |o_size|)
                                                             (COND
                                                              ((EQL |n_ind|
                                                                    (QVELT
                                                                     |state|
                                                                     7))
                                                               (PROGN
                                                                (LETT #13# 'T)
                                                                (GO
                                                                 #29=#:G488)))
                                                              ('T
                                                               (SEQ
                                                                (LETT |n_size|
                                                                      (MIN
                                                                       (SPADCALL
                                                                        2
                                                                        |o_size|
                                                                        (QREFELT
                                                                         $ 95))
                                                                       (QVELT
                                                                        |state|
                                                                        7)))
                                                                (LETT
                                                                 |n_ct_cols|
                                                                 (SPADCALL |ct|
                                                                           (QREFELT
                                                                            $
                                                                            91)))
                                                                (LETT |nct|
                                                                      (SPADCALL
                                                                       |n_size|
                                                                       |n_ct_cols|
                                                                       0
                                                                       (QREFELT
                                                                        $ 96)))
                                                                (LETT |net|
                                                                      (SPADCALL
                                                                       |n_size|
                                                                       0
                                                                       (QREFELT
                                                                        $ 98)))
                                                                (SEQ
                                                                 (LETT |i| 1)
                                                                 (LETT #17#
                                                                       |o_size|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |i| #17#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (QSETAREF1O
                                                                   |net| |i|
                                                                   (QAREF1O
                                                                    |et| |i| 1)
                                                                   1)
                                                                  (EXIT
                                                                   (SEQ
                                                                    (LETT |j|
                                                                          1)
                                                                    (LETT #16#
                                                                          |n_ct_cols|)
                                                                    G190
                                                                    (COND
                                                                     ((|greater_SI|
                                                                       |j|
                                                                       #16#)
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (QSETAREF2O
                                                                       |nct|
                                                                       |i| |j|
                                                                       (QAREF2O
                                                                        |ct|
                                                                        |i| |j|
                                                                        1 1)
                                                                       1 1)))
                                                                    (LETT |j|
                                                                          (|inc_SI|
                                                                           |j|))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     NIL))))
                                                                 (LETT |i|
                                                                       (|inc_SI|
                                                                        |i|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (SEQ
                                                                 (LETT |i|
                                                                       (+
                                                                        |o_size|
                                                                        1))
                                                                 (LETT #15#
                                                                       |n_size|)
                                                                 G190
                                                                 (COND
                                                                  ((> |i| #15#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (QSETAREF1O
                                                                    |net| |i|
                                                                    |i| 1)))
                                                                 (LETT |i|
                                                                       (+ |i|
                                                                          1))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (LETT |ct|
                                                                      |nct|)
                                                                (LETT |et|
                                                                      |net|)
                                                                (LETT |o_size|
                                                                      |n_size|)
                                                                (QSETVELT
                                                                 |state| 0
                                                                 |ct|)
                                                                (EXIT
                                                                 (QSETVELT
                                                                  |state| 1
                                                                  |et|)))))))
                                                           (LETT |n_ind|
                                                                 (+ |n_ind| 1))
                                                           (COND
                                                            (|trace|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    #30="adding action of "
                                                                    (QREFELT $
                                                                             44))
                                                                   (SPADCALL
                                                                    |add_gen|
                                                                    (QREFELT $
                                                                             99))
                                                                   (QREFELT $
                                                                            43))
                                                                  (SPADCALL
                                                                   #31=" on "
                                                                   (QREFELT $
                                                                            44))
                                                                  (QREFELT $
                                                                           43))
                                                                 (SPADCALL
                                                                  |add_to|
                                                                  (QREFELT $
                                                                           68))
                                                                 (QREFELT $
                                                                          43))
                                                                (SPADCALL
                                                                 #32=" to be "
                                                                 (QREFELT $
                                                                          44))
                                                                (QREFELT $ 43))
                                                               (SPADCALL
                                                                |n_ind|
                                                                (QREFELT $ 68))
                                                               (QREFELT $ 43))
                                                              (QREFELT $ 56))))
                                                           (QSETAREF2O |ct|
                                                                       |add_to|
                                                                       |add_gen|
                                                                       |n_ind|
                                                                       1 1)
                                                           (LETT |add_gen|
                                                                 (SPADCALL
                                                                  |inv_tab|
                                                                  |add_gen|
                                                                  (QREFELT $
                                                                           100)))
                                                           (QSETAREF2O |ct|
                                                                       |n_ind|
                                                                       |add_gen|
                                                                       |add_to|
                                                                       1 1)
                                                           (COND
                                                            (|trace|
                                                             (SPADCALL
                                                              (|GROUPP;outStatus|
                                                               |state| $)
                                                              (QREFELT $ 56))))
                                                           (EXIT
                                                            (QSETVELT |state| 5
                                                                      |n_ind|)))
                                                          (LETT |gap|
                                                                (- |gap| 1))
                                                          (LETT |prel| |rel|)
                                                          (SEQ (LETT |i| 0)
                                                               (LETT #14# |gb|)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |i| #14#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT |prel|
                                                                       (CDR
                                                                        |prel|))))
                                                               (LETT |i|
                                                                     (|inc_SI|
                                                                      |i|))
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                          (LETT |gb|
                                                                (+ |gb| 1))
                                                          (SEQ G190
                                                               (COND
                                                                ((NULL
                                                                  (SPADCALL
                                                                   |gap| 1
                                                                   (QREFELT $
                                                                            41)))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (LETT |add_to|
                                                                      |n_ind|)
                                                                (LETT |add_gen|
                                                                      (|SPADfirst|
                                                                       |prel|))
                                                                (LETT |prel|
                                                                      (CDR
                                                                       |prel|))
                                                                (SEQ
                                                                 (COND
                                                                  ((>= |n_ind|
                                                                       |o_size|)
                                                                   (COND
                                                                    ((EQL
                                                                      |n_ind|
                                                                      (QVELT
                                                                       |state|
                                                                       7))
                                                                     (PROGN
                                                                      (LETT
                                                                       #13# 'T)
                                                                      (GO
                                                                       #29#)))
                                                                    ('T
                                                                     (SEQ
                                                                      (LETT
                                                                       |n_size|
                                                                       (MIN
                                                                        (SPADCALL
                                                                         2
                                                                         |o_size|
                                                                         (QREFELT
                                                                          $
                                                                          95))
                                                                        (QVELT
                                                                         |state|
                                                                         7)))
                                                                      (LETT
                                                                       |n_ct_cols|
                                                                       (SPADCALL
                                                                        |ct|
                                                                        (QREFELT
                                                                         $
                                                                         91)))
                                                                      (LETT
                                                                       |nct|
                                                                       (SPADCALL
                                                                        |n_size|
                                                                        |n_ct_cols|
                                                                        0
                                                                        (QREFELT
                                                                         $
                                                                         96)))
                                                                      (LETT
                                                                       |net|
                                                                       (SPADCALL
                                                                        |n_size|
                                                                        0
                                                                        (QREFELT
                                                                         $
                                                                         98)))
                                                                      (SEQ
                                                                       (LETT
                                                                        |i| 1)
                                                                       (LETT
                                                                        #12#
                                                                        |o_size|)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |i|
                                                                          #12#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (QSETAREF1O
                                                                         |net|
                                                                         |i|
                                                                         (QAREF1O
                                                                          |et|
                                                                          |i|
                                                                          1)
                                                                         1)
                                                                        (EXIT
                                                                         (SEQ
                                                                          (LETT
                                                                           |j|
                                                                           1)
                                                                          (LETT
                                                                           #11#
                                                                           |n_ct_cols|)
                                                                          G190
                                                                          (COND
                                                                           ((|greater_SI|
                                                                             |j|
                                                                             #11#)
                                                                            (GO
                                                                             G191)))
                                                                          (SEQ
                                                                           (EXIT
                                                                            (QSETAREF2O
                                                                             |nct|
                                                                             |i|
                                                                             |j|
                                                                             (QAREF2O
                                                                              |ct|
                                                                              |i|
                                                                              |j|
                                                                              1
                                                                              1)
                                                                             1
                                                                             1)))
                                                                          (LETT
                                                                           |j|
                                                                           (|inc_SI|
                                                                            |j|))
                                                                          (GO
                                                                           G190)
                                                                          G191
                                                                          (EXIT
                                                                           NIL))))
                                                                       (LETT
                                                                        |i|
                                                                        (|inc_SI|
                                                                         |i|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (SEQ
                                                                       (LETT
                                                                        |i|
                                                                        (+
                                                                         |o_size|
                                                                         1))
                                                                       (LETT
                                                                        #10#
                                                                        |n_size|)
                                                                       G190
                                                                       (COND
                                                                        ((> |i|
                                                                            #10#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (QSETAREF1O
                                                                          |net|
                                                                          |i|
                                                                          |i|
                                                                          1)))
                                                                       (LETT
                                                                        |i|
                                                                        (+ |i|
                                                                           1))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (LETT
                                                                       |ct|
                                                                       |nct|)
                                                                      (LETT
                                                                       |et|
                                                                       |net|)
                                                                      (LETT
                                                                       |o_size|
                                                                       |n_size|)
                                                                      (QSETVELT
                                                                       |state|
                                                                       0 |ct|)
                                                                      (EXIT
                                                                       (QSETVELT
                                                                        |state|
                                                                        1
                                                                        |et|)))))))
                                                                 (LETT |n_ind|
                                                                       (+
                                                                        |n_ind|
                                                                        1))
                                                                 (COND
                                                                  (|trace|
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          #30#
                                                                          (QREFELT
                                                                           $
                                                                           44))
                                                                         (SPADCALL
                                                                          |add_gen|
                                                                          (QREFELT
                                                                           $
                                                                           99))
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                                        (SPADCALL
                                                                         #31#
                                                                         (QREFELT
                                                                          $
                                                                          44))
                                                                        (QREFELT
                                                                         $ 43))
                                                                       (SPADCALL
                                                                        |add_to|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (QREFELT
                                                                        $ 43))
                                                                      (SPADCALL
                                                                       #32#
                                                                       (QREFELT
                                                                        $ 44))
                                                                      (QREFELT
                                                                       $ 43))
                                                                     (SPADCALL
                                                                      |n_ind|
                                                                      (QREFELT
                                                                       $ 68))
                                                                     (QREFELT $
                                                                              43))
                                                                    (QREFELT $
                                                                             56))))
                                                                 (QSETAREF2O
                                                                  |ct| |add_to|
                                                                  |add_gen|
                                                                  |n_ind| 1 1)
                                                                 (LETT
                                                                  |add_gen|
                                                                  (SPADCALL
                                                                   |inv_tab|
                                                                   |add_gen|
                                                                   (QREFELT $
                                                                            100)))
                                                                 (QSETAREF2O
                                                                  |ct| |n_ind|
                                                                  |add_gen|
                                                                  |add_to| 1 1)
                                                                 (COND
                                                                  (|trace|
                                                                   (SPADCALL
                                                                    (|GROUPP;outStatus|
                                                                     |state| $)
                                                                    (QREFELT $
                                                                             56))))
                                                                 (EXIT
                                                                  (QSETVELT
                                                                   |state| 5
                                                                   |n_ind|)))
                                                                (LETT |gap|
                                                                      (- |gap|
                                                                         1))
                                                                (EXIT
                                                                 (LETT |gb|
                                                                       (+ |gb|
                                                                          1))))
                                                               NIL (GO G190)
                                                               G191 (EXIT NIL))
                                                          (LETT |pb| |n_ind|)
                                                          (EXIT
                                                           (LETT |genIn|
                                                                 (|SPADfirst|
                                                                  |prel|))))))
                                                   (EXIT
                                                    (COND
                                                     ((EQL |gap| 1)
                                                      (SEQ
                                                       (EXIT
                                                        (SEQ
                                                         (SEQ
                                                          (LETT |npe|
                                                                (QAREF2O |ct|
                                                                         |pb|
                                                                         |genIn|
                                                                         1 1))
                                                          (EXIT
                                                           (COND
                                                            ((NULL
                                                              (EQL |npe| 0))
                                                             (PROGN
                                                              (LETT #6#
                                                                    (COND
                                                                     ((EQL
                                                                       |npe|
                                                                       |pe|)
                                                                      "skip")
                                                                     ('T
                                                                      (SEQ
                                                                       (COND
                                                                        (|trace|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (SPADCALL
                                                                                  "coincidence: "
                                                                                  (QREFELT
                                                                                   $
                                                                                   44))
                                                                                 (SPADCALL
                                                                                  |pe|
                                                                                  (QREFELT
                                                                                   $
                                                                                   68))
                                                                                 (QREFELT
                                                                                  $
                                                                                  43))
                                                                                (SPADCALL
                                                                                 " "
                                                                                 (QREFELT
                                                                                  $
                                                                                  44))
                                                                                (QREFELT
                                                                                 $
                                                                                 43))
                                                                               (SPADCALL
                                                                                |npe|
                                                                                (QREFELT
                                                                                 $
                                                                                 68))
                                                                               (QREFELT
                                                                                $
                                                                                43))
                                                                              (SPADCALL
                                                                               " rel = "
                                                                               (QREFELT
                                                                                $
                                                                                44))
                                                                              (QREFELT
                                                                               $
                                                                               43))
                                                                             (SPADCALL
                                                                              |rel|
                                                                              (QREFELT
                                                                               $
                                                                               101))
                                                                             (QREFELT
                                                                              $
                                                                              43))
                                                                            (SPADCALL
                                                                             " pn = "
                                                                             (QREFELT
                                                                              $
                                                                              44))
                                                                            (QREFELT
                                                                             $
                                                                             43))
                                                                           (SPADCALL
                                                                            |pn|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           (QREFELT
                                                                            $
                                                                            43))
                                                                          (QREFELT
                                                                           $
                                                                           56))))
                                                                       (EXIT
                                                                        (|GROUPP;infer_coincidencies|
                                                                         |ct|
                                                                         |et|
                                                                         |pe|
                                                                         |npe|
                                                                         |trace|
                                                                         $))))))
                                                              (GO
                                                               #33=#:G480))))))
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                "inferFromRelations genIn="
                                                                (QREFELT $ 44))
                                                               (SPADCALL
                                                                |genIn|
                                                                (QREFELT $ 99))
                                                               (QREFELT $ 43))
                                                              (SPADCALL " gb="
                                                                        (QREFELT
                                                                         $ 44))
                                                              (QREFELT $ 43))
                                                             (SPADCALL |gb|
                                                                       (QREFELT
                                                                        $ 68))
                                                             (QREFELT $ 43))
                                                            (QREFELT $ 56))))
                                                         (COND
                                                          ((NULL
                                                            (EQL
                                                             (QAREF1O |inv_tab|
                                                                      |genIn|
                                                                      1)
                                                             |genInv|))
                                                           (EXIT
                                                            (|error|
                                                             "impossible 3"))))
                                                         (QSETAREF2O |ct| |pb|
                                                                     |genIn|
                                                                     |pe| 1 1)
                                                         (SEQ
                                                          (LETT |npb|
                                                                (QAREF2O |ct|
                                                                         |pe|
                                                                         |genInv|
                                                                         1 1))
                                                          (EXIT
                                                           (COND
                                                            ((NULL
                                                              (EQL |npb| 0))
                                                             (PROGN
                                                              (LETT #6#
                                                                    (COND
                                                                     ((EQL
                                                                       |npb|
                                                                       |pb|)
                                                                      "skip")
                                                                     ('T
                                                                      (SEQ
                                                                       (COND
                                                                        (|trace|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 (SPADCALL
                                                                                  "coincidence: "
                                                                                  (QREFELT
                                                                                   $
                                                                                   44))
                                                                                 (SPADCALL
                                                                                  |npb|
                                                                                  (QREFELT
                                                                                   $
                                                                                   68))
                                                                                 (QREFELT
                                                                                  $
                                                                                  43))
                                                                                (SPADCALL
                                                                                 " "
                                                                                 (QREFELT
                                                                                  $
                                                                                  44))
                                                                                (QREFELT
                                                                                 $
                                                                                 43))
                                                                               (SPADCALL
                                                                                |pb|
                                                                                (QREFELT
                                                                                 $
                                                                                 68))
                                                                               (QREFELT
                                                                                $
                                                                                43))
                                                                              (SPADCALL
                                                                               " rel = "
                                                                               (QREFELT
                                                                                $
                                                                                44))
                                                                              (QREFELT
                                                                               $
                                                                               43))
                                                                             (SPADCALL
                                                                              |rel|
                                                                              (QREFELT
                                                                               $
                                                                               101))
                                                                             (QREFELT
                                                                              $
                                                                              43))
                                                                            (SPADCALL
                                                                             " pn = "
                                                                             (QREFELT
                                                                              $
                                                                              44))
                                                                            (QREFELT
                                                                             $
                                                                             43))
                                                                           (SPADCALL
                                                                            |pn|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           (QREFELT
                                                                            $
                                                                            43))
                                                                          (QREFELT
                                                                           $
                                                                           56))))
                                                                       (EXIT
                                                                        (|GROUPP;infer_coincidencies|
                                                                         |ct|
                                                                         |et|
                                                                         |pb|
                                                                         |npb|
                                                                         |trace|
                                                                         $))))))
                                                              (GO #33#))))))
                                                         (EXIT
                                                          (QSETAREF2O |ct| |pe|
                                                                      |genInv|
                                                                      |pb| 1
                                                                      1))))
                                                       #33# (EXIT #6#)))
                                                     ((EQL |gap| 0)
                                                      (COND
                                                       ((EQL |pb| |pe|) "skip")
                                                       ('T
                                                        (SEQ
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    "coincidence: "
                                                                    (QREFELT $
                                                                             44))
                                                                   (SPADCALL
                                                                    |pb|
                                                                    (QREFELT $
                                                                             68))
                                                                   (QREFELT $
                                                                            43))
                                                                  (SPADCALL " "
                                                                            (QREFELT
                                                                             $
                                                                             44))
                                                                  (QREFELT $
                                                                           43))
                                                                 (SPADCALL |pe|
                                                                           (QREFELT
                                                                            $
                                                                            68))
                                                                 (QREFELT $
                                                                          43))
                                                                (SPADCALL
                                                                 " rel = "
                                                                 (QREFELT $
                                                                          44))
                                                                (QREFELT $ 43))
                                                               (SPADCALL |rel|
                                                                         (QREFELT
                                                                          $
                                                                          101))
                                                               (QREFELT $ 43))
                                                              (SPADCALL
                                                               " pn = "
                                                               (QREFELT $ 44))
                                                              (QREFELT $ 43))
                                                             (SPADCALL |pn|
                                                                       (QREFELT
                                                                        $ 68))
                                                             (QREFELT $ 43))
                                                            (QREFELT $ 56))))
                                                         (EXIT
                                                          (|GROUPP;infer_coincidencies|
                                                           |ct| |et| |pb| |pe|
                                                           |trace| $))))))
                                                     ('T
                                                      (|error|
                                                       "impossible 4")))))
                                              (LETT #22#
                                                    (PROG1 (CDR #22#)
                                                      (LETT #23#
                                                            (PROG1 (CDR #23#)
                                                              (LETT #24#
                                                                    (CDR
                                                                     #24#))))))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (COND
                                           ((NULL |closed|)
                                            (|error| "impossible 5")))))
                                    NIL (GO G190) G191 (EXIT NIL)))
                              #26# (EXIT #25#))
                             (EXIT 'T)))))))
          #29# (EXIT #13#)))) 

(SDEFUN |GROUPP;invertMap|
        ((|a| |TwoDimensionalArray| (|NonNegativeInteger|))
         ($ |TwoDimensionalArray| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#1=#:G510 NIL) (|x| NIL)
          (|invm| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |invm|
                (SPADCALL (SPADCALL |a| (QREFELT $ 85))
                          (SPADCALL |a| (QREFELT $ 102)) 0 (QREFELT $ 96)))
          (SEQ (LETT |x| 1) (LETT #1# (SPADCALL |a| (QREFELT $ 85))) G190
               (COND ((|greater_SI| |x| #1#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |a| |x| 1 (QREFELT $ 103)))
                    (EXIT
                     (COND
                      ((SPADCALL |i| 0 (QREFELT $ 60))
                       (SPADCALL |invm| |i| 1 |x| (QREFELT $ 104))))))
               (LETT |x| (|inc_SI| |x|)) (GO G190) G191 (EXIT NIL))
          (EXIT |invm|)))) 

(SDEFUN |GROUPP;relatorTables|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #2=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|rels| |List| (|List| (|Integer|)))
         ($ |List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
        (SPROG
         ((|relators| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|relatorTrim| #3=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|part2| (|NonNegativeInteger|)) (#4=#:G520 NIL) (|part1| #2#)
          (|relator| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|fst| (|Boolean|)) (|relatorn| #3#) (|gNum| (|NonNegativeInteger|))
          (#5=#:G515 NIL) (#6=#:G531 NIL) (|g| NIL) (#7=#:G530 NIL) (|r| NIL)
          (|invGenLists|
           (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#8=#:G529 NIL) (|a| NIL) (#9=#:G528 NIL)
          (|genLists| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#10=#:G513 NIL) (|np| #2#) (|ct| #1#))
         (SEQ (LETT |ct| (QVELT |state| 0)) (LETT |np| (QVELT |state| 5))
              (LETT |genLists|
                    (SPADCALL |ct|
                              (PROG1
                                  (LETT #10# (SPADCALL |ct| (QREFELT $ 102)))
                                (|check_subtype2| (> #10# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|)
                                                  #10#))
                              (QREFELT $ 105)))
              (LETT |invGenLists|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |a| NIL) (LETT #8# |genLists|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |a| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9# (CONS (|GROUPP;invertMap| |a| $) #9#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |relators| NIL)
              (SEQ (LETT |r| NIL) (LETT #7# |rels|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |r| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |relator| (SPADCALL 0 0 0 (QREFELT $ 96)))
                        (LETT |fst| 'T)
                        (SEQ (LETT |g| NIL) (LETT #6# |r|) G190
                             (COND
                              ((OR (ATOM #6#) (PROGN (LETT |g| (CAR #6#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gNum|
                                    (PROG1 (LETT #5# (ABS |g|))
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#)))
                              (LETT |relatorn|
                                    (COND
                                     ((SPADCALL |g| 0 (QREFELT $ 41))
                                      (SPADCALL |genLists| |gNum|
                                                (QREFELT $ 90)))
                                     ('T
                                      (SPADCALL |invGenLists| |gNum|
                                                (QREFELT $ 90)))))
                              (EXIT
                               (COND
                                (|fst|
                                 (SEQ (LETT |relator| |relatorn|)
                                      (EXIT (LETT |fst| NIL))))
                                ('T
                                 (LETT |relator|
                                       (SPADCALL |relator| |relatorn|
                                                 (QREFELT $ 106)))))))
                             (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                        (LETT |relatorTrim| |relator|)
                        (COND
                         ((SPADCALL (SPADCALL |relatorTrim| (QREFELT $ 85))
                                    |np| (QREFELT $ 49))
                          (SEQ (LETT |part1| |np|)
                               (LETT |part2|
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL
                                                (SPADCALL |relatorTrim|
                                                          (QREFELT $ 85))
                                                |np| (QREFELT $ 87)))
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0)
                                                       (|NonNegativeInteger|)
                                                       (|Union|
                                                        (|NonNegativeInteger|)
                                                        "failed")
                                                       #4#)))
                               (LETT |cts|
                                     (SPADCALL |relatorTrim|
                                               (LIST |part1| |part2|)
                                               (QREFELT $ 88)))
                               (EXIT
                                (LETT |relatorTrim|
                                      (SPADCALL |cts| 1 (QREFELT $ 90)))))))
                        (EXIT
                         (LETT |relators|
                               (SPADCALL |relators| |relatorTrim|
                                         (QREFELT $ 107)))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT |relators|)))) 

(SDEFUN |GROUPP;generators2Permutation|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| #3=(|NonNegativeInteger|))
          (|:| |number_of_indices| #4=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|trace| |Boolean|) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|pl| (|List| (|Permutation| (|Integer|))))
          (|p| (|Permutation| (|Integer|))) (|gl| (|List| (|Integer|)))
          (#5=#:G551 NIL) (|j| (|SingleInteger|)) (|kk| (|NonNegativeInteger|))
          (#6=#:G550 NIL) (#7=#:G549 NIL) (|i| NIL)
          (|perm_lists| (|Vector| (|List| (|Integer|)))) (#8=#:G548 NIL)
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|))) (|et| #2#)
          (|n_inds| #4#) (|n_gens| #3#) (|ct| #1#))
         (SEQ (LETT |ct| (QVELT |state| 0))
              (COND
               (|trace|
                (SPADCALL
                 (SPADCALL "generators2Permutation generators=" (QREFELT $ 44))
                 (QREFELT $ 56))))
              (LETT |n_gens| (QVELT |state| 4))
              (LETT |n_inds| (QVELT |state| 5)) (LETT |et| (QVELT |state| 1))
              (LETT |net| (SPADCALL |n_inds| 0 (QREFELT $ 98))) (LETT |j| 0)
              (SEQ (LETT |i| 1) (LETT #8# |n_inds|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                           ('T
                            (SEQ (LETT |j| (|add_SI| |j| 1))
                                 (EXIT (QSETAREF1O |net| |i| |j| 1)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |perm_lists| (MAKEARR1 |n_gens| NIL))
              (SEQ (LETT |i| 1) (LETT #7# |n_inds|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                           ('T
                            (SEQ (LETT |j| 1) (LETT #6# |n_gens|) G190
                                 (COND ((|greater_SI| |j| #6#) (GO G191)))
                                 (SEQ (LETT |kk| (QAREF2O |ct| |i| |j| 1 1))
                                      (EXIT
                                       (COND
                                        ((EQL |kk| 0)
                                         (SEQ
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL "i = "
                                                          (QREFELT $ 44))
                                                (SPADCALL |i| (QREFELT $ 68))
                                                (QREFELT $ 43))
                                               (SPADCALL " j = "
                                                         (QREFELT $ 44))
                                               (QREFELT $ 43))
                                              (SPADCALL |j| (QREFELT $ 68))
                                              (QREFELT $ 43))
                                             (SPADCALL " ct(i) = "
                                                       (QREFELT $ 44))
                                             (QREFELT $ 43))
                                            (SPADCALL
                                             (SPADCALL |ct| |i|
                                                       (QREFELT $ 108))
                                             (QREFELT $ 109))
                                            (QREFELT $ 43))
                                           (QREFELT $ 56))
                                          (EXIT
                                           (|error|
                                            "incomplete coset table"))))
                                        ('T
                                         (SEQ
                                          (LETT |kk|
                                                (QAREF1O |net|
                                                         (|GROUPP;find| |et|
                                                          |kk| $)
                                                         1))
                                          (EXIT
                                           (QSETAREF1O |perm_lists| |j|
                                                       (CONS |kk|
                                                             (QAREF1O
                                                              |perm_lists| |j|
                                                              1))
                                                       1)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |pl| NIL)
              (COND
               (|trace|
                (SPADCALL (SPADCALL |perm_lists| (QREFELT $ 111))
                          (QREFELT $ 56))))
              (SEQ (LETT |j| 1) (LETT #5# |n_gens|) G190
                   (COND ((|greater_SI| |j| #5#) (GO G191)))
                   (SEQ
                    (LETT |gl|
                          (NREVERSE
                           (SPADCALL |perm_lists| |j| (QREFELT $ 112))))
                    (LETT |p| (SPADCALL |gl| (QREFELT $ 114)))
                    (EXIT (LETT |pl| (CONS |p| |pl|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (LETT |pl| (NREVERSE |pl|))
              (EXIT (SPADCALL |pl| (QREFELT $ 117)))))) 

(SDEFUN |GROUPP;toPermutationIfCan;$U;46|
        ((|a| $) ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPADCALL |a| NIL (QREFELT $ 119))) 

(SDEFUN |GROUPP;toPermutationIfCan;$BU;47|
        ((|a| $) (|trace| |Boolean|)
         ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPADCALL |a| NIL |trace| (QREFELT $ 121))) 

(SDEFUN |GROUPP;convert_words|
        ((|words| |List| (|List| #1=(|Integer|)))
         (|inv_tab| |OneDimensionalArray| (|NonNegativeInteger|))
         ($ |List| (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|nrwords| (|List| (|List| (|NonNegativeInteger|))))
          (|nwords| (|List| (|List| (|NonNegativeInteger|)))) (#2=#:G570 NIL)
          (|i| NIL) (#3=#:G569 NIL) (|nword| (|List| (|NonNegativeInteger|)))
          (|gen| #1#) (#4=#:G568 NIL) (#5=#:G567 NIL) (|word| NIL))
         (SEQ (LETT |nwords| NIL) (LETT |nrwords| NIL)
              (SEQ (LETT |word| NIL) (LETT #5# |words|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |word| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nword| NIL)
                        (SEQ (LETT |i| NIL) (LETT #4# |word|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gen|
                                    (COND ((SPADCALL |i| 0 (QREFELT $ 41)) |i|)
                                          ('T
                                           (SPADCALL |inv_tab| (- |i|)
                                                     (QREFELT $ 100)))))
                              (EXIT (LETT |nword| (CONS |gen| |nword|))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (LETT |nwords| (CONS |nword| |nwords|))
                        (EXIT
                         (LETT |nrwords|
                               (CONS
                                (NREVERSE
                                 (PROGN
                                  (LETT #3# NIL)
                                  (SEQ (LETT |i| NIL) (LETT #2# |nword|) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |i| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #3#
                                               (CONS
                                                (SPADCALL |inv_tab| |i|
                                                          (QREFELT $ 100))
                                                #3#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #3#)))))
                                |nrwords|))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (LETT |nwords| (NREVERSE |nwords|))
              (LETT |nrwords| (NREVERSE |nrwords|))
              (EXIT (LIST |nwords| |nrwords|))))) 

(SDEFUN |GROUPP;toPermutationIfCan;$LBU;49|
        ((|a| $) (|sg| |List| (|List| (|Integer|))) (|trace| |Boolean|)
         ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G590 NIL) (#2=#:G591 NIL) (#3=#:G592 NIL)
          (|changedByDeduction| #4=(|Boolean|)) (|dummy| #4#)
          (|sgens_lens| (|List| #5=(|NonNegativeInteger|))) (#6=#:G597 NIL)
          (|word| NIL) (#7=#:G596 NIL) (|nrsgens| NIL)
          (|#G191| #8=(|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|nsgens| NIL) (|#G190| #8#)
          (|state|
           (|Record|
            (|:| |coset_table| (|TwoDimensionalArray| (|NonNegativeInteger|)))
            (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |inverse_table|
                 (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |closed_point| (|NonNegativeInteger|))
            (|:| |number_of_generators| (|NonNegativeInteger|))
            (|:| |number_of_indices| (|NonNegativeInteger|))
            (|:| |number_of_points| (|NonNegativeInteger|))
            (|:| |max_number_of_indices| (|NonNegativeInteger|))))
          (|loopLimit| (|NonNegativeInteger|))
          (|rel_lens| (|List| (|NonNegativeInteger|))) (#9=#:G595 NIL)
          (|rel| NIL) (#10=#:G594 NIL) (|nrrels| NIL) (|#G186| #8#)
          (|nrels| NIL) (|#G185| #8#) (#11=#:G593 NIL) (|i| NIL)
          (|inv_tab| #12=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|et| #12#) (|ct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|numGens| #5#) (|unit| (|Permutation| (|Integer|)))
          (|rs| (|List| (|List| (|Integer|))))
          (|gs| (|List| (|NonNegativeInteger|)))
          (|numberPoints| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |numberPoints| 1)
                (LETT |gs| (SPADCALL (QCAR |a|) (QREFELT $ 17)))
                (LETT |rs| (QCDR |a|))
                (COND
                 ((EQL (SPADCALL |gs| (QREFELT $ 64)) 0)
                  (COND
                   ((EQL (LENGTH |rs|) 0)
                    (SEQ (LETT |unit| (|spadConstant| $ 122))
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (CONS 0
                                       (SPADCALL (LIST |unit|)
                                                 (QREFELT $ 117))))
                           (GO #13=#:G589))))))))
                (COND
                 ((SPADCALL (SPADCALL |gs| (QREFELT $ 64)) (LENGTH |rs|)
                            (QREFELT $ 49))
                  (PROGN (LETT #3# (CONS 1 "failed")) (GO #13#))))
                (LETT |numGens| (SPADCALL |gs| (QREFELT $ 64)))
                (LETT |ct|
                      (SPADCALL 10 (SPADCALL 2 |numGens| (QREFELT $ 123)) 0
                                (QREFELT $ 96)))
                (LETT |et| (SPADCALL 10 0 (QREFELT $ 98)))
                (SEQ (LETT |i| 1) G190 (COND ((|greater_SI| |i| 10) (GO G191)))
                     (SEQ (EXIT (QSETAREF1O |et| |i| |i| 1)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |inv_tab|
                      (SPADCALL (SPADCALL 2 |numGens| (QREFELT $ 123)) 0
                                (QREFELT $ 98)))
                (SEQ (LETT |i| 1) (LETT #11# |numGens|) G190
                     (COND ((|greater_SI| |i| #11#) (GO G191)))
                     (SEQ (QSETAREF1O |inv_tab| |i| (+ |i| |numGens|) 1)
                          (EXIT
                           (QSETAREF1O |inv_tab| (+ |i| |numGens|) |i| 1)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (PROGN
                 (LETT |#G185| (|GROUPP;convert_words| |rs| |inv_tab| $))
                 (LETT |#G186| |#G185|)
                 (LETT |nrels| (|SPADfirst| |#G186|))
                 (LETT |#G186| (CDR |#G186|))
                 (LETT |nrrels| (|SPADfirst| |#G186|))
                 |#G185|)
                (LETT |rel_lens|
                      (PROGN
                       (LETT #10# NIL)
                       (SEQ (LETT |rel| NIL) (LETT #9# |nrels|) G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |rel| (CAR #9#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10#
                                    (CONS (SPADCALL |rel| (QREFELT $ 64))
                                          #10#))))
                            (LETT #9# (CDR #9#)) (GO G190) G191
                            (EXIT (NREVERSE #10#)))))
                (LETT |loopLimit| (QUOTIENT2 5000000 |numGens|))
                (LETT |state|
                      (VECTOR |ct| |et| |inv_tab| 0 |numGens| 1 1 |loopLimit|))
                (PROGN
                 (LETT |#G190| (|GROUPP;convert_words| |sg| |inv_tab| $))
                 (LETT |#G191| |#G190|)
                 (LETT |nsgens| (|SPADfirst| |#G191|))
                 (LETT |#G191| (CDR |#G191|))
                 (LETT |nrsgens| (|SPADfirst| |#G191|))
                 |#G190|)
                (LETT |sgens_lens|
                      (PROGN
                       (LETT #7# NIL)
                       (SEQ (LETT |word| NIL) (LETT #6# |nsgens|) G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |word| (CAR #6#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS (SPADCALL |word| (QREFELT $ 64))
                                          #7#))))
                            (LETT #6# (CDR #6#)) (GO G190) G191
                            (EXIT (NREVERSE #7#)))))
                (LETT |dummy|
                      (|GROUPP;inferFromRelations| |state|
                       (SPADCALL |nsgens| |nrels| (QREFELT $ 124))
                       (SPADCALL |nrsgens| |nrrels| (QREFELT $ 124))
                       (SPADCALL |sgens_lens| |rel_lens| (QREFELT $ 76))
                       |trace| $))
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ
                          (LETT |changedByDeduction|
                                (|GROUPP;inferFromRelations| |state| |nrels|
                                 |nrrels| |rel_lens| |trace| $))
                          (COND
                           ((NULL |changedByDeduction|)
                            (SEQ
                             (COND
                              (|trace|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL "finished using " (QREFELT $ 44))
                                 (SPADCALL (QVELT |state| 5) (QREFELT $ 68))
                                 (QREFELT $ 43))
                                (QREFELT $ 56))))
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (CONS 0
                                           (|GROUPP;generators2Permutation|
                                            |state| |trace| $)))
                               (GO #13#))))))
                          (COND
                           (|trace|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL "relatorTables=" (QREFELT $ 44))
                              (SPADCALL (|GROUPP;relatorTables| |state| |rs| $)
                                        (QREFELT $ 125))
                              (QREFELT $ 43))
                             (QREFELT $ 56))))
                          (EXIT
                           (COND
                            ((>= (QVELT |state| 5) |loopLimit|)
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# |$NoValue|)
                                     (GO #14=#:G587)))
                              (GO #15=#:G586)))))))
                        #15# (EXIT #1#))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #14# (EXIT #2#))
                (EXIT (CONS 1 "failed"))))
          #13# (EXIT #3#)))) 

(SDEFUN |GROUPP;coerce;$Of;50| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|rs| (|List| (|List| (|Integer|))))
          (|g| (|OutputForm|)) (|ps| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT $ 126)))
              (LETT |g| (|GROUPP;outputGenList| |ps| $)) (LETT |rs| (QCDR |s|))
              (LETT |r| (|GROUPP;outputRelList| |rs| $))
              (EXIT
               (SPADCALL
                (LIST (SPADCALL "<" (QREFELT $ 44)) |g|
                      (SPADCALL " | " (QREFELT $ 44)) |r|
                      (SPADCALL ">" (QREFELT $ 44)))
                (QREFELT $ 45)))))) 

(DECLAIM (NOTINLINE |GroupPresentation;|)) 

(DEFUN |GroupPresentation| ()
  (SPROG NIL
         (PROG (#1=#:G601)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GroupPresentation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GroupPresentation|
                             (LIST
                              (CONS NIL (CONS 1 (|GroupPresentation;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GroupPresentation|)))))))))) 

(DEFUN |GroupPresentation;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GroupPresentation|))
          (LETT $ (GETREFV 129))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GroupPresentation| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record|
                     (|:| |gens| (|PrimitiveArray| (|NonNegativeInteger|)))
                     (|:| |rels| (|List| (|List| (|Integer|))))))
          $))) 

(MAKEPROP '|GroupPresentation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 18) (|PrimitiveArray| 18)
              (0 . |construct|) (|List| 24) |GROUPP;groupPresentation;LL$;1|
              |GROUPP;groupPresentation;L$;2| |GROUPP;groupPresentation;$;3|
              (|List| $) (|String|) (5 . |concat|) (10 . |entries|)
              (|NonNegativeInteger|) (15 . |#|)
              (|Record| (|:| |OldGen| 18) (|:| |NewGen| 18)) (|List| 20)
              (20 . |concat|) (|Integer|) (|List| 23) (26 . |concat|)
              (32 . |concat|) |GROUPP;refactor;2$;5| (|Set| 18) (38 . |set|)
              (|Boolean|) (43 . ~=) (49 . |entries|) (|Set| 24) (54 . |set|)
              (59 . =) |GROUPP;=;2$B;6| (|Character|) (65 . |elt|)
              (|OutputForm|) (71 . |coerce|) (76 . >) (82 . |outputForm|)
              (87 . |hconcat|) (93 . |message|) (98 . |hconcat|) (|List| 39)
              (103 . |concat|) (109 . |commaSeparate|) (114 . >)
              (120 . |blankSeparate|) (125 . |member?|) (131 . |concat|)
              (137 . |remove|) (143 . |remove|) (|Void|) (149 . |print|)
              (154 . |second|) (159 . |sign|) (164 . ~=) (170 . ~=) (176 . =)
              (182 . |copy|) (187 . |coerce|) (192 . |#|) (197 . |elt|)
              (203 . |elt|) |GROUPP;coerce;$Of;50| (209 . |coerce|)
              (214 . |concat|) |GROUPP;simplify;$B$;30| |GROUPP;simplify;2$;29|
              |GROUPP;quotient;$L$;32| (220 . |entries|) (225 . |concat|)
              |GROUPP;quotient;$L$;33| (231 . |concat|) (237 . |concat|)
              |GROUPP;directProduct;3$;34| (|PositiveInteger|)
              |GROUPP;cyclicGroup;Pi$;35| |GROUPP;dihedralGroup;Pi$;36|
              |GROUPP;symmetricGroup;Pi$;37| (|TwoDimensionalArray| 18)
              (242 . |coerce|) (247 . |nrows|) (|Union| $ '"failed")
              (252 . |subtractIfCan|) (258 . |vertSplit|) (|List| 83)
              (264 . |elt|) (270 . |maxColIndex|) (|List| 7) (275 . |coerce|)
              (280 . |maxRowIndex|) (285 . *) (291 . |new|)
              (|OneDimensionalArray| 18) (298 . |new|) (304 . |coerce|)
              (309 . |elt|) (315 . |coerce|) (320 . |ncols|) (325 . |elt|)
              (332 . |setelt!|) (340 . |horizSplit|) (346 . |horizConcat|)
              (352 . |concat|) (358 . |row|) (364 . |coerce|) (|Vector| 24)
              (369 . |coerce|) (374 . |elt|) (|Permutation| 23)
              (380 . |coerceImages|) (|List| 113) (|PermutationGroup| 23)
              (385 . |permutationGroup|) (|Union| 116 '"failed")
              |GROUPP;toPermutationIfCan;$BU;47|
              |GROUPP;toPermutationIfCan;$U;46|
              |GROUPP;toPermutationIfCan;$LBU;49| (390 . |One|) (394 . *)
              (400 . |concat|) (406 . |coerce|) (411 . |parts|)
              (|SingleInteger|) (|HashState|))
           '#(~= 416 |toPermutationIfCan| 422 |symmetricGroup| 440 |simplify|
              445 |refactor| 456 |quotient| 461 |latex| 473 |hashUpdate!| 478
              |hash| 484 |groupPresentation| 489 |directProduct| 504
              |dihedralGroup| 510 |cyclicGroup| 515 |coerce| 520 = 525)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 39))
                        (|makeByteWordVec2| 128
                                            '(1 8 0 7 9 1 15 0 14 16 1 8 7 0 17
                                              1 8 18 0 19 2 21 0 0 20 22 2 24 0
                                              0 23 25 2 10 0 0 24 26 1 28 0 7
                                              29 2 28 30 0 0 31 1 10 10 0 32 1
                                              33 0 10 34 2 33 30 0 0 35 2 15 37
                                              0 23 38 1 37 39 0 40 2 23 30 0 0
                                              41 1 39 0 23 42 2 39 0 0 0 43 1
                                              39 0 15 44 1 39 0 14 45 2 46 0 0
                                              39 47 1 39 0 14 48 2 18 30 0 0 49
                                              1 39 0 14 50 2 24 30 23 0 51 2 7
                                              0 0 18 52 2 8 0 18 0 53 2 24 0 23
                                              0 54 1 39 55 0 56 1 24 23 0 57 1
                                              23 23 0 58 2 23 30 0 0 59 2 18 30
                                              0 0 60 2 24 30 0 0 61 1 24 0 0 62
                                              1 24 39 0 63 1 7 18 0 64 2 7 18 0
                                              23 65 2 10 24 0 23 66 1 18 39 0
                                              68 2 24 0 0 0 69 1 7 7 0 73 2 10
                                              0 0 0 74 2 7 0 0 0 76 1 10 0 14
                                              77 1 83 39 0 84 1 83 18 0 85 2 18
                                              86 0 0 87 2 83 14 0 7 88 2 89 83
                                              0 23 90 1 83 23 0 91 1 92 39 0 93
                                              1 83 23 0 94 2 23 0 79 0 95 3 83
                                              0 18 18 18 96 2 97 0 18 18 98 1
                                              23 39 0 99 2 97 18 0 23 100 1 7
                                              39 0 101 1 83 18 0 102 3 83 18 0
                                              23 23 103 4 83 18 0 23 23 18 104
                                              2 83 14 0 79 105 2 83 0 0 0 106 2
                                              89 0 0 83 107 2 83 97 0 23 108 1
                                              97 39 0 109 1 110 39 0 111 2 110
                                              24 0 23 112 1 113 0 24 114 1 116
                                              0 115 117 0 113 0 122 2 18 0 79 0
                                              123 2 92 0 0 0 124 1 89 39 0 125
                                              1 8 7 0 126 2 0 30 0 0 1 2 0 118
                                              0 30 119 3 0 118 0 10 30 121 1 0
                                              118 0 120 1 0 0 79 82 1 0 0 0 71
                                              2 0 0 0 30 70 1 0 0 0 27 2 0 0 0
                                              10 75 2 0 0 0 7 72 1 0 15 0 1 2 0
                                              128 128 0 1 1 0 127 0 1 0 0 0 13
                                              2 0 0 7 10 11 1 0 0 7 12 2 0 0 0
                                              0 78 1 0 0 79 81 1 0 0 79 80 1 0
                                              39 0 67 2 0 30 0 0 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|GroupPresentation| 'NILADIC T) 
