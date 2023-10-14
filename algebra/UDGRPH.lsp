
(/VERSIONCHECK 2) 

(PUT '|UDGRPH;isDirected?;B;1| '|SPADreplace| '(XLAM NIL 'NIL)) 

(DEFUN |UDGRPH;isDirected?;B;1| ($) 'NIL) 

(DEFUN |UDGRPH;undirectedGraph;L$;2| (|ob| $)
  (PROG (|objs| #1=#:G151 |x| #2=#:G150)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|UDGRPH;undirectedGraph;L$;2|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (CONS |objs| NIL)))))) 

(PUT '|UDGRPH;undirectedGraph;L$;3| '|SPADreplace|
     '(XLAM (|ob|) (CONS |ob| NIL))) 

(DEFUN |UDGRPH;undirectedGraph;L$;3| (|ob| $) (CONS |ob| NIL)) 

(PUT '|UDGRPH;undirectedGraph;LL$;4| '|SPADreplace| 'CONS) 

(DEFUN |UDGRPH;undirectedGraph;LL$;4| (|ob| |ar| $) (CONS |ob| |ar|)) 

(DEFUN |UDGRPH;undirectedGraph;LL$;5| (|objs| |am| $)
  (PROG (|ar| |a| #1=#:G175 |j| #2=#:G174 |i| |obs| |o| |ob| #3=#:G173 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|UDGRPH;undirectedGraph;LL$;5|))
          (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
               (COND ((|greater_SI| |obn| #3#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #4#)))
               (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |ar| NIL . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #2# (LENGTH |am|) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |am| |i| (QREFELT $ 26))
                                      (QREFELT $ 27))
                            . #4#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |am| |i| (QREFELT $ 26)) |j|
                                     (QREFELT $ 28))
                           1)
                          (SEQ (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #4#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 29))
                                      . #4#)))))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ar|)))))) 

(DEFUN |UDGRPH;addObject!;$S$;6| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|UDGRPH;addObject!;$S$;6|))
          (LETT |obj| (VECTOR |n| 0 0) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 31))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 23)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |UDGRPH;addObject!;$R$;7| (|s| |n| $)
  (PROG (|obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) |UDGRPH;addObject!;$R$;7|)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 31))
            (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 23)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |UDGRPH;addArrow!;$S2Nni$;8| (|s| |nm| |n1| |n2| $)
  (PROG (#1=#:G189 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|UDGRPH;addArrow!;$S2Nni$;8|))
            (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 34))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 29)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |UDGRPH;addArrow!;$S2NniL$;9| (|s| |nm| |n1| |n2| |mp| $)
  (PROG (#1=#:G195 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|UDGRPH;addArrow!;$S2NniL$;9|))
            (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 34))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 29)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(PUT '|UDGRPH;getVertices;$L;10| '|SPADreplace| 'QCAR) 

(DEFUN |UDGRPH;getVertices;$L;10| (|s| $) (QCAR |s|)) 

(DEFUN |UDGRPH;getArrows;$L;11| (|s| $)
  (PROG (|as| |revAr| #1=#:G206 |a| |forwAr| #2=#:G205)
    (RETURN
     (SEQ (LETT |as| NIL . #3=(|UDGRPH;getArrows;$L;11|))
          (SEQ (LETT |a| NIL . #3#) (LETT #2# (QCDR |s|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |forwAr|
                      (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 2)
                              (QVELT |a| 3) (QVELT |a| 4) (QVELT |a| 5)
                              (QVELT |a| 6))
                      . #3#)
                (EXIT
                 (LETT |as| (SPADCALL |as| |forwAr| (QREFELT $ 29)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |a| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |revAr|
                      (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 3)
                              (QVELT |a| 2) (QVELT |a| 4) (QVELT |a| 5)
                              (QVELT |a| 6))
                      . #3#)
                (EXIT
                 (LETT |as| (SPADCALL |as| |revAr| (QREFELT $ 29)) . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |as|))))) 

(PUT '|UDGRPH;initial;$;12| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |UDGRPH;initial;$;12| ($) (CONS NIL NIL)) 

(DEFUN |UDGRPH;terminal;S$;13| (|a| $)
  (PROG (|ar| |o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|UDGRPH;terminal;S$;13|))
          (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
          (EXIT (CONS (LIST |o|) (LIST |ar|))))))) 

(DEFUN |UDGRPH;cycleOpen;LS$;14| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| |ob| #1=#:G222 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|UDGRPH;cycleOpen;LS$;14|))
          (LETT |ars| NIL . #2#) (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #2#)
                    (LETT |next| (+ |obn| 1) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 42))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #2#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #2#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #2#)))))))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |UDGRPH;cycleClosed;LS$;15| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| |ob| #1=#:G232 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|UDGRPH;cycleClosed;LS$;15|))
          (LETT |ars| NIL . #2#) (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #2#)
                    (LETT |next| (+ |obn| 1) . #2#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #2#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 42))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #2#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #2#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #2#)))))))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |UDGRPH;unit;LS$;16| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |obs| |o| |ob| #1=#:G240 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|UDGRPH;unit;LS$;16|)) (LETT |ars| NIL . #2#)
          (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #2#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL)
                          . #2#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29)) . #2#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |UDGRPH;kgraph;LS$;17| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| #1=#:G252 |obm| |obs| |o| |ob| #2=#:G251 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|UDGRPH;kgraph;LS$;17|)) (LETT |ars| NIL . #3#)
          (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
               (COND ((|greater_SI| |obn| #2#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 19)) . #3#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 21))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 22)))
                          . #3#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 23)) . #3#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#)
                          G190 (COND ((|greater_SI| |obm| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 46))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL)
                                     . #3#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 29))
                                     . #3#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |UDGRPH;+;3$;18| (|a| |b| $)
  (PROG (|la| |lb| |arr| #1=#:G260 |ba| |bStart| |lo|)
    (RETURN
     (SEQ
      (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 48))
            . #2=(|UDGRPH;+;3$;18|))
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
                          (QVELT |ba| 5) (QVELT |ba| 6))
                  . #2#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 29)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 49)) . #2#)
      (EXIT (CONS |lo| |la|)))))) 

(DEFUN |UDGRPH;merge;3$;19| (|a| |b| $)
  (PROG (|la| |lb| |arr| |fromI| |toI| #1=#:G280 |ba| |bStart| |bmap| #2=#:G268
         |newIndex| |mergedObjects| |i| #3=#:G279 |bob| #4=#:G278 |x|
         #5=#:G277)
    (RETURN
     (SEQ
      (LETT |bmap|
            (PROGN
             (LETT #5# NIL . #6=(|UDGRPH;merge;3$;19|))
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
           (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 51)) . #6#)
                (EXIT
                 (COND
                  ((< |i| 1)
                   (SEQ
                    (LETT |mergedObjects|
                          (SPADCALL |mergedObjects| |bob| (QREFELT $ 23))
                          . #6#)
                    (LETT |newIndex| (+ |newIndex| 1) . #6#)
                    (EXIT
                     (LETT |bmap| (SPADCALL |bmap| |newIndex| (QREFELT $ 52))
                           . #6#))))
                  ('T
                   (LETT |bmap|
                         (SPADCALL |bmap|
                                   (PROG1 (LETT #2# |i| . #6#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 52))
                         . #6#)))))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |bStart| (LENGTH (QCAR |a|)) . #6#) (LETT |lb| NIL . #6#)
      (SEQ (LETT |ba| NIL . #6#) (LETT #1# (QCDR |b|) . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (LETT |toI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|) (QREFELT $ 28))
                  . #6#)
            (LETT |fromI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|) (QREFELT $ 28))
                  . #6#)
            (LETT |arr|
                  (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                          (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                  . #6#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 29)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 49)) . #6#)
      (EXIT (CONS |mergedObjects| |la|)))))) 

(DEFUN |UDGRPH;objProd| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G291 |boi| |ayi| |axi| |ai| #2=#:G290 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|UDGRPH;objProd|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 54)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 55)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 54))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 55))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 57))
                                     . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 60))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |UDGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G292)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |UDGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |UDGRPH;*;2$Ug;22| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G314 |bv| #2=#:G313 |bu| #3=#:G312 |av|
         #4=#:G311 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|UDGRPH;*;2$Ug;22|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 61))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 62))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 62)))
                                                  (QREFELT $ 64))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 66))))))) 

(DEFUN |UDGRPH;cartesian;2$Ug;23| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G339 |bv| #2=#:G338 |bu| #3=#:G337 |av|
         #4=#:G336 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|UDGRPH;cartesian;2$Ug;23|))
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
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 61))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 64)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 64)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 62))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 64))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 61))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          61))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            62))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 64)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 64))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|UDGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|UDGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 29))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 61))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 64)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 64)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 62))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 64))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 66))))))) 

