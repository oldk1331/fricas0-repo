
(/VERSIONCHECK 2) 

(DEFUN |SCONF;spnt;2Df$;1| (|a| |b| $)
  (PROG (|z| |inf|)
    (RETURN
     (SEQ
      (LETT |inf|
            (|mul_DF| (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15)))
            . #1=(|SCONF;spnt;2Df$;1|))
      (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
      (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
      (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|))))) 

(DEFUN |SCONF;spnt;3Df$;2| (|a| |b| |c| $)
  (PROG (|z| |inf|)
    (RETURN
     (SEQ
      (LETT |inf|
            (|mul_DF|
             (|add_DF| (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                       (|mul_DF| |c| |c|))
             (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13)) (QREFELT $ 15)))
            . #1=(|SCONF;spnt;3Df$;2|))
      (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
      (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
      (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
      (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21)) (QSETAREF1 |z| 16 |c|)))
      (EXIT |z|))))) 

(DEFUN |SCONF;svec;2Df$;3| (|a| |b| $)
  (PROG (|z| |inf|)
    (RETURN
     (SEQ
      (LETT |inf|
            (|mul_DF| (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15)))
            . #1=(|SCONF;svec;2Df$;3|))
      (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
      (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
      (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|) (EXIT |z|))))) 

(DEFUN |SCONF;svec;3Df$;4| (|a| |b| |c| $)
  (PROG (|z| |inf|)
    (RETURN
     (SEQ
      (LETT |inf|
            (|mul_DF|
             (|add_DF| (|add_DF| (|mul_DF| |a| |a|) (|mul_DF| |b| |b|))
                       (|mul_DF| |c| |c|))
             (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13)) (QREFELT $ 15)))
            . #1=(|SCONF;svec;3Df$;4|))
      (LETT |z| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
      (QSETAREF1 |z| 1 (|minus_DF| 1.0)) (QSETAREF1 |z| 2 |inf|)
      (QSETAREF1 |z| 4 |a|) (QSETAREF1 |z| 8 |b|)
      (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21)) (QSETAREF1 |z| 16 |c|)))
      (EXIT |z|))))) 

(PUT '|SCONF;dimension;$Pi;5| '|SPADreplace| '(XLAM (|p|) 2)) 

(DEFUN |SCONF;dimension;$Pi;5| (|p| $) 2) 

(DEFUN |SCONF;nan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 26))) 

(DEFUN |SCONF;Pnan?;$B;7| (|p| $)
  (COND
   ((OR (|SCONF;nan?| (QAREF1 |p| 4) $) (|SCONF;nan?| (QAREF1 |p| 8) $)) 'T)
   ('T 'NIL))) 

(DEFUN |SCONF;unitVector;2$;8| (|p| $)
  (PROG (|pt| |factor|)
    (RETURN
     (SEQ
      (LETT |factor|
            (SPADCALL
             (|add_DF| (|mul_DF| (QAREF1 |p| 4) (QAREF1 |p| 4))
                       (|mul_DF| (QAREF1 |p| 8) (QAREF1 |p| 8)))
             (QREFELT $ 28))
            . #1=(|SCONF;unitVector;2$;8|))
      (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) . #1#)
      (QSETAREF1 |pt| 4 (|div_DF| (QAREF1 |p| 4) |factor|))
      (QSETAREF1 |pt| 8 (|div_DF| (QAREF1 |p| 8) |factor|))
      (QSETAREF1 |pt| 2
                 (|mul_DF|
                  (|add_DF| (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                            (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13)) (QREFELT $ 15))))
      (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|))))) 

(PUT '|SCONF;distanceSquared;2$Df;9| '|SPADreplace| '(XLAM (|p1| |p2|) 1.0)) 

(DEFUN |SCONF;distanceSquared;2$Df;9| (|p1| |p2| $) 1.0) 

(DEFUN |SCONF;parallel;2$Df;10| (|x| |y| $)
  (|add_DF| (|mul_DF| (QAREF1 |x| 6) (QAREF1 |y| 6))
            (|mul_DF| (QAREF1 |x| 10) (QAREF1 |y| 10)))) 

(DEFUN |SCONF;perpendicular;3$;11| (|x| |y| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;perpendicular;3$;11|)
          (QSETAREF1 |pt| 4 0.0) (QSETAREF1 |pt| 8 1.0)
          (QSETAREF1 |pt| 2
                     (|mul_DF|
                      (|add_DF| (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15))))
          (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|))))) 

(DEFUN |SCONF;*;Df2$;12| (|s| |x| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;*;Df2$;12|)
          (QSETAREF1 |pt| 4 (|mul_DF| (QAREF1 |x| 4) |s|))
          (QSETAREF1 |pt| 8 (|mul_DF| (QAREF1 |x| 8) |s|))
          (QSETAREF1 |pt| 2
                     (|mul_DF|
                      (|add_DF| (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15))))
          (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|))))) 

