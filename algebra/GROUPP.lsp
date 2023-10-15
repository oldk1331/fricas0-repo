
(SDEFUN |GROUPP;groupPresentation;LL$;1|
        ((|gens1| |List| (|NonNegativeInteger|))
         (|rels1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G160 NIL) (|r| NIL)
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))
                . #2=(|GROUPP;groupPresentation;LL$;1|))
          (LETT |rels2| NIL . #2#)
          (SEQ (LETT |r| NIL . #2#) (LETT #1# |rels1| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (NULL |r|))
                   (LETT |rels2| (SPADCALL |rels2| |r| (QREFELT $ 12))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;L$;2|
        ((|gens1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))
                . #1=(|GROUPP;groupPresentation;L$;2|))
          (LETT |rels2| NIL . #1#) (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;$;3| (($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| NIL . #1=(|GROUPP;groupPresentation;$;3|))
              (LETT |rels1| NIL . #1#)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;mapGen|
        ((|a| |Integer|)
         (|ms| |List|
          (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                    (|:| |NewGen| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((#1=#:G172 NIL) (#2=#:G173 NIL) (|m| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |m| NIL . #3=(|GROUPP;mapGen|))
                       (LETT #2# |ms| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((EQL (ABS |a|) (QCAR |m|))
                          (PROGN (LETT #1# (QCDR |m|) . #3#) (GO #4=#:G171))))
                        (EXIT
                         (COND
                          ((EQL (ABS |a|) (- (QCAR |m|)))
                           (PROGN (LETT #1# (- (QCDR |m|)) . #3#) (GO #4#))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (|error|
                   (SPADCALL
                    (LIST "cant map " (STRINGIMAGE |a|) " in refactor")
                    (QREFELT $ 18)))
                  (EXIT |a|)))
                #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;refactor;2$;5| ((|a| $) ($ $))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|))) (#1=#:G190 NIL) (|gn| NIL)
          (#2=#:G189 NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|newRel| (|List| (|Integer|))) (|newEle| (|Integer|))
          (#3=#:G188 NIL) (|ele| NIL) (#4=#:G187 NIL) (|rel| NIL)
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (#5=#:G185 NIL) (|g| NIL) (#6=#:G186 NIL))
         (SEQ (LETT |gms| NIL . #7=(|GROUPP;refactor;2$;5|))
              (SEQ (LETT |gn| 1 . #7#)
                   (LETT #6# (SPADCALL (QCAR |a|) (QREFELT $ 21)) . #7#)
                   (LETT |g| NIL . #7#)
                   (LETT #5# (SPADCALL (QCAR |a|) (QREFELT $ 19)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |gn| #6#))
                     (GO G191)))
                   (SEQ (LETT |gm| (CONS |g| |gn|) . #7#)
                        (EXIT
                         (LETT |gms| (SPADCALL |gms| |gm| (QREFELT $ 24))
                               . #7#)))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |gn| (|inc_SI| |gn|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |rels1| NIL . #7#)
              (SEQ (LETT |rel| NIL . #7#) (LETT #4# (QCDR |a|) . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newRel| NIL . #7#)
                        (SEQ (LETT |ele| NIL . #7#) (LETT #3# |rel| . #7#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ele| (CAR #3#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newEle| (|GROUPP;mapGen| |ele| |gms| $)
                                    . #7#)
                              (EXIT
                               (LETT |newRel|
                                     (SPADCALL |newRel| |newEle|
                                               (QREFELT $ 26))
                                     . #7#)))
                             (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |newRel| (QREFELT $ 12))
                               . #7#)))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |gens1|
                    (PROGN
                     (LETT #2# NIL . #7#)
                     (SEQ (LETT |gn| 1 . #7#)
                          (LETT #1# (SPADCALL (QCAR |a|) (QREFELT $ 21)) . #7#)
                          G190 (COND ((|greater_SI| |gn| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |gn| #2#) . #7#)))
                          (LETT |gn| (|inc_SI| |gn|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #7#)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;=;2$B;6| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|brs| #1=(|List| (|List| (|Integer|)))) (|ars| #1#) (#2=#:G195 NIL)
          (|bgs| #3=(|List| (|NonNegativeInteger|))) (|ags| #3#) (|br| ($))
          (|ar| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ar| (SPADCALL |a| (QREFELT $ 27)) . #4=(|GROUPP;=;2$B;6|))
            (LETT |br| (SPADCALL |b| (QREFELT $ 27)) . #4#)
            (LETT |ags| (SPADCALL (QCAR |ar|) (QREFELT $ 19)) . #4#)
            (LETT |bgs| (SPADCALL (QCAR |br|) (QREFELT $ 19)) . #4#)
            (COND
             ((SPADCALL (SPADCALL |ags| (QREFELT $ 29))
                        (SPADCALL |bgs| (QREFELT $ 29)) (QREFELT $ 31))
              (PROGN (LETT #2# NIL . #4#) (GO #5=#:G194))))
            (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT $ 32)) . #4#)
            (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT $ 32)) . #4#)
            (EXIT
             (SPADCALL (SPADCALL |ars| (QREFELT $ 34))
                       (SPADCALL |brs| (QREFELT $ 34)) (QREFELT $ 35)))))
          #5# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGen| ((|i2| |Integer|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G199 NIL) (|n| (|OutputForm|)) (|letters| (|String|))
          (|i| #2=(|Integer|)) (|suffix| #3=(|Integer|))
          (|#G18| (|Record| (|:| |quotient| #3#) (|:| |remainder| #2#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G18| (DIVIDE2 (ABS |i2|) 25) . #4=(|GROUPP;outputGen|))
             (LETT |suffix| (QCAR |#G18|) . #4#)
             (LETT |i| (QCDR |#G18|) . #4#)
             |#G18|)
            (LETT |letters| "eabcdfghijklmnopqrstuvwxyz" . #4#)
            (LETT |n|
                  (SPADCALL (SPADCALL |letters| (+ |i| 1) (QREFELT $ 38))
                            (QREFELT $ 40))
                  . #4#)
            (COND
             ((SPADCALL |suffix| 0 (QREFELT $ 41))
              (LETT |n|
                    (SPADCALL |n| (SPADCALL (+ |suffix| 1) (QREFELT $ 42))
                              (QREFELT $ 43))
                    . #4#)))
            (COND
             ((< |i2| 0)
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL "-" (QREFELT $ 44)) |n|
                               (QREFELT $ 43))
                     . #4#)
               (GO #5=#:G198))))
            (EXIT |n|)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputRel| ((|r| |List| (|Integer|)) ($ |OutputForm|))
        (SPROG
         ((|seperator| #1=(|OutputForm|)) (|eleout| #1#)
          (|newterm| (|OutputForm|)) (#2=#:G204 NIL) (|ele| NIL))
         (SEQ
          (LETT |eleout| (SPADCALL "" (QREFELT $ 44))
                . #3=(|GROUPP;outputRel|))
          (LETT |seperator| (SPADCALL " " (QREFELT $ 44)) . #3#)
          (SEQ (LETT |ele| NIL . #3#) (LETT #2# |r| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ele| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |newterm| (|GROUPP;outputGen| |ele| $) . #3#)
                    (LETT |eleout|
                          (SPADCALL (LIST |eleout| |seperator| |newterm|)
                                    (QREFELT $ 45))
                          . #3#)
                    (EXIT
                     (LETT |seperator| (SPADCALL "*" (QREFELT $ 44)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |eleout|)))) 

(SDEFUN |GROUPP;outputRelList|
        ((|i2| |List| (|List| (|Integer|))) ($ |OutputForm|))
        (SPROG
         ((#1=#:G209 NIL) (|rels1| (|List| (|OutputForm|))) (#2=#:G210 NIL)
          (|r| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rels1| NIL . #3=(|GROUPP;outputRelList|))
                (SEQ (LETT |r| NIL . #3#) (LETT #2# |i2| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |rels1|
                             (SPADCALL |rels1| (|GROUPP;outputRel| |r| $)
                                       (QREFELT $ 47))
                             . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |rels1|) 0 (QREFELT $ 41))
                  (PROGN
                   (LETT #1# (SPADCALL |rels1| (QREFELT $ 48)) . #3#)
                   (GO #4=#:G208))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputGenList|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((#1=#:G215 NIL) (|gens1| (|List| (|OutputForm|))) (#2=#:G216 NIL)
          (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| NIL . #3=(|GROUPP;outputGenList|))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# |ps| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |gens1|
                             (SPADCALL |gens1| (|GROUPP;outputGen| |p| $)
                                       (QREFELT $ 47))
                             . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |gens1|) 0 (QREFELT $ 49))
                  (PROGN
                   (LETT #1# (SPADCALL |gens1| (QREFELT $ 50)) . #3#)
                   (GO #4=#:G214))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;indexesOfRelUsingGen|
        ((|s| $) (|gen| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G223 NIL) (|rel| NIL)
          (#2=#:G224 NIL) (|reln| NIL) (|r| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |res| NIL . #3=(|GROUPP;indexesOfRelUsingGen|))
              (LETT |r| (QCDR |s|) . #3#)
              (SEQ (LETT |reln| 1 . #3#) (LETT #2# (LENGTH |r|) . #3#)
                   (LETT |rel| NIL . #3#) (LETT #1# |r| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #3#) NIL)
                         (|greater_SI| |reln| #2#))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |gen| |rel| (QREFELT $ 51))
                      (LETT |res| (SPADCALL |res| |reln| (QREFELT $ 52))
                            . #3#)))
                    (EXIT
                     (COND
                      ((SPADCALL |gen| 0 (QREFELT $ 49))
                       (COND
                        ((SPADCALL (- |gen|) |rel| (QREFELT $ 51))
                         (LETT |res| (SPADCALL |res| |reln| (QREFELT $ 52))
                               . #3#)))))))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT |reln| (|inc_SI| |reln|) . #3#))
                         . #3#)
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
        (SPROG ((#1=#:G229 NIL) (|rel| NIL) (#2=#:G228 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GROUPP;removeGen2|))
                 (SEQ (LETT |rel| NIL . #3#) (LETT #1# |rels1| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rel| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (- |val|)
                                         (SPADCALL |val| |rel| (QREFELT $ 54))
                                         (QREFELT $ 54))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GROUPP;replaceGen|
        ((|rels1| |List| (|List| (|Integer|))) (|val1| |NonNegativeInteger|)
         (|val2| |Integer|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|e| (|Integer|)) (#1=#:G238 NIL) (|ele| NIL) (#2=#:G237 NIL)
          (|rel| NIL))
         (SEQ (LETT |rels2| NIL . #3=(|GROUPP;replaceGen|))
              (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rel| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ (LETT |e| (ABS |ele|) . #3#)
                                  (COND
                                   ((EQL |e| |val1|) (LETT |e| |val2| . #3#)))
                                  (COND ((< |ele| 0) (LETT |e| (- |e|) . #3#)))
                                  (EXIT
                                   (LETT |rel2|
                                         (SPADCALL |rel2| |e| (QREFELT $ 26))
                                         . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels2| (SPADCALL |rels2| |rel2| (QREFELT $ 12))
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |rels2|)))) 

(SDEFUN |GROUPP;TTRemoveGeneratorIfIdentity|
        ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G244 NIL)
          (|toBeRemoved| (|NonNegativeInteger|)) (#2=#:G245 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gens1| (QCAR |s|)
                  . #3=(|GROUPP;TTRemoveGeneratorIfIdentity|))
            (LETT |rels1| (QCDR |s|) . #3#) (LETT |toBeRemoved| 0 . #3#)
            (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (LENGTH |rel|) 1)
                     (COND
                      ((EQL |toBeRemoved| 0)
                       (LETT |toBeRemoved| (ABS (|SPADfirst| |rel|))
                             . #3#)))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (COND
             ((EQL |toBeRemoved| 0)
              (PROGN (LETT #1# |s| . #3#) (GO #4=#:G243))))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (LIST (SPADCALL "simplify: generator '" (QREFELT $ 44))
                      (|GROUPP;outputGen| |toBeRemoved| $)
                      (SPADCALL "' is identity so remove it" (QREFELT $ 44)))
                (QREFELT $ 45))
               (QREFELT $ 56))))
            (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $) . #3#)
            (LETT |rels1| (|GROUPP;removeGen2| |rels1| |toBeRemoved| $) . #3#)
            (COND
             (|trace|
              (SPADCALL (|GROUPP;outputRelList| |rels1| $) (QREFELT $ 56))))
            (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRenameGenerator| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G253 NIL)
          (|replaceFrom| (|NonNegativeInteger|)) (|replaceTo| (|Integer|))
          (#2=#:G254 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRenameGenerator|))
                (LETT |rels1| (QCDR |s|) . #3#) (LETT |replaceFrom| 0 . #3#)
                (LETT |replaceTo| 0 . #3#)
                (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 2)
                         (COND
                          ((EQL |replaceFrom| 0)
                           (SEQ
                            (LETT |replaceTo| (SPADCALL |rel| (QREFELT $ 57))
                                  . #3#)
                            (LETT |replaceFrom| (ABS (|SPADfirst| |rel|))
                                  . #3#)
                            (COND
                             ((SPADCALL (|SPADfirst| |rel|) 0 (QREFELT $ 41))
                              (LETT |replaceTo| (- |replaceTo|) . #3#)))
                            (EXIT
                             (COND
                              ((EQL |replaceFrom| (ABS |replaceTo|))
                               (LETT |replaceFrom| 0 . #3#)))))))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |replaceFrom| 0)
                  (PROGN (LETT #1# |s| . #3#) (GO #4=#:G252))))
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
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |replaceFrom| $)
                      . #3#)
                (LETT |rels1|
                      (|GROUPP;replaceGen| |rels1| |replaceFrom| |replaceTo| $)
                      . #3#)
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| $)
                            (QREFELT $ 56))))
                (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveEmpty| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G259 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #2=(|GROUPP;TTRemoveEmpty|))
              (LETT |rels1| (QCDR |s|) . #2#) (LETT |rels2| NIL . #2#)
              (SEQ (LETT |rel| NIL . #2#) (LETT #1# |rels1| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |rel|))
                       (LETT |rels2| (SPADCALL |rels2| |rel| (QREFELT $ 12))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTRemoveZero| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #1=(|GROUPP;TTRemoveZero|))
              (LETT |rels1| (QCDR |s|) . #1#)
              (LETT |gens1| (|GROUPP;removeGen| |gens1| 0 $) . #1#)
              (LETT |rels1| (|GROUPP;removeGen2| |rels1| 0 $) . #1#)
              (EXIT (CONS |gens1| |rels1|))))) 

(SDEFUN |GROUPP;TTRemoveEleTimesInverse| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|lastele| (|Integer|)) (|changed| (|Boolean|)) (#1=#:G277 NIL)
          (|ele| NIL) (#2=#:G276 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRemoveEleTimesInverse|))
              (LETT |rels1| (QCDR |s|) . #3#) (LETT |rels2| NIL . #3#)
              (LETT |changed| NIL . #3#)
              (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL . #3#) (LETT |lastele| 0 . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rel| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
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
                                    (LETT |changed| 'T . #3#)
                                    (EXIT (LETT |lastele| 0 . #3#))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                      (LETT |rel2|
                                            (SPADCALL |rel2| |lastele|
                                                      (QREFELT $ 26))
                                            . #3#)))
                                    (EXIT (LETT |lastele| |ele| . #3#))))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                    (LETT |rel2|
                                          (SPADCALL |rel2| |lastele|
                                                    (QREFELT $ 26))
                                          . #3#)))
                                  (EXIT (LETT |lastele| |ele| . #3#)))))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((SPADCALL |lastele| 0 (QREFELT $ 59))
                          (LETT |rel2|
                                (SPADCALL |rel2| |lastele| (QREFELT $ 26))
                                . #3#)))
                        (EXIT
                         (COND
                          ((NULL (NULL |rel2|))
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel2| (QREFELT $ 12))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
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
         ((|relationOut| (|List| (|Integer|))) (#1=#:G281 NIL) (|ele| NIL))
         (SEQ (LETT |relationOut| NIL . #2=(|GROUPP;invertRelation|))
              (SEQ (LETT |ele| NIL . #2#) (LETT #1# |relationIn| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |relationOut| (CONS (- |ele|) |relationOut|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;cycleRelation|
        ((|relationIn| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|relationOut| (|List| (|Integer|))))
               (SEQ
                (LETT |relationOut|
                      (SPADCALL (CDR |relationIn|) (|SPADfirst| |relationIn|)
                                (QREFELT $ 26))
                      |GROUPP;cycleRelation|)
                (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;relationEquivalent|
        ((|relA| |List| (|Integer|)) (|relB| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G291 NIL) (|relBCycle| (|List| (|Integer|))) (#2=#:G292 NIL)
          (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |relA|) (LENGTH |relB|) (QREFELT $ 60))
              (PROGN
               (LETT #1# NIL . #3=(|GROUPP;relationEquivalent|))
               (GO #4=#:G290))))
            (COND
             ((SPADCALL |relA| |relB| (QREFELT $ 61))
              (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (COND
             ((SPADCALL |relA| (|GROUPP;invertRelation| |relB| $)
                        (QREFELT $ 61))
              (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (LETT |relBCycle| (SPADCALL |relB| (QREFELT $ 62)) . #3#)
            (SEQ (LETT |n| 1 . #3#) (LETT #2# (LENGTH |relA|) . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ
                  (LETT |relBCycle| (|GROUPP;cycleRelation| |relBCycle| $)
                        . #3#)
                  (COND
                   ((SPADCALL |relA| |relBCycle| (QREFELT $ 61))
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (EXIT
                   (COND
                    ((SPADCALL |relA| (|GROUPP;invertRelation| |relBCycle| $)
                               (QREFELT $ 61))
                     (PROGN (LETT #1# 'T . #3#) (GO #4#))))))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveDuplicateRelation| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|include| (|Boolean|))
          (#1=#:G303 NIL) (|relb| NIL) (#2=#:G304 NIL) (|nrelb| NIL)
          (#3=#:G301 NIL) (|rela| NIL) (#4=#:G302 NIL) (|nrela| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |gens1| (QCAR |s|) . #5=(|GROUPP;TTRemoveDuplicateRelation|))
          (LETT |rels1| (QCDR |s|) . #5#) (LETT |rels2| NIL . #5#)
          (SEQ (LETT |nrela| 1 . #5#) (LETT #4# (LENGTH |rels1|) . #5#)
               (LETT |rela| NIL . #5#) (LETT #3# |rels1| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |rela| (CAR #3#) . #5#) NIL)
                     (|greater_SI| |nrela| #4#))
                 (GO G191)))
               (SEQ (LETT |include| 'T . #5#)
                    (SEQ (LETT |nrelb| 1 . #5#)
                         (LETT #2# (LENGTH |rels1|) . #5#)
                         (LETT |relb| NIL . #5#) (LETT #1# |rels1| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |relb| (CAR #1#) . #5#) NIL)
                               (|greater_SI| |nrelb| #2#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |nrela| |nrelb| (QREFELT $ 49))
                             (COND
                              ((|GROUPP;relationEquivalent| |rela| |relb| $)
                               (SEQ (LETT |include| NIL . #5#)
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
                                 (LETT |nrelb| (|inc_SI| |nrelb|) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      (|include|
                       (LETT |rels2| (SPADCALL |rels2| |rela| (QREFELT $ 12))
                             . #5#)))))
               (LETT #3#
                     (PROG1 (CDR #3#) (LETT |nrela| (|inc_SI| |nrela|) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTMinimiseInverses| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|numNonInverts| #1=(|NonNegativeInteger|)) (|numInverts| #1#)
          (#2=#:G311 NIL) (|ele| NIL) (#3=#:G310 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #4=(|GROUPP;TTMinimiseInverses|))
              (LETT |rels1| (QCDR |s|) . #4#) (LETT |rels2| NIL . #4#)
              (SEQ (LETT |rel| NIL . #4#) (LETT #3# |rels1| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |numInverts| 0 . #4#)
                        (LETT |numNonInverts| 0 . #4#)
                        (SEQ (LETT |ele| NIL . #4#) (LETT #2# |rel| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< |ele| 0)
                                 (LETT |numInverts| (+ |numInverts| 1) . #4#))
                                ('T
                                 (LETT |numNonInverts| (+ |numNonInverts| 1)
                                       . #4#)))))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |numInverts| |numNonInverts|
                                     (QREFELT $ 49))
                           (LETT |rels2|
                                 (SPADCALL |rels2|
                                           (|GROUPP;invertRelation| |rel| $)
                                           (QREFELT $ 12))
                                 . #4#))
                          ('T
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel| (QREFELT $ 12))
                                 . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;generatorOccurrences|
        ((|rel| |List| (|Integer|)) (|gen| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G318 NIL) (|g| NIL))
               (SEQ (LETT |res| 0 . #2=(|GROUPP;generatorOccurrences|))
                    (SEQ (LETT |g| NIL . #2#) (LETT #1# |rel| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |g| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |g| |gen|) (LETT |res| (+ |res| 1) . #2#)))
                          (EXIT
                           (COND
                            ((SPADCALL |gen| 0 (QREFELT $ 49))
                             (COND
                              ((EQL |g| (- |gen|))
                               (LETT |res| (+ |res| 1) . #2#)))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |GROUPP;removeRelations|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G324 NIL) (|rel| NIL))
         (SEQ (LETT |res| NIL . #2=(|GROUPP;removeRelations|))
              (SEQ (LETT |rel| NIL . #2#) (LETT #1# |rels1| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |val| |rel| (QREFELT $ 51)))
                       (COND
                        ((NULL (SPADCALL (- |val|) |rel| (QREFELT $ 51)))
                         (LETT |res| (SPADCALL |res| |rel| (QREFELT $ 12))
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;TTSubstitute| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| #1=(|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|newRel| (|List| (|Integer|))) (#2=#:G348 NIL) (|x| (|Integer|))
          (|replacement| (|List| (|Integer|))) (|postr| (|List| (|Integer|)))
          (|restr| (|List| #3=(|Integer|))) (|prer| (|List| (|Integer|)))
          (|genInverted| #4=(|Boolean|)) (|found| #4#) (#5=#:G346 NIL)
          (|genToBeRemoved| #6=(|NonNegativeInteger|)) (|n2| #6#)
          (|r2| (|List| (|Integer|))) (|n1| #6#) (|r1| (|List| #3#))
          (|n3| (|NonNegativeInteger|)) (|r3| (|List| (|Integer|)))
          (|indexes| (|List| (|NonNegativeInteger|))) (#7=#:G347 NIL) (|g| NIL)
          (|rs| #1#) (|gs| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gs| (SPADCALL (QCAR |s|) (QREFELT $ 19))
                  . #8=(|GROUPP;TTSubstitute|))
            (LETT |rs| (QCDR |s|) . #8#) (LETT |r1| NIL . #8#)
            (LETT |r2| NIL . #8#) (LETT |n1| 0 . #8#) (LETT |n2| 0 . #8#)
            (LETT |genToBeRemoved| 0 . #8#)
            (SEQ (LETT |g| NIL . #8#) (LETT #7# |gs| . #8#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexes| (|GROUPP;indexesOfRelUsingGen| |s| |g| $)
                        . #8#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |indexes| (QREFELT $ 64)) 2)
                     (COND
                      ((EQL |genToBeRemoved| 0)
                       (SEQ (LETT |genToBeRemoved| |g| . #8#)
                            (LETT |r1|
                                  (SPADCALL |rs|
                                            (SPADCALL |indexes| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 66))
                                  . #8#)
                            (LETT |r2|
                                  (SPADCALL |rs|
                                            (SPADCALL |indexes| 2
                                                      (QREFELT $ 65))
                                            (QREFELT $ 66))
                                  . #8#)
                            (LETT |n1|
                                  (|GROUPP;generatorOccurrences| |r1| |g| $)
                                  . #8#)
                            (LETT |n2|
                                  (|GROUPP;generatorOccurrences| |r2| |g| $)
                                  . #8#)
                            (COND
                             ((SPADCALL |n1| 1 (QREFELT $ 60))
                              (SEQ (LETT |r3| |r1| . #8#)
                                   (LETT |n3| |n1| . #8#)
                                   (LETT |r1| |r2| . #8#)
                                   (LETT |n1| |n2| . #8#)
                                   (LETT |r2| |r3| . #8#)
                                   (EXIT (LETT |n2| |n3| . #8#)))))
                            (EXIT
                             (COND
                              ((SPADCALL |n1| 1 (QREFELT $ 60))
                               (LETT |genToBeRemoved| 0 . #8#)))))))))))
                 (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |n1| 1 (QREFELT $ 60))
              (PROGN (LETT #5# |s| . #8#) (GO #9=#:G345))))
            (COND
             (|trace|
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "simplify: TTSubstitute (" (QREFELT $ 44))
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
            (LETT |restr| |r1| . #8#) (LETT |prer| NIL . #8#)
            (LETT |found| NIL . #8#) (LETT |genInverted| NIL . #8#)
            (SEQ G190
                 (COND ((NULL (NULL (OR (NULL |restr|) |found|))) (GO G191)))
                 (SEQ (LETT |x| (|SPADfirst| |restr|) . #8#)
                      (LETT |restr| (CDR |restr|) . #8#)
                      (EXIT
                       (COND
                        ((OR (EQL |x| |genToBeRemoved|)
                             (EQL |x| (- |genToBeRemoved|)))
                         (SEQ (LETT |found| 'T . #8#)
                              (EXIT
                               (COND
                                ((< |x| 0) (LETT |genInverted| 'T . #8#))))))
                        ('T
                         (LETT |prer| (SPADCALL |prer| |x| (QREFELT $ 26))
                               . #8#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |postr| NIL . #8#)
            (SEQ G190 (COND ((NULL (NULL (NULL |restr|))) (GO G191)))
                 (SEQ (LETT |x| (|SPADfirst| |restr|) . #8#)
                      (LETT |restr| (CDR |restr|) . #8#)
                      (EXIT
                       (LETT |postr| (SPADCALL |postr| |x| (QREFELT $ 26))
                             . #8#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |replacement|
                  (SPADCALL (|GROUPP;invertRelation| |prer| $)
                            (|GROUPP;invertRelation| |postr| $) (QREFELT $ 69))
                  . #8#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL "we will substitute " (QREFELT $ 44))
                             (|GROUPP;outputRel| |replacement| $)
                             (QREFELT $ 43))
                   (SPADCALL " for " (QREFELT $ 44)) (QREFELT $ 43))
                  (|GROUPP;outputGen| |genToBeRemoved| $) (QREFELT $ 43))
                 (SPADCALL " in " (QREFELT $ 44)) (QREFELT $ 43))
                (|GROUPP;outputRel| |r2| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |newRel| NIL . #8#)
            (SEQ (LETT |x| NIL . #8#) (LETT #2# |r2| . #8#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (ABS |x|) (ABS |genToBeRemoved|))
                     (COND
                      (|genInverted|
                       (LETT |newRel|
                             (SPADCALL |newRel|
                                       (|GROUPP;invertRelation| |replacement|
                                        $)
                                       (QREFELT $ 69))
                             . #8#))
                      ('T
                       (LETT |newRel|
                             (SPADCALL |newRel| |replacement| (QREFELT $ 69))
                             . #8#))))
                    ('T
                     (LETT |newRel| (SPADCALL |newRel| |x| (QREFELT $ 26))
                           . #8#)))))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "newRel=" (QREFELT $ 44))
                         (|GROUPP;outputRel| |newRel| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |gens1| (QCAR |s|) . #8#) (LETT |rels1| (QCDR |s|) . #8#)
            (LETT |gens1| (|GROUPP;removeGen| |gens1| |genToBeRemoved| $)
                  . #8#)
            (LETT |rels1| (|GROUPP;removeRelations| |rels1| |genToBeRemoved| $)
                  . #8#)
            (LETT |rels1| (SPADCALL |rels1| |newRel| (QREFELT $ 12)) . #8#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "gens=" (QREFELT $ 44))
                           (|GROUPP;outputGenList|
                            (SPADCALL |gens1| (QREFELT $ 19)) $)
                           (QREFELT $ 43))
                 (SPADCALL " rels=" (QREFELT $ 44)) (QREFELT $ 43))
                (|GROUPP;outputRelList| |rels1| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (EXIT (CONS |gens1| |rels1|))))
          #9# (EXIT #5#)))) 

(SDEFUN |GROUPP;isSimpler?| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G355 NIL) (|relationCompleityB| #2=(|NonNegativeInteger|))
          (#3=#:G357 NIL) (|rel| NIL) (|relationCompleityA| #2#)
          (#4=#:G356 NIL) (|relsb| #5=(|List| (|List| (|Integer|))))
          (|gensb| #6=(|PrimitiveArray| (|NonNegativeInteger|))) (|relsa| #5#)
          (|gensa| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |gensa| (QCAR |a|) . #7=(|GROUPP;isSimpler?|))
                (LETT |relsa| (QCDR |a|) . #7#) (LETT |gensb| (QCAR |b|) . #7#)
                (LETT |relsb| (QCDR |b|) . #7#)
                (COND
                 ((< (SPADCALL |gensa| (QREFELT $ 21))
                     (SPADCALL |gensb| (QREFELT $ 21)))
                  (PROGN (LETT #1# 'T . #7#) (GO #8=#:G354))))
                (COND
                 ((< (LENGTH |relsa|) (LENGTH |relsb|))
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (LETT |relationCompleityA| 0 . #7#)
                (SEQ (LETT |rel| NIL . #7#) (LETT #4# |relsa| . #7#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityA|
                             (+ |relationCompleityA| (LENGTH |rel|)) . #7#)))
                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |relationCompleityB| 0 . #7#)
                (SEQ (LETT |rel| NIL . #7#) (LETT #3# |relsb| . #7#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityB|
                             (+ |relationCompleityB| (LENGTH |rel|)) . #7#)))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |relationCompleityA| |relationCompleityB|)
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (EXIT NIL)))
          #8# (EXIT #1#)))) 

(SDEFUN |GROUPP;simplify;2$;29| ((|s| $) ($ $))
        (SPADCALL |s| NIL (QREFELT $ 70))) 

(SDEFUN |GROUPP;simplify;$B$;30| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|lastpass| ($)) (|level| #1=(|NonNegativeInteger|)) (#2=#:G365 NIL)
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
            (LETT |res| |s| . #3=(|GROUPP;simplify;$B$;30|))
            (LETT |lastpass| |s| . #3#) (LETT |level| 0 . #3#)
            (LETT |loopBreaker| 0 . #3#)
            (SEQ G190 (COND ((NULL (< |loopBreaker| 10000)) (GO G191)))
                 (SEQ (LETT |loopBreaker| (+ |loopBreaker| 1) . #3#)
                      (COND
                       ((EQL |level| 0)
                        (LETT |res| (|GROUPP;TTRemoveEmpty| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 1)
                        (LETT |res| (|GROUPP;TTRemoveZero| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 2)
                        (LETT |res|
                              (|GROUPP;TTRemoveGeneratorIfIdentity| |res|
                               |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 3)
                        (LETT |res|
                              (|GROUPP;TTRenameGenerator| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 4)
                        (LETT |res|
                              (|GROUPP;TTRemoveEleTimesInverse| |res| |trace|
                               $)
                              . #3#)))
                      (COND
                       ((EQL |level| 5)
                        (LETT |res|
                              (|GROUPP;TTRemoveDuplicateRelation| |res| |trace|
                               $)
                              . #3#)))
                      (COND
                       ((EQL |level| 6)
                        (LETT |res| (|GROUPP;TTSubstitute| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 7)
                        (PROGN
                         (LETT #2#
                               (|GROUPP;TTMinimiseInverses| |res| |trace| $)
                               . #3#)
                         (GO #4=#:G364))))
                      (COND
                       ((|GROUPP;isSimpler?| |res| |lastpass| $)
                        (LETT |level| 0 . #3#))
                       ('T (LETT |level| (+ |level| 1) . #3#)))
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
                      (EXIT (LETT |lastpass| |res| . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (SPADCALL
             (SPADCALL
              (SPADCALL "simplify excessive time - loop suspected"
                        (QREFELT $ 44))
              (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
             (QREFELT $ 56))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |GROUPP;offsetIndexes| ((|a| $) (|offset| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|rb| (|List| (|List| (|Integer|)))) (#1=#:G376 NIL) (|y| NIL)
          (#2=#:G375 NIL) (#3=#:G374 NIL) (|z| NIL) (#4=#:G373 NIL)
          (|gb| (|List| (|NonNegativeInteger|))) (#5=#:G372 NIL) (|x| NIL)
          (#6=#:G371 NIL) (|ra| (|List| (|List| (|Integer|))))
          (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ga| (SPADCALL (QCAR |a|) (QREFELT $ 19))
                . #7=(|GROUPP;offsetIndexes|))
          (LETT |ra| (QCDR |a|) . #7#)
          (LETT |gb|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |x| NIL . #7#) (LETT #5# |ga| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS (+ |x| |offset|) #6#) . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |rb|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |z| NIL . #7#) (LETT #3# |ra| . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |z| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #7#)
                                (SEQ (LETT |y| NIL . #7#) (LETT #1# |z| . #7#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |y| (CAR #1#) . #7#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (COND
                                               ((SPADCALL |y| 0 (QREFELT $ 41))
                                                (+ |y| |offset|))
                                               ('T (- |y| |offset|)))
                                              #2#)
                                             . #7#)))
                                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#)
                              . #7#)))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (EXIT (SPADCALL |gb| |rb| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;quotient;$L$;32|
        ((|a| $) (|remgen| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G381 NIL)
          (|toBeRemoved| NIL))
         (SEQ (LETT |gens1| (QCAR |a|) . #2=(|GROUPP;quotient;$L$;32|))
              (LETT |rels1| (QCDR |a|) . #2#)
              (SEQ (LETT |toBeRemoved| NIL . #2#) (LETT #1# |remgen| . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#)
                         (PROGN (LETT |toBeRemoved| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $)
                          . #2#)
                    (EXIT
                     (LETT |rels1|
                           (|GROUPP;removeGen2| |rels1| |toBeRemoved| $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT $ 19)) |rels1|
                          (QREFELT $ 13))
                (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;quotient;$L$;33|
        ((|a| $) (|addrel| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |gens1| (SPADCALL (QCAR |a|) (QREFELT $ 19))
                . #1=(|GROUPP;quotient;$L$;33|))
          (LETT |rels1| (QCDR |a|) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |gens1| (QREFELT $ 73))
                      (SPADCALL |rels1| |addrel| (QREFELT $ 74))
                      (QREFELT $ 13))
            (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;directProduct;3$;34| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|rc| (|List| (|List| (|Integer|)))) (|gcx| (|List| (|Integer|)))
          (#1=#:G390 NIL) (|gbx| NIL) (#2=#:G389 NIL) (|gax| NIL)
          (|rb| #3=(|List| (|List| (|Integer|))))
          (|gb| #4=(|List| (|NonNegativeInteger|))) (|b2| ($))
          (|sa| (|NonNegativeInteger|)) (|ra| #3#) (|ga| #4#) (|a2| ($)))
         (SEQ
          (LETT |a2| (SPADCALL |a| (QREFELT $ 27))
                . #5=(|GROUPP;directProduct;3$;34|))
          (LETT |ga| (SPADCALL (QCAR |a2|) (QREFELT $ 19)) . #5#)
          (LETT |ra| (QCDR |a2|) . #5#)
          (LETT |sa| (SPADCALL |ga| (QREFELT $ 64)) . #5#)
          (LETT |b2|
                (|GROUPP;offsetIndexes| (SPADCALL |b| (QREFELT $ 27)) |sa| $)
                . #5#)
          (LETT |gb| (SPADCALL (QCAR |b2|) (QREFELT $ 19)) . #5#)
          (LETT |rb| (QCDR |b2|) . #5#) (LETT |rc| NIL . #5#)
          (SEQ (LETT |gax| NIL . #5#) (LETT #2# |ga| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |gax| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |gbx| NIL . #5#) (LETT #1# |gb| . #5#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |gbx| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (LETT |gcx| (LIST |gax| |gbx| |gax| |gbx|) . #5#)
                           (EXIT
                            (LETT |rc| (SPADCALL |rc| |gcx| (QREFELT $ 12))
                                  . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ga| (QREFELT $ 73)) |gb| (QREFELT $ 76))
            (SPADCALL (LIST |ra| |rb| |rc|) (QREFELT $ 77)) (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;cyclicGroup;Pi$;35| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((|ra| (|List| (|List| (|Integer|)))) (#1=#:G395 NIL) (|x| NIL)
          (#2=#:G394 NIL) (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ga| (LIST 1) . #3=(|GROUPP;cyclicGroup;Pi$;35|))
              (LETT |ra|
                    (LIST
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |x| 1 . #3#) (LETT #1# |n| . #3#) G190
                           (COND ((|greater_SI| |x| #1#) (GO G191)))
                           (SEQ (EXIT (LETT #2# (CONS 1 #2#) . #3#)))
                           (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))
                    . #3#)
              (EXIT (SPADCALL |ga| |ra| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;dihedralGroup;Pi$;36| ((|n| |PositiveInteger|) ($ $))
        (SPROG ((|c2| ($)) (|c1| ($)))
               (SEQ
                (LETT |c1| (SPADCALL |n| (QREFELT $ 80))
                      . #1=(|GROUPP;dihedralGroup;Pi$;36|))
                (LETT |c2| (SPADCALL 2 (QREFELT $ 80)) . #1#)
                (EXIT (SPADCALL |c1| |c2| (QREFELT $ 78)))))) 

(SDEFUN |GROUPP;next|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|point| |NonNegativeInteger|) (|genIndex| |Integer|)
         (|rev| |Boolean|) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G404 NIL) (#2=#:G405 NIL) (|x| NIL)
          (|numberPoints| (|NonNegativeInteger|)) (#3=#:G399 NIL)
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84))
                  . #4=(|GROUPP;next|))
            (COND
             ((EQL |genIndex| 0) (PROGN (LETT #1# 0 . #4#) (GO #5=#:G403))))
            (COND
             ((SPADCALL (SPADCALL |genIndex| 0 (QREFELT $ 41)) |rev|
                        (QREFELT $ 85))
              (PROGN
               (LETT #1#
                     (SPADCALL |generators| |point| (ABS |genIndex|)
                               (QREFELT $ 86))
                     . #4#)
               (GO #5#))))
            (LETT |numberPoints|
                  (PROG1
                      (LETT #3# (SPADCALL |generators| (QREFELT $ 87)) . #4#)
                    (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #3#))
                  . #4#)
            (SEQ (LETT |x| 1 . #4#) (LETT #2# |numberPoints| . #4#) G190
                 (COND ((|greater_SI| |x| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL |point|
                          (SPADCALL |generators| |x| (ABS |genIndex|)
                                    (QREFELT $ 86)))
                     (PROGN (LETT #1# |x| . #4#) (GO #5#))))))
                 (LETT |x| (|inc_SI| |x|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;inferFromRelations|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|rels| |List| (|List| (|Integer|))) (|trace| |Boolean|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G428 NIL) (|pe| #2=(|NonNegativeInteger|)) (|pb| #2#)
          (|x| (|NonNegativeInteger|)) (|invm| (|Boolean|))
          (|genIn| (|NonNegativeInteger|)) (#3=#:G416 NIL)
          (|ge| #4=(|NonNegativeInteger|)) (|i| #2#)
          (|backwardSequence| (|List| (|NonNegativeInteger|))) (#5=#:G432 NIL)
          (|genIndex| NIL) (|rr| (|List| (|Integer|))) (|gb| #4#)
          (|forwardSequence| (|List| (|NonNegativeInteger|))) (#6=#:G431 NIL)
          (#7=#:G430 NIL) (|pn| NIL) (|relWidth| (|NonNegativeInteger|))
          (#8=#:G429 NIL) (|r| NIL) (|numberPoints| (|NonNegativeInteger|))
          (#9=#:G406 NIL)
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84))
                  . #10=(|GROUPP;inferFromRelations|))
            (LETT |numberPoints|
                  (PROG1
                      (LETT #9# (SPADCALL |generators| (QREFELT $ 87)) . #10#)
                    (|check_subtype2| (>= #9# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #9#))
                  . #10#)
            (SEQ (LETT |r| NIL . #10#) (LETT #8# |rels| . #10#) G190
                 (COND
                  ((OR (ATOM #8#) (PROGN (LETT |r| (CAR #8#) . #10#) NIL))
                   (GO G191)))
                 (SEQ (LETT |relWidth| (LENGTH |r|) . #10#)
                      (EXIT
                       (SEQ (LETT |pn| 1 . #10#)
                            (LETT #7# |numberPoints| . #10#) G190
                            (COND ((|greater_SI| |pn| #7#) (GO G191)))
                            (SEQ (LETT |forwardSequence| NIL . #10#)
                                 (LETT |backwardSequence| NIL . #10#)
                                 (LETT |gb| 0 . #10#) (LETT |pb| |pn| . #10#)
                                 (LETT |i| |pn| . #10#)
                                 (SEQ (LETT |genIndex| NIL . #10#)
                                      (LETT #6# |r| . #10#) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN
                                             (LETT |genIndex| (CAR #6#) . #10#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |forwardSequence|
                                             (SPADCALL |forwardSequence| |i|
                                                       (QREFELT $ 52))
                                             . #10#)
                                       (COND
                                        ((SPADCALL |i| 0 (QREFELT $ 60))
                                         (LETT |i|
                                               (|GROUPP;next| |gensR| |i|
                                                |genIndex| NIL $)
                                               . #10#)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |i| 0 (QREFELT $ 60))
                                          (SEQ (LETT |gb| (+ |gb| 1) . #10#)
                                               (EXIT
                                                (LETT |pb| |i| . #10#)))))))
                                      (LETT #6# (CDR #6#) . #10#) (GO G190)
                                      G191 (EXIT NIL))
                                 (LETT |ge| 0 . #10#) (LETT |pe| |pn| . #10#)
                                 (LETT |rr| (REVERSE |r|) . #10#)
                                 (LETT |i| |pn| . #10#)
                                 (SEQ (LETT |genIndex| NIL . #10#)
                                      (LETT #5# |rr| . #10#) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN
                                             (LETT |genIndex| (CAR #5#) . #10#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |backwardSequence|
                                             (SPADCALL |backwardSequence| |i|
                                                       (QREFELT $ 52))
                                             . #10#)
                                       (COND
                                        ((SPADCALL |i| 0 (QREFELT $ 60))
                                         (LETT |i|
                                               (|GROUPP;next| |gensR| |i|
                                                |genIndex| 'T $)
                                               . #10#)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |i| 0 (QREFELT $ 60))
                                          (SEQ (LETT |ge| (+ |ge| 1) . #10#)
                                               (EXIT
                                                (LETT |pe| |i| . #10#)))))))
                                      (LETT #5# (CDR #5#) . #10#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((EQL (- (- |relWidth| |gb|) |ge|) 1)
                                    (SEQ
                                     (LETT |genIn|
                                           (PROG1
                                               (LETT #3#
                                                     (ABS
                                                      (SPADCALL |r| (+ |gb| 1)
                                                                (QREFELT $
                                                                         88)))
                                                     . #10#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           . #10#)
                                     (LETT |invm|
                                           (<
                                            (SPADCALL |r| (+ |gb| 1)
                                                      (QREFELT $ 88))
                                            0)
                                           . #10#)
                                     (COND
                                      (|invm|
                                       (SEQ (LETT |x| |pb| . #10#)
                                            (LETT |pb| |pe| . #10#)
                                            (EXIT (LETT |pe| |x| . #10#)))))
                                     (COND
                                      (|trace|
                                       (SEQ
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           "inferFromRelations found a gap "
                                           "of 1 so deduction made"
                                           (QREFELT $ 89))
                                          (QREFELT $ 44))
                                         (QREFELT $ 56))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL "gap is in relator table:"
                                                    (QREFELT $ 44))
                                          (SPADCALL |r| (QREFELT $ 63))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL "distance from start:"
                                                      (QREFELT $ 44))
                                            (SPADCALL |gb| (QREFELT $ 68))
                                            (QREFELT $ 43))
                                           (SPADCALL " from end:"
                                                     (QREFELT $ 44))
                                           (QREFELT $ 43))
                                          (SPADCALL |ge| (QREFELT $ 68))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL "row at start:"
                                                    (QREFELT $ 44))
                                          (SPADCALL |pn| (QREFELT $ 68))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL "row to change:"
                                                      (QREFELT $ 44))
                                            (SPADCALL |pb| (QREFELT $ 68))
                                            (QREFELT $ 43))
                                           (SPADCALL " new value:"
                                                     (QREFELT $ 44))
                                           (QREFELT $ 43))
                                          (SPADCALL |pe| (QREFELT $ 68))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL "generator index="
                                                      (QREFELT $ 44))
                                            (SPADCALL |genIn| (QREFELT $ 68))
                                            (QREFELT $ 43))
                                           (SPADCALL " invm=" (QREFELT $ 44))
                                           (QREFELT $ 43))
                                          (SPADCALL |invm| (QREFELT $ 90))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (EXIT
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL "forwardSequence:"
                                                       (QREFELT $ 44))
                                             (SPADCALL |forwardSequence|
                                                       (QREFELT $ 91))
                                             (QREFELT $ 43))
                                            (SPADCALL " backwardSequence:"
                                                      (QREFELT $ 44))
                                            (QREFELT $ 43))
                                           (SPADCALL |backwardSequence|
                                                     (QREFELT $ 91))
                                           (QREFELT $ 43))
                                          (QREFELT $ 56))))))
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |generators| |pb| |genIn|
                                                  (QREFELT $ 86))
                                        0 (QREFELT $ 60))
                                       (SEQ
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL "setelt!("
                                                           (QREFELT $ 44))
                                                 (SPADCALL |generators|
                                                           (QREFELT $ 92))
                                                 (QREFELT $ 43))
                                                (SPADCALL "," (QREFELT $ 44))
                                                (QREFELT $ 43))
                                               (SPADCALL |pb| (QREFELT $ 68))
                                               (QREFELT $ 43))
                                              (SPADCALL "," (QREFELT $ 44))
                                              (QREFELT $ 43))
                                             (SPADCALL |genIn| (QREFELT $ 68))
                                             (QREFELT $ 43))
                                            (SPADCALL "," (QREFELT $ 44))
                                            (QREFELT $ 43))
                                           (SPADCALL |pe| (QREFELT $ 68))
                                           (QREFELT $ 43))
                                          (SPADCALL ")" (QREFELT $ 44))
                                          (QREFELT $ 43))
                                         (QREFELT $ 56))
                                        (EXIT
                                         (|error|
                                          (SPADCALL
                                           "inferFromRelations: coding error attempt"
                                           " to set non-zero value"
                                           (QREFELT $ 89)))))))
                                     (COND
                                      (|trace|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            "inferFromRelations genIn="
                                            (QREFELT $ 44))
                                           (SPADCALL |genIn| (QREFELT $ 68))
                                           (QREFELT $ 43))
                                          (SPADCALL " gb=" (QREFELT $ 44))
                                          (QREFELT $ 43))
                                         (SPADCALL |gb| (QREFELT $ 68))
                                         (QREFELT $ 43))
                                        (QREFELT $ 56))))
                                     (SPADCALL |generators| |pb| |genIn| |pe|
                                               (QREFELT $ 93))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# 'T . #10#)
                                       (GO #11=#:G427))))))))
                            (LETT |pn| (|inc_SI| |pn|) . #10#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #11# (EXIT #1#)))) 

(SDEFUN |GROUPP;addPoint|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|rels| |List| (|List| (|Integer|))) (|trace| |Boolean|)
         ($ |Boolean|))
        (SPROG
         ((#1=#:G441 NIL)
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|newRow| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|numGens| (|NonNegativeInteger|)) (#2=#:G435 NIL) (#3=#:G443 NIL)
          (|gp| NIL) (#4=#:G442 NIL) (|gn| NIL)
          (|numberPoints| (|NonNegativeInteger|)) (#5=#:G433 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84))
                  . #6=(|GROUPP;addPoint|))
            (LETT |numberPoints|
                  (PROG1
                      (LETT #5# (SPADCALL |generators| (QREFELT $ 87)) . #6#)
                    (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #5#))
                  . #6#)
            (SEQ (LETT |gn| 1 . #6#)
                 (LETT #4# (SPADCALL |generators| (QREFELT $ 94)) . #6#) G190
                 (COND ((|greater_SI| |gn| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |gp| 1 . #6#)
                        (LETT #3# (SPADCALL |generators| (QREFELT $ 95)) . #6#)
                        G190 (COND ((|greater_SI| |gp| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL
                             (SPADCALL |generators| |gn| |gp| (QREFELT $ 86))
                             0)
                            (SEQ
                             (COND
                              (|trace|
                               (SEQ
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   "addPoint: cannot deduce more so adding"
                                   " a point" (QREFELT $ 89))
                                  (QREFELT $ 44))
                                 (QREFELT $ 56))
                                (EXIT
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL "adding:" (QREFELT $ 44))
                                     (SPADCALL |gp| (QREFELT $ 68))
                                     (QREFELT $ 43))
                                    (SPADCALL " at row:" (QREFELT $ 44))
                                    (QREFELT $ 43))
                                   (SPADCALL |gn| (QREFELT $ 68))
                                   (QREFELT $ 43))
                                  (QREFELT $ 56))))))
                             (SPADCALL |generators| |gn| |gp|
                                       (+ |numberPoints| 1) (QREFELT $ 93))
                             (LETT |numGens|
                                   (PROG1
                                       (LETT #2#
                                             (SPADCALL |generators|
                                                       (QREFELT $ 96))
                                             . #6#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   . #6#)
                             (LETT |newRow|
                                   (SPADCALL 1 |numGens| 0 (QREFELT $ 97))
                                   . #6#)
                             (LETT |generators|
                                   (SPADCALL |generators| |newRow|
                                             (QREFELT $ 98))
                                   . #6#)
                             (SPADCALL |gensR| |generators| (QREFELT $ 99))
                             (EXIT
                              (PROGN (LETT #1# 'T . #6#) (GO #7=#:G440))))))))
                        (LETT |gp| (|inc_SI| |gp|) . #6#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |gn| (|inc_SI| |gn|) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #7# (EXIT #1#)))) 

(SDEFUN |GROUPP;invertMap|
        ((|a| |TwoDimensionalArray| (|NonNegativeInteger|))
         ($ |TwoDimensionalArray| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#1=#:G448 NIL) (|x| NIL)
          (|invm| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |invm|
                (SPADCALL (SPADCALL |a| (QREFELT $ 94))
                          (SPADCALL |a| (QREFELT $ 95)) 0 (QREFELT $ 97))
                . #2=(|GROUPP;invertMap|))
          (SEQ (LETT |x| 1 . #2#)
               (LETT #1# (SPADCALL |a| (QREFELT $ 94)) . #2#) G190
               (COND ((|greater_SI| |x| #1#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |a| |x| 1 (QREFELT $ 86)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |i| 0 (QREFELT $ 60))
                       (SPADCALL |invm| |i| 1 |x| (QREFELT $ 93))))))
               (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |invm|)))) 

(SDEFUN |GROUPP;relatorTables|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         (|rels| |List| (|List| (|Integer|)))
         ($ |List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
        (SPROG
         ((|relators| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|relator| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|fst| (|Boolean|))
          (|relatorn| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|gNum| (|NonNegativeInteger|)) (#1=#:G452 NIL) (#2=#:G463 NIL)
          (|g| NIL) (#3=#:G462 NIL) (|r| NIL)
          (|invGenLists|
           (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#4=#:G461 NIL) (|a| NIL) (#5=#:G460 NIL)
          (|genLists| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#6=#:G450 NIL)
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84))
                . #7=(|GROUPP;relatorTables|))
          (LETT |genLists|
                (SPADCALL |generators|
                          (PROG1
                              (LETT #6# (SPADCALL |generators| (QREFELT $ 95))
                                    . #7#)
                            (|check_subtype2| (> #6# 0) '(|PositiveInteger|)
                                              '(|NonNegativeInteger|) #6#))
                          (QREFELT $ 100))
                . #7#)
          (LETT |invGenLists|
                (PROGN
                 (LETT #5# NIL . #7#)
                 (SEQ (LETT |a| NIL . #7#) (LETT #4# |genLists| . #7#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (|GROUPP;invertMap| |a| $) #5#)
                              . #7#)))
                      (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #7#)
          (LETT |relators| NIL . #7#)
          (SEQ (LETT |r| NIL . #7#) (LETT #3# |rels| . #7#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #7#) NIL))
                 (GO G191)))
               (SEQ (LETT |relator| (SPADCALL 0 0 0 (QREFELT $ 97)) . #7#)
                    (LETT |fst| 'T . #7#)
                    (SEQ (LETT |g| NIL . #7#) (LETT #2# |r| . #7#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |g| (CAR #2#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |gNum|
                                (PROG1 (LETT #1# (ABS |g|) . #7#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                . #7#)
                          (LETT |relatorn|
                                (COND
                                 ((SPADCALL |g| 0 (QREFELT $ 41))
                                  (SPADCALL |genLists| |gNum| (QREFELT $ 102)))
                                 ('T
                                  (SPADCALL |invGenLists| |gNum|
                                            (QREFELT $ 102))))
                                . #7#)
                          (EXIT
                           (COND
                            (|fst|
                             (SEQ (LETT |relator| |relatorn| . #7#)
                                  (EXIT (LETT |fst| NIL . #7#))))
                            ('T
                             (LETT |relator|
                                   (SPADCALL |relator| |relatorn|
                                             (QREFELT $ 103))
                                   . #7#)))))
                         (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |relators|
                           (SPADCALL |relators| |relator| (QREFELT $ 104))
                           . #7#)))
               (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |relators|)))) 

(SDEFUN |GROUPP;validateGenerators|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G468 NIL) (#2=#:G470 NIL) (|y| NIL) (#3=#:G469 NIL) (|x| NIL)
          (|lol| (|List| (|List| (|NonNegativeInteger|))))
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84))
                  . #4=(|GROUPP;validateGenerators|))
            (LETT |lol| (SPADCALL |generators| (QREFELT $ 106)) . #4#)
            (SEQ (LETT |x| NIL . #4#) (LETT #3# |lol| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |y| NIL . #4#) (LETT #2# |x| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |y| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL |y| 0)
                            (PROGN (LETT #1# NIL . #4#) (GO #5=#:G467))))))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;generators2Permutation|
        ((|gensR| |Reference| (|TwoDimensionalArray| (|NonNegativeInteger|)))
         ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|p| (|List| (|Permutation| (|Integer|))))
          (|pl| (|Permutation| (|Integer|))) (|gl| (|List| (|Integer|)))
          (#1=#:G480 NIL) (|x| NIL) (#2=#:G479 NIL)
          (|lol| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G478 NIL)
          (|g| NIL)
          (|genLists| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#4=#:G472 NIL)
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ (LETT |p| NIL . #5=(|GROUPP;generators2Permutation|))
              (LETT |generators| (SPADCALL |gensR| (QREFELT $ 84)) . #5#)
              (LETT |genLists|
                    (SPADCALL |generators|
                              (PROG1
                                  (LETT #4#
                                        (SPADCALL |generators| (QREFELT $ 95))
                                        . #5#)
                                (|check_subtype2| (> #4# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 100))
                    . #5#)
              (SEQ (LETT |g| NIL . #5#) (LETT #3# |genLists| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lol|
                          (SPADCALL (SPADCALL |g| (QREFELT $ 107))
                                    (QREFELT $ 106))
                          . #5#)
                    (LETT |gl|
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |x| NIL . #5#)
                                (LETT #1# (|SPADfirst| |lol|) . #5#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #2# (CONS |x| #2#) . #5#)))
                                (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          . #5#)
                    (LETT |pl| (SPADCALL |gl| (QREFELT $ 109)) . #5#)
                    (EXIT
                     (LETT |p| (SPADCALL |p| |pl| (QREFELT $ 111)) . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |p| (QREFELT $ 113)))))) 

(SDEFUN |GROUPP;toPermutationIfCan;$U;44|
        ((|a| $) ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPADCALL |a| NIL (QREFELT $ 115))) 

(SDEFUN |GROUPP;toPermutationIfCan;$BU;45|
        ((|a| $) (|trace| |Boolean|)
         ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G500 NIL) (|changedByAdding| (|Boolean|))
          (|changedByDeduction| (|Boolean|))
          (|loopBreaker| (|NonNegativeInteger|))
          (|gensR|
           (|Reference| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|generators| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|numGens| (|NonNegativeInteger|))
          (|unit| (|Permutation| (|Integer|)))
          (|rs| (|List| (|List| (|Integer|))))
          (|gs| (|List| (|NonNegativeInteger|)))
          (|numberPoints| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |numberPoints| 1 . #2=(|GROUPP;toPermutationIfCan;$BU;45|))
            (LETT |gs| (SPADCALL (QCAR |a|) (QREFELT $ 19)) . #2#)
            (LETT |rs| (QCDR |a|) . #2#)
            (COND
             ((EQL (SPADCALL |gs| (QREFELT $ 64)) 0)
              (COND
               ((EQL (LENGTH |rs|) 0)
                (SEQ (LETT |unit| (|spadConstant| $ 117) . #2#)
                     (EXIT
                      (PROGN
                       (LETT #1#
                             (CONS 0 (SPADCALL (LIST |unit|) (QREFELT $ 113)))
                             . #2#)
                       (GO #3=#:G499))))))))
            (COND
             ((SPADCALL (SPADCALL |gs| (QREFELT $ 64)) (LENGTH |rs|)
                        (QREFELT $ 49))
              (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #3#))))
            (LETT |numGens| (SPADCALL |gs| (QREFELT $ 64)) . #2#)
            (LETT |generators|
                  (SPADCALL |numberPoints| |numGens| 0 (QREFELT $ 97)) . #2#)
            (LETT |gensR| (SPADCALL |generators| (QREFELT $ 118)) . #2#)
            (LETT |loopBreaker| 0 . #2#)
            (SEQ G190 (COND ((NULL (< |loopBreaker| 10000)) (GO G191)))
                 (SEQ (LETT |loopBreaker| (+ |loopBreaker| 1) . #2#)
                      (LETT |changedByDeduction|
                            (|GROUPP;inferFromRelations| |gensR| |rs| |trace|
                             $)
                            . #2#)
                      (LETT |changedByAdding| NIL . #2#)
                      (COND
                       ((NULL |changedByDeduction|)
                        (LETT |changedByAdding|
                              (|GROUPP;addPoint| |gensR| |rs| |trace| $)
                              . #2#)))
                      (COND
                       ((SPADCALL |changedByDeduction| |changedByAdding|
                                  (QREFELT $ 119))
                        (SEQ
                         (COND
                          ((NULL (|GROUPP;validateGenerators| |gensR| $))
                           (|error|
                            "toPermutationIfCan: zeroes in generators")))
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (CONS 0
                                       (|GROUPP;generators2Permutation| |gensR|
                                        $))
                                 . #2#)
                           (GO #3#))))))
                      (EXIT
                       (COND
                        (|trace|
                         (SPADCALL
                          (SPADCALL (SPADCALL "relatorTables=" (QREFELT $ 44))
                                    (SPADCALL
                                     (|GROUPP;relatorTables| |gensR| |rs| $)
                                     (QREFELT $ 120))
                                    (QREFELT $ 43))
                          (QREFELT $ 56))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(SDEFUN |GROUPP;coerce;$Of;46| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|rs| (|List| (|List| (|Integer|))))
          (|g| (|OutputForm|)) (|ps| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT $ 121))
                . #1=(|GROUPP;coerce;$Of;46|))
          (LETT |g| (|GROUPP;outputGenList| |ps| $) . #1#)
          (LETT |rs| (QCDR |s|) . #1#)
          (LETT |r| (|GROUPP;outputRelList| |rs| $) . #1#)
          (EXIT
           (SPADCALL
            (LIST (SPADCALL "<" (QREFELT $ 44)) |g|
                  (SPADCALL " | " (QREFELT $ 44)) |r|
                  (SPADCALL ">" (QREFELT $ 44)))
            (QREFELT $ 45)))))) 

(DECLAIM (NOTINLINE |GroupPresentation;|)) 

(DEFUN |GroupPresentation| ()
  (SPROG NIL
         (PROG (#1=#:G504)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GroupPresentation|)
                    . #2=(|GroupPresentation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GroupPresentation|
                             (LIST
                              (CONS NIL (CONS 1 (|GroupPresentation;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GroupPresentation|)))))))))) 

(DEFUN |GroupPresentation;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GroupPresentation|) . #1=(|GroupPresentation|))
          (LETT $ (GETREFV 124) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 20) (|PrimitiveArray| 20)
              (0 . |construct|) (|List| 25) (|List| 10) (5 . |concat|)
              |GROUPP;groupPresentation;LL$;1| |GROUPP;groupPresentation;L$;2|
              |GROUPP;groupPresentation;$;3| (|List| $) (|String|)
              (11 . |concat|) (16 . |entries|) (|NonNegativeInteger|)
              (21 . |#|) (|Record| (|:| |OldGen| 20) (|:| |NewGen| 20))
              (|List| 22) (26 . |concat|) (|Integer|) (32 . |concat|)
              |GROUPP;refactor;2$;5| (|Set| 20) (38 . |set|) (|Boolean|)
              (43 . ~=) (49 . |entries|) (|Set| 10) (54 . |set|) (59 . =)
              |GROUPP;=;2$B;6| (|Character|) (65 . |elt|) (|OutputForm|)
              (71 . |coerce|) (76 . >) (82 . |outputForm|) (87 . |hconcat|)
              (93 . |message|) (98 . |hconcat|) (|List| 39) (103 . |concat|)
              (109 . |commaSeparate|) (114 . >) (120 . |blankSeparate|)
              (125 . |member?|) (131 . |concat|) (137 . |remove|)
              (143 . |remove|) (|Void|) (149 . |print|) (154 . |second|)
              (159 . |sign|) (164 . ~=) (170 . ~=) (176 . =) (182 . |copy|)
              (187 . |coerce|) (192 . |#|) (197 . |elt|) (203 . |elt|)
              |GROUPP;coerce;$Of;46| (209 . |coerce|) (214 . |concat|)
              |GROUPP;simplify;$B$;30| |GROUPP;simplify;2$;29|
              |GROUPP;quotient;$L$;32| (220 . |entries|) (225 . |concat|)
              |GROUPP;quotient;$L$;33| (231 . |concat|) (237 . |concat|)
              |GROUPP;directProduct;3$;34| (|PositiveInteger|)
              |GROUPP;cyclicGroup;Pi$;35| |GROUPP;dihedralGroup;Pi$;36|
              (|TwoDimensionalArray| 20) (|Reference| 82) (242 . |deref|)
              (247 . |xor|) (253 . |elt|) (260 . |maxRowIndex|) (265 . |elt|)
              (271 . |elt|) (277 . |coerce|) (282 . |coerce|) (287 . |coerce|)
              (292 . |setelt!|) (300 . |nrows|) (305 . |ncols|)
              (310 . |maxColIndex|) (315 . |new|) (322 . |vertConcat|)
              (328 . |setref|) (334 . |horizSplit|) (|List| 82) (340 . |elt|)
              (346 . |horizConcat|) (352 . |concat|) (|List| 7)
              (358 . |listOfLists|) (363 . |transpose|) (|Permutation| 25)
              (368 . |coerceImages|) (|List| 108) (373 . |concat|)
              (|PermutationGroup| 25) (379 . |permutationGroup|)
              (|Union| 112 '"failed") |GROUPP;toPermutationIfCan;$BU;45|
              |GROUPP;toPermutationIfCan;$U;44| (384 . |One|) (388 . |ref|)
              (393 . |nor|) (399 . |coerce|) (404 . |parts|) (|SingleInteger|)
              (|HashState|))
           '#(~= 409 |toPermutationIfCan| 415 |simplify| 426 |refactor| 437
              |quotient| 442 |latex| 454 |hashUpdate!| 459 |hash| 465
              |groupPresentation| 470 |directProduct| 485 |dihedralGroup| 491
              |cyclicGroup| 496 |coerce| 501 = 506)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 39))
                        (|makeByteWordVec2| 123
                                            '(1 8 0 7 9 2 11 0 0 10 12 1 17 0
                                              16 18 1 8 7 0 19 1 8 20 0 21 2 23
                                              0 0 22 24 2 10 0 0 25 26 1 28 0 7
                                              29 2 28 30 0 0 31 1 11 11 0 32 1
                                              33 0 11 34 2 33 30 0 0 35 2 17 37
                                              0 25 38 1 37 39 0 40 2 25 30 0 0
                                              41 1 39 0 25 42 2 39 0 0 0 43 1
                                              39 0 17 44 1 39 0 16 45 2 46 0 0
                                              39 47 1 39 0 16 48 2 20 30 0 0 49
                                              1 39 0 16 50 2 10 30 25 0 51 2 7
                                              0 0 20 52 2 8 0 20 0 53 2 10 0 25
                                              0 54 1 39 55 0 56 1 10 25 0 57 1
                                              25 25 0 58 2 25 30 0 0 59 2 20 30
                                              0 0 60 2 10 30 0 0 61 1 10 0 0 62
                                              1 10 39 0 63 1 7 20 0 64 2 7 20 0
                                              25 65 2 11 10 0 25 66 1 20 39 0
                                              68 2 10 0 0 0 69 1 7 7 0 73 2 11
                                              0 0 0 74 2 7 0 0 0 76 1 11 0 16
                                              77 1 83 82 0 84 2 30 0 0 0 85 3
                                              82 20 0 25 25 86 1 82 25 0 87 2
                                              10 25 0 25 88 2 17 0 0 0 89 1 30
                                              39 0 90 1 7 39 0 91 1 82 39 0 92
                                              4 82 20 0 25 25 20 93 1 82 20 0
                                              94 1 82 20 0 95 1 82 25 0 96 3 82
                                              0 20 20 20 97 2 82 0 0 0 98 2 83
                                              82 0 82 99 2 82 16 0 79 100 2 101
                                              82 0 25 102 2 82 0 0 0 103 2 101
                                              0 0 82 104 1 82 105 0 106 1 82 0
                                              0 107 1 108 0 10 109 2 110 0 0
                                              108 111 1 112 0 110 113 0 108 0
                                              117 1 83 0 82 118 2 30 0 0 0 119
                                              1 101 39 0 120 1 8 7 0 121 2 0 30
                                              0 0 1 1 0 114 0 116 2 0 114 0 30
                                              115 2 0 0 0 30 70 1 0 0 0 71 1 0
                                              0 0 27 2 0 0 0 11 75 2 0 0 0 7 72
                                              1 0 17 0 1 2 0 123 123 0 1 1 0
                                              122 0 1 0 0 0 15 1 0 0 7 14 2 0 0
                                              7 11 13 2 0 0 0 0 78 1 0 0 79 81
                                              1 0 0 79 80 1 0 39 0 67 2 0 30 0
                                              0 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|GroupPresentation| 'NILADIC T) 
