
(/VERSIONCHECK 2) 

(PUT '|SARGND;spnt;2Df$;1| '|SPADreplace| 'CONS) 

(DEFUN |SARGND;spnt;2Df$;1| (|a| |b| $) (CONS |a| |b|)) 

(PUT '|SARGND;spnt;3Df$;2| '|SPADreplace| '(XLAM (|a| |b| |c|) (CONS |a| |b|))) 

(DEFUN |SARGND;spnt;3Df$;2| (|a| |b| |c| $) (CONS |a| |b|)) 

(PUT '|SARGND;svec;2Df$;3| '|SPADreplace| 'CONS) 

(DEFUN |SARGND;svec;2Df$;3| (|a| |b| $) (CONS |a| |b|)) 

(PUT '|SARGND;svec;3Df$;4| '|SPADreplace| '(XLAM (|a| |b| |c|) (CONS |a| |b|))) 

(DEFUN |SARGND;svec;3Df$;4| (|a| |b| |c| $) (CONS |a| |b|)) 

(PUT '|SARGND;dimension;$Pi;5| '|SPADreplace| '(XLAM (|p|) 2)) 

(DEFUN |SARGND;dimension;$Pi;5| (|p| $) 2) 

(DEFUN |SARGND;nan?| (|x| $) (SPADCALL |x| |x| (QREFELT $ 15))) 

(DEFUN |SARGND;Pnan?;$B;7| (|p| $)
  (COND ((OR (|SARGND;nan?| (QCAR |p|) $) (|SARGND;nan?| (QCDR |p|) $)) 'T)
        ('T 'NIL))) 

(DEFUN |SARGND;unitVector;2$;8| (|p| $)
  (PROG (|factor|)
    (RETURN
     (SEQ
      (LETT |factor|
            (SPADCALL
             (|add_DF| (|mul_DF| (QCAR |p|) (QCAR |p|))
                       (|mul_DF| (QCDR |p|) (QCDR |p|)))
             (QREFELT $ 17))
            |SARGND;unitVector;2$;8|)
      (EXIT
       (CONS (|div_DF| (QCAR |p|) |factor|) (|div_DF| (QCDR |p|) |factor|))))))) 

(DEFUN |SARGND;distanceSquared;2$Df;9| (|p1| |p2| $)
  (|add_DF| (|expt_DF_I| (|sub_DF| (QCAR |p1|) (QCAR |p2|)) 2)
            (|expt_DF_I| (|sub_DF| (QCDR |p1|) (QCDR |p2|)) 2))) 

(DEFUN |SARGND;parallel;2$Df;10| (|x| |y| $)
  (|add_DF| (|mul_DF| (QCAR |x|) (QCAR |y|)) (|mul_DF| (QCDR |x|) (QCDR |y|)))) 

(PUT '|SARGND;perpendicular;3$;11| '|SPADreplace|
     '(XLAM (|x| |y|) (CONS 0.0 1.0))) 

(DEFUN |SARGND;perpendicular;3$;11| (|x| |y| $) (CONS 0.0 1.0)) 

(DEFUN |SARGND;*;Df2$;12| (|s| |x| $)
  (CONS (|mul_DF| (QCAR |x|) |s|) (|mul_DF| (QCDR |x|) |s|))) 

(DEFUN |SARGND;+;3$;13| (|x| |y| $)
  (CONS (|add_DF| (QCAR |x|) (QCAR |y|)) (|add_DF| (QCDR |x|) (QCDR |y|)))) 

(DEFUN |SARGND;-;3$;14| (|x| |y| $)
  (CONS (|sub_DF| (QCAR |x|) (QCAR |y|)) (|sub_DF| (QCDR |x|) (QCDR |y|)))) 

(DEFUN |SARGND;inBounds?;3$B;15| (|pt| |mns| |mxs| $)
  (COND
   ((OR (|less_DF| (QCAR |pt|) (QCAR |mns|))
        (OR (SPADCALL (QCAR |pt|) (QCAR |mxs|) (QREFELT $ 25))
            (OR (|less_DF| (QCDR |pt|) (QCDR |mns|))
                (SPADCALL (QCDR |pt|) (QCDR |mxs|) (QREFELT $ 25)))))
    'NIL)
   ('T 'T))) 

(PUT '|SARGND;screenCoordX;$Df;16| '|SPADreplace| 'QCAR) 

(DEFUN |SARGND;screenCoordX;$Df;16| (|pt| $) (QCAR |pt|)) 

(PUT '|SARGND;screenCoordY;$Df;17| '|SPADreplace| 'QCDR) 

(DEFUN |SARGND;screenCoordY;$Df;17| (|pt| $) (QCDR |pt|)) 

(PUT '|SARGND;screenCoordZ;$Df;18| '|SPADreplace| '(XLAM (|pt|) 0.0)) 

(DEFUN |SARGND;screenCoordZ;$Df;18| (|pt| $) 0.0) 

(DEFUN |SARGND;screenCoords;$L;19| (|pt| $) (LIST (QCAR |pt|) (QCDR |pt|))) 

(DEFUN |SARGND;extendedCoords;$L;20| (|pt| $) (LIST (QCAR |pt|) (QCDR |pt|))) 

(DEFUN |SARGND;coerce;$C;21| (|me| $)
  (SPADCALL (QCAR |me|) (QCDR |me|) (QREFELT $ 34))) 

(DEFUN |SARGND;coerce;C$;22| (|cmpx| $)
  (CONS (SPADCALL |cmpx| (QREFELT $ 36)) (SPADCALL |cmpx| (QREFELT $ 37)))) 

(PUT '|SARGND;hash;$Si;23| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |SARGND;hash;$Si;23| (|s| $) 0) 

(PUT '|SARGND;latex;$S;24| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |SARGND;latex;$S;24| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |SARGND;=;2$B;25| (|x| |y| $)
  (PROG (#1=#:G171)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 15))
          (PROGN (LETT #1# 'NIL . #2=(|SARGND;=;2$B;25|)) (GO #1#))))
        (COND
         ((SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 15))
          (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SARGND;~=;2$B;26| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 43)) 'NIL) ('T 'T))) 

(DEFUN |SARGND;coerce;$Of;27| (|pt| $)
  (SPADCALL
   (LIST (SPADCALL (QCAR |pt|) (QREFELT $ 46))
         (SPADCALL (QCDR |pt|) (QREFELT $ 46)))
   (QREFELT $ 48))) 

(DEFUN |SArgand| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G175)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|SArgand|) . #2=(|SArgand|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|SArgand|
                         (LIST (CONS NIL (CONS 1 (|SArgand;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|SArgand|))))))))))) 

(DEFUN |SArgand;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SArgand|) . #1=(|SArgand|))
      (LETT $ (GETREFV 51) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SArgand| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |r| (|DoubleFloat|)) (|:| |i| (|DoubleFloat|))))
      $)))) 

(MAKEPROP '|SArgand| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|DoubleFloat|)
              |SARGND;spnt;2Df$;1| |SARGND;spnt;3Df$;2| |SARGND;svec;2Df$;3|
              |SARGND;svec;3Df$;4| (|PositiveInteger|) |SARGND;dimension;$Pi;5|
              (|Boolean|) (0 . ~=) |SARGND;Pnan?;$B;7| (6 . |sqrt|)
              |SARGND;unitVector;2$;8| |SARGND;distanceSquared;2$Df;9|
              |SARGND;parallel;2$Df;10| |SARGND;perpendicular;3$;11|
              |SARGND;*;Df2$;12| |SARGND;+;3$;13| |SARGND;-;3$;14| (11 . >)
              |SARGND;inBounds?;3$B;15| |SARGND;screenCoordX;$Df;16|
              |SARGND;screenCoordY;$Df;17| |SARGND;screenCoordZ;$Df;18|
              (|List| 7) |SARGND;screenCoords;$L;19|
              |SARGND;extendedCoords;$L;20| (|Complex| 7) (17 . |complex|)
              |SARGND;coerce;$C;21| (23 . |real|) (28 . |imag|)
              |SARGND;coerce;C$;22| (|SingleInteger|) |SARGND;hash;$Si;23|
              (|String|) |SARGND;latex;$S;24| |SARGND;=;2$B;25|
              |SARGND;~=;2$B;26| (|OutputForm|) (33 . |coerce|) (|List| $)
              (38 . |paren|) |SARGND;coerce;$Of;27| (|Integer|))
           '#(~= 43 |unitVector| 49 |svec| 54 |spnt| 67 |sivec| 80 |sipnt| 93
              |screenCoords| 106 |screenCoordZ| 111 |screenCoordY| 116
              |screenCoordX| 121 |perpendicular| 126 |parallel| 132 |latex| 138
              |inBounds?| 143 |hash| 150 |extendedCoords| 155 |distanceSquared|
              160 |distance| 166 |dimension| 172 |colinearity| 177 |coerce| 183
              |Pnan?| 198 = 203 - 209 + 215 * 221)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SPointCategory&| |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SPointCategory|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 45))
                        (|makeByteWordVec2| 50
                                            '(2 7 14 0 0 15 1 7 0 0 17 2 7 14 0
                                              0 25 2 33 0 7 7 34 1 33 7 0 36 1
                                              33 7 0 37 1 7 45 0 46 1 45 0 47
                                              48 2 0 14 0 0 44 1 0 0 0 18 3 0 0
                                              7 7 7 11 2 0 0 7 7 10 3 0 0 7 7 7
                                              9 2 0 0 7 7 8 3 0 0 50 50 50 1 2
                                              0 0 50 50 1 3 0 0 50 50 50 1 2 0
                                              0 50 50 1 1 0 30 0 31 1 0 7 0 29
                                              1 0 7 0 28 1 0 7 0 27 2 0 0 0 0
                                              21 2 0 7 0 0 20 1 0 41 0 42 3 0
                                              14 0 0 0 26 1 0 39 0 40 1 0 30 0
                                              32 2 0 7 0 0 19 2 0 7 0 0 1 1 0
                                              12 0 13 2 0 7 0 0 1 1 0 33 0 35 1
                                              0 0 33 38 1 0 45 0 49 1 0 14 0 16
                                              2 0 14 0 0 43 2 0 0 0 0 24 2 0 0
                                              0 0 23 2 0 0 7 0 22)))))
           '|lookupComplete|)) 

(MAKEPROP '|SArgand| 'NILADIC T) 
