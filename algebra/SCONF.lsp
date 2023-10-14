
(SDEFUN |SCONF;spnt;2Df$;1| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|z| ($)) (|inf| (|DoubleFloat|)))
               (SEQ
                (LETT |inf|
                      (|mul_DF|
                       (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                 (QREFELT $ 15)))
                      . #2=(|SCONF;spnt;2Df$;1|))
                (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #2#)
                (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
                (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|)))) 

(SDEFUN |SCONF;spnt;3Df$;2|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|z| ($)) (|inf| (|DoubleFloat|)))
               (SEQ
                (LETT |inf|
                      (|mul_DF|
                       (|add_DF|
                        (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                        (|mul_DF| |c| |c|))
                       (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                 (QREFELT $ 15)))
                      . #2=(|SCONF;spnt;3Df$;2|))
                (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #2#)
                (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
                (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
                (COND
                 ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21))
                  (QSETAREF1 |z| 16 |c|)))
                (EXIT |z|)))) 

(SDEFUN |SCONF;svec;2Df$;3| ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) ($ $))
        (SPROG ((|z| ($)))
               (SEQ (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;svec;2Df$;3|)
                    (QSETAREF1 |z| 1 0.0) (QSETAREF1 |z| 2 0.0)
                    (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|)))) 

(SDEFUN |SCONF;svec;3Df$;4|
        ((|a| . #1=(|DoubleFloat|)) (|b| . #1#) (|c| . #1#) ($ $))
        (SPROG ((|z| ($)))
               (SEQ (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;svec;3Df$;4|)
                    (QSETAREF1 |z| 1 0.0) (QSETAREF1 |z| 2 0.0)
                    (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
                    (COND
                     ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21))
                      (QSETAREF1 |z| 16 |c|)))
                    (EXIT |z|)))) 

