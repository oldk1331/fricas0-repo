
(/VERSIONCHECK 2) 

(DEFUN |DGRPH;directedGraph;L$;1| (|ob| $)
  (PROG (|objs| #1=#:G153 |x| #2=#:G152)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|DGRPH;directedGraph;L$;1|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (CONS |objs| NIL)))))) 

(PUT '|DGRPH;directedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(DEFUN |DGRPH;directedGraph;L$;2| (|ob| $) (CONS |ob| NIL)) 

(PUT '|DGRPH;directedGraph;LL$;3| '|SPADreplace| 'CONS) 

(DEFUN |DGRPH;directedGraph;LL$;3| (|ob| |ar| $) (CONS |ob| |ar|)) 

(DEFUN |DGRPH;directedGraph;LL$;4| (|objs| |am| $)
  (PROG (|ar| |a| #1=#:G177 |j| #2=#:G176 |i| |obs| |o| |ob| #3=#:G175 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|DGRPH;directedGraph;LL$;4|))
          (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
               (COND ((|greater_SI| |obn| #3#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 17)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)))
               (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |ar| NIL . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #2# (LENGTH |am|) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #4#)
                      (LETT #1#
                            (SPADCALL (SPADCALL |am| |i| (QREFELT $ 24))
                                      (QREFELT $ 25))
                            . #4#)
                      G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |am| |i| (QREFELT $ 24)) |j|
                                     (QREFELT $ 26))
                           1)
                          (SEQ (LETT |a| (VECTOR "a" 0 |i| |j| 0 0) . #4#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 27))
                                      . #4#)))))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ar|)))))) 

(DEFUN |DGRPH;directedGraph;L$;5| (|perms| $)
  (PROG (|ars| |a| #1=#:G313 |arrNum| |verts| |o| #2=#:G311 |vert| #3=#:G312
         |i| #4=#:G288 #5=#:G287 |pout| |pin| #6=#:G310 |pt| |preim| |im| |lr|
         #7=#:G308 |perm| #8=#:G309 |pi| |tab| #9=#:G307 #10=#:G306 #11=#:G305
         |b| #12=#:G304 |obs| #13=#:G303 |v| #14=#:G301 #15=#:G302 |px|)
    (RETURN
     (SEQ (LETT |obs| NIL . #16=(|DGRPH;directedGraph;L$;5|))
          (SEQ (LETT |px| 1 . #16#) (LETT #15# (LENGTH |perms|) . #16#)
               (LETT |perm| NIL . #16#) (LETT #14# |perms| . #16#) G190
               (COND
                ((OR (ATOM #14#) (PROGN (LETT |perm| (CAR #14#) . #16#) NIL)
                     (|greater_SI| |px| #15#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 31)) . #16#)
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
                                    ((< (SPADCALL |v| |obs| (QREFELT $ 33)) 1)
                                     (LETT |obs|
                                           (SPADCALL |obs| |v| (QREFELT $ 34))
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
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 31)) . #16#)
                    (LETT |im| (QCDR |lr|) . #16#)
                    (LETT |preim| (QCAR |lr|) . #16#)
                    (EXIT
                     (SEQ (LETT |pt| 1 . #16#) (LETT #6# (LENGTH |im|) . #16#)
                          G190 (COND ((|greater_SI| |pt| #6#) (GO G191)))
                          (SEQ
                           (LETT |pin|
                                 (SPADCALL (SPADCALL |im| |pt| (QREFELT $ 17))
                                           |obs| (QREFELT $ 33))
                                 . #16#)
                           (LETT |pout|
                                 (SPADCALL
                                  (SPADCALL |preim| |pt| (QREFELT $ 17)) |obs|
                                  (QREFELT $ 33))
                                 . #16#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL |tab|
                                       (PROG1 (LETT #5# |pin| . #16#)
                                         (|check_subtype| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          #5#))
                                       (QREFELT $ 24))
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
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 19))
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 20)))
                      . #16#)
                (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 21)) . #16#)
                (EXIT
                 (SEQ (LETT |arrNum| NIL . #16#)
                      (LETT #1# (SPADCALL |tab| |i| (QREFELT $ 24)) . #16#)
                      G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |arrNum| (CAR #1#) . #16#) NIL))
                        (GO G191)))
                      (SEQ (LETT |a| (VECTOR "a" 0 |i| |arrNum| 0 0) . #16#)
                           (EXIT
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 27))
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
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
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
             (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 21)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |DGRPH;addArrow!;$S2Nni$;8| (|s| |nm| |n1| |n2| $)
  (PROG (#1=#:G327 |arrs| |a| |arrss|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arrss| (QCDR |s|) . #2=(|DGRPH;addArrow!;$S2Nni$;8|))
            (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0) . #2#)
            (EXIT
             (COND
              ((SPADCALL |arrss| NIL (QREFELT $ 42))
               (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))
              ('T
               (SEQ (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 27)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(PUT '|DGRPH;getVertices;$L;9| '|SPADreplace| 'QCAR) 

(DEFUN |DGRPH;getVertices;$L;9| (|s| $) (QCAR |s|)) 

(PUT '|DGRPH;getArrows;$L;10| '|SPADreplace| 'QCDR) 

(DEFUN |DGRPH;getArrows;$L;10| (|s| $) (QCDR |s|)) 

(PUT '|DGRPH;initial;$;11| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(DEFUN |DGRPH;initial;$;11| ($) (CONS NIL NIL)) 

(DEFUN |DGRPH;terminal;S$;12| (|a| $)
  (PROG (|ar| |o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|DGRPH;terminal;S$;12|))
          (LETT |ar| (VECTOR "loop" 0 1 1 0 0) . #1#)
          (EXIT (CONS (LIST |o|) (LIST |ar|))))))) 

(DEFUN |DGRPH;cycleOpen;LS$;13| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| #1=#:G348 |ob| #2=#:G349 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;cycleOpen;LS$;13|))
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
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 19))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 20)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #3#)
                (LETT |next| (+ |obn| 1) . #3#)
                (COND
                 ((EQL (- |next| 1) (LENGTH |objs|))
                  (LETT |next| |obn| . #3#)))
                (EXIT
                 (COND
                  ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 49))
                   (SEQ
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |next| 0 0)
                          . #3#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 27)) . #3#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;cycleClosed;LS$;14| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |next| |obs| |o| #1=#:G359 |ob| #2=#:G360 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;cycleClosed;LS$;14|))
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
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 19))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 20)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #3#)
                (LETT |next| (+ |obn| 1) . #3#)
                (COND
                 ((EQL (- |next| 1) (LENGTH |objs|)) (LETT |next| 1 . #3#)))
                (EXIT
                 (COND
                  ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 49))
                   (SEQ
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |next| 0 0)
                          . #3#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 27)) . #3#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;unit;LS$;15| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| |obs| |o| #1=#:G367 |ob| #2=#:G368 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #3=(|DGRPH;unit;LS$;15|)) (LETT |ars| NIL . #3#)
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
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 19))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 20)))
                      . #3#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #3#)
                (LETT |a|
                      (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0 |obn|
                              |obn| 0 0)
                      . #3#)
                (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 27)) . #3#)
                (EXIT (LETT |arn| (+ |arn| 1) . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |obn| (|inc_SI| |obn|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;kgraph;LS$;16| (|objs| |arrowName| $)
  (PROG (|arn| |ars| |a| #1=#:G380 |obm| |obs| |o| #2=#:G378 |ob| #3=#:G379
         |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|DGRPH;kgraph;LS$;16|)) (LETT |ars| NIL . #4#)
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
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 19))
                              (SPADCALL (LENGTH |objs|) |obn| (QREFELT $ 20)))
                      . #4#)
                (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)
                (EXIT
                 (SEQ (LETT |obm| 1 . #4#) (LETT #1# (LENGTH |objs|) . #4#)
                      G190 (COND ((|greater_SI| |obm| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |obn| |obm| (QREFELT $ 53))
                          (SEQ
                           (LETT |a|
                                 (VECTOR
                                  (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obm| 0 0)
                                 . #4#)
                           (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 27))
                                 . #4#)
                           (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                      (LETT |obm| (|inc_SI| |obm|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #2# (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |ars|)))))) 

(DEFUN |DGRPH;+;3$;17| (|a| |b| $)
  (PROG (|la| |lb| |arr| #1=#:G388 |ba| |bStart| |lo|)
    (RETURN
     (SEQ
      (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 55))
            . #2=(|DGRPH;+;3$;17|))
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
                          (QVELT |ba| 5))
                  . #2#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 27)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 56)) . #2#)
      (EXIT (CONS |lo| |la|)))))) 

(DEFUN |DGRPH;merge;3$;18| (|a| |b| $)
  (PROG (|la| |lb| |arr| |fromI| |toI| #1=#:G408 |ba| |bStart| |bmap| #2=#:G396
         |newIndex| |mergedObjects| |i| #3=#:G407 |bob| #4=#:G406 |x|
         #5=#:G405)
    (RETURN
     (SEQ
      (LETT |bmap|
            (PROGN
             (LETT #5# NIL . #6=(|DGRPH;merge;3$;18|))
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
           (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 58)) . #6#)
                (EXIT
                 (COND
                  ((< |i| 1)
                   (SEQ
                    (LETT |mergedObjects|
                          (SPADCALL |mergedObjects| |bob| (QREFELT $ 21))
                          . #6#)
                    (LETT |newIndex| (+ |newIndex| 1) . #6#)
                    (EXIT
                     (LETT |bmap| (SPADCALL |bmap| |newIndex| (QREFELT $ 59))
                           . #6#))))
                  ('T
                   (LETT |bmap|
                         (SPADCALL |bmap|
                                   (PROG1 (LETT #2# |i| . #6#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 59))
                         . #6#)))))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |bStart| (LENGTH (QCAR |a|)) . #6#) (LETT |lb| NIL . #6#)
      (SEQ (LETT |ba| NIL . #6#) (LETT #1# (QCDR |b|) . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ba| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (LETT |toI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|) (QREFELT $ 26))
                  . #6#)
            (LETT |fromI|
                  (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|) (QREFELT $ 26))
                  . #6#)
            (LETT |arr|
                  (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                          (QVELT |ba| 4) (QVELT |ba| 5))
                  . #6#)
            (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 27)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 56)) . #6#)
      (EXIT (CONS |mergedObjects| |la|)))))) 

(DEFUN |DGRPH;objProd| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G419 |boi| |ayi| |axi| |ai| #2=#:G418 |aoi|)
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 61)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 62)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 61))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 62))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 64))
                                     . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 67))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |DGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G420)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |DGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |DGRPH;*;2$Dg;21| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G442 |bv| #2=#:G441 |bu| #3=#:G440 |av|
         #4=#:G439 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;*;2$Dg;21|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 68))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 69))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 69)))
                                                  (QREFELT $ 71))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 73))))))) 

(DEFUN |DGRPH;cartesian;2$Dg;22| (|a| |b| $)
  (PROG (|newArrs| |arr| |an| #1=#:G467 |bv| #2=#:G466 |bu| #3=#:G465 |av|
         #4=#:G464 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;cartesian;2$Dg;22|))
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
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 68))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       #6="#"
                                                       (|mathObject2String|
                                                        |bv|))
                                                      (QREFELT $ 71)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7="#"
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 69))
                                                     #7#
                                                     (|mathObject2String|
                                                      |av|))
                                                    (QREFELT $ 71))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 68))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          68))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         #6#
                                                         (|mathObject2String|
                                                          |bv|))
                                                        (QREFELT $ 71)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            69))
                                                         #7#
                                                         (|mathObject2String|
                                                          |av|))
                                                        (QREFELT $ 71)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7#
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|DGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|DGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 27))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 68))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       #6#
                                                       (|mathObject2String|
                                                        |bv|))
                                                      (QREFELT $ 71)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7#
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 69))
                                                     #7#
                                                     (|mathObject2String|
                                                      |av|))
                                                    (QREFELT $ 71))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
                                                  . #5#)))))))))
                                    (LETT |bv| (|inc_SI| |bv|) . #5#) (GO G190)
                                    G191 (EXIT NIL))))
                             (LETT |bu| (|inc_SI| |bu|) . #5#) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |av| (|inc_SI| |av|) . #5#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |au| (|inc_SI| |au|) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs| (QREFELT $ 73))))))) 

(DEFUN |DGRPH;closedObjProd| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |heighta| |widtha| |y| |x| |byi| |bxi| |bi|
         #1=#:G476 |boi| |ayi| |axi| |ai| #2=#:G475 |aoi|)
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 61)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 62)))
                                        |ayi|)
                                     . #3#)
                               (LETT |widtha| (SPADCALL |a| (QREFELT $ 61))
                                     . #3#)
                               (LETT |heighta| (SPADCALL |a| (QREFELT $ 62))
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 21))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |newObjs|))))) 

(DEFUN |DGRPH;closedTensor;2$M$;24| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G497 |bv| #2=#:G496 |bu| #3=#:G495 |av|
         #4=#:G494 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;closedTensor;2$M$;24|))
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
                                       ((SPADCALL |a| |au| |av| (QREFELT $ 68))
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |a| |au| |av|
                                                             (QREFELT $ 69))
                                                   "*"
                                                   (SPADCALL |b| |bu| |bv|
                                                             (QREFELT $ 69)))
                                                  (QREFELT $ 71))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
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
                     (QREFELT $ 15))))))) 

(DEFUN |DGRPH;closedCartesian;2$M$;25| (|a| |b| |f| $)
  (PROG (|newArrs| |arr| |an| #1=#:G523 |bv| #2=#:G522 |bu| #3=#:G521 |av|
         #4=#:G520 |au|)
    (RETURN
     (SEQ (LETT |newArrs| NIL . #5=(|DGRPH;closedCartesian;2$M$;25|))
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
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 68))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       #6="#"
                                                       (|mathObject2String|
                                                        |bv|))
                                                      (QREFELT $ 71)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7="#"
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 69))
                                                     #7#
                                                     (|mathObject2String|
                                                      |av|))
                                                    (QREFELT $ 71))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
                                                  . #5#))))
                                         ((EQL |au| |av|)
                                          (COND
                                           ((SPADCALL |b| |bu| |bv|
                                                      (QREFELT $ 68))
                                            (SEQ
                                             (LETT |an|
                                                   (COND
                                                    ((EQL |bu| |bv|)
                                                     (COND
                                                      ((SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          68))
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            69))
                                                         #6#
                                                         (|mathObject2String|
                                                          |bv|))
                                                        (QREFELT $ 71)))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            69))
                                                         #7#
                                                         (|mathObject2String|
                                                          |av|))
                                                        (QREFELT $ 71)))))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7#
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71))))
                                                   . #5#)
                                             (LETT |arr|
                                                   (VECTOR |an| 0
                                                           (|DGRPH;indexProd|
                                                            |b| |bu| |au| $)
                                                           (|DGRPH;indexProd|
                                                            |b| |bv| |av| $)
                                                           0 0)
                                                   . #5#)
                                             (EXIT
                                              (LETT |newArrs|
                                                    (SPADCALL |newArrs| |arr|
                                                              (QREFELT $ 27))
                                                    . #5#))))))))
                                       ((EQL |au| |av|)
                                        (COND
                                         ((SPADCALL |b| |bu| |bv|
                                                    (QREFELT $ 68))
                                          (SEQ
                                           (LETT |an|
                                                 (COND
                                                  ((EQL |bu| |bv|)
                                                   (COND
                                                    ((SPADCALL |a| |au| |av|
                                                               (QREFELT $ 68))
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          69))
                                                       #6#
                                                       (|mathObject2String|
                                                        |bv|))
                                                      (QREFELT $ 71)))
                                                    ('T
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          69))
                                                       #7#
                                                       (|mathObject2String|
                                                        |av|))
                                                      (QREFELT $ 71)))))
                                                  ('T
                                                   (SPADCALL
                                                    (LIST
                                                     (SPADCALL |b| |bu| |bv|
                                                               (QREFELT $ 69))
                                                     #7#
                                                     (|mathObject2String|
                                                      |av|))
                                                    (QREFELT $ 71))))
                                                 . #5#)
                                           (LETT |arr|
                                                 (VECTOR |an| 0
                                                         (|DGRPH;indexProd| |b|
                                                          |bu| |au| $)
                                                         (|DGRPH;indexProd| |b|
                                                          |bv| |av| $)
                                                         0 0)
                                                 . #5#)
                                           (EXIT
                                            (LETT |newArrs|
                                                  (SPADCALL |newArrs| |arr|
                                                            (QREFELT $ 27))
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
                     (QREFELT $ 15))))))) 

(DEFUN |DGRPH;~;2$;26| (|s| $)
  (PROG (|newArrs| |newArr| #1=#:G534 |j| #2=#:G533 |i| |ars| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #3=(|DGRPH;~;2$;26|))
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
                         ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 68)))
                          (SEQ
                           (LETT |newArr|
                                 (VECTOR
                                  (STRCONC (STRINGIMAGE |i|) (STRINGIMAGE |j|))
                                  0 |i| |j| 0 0)
                                 . #3#)
                           (EXIT
                            (LETT |newArrs|
                                  (SPADCALL |newArrs| |newArr| (QREFELT $ 27))
                                  . #3#)))))))
                      (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |obs| |newArrs|)))))) 

(DEFUN |DGRPH;map;$LL2I$;27| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G551 |oldArrow| #2=#:G539 #3=#:G538 |i|
         #4=#:G550 |oi| |newObjs| #5=#:G549 |o| #6=#:G548)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|DGRPH;map;$LL2I$;27|))
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
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 26)) . #7#)
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
                                               '(|NonNegativeInteger|) #2#)))
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
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 26))
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 26))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 27))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |DGRPH;mapContra;$LL2I$;28| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|newArrs| |newArr| #1=#:G568 |oldArrow| #2=#:G556 #3=#:G555 |i|
         #4=#:G567 |oi| |newObjs| #5=#:G566 |o| #6=#:G565)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|DGRPH;mapContra;$LL2I$;28|))
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
           (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 26)) . #7#)
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
                                               '(|NonNegativeInteger|) #2#)))
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
                          (SPADCALL |m| (QVELT |oldArrow| 3) (QREFELT $ 26))
                          (SPADCALL |m| (QVELT |oldArrow| 2) (QREFELT $ 26))
                          (QVELT |oldArrow| 4) (QVELT |oldArrow| 5))
                  . #7#)
            (EXIT
             (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 27))
                   . #7#)))
           (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS |newObjs| |newArrs|)))))) 

