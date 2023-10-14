
(/VERSIONCHECK 2) 

(DEFUN |WGRPH;weightedGraph;L$;1| (|ob| $)
  (PROG (|objs| #1=#:G170 |x| #2=#:G169)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|WGRPH;weightedGraph;L$;1|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (VECTOR |x| 0 0 (|spadConstant| $ 9)) #2#)
                          . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (CONS |objs| NIL)))))) 

(PUT '|WGRPH;weightedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(DEFUN |WGRPH;weightedGraph;L$;2| (|ob| $) (CONS |ob| NIL)) 

(PUT '|WGRPH;weightedGraph;LL$;3| '|SPADreplace| 'CONS) 

(DEFUN |WGRPH;weightedGraph;LL$;3| (|ob| |ar| $) (CONS |ob| |ar|)) 

(DEFUN |WGRPH;weightedGraph;LL$;4| (|ob| |ar| $)
  (PROG (|fobs| |fo| #1=#:G197 |f| #2=#:G198 |fn| |arrs| |arro| #3=#:G196 |a|)
    (RETURN
     (SEQ (LETT |arrs| NIL . #4=(|WGRPH;weightedGraph;LL$;4|))
          (SEQ (LETT |a| NIL . #4#) (LETT #3# |ar| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |arro|
                      (VECTOR (QVELT |a| 0) (|spadConstant| $ 9) (QVELT |a| 2)
                              (QVELT |a| 3) (QVELT |a| 4) (QVELT |a| 5)
                              (QVELT |a| 6))
                      . #4#)
                (EXIT
                 (LETT |arrs| (SPADCALL |arrs| |arro| (QREFELT $ 18)) . #4#)))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |fobs| NIL . #4#)
          (SEQ (LETT |fn| 1 . #4#) (LETT #2# (LENGTH |ob|) . #4#)
               (LETT |f| NIL . #4#) (LETT #1# |ob| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #4#) NIL)
                     (|greater_SI| |fn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |fo|
                      (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                              (|spadConstant| $ 9))
                      . #4#)
                (EXIT
                 (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 19)) . #4#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |fn| (|inc_SI| |fn|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |fobs| |arrs|)))))) 

(DEFUN |WGRPH;weightedGraph;LL$;5| (|objs| |am| $)
  (PROG (|ar| |a| #1=#:G212 |j| #2=#:G211 |i| |obs| |o| |ob| #3=#:G210 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|WGRPH;weightedGraph;LL$;5|))
          (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
               (COND ((|greater_SI| |obn| #3#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)))
               (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |ar| NIL . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #2# (LENGTH |am|) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |am| |i| (QREFELT $ 32))
                                      (QREFELT $ 33))
                            . #4#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |am| |i| (QREFELT $ 32)) |j|
                                     (QREFELT $ 34))
                           1)
                          (SEQ
                           (LETT |a|
                                 (VECTOR "a" (|spadConstant| $ 9) |i| |j| 0 0
                                         NIL)
                                 . #4#)
                           (EXIT
                            (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 18))
                                  . #4#)))))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ar|)))))) 

(DEFUN |WGRPH;addObject!;$S$;6| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|WGRPH;addObject!;$S$;6|))
          (LETT |obj| (VECTOR |n| 0 0 (|spadConstant| $ 9)) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 37))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 19)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |WGRPH;addObject!;$R$;7| (|s| |n| $)
  (SEQ (|error| "this form of addObject! not supported in multifunctionGraph")
       (EXIT (CONS NIL NIL)))) 

(DEFUN |WGRPH;addArrow!;$S2Nni$;8| (|s| |nm| |n1| |n2| $)
  (SPADCALL |s| |nm| |n1| |n2| (|spadConstant| $ 9) (QREFELT $ 41))) 

(DEFUN |WGRPH;addWArrow!;$S2NniW$;9| (|s| |nm| |n1| |n2| |w| $)
  (PROG (#1=#:G230 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|WGRPH;addWArrow!;$S2NniW$;9|))
            (LETT |a| (VECTOR |nm| |w| |n1| |n2| 0 0 NIL) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 43))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 18)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |WGRPH;getVertices;$L;10| (|s| $)
  (PROG (|res| |o| #1=#:G237 |soj|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|WGRPH;getVertices;$L;10|))
          (SEQ (LETT |soj| NIL . #2#) (LETT #1# (QCAR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |soj| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR (QVELT |soj| 0) (QVELT |soj| 1) (QVELT |soj| 2))
                      . #2#)
                (EXIT (LETT |res| (SPADCALL |res| |o| (QREFELT $ 44)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |WGRPH;getArrows;$L;11| (|s| $)
  (PROG (|arrs| |aw| #1=#:G244 |a|)
    (RETURN
     (SEQ (LETT |arrs| NIL . #2=(|WGRPH;getArrows;$L;11|))
          (SEQ (LETT |a| NIL . #2#) (LETT #1# (QCDR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |aw|
                      (VECTOR (QVELT |a| 0) 0 (QVELT |a| 2) (QVELT |a| 3)
                              (QVELT |a| 4) (QVELT |a| 5) (QVELT |a| 6))
                      . #2#)
                (EXIT
                 (LETT |arrs| (SPADCALL |arrs| |aw| (QREFELT $ 46)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |arrs|))))) 

(PUT '|WGRPH;initial;$;12| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |WGRPH;initial;$;12| ($) (CONS NIL NIL)) 

(DEFUN |WGRPH;terminal;S$;13| (|a| $)
  (PROG (|ar| |o|)
    (RETURN
     (SEQ
      (LETT |o| (VECTOR |a| 0 0 (|spadConstant| $ 9))
            . #1=(|WGRPH;terminal;S$;13|))
      (LETT |ar| (VECTOR "loop" (|spadConstant| $ 9) 1 1 0 0 NIL) . #1#)
      (EXIT (CONS (LIST |o|) (LIST |ar|))))))) 

(DEFUN |WGRPH;cycleOpen;LS$;14| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| |ob| #1=#:G260 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|WGRPH;cycleOpen;LS$;14|))
          (LETT |ars| NIL . #2#) (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #2#)
                    (LETT |next| (+ |obn| 1) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 50))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #2#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #2#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #2#)))))))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |WGRPH;cycleClosed;LS$;15| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| |ob| #1=#:G270 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|WGRPH;cycleClosed;LS$;15|))
          (LETT |ars| NIL . #2#) (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #2#)
                    (LETT |next| (+ |obn| 1) . #2#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #2#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 50))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #2#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #2#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #2#)))))))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |WGRPH;unit;LS$;16| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |obs| |o| |ob| #1=#:G278 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|WGRPH;unit;LS$;16|)) (LETT |ars| NIL . #2#)
          (LETT |arn| 1 . #2#)
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #2#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #2#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #2#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                  (|spadConstant| $ 9) |obn| |obn| 0 0 NIL)
                          . #2#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #2#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |WGRPH;kgraph;LS$;17| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| #1=#:G290 |obm| |obs| |o| |ob| #2=#:G289 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|WGRPH;kgraph;LS$;17|)) (LETT |ars| NIL . #3#)
          (LETT |arn| 1 . #3#)
          (SEQ (LETT |obn| 1 . #3#) (LETT #2# (LENGTH |objs|) . #3#) G190
               (COND ((|greater_SI| |obn| #2#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 26)) . #3#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 28))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 29))
                                  (|spadConstant| $ 9))
                          . #3#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #3#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#)
                          G190 (COND ((|greater_SI| |obm| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 54))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |obm| 0 0 NIL)
                                     . #3#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18))
                                     . #3#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |obn| (|inc_SI| |obn|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |WGRPH;+;3$;18| (|a| |b| $)
  (PROG (|la| |lb| |arr| #1=#:G298 |ba| |bStart| |lo|)
    (RETURN
     (SEQ
      (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 56))
            . #2=(|WGRPH;+;3$;18|))
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
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 57)) . #2#)
      (EXIT (CONS |lo| |la|)))))) 

(DEFUN |WGRPH;merge;3$;19| (|a| |b| $)
  (PROG (|la| |lb| |arr| |fromI| |toI| #1=#:G318 |ba| |bStart| |bmap| #2=#:G306
         |newIndex| |mergedObjects| |i| #3=#:G317 |bob| #4=#:G316 |x|
         #5=#:G315)
    (RETURN
     (SEQ
      (LETT |bmap|
            (PROGN
             (LETT #5# NIL . #6=(|WGRPH;merge;3$;19|))
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
           (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 59)) . #6#)
                (EXIT
                 (COND
                  ((< |i| 1)
                   (SEQ
                    (LETT |mergedObjects|
                          (SPADCALL |mergedObjects| |bob| (QREFELT $ 19))
                          . #6#)
                    (LETT |newIndex| (+ |newIndex| 1) . #6#)
                    (EXIT
                     (LETT |bmap| (SPADCALL |bmap| |newIndex| (QREFELT $ 60))
                           . #6#))))
                  ('T
                   (LETT |bmap|
                         (SPADCALL |bmap|
                                   (PROG1 (LETT #2# |i| . #6#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 60))
                         . #6#)))))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |bStart| (LENGTH (QCAR |a|)) . #6#) (LETT |lb| NIL . #6#)
      (SEQ (LETT |ba| NIL . #6#) (LETT #1# (QCDR |b|) . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (LETT |toI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|) (QREFELT $ 34))
                  . #6#)
            (LETT |fromI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|) (QREFELT $ 34))
                  . #6#)
            (LETT |arr|
                  (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                          (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                  . #6#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 57)) . #6#)
      (EXIT (CONS |mergedObjects| |la|)))))) 

(DEFUN |WGRPH;objProd| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G329 |boi| |ayi| |axi| |ai| #2=#:G328 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|WGRPH;objProd|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 62)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 63)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 62))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 63))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 65))
                                     . #3#)
                               (LETT |ob|
                                     (VECTOR |sp| |x| |y| (|spadConstant| $ 9))
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 68))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |WGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G330)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |WGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |WGRPH;*;2$Wg;22| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G352 |bv| #2=#:G351 |bu| #3=#:G350 |av|
         #4=#:G349 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|WGRPH;*;2$Wg;22|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 69))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 70))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 70)))
                                                  (QREFELT $ 72))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 74))))))) 

(DEFUN |WGRPH;cartesian;2$Wg;23| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G377 |bv| #2=#:G376 |bu| #3=#:G375 |av|
         #4=#:G374 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|WGRPH;cartesian;2$Wg;23|))
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
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 69))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 72)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 72)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 70))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 72))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 69))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 72)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 72))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an|
                                                           (|spadConstant| $ 9)
                                                           (|WGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|WGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 18))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 69))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 72)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 72)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 70))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 72))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 74))))))) 

(DEFUN |WGRPH;closedObjProd| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G386 |boi| |ayi| |axi| |ai| #2=#:G385 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|WGRPH;closedObjProd|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 62)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 63)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 62))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 63))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob|
                                     (VECTOR |sp| |x| |y| (|spadConstant| $ 9))
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 19))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |WGRPH;closedTensor;2$M$;25| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G407 |bv| #2=#:G406 |bu| #3=#:G405 |av|
         #4=#:G404 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|WGRPH;closedTensor;2$M$;25|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 69))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 70))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 70)))
                                                  (QREFELT $ 72))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 17))))))) 

(DEFUN |WGRPH;closedCartesian;2$M$;26| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G433 |bv| #2=#:G432 |bu| #3=#:G431 |av|
         #4=#:G430 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|WGRPH;closedCartesian;2$M$;26|))
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
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 69))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       #6="#"
                                                       (STRINGIMAGE |bv|))
                                                      (QREFELT $ 72)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7="#"
                                                       (STRINGIMAGE |av|))
                                                      (QREFELT $ 72)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 70))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 72))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 69))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         #6#
                                                         (STRINGIMAGE |bv|))
                                                        (QREFELT $ 72)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            70))
                                                         #7#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 72)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 72))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an|
                                                           (|spadConstant| $ 9)
                                                           (|WGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|WGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0 NIL)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 18))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 69))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 69))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          70))
                                                       #6# (STRINGIMAGE |bv|))
                                                      (QREFELT $ 72)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          70))
                                                       #7# (STRINGIMAGE |av|))
                                                      (QREFELT $ 72)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 70))
                                                     #7# (STRINGIMAGE |av|))
                                                    (QREFELT $ 72))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an|
                                                         (|spadConstant| $ 9)
                                                         (|WGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|WGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0 NIL)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 18))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                     (QREFELT $ 17))))))) 

