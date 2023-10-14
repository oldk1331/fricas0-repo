
(/VERSIONCHECK 2) 

(DEFUN |DGRPH;directedGraph;L$;1| (|objs| $)
  (PROG (|obs| |o| #1=#:G155 |ob| #2=#:G156 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;directedGraph;L$;1|))
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#)
               (LETT |ob| NIL . #3#) (LETT #1# |objs| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ob| (CAR #1#) . #3#) NIL)
                     (|greater_SI| |obn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #3#)
                (EXIT (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| NIL)))))) 

(PUT '|DGRPH;directedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(DEFUN |DGRPH;directedGraph;L$;2| (|ob| $) (CONS |ob| NIL)) 

(PUT '|DGRPH;directedGraph;LL$;3| '|SPADreplace| 'CONS) 

(DEFUN |DGRPH;directedGraph;LL$;3| (|ob| |ar| $) (CONS |ob| |ar|)) 

(DEFUN |DGRPH;directedGraph;LL$;4| (|objs| |am| $)
  (PROG (|ar| |a| #1=#:G179 |j| #2=#:G178 |i| |obs| |o| #3=#:G176 |ob|
         #4=#:G177 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #5=(|DGRPH;directedGraph;LL$;4|))
          (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
               (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                     (|greater_SI| |obn| #4#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #5#)
                (EXIT (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)))
               (LETT #3# (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (LETT |ar| NIL . #5#)
          (SEQ (LETT |i| 1 . #5#) (LETT #2# (LENGTH |am|) . #5#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #5#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |am| |i| (QREFELT $ 23))
                                      (QREFELT $ 24))
                            . #5#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |am| |i| (QREFELT $ 23)) |j|
                                     (QREFELT $ 25))
                           1)
                          (SEQ (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #5#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 26))
                                      . #5#)))))))
                      (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ar|)))))) 

(DEFUN |DGRPH;directedGraph;L$;5| (|perms| $)
  (PROG (|ars| |a| #1=#:G315 |arrNum| |verts| |o| #2=#:G313 |vert| #3=#:G314
         |i| #4=#:G290 #5=#:G289 |pout| |pin| #6=#:G312 |pt| |preim| |im| |lr|
         #7=#:G310 |perm| #8=#:G311 |pi| |tab| #9=#:G309 #10=#:G308 #11=#:G307
         |b| #12=#:G306 |obs| #13=#:G305 |v| #14=#:G303 #15=#:G304 |px|)
    (RETURN
     (SEQ (LETT |obs| NIL . #16=(|DGRPH;directedGraph;L$;5|))
          (SEQ (LETT |px| 1 . #16#) (LETT #15# (LENGTH |perms|) . #16#)
               (LETT |perm| NIL . #16#) (LETT #14# |perms| . #16#) G190
               (COND
                ((OR (ATOM #14#) (PROGN (LETT |perm| (CAR #14#) . #16#) NIL)
                     (|greater_SI| |px| #15#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #16#)
                    (LETT |im| (QCDR |lr|) . #16#)
                    (EXIT
                     (COND ((EQL |px| 1) (LETT |obs| |im| . #16#))
                           ('T
                            (SEQ (LETT |v| NIL . #16#) (LETT #13# |im| . #16#)
                                 G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN
                                        (LETT |v| (CAR #13#) . #16#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((< (SPADCALL |v| |obs| (QREFELT $ 32)) 1)
                                     (LETT |obs|
                                           (SPADCALL |obs| |v| (QREFELT $ 33))
                                           . #16#)))))
                                 (LETT #13# (CDR #13#) . #16#) (GO G190) G191
                                 (EXIT NIL))))))
               (LETT #14# (PROG1 (CDR #14#) (LETT |px| (|inc_SI| |px|) . #16#))
                     . #16#)
               (GO G190) G191 (EXIT NIL))
          (LETT |tab|
                (PROGN
                 (LETT #12# NIL . #16#)
                 (SEQ (LETT |b| 1 . #16#) (LETT #11# (LENGTH |obs|) . #16#)
                      G190 (COND ((|greater_SI| |b| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (PROGN
                                (LETT #10# NIL . #16#)
                                (SEQ (LETT |a| 1 . #16#)
                                     (LETT #9# (LENGTH |perms|) . #16#) G190
                                     (COND ((|greater_SI| |a| #9#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10# (CONS |b| #10#) . #16#)))
                                     (LETT |a| (|inc_SI| |a|) . #16#) (GO G190)
                                     G191 (EXIT (NREVERSE #10#))))
                               #12#)
                              . #16#)))
                      (LETT |b| (|inc_SI| |b|) . #16#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                . #16#)
          (SEQ (LETT |pi| 1 . #16#) (LETT #8# (LENGTH |perms|) . #16#)
               (LETT |perm| NIL . #16#) (LETT #7# |perms| . #16#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |perm| (CAR #7#) . #16#) NIL)
                     (|greater_SI| |pi| #8#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #16#)
                    (LETT |im| (QCDR |lr|) . #16#)
                    (LETT |preim| (QCAR |lr|) . #16#)
                    (EXIT
                     (SEQ (LETT |pt| 1 . #16#) (LETT #6# (LENGTH |im|) . #16#)
                          G190 (COND ((|greater_SI| |pt| #6#) (GO G191)))
                          (SEQ
                           (LETT |pin|
                                 (SPADCALL (SPADCALL |im| |pt| (QREFELT $ 34))
                                           |obs| (QREFELT $ 32))
                                 . #16#)
                           (LETT |pout|
                                 (SPADCALL
                                  (SPADCALL |preim| |pt| (QREFELT $ 34)) |obs|
                                  (QREFELT $ 32))
                                 . #16#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL |tab|
                                       (PROG1 (LETT #5# |pin| . #16#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 23))
                             |pi|
                             (PROG1 (LETT #4# |pout| . #16#)
                               (|check_subtype| (>= #4# 0)
                                                '(|NonNegativeInteger|) #4#))
                             (QREFELT $ 35))))
                          (LETT |pt| (|inc_SI| |pt|) . #16#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #7# (PROG1 (CDR #7#) (LETT |pi| (|inc_SI| |pi|) . #16#))
                     . #16#)
               (GO G190) G191 (EXIT NIL))
          (LETT |verts| NIL . #16#) (LETT |ars| NIL . #16#)
          (SEQ (LETT |i| 1 . #16#) (LETT #3# (LENGTH |obs|) . #16#)
               (LETT |vert| NIL . #16#) (LETT #2# |obs| . #16#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |vert| (CAR #2#) . #16#) NIL)
                     (|greater_SI| |i| #3#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |vert|
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 9))
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 10)))
                      . #16#)
                (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 13)) . #16#)
                (EXIT
                 (SEQ (LETT |arrNum| NIL . #16#)
                      (LETT #1# (SPADCALL |tab| |i| (QREFELT $ 23)) . #16#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |arrNum| (CAR #1#) . #16#) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |a| (VECTOR "a" 0 |i| |arrNum| 0 0 NIL) . #16#)
                       (EXIT
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26))
                              . #16#)))
                      (LETT #1# (CDR #1#) . #16#) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #16#))
                     . #16#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |verts| |ars|)))))) 

(DEFUN |DGRPH;addObject!;$S$;6| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|DGRPH;addObject!;$S$;6|))
          (LETT |obj| (VECTOR |n| 0 0) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 39))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 13)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |DGRPH;addObject!;$R$;7| (|s| |n| $)
  (PROG (|obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) |DGRPH;addObject!;$R$;7|)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 39))
            (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 13)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |DGRPH;addArrow!;$S2Nni$;8| (|s| |nm| |n1| |n2| $)
  (PROG (#1=#:G329 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|DGRPH;addArrow!;$S2Nni$;8|))
            (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 42))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 26)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |DGRPH;addArrow!;$S2NniL$;9| (|s| |nm| |n1| |n2| |mp| $)
  (PROG (#1=#:G335 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|DGRPH;addArrow!;$S2NniL$;9|))
            (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 42))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 26)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(PUT '|DGRPH;getVertices;$L;10| '|SPADreplace| 'QCAR) 

(DEFUN |DGRPH;getVertices;$L;10| (|s| $) (QCAR |s|)) 

(PUT '|DGRPH;getArrows;$L;11| '|SPADreplace| 'QCDR) 

(DEFUN |DGRPH;getArrows;$L;11| (|s| $) (QCDR |s|)) 

(DEFUN |DGRPH;flatten;Dg$;12| (|n| $)
  (PROG (|a| |arr| |toOb3| |fromOb3| #1=#:G365 |endi| #2=#:G366 |starti| |map3|
         |yOffset3| |xOffset3| |arrType3| |name3| #3=#:G364 |oa3| |outerArrows|
         |map2| |yOffset2| |xOffset2| |toOb2| |fromOb2| |arrType2| |name2|
         #4=#:G363 |a3| #5=#:G361 |a2| #6=#:G362 |a2n| |iv| |offset| |offsets|
         |innerArrows| |ina| |innerValues| |obs2| |ob2| |py| |px| #7=#:G360
         |ob| |obs| |v3| #8=#:G359 |v2| |v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |n| (QREFELT $ 51)) . #9=(|DGRPH;flatten;Dg$;12|))
      (LETT |innerValues| NIL . #9#) (LETT |offset| 0 . #9#)
      (LETT |offsets| NIL . #9#) (LETT |innerArrows| NIL . #9#)
      (SEQ (LETT |v2| NIL . #9#) (LETT #8# |v| . #9#) G190
           (COND
            ((OR (ATOM #8#) (PROGN (LETT |v2| (CAR #8#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |v3| (QVELT |v2| 0) . #9#)
                (LETT |obs| (SPADCALL |v3| (QREFELT $ 46)) . #9#)
                (LETT |obs2| NIL . #9#)
                (SEQ (LETT |ob| NIL . #9#) (LETT #7# |obs| . #9#) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |ob| (CAR #7#) . #9#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |px|
                            (+ (QVELT |ob| 1)
                               (SPADCALL 4 (QVELT |v2| 1) (QREFELT $ 53)))
                            . #9#)
                      (LETT |py|
                            (+ (QVELT |ob| 2)
                               (SPADCALL 4 (QVELT |v2| 2) (QREFELT $ 53)))
                            . #9#)
                      (LETT |ob2| (VECTOR (QVELT |ob| 0) |px| |py|) . #9#)
                      (EXIT
                       (LETT |obs2| (SPADCALL |obs2| |ob2| (QREFELT $ 13))
                             . #9#)))
                     (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
                (LETT |innerValues|
                      (SPADCALL |innerValues| |obs2| (QREFELT $ 54)) . #9#)
                (LETT |ina| (SPADCALL |v3| (QREFELT $ 47)) . #9#)
                (LETT |innerArrows|
                      (SPADCALL |innerArrows| |ina| (QREFELT $ 56)) . #9#)
                (LETT |offsets| (SPADCALL |offsets| |offset| (QREFELT $ 57))
                      . #9#)
                (EXIT (LETT |offset| (+ |offset| (LENGTH |obs|)) . #9#)))
           (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
      (LETT |iv| |innerValues| . #9#) (LETT |a| NIL . #9#)
      (SEQ (LETT |a2n| 1 . #9#) (LETT #6# (LENGTH |innerArrows|) . #9#)
           (LETT |a2| NIL . #9#) (LETT #5# |innerArrows| . #9#) G190
           (COND
            ((OR (ATOM #5#) (PROGN (LETT |a2| (CAR #5#) . #9#) NIL)
                 (|greater_SI| |a2n| #6#))
             (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |a3| NIL . #9#) (LETT #4# |a2| . #9#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |a3| (CAR #4#) . #9#) NIL))
                    (GO G191)))
                  (SEQ (LETT |name2| (QVELT |a3| 0) . #9#)
                       (LETT |arrType2| (QVELT |a3| 1) . #9#)
                       (LETT |fromOb2|
                             (+ (QVELT |a3| 2)
                                (SPADCALL |offsets| |a2n| (QREFELT $ 25)))
                             . #9#)
                       (LETT |toOb2|
                             (+ (QVELT |a3| 3)
                                (SPADCALL |offsets| |a2n| (QREFELT $ 25)))
                             . #9#)
                       (LETT |xOffset2| (QVELT |a3| 4) . #9#)
                       (LETT |yOffset2| (QVELT |a3| 5) . #9#)
                       (LETT |map2| (QVELT |a3| 6) . #9#)
                       (LETT |arr|
                             (VECTOR |name2| |arrType2| |fromOb2| |toOb2|
                                     |xOffset2| |yOffset2| |map2|)
                             . #9#)
                       (EXIT
                        (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 26)) . #9#)))
                  (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))))
           (LETT #5# (PROG1 (CDR #5#) (LETT |a2n| (|inc_SI| |a2n|) . #9#))
                 . #9#)
           (GO G190) G191 (EXIT NIL))
      (LETT |outerArrows| (SPADCALL |n| (QREFELT $ 58)) . #9#)
      (SEQ (LETT |oa3| NIL . #9#) (LETT #3# |outerArrows| . #9#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |oa3| (CAR #3#) . #9#) NIL))
             (GO G191)))
           (SEQ (LETT |name3| (QVELT |oa3| 0) . #9#)
                (LETT |arrType3| (QVELT |oa3| 1) . #9#)
                (LETT |fromOb3|
                      (+ (SPADCALL |offsets| (QVELT |oa3| 2) (QREFELT $ 25)) 1)
                      . #9#)
                (LETT |toOb3|
                      (+ (SPADCALL |offsets| (QVELT |oa3| 3) (QREFELT $ 25)) 1)
                      . #9#)
                (LETT |xOffset3| (QVELT |oa3| 4) . #9#)
                (LETT |yOffset3| (QVELT |oa3| 5) . #9#)
                (LETT |map3| (QVELT |oa3| 6) . #9#)
                (EXIT
                 (SEQ (LETT |starti| 1 . #9#)
                      (LETT #2# (SPADCALL |map3| (QREFELT $ 24)) . #9#)
                      (LETT |endi| NIL . #9#) (LETT #1# |map3| . #9#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |endi| (CAR #1#) . #9#) NIL)
                            (|greater_SI| |starti| #2#))
                        (GO G191)))
                      (SEQ
                       (LETT |fromOb3|
                             (+
                              (SPADCALL |offsets| (QVELT |oa3| 2)
                                        (QREFELT $ 25))
                              |starti|)
                             . #9#)
                       (LETT |toOb3|
                             (+
                              (SPADCALL |offsets| (QVELT |oa3| 3)
                                        (QREFELT $ 25))
                              |endi|)
                             . #9#)
                       (LETT |arr|
                             (VECTOR |name3| |arrType3| |fromOb3| |toOb3|
                                     |xOffset3| |yOffset3| NIL)
                             . #9#)
                       (EXIT
                        (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 26)) . #9#)))
                      (LETT #1#
                            (PROG1 (CDR #1#)
                              (LETT |starti| (|inc_SI| |starti|) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT NIL))))
           (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |iv| |a|)))))) 

(PUT '|DGRPH;initial;$;13| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |DGRPH;initial;$;13| ($) (CONS NIL NIL)) 

(DEFUN |DGRPH;terminal;S$;14| (|a| $)
  (PROG (|ar| |o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|DGRPH;terminal;S$;14|))
          (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
          (EXIT (CONS (LIST |o|) (LIST |ar|))))))) 

(DEFUN |DGRPH;cycleOpen;LS$;15| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| #1=#:G383 |ob| #2=#:G384 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;cycleOpen;LS$;15|))
          (LETT |ars| NIL . #3#) (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#)
               (LETT |ob| NIL . #3#) (LETT #1# |objs| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ob| (CAR #1#) . #3#) NIL)
                     (|greater_SI| |obn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #3#)
                (LETT |next| (+ |obn| 1) . #3#)
                (COND
                 ((EQL (- |next| 1) (LENGTH |objs|))
                  (LETT |next| |obn| . #3#)))
                (EXIT
                 (COND
                  ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 63))
                   (SEQ
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |next| 0 0 NIL)
                          . #3#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #3#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;cycleClosed;LS$;16| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| #1=#:G394 |ob| #2=#:G395 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;cycleClosed;LS$;16|))
          (LETT |ars| NIL . #3#) (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#)
               (LETT |ob| NIL . #3#) (LETT #1# |objs| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ob| (CAR #1#) . #3#) NIL)
                     (|greater_SI| |obn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #3#)
                (LETT |next| (+ |obn| 1) . #3#)
                (COND
                 ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| 1 . #3#)))
                (EXIT
                 (COND
                  ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 63))
                   (SEQ
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |next| 0 0 NIL)
                          . #3#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #3#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;unit;LS$;17| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |obs| |o| #1=#:G402 |ob| #2=#:G403 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;unit;LS$;17|)) (LETT |ars| NIL . #3#)
          (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#)
               (LETT |ob| NIL . #3#) (LETT #1# |objs| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ob| (CAR #1#) . #3#) NIL)
                     (|greater_SI| |obn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #3#)
                (LETT |a|
                      (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0 |obn|
                              |obn| 0 0 NIL)
                      . #3#)
                (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #3#)
                (EXIT (LETT |arn| (+ |arn| 1) . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;kgraph;LS$;18| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| #1=#:G415 |obm| |obs| |o| #2=#:G413 |ob| #3=#:G414
         |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|DGRPH;kgraph;LS$;18|)) (LETT |ars| NIL . #4#)
          (LETT |arn| 1 . #4#)
          (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#)
               (LETT |ob| NIL . #4#) (LETT #2# |objs| . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#) . #4#) NIL)
                     (|greater_SI| |obn| #3#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 10)))
                      . #4#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #4#)
                (EXIT
                 (SEQ (LETT |obm| 1 . #4#) (LETT #1# (LENGTH |objs|) . #4#)
                      G190 (COND ((|greater_SI| |obm| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |obn| |obm| (QREFELT $ 67))
                          (SEQ
                           (LETT |a|
                                 (VECTOR
                                  (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obm| 0 0 NIL)
                                 . #4#)
                           (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26))
                                 . #4#)
                           (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                      (LETT |obm| (|inc_SI| |obm|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;+;3$;19| (|a| |b| $)
  (PROG (|la| |lb| |arr| #1=#:G423 |ba| |bStart| |lo|)
    (RETURN
     (SEQ
      (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 54))
            . #2=(|DGRPH;+;3$;19|))
      (LETT |bStart| (LENGTH (QCAR |a|)) . #2#) (LETT |lb| NIL . #2#)
      (SEQ (LETT |ba| NIL . #2#) (LETT #1# (QCDR |b|) . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ
            (LETT |arr|
                  (VECTOR (QVELT |ba| 0) (QVELT |ba| 1)
                          (+ (QVELT |ba| 2) |bStart|)
                          (+ (QVELT |ba| 3) |bStart|) (QVELT |ba| 4)
                          (QVELT |ba| 5) NIL)
                  . #2#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 26)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 69)) . #2#)
      (EXIT (CONS |lo| |la|)))))) 

(DEFUN |DGRPH;merge;3$;20| (|a| |b| $)
  (PROG (|la| |lb| |arr| |fromI| |toI| #1=#:G443 |ba| |bStart| |bmap| #2=#:G431
         |newIndex| |mergedObjects| |i| #3=#:G442 |bob| #4=#:G441 |x|
         #5=#:G440)
    (RETURN
     (SEQ
      (LETT |bmap|
            (PROGN
             (LETT #5# NIL . #6=(|DGRPH;merge;3$;20|))
             (SEQ (LETT |x| 1 . #6#) (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                  (COND ((|greater_SI| |x| #4#) (GO G191)))
                  (SEQ (EXIT (LETT #5# (CONS |x| #5#) . #6#)))
                  (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |newIndex| (LENGTH (QCAR |a|)) . #6#)
      (LETT |mergedObjects| (QCAR |a|) . #6#)
      (SEQ (LETT |bob| NIL . #6#) (LETT #3# (QCAR |b|) . #6#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |bob| (CAR #3#) . #6#) NIL))
             (GO G191)))
           (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 71)) . #6#)
                (EXIT
                 (COND
                  ((< |i| 1)
                   (SEQ
                    (LETT |mergedObjects|
                          (SPADCALL |mergedObjects| |bob| (QREFELT $ 13))
                          . #6#)
                    (LETT |newIndex| (+ |newIndex| 1) . #6#)
                    (EXIT
                     (LETT |bmap| (SPADCALL |bmap| |newIndex| (QREFELT $ 57))
                           . #6#))))
                  ('T
                   (LETT |bmap|
                         (SPADCALL |bmap|
                                   (PROG1 (LETT #2# |i| . #6#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 57))
                         . #6#)))))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |bStart| (LENGTH (QCAR |a|)) . #6#) (LETT |lb| NIL . #6#)
      (SEQ (LETT |ba| NIL . #6#) (LETT #1# (QCDR |b|) . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (LETT |toI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|) (QREFELT $ 25))
                  . #6#)
            (LETT |fromI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|) (QREFELT $ 25))
                  . #6#)
            (LETT |arr|
                  (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                          (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                  . #6#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 26)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 69)) . #6#)
      (EXIT (CONS |mergedObjects| |la|)))))) 

(DEFUN |DGRPH;objProd| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G454 |boi| |ayi| |axi| |ai| #2=#:G453 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|DGRPH;objProd|))
          (SEQ (LETT |aoi| NIL . #3#) (LETT #2# (QCAR |a|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aoi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #3#)
                    (LETT |axi| (QVELT |aoi| 1) . #3#)
                    (LETT |ayi| (QVELT |aoi| 2) . #3#)
                    (EXIT
                     (SEQ (LETT |boi| NIL . #3#) (LETT #1# (QCAR |b|) . #3#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |boi| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ (LETT |bi| (QVELT |boi| 0) . #3#)
                               (LETT |bxi| (QVELT |boi| 1) . #3#)
                               (LETT |byi| (QVELT |boi| 2) . #3#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 73)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 74)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 73))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 74))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 76))
                                     . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 79))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |DGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G455)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |DGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |DGRPH;*;2$Dg;23| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G477 |bv| #2=#:G476 |bu| #3=#:G475 |av|
         #4=#:G474 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;*;2$Dg;23|))
          (SEQ (LETT |au| 1 . #5#) (LETT #4# (LENGTH (QCAR |a|)) . #5#) G190
               (COND ((|greater_SI| |au| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |av| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#)
                      G190 (COND ((|greater_SI| |av| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |bu| 1 . #5#)
                             (LETT #2# (LENGTH (QCAR |b|)) . #5#) G190
                             (COND ((|greater_SI| |bu| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bv| 1 . #5#)
                                    (LETT #1# (LENGTH (QCAR |b|)) . #5#) G190
                                    (COND ((|greater_SI| |bv| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 80))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 81))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 81)))
                                                  (QREFELT $ 83))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 85))))))) 

(DEFUN |DGRPH;cartesian;2$Dg;24| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G502 |bv| #2=#:G501 |bu| #3=#:G500 |av|
         #4=#:G499 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;cartesian;2$Dg;24|))
          (SEQ (LETT |au| 1 . #5#) (LETT #4# (LENGTH (QCAR |a|)) . #5#) G190
               (COND ((|greater_SI| |au| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |av| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#)
                      G190 (COND ((|greater_SI| |av| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |bu| 1 . #5#)
                             (LETT #2# (LENGTH (QCAR |b|)) . #5#) G190
                             (COND ((|greater_SI| |bu| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bv| 1 . #5#)
                                    (LETT #1# (LENGTH (QCAR |b|)) . #5#) G190
                                    (COND ((|greater_SI| |bv| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((EQL |bu| |bv|)
                                        (COND
                                         ((SPADCALL |a| |au| |av|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 80))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 83)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 83)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 81))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 83))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 80))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          80))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            81))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 83)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 83))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|DGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|DGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 26))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 80))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 83)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 83)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 81))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 83))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 85))))))) 

(DEFUN |DGRPH;closedObjProd| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G511 |boi| |ayi| |axi| |ai| #2=#:G510 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|DGRPH;closedObjProd|))
          (SEQ (LETT |aoi| NIL . #3#) (LETT #2# (QCAR |a|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aoi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #3#)
                    (LETT |axi| (QVELT |aoi| 1) . #3#)
                    (LETT |ayi| (QVELT |aoi| 2) . #3#)
                    (EXIT
                     (SEQ (LETT |boi| NIL . #3#) (LETT #1# (QCAR |b|) . #3#)
                          G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |boi| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ (LETT |bi| (QVELT |boi| 0) . #3#)
                               (LETT |bxi| (QVELT |boi| 1) . #3#)
                               (LETT |byi| (QVELT |boi| 2) . #3#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 73)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 74)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 73))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 74))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 13))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |DGRPH;closedTensor;2$M$;26| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G532 |bv| #2=#:G531 |bu| #3=#:G530 |av|
         #4=#:G529 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;closedTensor;2$M$;26|))
          (SEQ (LETT |au| 1 . #5#) (LETT #4# (LENGTH (QCAR |a|)) . #5#) G190
               (COND ((|greater_SI| |au| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |av| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#)
                      G190 (COND ((|greater_SI| |av| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |bu| 1 . #5#)
                             (LETT #2# (LENGTH (QCAR |b|)) . #5#) G190
                             (COND ((|greater_SI| |bu| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bv| 1 . #5#)
                                    (LETT #1# (LENGTH (QCAR |b|)) . #5#) G190
                                    (COND ((|greater_SI| |bv| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 80))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 81))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 81)))
                                                  (QREFELT $ 83))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 19))))))) 

(DEFUN |DGRPH;closedCartesian;2$M$;27| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G558 |bv| #2=#:G557 |bu| #3=#:G556 |av|
         #4=#:G555 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;closedCartesian;2$M$;27|))
          (SEQ (LETT |au| 1 . #5#) (LETT #4# (LENGTH (QCAR |a|)) . #5#) G190
               (COND ((|greater_SI| |au| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |av| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#)
                      G190 (COND ((|greater_SI| |av| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |bu| 1 . #5#)
                             (LETT #2# (LENGTH (QCAR |b|)) . #5#) G190
                             (COND ((|greater_SI| |bu| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bv| 1 . #5#)
                                    (LETT #1# (LENGTH (QCAR |b|)) . #5#) G190
                                    (COND ((|greater_SI| |bv| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((EQL |bu| |bv|)
                                        (COND
                                         ((SPADCALL |a| |au| |av|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 80))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 83)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 83)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 81))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 83))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 80))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          80))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            81))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 83)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            81))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 83)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 83))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|DGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|DGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 26))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 80))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 80))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          81))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 83)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          81))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 83)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 81))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 83))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 26))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 19))))))) 

(DEFUN |DGRPH;~;2$;28| (|s| $)
  (PROG (|newArrs| |newArr| #1=#:G569 |j| #2=#:G568 |i| |ars| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #3=(|DGRPH;~;2$;28|))
          (LETT |ars| (QCDR |s|) . #3#) (LETT |newArrs| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (LENGTH |obs|) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #3#) (LETT #1# (LENGTH |obs|) . #3#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 80)))
                          (SEQ
                           (LETT |newArr|
                                 (VECTOR
                                  (STRCONC (STRINGIMAGE |i|) (STRINGIMAGE |j|))
                                  0 |i| |j| 0 0 NIL)
                                 . #3#)
                           (EXIT
                            (LETT |newArrs|
                                  (SPADCALL |newArrs| |newArr| (QREFELT $ 26))
                                  . #3#)))))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |newArrs|)))))) 

(DEFUN |DGRPH;map;$LL2I$;29| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G586 |oldArrow| #2=#:G574 #3=#:G573 |i|
         #4=#:G585 |oi| |newObjs| #5=#:G584 |o| #6=#:G583)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|DGRPH;map;$LL2I$;29|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #6# (CONS (VECTOR |o| 0 0) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH (QCAR |s|)) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 25)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 92)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 92))
                                        1)
                                       |offsetX|)
                                      . #7#)
                              (|check_subtype| (>= #3# 0)
                                               '(|NonNegativeInteger|) #3#))
                            (PROG1
                                (LETT #2#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 92))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#)))
                           (QREFELT $ 93))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 25))
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 25))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 26))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |DGRPH;mapContra;$LL2I$;30| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G603 |oldArrow| #2=#:G591 #3=#:G590 |i|
         #4=#:G602 |oi| |newObjs| #5=#:G601 |o| #6=#:G600)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|DGRPH;mapContra;$LL2I$;30|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #6# (CONS (VECTOR |o| 0 0) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH (QCAR |s|)) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 25)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 92)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 92))
                                        1)
                                       |offsetX|)
                                      . #7#)
                              (|check_subtype| (>= #3# 0)
                                               '(|NonNegativeInteger|) #3#))
                            (PROG1
                                (LETT #2#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 92))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#)))
                           (QREFELT $ 93))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 25))
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 25))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 26))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |DGRPH;coerce;Pg$;31| (|pg| $)
  (SPADCALL (SPADCALL |pg| (QREFELT $ 97)) (QREFELT $ 37))) 

(DEFUN |DGRPH;coerce;L$;32| (|lst| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| #1=#:G611 |ob| #2=#:G612 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;coerce;L$;32|)) (LETT |ars| NIL . #3#)
          (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |lst|) . #3#)
               (LETT |ob| NIL . #3#) (LETT #1# |lst| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ob| (CAR #1#) . #3#) NIL)
                     (|greater_SI| |obn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |ob|
                              (SPADCALL (LENGTH |lst|) |obn| (QREFELT $ 9))
                              (SPADCALL (LENGTH |lst|) |obn| (QREFELT $ 10)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #3#)
                (LETT |next| (+ |obn| 1) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |next| (LENGTH |lst|) (QREFELT $ 63))
                   (SEQ
                    (LETT |a|
                          (VECTOR (STRCONC "a" (STRINGIMAGE |arn|)) 0 |obn|
                                  |next| 0 0 NIL)
                          . #3#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 26)) . #3#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DirectedGraph| (#1=#:G613)
  (PROG ()
    (RETURN
     (PROG (#2=#:G614)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DirectedGraph|)
                                           '|domainEqualList|)
                . #3=(|DirectedGraph|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|DirectedGraph;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|DirectedGraph|))))))))))) 

(DEFUN |DirectedGraph;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DirectedGraph|))
      (LETT |dv$| (LIST '|DirectedGraph| DV$1) . #1#)
      (LETT $ (GETREFV 110) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DirectedGraph| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record|
                 (|:| |objects|
                      (|List|
                       (|Record| (|:| |value| |#1|)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|)))))
                 (|:| |arrows|
                      (|List|
                       (|Record| (|:| |name| (|String|))
                                 (|:| |arrType| (|NonNegativeInteger|))
                                 (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))
                                 (|:| |xOffset| (|Integer|))
                                 (|:| |yOffset| (|Integer|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|))))))))
      $)))) 

(MAKEPROP '|DirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |createX|) (6 . |createY|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 11) (12 . |concat|) (|List| 6) |DGRPH;directedGraph;L$;1|
              |DGRPH;directedGraph;L$;2|
              (|Record| (|:| |name| 43) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 21) (|:| |yOffset| 21)
                        (|:| |map| 20))
              (|List| 17) |DGRPH;directedGraph;LL$;3| (|List| 8) (|Integer|)
              (|List| 20) (18 . |elt|) (24 . |#|) (29 . |elt|) (35 . |concat|)
              |DGRPH;directedGraph;LL$;4|
              (|Record| (|:| |preimage| 14) (|:| |image| 14)) (|Permutation| 6)
              (41 . |listRepresentation|) (46 . |One|) (50 . |position|)
              (56 . |concat|) (62 . |elt|) (68 . |setelt|) (|List| 29)
              |DGRPH;directedGraph;L$;5| (|Boolean|) (75 . =)
              |DGRPH;addObject!;$S$;6| |DGRPH;addObject!;$R$;7| (81 . =)
              (|String|) |DGRPH;addArrow!;$S2Nni$;8|
              |DGRPH;addArrow!;$S2NniL$;9| |DGRPH;getVertices;$L;10|
              |DGRPH;getArrows;$L;11|
              (|Record| (|:| |value| $$) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 48) (|DirectedGraph| $$) (87 . |getVertices|)
              (|PositiveInteger|) (92 . *) (98 . |concat|) (|List| 18)
              (104 . |concat|) (110 . |concat|) (116 . |getArrows|)
              (|DirectedGraph| $) |DGRPH;flatten;Dg$;12| |DGRPH;initial;$;13|
              |DGRPH;terminal;S$;14| (121 . <=) |DGRPH;cycleOpen;LS$;15|
              |DGRPH;cycleClosed;LS$;16| |DGRPH;unit;LS$;17| (127 . ~=)
              |DGRPH;kgraph;LS$;18| (133 . |concat|) |DGRPH;+;3$;19|
              (139 . |position|) |DGRPH;merge;3$;20| (145 . |diagramWidth|)
              (150 . |diagramHeight|) (|Product| 6 6) (155 . |construct|)
              (|Record| (|:| |value| 75) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 77) (161 . |concat|) (167 . |isDirectSuccessor?|)
              (174 . |arrowName|) (|List| $) (181 . |concat|)
              (|DirectedGraph| 75) (186 . |directedGraph|) |DGRPH;*;2$Dg;23|
              |DGRPH;cartesian;2$Dg;24| (|Mapping| 6 6 6)
              |DGRPH;closedTensor;2$M$;26| |DGRPH;closedCartesian;2$M$;27|
              |DGRPH;~;2$;28| (192 . |elt|) (198 . |setelt|)
              |DGRPH;map;$LL2I$;29| |DGRPH;mapContra;$LL2I$;30|
              (|PermutationGroup| 6) (205 . |coerce|) |DGRPH;coerce;Pg$;31|
              |DGRPH;coerce;L$;32| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 21) (|Matrix| 8) (|List| (|Loop|)) (|Tree| 21)
              (|List| 105) (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 210 ~ 216 |unit| 221 |terminal| 227 |subdiagramSvg| 232
              |spanningTreeNode| 240 |spanningTreeArrow| 246
              |spanningForestNode| 252 |spanningForestArrow| 257 |routeNodes|
              262 |routeArrows| 269 |outDegree| 276 |nodeToNode| 282
              |nodeToArrow| 288 |nodeFromNode| 294 |nodeFromArrow| 300 |min|
              306 |merge| 317 |max| 323 |mapContra| 334 |map| 343 |looseEquals|
              352 |loopsNodes| 358 |loopsAtNode| 363 |loopsArrows| 369 |latex|
              374 |laplacianMatrix| 379 |kgraph| 384 |isGreaterThan?| 390
              |isFunctional?| 397 |isFixPoint?| 402 |isDirected?| 408
              |isDirectSuccessor?| 412 |isAcyclic?| 419 |initial| 424
              |incidenceMatrix| 428 |inDegree| 433 |hashUpdate!| 439 |hash| 445
              |getVertices| 450 |getVertexIndex| 455 |getArrows| 461
              |getArrowIndex| 466 |flatten| 473 |distanceMatrix| 478 |distance|
              483 |directedGraph| 490 |diagramWidth| 517 |diagramSvg| 522
              |diagramHeight| 529 |deepDiagramSvg| 534 |cycleOpen| 541
              |cycleClosed| 547 |createY| 553 |createX| 559 |createWidth| 565
              |coerce| 570 |closedTensor| 590 |closedCartesian| 597 |cartesian|
              604 |arrowsToNode| 610 |arrowsToArrow| 616 |arrowsFromNode| 622
              |arrowsFromArrow| 628 |arrowName| 634 |adjacencyMatrix| 641
              |addObject!| 646 |addArrow!| 658 = 683 + 689 * 695)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 108) (|BasicType|))
                        (|makeByteWordVec2| 109
                                            '(2 0 8 8 8 9 2 0 8 8 8 10 2 12 0 0
                                              11 13 2 22 20 0 21 23 1 20 8 0 24
                                              2 20 8 0 21 25 2 18 0 0 17 26 1
                                              29 28 0 30 0 29 0 31 2 14 21 6 0
                                              32 2 14 0 0 6 33 2 14 6 0 21 34 3
                                              20 8 0 21 8 35 2 12 38 0 0 39 2
                                              18 38 0 0 42 1 50 49 0 51 2 8 0
                                              52 0 53 2 12 0 0 0 54 2 55 0 0 18
                                              56 2 20 0 0 8 57 1 50 18 0 58 2 8
                                              38 0 0 63 2 8 38 0 0 67 2 18 0 0
                                              0 69 2 12 21 11 0 71 1 0 8 0 73 1
                                              0 8 0 74 2 75 0 6 6 76 2 78 0 0
                                              77 79 3 0 38 0 8 8 80 3 0 43 0 8
                                              8 81 1 43 0 82 83 2 84 0 78 18 85
                                              2 12 11 0 21 92 3 12 11 0 21 11
                                              93 1 96 36 0 97 2 0 38 0 0 1 1 0
                                              0 0 91 2 0 0 14 43 66 1 0 0 6 62
                                              4 0 100 101 0 38 38 1 2 0 105 0 8
                                              1 2 0 105 0 8 1 1 0 106 0 1 1 0
                                              106 0 1 3 0 20 0 8 8 1 3 0 20 0 8
                                              8 1 2 0 8 0 8 1 2 0 20 0 8 1 2 0
                                              20 0 8 1 2 0 20 0 8 1 2 0 20 0 8
                                              1 2 0 8 0 20 1 1 0 8 0 1 2 0 0 0
                                              0 72 1 0 8 0 1 2 0 8 0 20 1 5 0 0
                                              0 20 14 21 21 95 5 0 0 0 20 14 21
                                              21 94 2 0 38 0 0 1 1 0 104 0 1 2
                                              0 104 0 8 1 1 0 104 0 1 1 0 43 0
                                              1 1 0 102 0 1 2 0 0 14 43 68 3 0
                                              38 0 8 8 1 1 0 38 0 1 2 0 38 0 8
                                              1 0 0 38 1 3 0 38 0 8 8 80 1 0 38
                                              0 1 0 0 0 61 1 0 102 0 1 2 0 8 0
                                              8 1 2 0 109 109 0 1 1 0 107 0 1 1
                                              0 12 0 46 2 0 8 0 6 1 1 0 18 0 47
                                              3 0 8 0 8 8 1 1 0 0 59 60 1 0 102
                                              0 1 3 0 21 0 8 8 1 1 0 0 36 37 2
                                              0 0 12 18 19 2 0 0 14 22 27 1 0 0
                                              14 15 1 0 0 12 16 1 0 8 0 73 3 0
                                              100 43 0 38 1 1 0 8 0 74 3 0 100
                                              43 0 38 1 2 0 0 14 43 64 2 0 0 14
                                              43 65 2 0 8 8 8 10 2 0 8 8 8 9 1
                                              0 8 8 1 1 0 0 96 98 1 0 0 14 99 1
                                              0 108 0 1 1 0 108 0 1 3 0 0 0 0
                                              88 89 3 0 0 0 0 88 90 2 0 84 0 0
                                              87 2 0 20 0 8 1 2 0 20 0 8 1 2 0
                                              20 0 8 1 2 0 20 0 8 1 3 0 43 0 8
                                              8 81 1 0 103 0 1 2 0 0 0 11 41 2
                                              0 0 0 6 40 4 0 0 0 43 6 6 1 4 0 0
                                              0 43 8 8 44 5 0 0 0 43 8 8 20 45
                                              2 0 38 0 0 1 2 0 0 0 0 70 2 0 84
                                              0 0 86)))))
           '|lookupComplete|)) 