(DEFUN |DGRPH;coerce;Pg$;29| (|pg| $)
  (SPADCALL (SPADCALL |pg| (QREFELT $ 85)) (QREFELT $ 37))) 

(DEFUN |DirectedGraph| (#1=#:G570)
  (PROG ()
    (RETURN
     (PROG (#2=#:G571)
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
      (LETT $ (GETREFV 95) . #1#)
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
                                 (|:| |yOffset| (|Integer|)))))))
      $)))) 

(MAKEPROP '|DirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |DGRPH;directedGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 10) |DGRPH;directedGraph;L$;2|
              (|Record| (|:| |name| 43) (|:| |arrType| 18) (|:| |fromOb| 18)
                        (|:| |toOb| 18) (|:| |xOffset| 16) (|:| |yOffset| 16))
              (|List| 13) |DGRPH;directedGraph;LL$;3| (|Integer|) (0 . |elt|)
              (|NonNegativeInteger|) (6 . |createX|) (12 . |createY|)
              (18 . |concat|) (|List| 18) (|List| 22) (24 . |elt|) (30 . |#|)
              (35 . |elt|) (41 . |concat|) |DGRPH;directedGraph;LL$;4|
              (|Record| (|:| |preimage| 8) (|:| |image| 8)) (|Permutation| 6)
              (47 . |listRepresentation|) (52 . |One|) (56 . |position|)
              (62 . |concat|) (68 . |setelt|) (|List| 30)
              |DGRPH;directedGraph;L$;5| (|Boolean|) (75 . =)
              |DGRPH;addObject!;$S$;6| |DGRPH;addObject!;$R$;7| (81 . =)
              (|String|) |DGRPH;addArrow!;$S2Nni$;8| |DGRPH;getVertices;$L;9|
              |DGRPH;getArrows;$L;10| |DGRPH;initial;$;11|
              |DGRPH;terminal;S$;12| (87 . <=) |DGRPH;cycleOpen;LS$;13|
              |DGRPH;cycleClosed;LS$;14| |DGRPH;unit;LS$;15| (93 . ~=)
              |DGRPH;kgraph;LS$;16| (99 . |concat|) (105 . |concat|)
              |DGRPH;+;3$;17| (111 . |position|) (117 . |concat|)
              |DGRPH;merge;3$;18| (123 . |diagramWidth|)
              (128 . |diagramHeight|) (|Product| 6 6) (133 . |construct|)
              (|Record| (|:| |value| 63) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 65) (139 . |concat|) (145 . |isDirectSuccessor?|)
              (152 . |arrowName|) (|List| $) (159 . |concat|)
              (|DirectedGraph| 63) (164 . |directedGraph|) |DGRPH;*;2$Dg;21|
              |DGRPH;cartesian;2$Dg;22| (|Mapping| 6 6 6)
              |DGRPH;closedTensor;2$M$;24| |DGRPH;closedCartesian;2$M$;25|
              |DGRPH;~;2$;26| (170 . |elt|) (176 . |setelt|)
              |DGRPH;map;$LL2I$;27| |DGRPH;mapContra;$LL2I$;28|
              (|PermutationGroup| 6) (183 . |coerce|) |DGRPH;coerce;Pg$;29|
              (|Void|) (|Matrix| 16) (|Matrix| 18) (|List| (|Loop|))
              (|List| 92) (|Tree| 16) (|OutputForm|) (|SingleInteger|))
           '#(~= 188 ~ 194 |unit| 199 |toString| 205 |terminal| 210
              |spanningTreeNode| 215 |spanningTreeArrow| 221
              |spanningForestNode| 227 |spanningForestArrow| 232 |routeNodes|
              237 |routeArrows| 244 |outDegree| 251 |nodeToNode| 257
              |nodeToArrow| 263 |nodeFromNode| 269 |nodeFromArrow| 275 |min|
              281 |merge| 292 |max| 298 |mapContra| 309 |map| 318 |looseEquals|
              327 |loopsNodes| 333 |loopsAtNode| 338 |loopsArrows| 344 |latex|
              349 |laplacianMatrix| 354 |kgraph| 359 |isGreaterThan?| 365
              |isFunctional?| 372 |isFixPoint?| 377 |isDirected?| 383
              |isDirectSuccessor?| 387 |isAcyclic?| 394 |initial| 399
              |incidenceMatrix| 403 |inDegree| 408 |hash| 414 |getVertices| 419
              |getVertexIndex| 424 |getArrows| 430 |getArrowIndex| 435
              |distanceMatrix| 442 |distance| 447 |directedGraph| 454
              |diagramWidth| 481 |diagramSvg| 486 |diagramHeight| 493
              |cycleOpen| 498 |cycleClosed| 504 |createY| 510 |createX| 516
              |createWidth| 522 |coerce| 527 |closedTensor| 542
              |closedCartesian| 549 |cartesian| 556 |arrowsToNode| 562
              |arrowsToArrow| 568 |arrowsFromNode| 574 |arrowsFromArrow| 580
              |arrowName| 586 |adjacencyMatrix| 593 |addObject!| 598
              |addArrow!| 610 = 626 + 632 * 638)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 93)
                           (|BasicType|))
                        (|makeByteWordVec2| 94
                                            '(2 8 6 0 16 17 2 0 18 18 18 19 2 0
                                              18 18 18 20 2 11 0 0 10 21 2 23
                                              22 0 16 24 1 22 18 0 25 2 22 18 0
                                              16 26 2 14 0 0 13 27 1 30 29 0 31
                                              0 30 0 32 2 8 16 6 0 33 2 8 0 0 6
                                              34 3 22 18 0 16 18 35 2 11 38 0 0
                                              39 2 14 38 0 0 42 2 18 38 0 0 49
                                              2 18 38 0 0 53 2 11 0 0 0 55 2 14
                                              0 0 0 56 2 11 16 10 0 58 2 22 0 0
                                              18 59 1 0 18 0 61 1 0 18 0 62 2
                                              63 0 6 6 64 2 66 0 0 65 67 3 0 38
                                              0 18 18 68 3 0 43 0 18 18 69 1 43
                                              0 70 71 2 72 0 66 14 73 2 11 10 0
                                              16 80 3 11 10 0 16 10 81 1 84 36
                                              0 85 2 0 38 0 0 1 1 0 0 0 79 2 0
                                              0 8 43 52 1 0 43 0 1 1 0 0 6 48 2
                                              0 92 0 18 1 2 0 92 0 18 1 1 0 91
                                              0 1 1 0 91 0 1 3 0 22 0 18 18 1 3
                                              0 22 0 18 18 1 2 0 18 0 18 1 2 0
                                              22 0 18 1 2 0 22 0 18 1 2 0 22 0
                                              18 1 2 0 22 0 18 1 1 0 18 0 1 2 0
                                              18 0 22 1 2 0 0 0 0 60 2 0 18 0
                                              22 1 1 0 18 0 1 5 0 0 0 22 8 16
                                              16 83 5 0 0 0 22 8 16 16 82 2 0
                                              38 0 0 1 1 0 90 0 1 2 0 90 0 18 1
                                              1 0 90 0 1 1 0 43 0 1 1 0 88 0 1
                                              2 0 0 8 43 54 3 0 38 0 18 18 1 1
                                              0 38 0 1 2 0 38 0 18 1 0 0 38 1 3
                                              0 38 0 18 18 68 1 0 38 0 1 0 0 0
                                              47 1 0 88 0 1 2 0 18 0 18 1 1 0
                                              94 0 1 1 0 11 0 45 2 0 18 0 6 1 1
                                              0 14 0 46 3 0 18 0 18 18 1 1 0 88
                                              0 1 3 0 16 0 18 18 1 1 0 0 36 37
                                              2 0 0 11 14 15 2 0 0 8 23 28 1 0
                                              0 8 9 1 0 0 11 12 1 0 18 0 61 3 0
                                              87 43 0 38 1 1 0 18 0 62 2 0 0 8
                                              43 50 2 0 0 8 43 51 2 0 18 18 18
                                              20 2 0 18 18 18 19 1 0 18 18 1 1
                                              0 0 84 86 1 0 93 0 1 1 0 93 0 1 3
                                              0 0 0 0 76 77 3 0 0 0 0 76 78 2 0
                                              72 0 0 75 2 0 22 0 18 1 2 0 22 0
                                              18 1 2 0 22 0 18 1 2 0 22 0 18 1
                                              3 0 43 0 18 18 69 1 0 89 0 1 2 0
                                              0 0 10 41 2 0 0 0 6 40 4 0 0 0 43
                                              18 18 44 4 0 0 0 43 6 6 1 2 0 38
                                              0 0 1 2 0 0 0 0 57 2 0 72 0 0
                                              74)))))
           '|lookupComplete|)) 
