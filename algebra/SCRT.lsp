
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

(DEFUN |SCRT;dimension;$Pi;5| (|p| $) (+ (QREFELT $ 6) 1)) 

(DEFUN |SCRT;nan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 17))) 

(DEFUN |SCRT;Pnan?;$B;7| (|p| $)
  (SEQ
   (COND
    ((OR (|SCRT;nan?| (QAREF1 |p| 0) $) (|SCRT;nan?| (QAREF1 |p| 1) $)) 'T)
    ('T
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
        (COND ((|SCRT;nan?| (QAREF1 |p| 2) $) (EXIT 'T)))))
      (EXIT 'NIL)))))) 

(DEFUN |SCRT;parallel;2$Df;8| (|x| |y| $)
  (|add_DF|
   (|add_DF| (|mul_DF| (QAREF1 |x| 0) (QAREF1 |y| 0))
             (|mul_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
   (|mul_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))) 

(DEFUN |SCRT;unitVector;2$;9| (|p| $)
  (PROG (|pt| |factor|)
    (RETURN
     (SEQ
      (LETT |factor|
            (COND
             ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
              (SPADCALL
               (|add_DF|
                (|add_DF| (|mul_DF| (QAREF1 |p| 0) (QAREF1 |p| 0))
                          (|mul_DF| (QAREF1 |p| 1) (QAREF1 |p| 1)))
                (|mul_DF| (QAREF1 |p| 2) (QAREF1 |p| 2)))
               (QREFELT $ 23)))
             ('T
              (SPADCALL
               (|add_DF| (|mul_DF| (QAREF1 |p| 0) (QAREF1 |p| 0))
                         (|mul_DF| (QAREF1 |p| 1) (QAREF1 |p| 1)))
               (QREFELT $ 23))))
            . #1=(|SCRT;unitVector;2$;9|))
      (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) . #1#)
      (QSETAREF1 |pt| 0 (|div_DF| (QAREF1 |p| 0) |factor|))
      (QSETAREF1 |pt| 1 (|div_DF| (QAREF1 |p| 1) |factor|))
      (COND
       ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
        (QSETAREF1 |pt| 2 (|div_DF| (QAREF1 |p| 2) |factor|))))
      (QSETAREF1 |pt| (QREFELT $ 6) 0.0) (EXIT |pt|))))) 

(DEFUN |SCRT;distanceSquared;2$Df;10| (|p1| |p2| $)
  (PROG (#1=#:G154)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
          (PROGN
           (LETT #1#
                 (|add_DF|
                  (|add_DF|
                   (|expt_DF_I| (|sub_DF| (QAREF1 |p1| 0) (QAREF1 |p2| 0)) 2)
                   (|expt_DF_I| (|sub_DF| (QAREF1 |p1| 1) (QAREF1 |p2| 1)) 2))
                  (|expt_DF_I| (|sub_DF| (QAREF1 |p1| 2) (QAREF1 |p2| 2)) 2))
                 |SCRT;distanceSquared;2$Df;10|)
           (GO #1#))))
        (EXIT
         (|add_DF| (|expt_DF_I| (|sub_DF| (QAREF1 |p1| 0) (QAREF1 |p2| 0)) 2)
                   (|expt_DF_I| (|sub_DF| (QAREF1 |p1| 1) (QAREF1 |p2| 1))
                                2)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCRT;perpendicular;3$;11| (|x| |y| $)
  (PROG (#1=#:G156 |pt|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0)
              . #2=(|SCRT;perpendicular;3$;11|))
        (COND
         ((< (QREFELT $ 6) 3)
          (PROGN (LETT #1# (SPADCALL 0 0 (QREFELT $ 27)) . #2#) (GO #1#))))
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

(DEFUN |SCRT;*;Df2$;12| (|s| |x| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (+ (QREFELT $ 6) 1) 0.0) |SCRT;*;Df2$;12|)
          (QSETAREF1 |pt| 0 (|mul_DF| (QAREF1 |x| 0) |s|))
          (QSETAREF1 |pt| 1 (|mul_DF| (QAREF1 |x| 1) |s|))
          (COND
           ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
            (QSETAREF1 |pt| 2 (|mul_DF| (QAREF1 |x| 2) |s|))))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;+;3$;13| (|x| |y| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 4 0.0) |SCRT;+;3$;13|)
          (QSETAREF1 |pt| 0 (|add_DF| (QAREF1 |x| 0) (QAREF1 |y| 0)))
          (QSETAREF1 |pt| 1 (|add_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
          (COND
           ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
            (QSETAREF1 |pt| 2 (|add_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;-;3$;14| (|x| |y| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 4 0.0) |SCRT;-;3$;14|)
          (QSETAREF1 |pt| 0 (|sub_DF| (QAREF1 |x| 0) (QAREF1 |y| 0)))
          (QSETAREF1 |pt| 1 (|sub_DF| (QAREF1 |x| 1) (QAREF1 |y| 1)))
          (COND
           ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
            (QSETAREF1 |pt| 2 (|sub_DF| (QAREF1 |x| 2) (QAREF1 |y| 2)))))
          (QSETAREF1 |pt| (QREFELT $ 6) 1.0) (EXIT |pt|))))) 

(DEFUN |SCRT;inBounds?;3$B;15| (|pt| |mns| |mxs| $)
  (COND
   ((OR (|less_DF| (QAREF1 |pt| 0) (QAREF1 |mns| 0))
        (OR (SPADCALL (QAREF1 |pt| 0) (QAREF1 |mxs| 0) (QREFELT $ 32))
            (OR (|less_DF| (QAREF1 |pt| 1) (QAREF1 |mns| 1))
                (SPADCALL (QAREF1 |pt| 1) (QAREF1 |mxs| 1) (QREFELT $ 32)))))
    'NIL)
   ('T 'T))) 

(PUT '|SCRT;screenCoordX;$Df;16| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 0))) 

(DEFUN |SCRT;screenCoordX;$Df;16| (|pt| $) (QAREF1 |pt| 0)) 

(PUT '|SCRT;screenCoordY;$Df;17| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 1))) 

(DEFUN |SCRT;screenCoordY;$Df;17| (|pt| $) (QAREF1 |pt| 1)) 

(DEFUN |SCRT;screenCoordZ;$Df;18| (|pt| $)
  (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12)) (QAREF1 |pt| 2)) ('T 0.0))) 

(DEFUN |SCRT;screenCoords;$L;19| (|pt| $)
  (SEQ
   (COND
    ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 12))
     (LIST (QAREF1 |pt| 0) (QAREF1 |pt| 1) (QAREF1 |pt| 2))))
   (EXIT (LIST (QAREF1 |pt| 0) (QAREF1 |pt| 1))))) 

(DEFUN |SCRT;extendedCoords;$L;20| (|pt| $) (SPADCALL |pt| (QREFELT $ 39))) 

(PUT '|SCRT;hash;$Si;21| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |SCRT;hash;$Si;21| (|s| $) 0) 

(PUT '|SCRT;latex;$S;22| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |SCRT;latex;$S;22| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |SCRT;=;2$B;23| (|x| |y| $)
  (PROG (#1=#:G179 #2=#:G180 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|SCRT;=;2$B;23|))
             (LETT #2# (+ (QREFELT $ 6) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|) (QREFELT $ 17))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SCRT;~=;2$B;24| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 45)) 'NIL) ('T 'T))) 

(DEFUN |SCRT;coerce;$Of;25| (|pt| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "proj" . #1=(|SCRT;coerce;$Of;25|))
          (COND
           ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 0.0) (LETT |s| "v" . #1#)))
          (COND
           ((|eql_DF| (QAREF1 |pt| (QREFELT $ 6)) 1.0) (LETT |s| "p" . #1#)))
          (EXIT
           (SPADCALL
            (LIST (SPADCALL |s| (QREFELT $ 48))
                  (SPADCALL (QAREF1 |pt| 0) (QREFELT $ 49))
                  (SPADCALL (QAREF1 |pt| 1) (QREFELT $ 49))
                  (SPADCALL (QAREF1 |pt| 2) (QREFELT $ 49)))
            (QREFELT $ 51))))))) 

(DEFUN |SCartesian| (#1=#:G186)
  (PROG ()
    (RETURN
     (PROG (#2=#:G187)
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
      (LETT $ (GETREFV 53) . #1#)
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
              |SCRT;dimension;$Pi;5| (6 . ~=) |SCRT;Pnan?;$B;7|
              |SCRT;parallel;2$Df;8| (|Fraction| 26) (12 . |One|) (16 . |Zero|)
              (20 . |sqrt|) |SCRT;unitVector;2$;9|
              |SCRT;distanceSquared;2$Df;10| (|Integer|) (25 . |sipnt|)
              |SCRT;perpendicular;3$;11| |SCRT;*;Df2$;12| |SCRT;+;3$;13|
              |SCRT;-;3$;14| (31 . >) |SCRT;inBounds?;3$B;15|
              |SCRT;screenCoordX;$Df;16| |SCRT;screenCoordY;$Df;17|
              |SCRT;screenCoordZ;$Df;18| (|List| 8) |SCRT;screenCoords;$L;19|
              (37 . |entries|) |SCRT;extendedCoords;$L;20| (|SingleInteger|)
              |SCRT;hash;$Si;21| (|String|) |SCRT;latex;$S;22| |SCRT;=;2$B;23|
              |SCRT;~=;2$B;24| (|OutputForm|) (42 . |coerce|) (47 . |coerce|)
              (|List| $) (52 . |paren|) |SCRT;coerce;$Of;25|)
           '#(~= 57 |unitVector| 63 |svec| 68 |spnt| 81 |sivec| 94 |sipnt| 107
              |screenCoords| 120 |screenCoordZ| 125 |screenCoordY| 130
              |screenCoordX| 135 |perpendicular| 140 |parallel| 146 |latex| 152
              |inBounds?| 157 |hash| 164 |extendedCoords| 169 |distanceSquared|
              174 |distance| 180 |dimension| 186 |colinearity| 191 |coerce| 197
              |Pnan?| 202 = 207 - 213 + 219 * 225)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 47))
                        (|makeByteWordVec2| 52
                                            '(2 11 10 0 0 12 2 8 10 0 0 17 0 20
                                              0 21 0 20 0 22 1 8 0 0 23 2 0 0
                                              26 26 27 2 8 10 0 0 32 1 7 37 0
                                              39 1 43 47 0 48 1 8 47 0 49 1 47
                                              0 50 51 2 0 10 0 0 46 1 0 0 0 24
                                              3 0 0 8 8 8 15 2 0 0 8 8 14 3 0 0
                                              8 8 8 13 2 0 0 8 8 9 3 0 0 26 26
                                              26 1 2 0 0 26 26 1 3 0 0 26 26 26
                                              1 2 0 0 26 26 27 1 0 37 0 38 1 0
                                              8 0 36 1 0 8 0 35 1 0 8 0 34 2 0
                                              0 0 0 28 2 0 8 0 0 19 1 0 43 0 44
                                              3 0 10 0 0 0 33 1 0 41 0 42 1 0
                                              37 0 40 2 0 8 0 0 25 2 0 8 0 0 1
                                              1 0 11 0 16 2 0 8 0 0 1 1 0 47 0
                                              52 1 0 10 0 18 2 0 10 0 0 45 2 0
                                              0 0 0 31 2 0 0 0 0 30 2 0 0 8 0
                                              29)))))
           '|lookupComplete|)) 