(SDEFUN |SCONF;min;3$;5| ((|a| $) (|b| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;min;3$;5|)
                    (QSETAREF1 |pt| 8 (|min_DF| (QAREF1 |a| 8) (QAREF1 |b| 8)))
                    (QSETAREF1 |pt| 4 (|min_DF| (QAREF1 |a| 4) (QAREF1 |b| 4)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                          (QREFELT $ 15))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;max;3$;6| ((|a| $) (|b| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;max;3$;6|)
                    (QSETAREF1 |pt| 8 (|max_DF| (QAREF1 |a| 8) (QAREF1 |b| 8)))
                    (QSETAREF1 |pt| 4 (|max_DF| (QAREF1 |a| 4) (QAREF1 |b| 4)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                          (QREFELT $ 15))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(PUT '|SCONF;dimension;$Pi;7| '|SPADreplace| '(XLAM (|p|) 2)) 

(SDEFUN |SCONF;dimension;$Pi;7| ((|p| $) ($ |PositiveInteger|)) 2) 

(SDEFUN |SCONF;nan?| ((|x| |DoubleFloat|) ($ |Boolean|))
        (SPADCALL |x| |x| (QREFELT $ 28))) 

(SDEFUN |SCONF;Pnan?;$B;9| ((|p| $) ($ |Boolean|))
        (SPROG ((#1=#:G132 NIL) (#2=#:G133 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|SCONF;Pnan?;$B;9|))
                       (LETT #2# (- (QREFELT $ 9) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((|SCONF;nan?| (QAREF1 |p| |i|) $)
                           (PROGN (LETT #1# 'T . #3#) (GO #4=#:G131))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |SCONF;unitVector;2$;10| ((|p| $) ($ $))
        (SPROG ((|pt| ($)) (|factor| (|DoubleFloat|)))
               (SEQ
                (LETT |factor|
                      (SPADCALL
                       (|add_DF| (|mul_DF| (QAREF1 |p| 4) (QAREF1 |p| 4))
                                 (|mul_DF| (QAREF1 |p| 8) (QAREF1 |p| 8)))
                       (QREFELT $ 30))
                      . #1=(|SCONF;unitVector;2$;10|))
                (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
                (QSETAREF1 |pt| 4 (|div_DF| (QAREF1 |p| 4) |factor|))
                (QSETAREF1 |pt| 8 (|div_DF| (QAREF1 |p| 8) |factor|))
                (QSETAREF1 |pt| 2
                           (|mul_DF|
                            (|add_DF|
                             (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                             (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                      (QREFELT $ 15))))
                (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(PUT '|SCONF;distanceSquared;2$Df;11| '|SPADreplace| '(XLAM (|p1| |p2|) 1.0)) 

(SDEFUN |SCONF;distanceSquared;2$Df;11| ((|p1| $) (|p2| $) ($ |DoubleFloat|))
        1.0) 

(SDEFUN |SCONF;parallel;2$Df;12| ((|x| $) (|y| $) ($ |DoubleFloat|))
        (|add_DF| (|mul_DF| (QAREF1 |x| 6) (QAREF1 |y| 6))
                  (|mul_DF| (QAREF1 |x| 10) (QAREF1 |y| 10)))) 

(SDEFUN |SCONF;perpendicular;3$;13| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0)
                      |SCONF;perpendicular;3$;13|)
                (QSETAREF1 |pt| 4 0.0) (QSETAREF1 |pt| 8 1.0)
                (QSETAREF1 |pt| 2
                           (|mul_DF|
                            (|add_DF|
                             (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                             (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                            (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                      (QREFELT $ 15))))
                (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;*;Df2$;14| ((|s| |DoubleFloat|) (|x| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;*;Df2$;14|)
                    (QSETAREF1 |pt| 4 (|mul_DF| (QAREF1 |x| 4) |s|))
                    (QSETAREF1 |pt| 8 (|mul_DF| (QAREF1 |x| 8) |s|))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                          (QREFELT $ 15))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;+;3$;15| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;+;3$;15|)
                    (QSETAREF1 |pt| 4 (|add_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
                    (QSETAREF1 |pt| 8 (|add_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                          (QREFELT $ 15))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;-;3$;16| ((|x| $) (|y| $) ($ $))
        (SPROG ((|pt| ($)))
               (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;-;3$;16|)
                    (QSETAREF1 |pt| 4 (|sub_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
                    (QSETAREF1 |pt| 8 (|sub_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
                    (QSETAREF1 |pt| 2
                               (|mul_DF|
                                (|add_DF|
                                 (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                 (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                                (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                          (QREFELT $ 15))))
                    (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;inBounds?;3$B;17| ((|pt| $) (|mns| $) (|mxs| $) ($ |Boolean|))
        (COND
         ((OR (|less_DF| (QAREF1 |pt| 4) (QAREF1 |mns| 4))
              (OR (SPADCALL (QAREF1 |pt| 4) (QAREF1 |mxs| 4) (QREFELT $ 38))
                  (OR (|less_DF| (QAREF1 |pt| 8) (QAREF1 |mns| 8))
                      (SPADCALL (QAREF1 |pt| 8) (QAREF1 |mxs| 8)
                                (QREFELT $ 38)))))
          'NIL)
         ('T 'T))) 

(PUT '|SCONF;screenCoordX;$Df;18| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 4))) 

(SDEFUN |SCONF;screenCoordX;$Df;18| ((|pt| $) ($ |DoubleFloat|))
        (QAREF1 |pt| 4)) 

(PUT '|SCONF;screenCoordY;$Df;19| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 8))) 

(SDEFUN |SCONF;screenCoordY;$Df;19| ((|pt| $) ($ |DoubleFloat|))
        (QAREF1 |pt| 8)) 

(SDEFUN |SCONF;screenCoordZ;$Df;20| ((|pt| $) ($ |DoubleFloat|))
        (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21)) (QAREF1 |pt| 16))
              ('T 0.0))) 

(SDEFUN |SCONF;screenCoords;$L;21| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPROG ((#1=#:G156 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21))
                    (PROGN
                     (LETT #1#
                           (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8)
                                 (QAREF1 |pt| 16))
                           |SCONF;screenCoords;$L;21|)
                     (GO #2=#:G155))))
                  (EXIT (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCONF;extendedCoords;$L;22| ((|pt| $) ($ |List| (|DoubleFloat|)))
        (SPADCALL |pt| (QREFELT $ 45))) 

(SDEFUN |SCONF;normalisePoint;2$;23| ((|pt| $) ($ $))
        (SPROG
         ((|infin| (|DoubleFloat|)) (|index| (|PositiveInteger|))
          (#1=#:G168 NIL) (|x| NIL) (|pt2| ($)) (#2=#:G167 NIL)
          (|scaleFactor| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |scaleFactor| (QAREF1 |pt| 1)
                  . #3=(|SCONF;normalisePoint;2$;23|))
            (COND
             ((|less_DF| |scaleFactor|
                         (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 13))
                                   (QREFELT $ 15)))
              (COND
               ((SPADCALL |scaleFactor|
                          (|minus_DF|
                           (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          (QREFELT $ 38))
                (SEQ
                 (SPADCALL
                  (SPADCALL "can't apply normalisePoint to a vector"
                            (QREFELT $ 49))
                  (QREFELT $ 50))
                 (EXIT (PROGN (LETT #2# |pt| . #3#) (GO #4=#:G166))))))))
            (COND
             ((|less_DF| |scaleFactor|
                         (|minus_DF|
                          (SPADCALL (SPADCALL 99 -2 10 (QREFELT $ 13))
                                    (QREFELT $ 15))))
              (COND
               ((SPADCALL |scaleFactor|
                          (|minus_DF|
                           (SPADCALL (SPADCALL 101 -2 10 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          (QREFELT $ 38))
                (PROGN (LETT #2# |pt| . #3#) (GO #4#))))))
            (LETT |pt2| (MAKEARR1 (QREFELT $ 9) 0.0) . #3#)
            (LETT |infin| 0.0 . #3#)
            (SEQ (LETT |x| 1 . #3#) (LETT #1# (QREFELT $ 6) . #3#) G190
                 (COND ((|greater_SI| |x| #1#) (GO G191)))
                 (SEQ (LETT |index| (EXPT 2 (+ |x| 1)) . #3#)
                      (QSETAREF1 |pt2| |index|
                                 (|div_DF| (QAREF1 |pt| |index|)
                                           (|minus_DF| |scaleFactor|)))
                      (EXIT
                       (LETT |infin|
                             (|add_DF| |infin|
                                       (|mul_DF|
                                        (|mul_DF| (QAREF1 |pt2| |index|)
                                                  (QAREF1 |pt2| |index|))
                                        (SPADCALL
                                         (SPADCALL 5 -1 10 (QREFELT $ 13))
                                         (QREFELT $ 15))))
                             . #3#)))
                 (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191 (EXIT NIL))
            (QSETAREF1 |pt2| 1 (|minus_DF| 1.0)) (QSETAREF1 |pt2| 2 |infin|)
            (EXIT |pt2|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SCONF;toPoint;2$;24| ((|p| $) ($ $))
        (SPROG ((#1=#:G172 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0)
                      . #2=(|SCONF;toPoint;2$;24|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 9) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|)))) 

(SDEFUN |SCONF;toVector;2$;25| ((|p| $) ($ $))
        (SPROG ((#1=#:G176 NIL) (|i| NIL) (|pt| ($)))
               (SEQ
                (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0)
                      . #2=(|SCONF;toVector;2$;25|))
                (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 9) 1) . #2#)
                     G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 |pt| 1 0.0) (EXIT |pt|)))) 

(SDEFUN |SCONF;isPoint?;$B;26| ((|p| $) ($ |Boolean|))
        (|less_DF| (QAREF1 |p| 1)
                   (|minus_DF|
                    (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 13))
                              (QREFELT $ 15))))) 

(SDEFUN |SCONF;isVector?;$B;27| ((|p| $) ($ |Boolean|))
        (SPADCALL (QAREF1 |p| 1)
                  (|minus_DF|
                   (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 13)) (QREFELT $ 15)))
                  (QREFELT $ 38))) 

(PUT '|SCONF;hash;$Si;28| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |SCONF;hash;$Si;28| ((|s| $) ($ |SingleInteger|)) 0) 

(PUT '|SCONF;latex;$S;29| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(SDEFUN |SCONF;latex;$S;29| ((|s| $) ($ |String|)) "\\mbox{\\bf Unimplemented}") 

(SDEFUN |SCONF;=;2$B;30| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G185 NIL) (#2=#:G186 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|SCONF;=;2$B;30|))
                       (LETT #2# (- (QREFELT $ 9) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|)
                                     (QREFELT $ 28))
                           (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G184))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |SCONF;~=;2$B;31| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL |x| |y| (QREFELT $ 60)) 'NIL) ('T 'T))) 

(SDEFUN |SCONF;coerce;$Of;32| ((|pt| $) ($ |OutputForm|))
        (SPROG
         ((|eles| (|List| (|OutputForm|))) (#1=#:G192 NIL) (|i| NIL)
          (#2=#:G191 NIL))
         (SEQ
          (LETT |eles|
                (PROGN
                 (LETT #2# NIL . #3=(|SCONF;coerce;$Of;32|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 9) 1) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL (QAREF1 |pt| |i|) (QREFELT $ 62))
                                    #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (SPADCALL |eles| (QREFELT $ 64)))))) 

(DECLAIM (NOTINLINE |SConformal;|)) 

(DEFUN |SConformal| (#1=#:G193)
  (SPROG NIL
         (PROG (#2=#:G194)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SConformal|)
                                               '|domainEqualList|)
                    . #3=(|SConformal|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SConformal;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SConformal|)))))))))) 

(DEFUN |SConformal;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SConformal|))
          (LETT |dv$| (LIST '|SConformal| DV$1) . #1#)
          (LETT $ (GETREFV 67) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SConformal| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 2 (+ |#1| 2) (QREFELT $ 8)))
          (QSETREFV $ 10 (|PrimitiveArray| (|DoubleFloat|)))
          $))) 

(MAKEPROP '|SConformal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . ^) '|dim| '|Rep| (|Integer|) (|Float|) (6 . |float|)
              (|DoubleFloat|) (13 . |coerce|) (|Fraction| 11) (18 . |One|)
              (22 . |One|) |SCONF;spnt;2Df$;1| (|Boolean|) (26 . >)
              |SCONF;spnt;3Df$;2| |SCONF;svec;2Df$;3| |SCONF;svec;3Df$;4|
              |SCONF;min;3$;5| |SCONF;max;3$;6| |SCONF;dimension;$Pi;7|
              (32 . ~=) |SCONF;Pnan?;$B;9| (38 . |sqrt|)
              |SCONF;unitVector;2$;10| |SCONF;distanceSquared;2$Df;11|
              |SCONF;parallel;2$Df;12| |SCONF;perpendicular;3$;13|
              |SCONF;*;Df2$;14| |SCONF;+;3$;15| |SCONF;-;3$;16| (43 . >)
              |SCONF;inBounds?;3$B;17| |SCONF;screenCoordX;$Df;18|
              |SCONF;screenCoordY;$Df;19| |SCONF;screenCoordZ;$Df;20|
              (|List| 14) |SCONF;screenCoords;$L;21| (49 . |entries|)
              |SCONF;extendedCoords;$L;22| (|Void|) (|OutputForm|)
              (54 . |print|) (59 . |coerce|) |SCONF;normalisePoint;2$;23|
              |SCONF;toPoint;2$;24| |SCONF;toVector;2$;25|
              |SCONF;isPoint?;$B;26| |SCONF;isVector?;$B;27| (|SingleInteger|)
              |SCONF;hash;$Si;28| (|String|) |SCONF;latex;$S;29|
              |SCONF;=;2$B;30| |SCONF;~=;2$B;31| (64 . |coerce|) (|List| $)
              (69 . |paren|) |SCONF;coerce;$Of;32| (|HashState|))
           '#(~= 74 |unitVector| 80 |toVector| 85 |toPoint| 90 |svec| 95 |spnt|
              108 |sivec| 121 |sipnt| 134 |screenCoords| 147 |screenCoordZ| 152
              |screenCoordY| 157 |screenCoordX| 162 |perpendicular| 167
              |parallel| 173 |normalisePoint| 179 |min| 184 |max| 190 |latex|
              196 |isVector?| 201 |isPoint?| 206 |inBounds?| 211 |hashUpdate!|
              218 |hash| 224 |extendedCoords| 229 |distanceSquared| 234
              |distance| 240 |dimension| 246 |colinearity| 251 |coerce| 257
              |Pnan?| 262 = 267 - 273 + 279 * 285)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 48))
                        (|makeByteWordVec2| 66
                                            '(2 7 0 0 7 8 3 12 0 11 11 7 13 1
                                              12 14 0 15 0 16 0 17 0 12 0 18 2
                                              7 20 0 0 21 2 14 20 0 0 28 1 14 0
                                              0 30 2 14 20 0 0 38 1 10 43 0 45
                                              1 48 47 0 49 1 47 48 0 50 1 14 48
                                              0 62 1 48 0 63 64 2 0 20 0 0 61 1
                                              0 0 0 31 1 0 0 0 53 1 0 0 0 52 3
                                              0 0 14 14 14 24 2 0 0 14 14 23 3
                                              0 0 14 14 14 22 2 0 0 14 14 19 3
                                              0 0 11 11 11 1 2 0 0 11 11 1 3 0
                                              0 11 11 11 1 2 0 0 11 11 1 1 0 43
                                              0 44 1 0 14 0 42 1 0 14 0 41 1 0
                                              14 0 40 2 0 0 0 0 34 2 0 14 0 0
                                              33 1 0 0 0 51 2 0 0 0 0 25 2 0 0
                                              0 0 26 1 0 58 0 59 1 0 20 0 55 1
                                              0 20 0 54 3 0 20 0 0 0 39 2 0 66
                                              66 0 1 1 0 56 0 57 1 0 43 0 46 2
                                              0 14 0 0 32 2 0 14 0 0 1 1 0 7 0
                                              27 2 0 14 0 0 1 1 0 48 0 65 1 0
                                              20 0 29 2 0 20 0 0 60 2 0 0 0 0
                                              37 2 0 0 0 0 36 2 0 0 14 0
                                              35)))))
           '|lookupComplete|)) 