(DEFUN |UDGRPH;closedObjProd| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G348 |boi| |ayi| |axi| |ai| #2=#:G347 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|UDGRPH;closedObjProd|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 54)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 55)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 54))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 55))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 23))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |UDGRPH;closedTensor;2$M$;25| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G369 |bv| #2=#:G368 |bu| #3=#:G367 |av|
         #4=#:G366 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|UDGRPH;closedTensor;2$M$;25|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 61))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 62))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 62)))
                                                  (QREFELT $ 64))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 17))))))) 

(DEFUN |UDGRPH;closedCartesian;2$M$;26| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G395 |bv| #2=#:G394 |bu| #3=#:G393 |av|
         #4=#:G392 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|UDGRPH;closedCartesian;2$M$;26|))
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
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 61))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 64)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 64)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 62))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 64))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 61))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          61))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            62))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 64)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            62))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 64)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 64))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|UDGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|UDGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 29))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 61))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 61))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          62))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 64)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          62))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 64)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 62))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 64))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|UDGRPH;indexProd|
                                                          |b| |bu| |au| $)
                                                         (|UDGRPH;indexProd|
                                                          |b| |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 29))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 17))))))) 

(DEFUN |UDGRPH;map;$LL2I$;27| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G412 |oldArrow| #2=#:G400 #3=#:G399 |i|
         #4=#:G411 |oi| |newObjs| #5=#:G410 |o| #6=#:G409)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|UDGRPH;map;$LL2I$;27|))
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
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 28)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 72)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 72))
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
                                                  (QREFELT $ 72))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#)))
                           (QREFELT $ 73))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 28))
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 28))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 29))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |UDGRPH;mapContra;$LL2I$;28| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G429 |oldArrow| #2=#:G417 #3=#:G416 |i|
         #4=#:G428 |oi| |newObjs| #5=#:G427 |o| #6=#:G426)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|UDGRPH;mapContra;$LL2I$;28|))
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
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 28)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 72)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 72))
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
                                                  (QREFELT $ 72))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#)))
                           (QREFELT $ 73))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 28))
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 28))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 29))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |UndirectedGraph| (#1=#:G430)
  (PROG ()
    (RETURN
     (PROG (#2=#:G431)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|UndirectedGraph|)
                                           '|domainEqualList|)
                . #3=(|UndirectedGraph|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|UndirectedGraph;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|UndirectedGraph|))))))))))) 

(DEFUN |UndirectedGraph;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UndirectedGraph|))
      (LETT |dv$| (LIST '|UndirectedGraph| DV$1) . #1#)
      (LETT $ (GETREFV 87) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|UndirectedGraph| (LIST DV$1)
                  (CONS 1 $))
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

(MAKEPROP '|UndirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |UDGRPH;isDirected?;B;1| (|List| 6) |UDGRPH;undirectedGraph;L$;2|
              (|Record| (|:| |value| 6) (|:| |posX| 20) (|:| |posY| 20))
              (|List| 12) |UDGRPH;undirectedGraph;L$;3|
              (|Record| (|:| |name| 35) (|:| |arrType| 20) (|:| |fromOb| 20)
                        (|:| |toOb| 20) (|:| |xOffset| 18) (|:| |yOffset| 18)
                        (|:| |map| 24))
              (|List| 15) |UDGRPH;undirectedGraph;LL$;4| (|Integer|)
              (0 . |elt|) (|NonNegativeInteger|) (6 . |createX|)
              (12 . |createY|) (18 . |concat|) (|List| 20) (|List| 24)
              (24 . |elt|) (30 . |#|) (35 . |elt|) (41 . |concat|)
              |UDGRPH;undirectedGraph;LL$;5| (47 . =) |UDGRPH;addObject!;$S$;6|
              |UDGRPH;addObject!;$R$;7| (53 . =) (|String|)
              |UDGRPH;addArrow!;$S2Nni$;8| |UDGRPH;addArrow!;$S2NniL$;9|
              |UDGRPH;getVertices;$L;10| |UDGRPH;getArrows;$L;11|
              |UDGRPH;initial;$;12| |UDGRPH;terminal;S$;13| (59 . <=)
              |UDGRPH;cycleOpen;LS$;14| |UDGRPH;cycleClosed;LS$;15|
              |UDGRPH;unit;LS$;16| (65 . ~=) |UDGRPH;kgraph;LS$;17|
              (71 . |concat|) (77 . |concat|) |UDGRPH;+;3$;18|
              (83 . |position|) (89 . |concat|) |UDGRPH;merge;3$;19|
              (95 . |diagramWidth|) (100 . |diagramHeight|) (|Product| 6 6)
              (105 . |construct|)
              (|Record| (|:| |value| 56) (|:| |posX| 20) (|:| |posY| 20))
              (|List| 58) (111 . |concat|) (117 . |isDirectSuccessor?|)
              (124 . |arrowName|) (|List| $) (131 . |concat|)
              (|UndirectedGraph| 56) (136 . |undirectedGraph|)
              |UDGRPH;*;2$Ug;22| |UDGRPH;cartesian;2$Ug;23| (|Mapping| 6 6 6)
              |UDGRPH;closedTensor;2$M$;25| |UDGRPH;closedCartesian;2$M$;26|
              (142 . |elt|) (148 . |setelt|) |UDGRPH;map;$LL2I$;27|
              |UDGRPH;mapContra;$LL2I$;28| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 18) (|Matrix| 20) (|List| (|Loop|)) (|Tree| 18)
              (|List| 81) (|DirectedGraph| $) (|SingleInteger|) (|OutputForm|)
              (|HashState|))
           '#(~= 155 |unit| 161 |undirectedGraph| 167 |terminal| 189
              |subdiagramSvg| 194 |spanningTreeNode| 202 |spanningTreeArrow|
              208 |spanningForestNode| 214 |spanningForestArrow| 219
              |routeNodes| 224 |routeArrows| 231 |outDegree| 238 |nodeToNode|
              244 |nodeToArrow| 250 |nodeFromNode| 256 |nodeFromArrow| 262
              |min| 268 |merge| 279 |max| 285 |mapContra| 296 |map| 305
              |looseEquals| 314 |loopsNodes| 320 |loopsAtNode| 325
              |loopsArrows| 331 |latex| 336 |laplacianMatrix| 341 |kgraph| 346
              |isGreaterThan?| 352 |isFunctional?| 359 |isFixPoint?| 364
              |isDirected?| 370 |isDirectSuccessor?| 374 |isAcyclic?| 381
              |initial| 386 |incidenceMatrix| 390 |inDegree| 395 |hashUpdate!|
              401 |hash| 407 |getVertices| 412 |getVertexIndex| 417 |getArrows|
              423 |getArrowIndex| 428 |flatten| 435 |distanceMatrix| 440
              |distance| 445 |diagramWidth| 452 |diagramSvg| 457
              |diagramHeight| 464 |deepDiagramSvg| 469 |cycleOpen| 476
              |cycleClosed| 482 |createY| 488 |createX| 494 |createWidth| 500
              |coerce| 505 |closedTensor| 515 |closedCartesian| 522 |cartesian|
              529 |arrowsToNode| 535 |arrowsToArrow| 541 |arrowsFromNode| 547
              |arrowsFromArrow| 553 |arrowName| 559 |adjacencyMatrix| 566
              |addObject!| 571 |addArrow!| 583 = 608 + 614 * 620)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 85)
                           (|BasicType|))
                        (|makeByteWordVec2| 86
                                            '(2 10 6 0 18 19 2 0 20 20 20 21 2
                                              0 20 20 20 22 2 13 0 0 12 23 2 25
                                              24 0 18 26 1 24 20 0 27 2 24 20 0
                                              18 28 2 16 0 0 15 29 2 13 8 0 0
                                              31 2 16 8 0 0 34 2 20 8 0 0 42 2
                                              20 8 0 0 46 2 13 0 0 0 48 2 16 0
                                              0 0 49 2 13 18 12 0 51 2 24 0 0
                                              20 52 1 0 20 0 54 1 0 20 0 55 2
                                              56 0 6 6 57 2 59 0 0 58 60 3 0 8
                                              0 20 20 61 3 0 35 0 20 20 62 1 35
                                              0 63 64 2 65 0 59 16 66 2 13 12 0
                                              18 72 3 13 12 0 18 12 73 2 0 8 0
                                              0 1 2 0 0 10 35 45 2 0 0 13 16 17
                                              2 0 0 10 25 30 1 0 0 13 14 1 0 0
                                              10 11 1 0 0 6 41 4 0 76 77 0 8 8
                                              1 2 0 81 0 20 1 2 0 81 0 20 1 1 0
                                              82 0 1 1 0 82 0 1 3 0 24 0 20 20
                                              1 3 0 24 0 20 20 1 2 0 20 0 20 1
                                              2 0 24 0 20 1 2 0 24 0 20 1 2 0
                                              24 0 20 1 2 0 24 0 20 1 2 0 20 0
                                              24 1 1 0 20 0 1 2 0 0 0 0 53 2 0
                                              20 0 24 1 1 0 20 0 1 5 0 0 0 24
                                              10 18 18 75 5 0 0 0 24 10 18 18
                                              74 2 0 8 0 0 1 1 0 80 0 1 2 0 80
                                              0 20 1 1 0 80 0 1 1 0 35 0 1 1 0
                                              78 0 1 2 0 0 10 35 47 3 0 8 0 20
                                              20 1 1 0 8 0 1 2 0 8 0 20 1 0 0 8
                                              9 3 0 8 0 20 20 61 1 0 8 0 1 0 0
                                              0 40 1 0 78 0 1 2 0 20 0 20 1 2 0
                                              86 86 0 1 1 0 84 0 1 1 0 13 0 38
                                              2 0 20 0 6 1 1 0 16 0 39 3 0 20 0
                                              20 20 1 1 0 0 83 1 1 0 78 0 1 3 0
                                              18 0 20 20 1 1 0 20 0 54 3 0 76
                                              35 0 8 1 1 0 20 0 55 3 0 76 35 0
                                              8 1 2 0 0 10 35 43 2 0 0 10 35 44
                                              2 0 20 20 20 22 2 0 20 20 20 21 1
                                              0 20 20 1 1 0 85 0 1 1 0 85 0 1 3
                                              0 0 0 0 69 70 3 0 0 0 0 69 71 2 0
                                              65 0 0 68 2 0 24 0 20 1 2 0 24 0
                                              20 1 2 0 24 0 20 1 2 0 24 0 20 1
                                              3 0 35 0 20 20 62 1 0 79 0 1 2 0
                                              0 0 12 33 2 0 0 0 6 32 5 0 0 0 35
                                              20 20 24 37 4 0 0 0 35 6 6 1 4 0
                                              0 0 35 20 20 36 2 0 8 0 0 1 2 0 0
                                              0 0 50 2 0 65 0 0 67)))))
           '|lookupComplete|)) 
