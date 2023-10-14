
(SDEFUN |SCRT;spnt;2Df$;1| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      |SCRT;spnt;2Df$;1|)
                (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;spnt;3Df$;2|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      |SCRT;spnt;3Df$;2|)
                (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                (COND
                 ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
                  (QSETAREF1 |pt| 2 |c|)))
                (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;svec;2Df$;3| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      |SCRT;svec;2Df$;3|)
                (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;svec;3Df$;4|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      |SCRT;svec;3Df$;4|)
                (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
                (COND
                 ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
                  (QSETAREF1 |pt| 2 |c|)))
                (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;min;3$;5| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G123 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;min;3$;5|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |pt| |i|
                                  (|min_DF| (QAREF1 |a| |i|)
                                            (QAREF1 |b| |i|)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;max;3$;6| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G127 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;max;3$;6|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |pt| |i|
                                  (|max_DF| (QAREF1 |a| |i|)
                                            (QAREF1 |b| |i|)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;dimension;$Pi;7| ((|p| $) ($ |PositiveInteger|))
        (+ (QREFELT $ 6) 1)) 

(SDEFUN |SCRT;nan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 19))) 

(SDEFUN |SCRT;Pnan?;$B;9| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G134 NIL) (#2=#:G135 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|SCRT;Pnan?;$B;9|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((|SCRT;nan?| (QAREF1 |p| |i|) $)
                           (PROGN (LETT #1# 'T . #3#) (GO #4=#:G133))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |SCRT;parallel;2$Df;10| ((|x| $) (|y| $) ($ |DoubleFloat|))
        (|add_DF|
         (|add_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 0))
                   (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
         (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))) 

(SDEFUN |SCRT;unitVector;2$;11| ((|p| $) ($ $))
        (SPROG
         ((#1=#:G142 NIL) (|i| NIL) (|pt| ($)) (|factor| (|DoubleFloat|))
          (#2=#:G141 NIL))
         (SEQ (LETT |factor| 0.0 . #3=(|SCRT;unitVector;2$;11|))
              (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |factor|
                           (|add_DF| |factor|
                                     (|mul_DF| (QAREF1 |p| |i|)
                                               (QAREF1 |p| |i|)))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |factor| (SPADCALL |factor| (QREFELT $ 22)) . #3#)
              (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 6) 1) . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |pt| |i|
                                (|div_DF| (QAREF1 |p| |i|) |factor|))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;distanceSquared;2$Df;12| ((|p1| $) (|p2| $) ($ |DoubleFloat|))
        (SPROG ((|factor| (|DoubleFloat|)) (#1=#:G146 NIL) (|i| NIL))
               (SEQ (LETT |factor| 0.0 . #2=(|SCRT;distanceSquared;2$Df;12|))
                    (SEQ (LETT |i| 0 . #2#)
                         (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |factor|
                                 (|add_DF| |factor|
                                           (|expt_DF_I|
                                            (|sub_DF| (QAREF1 |p1| |i|)
                                                      (QAREF1 |p2| |i|))
                                            2))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |factor|)))) 

(SDEFUN |SCRT;perpendicular;3$;13| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G149 NIL) (|pt| ($)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                        . #2=(|SCRT;perpendicular;3$;13|))
                  (COND
                   ((< (QREFELT $ 6) 3)
                    (PROGN
                     (LETT #1# (SPADCALL 0 0 (QREFELT $ 26)) . #2#)
                     (GO #3=#:G148))))
                  (QSETAREF1 |pt| 0
                             (|sub_DF| (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 2))
                                       (|mul_DF| (QAREF1 |x| 2)
                                                 (QAREF1 |y| 1))))
                  (QSETAREF1 |pt| 1
                             (|sub_DF| (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 0))
                                       (|mul_DF| (QAREF1 |x| 0)
                                                 (QAREF1 |y| 2))))
                  (QSETAREF1 |pt| 2
                             (|sub_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 1))
                                       (|mul_DF| (QAREF1 |x| 1)
                                                 (QAREF1 |y| 0))))
                  (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))
                #3# (EXIT #1#)))) 

(SDEFUN |SCRT;*;Df2$;14| ((|s| |DoubleFloat|) (|x| $) ($ $))
        (SPROG ((#1=#:G153 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;*;Df2$;14|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |pt| |i| (|mul_DF| (QAREF1 |x| |i|) |s|))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6) (QAREF1 |x| (QREFELT $ 6)))
                (EXIT |pt|)))) 

(SDEFUN |SCRT;+;3$;15| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G158 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;+;3$;15|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |pt| |i|
                                  (|add_DF| (QAREF1 |x| |i|)
                                            (QAREF1 |y| |i|)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6)
                           (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                                     (QAREF1 |y| (QREFELT $ 6))))
                (COND
                 ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 31))
                  (QSETAREF1 |pt| (QREFELT $ 6) 1.0)))
                (EXIT |pt|)))) 

(SDEFUN |SCRT;-;3$;16| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G163 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;-;3$;16|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 |pt| |i|
                                  (|sub_DF| (QAREF1 |x| |i|)
                                            (QAREF1 |y| |i|)))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6)
                           (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                                     (QAREF1 |y| (QREFELT $ 6))))
                (COND
                 ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 31))
                  (QSETAREF1 |pt| (QREFELT $ 6) 0.0)))
                (EXIT |pt|)))) 

