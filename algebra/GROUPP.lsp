
(SDEFUN |GROUPP;groupPresentation;LL$;1|
        ((|gens1| |List| (|NonNegativeInteger|))
         (|rels1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G146 NIL) (|r| NIL)
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
        (SPROG ((#1=#:G158 NIL) (#2=#:G159 NIL) (|m| NIL))
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
                          (PROGN (LETT #1# (QCDR |m|) . #3#) (GO #4=#:G157))))
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
         ((|gens1| (|List| (|NonNegativeInteger|))) (#1=#:G176 NIL) (|gn| NIL)
          (#2=#:G175 NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|newRel| (|List| (|Integer|))) (|newEle| (|Integer|))
          (#3=#:G174 NIL) (|ele| NIL) (#4=#:G173 NIL) (|rel| NIL)
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (#5=#:G171 NIL) (|g| NIL) (#6=#:G172 NIL))
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
         ((|brs| #1=(|List| (|List| (|Integer|)))) (|ars| #1#) (#2=#:G181 NIL)
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
              (PROGN (LETT #2# NIL . #4#) (GO #5=#:G180))))
            (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT $ 32)) . #4#)
            (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT $ 32)) . #4#)
            (EXIT
             (SPADCALL (SPADCALL |ars| (QREFELT $ 34))
                       (SPADCALL |brs| (QREFELT $ 34)) (QREFELT $ 35)))))
          #5# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGen| ((|i2| |Integer|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G185 NIL) (|n| (|OutputForm|)) (|letters| (|String|))
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
               (GO #5=#:G184))))
            (EXIT |n|)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputRel| ((|r| |List| (|Integer|)) ($ |OutputForm|))
        (SPROG
         ((|seperator| #1=(|OutputForm|)) (|eleout| #1#)
          (|newterm| (|OutputForm|)) (#2=#:G190 NIL) (|ele| NIL))
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
         ((#1=#:G195 NIL) (|rels1| (|List| (|OutputForm|))) (#2=#:G196 NIL)
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
                   (GO #4=#:G194))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputGenList|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((#1=#:G201 NIL) (|gens1| (|List| (|OutputForm|))) (#2=#:G202 NIL)
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
                   (GO #4=#:G200))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;indexesOfRelUsingGen|
        ((|s| $) (|gen| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G209 NIL) (|rel| NIL)
          (#2=#:G210 NIL) (|reln| NIL) (|r| (|List| (|List| (|Integer|)))))
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
        (SPROG ((#1=#:G215 NIL) (|rel| NIL) (#2=#:G214 NIL))
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
          (|e| (|Integer|)) (#1=#:G224 NIL) (|ele| NIL) (#2=#:G223 NIL)
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
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G230 NIL)
          (|toBeRemoved| (|NonNegativeInteger|)) (#2=#:G231 NIL) (|rel| NIL))
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
              (PROGN (LETT #1# |s| . #3#) (GO #4=#:G229))))
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
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G239 NIL)
          (|replaceFrom| (|NonNegativeInteger|)) (|replaceTo| (|Integer|))
          (#2=#:G240 NIL) (|rel| NIL))
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
                  (PROGN (LETT #1# |s| . #3#) (GO #4=#:G238))))
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
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G245 NIL) (|rel| NIL)
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
          (|lastele| (|Integer|)) (|changed| (|Boolean|)) (#1=#:G263 NIL)
          (|ele| NIL) (#2=#:G262 NIL) (|rel| NIL)
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
         ((|relationOut| (|List| (|Integer|))) (#1=#:G267 NIL) (|ele| NIL))
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
         ((#1=#:G277 NIL) (|relBCycle| (|List| (|Integer|))) (#2=#:G278 NIL)
          (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |relA|) (LENGTH |relB|) (QREFELT $ 60))
              (PROGN
               (LETT #1# NIL . #3=(|GROUPP;relationEquivalent|))
               (GO #4=#:G276))))
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
          (#1=#:G289 NIL) (|relb| NIL) (#2=#:G290 NIL) (|nrelb| NIL)
          (#3=#:G287 NIL) (|rela| NIL) (#4=#:G288 NIL) (|nrela| NIL)
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
          (#2=#:G297 NIL) (|ele| NIL) (#3=#:G296 NIL) (|rel| NIL)
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
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G304 NIL) (|g| NIL))
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
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G310 NIL) (|rel| NIL))
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
          (|newRel| (|List| (|Integer|))) (#2=#:G334 NIL) (|x| (|Integer|))
          (|replacement| (|List| (|Integer|))) (|postr| (|List| (|Integer|)))
          (|restr| (|List| #3=(|Integer|))) (|prer| (|List| (|Integer|)))
          (|genInverted| #4=(|Boolean|)) (|found| #4#) (#5=#:G332 NIL)
          (|genToBeRemoved| #6=(|NonNegativeInteger|)) (|n2| #6#)
          (|r2| (|List| (|Integer|))) (|n1| #6#) (|r1| (|List| #3#))
          (|n3| (|NonNegativeInteger|)) (|r3| (|List| (|Integer|)))
          (|indexes| (|List| (|NonNegativeInteger|))) (#7=#:G333 NIL) (|g| NIL)
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
              (PROGN (LETT #5# |s| . #8#) (GO #9=#:G331))))
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
         ((#1=#:G341 NIL) (|relationCompleityB| #2=(|NonNegativeInteger|))
          (#3=#:G343 NIL) (|rel| NIL) (|relationCompleityA| #2#)
          (#4=#:G342 NIL) (|relsb| #5=(|List| (|List| (|Integer|))))
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
                  (PROGN (LETT #1# 'T . #7#) (GO #8=#:G340))))
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
         ((|lastpass| ($)) (|level| #1=(|NonNegativeInteger|)) (#2=#:G351 NIL)
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
                         (GO #4=#:G350))))
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
         ((|rb| (|List| (|List| (|Integer|)))) (#1=#:G362 NIL) (|y| NIL)
          (#2=#:G361 NIL) (#3=#:G360 NIL) (|z| NIL) (#4=#:G359 NIL)
          (|gb| (|List| (|NonNegativeInteger|))) (#5=#:G358 NIL) (|x| NIL)
          (#6=#:G357 NIL) (|ra| (|List| (|List| (|Integer|))))
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
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G367 NIL)
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
          (#1=#:G376 NIL) (|gbx| NIL) (#2=#:G375 NIL) (|gax| NIL)
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
         ((|ra| (|List| (|List| (|Integer|)))) (#1=#:G381 NIL) (|x| NIL)
          (#2=#:G380 NIL) (|ga| (|List| (|NonNegativeInteger|))))
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

(SDEFUN |GROUPP;coerce;$Of;37| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|rs| (|List| (|List| (|Integer|))))
          (|g| (|OutputForm|)) (|ps| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT $ 82))
                . #1=(|GROUPP;coerce;$Of;37|))
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
         (PROG (#1=#:G387)
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
          (LETT $ (GETREFV 85) . #1#)
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
              |GROUPP;coerce;$Of;37| (209 . |coerce|) (214 . |concat|)
              |GROUPP;simplify;$B$;30| |GROUPP;simplify;2$;29|
              |GROUPP;quotient;$L$;32| (220 . |entries|) (225 . |concat|)
              |GROUPP;quotient;$L$;33| (231 . |concat|) (237 . |concat|)
              |GROUPP;directProduct;3$;34| (|PositiveInteger|)
              |GROUPP;cyclicGroup;Pi$;35| |GROUPP;dihedralGroup;Pi$;36|
              (242 . |parts|) (|SingleInteger|) (|HashState|))
           '#(~= 247 |simplify| 253 |refactor| 264 |quotient| 269 |latex| 281
              |hashUpdate!| 286 |hash| 292 |groupPresentation| 297
              |directProduct| 312 |dihedralGroup| 318 |cyclicGroup| 323
              |coerce| 328 = 333)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 39))
                        (|makeByteWordVec2| 84
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
                                              77 1 8 7 0 82 2 0 30 0 0 1 1 0 0
                                              0 71 2 0 0 0 30 70 1 0 0 0 27 2 0
                                              0 0 11 75 2 0 0 0 7 72 1 0 17 0 1
                                              2 0 84 84 0 1 1 0 83 0 1 1 0 0 7
                                              14 0 0 0 15 2 0 0 7 11 13 2 0 0 0
                                              0 78 1 0 0 79 81 1 0 0 79 80 1 0
                                              39 0 67 2 0 30 0 0 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|GroupPresentation| 'NILADIC T) 
