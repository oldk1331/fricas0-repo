
(/VERSIONCHECK 2) 

(DEFUN |SCRT;spnt;2Df$;1| (|a| |b| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) |SCRT;spnt;2Df$;1|)
          (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;spnt;3Df$;2| (|a| |b| |c| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) |SCRT;spnt;3Df$;2|)
          (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
          (COND
           ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QSETAREF1 |pt| 2 |c|)))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;svec;2Df$;3| (|a| |b| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) |SCRT;svec;2Df$;3|)
          (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
          (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|))))) 

(DEFUN |SCRT;svec;3Df$;4| (|a| |b| |c| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) |SCRT;svec;3Df$;4|)
          (QSETAREF1 |pt| 0 |a|) (QSETAREF1 |pt| 1 |b|)
          (COND
           ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QSETAREF1 |pt| 2 |c|)))
          (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|))))) 

(DEFUN |SCRT;min;3$;5| (|a| |b| $)
  (PROG (#1=#:G146 |i| |pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #2=(|SCRT;min;3$;5|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |pt| |i|
                            (|min_DF| (QAREF1 |a| |i|) (QAREF1 |b| |i|)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;max;3$;6| (|a| |b| $)
  (PROG (#1=#:G150 |i| |pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #2=(|SCRT;max;3$;6|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |pt| |i|
                            (|max_DF| (QAREF1 |a| |i|) (QAREF1 |b| |i|)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;dimension;$Pi;7| (|p| $) (+ (QREFELT $ 6) 1)) 

(DEFUN |SCRT;nan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 19))) 

(DEFUN |SCRT;Pnan?;$B;9| (|p| $)
  (PROG (#1=#:G156 #2=#:G157 |i|)
    (RETURN
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
                 (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SCRT;parallel;2$Df;10| (|x| |y| $)
  (|add_DF|
   (|add_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 0))
             (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
   (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))) 

(DEFUN |SCRT;unitVector;2$;11| (|p| $)
  (PROG (#1=#:G164 |i| |pt| |factor| #2=#:G163)
    (RETURN
     (SEQ (LETT |factor| 0.0 . #3=(|SCRT;unitVector;2$;11|))
          (SEQ (LETT |i| 0 . #3#) (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |factor|
                       (|add_DF| |factor|
                                 (|mul_DF| (QAREF1 |p| |i|) (QAREF1 |p| |i|)))
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |factor| (SPADCALL |factor| (QREFELT $ 22)) . #3#)
          (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #3#)
          (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 6) 1) . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |pt| |i| (|div_DF| (QAREF1 |p| |i|) |factor|))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|))))) 

(DEFUN |SCRT;distanceSquared;2$Df;12| (|p1| |p2| $)
  (PROG (|factor| #1=#:G168 |i|)
    (RETURN
     (SEQ (LETT |factor| 0.0 . #2=(|SCRT;distanceSquared;2$Df;12|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
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
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |factor|))))) 

(DEFUN |SCRT;perpendicular;3$;13| (|x| |y| $)
  (PROG (#1=#:G170 |pt|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
              . #2=(|SCRT;perpendicular;3$;13|))
        (COND
         ((< (QREFELT $ 6) 3)
          (PROGN (LETT #1# (SPADCALL 0 0 (QREFELT $ 26)) . #2#) (GO #1#))))
        (QSETAREF1 |pt| 0
                   (|sub_DF| (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 2))
                             (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 1))))
        (QSETAREF1 |pt| 1
                   (|sub_DF| (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 0))
                             (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 2))))
        (QSETAREF1 |pt| 2
                   (|sub_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 1))
                             (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 0))))
        (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|)))
      #1# (EXIT #1#))))) 

(DEFUN |SCRT;*;Df2$;14| (|s| |x| $)
  (PROG (#1=#:G174 |i| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #2=(|SCRT;*;Df2$;14|))
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |pt| |i| (|mul_DF| (QAREF1 |x| |i|) |s|))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (QSETAREF1 |pt| (QREFELT $ 6) (QAREF1 |x| (QREFELT $ 6))) (EXIT |pt|))))) 

(DEFUN |SCRT;+;3$;15| (|x| |y| $)
  (PROG (#1=#:G179 |i| |pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #2=(|SCRT;+;3$;15|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |pt| |i|
                            (|add_DF| (QAREF1 |x| |i|) (QAREF1 |y| |i|)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |pt| (QREFELT $ 6)
                     (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                               (QAREF1 |y| (QREFELT $ 6))))
          (COND
           ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 31))
            (QSETAREF1 |pt| (QREFELT $ 6) 1.0)))
          (EXIT |pt|))))) 

(DEFUN |SCRT;-;3$;16| (|x| |y| $)
  (PROG (#1=#:G184 |i| |pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #2=(|SCRT;-;3$;16|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |pt| |i|
                            (|sub_DF| (QAREF1 |x| |i|) (QAREF1 |y| |i|)))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 |pt| (QREFELT $ 6)
                     (|add_DF| (QAREF1 |x| (QREFELT $ 6))
                               (QAREF1 |y| (QREFELT $ 6))))
          (COND
           ((SPADCALL (QAREF1 |pt| (QREFELT $ 6)) 1.0 (QREFELT $ 31))
            (QSETAREF1 |pt| (QREFELT $ 6) 0.0)))
          (EXIT |pt|))))) 