(DEFUN |SCONF;+;3$;13| (|x| |y| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;+;3$;13|)
          (QSETAREF1 |pt| 4 (|add_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
          (QSETAREF1 |pt| 8 (|add_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
          (QSETAREF1 |pt| 2
                     (|mul_DF|
                      (|add_DF| (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15))))
          (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|))))) 

(DEFUN |SCONF;-;3$;14| (|x| |y| $)
  (PROG (|pt|)
    (RETURN
     (SEQ (LETT |pt| (MAKEARR1 (QREFELT $ 9) 0.0) |SCONF;-;3$;14|)
          (QSETAREF1 |pt| 4 (|sub_DF| (QAREF1 |x| 4) (QAREF1 |y| 4)))
          (QSETAREF1 |pt| 8 (|sub_DF| (QAREF1 |x| 8) (QAREF1 |y| 8)))
          (QSETAREF1 |pt| 2
                     (|mul_DF|
                      (|add_DF| (|mul_DF| (QAREF1 |pt| 4) (QAREF1 |pt| 4))
                                (|mul_DF| (QAREF1 |pt| 8) (QAREF1 |pt| 8)))
                      (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                (QREFELT $ 15))))
          (QSETAREF1 |pt| 1 (|minus_DF| 1.0)) (EXIT |pt|))))) 

(DEFUN |SCONF;inBounds?;3$B;15| (|pt| |mns| |mxs| $)
  (COND
   ((OR (|less_DF| (QAREF1 |pt| 4) (QAREF1 |mns| 4))
        (OR (SPADCALL (QAREF1 |pt| 4) (QAREF1 |mxs| 4) (QREFELT $ 36))
            (OR (|less_DF| (QAREF1 |pt| 8) (QAREF1 |mns| 8))
                (SPADCALL (QAREF1 |pt| 8) (QAREF1 |mxs| 8) (QREFELT $ 36)))))
    'NIL)
   ('T 'T))) 

(PUT '|SCONF;screenCoordX;$Df;16| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 4))) 

(DEFUN |SCONF;screenCoordX;$Df;16| (|pt| $) (QAREF1 |pt| 4)) 

(PUT '|SCONF;screenCoordY;$Df;17| '|SPADreplace| '(XLAM (|pt|) (QAREF1 |pt| 8))) 

(DEFUN |SCONF;screenCoordY;$Df;17| (|pt| $) (QAREF1 |pt| 8)) 

(DEFUN |SCONF;screenCoordZ;$Df;18| (|pt| $)
  (COND ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21)) (QAREF1 |pt| 16)) ('T 0.0))) 

(DEFUN |SCONF;screenCoords;$L;19| (|pt| $)
  (PROG (#1=#:G172)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (QREFELT $ 6) 2 (QREFELT $ 21))
          (PROGN
           (LETT #1# (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8) (QAREF1 |pt| 16))
                 |SCONF;screenCoords;$L;19|)
           (GO #1#))))
        (EXIT (LIST (QAREF1 |pt| 4) (QAREF1 |pt| 8)))))
      #1# (EXIT #1#))))) 

(DEFUN |SCONF;extendedCoords;$L;20| (|pt| $) (SPADCALL |pt| (QREFELT $ 43))) 

(DEFUN |SCONF;normalisePoint;2$;21| (|pt| $)
  (PROG (|infin| |index| #1=#:G183 |x| |pt2| #2=#:G182 |scaleFactor|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |scaleFactor| (QAREF1 |pt| 1)
              . #3=(|SCONF;normalisePoint;2$;21|))
        (COND
         ((|less_DF| |scaleFactor|
                     (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 13))
                               (QREFELT $ 15)))
          (COND
           ((SPADCALL |scaleFactor|
                      (|minus_DF|
                       (SPADCALL (SPADCALL 1 -2 10 (QREFELT $ 13))
                                 (QREFELT $ 15)))
                      (QREFELT $ 36))
            (SEQ (|sayBrightly| "can't apply normalisePoint to a vector")
                 (EXIT (PROGN (LETT #2# |pt| . #3#) (GO #2#))))))))
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
                      (QREFELT $ 36))
            (PROGN (LETT #2# |pt| . #3#) (GO #2#))))))
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
                                    (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 13))
                                              (QREFELT $ 15))))
                         . #3#)))
             (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191 (EXIT NIL))
        (QSETAREF1 |pt2| 1 (|minus_DF| 1.0)) (QSETAREF1 |pt2| 2 |infin|)
        (|sayBrightly|
         (SPADCALL
          (LIST "normalisePoint " (|mathObject2String| |pt|) " normalised to "
                (|mathObject2String| |pt2|) ")")
          (QREFELT $ 47)))
        (EXIT |pt2|)))
      #2# (EXIT #2#))))) 

(PUT '|SCONF;hash;$Si;22| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |SCONF;hash;$Si;22| (|s| $) 0) 

(PUT '|SCONF;latex;$S;23| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |SCONF;latex;$S;23| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |SCONF;=;2$B;24| (|x| |y| $)
  (PROG (#1=#:G189 #2=#:G190 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #3=(|SCONF;=;2$B;24|))
             (LETT #2# (- (QREFELT $ 9) 1) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (QAREF1 |x| |i|) (QAREF1 |y| |i|) (QREFELT $ 26))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SCONF;~=;2$B;25| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 52)) 'NIL) ('T 'T))) 

(DEFUN |SCONF;coerce;$Of;26| (|pt| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "proj" . #1=(|SCONF;coerce;$Of;26|))
          (COND ((|eql_DF| (QAREF1 |pt| 4) 0.0) (LETT |s| "v" . #1#)))
          (COND ((|eql_DF| (QAREF1 |pt| 4) 1.0) (LETT |s| "p" . #1#)))
          (EXIT
           (SPADCALL
            (LIST (SPADCALL |s| (QREFELT $ 55))
                  (SPADCALL (QAREF1 |pt| 4) (QREFELT $ 56))
                  (SPADCALL (QAREF1 |pt| 8) (QREFELT $ 56)))
            (QREFELT $ 57))))))) 

(DEFUN |SConformal| (#1=#:G196)
  (PROG ()
    (RETURN
     (PROG (#2=#:G197)
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
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SConformal|))))))))))) 

(DEFUN |SConformal;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SConformal|))
      (LETT |dv$| (LIST '|SConformal| DV$1) . #1#)
      (LETT $ (GETREFV 59) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SConformal| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL 2 (+ |#1| 2) (QREFELT $ 8)))
      (QSETREFV $ 10 (|PrimitiveArray| (|DoubleFloat|)))
      $)))) 

(MAKEPROP '|SConformal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . ^) '|dim| '|Rep| (|Integer|) (|Float|) (6 . |float|)
              (|DoubleFloat|) (13 . |coerce|) (|Fraction| 11) (18 . |One|)
              (22 . |One|) |SCONF;spnt;2Df$;1| (|Boolean|) (26 . >)
              |SCONF;spnt;3Df$;2| |SCONF;svec;2Df$;3| |SCONF;svec;3Df$;4|
              |SCONF;dimension;$Pi;5| (32 . ~=) |SCONF;Pnan?;$B;7|
              (38 . |sqrt|) |SCONF;unitVector;2$;8|
              |SCONF;distanceSquared;2$Df;9| |SCONF;parallel;2$Df;10|
              |SCONF;perpendicular;3$;11| |SCONF;*;Df2$;12| |SCONF;+;3$;13|
              |SCONF;-;3$;14| (43 . >) |SCONF;inBounds?;3$B;15|
              |SCONF;screenCoordX;$Df;16| |SCONF;screenCoordY;$Df;17|
              |SCONF;screenCoordZ;$Df;18| (|List| 14)
              |SCONF;screenCoords;$L;19| (49 . |entries|)
              |SCONF;extendedCoords;$L;20| (|List| $) (|String|)
              (54 . |concat|) |SCONF;normalisePoint;2$;21| (|SingleInteger|)
              |SCONF;hash;$Si;22| |SCONF;latex;$S;23| |SCONF;=;2$B;24|
              |SCONF;~=;2$B;25| (|OutputForm|) (59 . |coerce|) (64 . |coerce|)
              (69 . |paren|) |SCONF;coerce;$Of;26|)
           '#(~= 74 |unitVector| 80 |svec| 85 |spnt| 98 |sivec| 111 |sipnt| 124
              |screenCoords| 137 |screenCoordZ| 142 |screenCoordY| 147
              |screenCoordX| 152 |perpendicular| 157 |parallel| 163
              |normalisePoint| 169 |latex| 174 |inBounds?| 179 |hash| 186
              |extendedCoords| 191 |distanceSquared| 196 |distance| 202
              |dimension| 208 |colinearity| 213 |coerce| 219 |Pnan?| 224 = 229
              - 235 + 241 * 247)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 54))
                        (|makeByteWordVec2| 58
                                            '(2 7 0 0 7 8 3 12 0 11 11 7 13 1
                                              12 14 0 15 0 16 0 17 0 12 0 18 2
                                              7 20 0 0 21 2 14 20 0 0 26 1 14 0
                                              0 28 2 14 20 0 0 36 1 10 41 0 43
                                              1 46 0 45 47 1 46 54 0 55 1 14 54
                                              0 56 1 54 0 45 57 2 0 20 0 0 53 1
                                              0 0 0 29 3 0 0 14 14 14 24 2 0 0
                                              14 14 23 3 0 0 14 14 14 22 2 0 0
                                              14 14 19 3 0 0 11 11 11 1 2 0 0
                                              11 11 1 3 0 0 11 11 11 1 2 0 0 11
                                              11 1 1 0 41 0 42 1 0 14 0 40 1 0
                                              14 0 39 1 0 14 0 38 2 0 0 0 0 32
                                              2 0 14 0 0 31 1 0 0 0 48 1 0 46 0
                                              51 3 0 20 0 0 0 37 1 0 49 0 50 1
                                              0 41 0 44 2 0 14 0 0 30 2 0 14 0
                                              0 1 1 0 7 0 25 2 0 14 0 0 1 1 0
                                              54 0 58 1 0 20 0 27 2 0 20 0 0 52
                                              2 0 0 0 0 35 2 0 0 0 0 34 2 0 0
                                              14 0 33)))))
           '|lookupComplete|)) 
