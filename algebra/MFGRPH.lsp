
(/VERSIONCHECK 2) 

(DEFUN |MFGRPH;multifunctionGraph;L$;1| (|ob| $)
  (PROG (|objs| #1=#:G140 |x| #2=#:G139)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|MFGRPH;multifunctionGraph;L$;1|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (VECTOR |x| 0 0 (LIST 1)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(PUT '|MFGRPH;multifunctionGraph;L$;2| '|SPADreplace| 'LIST) 

(DEFUN |MFGRPH;multifunctionGraph;L$;2| (|ob| $) (LIST |ob|)) 

(DEFUN |MFGRPH;multifunctionGraph;LL$;3| (|ob| |ar| $)
  (PROG (|fobs| |fo| |f| #1=#:G164 |fn| |too| |fromo| #2=#:G163 |a| |arrs|
         #3=#:G162 |x| #4=#:G161)
    (RETURN
     (SEQ
      (LETT |arrs|
            (PROGN
             (LETT #4# NIL . #5=(|MFGRPH;multifunctionGraph;LL$;3|))
             (SEQ (LETT |x| 1 . #5#) (LETT #3# (LENGTH |ob|) . #5#) G190
                  (COND ((|greater_SI| |x| #3#) (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS |x| #4#) . #5#)))
                  (LETT |x| (|inc_SI| |x|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (SEQ (LETT |a| NIL . #5#) (LETT #2# |ar| . #5#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #5#) NIL)) (GO G191)))
           (SEQ (LETT |fromo| (QVELT |a| 2) . #5#)
                (LETT |too| (QVELT |a| 3) . #5#)
                (EXIT (SPADCALL |arrs| |fromo| |too| (QREFELT $ 16))))
           (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
      (LETT |fobs| NIL . #5#)
      (SEQ (LETT |fn| 1 . #5#) (LETT #1# (LENGTH |ob|) . #5#) G190
           (COND ((|greater_SI| |fn| #1#) (GO G191)))
           (SEQ (LETT |f| (SPADCALL |ob| |fn| (QREFELT $ 19)) . #5#)
                (LETT |fo|
                      (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                              (LIST (SPADCALL |arrs| |fn| (QREFELT $ 20))))
                      . #5#)
                (EXIT
                 (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 21)) . #5#)))
           (LETT |fn| (|inc_SI| |fn|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |fobs|)))))) 

(DEFUN |MFGRPH;multifunctionGraph;L$;4| (|perms| $)
  (PROG (|verts| |o| #1=#:G281 |vert| #2=#:G282 |i| #3=#:G261 #4=#:G260 |pout|
         |pin| #5=#:G280 |pt| |preim| |im| |lr| #6=#:G278 |perm| #7=#:G279 |pi|
         |tab| #8=#:G277 |a| #9=#:G276 #10=#:G275 |b| #11=#:G274 |obs|
         #12=#:G273 |v| #13=#:G271 #14=#:G272 |px|)
    (RETURN
     (SEQ (LETT |obs| NIL . #15=(|MFGRPH;multifunctionGraph;L$;4|))
          (SEQ (LETT |px| 1 . #15#) (LETT #14# (LENGTH |perms|) . #15#)
               (LETT |perm| NIL . #15#) (LETT #13# |perms| . #15#) G190
               (COND
                ((OR (ATOM #13#) (PROGN (LETT |perm| (CAR #13#) . #15#) NIL)
                     (|greater_SI| |px| #14#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 27)) . #15#)
                    (LETT |im| (QCDR |lr|) . #15#)
                    (LETT |preim| (QCAR |lr|) . #15#)
                    (EXIT
                     (COND ((EQL |px| 1) (LETT |obs| |im| . #15#))
                           ('T
                            (SEQ (LETT |v| NIL . #15#) (LETT #12# |im| . #15#)
                                 G190
                                 (COND
                                  ((OR (ATOM #12#)
                                       (PROGN
                                        (LETT |v| (CAR #12#) . #15#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((< (SPADCALL |v| |obs| (QREFELT $ 29)) 1)
                                     (LETT |obs|
                                           (SPADCALL |obs| |v| (QREFELT $ 30))
                                           . #15#)))))
                                 (LETT #12# (CDR #12#) . #15#) (GO G190) G191
                                 (EXIT NIL))))))
               (LETT #13# (PROG1 (CDR #13#) (LETT |px| (|inc_SI| |px|) . #15#))
                     . #15#)
               (GO G190) G191 (EXIT NIL))
          (LETT |tab|
                (PROGN
                 (LETT #11# NIL . #15#)
                 (SEQ (LETT |b| 1 . #15#) (LETT #10# (LENGTH |obs|) . #15#)
                      G190 (COND ((|greater_SI| |b| #10#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS
                               (PROGN
                                (LETT #9# NIL . #15#)
                                (SEQ (LETT |a| 1 . #15#)
                                     (LETT #8# (LENGTH |perms|) . #15#) G190
                                     (COND ((|greater_SI| |a| #8#) (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #9# (CONS |b| #9#) . #15#)))
                                     (LETT |a| (|inc_SI| |a|) . #15#) (GO G190)
                                     G191 (EXIT (NREVERSE #9#))))
                               #11#)
                              . #15#)))
                      (LETT |b| (|inc_SI| |b|) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #11#))))
                . #15#)
          (SEQ (LETT |pi| 1 . #15#) (LETT #7# (LENGTH |perms|) . #15#)
               (LETT |perm| NIL . #15#) (LETT #6# |perms| . #15#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |perm| (CAR #6#) . #15#) NIL)
                     (|greater_SI| |pi| #7#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 27)) . #15#)
                    (LETT |im| (QCDR |lr|) . #15#)
                    (LETT |preim| (QCAR |lr|) . #15#)
                    (EXIT
                     (SEQ (LETT |pt| 1 . #15#) (LETT #5# (LENGTH |im|) . #15#)
                          G190 (COND ((|greater_SI| |pt| #5#) (GO G191)))
                          (SEQ
                           (LETT |pin|
                                 (SPADCALL (SPADCALL |im| |pt| (QREFELT $ 31))
                                           |obs| (QREFELT $ 29))
                                 . #15#)
                           (LETT |pout|
                                 (SPADCALL
                                  (SPADCALL |preim| |pt| (QREFELT $ 31)) |obs|
                                  (QREFELT $ 29))
                                 . #15#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL |tab|
                                       (PROG1 (LETT #4# |pin| . #15#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       (QREFELT $ 33))
                             |pi|
                             (PROG1 (LETT #3# |pout| . #15#)
                               (|check_subtype| (>= #3# 0)
                                                '(|NonNegativeInteger|) #3#))
                             (QREFELT $ 16))))
                          (LETT |pt| (|inc_SI| |pt|) . #15#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #6# (PROG1 (CDR #6#) (LETT |pi| (|inc_SI| |pi|) . #15#))
                     . #15#)
               (GO G190) G191 (EXIT NIL))
          (LETT |verts| NIL . #15#)
          (SEQ (LETT |i| 1 . #15#) (LETT #2# (LENGTH |obs|) . #15#)
               (LETT |vert| NIL . #15#) (LETT #1# |obs| . #15#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |vert| (CAR #1#) . #15#) NIL)
                     (|greater_SI| |i| #2#))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR |vert|
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 34))
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 35))
                              (SPADCALL |tab| |i| (QREFELT $ 33)))
                      . #15#)
                (EXIT
                 (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 21)) . #15#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #15#))
                     . #15#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |verts|)))))) 

(DEFUN |MFGRPH;addObject!;$S$;5| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|MFGRPH;addObject!;$S$;5|))
          (LETT |obj| (VECTOR |n| 0 0 (LIST (LENGTH |obs|))) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 39))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |MFGRPH;addObject!;$R$;6| (|s| |n| $)
  (SEQ (|error| "this form of addObject! not supported in multifunctionGraph")
       (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;addArrow!;$S2Nni$;7| (|s| |nm| |n1| |n2| $)
  (SEQ
   (SPADCALL (QVELT (SPADCALL (QCAR |s|) |n1| (QREFELT $ 42)) 3) 1 |n2|
             (QREFELT $ 16))
   (EXIT |s|))) 

(DEFUN |MFGRPH;getVertices;$L;8| (|s| $)
  (PROG (|res| |o| #1=#:G302 |soj|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|MFGRPH;getVertices;$L;8|))
          (SEQ (LETT |soj| NIL . #2#) (LETT #1# (QCAR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |soj| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR (QVELT |soj| 0) (QVELT |soj| 1) (QVELT |soj| 2))
                      . #2#)
                (EXIT (LETT |res| (SPADCALL |res| |o| (QREFELT $ 45)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MFGRPH;getArrows;$L;9| (|s| $)
  (PROG (|res| |a| #1=#:G313 |ar| #2=#:G314 |ai| |soj| #3=#:G312 |sojn|)
    (RETURN
     (SEQ (LETT |res| NIL . #4=(|MFGRPH;getArrows;$L;9|))
          (SEQ (LETT |sojn| 1 . #4#) (LETT #3# (LENGTH (QCAR |s|)) . #4#) G190
               (COND ((|greater_SI| |sojn| #3#) (GO G191)))
               (SEQ
                (LETT |soj| (SPADCALL (QCAR |s|) |sojn| (QREFELT $ 42)) . #4#)
                (EXIT
                 (SEQ (LETT |ai| 1 . #4#)
                      (LETT #2# (SPADCALL (QVELT |soj| 3) (QREFELT $ 47))
                            . #4#)
                      (LETT |ar| NIL . #4#) (LETT #1# (QVELT |soj| 3) . #4#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#) . #4#) NIL)
                            (|greater_SI| |ai| #2#))
                        (GO G191)))
                      (SEQ
                       (LETT |a|
                             (VECTOR
                              (STRCONC (STRINGIMAGE |sojn|) (STRINGIMAGE |ai|))
                              0 |sojn| |ar| 0 0)
                             . #4#)
                       (EXIT
                        (LETT |res| (SPADCALL |res| |a| (QREFELT $ 48))
                              . #4#)))
                      (LETT #1#
                            (PROG1 (CDR #1#) (LETT |ai| (|inc_SI| |ai|) . #4#))
                            . #4#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT |sojn| (|inc_SI| |sojn|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(PUT '|MFGRPH;initial;$;10| '|SPADreplace| '(XLAM NIL (LIST NIL))) 

(DEFUN |MFGRPH;initial;$;10| ($) (LIST NIL)) 

(DEFUN |MFGRPH;terminal;S$;11| (|a| $)
  (PROG (|o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0 (LIST 1)) |MFGRPH;terminal;S$;11|)
          (EXIT (LIST (LIST |o|))))))) 

(DEFUN |MFGRPH;cycleOpen;LS$;12| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G327 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|MFGRPH;cycleOpen;LS$;12|))
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 31)) . #2#)
                    (LETT |n| (+ |obn| 1) . #2#)
                    (COND
                     ((EQL |obn| (LENGTH |objs|))
                      (LETT |n| (LENGTH |objs|) . #2#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 35))
                                  (LIST |n|))
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |MFGRPH;cycleClosed;LS$;13| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G335 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|MFGRPH;cycleClosed;LS$;13|))
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 31)) . #2#)
                    (LETT |n| (+ |obn| 1) . #2#)
                    (COND ((EQL |obn| (LENGTH |objs|)) (LETT |n| 1 . #2#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 35))
                                  (LIST |n|))
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |MFGRPH;unit;LS$;14| (|objs| |arrowName| $)
  (PROG (#1=#:G341 |x| #2=#:G340)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|MFGRPH;unit;LS$;14|))
             (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#) G190
                  (COND ((|greater_SI| |x| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (SPADCALL |objs| |x| (QREFELT $ 31)) 0 0
                                   (LIST |x|))
                           #2#)
                          . #3#)))
                  (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(DEFUN |MFGRPH;kgraph;LS$;15| (|objs| |arrowName| $)
  (SEQ (|error| "kgraph not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;+;3$;16| (|a| |b| $)
  (PROG (|c| #1=#:G353 |x| #2=#:G352 |objs|)
    (RETURN
     (SEQ (LETT |objs| (QCAR |b|) . #3=(|MFGRPH;+;3$;16|))
          (LETT |c|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#) G190
                      (COND ((|greater_SI| |x| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 42)) 0)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 42)) 1)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 42)) 2)
                                (LIST (+ |x| (LENGTH (QCAR |a|)))))
                               #2#)
                              . #3#)))
                      (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (LIST (SPADCALL (QCAR |a|) |c| (QREFELT $ 56)))))))) 

(DEFUN |MFGRPH;merge;3$;17| (|a| |b| $)
  (SEQ (|error| "merge not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G357)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |MFGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |MFGRPH;tensorNext| (|aObj| |a| |b| $)
  (PROG (|res| |x| #1=#:G369 |j| #2=#:G368 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |a| (QREFELT $ 47)) (SPADCALL |b| (QREFELT $ 47))
                  (QREFELT $ 59))
        (|error|
         (SPADCALL
          (SPADCALL
           (LIST "tensor product with different degree a="
                 (|mathObject2String| |a|) " b=" (|mathObject2String| |b|))
           (QREFELT $ 61))
          (QREFELT $ 63)))))
      (LETT |res| NIL . #3=(|MFGRPH;tensorNext|))
      (SEQ (LETT |i| 1 . #3#) (LETT #2# (SPADCALL |a| (QREFELT $ 47)) . #3#)
           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #3#)
                  (LETT #1# (SPADCALL |b| (QREFELT $ 47)) . #3#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (LETT |x|
                         (|MFGRPH;indexProd| |aObj|
                          (SPADCALL |a| |i| (QREFELT $ 20))
                          (SPADCALL |b| |j| (QREFELT $ 20)) $)
                         . #3#)
                   (EXIT
                    (LETT |res| (SPADCALL |res| |x| (QREFELT $ 64)) . #3#)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |MFGRPH;cartesianNext| (|aObj| |a| |b| |an| |bn| $)
  (PROG (|res| |y| |x| #1=#:G376 |i|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (SPADCALL |a| (QREFELT $ 47)) (SPADCALL |b| (QREFELT $ 47))
                  (QREFELT $ 59))
        (|error|
         (SPADCALL
          (SPADCALL
           (LIST "Cartesian product with different degree a="
                 (|mathObject2String| |a|) " b=" (|mathObject2String| |b|))
           (QREFELT $ 61))
          (QREFELT $ 63)))))
      (LETT |res| NIL . #2=(|MFGRPH;cartesianNext|))
      (SEQ (LETT |i| 1 . #2#) (LETT #1# (SPADCALL |a| (QREFELT $ 47)) . #2#)
           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (LETT |x|
                  (|MFGRPH;indexProd| |aObj| (SPADCALL |a| |i| (QREFELT $ 20))
                   |bn| $)
                  . #2#)
            (LETT |res| (SPADCALL |res| |x| (QREFELT $ 64)) . #2#)
            (LETT |y|
                  (|MFGRPH;indexProd| |aObj| |an|
                   (SPADCALL |b| |i| (QREFELT $ 20)) $)
                  . #2#)
            (EXIT (LETT |res| (SPADCALL |res| |y| (QREFELT $ 64)) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |MFGRPH;*;2$Mg;21| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G387
         |boi| |ani| |ayi| |axi| |ai| #2=#:G386 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;*;2$Mg;21|))
          (SEQ (LETT |aoi| NIL . #3#) (LETT #2# (QCAR |a|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aoi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #3#)
                    (LETT |axi| (QVELT |aoi| 1) . #3#)
                    (LETT |ayi| (QVELT |aoi| 2) . #3#)
                    (LETT |ani| (QVELT |aoi| 3) . #3#)
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
                               (LETT |bni| (QVELT |boi| 3) . #3#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 65)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 66)))
                                        |ayi|)
                                     . #3#)
                               (LETT |nextA|
                                     (|MFGRPH;tensorNext| |b| |bni| |ani| $)
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 68))
                                     . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 71))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 73))))))) 

(DEFUN |MFGRPH;cartesian;2$Mg;22| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G400
         |bptr| #2=#:G401 |boi| |ani| |ayi| |axi| |ai| #3=#:G398 |aptr|
         #4=#:G399 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #5=(|MFGRPH;cartesian;2$Mg;22|))
          (SEQ (LETT |aoi| NIL . #5#) (LETT #4# (QCAR |a|) . #5#)
               (LETT |aptr| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#) G190
               (COND
                ((OR (|greater_SI| |aptr| #3#) (ATOM #4#)
                     (PROGN (LETT |aoi| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #5#)
                    (LETT |axi| (QVELT |aoi| 1) . #5#)
                    (LETT |ayi| (QVELT |aoi| 2) . #5#)
                    (LETT |ani| (QVELT |aoi| 3) . #5#)
                    (EXIT
                     (SEQ (LETT |boi| NIL . #5#) (LETT #2# (QCAR |b|) . #5#)
                          (LETT |bptr| 1 . #5#)
                          (LETT #1# (LENGTH (QCAR |a|)) . #5#) G190
                          (COND
                           ((OR (|greater_SI| |bptr| #1#) (ATOM #2#)
                                (PROGN (LETT |boi| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (LETT |bi| (QVELT |boi| 0) . #5#)
                               (LETT |bxi| (QVELT |boi| 1) . #5#)
                               (LETT |byi| (QVELT |boi| 2) . #5#)
                               (LETT |bni| (QVELT |boi| 3) . #5#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 65)))
                                        |axi|)
                                     . #5#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 66)))
                                        |ayi|)
                                     . #5#)
                               (LETT |nextA|
                                     (|MFGRPH;cartesianNext| |b| |bni| |ani|
                                      |bptr| |aptr| $)
                                     . #5#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 68))
                                     . #5#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA|) . #5#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 71))
                                      . #5#)))
                          (LETT |bptr|
                                (PROG1 (|inc_SI| |bptr|)
                                  (LETT #2# (CDR #2#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))))
               (LETT |aptr|
                     (PROG1 (|inc_SI| |aptr|) (LETT #4# (CDR #4#) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 73))))))) 

(DEFUN |MFGRPH;closedTensor;2$M$;23| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G411
         |boi| |ani| |ayi| |axi| |ai| #2=#:G410 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;closedTensor;2$M$;23|))
          (SEQ (LETT |aoi| NIL . #3#) (LETT #2# (QCAR |a|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aoi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #3#)
                    (LETT |axi| (QVELT |aoi| 1) . #3#)
                    (LETT |ayi| (QVELT |aoi| 2) . #3#)
                    (LETT |ani| (QVELT |aoi| 3) . #3#)
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
                               (LETT |bni| (QVELT |boi| 3) . #3#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 65)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 66)))
                                        |ayi|)
                                     . #3#)
                               (LETT |nextA|
                                     (|MFGRPH;tensorNext| |b| |bni| |ani| $)
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA|) . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 21))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 12))))))) 

(DEFUN |MFGRPH;closedCartesian;2$M$;24| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G423
         |bptr| #2=#:G424 |boi| |ani| |ayi| |axi| |ai| #3=#:G421 |aptr|
         #4=#:G422 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #5=(|MFGRPH;closedCartesian;2$M$;24|))
          (SEQ (LETT |aoi| NIL . #5#) (LETT #4# (QCAR |a|) . #5#)
               (LETT |aptr| 1 . #5#) (LETT #3# (LENGTH (QCAR |a|)) . #5#) G190
               (COND
                ((OR (|greater_SI| |aptr| #3#) (ATOM #4#)
                     (PROGN (LETT |aoi| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |ai| (QVELT |aoi| 0) . #5#)
                    (LETT |axi| (QVELT |aoi| 1) . #5#)
                    (LETT |ayi| (QVELT |aoi| 2) . #5#)
                    (LETT |ani| (QVELT |aoi| 3) . #5#)
                    (EXIT
                     (SEQ (LETT |boi| NIL . #5#) (LETT #2# (QCAR |b|) . #5#)
                          (LETT |bptr| 1 . #5#)
                          (LETT #1# (LENGTH (QCAR |a|)) . #5#) G190
                          (COND
                           ((OR (|greater_SI| |bptr| #1#) (ATOM #2#)
                                (PROGN (LETT |boi| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (LETT |bi| (QVELT |boi| 0) . #5#)
                               (LETT |bxi| (QVELT |boi| 1) . #5#)
                               (LETT |byi| (QVELT |boi| 2) . #5#)
                               (LETT |bni| (QVELT |boi| 3) . #5#)
                               (LETT |x|
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 65)))
                                        |axi|)
                                     . #5#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 66)))
                                        |ayi|)
                                     . #5#)
                               (LETT |nextA|
                                     (|MFGRPH;cartesianNext| |b| |bni| |ani|
                                      |bptr| |aptr| $)
                                     . #5#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #5#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA|) . #5#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 21))
                                      . #5#)))
                          (LETT |bptr|
                                (PROG1 (|inc_SI| |bptr|)
                                  (LETT #2# (CDR #2#) . #5#))
                                . #5#)
                          (GO G190) G191 (EXIT NIL))))
               (LETT |aptr|
                     (PROG1 (|inc_SI| |aptr|) (LETT #4# (CDR #4#) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 12))))))) 

(DEFUN |MFGRPH;~;2$;25| (|s| $)
  (PROG (|newObjs| |ob| |nextA| #1=#:G435 |x| #2=#:G434 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;~;2$;25|))
          (SEQ (LETT |aoi| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |aoi| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |nextA| NIL . #3#)
                    (SEQ (LETT |x| 1 . #3#)
                         (LETT #1# (LENGTH (QCAR |s|)) . #3#) G190
                         (COND ((|greater_SI| |x| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (SPADCALL |x| (QVELT |aoi| 3) (QREFELT $ 79))
                                  0)
                             (LETT |nextA|
                                   (SPADCALL |nextA| |x| (QREFELT $ 64))
                                   . #3#)))))
                         (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |ob|
                          (VECTOR (QVELT |aoi| 0) (QVELT |aoi| 1)
                                  (QVELT |aoi| 2) |nextA|)
                          . #3#)
                    (EXIT
                     (LETT |newObjs| (SPADCALL |newObjs| |ob| (QREFELT $ 21))
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;map;$LL2I$;26| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nv| |newNext| #1=#:G451 |n| |newY| #2=#:G441 |newX| #3=#:G440
         |newObj| |i| |oldObj| #4=#:G450 |oi| |oldObjs| |newObjs| #5=#:G449 |o|
         #6=#:G448)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|MFGRPH;map;$LL2I$;26|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 42)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #7#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 31)) . #7#)
                (LETT |newX|
                      (PROG1 (LETT #3# (+ (QVELT |oldObj| 1) |offsetX|) . #7#)
                        (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                         #3#))
                      . #7#)
                (LETT |newY|
                      (PROG1 (LETT #2# (+ (QVELT |oldObj| 2) |offsetY|) . #7#)
                        (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                         #2#))
                      . #7#)
                (LETT |newNext| NIL . #7#)
                (SEQ (LETT |n| NIL . #7#) (LETT #1# (QVELT |oldObj| 3) . #7#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |newNext|
                             (SPADCALL |newNext|
                                       (SPADCALL |m| |n| (QREFELT $ 20))
                                       (QREFELT $ 64))
                             . #7#)))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext|) . #7#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;mapContra;$LL2I$;27| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nv| |newNext| |incoming| #1=#:G468 |n| |newY| #2=#:G457 |newX|
         #3=#:G456 |newObj| |i| |oldObj| #4=#:G467 |oi| |oldObjs| |newObjs|
         #5=#:G466 |o| #6=#:G465)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|MFGRPH;mapContra;$LL2I$;27|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 42)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #7#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 31)) . #7#)
                (LETT |newX|
                      (PROG1 (LETT #3# (+ (QVELT |oldObj| 1) |offsetX|) . #7#)
                        (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                         #3#))
                      . #7#)
                (LETT |newY|
                      (PROG1 (LETT #2# (+ (QVELT |oldObj| 2) |offsetY|) . #7#)
                        (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                         #2#))
                      . #7#)
                (LETT |newNext| NIL . #7#)
                (SEQ (LETT |n| NIL . #7#) (LETT #1# (QVELT |oldObj| 3) . #7#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |incoming|
                            (SPADCALL |s| (SPADCALL |m| |n| (QREFELT $ 20))
                                      (QREFELT $ 83))
                            . #7#)
                      (EXIT
                       (LETT |newNext|
                             (SPADCALL |newNext| |incoming| (QREFELT $ 84))
                             . #7#)))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext|) . #7#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;coAdjoint;$LU;28| (|s| |m| $)
  (PROG (|entry| #1=#:G485 |x| #2=#:G490 |ri| #3=#:G489 |mi| |retOpt| #4=#:G488
         |ret| #5=#:G487 |codomainSize| #6=#:G486 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|MFGRPH;coAdjoint;$LU;28|))
        (LETT |codomainSize| 0 . #7#)
        (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |mi| |codomainSize| (QREFELT $ 86))
                 (LETT |codomainSize| |mi| . #7#)))))
             (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |ret|
              (PROGN
               (LETT #5# NIL . #7#)
               (SEQ (LETT |x| 1 . #7#) G190
                    (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #7#)))
                    (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #7#)
        (LETT |retOpt|
              (PROGN
               (LETT #4# NIL . #7#)
               (SEQ (LETT |x| 1 . #7#) G190
                    (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                    (SEQ (EXIT (LETT #4# (CONS NIL #4#) . #7#)))
                    (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #7#)
        (SEQ (LETT |mi| 1 . #7#) (LETT #3# (SPADCALL |m| (QREFELT $ 47)) . #7#)
             G190 (COND ((|greater_SI| |mi| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                                    (QREFELT $ 33))
                          |mi| (QREFELT $ 64))
                         (QREFELT $ 87))))
             (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |entry| 1 . #7#)
        (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
               (GO G191)))
             (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 88)) . #7#)
                  (COND
                   ((EQL |x| 0)
                    (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                  (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                  (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
             (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ret|))))
      #1# (EXIT #1#))))) 

(DEFUN |MFGRPH;contraAdjoint;$LU;29| (|s| |m| $)
  (PROG (|entry| #1=#:G504 |x| #2=#:G509 |ri| #3=#:G508 |mi| |retOpt| #4=#:G507
         |ret| #5=#:G506 |codomainSize| #6=#:G505 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|MFGRPH;contraAdjoint;$LU;29|))
        (LETT |codomainSize| 0 . #7#)
        (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |mi| |codomainSize| (QREFELT $ 86))
                 (LETT |codomainSize| |mi| . #7#)))))
             (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |ret|
              (PROGN
               (LETT #5# NIL . #7#)
               (SEQ (LETT |x| 1 . #7#) G190
                    (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #7#)))
                    (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #7#)
        (LETT |retOpt|
              (PROGN
               (LETT #4# NIL . #7#)
               (SEQ (LETT |x| 1 . #7#) G190
                    (COND ((|greater_SI| |x| |codomainSize|) (GO G191)))
                    (SEQ (EXIT (LETT #4# (CONS NIL #4#) . #7#)))
                    (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                    (EXIT (NREVERSE #4#))))
              . #7#)
        (SEQ (LETT |mi| 1 . #7#) (LETT #3# (SPADCALL |m| (QREFELT $ 47)) . #7#)
             G190 (COND ((|greater_SI| |mi| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                                    (QREFELT $ 33))
                          |mi| (QREFELT $ 64))
                         (QREFELT $ 87))))
             (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |entry| 1 . #7#)
        (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
               (GO G191)))
             (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 91)) . #7#)
                  (COND
                   ((EQL |x| 0)
                    (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                  (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                  (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
             (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ret|))))
      #1# (EXIT #1#))))) 

(DEFUN |MFGRPH;apply;$3Nni;30| (|s| |a| |m| $)
  (SPADCALL (QVELT (SPADCALL (QCAR |s|) |a| (QREFELT $ 42)) 3) |m|
            (QREFELT $ 20))) 

(DEFUN |MFGRPH;limit;$2NniL;31| (|s| |a| |m| $)
  (PROG (|ptr| #1=#:G520 |lp| #2=#:G521 |s1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ptr| |a| . #3=(|MFGRPH;limit;$2NniL;31|))
            (SEQ (LETT |s1| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |lp| (SPADCALL |s| |ptr| (QREFELT $ 95)) . #3#)
                      (COND
                       ((SPADCALL (LENGTH |lp|) 1 (QREFELT $ 86))
                        (|error| "limit: cant have >1 loop through node")))
                      (COND
                       ((EQL (LENGTH |lp|) 1)
                        (PROGN (LETT #1# (|SPADfirst| |lp|) . #3#) (GO #1#))))
                      (EXIT
                       (LETT |ptr| (SPADCALL |s| |ptr| |m| (QREFELT $ 93))
                             . #3#)))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL NIL (QREFELT $ 97)))))
      #1# (EXIT #1#))))) 

(DEFUN |MFGRPH;coerce;Pg$;32| (|pg| $)
  (SPADCALL (SPADCALL |pg| (QREFELT $ 100)) (QREFELT $ 37))) 

(DEFUN |MultifunctionGraph| (#1=#:G523)
  (PROG ()
    (RETURN
     (PROG (#2=#:G524)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MultifunctionGraph|)
                                           '|domainEqualList|)
                . #3=(|MultifunctionGraph|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|MultifunctionGraph;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MultifunctionGraph|))))))))))) 

(DEFUN |MultifunctionGraph;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MultifunctionGraph|))
      (LETT |dv$| (LIST '|MultifunctionGraph| DV$1) . #1#)
      (LETT $ (GETREFV 108) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MultifunctionGraph| (LIST DV$1)
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
                                 (|:| |posY| (|NonNegativeInteger|))
                                 (|:| |next|
                                      (|List| (|NonNegativeInteger|))))))))
      $)))) 

(MAKEPROP '|MultifunctionGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |MFGRPH;multifunctionGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15))
              (|List| 10) |MFGRPH;multifunctionGraph;L$;2|
              (|NonNegativeInteger|) (|Integer|) (|List| 13) (0 . |setelt|)
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 17) (7 . |elt|) (13 . |elt|) (19 . |concat|)
              (|Record| (|:| |name| 43) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 14) (|:| |yOffset| 14))
              (|List| 22) |MFGRPH;multifunctionGraph;LL$;3|
              (|Record| (|:| |preimage| 8) (|:| |image| 8)) (|Permutation| 6)
              (25 . |listRepresentation|) (30 . |One|) (34 . |position|)
              (40 . |concat|) (46 . |elt|) (|List| 15) (52 . |elt|)
              (58 . |createX|) (64 . |createY|) (|List| 26)
              |MFGRPH;multifunctionGraph;L$;4| (|Boolean|) (70 . =)
              |MFGRPH;addObject!;$S$;5| |MFGRPH;addObject!;$R$;6| (76 . |elt|)
              (|String|) |MFGRPH;addArrow!;$S2Nni$;7| (82 . |concat|)
              |MFGRPH;getVertices;$L;8| (88 . |#|) (93 . |concat|)
              |MFGRPH;getArrows;$L;9| |MFGRPH;initial;$;10|
              |MFGRPH;terminal;S$;11| |MFGRPH;cycleOpen;LS$;12|
              |MFGRPH;cycleClosed;LS$;13| |MFGRPH;unit;LS$;14|
              |MFGRPH;kgraph;LS$;15| (99 . |concat|) |MFGRPH;+;3$;16|
              |MFGRPH;merge;3$;17| (105 . ~=) (|List| $) (111 . |concat|)
              (|OutputForm|) (116 . |coerce|) (121 . |concat|)
              (127 . |diagramWidth|) (132 . |diagramHeight|) (|Product| 6 6)
              (137 . |construct|)
              (|Record| (|:| |value| 67) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15))
              (|List| 69) (143 . |concat|) (|MultifunctionGraph| 67)
              (149 . |multifunctionGraph|) |MFGRPH;*;2$Mg;21|
              |MFGRPH;cartesian;2$Mg;22| (|Mapping| 6 6 6)
              |MFGRPH;closedTensor;2$M$;23| |MFGRPH;closedCartesian;2$M$;24|
              (154 . |position|) |MFGRPH;~;2$;25| (160 . |setelt|)
              |MFGRPH;map;$LL2I$;26| (167 . |nodeToNode|) (173 . |concat|)
              |MFGRPH;mapContra;$LL2I$;27| (179 . >) (185 . |setelt|)
              (192 . |max|) (|Union| 15 '"failed") |MFGRPH;coAdjoint;$LU;28|
              (198 . |min|) |MFGRPH;contraAdjoint;$LU;29|
              |MFGRPH;apply;$3Nni;30| (|List| 96) (204 . |loopsAtNode|)
              (|Loop|) (210 . |loop|) |MFGRPH;limit;$2NniL;31|
              (|PermutationGroup| 6) (215 . |coerce|) |MFGRPH;coerce;Pg$;32|
              (|Void|) (|Matrix| 14) (|Matrix| 13) (|List| 106) (|Tree| 14)
              (|SingleInteger|))
           '#(~= 220 ~ 226 |unit| 231 |toString| 237 |terminal| 242
              |spanningTreeNode| 247 |spanningTreeArrow| 253
              |spanningForestNode| 259 |spanningForestArrow| 264 |routeNodes|
              269 |routeArrows| 276 |outDegree| 283 |nodeToNode| 289
              |nodeToArrow| 295 |nodeFromNode| 301 |nodeFromArrow| 307
              |multifunctionGraph| 313 |min| 334 |merge| 345 |max| 351
              |mapContra| 362 |map| 371 |looseEquals| 380 |loopsNodes| 386
              |loopsAtNode| 391 |loopsArrows| 397 |limit| 402 |latex| 409
              |laplacianMatrix| 414 |kgraph| 419 |isGreaterThan?| 425
              |isFunctional?| 432 |isFixPoint?| 437 |isDirected?| 443
              |isDirectSuccessor?| 447 |isAcyclic?| 454 |initial| 459
              |incidenceMatrix| 463 |inDegree| 468 |hash| 474 |getVertices| 479
              |getVertexIndex| 484 |getArrows| 490 |getArrowIndex| 495
              |distanceMatrix| 502 |distance| 507 |diagramWidth| 514
              |diagramSvg| 519 |diagramHeight| 526 |cycleOpen| 531
              |cycleClosed| 537 |createY| 543 |createX| 549 |createWidth| 555
              |contraAdjoint| 560 |coerce| 566 |coAdjoint| 581 |closedTensor|
              587 |closedCartesian| 594 |cartesian| 601 |arrowsToNode| 607
              |arrowsToArrow| 613 |arrowsFromNode| 619 |arrowsFromArrow| 625
              |arrowName| 631 |apply| 638 |adjacencyMatrix| 645 |addObject!|
              650 |addArrow!| 662 = 678 + 684 * 690)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 62)
                           (|BasicType|))
                        (|makeByteWordVec2| 107
                                            '(3 15 13 0 14 13 16 2 18 17 0 14
                                              19 2 15 13 0 14 20 2 11 0 0 10 21
                                              1 26 25 0 27 0 26 0 28 2 8 14 6 0
                                              29 2 8 0 0 6 30 2 8 6 0 14 31 2
                                              32 15 0 14 33 2 0 13 13 13 34 2 0
                                              13 13 13 35 2 11 38 0 0 39 2 11
                                              10 0 14 42 2 18 0 0 17 45 1 15 13
                                              0 47 2 23 0 0 22 48 2 11 0 0 0 56
                                              2 13 38 0 0 59 1 43 0 60 61 1 43
                                              62 0 63 2 15 0 0 13 64 1 0 13 0
                                              65 1 0 13 0 66 2 67 0 6 6 68 2 70
                                              0 0 69 71 1 72 0 70 73 2 15 14 13
                                              0 79 3 11 10 0 14 10 81 2 0 15 0
                                              13 83 2 15 0 0 0 84 2 13 38 0 0
                                              86 3 32 15 0 14 15 87 2 0 13 0 15
                                              88 2 0 13 0 15 91 2 0 94 0 13 95
                                              1 96 0 15 97 1 99 36 0 100 2 0 38
                                              0 0 1 1 0 0 0 80 2 0 0 8 43 54 1
                                              0 43 0 1 1 0 0 6 51 2 0 106 0 13
                                              1 2 0 106 0 13 1 1 0 105 0 1 1 0
                                              105 0 1 3 0 15 0 13 13 1 3 0 15 0
                                              13 13 1 2 0 13 0 13 1 2 0 15 0 13
                                              83 2 0 15 0 13 1 2 0 15 0 13 1 2
                                              0 15 0 13 1 2 0 0 18 23 24 1 0 0
                                              36 37 1 0 0 11 12 1 0 0 8 9 2 0
                                              13 0 15 91 1 0 13 0 1 2 0 0 0 0
                                              58 1 0 13 0 1 2 0 13 0 15 88 5 0
                                              0 0 15 8 14 14 85 5 0 0 0 15 8 14
                                              14 82 2 0 38 0 0 1 1 0 94 0 1 2 0
                                              94 0 13 95 1 0 94 0 1 3 0 96 0 13
                                              13 98 1 0 43 0 1 1 0 103 0 1 2 0
                                              0 8 43 55 3 0 38 0 13 13 1 1 0 38
                                              0 1 2 0 38 0 13 1 0 0 38 1 3 0 38
                                              0 13 13 1 1 0 38 0 1 0 0 0 50 1 0
                                              103 0 1 2 0 13 0 13 1 1 0 107 0 1
                                              1 0 18 0 46 2 0 13 0 6 1 1 0 23 0
                                              49 3 0 13 0 13 13 1 1 0 103 0 1 3
                                              0 14 0 13 13 1 1 0 13 0 65 3 0
                                              102 43 0 38 1 1 0 13 0 66 2 0 0 8
                                              43 52 2 0 0 8 43 53 2 0 13 13 13
                                              35 2 0 13 13 13 34 1 0 13 13 1 2
                                              0 89 0 15 92 1 0 0 99 101 1 0 62
                                              0 1 1 0 62 0 1 2 0 89 0 15 90 3 0
                                              0 0 0 76 77 3 0 0 0 0 76 78 2 0
                                              72 0 0 75 2 0 15 0 13 1 2 0 15 0
                                              13 1 2 0 15 0 13 1 2 0 15 0 13 1
                                              3 0 43 0 13 13 1 3 0 13 0 13 13
                                              93 1 0 104 0 1 2 0 0 0 6 40 2 0 0
                                              0 17 41 4 0 0 0 43 6 6 1 4 0 0 0
                                              43 13 13 44 2 0 38 0 0 1 2 0 0 0
                                              0 57 2 0 72 0 0 74)))))
           '|lookupComplete|)) 