(DEFUN |WGRPH;map;$LL2I$;27| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G450 |oldArrow| #2=#:G438 #3=#:G437 |i|
         #4=#:G449 |oi| |newObjs| #5=#:G448 |o| #6=#:G447)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|WGRPH;map;$LL2I$;27|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6# (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #6#)
                          . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH (QCAR |s|)) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 34)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 80)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 80))
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
                                                  (QREFELT $ 80))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            (|spadConstant| $ 9))
                           (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 34))
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 34))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |WGRPH;mapContra;$LL2I$;28| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G467 |oldArrow| #2=#:G455 #3=#:G454 |i|
         #4=#:G466 |oi| |newObjs| #5=#:G465 |o| #6=#:G464)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|WGRPH;mapContra;$LL2I$;28|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #6# (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #6#)
                          . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH (QCAR |s|)) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 34)) . #7#)
                (EXIT
                 (SPADCALL |newObjs| |i|
                           (VECTOR
                            (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 80)) 0)
                            (PROG1
                                (LETT #3#
                                      (+
                                       (QVELT
                                        (SPADCALL (QCAR |s|) |oi|
                                                  (QREFELT $ 80))
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
                                                  (QREFELT $ 80))
                                        2)
                                       |offsetY|)
                                      . #7#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            (|spadConstant| $ 9))
                           (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (LETT |newArrs| NIL . #7#)
      (SEQ (LETT |oldArrow| NIL . #7#) (LETT #1# (QCDR |s|) . #7#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |oldArrow| (CAR #1#) . #7#) NIL))
             (GO G191)))
           (SEQ
            (LETT |newArr|
                  (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 34))
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 34))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                          (QVELT |oldArrow| 6))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |WGRPH;routeNodeRecursive| (|s| |a| |b| |visited| $)
  (PROG (#1=#:G479 |shortest| |d| #2=#:G480 |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |visited| (QREFELT $ 33))
                    (LENGTH (SPADCALL |s| (QREFELT $ 45))) (QREFELT $ 84))
          (PROGN (LETT #1# NIL . #3=(|WGRPH;routeNodeRecursive|)) (GO #1#))))
        (LETT |shortest| NIL . #3#)
        (COND ((EQL |a| |b|) (PROGN (LETT #1# (LIST |a|) . #3#) (GO #1#))))
        (COND
         ((SPADCALL |s| |a| |b| (QREFELT $ 69))
          (PROGN (LETT #1# (LIST |a| |b|) . #3#) (GO #1#))))
        (SEQ (LETT |arr| NIL . #3#)
             (LETT #2# (SPADCALL |s| (QREFELT $ 47)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 69))
                 (SEQ
                  (LETT |d|
                        (|WGRPH;routeNodeRecursive| |s| (QVELT |arr| 2) |b|
                         (SPADCALL |visited| |a| (QREFELT $ 60)) $)
                        . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |shortest| NIL (QREFELT $ 85))
                     (LETT |shortest| |d| . #3#))
                    ((SPADCALL |d| NIL (QREFELT $ 86))
                     (COND
                      ((SPADCALL (SPADCALL |s| (CONS |a| |d|) (QREFELT $ 87))
                                 (SPADCALL |s| (CONS |a| |shortest|)
                                           (QREFELT $ 87))
                                 (QREFELT $ 88))
                       (LETT |shortest| |d| . #3#)))))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL |shortest| NIL (QREFELT $ 85))
          (PROGN (LETT #1# NIL . #3#) (GO #1#))))
        (EXIT (CONS |a| |shortest|))))
      #1# (EXIT #1#))))) 

(DEFUN |WGRPH;routeNodes;$2NniL;30| (|s| |a| |b| $)
  (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)) 

(DEFUN |WGRPH;routeArrowRecursive| (|s| |a| |b| |visited| $)
  (PROG (#1=#:G496 |shortestFullPath| |shortest| |fullPath| |d| |aa| #2=#:G497
         |arr| |arrs| |arrn|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |visited| (QREFELT $ 33))
                    (LENGTH (SPADCALL |s| (QREFELT $ 45))) (QREFELT $ 84))
          (PROGN
           (LETT #1# (LIST 0) . #3=(|WGRPH;routeArrowRecursive|))
           (GO #1#))))
        (LETT |shortest| (LIST 0) . #3#)
        (COND ((EQL |a| |b|) (PROGN (LETT #1# NIL . #3#) (GO #1#))))
        (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 90)) . #3#)
        (COND
         ((SPADCALL |arrn| 0 (QREFELT $ 54))
          (PROGN (LETT #1# (LIST |arrn|) . #3#) (GO #1#))))
        (LETT |aa| 0 . #3#) (LETT |shortestFullPath| (LIST 0) . #3#)
        (LETT |arrs| (SPADCALL |s| (QREFELT $ 47)) . #3#)
        (SEQ (LETT |arr| NIL . #3#) (LETT #2# |arrs| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 69))
                 (SEQ
                  (LETT |aa| (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 90))
                        . #3#)
                  (LETT |d|
                        (|WGRPH;routeArrowRecursive| |s| (QVELT |arr| 2) |b|
                         (SPADCALL |visited| |a| (QREFELT $ 60)) $)
                        . #3#)
                  (LETT |fullPath| (CONS |aa| |d|) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |shortest| (LIST 0) (QREFELT $ 85))
                     (SEQ (LETT |shortest| |d| . #3#)
                          (EXIT (LETT |shortestFullPath| |fullPath| . #3#))))
                    ((SPADCALL |d| (LIST 0) (QREFELT $ 86))
                     (COND
                      ((SPADCALL (SPADCALL |s| |fullPath| (QREFELT $ 91))
                                 (SPADCALL |s| |shortestFullPath|
                                           (QREFELT $ 91))
                                 (QREFELT $ 88))
                       (SEQ (LETT |shortest| |d| . #3#)
                            (EXIT
                             (LETT |shortestFullPath| |fullPath|
                                   . #3#)))))))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL |shortest| (LIST 0) (QREFELT $ 85))
          (PROGN (LETT #1# (LIST 0) . #3#) (GO #1#))))
        (EXIT |shortestFullPath|)))
      #1# (EXIT #1#))))) 

(DEFUN |WGRPH;routeArrows;$2NniL;32| (|s| |a| |b| $)
  (|WGRPH;routeArrowRecursive| |s| |a| |b| NIL $)) 

(DEFUN |WGRPH;distanceWeighted;$2NniU;33| (|s| |a| |b| $)
  (PROG (#1=#:G508 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |r| (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)
              . #2=(|WGRPH;distanceWeighted;$2NniU;33|))
        (COND
         ((EQL (SPADCALL |r| (QREFELT $ 33)) 0)
          (PROGN (LETT #1# (CONS 1 "disjoint") . #2#) (GO #1#))))
        (EXIT (CONS 0 (SPADCALL |s| |r| (QREFELT $ 87))))))
      #1# (EXIT #1#))))) 

(DEFUN |WGRPH;getWeightBetween| (|s| |i1| |i2| $)
  (PROG (|res| |isDisjoint| #1=#:G520 |arr| |arrs|)
    (RETURN
     (SEQ (LETT |isDisjoint| 'T . #2=(|WGRPH;getWeightBetween|))
          (LETT |res| (|spadConstant| $ 9) . #2#)
          (LETT |arrs| (QCDR |s|) . #2#)
          (SEQ (LETT |arr| NIL . #2#) (LETT #1# |arrs| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  (|isDisjoint|
                   (COND
                    ((EQL (QVELT |arr| 2) |i1|)
                     (COND
                      ((EQL (QVELT |arr| 3) |i2|)
                       (SEQ (LETT |res| (QVELT |arr| 1) . #2#)
                            (EXIT (LETT |isDisjoint| 'NIL . #2#))))))))
                  ((EQL (QVELT |arr| 2) |i1|)
                   (COND
                    ((EQL (QVELT |arr| 3) |i2|)
                     (COND
                      ((SPADCALL (QVELT |arr| 1) |res| (QREFELT $ 88))
                       (LETT |res| (QVELT |arr| 1) . #2#)))))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |WGRPH;routeNodeWeight;$LW;35| (|s| |r| $)
  (PROG (|lasti| |fst| |res| |w| #1=#:G526 |i|)
    (RETURN
     (SEQ
      (LETT |res| (|spadConstant| $ 9) . #2=(|WGRPH;routeNodeWeight;$LW;35|))
      (LETT |fst| 'T . #2#) (LETT |lasti| 0 . #2#)
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (COND
             ((NULL |fst|)
              (SEQ
               (LETT |w| (|WGRPH;getWeightBetween| |s| |lasti| |i| $) . #2#)
               (EXIT (LETT |res| (SPADCALL |res| |w| (QREFELT $ 95)) . #2#)))))
            (LETT |fst| 'NIL . #2#) (EXIT (LETT |lasti| |i| . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |WGRPH;routeArrowWeight;$LW;36| (|s| |r| $)
  (PROG (|res| |a| #1=#:G532 |i|)
    (RETURN
     (SEQ
      (LETT |res| (|spadConstant| $ 9) . #2=(|WGRPH;routeArrowWeight;$LW;36|))
      (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ (LETT |a| (SPADCALL (QCDR |s|) |i| (QREFELT $ 96)) . #2#)
                (EXIT
                 (LETT |res| (SPADCALL |res| (QVELT |a| 1) (QREFELT $ 95))
                       . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |WGRPH;weightedDistanceMatrix;$Tda;37| (|s| $)
  (PROG (|v| |u| |m| |n|)
    (RETURN
     (SEQ
      (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 45)))
            . #1=(|WGRPH;weightedDistanceMatrix;$Tda;37|))
      (LETT |m| (SPADCALL |n| |n| (CONS 0 (|spadConstant| $ 9)) (QREFELT $ 98))
            . #1#)
      (SEQ (LETT |u| 1 . #1#) G190 (COND ((|greater_SI| |u| |n|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |v| 1 . #1#) G190
                  (COND ((|greater_SI| |v| |n|) (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETAREF2O |m| |u| |v|
                                (SPADCALL |s| |u| |v| (QREFELT $ 94)) 1 1)))
                  (LETT |v| (|inc_SI| |v|) . #1#) (GO G190) G191 (EXIT NIL))))
           (LETT |u| (|inc_SI| |u|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |m|))))) 

(DEFUN |WeightedGraph| (&REST #1=#:G545)
  (PROG ()
    (RETURN
     (PROG (#2=#:G546)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|WeightedGraph|)
                                           '|domainEqualList|)
                . #3=(|WeightedGraph|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |WeightedGraph;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|WeightedGraph|))))))))))) 

(DEFUN |WeightedGraph;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|WeightedGraph|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|WeightedGraph| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 111) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|WeightedGraph| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Record|
                 (|:| |objects|
                      (|List|
                       (|Record| (|:| |value| |#1|)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))
                                 (|:| |weight| |#2|))))
                 (|:| |arrows|
                      (|List|
                       (|Record| (|:| |name| (|String|)) (|:| |weight| |#2|)
                                 (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))
                                 (|:| |xOffset| (|Integer|))
                                 (|:| |yOffset| (|Integer|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|))))))))
      $)))) 

(MAKEPROP '|WeightedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (0 . |Zero|) (|List| 6) |WGRPH;weightedGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 27) (|:| |posY| 27)
                        (|:| |weight| 7))
              (|List| 12) |WGRPH;weightedGraph;L$;2|
              (|Record| (|:| |name| 40) (|:| |weight| 7) (|:| |fromOb| 27)
                        (|:| |toOb| 27) (|:| |xOffset| 25) (|:| |yOffset| 25)
                        (|:| |map| 30))
              (|List| 15) |WGRPH;weightedGraph;LL$;3| (4 . |concat|)
              (10 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 27) (|:| |posY| 27))
              (|List| 20)
              (|Record| (|:| |name| 40) (|:| |arrType| 27) (|:| |fromOb| 27)
                        (|:| |toOb| 27) (|:| |xOffset| 25) (|:| |yOffset| 25)
                        (|:| |map| 30))
              (|List| 22) |WGRPH;weightedGraph;LL$;4| (|Integer|) (16 . |elt|)
              (|NonNegativeInteger|) (22 . |createX|) (28 . |createY|)
              (|List| 27) (|List| 30) (34 . |elt|) (40 . |#|) (45 . |elt|)
              |WGRPH;weightedGraph;LL$;5| (|Boolean|) (51 . =)
              |WGRPH;addObject!;$S$;6| |WGRPH;addObject!;$R$;7| (|String|)
              |WGRPH;addWArrow!;$S2NniW$;9| |WGRPH;addArrow!;$S2Nni$;8|
              (57 . =) (63 . |concat|) |WGRPH;getVertices;$L;10|
              (69 . |concat|) |WGRPH;getArrows;$L;11| |WGRPH;initial;$;12|
              |WGRPH;terminal;S$;13| (75 . <=) |WGRPH;cycleOpen;LS$;14|
              |WGRPH;cycleClosed;LS$;15| |WGRPH;unit;LS$;16| (81 . ~=)
              |WGRPH;kgraph;LS$;17| (87 . |concat|) (93 . |concat|)
              |WGRPH;+;3$;18| (99 . |position|) (105 . |concat|)
              |WGRPH;merge;3$;19| (111 . |diagramWidth|)
              (116 . |diagramHeight|) (|Product| 6 6) (121 . |construct|)
              (|Record| (|:| |value| 64) (|:| |posX| 27) (|:| |posY| 27)
                        (|:| |weight| 7))
              (|List| 66) (127 . |concat|) (133 . |isDirectSuccessor?|)
              (140 . |arrowName|) (|List| $) (147 . |concat|)
              (|WeightedGraph| 64 7) (152 . |weightedGraph|) |WGRPH;*;2$Wg;22|
              |WGRPH;cartesian;2$Wg;23| (|Mapping| 6 6 6)
              |WGRPH;closedTensor;2$M$;25| |WGRPH;closedCartesian;2$M$;26|
              (158 . |elt|) (164 . |setelt|) |WGRPH;map;$LL2I$;27|
              |WGRPH;mapContra;$LL2I$;28| (171 . >) (177 . =) (183 . ~=)
              |WGRPH;routeNodeWeight;$LW;35| (189 . <)
              |WGRPH;routeNodes;$2NniL;30| (195 . |getArrowIndex|)
              |WGRPH;routeArrowWeight;$LW;36| |WGRPH;routeArrows;$2NniL;32|
              (|Union| 7 '"disjoint") |WGRPH;distanceWeighted;$2NniU;33|
              (202 . +) (208 . |elt|) (|TwoDimensionalArray| 93) (214 . |new|)
              |WGRPH;weightedDistanceMatrix;$Tda;37| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 25) (|Matrix| 27)
              (|List| (|Loop|)) (|List| 106) (|Tree| 25) (|DirectedGraph| $)
              (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 221 |weightedGraph| 227 |weightedDistanceMatrix| 255 |unit|
              260 |terminal| 266 |subdiagramSvg| 271 |spanningTreeNode| 279
              |spanningTreeArrow| 285 |spanningForestNode| 291
              |spanningForestArrow| 296 |routeNodes| 301 |routeNodeWeight| 308
              |routeArrows| 314 |routeArrowWeight| 321 |outDegree| 327
              |nodeToNode| 333 |nodeToArrow| 339 |nodeFromNode| 345
              |nodeFromArrow| 351 |min| 357 |merge| 368 |max| 374 |mapContra|
              385 |map| 394 |looseEquals| 403 |loopsNodes| 409 |loopsAtNode|
              414 |loopsArrows| 420 |latex| 425 |laplacianMatrix| 430 |kgraph|
              435 |isGreaterThan?| 441 |isFunctional?| 448 |isFixPoint?| 453
              |isDirected?| 459 |isDirectSuccessor?| 463 |isAcyclic?| 470
              |initial| 475 |incidenceMatrix| 479 |inDegree| 484 |hashUpdate!|
              490 |hash| 496 |getVertices| 501 |getVertexIndex| 506 |getArrows|
              512 |getArrowIndex| 517 |flatten| 524 |distanceWeighted| 529
              |distanceMatrix| 536 |distance| 541 |diagramWidth| 548
              |diagramSvg| 553 |diagramHeight| 560 |deepDiagramSvg| 565
              |cycleOpen| 572 |cycleClosed| 578 |createY| 584 |createX| 590
              |createWidth| 596 |coerce| 601 |closedTensor| 611
              |closedCartesian| 618 |cartesian| 625 |arrowsToNode| 631
              |arrowsToArrow| 637 |arrowsFromNode| 643 |arrowsFromArrow| 649
              |arrowName| 655 |adjacencyMatrix| 662 |addWArrow!| 667
              |addObject!| 676 |addArrow!| 688 = 713 + 719 * 725)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 109) (|BasicType|))
                        (|makeByteWordVec2| 110
                                            '(0 7 0 9 2 16 0 0 15 18 2 13 0 0
                                              12 19 2 10 6 0 25 26 2 0 27 27 27
                                              28 2 0 27 27 27 29 2 31 30 0 25
                                              32 1 30 27 0 33 2 30 27 0 25 34 2
                                              13 36 0 0 37 2 16 36 0 0 43 2 21
                                              0 0 20 44 2 23 0 0 22 46 2 27 36
                                              0 0 50 2 27 36 0 0 54 2 13 0 0 0
                                              56 2 16 0 0 0 57 2 13 25 12 0 59
                                              2 30 0 0 27 60 1 0 27 0 62 1 0 27
                                              0 63 2 64 0 6 6 65 2 67 0 0 66 68
                                              3 0 36 0 27 27 69 3 0 40 0 27 27
                                              70 1 40 0 71 72 2 73 0 67 16 74 2
                                              13 12 0 25 80 3 13 12 0 25 12 81
                                              2 27 36 0 0 84 2 30 36 0 0 85 2
                                              30 36 0 0 86 2 7 36 0 0 88 3 0 27
                                              0 27 27 90 2 7 0 0 0 95 2 16 15 0
                                              25 96 3 97 0 27 27 93 98 2 0 36 0
                                              0 1 2 0 0 10 31 35 2 0 0 13 16 17
                                              2 0 0 21 23 24 1 0 0 13 14 1 0 0
                                              10 11 1 0 97 0 99 2 0 0 10 40 53
                                              1 0 0 6 49 4 0 100 101 0 36 36 1
                                              2 0 106 0 27 1 2 0 106 0 27 1 1 0
                                              105 0 1 1 0 105 0 1 3 0 30 0 27
                                              27 89 2 0 7 0 30 87 3 0 30 0 27
                                              27 92 2 0 7 0 30 91 2 0 27 0 27 1
                                              2 0 30 0 27 1 2 0 30 0 27 1 2 0
                                              30 0 27 1 2 0 30 0 27 1 2 0 27 0
                                              30 1 1 0 27 0 1 2 0 0 0 0 61 2 0
                                              27 0 30 1 1 0 27 0 1 5 0 0 0 30
                                              10 25 25 83 5 0 0 0 30 10 25 25
                                              82 2 0 36 0 0 1 1 0 104 0 1 2 0
                                              104 0 27 1 1 0 104 0 1 1 0 40 0 1
                                              1 0 102 0 1 2 0 0 10 40 55 3 0 36
                                              0 27 27 1 1 0 36 0 1 2 0 36 0 27
                                              1 0 0 36 1 3 0 36 0 27 27 69 1 0
                                              36 0 1 0 0 0 48 1 0 102 0 1 2 0
                                              27 0 27 1 2 0 110 110 0 1 1 0 108
                                              0 1 1 0 21 0 45 2 0 27 0 6 1 1 0
                                              23 0 47 3 0 27 0 27 27 90 1 0 0
                                              107 1 3 0 93 0 27 27 94 1 0 102 0
                                              1 3 0 25 0 27 27 1 1 0 27 0 62 3
                                              0 100 40 0 36 1 1 0 27 0 63 3 0
                                              100 40 0 36 1 2 0 0 10 40 51 2 0
                                              0 10 40 52 2 0 27 27 27 29 2 0 27
                                              27 27 28 1 0 27 27 1 1 0 109 0 1
                                              1 0 109 0 1 3 0 0 0 0 77 78 3 0 0
                                              0 0 77 79 2 0 73 0 0 76 2 0 30 0
                                              27 1 2 0 30 0 27 1 2 0 30 0 27 1
                                              2 0 30 0 27 1 3 0 40 0 27 27 70 1
                                              0 103 0 1 5 0 0 0 40 27 27 7 41 2
                                              0 0 0 20 39 2 0 0 0 6 38 4 0 0 0
                                              40 6 6 1 4 0 0 0 40 27 27 42 5 0
                                              0 0 40 27 27 30 1 2 0 36 0 0 1 2
                                              0 0 0 0 58 2 0 73 0 0 75)))))
           '|lookupComplete|)) 
