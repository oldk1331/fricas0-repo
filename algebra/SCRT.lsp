
(SDEFUN |SCRT;spnt;2Df$;1| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                    (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;spnt;3Df$;2|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                    (COND
                     ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
                      (QSETAREF1 |pt| 2 |c|)))
                    (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;svec;2Df$;3| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                    (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;svec;3Df$;4|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                    (COND
                     ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
                      (QSETAREF1 |pt| 2 |c|)))
                    (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;min;3$;5| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G123 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |pt| |i|
                                      (|min_DF| (QAREF1 |a| |i|)
                                                (QAREF1 |b| |i|)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;max;3$;6| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G129 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |pt| |i|
                                      (|max_DF| (QAREF1 |a| |i|)
                                                (QAREF1 |b| |i|)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;dimension;$Pi;7| ((|p| $) ($ |PositiveInteger|))
        (+ (QREFELT $ 6) 1)) 

(SDEFUN |SCRT;nan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 21))) 

(SDEFUN |SCRT;Pnan?;$B;9| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G136 NIL) (#2=#:G137 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((|SCRT;nan?| (QAREF1 |p| |i|) $)
                           (PROGN (LETT #1# 'T) (GO #3=#:G135))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCRT;parallel;2$Df;10| ((|x| $) (|y| $) ($ |DoubleFloat|))
        (|add_DF|
         (|add_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 0))
                   (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
         (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))) 

(SDEFUN |SCRT;unitVector;2$;11| ((|p| $) ($ $))
        (SPROG
         ((#1=#:G144 NIL) (|i| NIL) (|pt| ($)) (|factor| (|DoubleFloat|))
          (#2=#:G143 NIL))
         (SEQ (LETT |factor| 0.0)
              (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |factor|
                           (|add_DF| |factor|
                                     (|mul_DF| (QAREF1 |p| |i|)
                                               (QAREF1 |p| |i|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |factor| (SPADCALL |factor| (QREFELT $ 24)))
              (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
              (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |pt| |i|
                                (|div_DF| (QAREF1 |p| |i|) |factor|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;distanceSquared;2$Df;12| ((|p1| $) (|p2| $) ($ |DoubleFloat|))
        (SPROG ((|factor| (|DoubleFloat|)) (#1=#:G148 NIL) (|i| NIL))
               (SEQ (LETT |factor| 0.0)
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |factor|
                                 (|add_DF| |factor|
                                           (|expt_DF_I|
                                            (|sub_DF| (QAREF1 |p1| |i|)
                                                      (QAREF1 |p2| |i|))
                                            2)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |factor|)))) 

(SDEFUN |SCRT;perpendicular;3$;13| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G151 NIL) (|pt| ($)))
               (SEQ
                (EXIT
                 (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                      (COND
                       ((< (QREFELT $ 6) 3)
                        (PROGN
                         (LETT #1# (SPADCALL 0 0 (QREFELT $ 27)))
                         (GO #2=#:G150))))
                      (QSETAREF1 |pt| 0
                                 (|sub_DF|
                                  (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 2))
                                  (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 1))))
                      (QSETAREF1 |pt| 1
                                 (|sub_DF|
                                  (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 0))
                                  (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 2))))
                      (QSETAREF1 |pt| 2
                                 (|sub_DF|
                                  (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 1))
                                  (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 0))))
                      (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))
                #2# (EXIT #1#)))) 

(SDEFUN |SCRT;*;Df2$;14| ((|s| |DoubleFloat|) (|x| $) ($ $))
        (SPROG ((#1=#:G155 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |pt| |i|
                                      (|mul_DF| (QAREF1 |x| |i|) |s|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6) (QAREF1 |x| (QREFELT $ 6)))
                    (EXIT |pt|)))) 

(SDEFUN |SCRT;+;3$;15| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G160 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |pt| |i|
                                      (|add_DF| (QAREF1 |x| |i|)
                                                (QAREF1 |y| |i|)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6)
                               (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                                         (QAREF1 |y| (QREFELT $ 6))))
                    (COND
                     ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 30))
                      (QSETAREF1 |pt| (QREFELT $ 6) 1.0)))
                    (EXIT |pt|)))) 

(SDEFUN |SCRT;-;3$;16| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G165 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |pt| |i|
                                      (|sub_DF| (QAREF1 |x| |i|)
                                                (QAREF1 |y| |i|)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6)
                               (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                                         (QAREF1 |y| (QREFELT $ 6))))
                    (COND
                     ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 30))
                      (QSETAREF1 |pt| (QREFELT $ 6) 0.0)))
                    (EXIT |pt|)))) 

(SDEFUN |SCRT;inBounds?;3$B;17| ((|pt| $) (|mns| $) (|mxs| $) ($ |Boolean|))
        (SPROG ((#1=#:G171 NIL) (#2=#:G172 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((|less_DF| (QAREF1 |pt| |i|) (QAREF1 |mns| |i|))
                          (PROGN (LETT #1# NIL) (GO #3=#:G170))))
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |pt| |i|) (QAREF1 |mxs| |i|)
                                     (QREFELT $ 30))
                           (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(PUT '|SCRT;screenCoordX;$Df;18| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 0))) 

(SDEFUN |SCRT;screenCoordX;$Df;18| ((|pt| $) ($ |DoubleFloat|)) (QAREF1 |pt| 0)) 

(PUT '|SCRT;screenCoordY;$Df;19| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 1))) 

(SDEFUN |SCRT;screenCoordY;$Df;19| ((|pt| $) ($ |DoubleFloat|)) (QAREF1 |pt| 1)) 

(SDEFUN |SCRT;screenCoordZ;$Df;20| ((|pt| $) ($ |DoubleFloat|))
        (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QAREF1 |pt| 2))
              ('T 0.0))) 

(SDEFUN |SCRT;screenCoords;$L;21| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPROG ((|res| (|List| (|DoubleFloat|))) (#1=#:G179 NIL) (|i| NIL))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res| (QAREF1 |pt| |i|)
                                           (QREFELT $ 38)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SCRT;extendedCoords;$L;22| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPADCALL |pt| (QREFELT $ 40))) 

(SDEFUN |SCRT;toPoint;2$;23| ((|p| $) ($ $))
        (SPROG ((#1=#:G184 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;toVector;2$;24| ((|p| $) ($ $))
        (SPROG ((#1=#:G188 NIL) (|i| NIL) (|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0))
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;isPoint?;$B;25| ((|p| $) ($ |Boolean|))
        (SPADCALL (QAREF1 |p| (QREFELT $ 6))
                  (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 45)) (QREFELT $ 46))
                  (QREFELT $ 30))) 

(SDEFUN |SCRT;isVector?;$B;26| ((|p| $) ($ |Boolean|))
        (|less_DF| (QAREF1 |p| (QREFELT $ 6))
                   (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 45)) (QREFELT $ 46)))) 

(PUT '|SCRT;hash;$Si;27| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCRT;hash;$Si;27| ((|s| $) ($ |SingleInteger|)) 0) 

(SDEFUN |SCRT;=;2$B;28| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G196 NIL) (#2=#:G197 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (+ (QREFELT $ 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                     (QREFELT $ 21))
                           (PROGN (LETT #1# NIL) (GO #3=#:G195))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCRT;~=;2$B;29| ((|x| $) (|y| $) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 51)))) 

(SDEFUN |SCRT;coerce;$Of;30| ((|pt| $) ($ |OutputForm|))
        (SPROG
         ((|eles| (|List| (|OutputForm|))) (#1=#:G205 NIL) (|i| NIL)
          (#2=#:G204 NIL) (|s| (|Symbol|)))
         (SEQ (LETT |s| '|proj|)
              (COND
               ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 0.0) (LETT |s| '|vec|)))
              (COND
               ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 1.0) (LETT |s| '|pt|)))
              (LETT |eles|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT $ 6) 1)) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (QAREF1 |pt| |i|) (QREFELT $ 54))
                                   #2#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT $ 56))
                         (SPADCALL |eles| (QREFELT $ 58)) (QREFELT $ 59)))))) 

(DECLAIM (NOTINLINE |SCartesian;|)) 

(DEFUN |SCartesian| (#1=#:G206)
  (SPROG NIL
         (PROG (#2=#:G207)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SCartesian|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SCartesian;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SCartesian|)))))))))) 

(DEFUN |SCartesian;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SCartesian| DV$1))
          (LETT $ (GETREFV 63))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SCartesian| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|PrimitiveArray| (|DoubleFloat|)))
          $))) 

(MAKEPROP '|SCartesian| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|DoubleFloat|)
              |SCRT;spnt;2Df$;1| (|Boolean|) (|PositiveInteger|) (0 . >)
              |SCRT;spnt;3Df$;2| |SCRT;svec;2Df$;3| |SCRT;svec;3Df$;4|
              |SCRT;min;3$;5| (|Integer|) (6 . |elt|) |SCRT;max;3$;6|
              |SCRT;dimension;$Pi;7| (12 . ~=) |SCRT;Pnan?;$B;9|
              |SCRT;parallel;2$Df;10| (18 . |sqrt|) |SCRT;unitVector;2$;11|
              |SCRT;distanceSquared;2$Df;12| (23 . |sipnt|)
              |SCRT;perpendicular;3$;13| |SCRT;*;Df2$;14| (29 . >)
              |SCRT;+;3$;15| |SCRT;-;3$;16| |SCRT;inBounds?;3$B;17|
              |SCRT;screenCoordX;$Df;18| |SCRT;screenCoordY;$Df;19|
              |SCRT;screenCoordZ;$Df;20| (|List| 8) (35 . |concat|)
              |SCRT;screenCoords;$L;21| (41 . |entries|)
              |SCRT;extendedCoords;$L;22| |SCRT;toPoint;2$;23|
              |SCRT;toVector;2$;24| (|Float|) (46 . |float|) (53 . |coerce|)
              |SCRT;isPoint?;$B;25| |SCRT;isVector?;$B;26| (|SingleInteger|)
              |SCRT;hash;$Si;27| |SCRT;=;2$B;28| |SCRT;~=;2$B;29|
              (|OutputForm|) (58 . |coerce|) (|Symbol|) (63 . |coerce|)
              (|List| $) (68 . |paren|) (73 . |hconcat|) |SCRT;coerce;$Of;30|
              (|String|) (|HashState|))
           '#(~= 79 |unitVector| 85 |toVector| 90 |toPoint| 95 |svec| 100
              |spnt| 113 |sivec| 126 |sipnt| 139 |screenCoords| 152
              |screenCoordZ| 157 |screenCoordY| 162 |screenCoordX| 167
              |perpendicular| 172 |parallel| 178 |min| 184 |max| 190 |latex|
              196 |isVector?| 201 |isPoint?| 206 |inBounds?| 211 |hashUpdate!|
              218 |hash| 224 |extendedCoords| 229 |distanceSquared| 234
              |distance| 240 |dimension| 246 |colinearity| 251 |coerce| 257
              |Pnan?| 262 = 267 - 273 + 279 * 285)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 53))
                        (|makeByteWordVec2| 62
                                            '(2 11 10 0 0 12 2 7 8 0 17 18 2 8
                                              10 0 0 21 1 8 0 0 24 2 0 0 17 17
                                              27 2 8 10 0 0 30 2 37 0 0 8 38 1
                                              7 37 0 40 3 44 0 17 17 11 45 1 44
                                              8 0 46 1 8 53 0 54 1 55 53 0 56 1
                                              53 0 57 58 2 53 0 0 0 59 2 0 10 0
                                              0 52 1 0 0 0 25 1 0 0 0 43 1 0 0
                                              0 42 3 0 0 8 8 8 15 2 0 0 8 8 14
                                              3 0 0 8 8 8 13 2 0 0 8 8 9 3 0 0
                                              17 17 17 1 2 0 0 17 17 1 3 0 0 17
                                              17 17 1 2 0 0 17 17 27 1 0 37 0
                                              39 1 0 8 0 36 1 0 8 0 35 1 0 8 0
                                              34 2 0 0 0 0 28 2 0 8 0 0 23 2 0
                                              0 0 0 16 2 0 0 0 0 19 1 0 61 0 1
                                              1 0 10 0 48 1 0 10 0 47 3 0 10 0
                                              0 0 33 2 0 62 62 0 1 1 0 49 0 50
                                              1 0 37 0 41 2 0 8 0 0 26 2 0 8 0
                                              0 1 1 0 11 0 20 2 0 8 0 0 1 1 0
                                              53 0 60 1 0 10 0 22 2 0 10 0 0 51
                                              2 0 0 0 0 32 2 0 0 0 0 31 2 0 0 8
                                              0 29)))))
           '|lookupComplete|)) 
