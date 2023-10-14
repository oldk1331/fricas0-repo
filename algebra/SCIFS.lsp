
(/VERSIONCHECK 2) 

(PUT '|SCIFS;indexes;$L;1| '|SPADreplace| 'QCAR) 

(DEFUN |SCIFS;indexes;$L;1| (|me| $) (QCAR |me|)) 

(PUT '|SCIFS;pointList;$L;2| '|SPADreplace| 'QCDR) 

(DEFUN |SCIFS;pointList;$L;2| (|me| $) (QCDR |me|)) 

(DEFUN |SCIFS;meshIndex| (|i| |j| |c| $)
  (PROG (#1=#:G113)
    (RETURN
     (PROG1 (LETT #1# (+ (* |j| |c|) |i|) |SCIFS;meshIndex|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |SCIFS;smesh;LB$;4| (|ptin| |clos| $)
  (PROG (|j| |in2| |thisLine| |i| |pt2| #1=#:G124 |p| #2=#:G123 |lpt|
         |colLength| |rowLength|)
    (RETURN
     (SEQ (LETT |pt2| NIL . #3=(|SCIFS;smesh;LB$;4|)) (LETT |in2| NIL . #3#)
          (LETT |rowLength| (LENGTH |ptin|) . #3#)
          (LETT |colLength| (LENGTH (|SPADfirst| |ptin|)) . #3#)
          (LETT |j| 0 . #3#)
          (SEQ (LETT |lpt| NIL . #3#) (LETT #2# |ptin| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |lpt| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |i| 0 . #3#)
                    (SEQ (LETT |p| NIL . #3#) (LETT #1# |lpt| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |pt2| (SPADCALL |pt2| |p| (QREFELT $ 12))
                                . #3#)
                          (COND
                           ((SPADCALL |i| 0 (QREFELT $ 15))
                            (COND
                             ((SPADCALL |j| 0 (QREFELT $ 15))
                              (SEQ
                               (LETT |thisLine|
                                     (LIST
                                      (|SCIFS;meshIndex| (- |i| 1) (- |j| 1)
                                       |colLength| $)
                                      (|SCIFS;meshIndex| |i| (- |j| 1)
                                       |colLength| $)
                                      (|SCIFS;meshIndex| |i| |j| |colLength| $)
                                      (|SCIFS;meshIndex| (- |i| 1) |j|
                                       |colLength| $))
                                     . #3#)
                               (EXIT
                                (LETT |in2|
                                      (SPADCALL |in2| |thisLine|
                                                (QREFELT $ 17))
                                      . #3#)))))))
                          (EXIT (LETT |i| (+ |i| 1) . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                    (COND
                     (|clos|
                      (COND
                       ((SPADCALL |j| 0 (QREFELT $ 15))
                        (SEQ
                         (LETT |thisLine|
                               (LIST
                                (|SCIFS;meshIndex| (- |i| 1) (- |j| 1)
                                 |colLength| $)
                                (|SCIFS;meshIndex| 0 (- |j| 1) |colLength| $)
                                (|SCIFS;meshIndex| 0 |j| |colLength| $)
                                (|SCIFS;meshIndex| (- |i| 1) |j| |colLength|
                                 $))
                               . #3#)
                         (EXIT
                          (LETT |in2|
                                (SPADCALL |in2| |thisLine| (QREFELT $ 17))
                                . #3#)))))))
                    (EXIT (LETT |j| (+ |j| 1) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |in2| |pt2|)))))) 

(DEFUN |SCIFS;singleFace;L$;5| (|ptin| $)
  (PROG (|in2| #1=#:G129 |i| #2=#:G128 |pt2|)
    (RETURN
     (SEQ (LETT |pt2| |ptin| . #3=(|SCIFS;singleFace;L$;5|))
          (LETT |in2|
                (LIST
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |i| 0 . #3#)
                       (LETT #1# (- (LENGTH |ptin|) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
                . #3#)
          (EXIT (CONS |in2| |pt2|)))))) 

(DEFUN |SCIFS;subdivide;2$;6| (|me| $)
  (PROG (|indexSize| |in2| |indexPos| |newFace| #1=#:G145 |j| #2=#:G144
         #3=#:G143 |ptIx| |pt2| |newPt| #4=#:G142 #5=#:G141 |faceIx| |i|
         #6=#:G140)
    (RETURN
     (SEQ (LETT |indexSize| (LENGTH (QCDR |me|)) . #7=(|SCIFS;subdivide;2$;6|))
          (LETT |pt2|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |i| 1 . #7#) G190
                      (COND ((|greater_SI| |i| |indexSize|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL (QCDR |me|) |i| (QREFELT $ 22))
                                    #6#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |in2| NIL . #7#)
          (SEQ (LETT |faceIx| NIL . #7#) (LETT #5# (QCAR |me|) . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |faceIx| (CAR #5#) . #7#) NIL))
                 (GO G191)))
               (SEQ (LETT |newPt| (SPADCALL 0 0 0 (QREFELT $ 23)) . #7#)
                    (SEQ (LETT |ptIx| NIL . #7#) (LETT #4# |faceIx| . #7#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |ptIx| (CAR #4#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |newPt|
                                 (SPADCALL |newPt|
                                           (SPADCALL |pt2| (+ |ptIx| 1)
                                                     (QREFELT $ 22))
                                           (QREFELT $ 24))
                                 . #7#)))
                         (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                    (LETT |newPt|
                          (SPADCALL
                           (|div_DF_I| 1.0 (SPADCALL |faceIx| (QREFELT $ 25)))
                           |newPt| (QREFELT $ 27))
                          . #7#)
                    (LETT |pt2| (SPADCALL |pt2| |newPt| (QREFELT $ 12)) . #7#)
                    (LETT |indexPos| 1 . #7#)
                    (SEQ (LETT |ptIx| NIL . #7#) (LETT #3# |faceIx| . #7#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |ptIx| (CAR #3#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |newFace|
                                (PROGN
                                 (LETT #2# NIL . #7#)
                                 (SEQ (LETT |j| 1 . #7#)
                                      (LETT #1#
                                            (SPADCALL |faceIx| (QREFELT $ 25))
                                            . #7#)
                                      G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |faceIx| |j|
                                                         (QREFELT $ 28))
                                               #2#)
                                              . #7#)))
                                      (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                      G191 (EXIT (NREVERSE #2#))))
                                . #7#)
                          (SPADCALL |newFace| |indexPos| |indexSize|
                                    (QREFELT $ 29))
                          (LETT |indexPos| (+ |indexPos| 1) . #7#)
                          (EXIT
                           (LETT |in2|
                                 (SPADCALL |in2| |newFace| (QREFELT $ 17))
                                 . #7#)))
                         (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |indexSize| (+ |indexSize| 1) . #7#)))
               (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |in2| |pt2|)))))) 

(DEFUN |SCIFS;sierpinskiDivide;$Nni$;7| (|me| |level| $)
  (PROG (#1=#:G157 #2=#:G159 |indexSize| |in2| |index2| |index1| |newFace|
         |ix4| |ix3| #3=#:G163 |offset| #4=#:G150 |pt2| |newPt| |ix2| |ix1|
         #5=#:G162 #6=#:G161 |faceIx| |i| #7=#:G160)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |indexSize| (LENGTH (QCDR |me|))
              . #8=(|SCIFS;sierpinskiDivide;$Nni$;7|))
        (LETT |pt2|
              (PROGN
               (LETT #7# NIL . #8#)
               (SEQ (LETT |i| 1 . #8#) G190
                    (COND ((|greater_SI| |i| |indexSize|) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #7#
                            (CONS (SPADCALL (QCDR |me|) |i| (QREFELT $ 22))
                                  #7#)
                            . #8#)))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                    (EXIT (NREVERSE #7#))))
              . #8#)
        (LETT |in2| NIL . #8#)
        (SEQ (LETT |faceIx| NIL . #8#) (LETT #6# (QCAR |me|) . #8#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |faceIx| (CAR #6#) . #8#) NIL))
               (GO G191)))
             (SEQ
              (SEQ (LETT |offset| 1 . #8#)
                   (LETT #5# (SPADCALL |faceIx| (QREFELT $ 25)) . #8#) G190
                   (COND ((|greater_SI| |offset| #5#) (GO G191)))
                   (SEQ (LETT |ix1| |offset| . #8#)
                        (LETT |ix2| (+ |offset| 1) . #8#)
                        (COND
                         ((SPADCALL |ix2| (SPADCALL |faceIx| (QREFELT $ 25))
                                    (QREFELT $ 15))
                          (LETT |ix2| 1 . #8#)))
                        (LETT |newPt|
                              (SPADCALL
                               (SPADCALL |pt2|
                                         (+
                                          (SPADCALL |faceIx| |ix1|
                                                    (QREFELT $ 28))
                                          1)
                                         (QREFELT $ 22))
                               (SPADCALL |pt2|
                                         (+
                                          (SPADCALL |faceIx| |ix2|
                                                    (QREFELT $ 28))
                                          1)
                                         (QREFELT $ 22))
                               (QREFELT $ 24))
                              . #8#)
                        (LETT |newPt|
                              (SPADCALL
                               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 33))
                                         (QREFELT $ 34))
                               |newPt| (QREFELT $ 27))
                              . #8#)
                        (EXIT
                         (LETT |pt2| (SPADCALL |pt2| |newPt| (QREFELT $ 12))
                               . #8#)))
                   (LETT |offset| (|inc_SI| |offset|) . #8#) (GO G190) G191
                   (EXIT NIL))
              (LETT |index1|
                    (PROG1
                        (LETT #4# (- (SPADCALL |faceIx| (QREFELT $ 25)) 1)
                              . #8#)
                      (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                    . #8#)
              (LETT |index2| 0 . #8#)
              (SEQ (LETT |offset| 1 . #8#)
                   (LETT #3# (SPADCALL |faceIx| (QREFELT $ 25)) . #8#) G190
                   (COND ((|greater_SI| |offset| #3#) (GO G191)))
                   (SEQ (LETT |ix3| (+ |indexSize| |index1|) . #8#)
                        (LETT |ix4| (+ |indexSize| |index2|) . #8#)
                        (LETT |newFace|
                              (LIST (SPADCALL |faceIx| |offset| (QREFELT $ 28))
                                    |ix3| |ix4|)
                              . #8#)
                        (LETT |index1| (+ |index1| 1) . #8#)
                        (COND
                         ((EQL |index1| (SPADCALL |faceIx| (QREFELT $ 25)))
                          (LETT |index1| 0 . #8#)))
                        (LETT |index2| (+ |index2| 1) . #8#)
                        (COND
                         ((EQL |index2| (SPADCALL |faceIx| (QREFELT $ 25)))
                          (LETT |index2| 0 . #8#)))
                        (EXIT
                         (LETT |in2| (SPADCALL |in2| |newFace| (QREFELT $ 17))
                               . #8#)))
                   (LETT |offset| (|inc_SI| |offset|) . #8#) (GO G190) G191
                   (EXIT NIL))
              (EXIT
               (LETT |indexSize|
                     (+ |indexSize| (SPADCALL |faceIx| (QREFELT $ 25)))
                     . #8#)))
             (LETT #6# (CDR #6#) . #8#) (GO G190) G191 (EXIT NIL))
        (COND
         ((< |level| 1) (PROGN (LETT #2# (CONS |in2| |pt2|) . #8#) (GO #2#))))
        (EXIT
         (SPADCALL (CONS |in2| |pt2|)
                   (PROG1 (LETT #1# (- |level| 1) . #8#)
                     (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                   (QREFELT $ 35)))))
      #2# (EXIT #2#))))) 

(DEFUN |SCIFS;listBranches| (|functions| $)
  (PROG (|outList| #1=#:G168 |curve|)
    (RETURN
     (SEQ (LETT |outList| NIL . #2=(|SCIFS;listBranches|))
          (SEQ (LETT |curve| NIL . #2#) (LETT #1# |functions| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |curve| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |outList| (CONS (QVELT |curve| 3) |outList|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |outList|))))) 

(DEFUN |SCIFS;orthog| (|x| |y| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |x| |y| (QREFELT $ 42)) (QREFELT $ 37)
                  (QREFELT $ 43))
        (LETT |y| (QREFELT $ 41) . #1=(|SCIFS;orthog|))))
      (COND
       ((SPADCALL (SPADCALL |x| |y| (QREFELT $ 42)) (QREFELT $ 37)
                  (QREFELT $ 43))
        (LETT |y|
              (COND
               ((|less_DF| (SPADCALL |x| (QREFELT $ 38) (QREFELT $ 42))
                           (QREFELT $ 37))
                (QREFELT $ 38))
               ('T (QREFELT $ 39)))
              . #1#)))
      (LETT |a|
            (|minus_DF|
             (|div_DF| (SPADCALL |x| |y| (QREFELT $ 44))
                       (SPADCALL |x| |x| (QREFELT $ 44))))
            . #1#)
      (EXIT
       (SETELT $ 41
               (SPADCALL (SPADCALL |a| |x| (QREFELT $ 27)) |y|
                         (QREFELT $ 24)))))))) 

(DEFUN |SCIFS;poTriad| (|pl| |po| |pr| $)
  (PROG (|n| |pol| |t|)
    (RETURN
     (SEQ
      (LETT |t| (SPADCALL (SPADCALL |pr| |pl| (QREFELT $ 45)) (QREFELT $ 46))
            . #1=(|SCIFS;poTriad|))
      (LETT |pol| (SPADCALL |pl| |po| (QREFELT $ 45)) . #1#)
      (LETT |n| (SPADCALL (|SCIFS;orthog| |t| |pol| $) (QREFELT $ 46)) . #1#)
      (EXIT (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 47)))))))) 

(DEFUN |SCIFS;curveTriads| (|l| $)
  (PROG (|endtriad| |n| |t| |x| |begtriad| |midtriads| #1=#:G186 |pl| #2=#:G187
         |po| #3=#:G188 |pr| #4=#:G185 |triad| |b| |k|)
    (RETURN
     (SEQ (LETT |k| (LENGTH |l|) . #5=(|SCIFS;curveTriads|))
          (EXIT
           (COND
            ((< |k| 2) (|error| "Need at least 2 points to specify a curve"))
            (#6='T
             (SEQ (SETELT $ 41 (QREFELT $ 40))
                  (EXIT
                   (COND
                    ((EQL |k| 2)
                     (SEQ
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| (QREFELT $ 48))
                                       (|SPADfirst| |l|) (QREFELT $ 45))
                             (QREFELT $ 46))
                            . #5#)
                      (LETT |n|
                            (SPADCALL
                             (SPADCALL |t| (QREFELT $ 38) (QREFELT $ 45))
                             (QREFELT $ 46))
                            . #5#)
                      (LETT |b| (SPADCALL |t| |n| (QREFELT $ 47)) . #5#)
                      (LETT |triad| (VECTOR |t| |n| |b|) . #5#)
                      (EXIT (LIST |triad| |triad|))))
                    (#6#
                     (SEQ
                      (LETT |midtriads|
                            (PROGN
                             (LETT #4# NIL . #5#)
                             (SEQ (LETT |pr| NIL . #5#)
                                  (LETT #3# (CDR (CDR |l|)) . #5#)
                                  (LETT |po| NIL . #5#)
                                  (LETT #2# (CDR |l|) . #5#)
                                  (LETT |pl| NIL . #5#) (LETT #1# |l| . #5#)
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |pl| (CAR #1#) . #5#) NIL)
                                        (ATOM #2#)
                                        (PROGN (LETT |po| (CAR #2#) . #5#) NIL)
                                        (ATOM #3#)
                                        (PROGN
                                         (LETT |pr| (CAR #3#) . #5#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (|SCIFS;poTriad| |pl| |po| |pr| $)
                                           #4#)
                                          . #5#)))
                                  (LETT #1#
                                        (PROG1 (CDR #1#)
                                          (LETT #2#
                                                (PROG1 (CDR #2#)
                                                  (LETT #3# (CDR #3#) . #5#))
                                                . #5#))
                                        . #5#)
                                  (GO G190) G191 (EXIT (NREVERSE #4#))))
                            . #5#)
                      (LETT |x| (|SPADfirst| |midtriads|) . #5#)
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| (QREFELT $ 48))
                                       (|SPADfirst| |l|) (QREFELT $ 45))
                             (QREFELT $ 46))
                            . #5#)
                      (LETT |n|
                            (SPADCALL (|SCIFS;orthog| |t| (QVELT |x| 1) $)
                                      (QREFELT $ 46))
                            . #5#)
                      (LETT |begtriad|
                            (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 47)))
                            . #5#)
                      (LETT |x| (SPADCALL |midtriads| (QREFELT $ 51)) . #5#)
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL (SPADCALL |l| |k| (QREFELT $ 22))
                                       (SPADCALL |l| (- |k| 1) (QREFELT $ 22))
                                       (QREFELT $ 45))
                             (QREFELT $ 46))
                            . #5#)
                      (LETT |n|
                            (SPADCALL (|SCIFS;orthog| |t| (QVELT |x| 1) $)
                                      (QREFELT $ 46))
                            . #5#)
                      (LETT |endtriad|
                            (VECTOR |t| |n| (SPADCALL |t| |n| (QREFELT $ 47)))
                            . #5#)
                      (EXIT
                       (CONS |begtriad|
                             (SPADCALL |midtriads| |endtriad|
                                       (QREFELT $ 52)))))))))))))))) 

(DEFUN |SCIFS;cosSinInfo| (|n| $)
  (PROG (|ans| |angle| #1=#:G193 |i| |theta|)
    (RETURN
     (SEQ (LETT |ans| NIL . #2=(|SCIFS;cosSinInfo|))
          (LETT |theta|
                (|div_DF_I|
                 (SPADCALL 2 (FLOAT PI MOST-POSITIVE-DOUBLE-FLOAT)
                           (QREFELT $ 53))
                 |n|)
                . #2#)
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |angle| (SPADCALL |i| |theta| (QREFELT $ 54)) . #2#)
                    (EXIT
                     (LETT |ans|
                           (CONS (LIST (|cos_DF| |angle|) (|sin_DF| |angle|))
                                 |ans|)
                           . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))) 

(DEFUN |SCIFS;loopPoints| (|ctr| |pNorm| |bNorm| |rad| |cosSin| $)
  (PROG (|pt| |ans| |sin| |cos| |cossin|)
    (RETURN
     (SEQ (LETT |ans| NIL . #1=(|SCIFS;loopPoints|))
          (SEQ G190
               (COND ((NULL (COND ((NULL |cosSin|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |cossin| (|SPADfirst| |cosSin|) . #1#)
                    (LETT |cos| (|SPADfirst| |cossin|) . #1#)
                    (LETT |sin| (SPADCALL |cossin| (QREFELT $ 56)) . #1#)
                    (LETT |ans|
                          (CONS
                           (SPADCALL |ctr|
                                     (SPADCALL |rad|
                                               (SPADCALL
                                                (SPADCALL |cos| |pNorm|
                                                          (QREFELT $ 27))
                                                (SPADCALL |sin| |bNorm|
                                                          (QREFELT $ 27))
                                                (QREFELT $ 24))
                                               (QREFELT $ 27))
                                     (QREFELT $ 24))
                           |ans|)
                          . #1#)
                    (EXIT (LETT |cosSin| (CDR |cosSin|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |pt|
                (SPADCALL |ctr| (SPADCALL |rad| |pNorm| (QREFELT $ 27))
                          (QREFELT $ 24))
                . #1#)
          (EXIT (CONS |pt| (SPADCALL |ans| |pt| (QREFELT $ 12)))))))) 

(DEFUN |SCIFS;curveLoops;LDfIL;14| (|pts1| |r| |nn| $)
  (PROG (|loops| |b| |n| #1=#:G202 |pt| #2=#:G203 |triad| |cosSin| |triads|)
    (RETURN
     (SEQ
      (LETT |triads| (|SCIFS;curveTriads| |pts1| $)
            . #3=(|SCIFS;curveLoops;LDfIL;14|))
      (LETT |cosSin| (|SCIFS;cosSinInfo| |nn| $) . #3#)
      (LETT |loops| NIL . #3#)
      (SEQ (LETT |triad| NIL . #3#) (LETT #2# |triads| . #3#)
           (LETT |pt| NIL . #3#) (LETT #1# |pts1| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |pt| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |triad| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ (LETT |n| (QVELT |triad| 1) . #3#)
                (LETT |b| (QVELT |triad| 2) . #3#)
                (EXIT
                 (LETT |loops|
                       (CONS (|SCIFS;loopPoints| |pt| |n| |b| |r| |cosSin| $)
                             |loops|)
                       . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (NREVERSE |loops|)))))) 

(DEFUN |SCIFS;stube;LDfI$;15| (|functions| |r| |n| $)
  (PROG (|loops| #1=#:G211 |bran| |brans|)
    (RETURN
     (SEQ
      (COND ((< |n| 3) (|error| "tube: n should be at least 3"))
            ('T
             (SEQ
              (LETT |brans| (|SCIFS;listBranches| |functions| $)
                    . #2=(|SCIFS;stube;LDfI$;15|))
              (LETT |loops| NIL . #2#)
              (SEQ (LETT |bran| NIL . #2#) (LETT #1# |brans| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |bran| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |loops|
                           (SPADCALL |loops|
                                     (SPADCALL |bran| |r| |n| (QREFELT $ 57))
                                     (QREFELT $ 58))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |loops| 'T (QREFELT $ 19)))))))))) 

(DEFUN |SCIFS;coerce;$Of;16| (|me| $)
  (PROG (|res| |r| #1=#:G222 |pIx| #2=#:G221 |faceIx| #3=#:G220 |p|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL (QREFELT $ 64)) . #4=(|SCIFS;coerce;$Of;16|))
          (SEQ (LETT |p| NIL . #4#) (LETT #3# (QCDR |me|) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |r|
                      (SPADCALL |r| (SPADCALL |p| (QREFELT $ 65))
                                (QREFELT $ 66))
                      . #4#)
                (EXIT (LETT |r| (SPADCALL |r| " " (QREFELT $ 66)) . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |res| (LIST |r|) . #4#)
          (SEQ (LETT |faceIx| NIL . #4#) (LETT #2# (QCAR |me|) . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |faceIx| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |r| (SPADCALL (QREFELT $ 64)) . #4#)
                    (SEQ (LETT |pIx| NIL . #4#) (LETT #1# |faceIx| . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |pIx| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |pIx| (QREFELT $ 67))
                                          (QREFELT $ 66))
                                . #4#)
                          (EXIT
                           (LETT |r| (SPADCALL |r| " " (QREFELT $ 66)) . #4#)))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res| (SPADCALL |res| |r| (QREFELT $ 69)) . #4#)))
               (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 71))))))) 

(DECLAIM (NOTINLINE |SceneIFS;|)) 

(DEFUN |SceneIFS| (#1=#:G223)
  (PROG ()
    (RETURN
     (PROG (#2=#:G224)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SceneIFS|)
                                           '|domainEqualList|)
                . #3=(|SceneIFS|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|SceneIFS;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SceneIFS|))))))))))) 

(DEFUN |SceneIFS;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SceneIFS|))
      (LETT |dv$| (LIST '|SceneIFS| DV$1) . #1#)
      (LETT $ (GETREFV 73) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SceneIFS| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record| (|:| |inx| (|List| (|List| (|NonNegativeInteger|))))
                          (|:| |pts| (|List| |#1|))))
      (QSETREFV $ 37
                (SPADCALL (SPADCALL 995 -3 10 (QREFELT $ 33)) (QREFELT $ 36)))
      (QSETREFV $ 38 (SPADCALL 1 0 0 (QREFELT $ 23)))
      (QSETREFV $ 39 (SPADCALL 0 1 0 (QREFELT $ 23)))
      (QSETREFV $ 40 (SPADCALL 1 1 0 (QREFELT $ 23)))
      (QSETREFV $ 41 (QREFELT $ 40))
      $)))) 

(MAKEPROP '|SceneIFS| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 16)
              |SCIFS;indexes;$L;1| (|List| 6) |SCIFS;pointList;$L;2|
              (0 . |concat|) (|Boolean|) (|NonNegativeInteger|) (6 . >)
              (|List| 14) (12 . |concat|) (|List| 10) |SCIFS;smesh;LB$;4|
              |SCIFS;singleFace;L$;5| (|Integer|) (18 . |elt|) (24 . |sipnt|)
              (31 . +) (37 . |#|) (|DoubleFloat|) (42 . *) (48 . |elt|)
              (54 . |setelt|) |SCIFS;subdivide;2$;6| (|PositiveInteger|)
              (|Float|) (61 . |float|) (68 . |coerce|)
              |SCIFS;sierpinskiDivide;$Nni$;7| (73 . |convert|) 'LINMAX 'XHAT
              'YHAT 'PREV0 'PREV (78 . |colinearity|) (84 . >)
              (90 . |parallel|) (96 . -) (102 . |unitVector|)
              (107 . |perpendicular|) (113 . |second|)
              (|Record| (|:| |tang| 6) (|:| |norm| 6) (|:| |bin| 6))
              (|List| 49) (118 . |last|) (123 . |concat|) (129 . *) (135 . *)
              (|List| 26) (141 . |second|) |SCIFS;curveLoops;LDfIL;14|
              (146 . |concat|) (|Mapping| 6 26)
              (|Record| (|:| |source| 59)
                        (|:| |ranges| (|List| (|Segment| 26))) (|:| |knots| 55)
                        (|:| |points| 10))
              (|List| 60) |SCIFS;stube;LDfI$;15| (|OutputForm|) (152 . |empty|)
              (156 . |coerce|) (161 . |hconcat|) (167 . |coerce|) (|List| 63)
              (172 . |concat|) (|List| $) (178 . |vconcat|)
              |SCIFS;coerce;$Of;16|)
           '#(|subdivide| 183 |stube| 188 |smesh| 195 |singleFace| 201
              |sierpinskiDivide| 206 |pointList| 212 |indexes| 217 |curveLoops|
              222 |coerce| 229)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(2 10 0 0 6 12 2 14 13 0 0 15
                                                   2 8 0 0 16 17 2 10 6 0 21 22
                                                   3 6 0 21 21 21 23 2 6 0 0 0
                                                   24 1 16 14 0 25 2 6 0 26 0
                                                   27 2 16 14 0 21 28 3 16 14 0
                                                   21 14 29 3 32 0 21 21 31 33
                                                   1 32 26 0 34 1 32 26 0 36 2
                                                   6 26 0 0 42 2 26 13 0 0 43 2
                                                   6 26 0 0 44 2 6 0 0 0 45 1 6
                                                   0 0 46 2 6 0 0 0 47 1 10 6 0
                                                   48 1 50 49 0 51 2 50 0 0 49
                                                   52 2 26 0 31 0 53 2 26 0 14
                                                   0 54 1 55 26 0 56 2 18 0 0 0
                                                   58 0 63 0 64 1 6 63 0 65 2
                                                   63 0 0 0 66 1 14 63 0 67 2
                                                   68 0 0 63 69 1 63 0 70 71 1
                                                   0 0 0 30 3 0 0 61 26 21 62 2
                                                   0 0 18 13 19 1 0 0 10 20 2 0
                                                   0 0 14 35 1 0 10 0 11 1 0 8
                                                   0 9 3 0 18 10 26 21 57 1 0
                                                   63 0 72)))))
           '|lookupComplete|)) 