(DEFUN |SCRT;inBounds?;3$B;17| (|pt| |mns| |mxs| $)
  (PROG (#1=#:G189 #2=#:G190 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|SCRT;inBounds?;3$B;17|))
             (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (COND
               ((|less_DF| (QAREF1 |pt| |i|) (QAREF1 |mns| |i|))
                (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
              (EXIT
               (COND
                ((SPADCALL (QAREF1 |pt| |i|) (QAREF1 |mxs| |i|) (QREFELT $ 31))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(PUT '|SCRT;screenCoordX;$Df;18| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 0))) 

(DEFUN |SCRT;screenCoordX;$Df;18| (|pt| $) (QAREF1 |pt| 0)) 

(PUT '|SCRT;screenCoordY;$Df;19| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 1))) 

(DEFUN |SCRT;screenCoordY;$Df;19| (|pt| $) (QAREF1 |pt| 1)) 

(DEFUN |SCRT;screenCoordZ;$Df;20| (|pt| $)
  (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QAREF1 |pt| 2)) ('T 0.0))) 

(DEFUN |SCRT;screenCoords;$L;21| (|pt| $)
  (PROG (|res| #1=#:G197 |i|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|SCRT;screenCoords;$L;21|))
          (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res| (SPADCALL |res| (QAREF1 |pt| |i|) (QREFELT $ 39))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |SCRT;extendedCoords;$L;22| (|pt| $) (SPADCALL |pt| (QREFELT $ 41))) 

(DEFUN |SCRT;toPoint;2$;23| (|p| $)
  (PROG (#1=#:G202 |i| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
            . #2=(|SCRT;toPoint;2$;23|))
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;toVector;2$;24| (|p| $)
  (PROG (#1=#:G206 |i| |pt|)
    (RETURN
     (SEQ
      (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
            . #2=(|SCRT;toVector;2$;24|))
      (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |pt| |i| (QAREF1 |p| |i|))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|))))) 

(DEFUN |SCRT;isPoint?;$B;25| (|p| $)
  (SPADCALL (QAREF1 |p| (QREFELT $ 6))
            (SPADCALL (SPADCALL 9 -1 10 (QREFELT $ 46)) (QREFELT $ 47))
            (QREFELT $ 31))) 

(DEFUN |SCRT;isVector?;$B;26| (|p| $)
  (|less_DF| (QAREF1 |p| (QREFELT $ 6))
             (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 46)) (QREFELT $ 47)))) 

(PUT '|SCRT;hash;$Si;27| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |SCRT;hash;$Si;27| (|s| $) 0) 

(PUT '|SCRT;latex;$S;28| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |SCRT;latex;$S;28| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |SCRT;=;2$B;29| (|x| |y| $)
  (PROG (#1=#:G214 #2=#:G215 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|SCRT;=;2$B;29|))
             (LETT #2# (+ (QREFELT $ 6) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|) (QREFELT $ 19))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SCRT;~=;2$B;30| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 54)) 'NIL) ('T 'T))) 

(DEFUN |SCRT;coerce;$Of;31| (|pt| $)
  (PROG (|eles| #1=#:G223 |i| #2=#:G222 |s|)
    (RETURN
     (SEQ (LETT |s| '|proj| . #3=(|SCRT;coerce;$Of;31|))
          (COND
           ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 0.0)
            (LETT |s| '|vec| . #3#)))
          (COND
           ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 1.0) (LETT |s| '|pt| . #3#)))
          (LETT |eles|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- (QREFELT $ 6) 1) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL (QAREF1 |pt| |i|) (QREFELT $ 57))
                                    #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (SPADCALL (SPADCALL |s| (QREFELT $ 59))
                     (SPADCALL |eles| (QREFELT $ 61)) (QREFELT $ 62))))))) 

(DECLAIM (NOTINLINE |SCartesian;|)) 

(DEFUN |SCartesian| (#1=#:G224)
  (PROG ()
    (RETURN
     (PROG (#2=#:G225)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SCartesian|))))))))))) 

(DEFUN |SCartesian;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
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
      $)))) 

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