(SDEFUN |SCRT;inBounds?;3$B;17| ((|pt| $) (|mns| $) (|mxs| $) ($ |Boolean|))
        (SPROG ((#1=#:G169 NIL) (#2=#:G170 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|SCRT;inBounds?;3$B;17|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((|less_DF| (QAREF1 |pt| |i|) (QAREF1 |mns| |i|))
                          (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G168))))
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |pt| |i|) (QAREF1 |mxs| |i|)
                                     (QREFELT $ 31))
                           (PROGN (LETT #1# 'NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(PUT '|SCRT;screenCoordX;$Df;18| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 0))) 

(SDEFUN |SCRT;screenCoordX;$Df;18| ((|pt| $) ($ |DoubleFloat|)) (QAREF1 |pt| 0)) 

(PUT '|SCRT;screenCoordY;$Df;19| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 1))) 

(SDEFUN |SCRT;screenCoordY;$Df;19| ((|pt| $) ($ |DoubleFloat|)) (QAREF1 |pt| 1)) 

(SDEFUN |SCRT;screenCoordZ;$Df;20| ((|pt| $) ($ |DoubleFloat|))
        (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QAREF1 |pt| 2))
              ('T 0.0))) 

(SDEFUN |SCRT;screenCoords;$L;21| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPROG ((|res| (|List| (|DoubleFloat|))) (#1=#:G177 NIL) (|i| NIL))
               (SEQ (LETT |res| NIL . #2=(|SCRT;screenCoords;$L;21|))
                    (SEQ (LETT |i| 0 . #2#)
                         (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res| (QAREF1 |pt| |i|)
                                           (QREFELT $ 39))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SCRT;extendedCoords;$L;22| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPADCALL |pt| (QREFELT $ 41))) 

(SDEFUN |SCRT;toPoint;2$;23| ((|p| $) ($ $))
        (SPROG ((#1=#:G182 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;toPoint;2$;23|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;toVector;2$;24| ((|p| $) ($ $))
        (SPROG ((#1=#:G186 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
                      . #2=(|SCRT;toVector;2$;24|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))) 

(SDEFUN |SCRT;isPoint?;$B;25| ((|p| $) ($ |Boolean|))
        (SPADCALL (QAREF1 |p| (QREFELT $ 6))
                  (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 46)) (QREFELT $ 47))
                  (QREFELT $ 31))) 

(SDEFUN |SCRT;isVector?;$B;26| ((|p| $) ($ |Boolean|))
        (|less_DF| (QAREF1 |p| (QREFELT $ 6))
                   (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 46)) (QREFELT $ 47)))) 

(PUT '|SCRT;hash;$Si;27| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCRT;hash;$Si;27| ((|s| $) ($ |SingleInteger|)) 0) 

(PUT '|SCRT;latex;$S;28| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(SDEFUN |SCRT;latex;$S;28| ((|s| $) ($ |String|)) "\\mbox{\\bf Unimplemented}") 

(SDEFUN |SCRT;=;2$B;29| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G195 NIL) (#2=#:G196 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|SCRT;=;2$B;29|))
                       (LETT #2# (+ (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                     (QREFELT $ 19))
                           (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G194))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |SCRT;~=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL |x| |y| (QREFELT $ 54)) 'NIL) ('T 'T))) 

(SDEFUN |SCRT;coerce;$Of;31| ((|pt| $) ($ |OutputForm|))
        (SPROG
         ((|eles| (|List| (|OutputForm|))) (#1=#:G204 NIL) (|i| NIL)
          (#2=#:G203 NIL) (|s| (|Symbol|)))
         (SEQ (LETT |s| '|proj| . #3=(|SCRT;coerce;$Of;31|))
              (COND
               ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 0.0)
                (LETT |s| '|vec| . #3#)))
              (COND
               ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 1.0)
                (LETT |s| '|pt| . #3#)))
              (LETT |eles|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| 0 . #3#)
                          (LETT #1# (- (QREFELT $ 6) 1) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL (QAREF1 |pt| |i|) (QREFELT $ 57))
                                   #2#)
                                  . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT $ 59))
                         (SPADCALL |eles| (QREFELT $ 61)) (QREFELT $ 62)))))) 

(DECLAIM (NOTINLINE |SCartesian;|)) 

(DEFUN |SCartesian| (#1=#:G205)
  (SPROG NIL
         (PROG (#2=#:G206)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SCartesian|)
                                               '|domainEqualList|)
                    . #3=(|SCartesian|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SCartesian;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SCartesian|)))))))))) 

(DEFUN |SCartesian;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SCartesian|))
          (LETT |dv$| (LIST '|SCartesian| DV$1) . #1#)
          (LETT $ (GETREFV 65) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              |SCRT;min;3$;5| |SCRT;max;3$;6| |SCRT;dimension;$Pi;7| (6 . ~=)
              |SCRT;Pnan?;$B;9| |SCRT;parallel;2$Df;10| (12 . |sqrt|)
              |SCRT;unitVector;2$;11| |SCRT;distanceSquared;2$Df;12|
              (|Integer|) (17 . |sipnt|) (|Fraction| 25) (23 . |One|)
              |SCRT;perpendicular;3$;13| |SCRT;*;Df2$;14| (27 . >)
              |SCRT;+;3$;15| |SCRT;-;3$;16| |SCRT;inBounds?;3$B;17|
              |SCRT;screenCoordX;$Df;18| |SCRT;screenCoordY;$Df;19|
              |SCRT;screenCoordZ;$Df;20| (|List| 8) (33 . |concat|)
              |SCRT;screenCoords;$L;21| (39 . |entries|)
              |SCRT;extendedCoords;$L;22| |SCRT;toPoint;2$;23|
              |SCRT;toVector;2$;24| (|Float|) (44 . |float|) (51 . |coerce|)
              |SCRT;isPoint?;$B;25| |SCRT;isVector?;$B;26| (|SingleInteger|)
              |SCRT;hash;$Si;27| (|String|) |SCRT;latex;$S;28| |SCRT;=;2$B;29|
              |SCRT;~=;2$B;30| (|OutputForm|) (56 . |coerce|) (|Symbol|)
              (61 . |coerce|) (|List| $) (66 . |paren|) (71 . |hconcat|)
              |SCRT;coerce;$Of;31| (|HashState|))
           '#(~= 77 |unitVector| 83 |toVector| 88 |toPoint| 93 |svec| 98 |spnt|
              111 |sivec| 124 |sipnt| 137 |screenCoords| 150 |screenCoordZ| 155
              |screenCoordY| 160 |screenCoordX| 165 |perpendicular| 170
              |parallel| 176 |min| 182 |max| 188 |latex| 194 |isVector?| 199
              |isPoint?| 204 |inBounds?| 209 |hashUpdate!| 216 |hash| 222
              |extendedCoords| 227 |distanceSquared| 232 |distance| 238
              |dimension| 244 |colinearity| 249 |coerce| 255 |Pnan?| 260 = 265
              - 271 + 277 * 283)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 56))
                        (|makeByteWordVec2| 64
                                            '(2 11 10 0 0 12 2 8 10 0 0 19 1 8
                                              0 0 22 2 0 0 25 25 26 0 27 0 28 2
                                              8 10 0 0 31 2 38 0 0 8 39 1 7 38
                                              0 41 3 45 0 25 25 11 46 1 45 8 0
                                              47 1 8 56 0 57 1 58 56 0 59 1 56
                                              0 60 61 2 56 0 0 0 62 2 0 10 0 0
                                              55 1 0 0 0 23 1 0 0 0 44 1 0 0 0
                                              43 3 0 0 8 8 8 15 2 0 0 8 8 14 3
                                              0 0 8 8 8 13 2 0 0 8 8 9 3 0 0 25
                                              25 25 1 2 0 0 25 25 1 3 0 0 25 25
                                              25 1 2 0 0 25 25 26 1 0 38 0 40 1
                                              0 8 0 37 1 0 8 0 36 1 0 8 0 35 2
                                              0 0 0 0 29 2 0 8 0 0 21 2 0 0 0 0
                                              16 2 0 0 0 0 17 1 0 52 0 53 1 0
                                              10 0 49 1 0 10 0 48 3 0 10 0 0 0
                                              34 2 0 64 64 0 1 1 0 50 0 51 1 0
                                              38 0 42 2 0 8 0 0 24 2 0 8 0 0 1
                                              1 0 11 0 18 2 0 8 0 0 1 1 0 56 0
                                              63 1 0 10 0 20 2 0 10 0 0 54 2 0
                                              0 0 0 33 2 0 0 0 0 32 2 0 0 8 0
                                              30)))))
           '|lookupComplete|)) 
