
(/VERSIONCHECK 2) 

(DEFUN |MFGRPH;multifunctionGraph;L$;1| (|ob| $)
  (PROG (|objs| #1=#:G143 |x| #2=#:G142)
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
                    (LETT #2# (CONS (VECTOR |x| 0 0 (LIST 1) NIL) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(PUT '|MFGRPH;multifunctionGraph;L$;2| '|SPADreplace| 'LIST) 

(DEFUN |MFGRPH;multifunctionGraph;L$;2| (|ob| $) (LIST |ob|)) 

(DEFUN |MFGRPH;multifunctionGraph;LL$;3| (|ob| |ar| $)
  (PROG (|fobs| |fo| #1=#:G168 |f| #2=#:G169 |fn| |too| |fromo| #3=#:G167 |a|
         |arrs| #4=#:G166 |x| #5=#:G165)
    (RETURN
     (SEQ
      (LETT |arrs|
            (PROGN
             (LETT #5# NIL . #6=(|MFGRPH;multifunctionGraph;LL$;3|))
             (SEQ (LETT |x| 1 . #6#) (LETT #4# (LENGTH |ob|) . #6#) G190
                  (COND ((|greater_SI| |x| #4#) (GO G191)))
                  (SEQ (EXIT (LETT #5# (CONS |x| #5#) . #6#)))
                  (LETT |x| (|inc_SI| |x|) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (SEQ (LETT |a| NIL . #6#) (LETT #3# |ar| . #6#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #6#) NIL)) (GO G191)))
           (SEQ (LETT |fromo| (QVELT |a| 2) . #6#)
                (LETT |too| (QVELT |a| 3) . #6#)
                (EXIT (SPADCALL |arrs| |fromo| |too| (QREFELT $ 16))))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |fobs| NIL . #6#)
      (SEQ (LETT |fn| 1 . #6#) (LETT #2# (LENGTH |ob|) . #6#)
           (LETT |f| NIL . #6#) (LETT #1# |ob| . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #6#) NIL)
                 (|greater_SI| |fn| #2#))
             (GO G191)))
           (SEQ
            (LETT |fo|
                  (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                          (LIST (SPADCALL |arrs| |fn| (QREFELT $ 17))) NIL)
                  . #6#)
            (EXIT (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 18)) . #6#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT |fn| (|inc_SI| |fn|) . #6#)) . #6#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |fobs|)))))) 

(DEFUN |MFGRPH;multifunctionGraph;LL$;4| (|objs| |am| $)
  (PROG (|fobs| |fo| #1=#:G181 |f| #2=#:G182 |fn| |obs| |o| |ob| #3=#:G180
         |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #4=(|MFGRPH;multifunctionGraph;LL$;4|))
          (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
               (COND ((|greater_SI| |obn| #3#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26)))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 27)) . #4#)))
               (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191 (EXIT NIL))
          (LETT |fobs| NIL . #4#)
          (SEQ (LETT |fn| 1 . #4#) (LETT #2# (LENGTH |obs|) . #4#)
               (LETT |f| NIL . #4#) (LETT #1# |obs| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #4#) NIL)
                     (|greater_SI| |fn| #2#))
                 (GO G191)))
               (SEQ
                (LETT |fo|
                      (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                              (SPADCALL |am| |fn| (QREFELT $ 29)) NIL)
                      . #4#)
                (EXIT
                 (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 18)) . #4#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |fn| (|inc_SI| |fn|) . #4#))
                     . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |fobs|)))))) 

(DEFUN |MFGRPH;multifunctionGraph;L$;5| (|perms| $)
  (PROG (|verts| |o| #1=#:G299 |vert| #2=#:G300 |i| #3=#:G279 #4=#:G278 |pout|
         |pin| #5=#:G298 |pt| |preim| |im| |lr| #6=#:G296 |perm| #7=#:G297 |pi|
         |tab| #8=#:G295 |a| #9=#:G294 #10=#:G293 |b| #11=#:G292 |obs|
         #12=#:G291 |v| #13=#:G289 #14=#:G290 |px|)
    (RETURN
     (SEQ (LETT |obs| NIL . #15=(|MFGRPH;multifunctionGraph;L$;5|))
          (SEQ (LETT |px| 1 . #15#) (LETT #14# (LENGTH |perms|) . #15#)
               (LETT |perm| NIL . #15#) (LETT #13# |perms| . #15#) G190
               (COND
                ((OR (ATOM #13#) (PROGN (LETT |perm| (CAR #13#) . #15#) NIL)
                     (|greater_SI| |px| #14#))
                 (GO G191)))
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 33)) . #15#)
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
                                    ((< (SPADCALL |v| |obs| (QREFELT $ 35)) 1)
                                     (LETT |obs|
                                           (SPADCALL |obs| |v| (QREFELT $ 36))
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
               (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 33)) . #15#)
                    (LETT |im| (QCDR |lr|) . #15#)
                    (LETT |preim| (QCAR |lr|) . #15#)
                    (EXIT
                     (SEQ (LETT |pt| 1 . #15#) (LETT #5# (LENGTH |im|) . #15#)
                          G190 (COND ((|greater_SI| |pt| #5#) (GO G191)))
                          (SEQ
                           (LETT |pin|
                                 (SPADCALL (SPADCALL |im| |pt| (QREFELT $ 24))
                                           |obs| (QREFELT $ 35))
                                 . #15#)
                           (LETT |pout|
                                 (SPADCALL
                                  (SPADCALL |preim| |pt| (QREFELT $ 24)) |obs|
                                  (QREFELT $ 35))
                                 . #15#)
                           (EXIT
                            (SPADCALL
                             (SPADCALL |tab|
                                       (PROG1 (LETT #4# |pin| . #15#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       (QREFELT $ 29))
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
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 25))
                              (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 26))
                              (SPADCALL |tab| |i| (QREFELT $ 29)) NIL)
                      . #15#)
                (EXIT
                 (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 18)) . #15#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #15#))
                     . #15#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |verts|)))))) 

(DEFUN |MFGRPH;addObject!;$S$;6| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|MFGRPH;addObject!;$S$;6|))
          (LETT |obj| (VECTOR |n| 0 0 (LIST (LENGTH |obs|)) NIL) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 40))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 18)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |MFGRPH;addObject!;$R$;7| (|s| |n| $)
  (SEQ (|error| "this form of addObject! not supported in multifunctionGraph")
       (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;addArrow!;$S2Nni$;8| (|s| |nm| |n1| |n2| $)
  (SEQ
   (SPADCALL (QVELT (SPADCALL (QCAR |s|) |n1| (QREFELT $ 43)) 3) 1 |n2|
             (QREFELT $ 16))
   (EXIT |s|))) 

(DEFUN |MFGRPH;getVertices;$L;9| (|s| $)
  (PROG (|res| |o| #1=#:G321 |soj|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|MFGRPH;getVertices;$L;9|))
          (SEQ (LETT |soj| NIL . #2#) (LETT #1# (QCAR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |soj| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR (QVELT |soj| 0) (QVELT |soj| 1) (QVELT |soj| 2))
                      . #2#)
                (EXIT (LETT |res| (SPADCALL |res| |o| (QREFELT $ 27)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |MFGRPH;getArrows;$L;10| (|s| $)
  (PROG (|res| |a| #1=#:G332 |ar| #2=#:G333 |ai| |soj| #3=#:G331 |sojn|)
    (RETURN
     (SEQ (LETT |res| NIL . #4=(|MFGRPH;getArrows;$L;10|))
          (SEQ (LETT |sojn| 1 . #4#) (LETT #3# (LENGTH (QCAR |s|)) . #4#) G190
               (COND ((|greater_SI| |sojn| #3#) (GO G191)))
               (SEQ
                (LETT |soj| (SPADCALL (QCAR |s|) |sojn| (QREFELT $ 43)) . #4#)
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
                              0 |sojn| |ar| 0 0 NIL)
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

(PUT '|MFGRPH;initial;$;11| '|SPADreplace| '(XLAM NIL (LIST NIL))) 

(DEFUN |MFGRPH;initial;$;11| ($) (LIST NIL)) 

(DEFUN |MFGRPH;terminal;S$;12| (|a| $)
  (PROG (|o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0 (LIST 1) NIL) |MFGRPH;terminal;S$;12|)
          (EXIT (LIST (LIST |o|))))))) 

(DEFUN |MFGRPH;cycleOpen;LS$;13| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G346 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|MFGRPH;cycleOpen;LS$;13|))
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #2#)
                    (LETT |n| (+ |obn| 1) . #2#)
                    (COND
                     ((EQL |obn| (LENGTH |objs|))
                      (LETT |n| (LENGTH |objs|) . #2#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (LIST |n|) NIL)
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 18)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |MFGRPH;cycleClosed;LS$;14| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G354 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|MFGRPH;cycleClosed;LS$;14|))
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 24)) . #2#)
                    (LETT |n| (+ |obn| 1) . #2#)
                    (COND ((EQL |obn| (LENGTH |objs|)) (LETT |n| 1 . #2#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 25))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (LIST |n|) NIL)
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 18)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |MFGRPH;unit;LS$;15| (|objs| |arrowName| $)
  (PROG (#1=#:G360 |x| #2=#:G359)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|MFGRPH;unit;LS$;15|))
             (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#) G190
                  (COND ((|greater_SI| |x| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (SPADCALL |objs| |x| (QREFELT $ 24)) 0 0
                                   (LIST |x|) NIL)
                           #2#)
                          . #3#)))
                  (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(DEFUN |MFGRPH;kgraph;LS$;16| (|objs| |arrowName| $)
  (SEQ (|error| "kgraph not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;+;3$;17| (|a| |b| $)
  (PROG (|c| #1=#:G372 |x| #2=#:G371 |objs|)
    (RETURN
     (SEQ (LETT |objs| (QCAR |b|) . #3=(|MFGRPH;+;3$;17|))
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
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 43)) 0)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 43)) 1)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 43)) 2)
                                (LIST (+ |x| (LENGTH (QCAR |a|)))) NIL)
                               #2#)
                              . #3#)))
                      (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (LIST (SPADCALL (QCAR |a|) |c| (QREFELT $ 56)))))))) 

(DEFUN |MFGRPH;merge;3$;18| (|a| |b| $)
  (SEQ (|error| "merge not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |MFGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (#1=#:G376)
    (RETURN
     (+ |a|
        (*
         (PROG1 (LETT #1# (- |b| 1) |MFGRPH;indexProd|)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
         (LENGTH (QCAR |aObj|))))))) 

(DEFUN |MFGRPH;tensorNext| (|aObj| |a| |b| $)
  (PROG (|res| |x| #1=#:G388 |j| #2=#:G387 |i|)
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
                          (SPADCALL |a| |i| (QREFELT $ 17))
                          (SPADCALL |b| |j| (QREFELT $ 17)) $)
                         . #3#)
                   (EXIT
                    (LETT |res| (SPADCALL |res| |x| (QREFELT $ 64)) . #3#)))
                  (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |MFGRPH;cartesianNext| (|aObj| |a| |b| |an| |bn| $)
  (PROG (|res| |y| |x| #1=#:G395 |i|)
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
                  (|MFGRPH;indexProd| |aObj| (SPADCALL |a| |i| (QREFELT $ 17))
                   |bn| $)
                  . #2#)
            (LETT |res| (SPADCALL |res| |x| (QREFELT $ 64)) . #2#)
            (LETT |y|
                  (|MFGRPH;indexProd| |aObj| |an|
                   (SPADCALL |b| |i| (QREFELT $ 17)) $)
                  . #2#)
            (EXIT (LETT |res| (SPADCALL |res| |y| (QREFELT $ 64)) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |MFGRPH;*;2$Mg;22| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G406
         |boi| |ani| |ayi| |axi| |ai| #2=#:G405 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;*;2$Mg;22|))
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
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 71))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 73))))))) 

(DEFUN |MFGRPH;cartesian;2$Mg;23| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G419
         |bptr| #2=#:G420 |boi| |ani| |ayi| |axi| |ai| #3=#:G417 |aptr|
         #4=#:G418 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #5=(|MFGRPH;cartesian;2$Mg;23|))
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
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #5#)
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

(DEFUN |MFGRPH;closedTensor;2$M$;24| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G430
         |boi| |ani| |ayi| |axi| |ai| #2=#:G429 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;closedTensor;2$M$;24|))
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
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 18))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 12))))))) 

(DEFUN |MFGRPH;closedCartesian;2$M$;25| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G442
         |bptr| #2=#:G443 |boi| |ani| |ayi| |axi| |ai| #3=#:G440 |aptr|
         #4=#:G441 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #5=(|MFGRPH;closedCartesian;2$M$;25|))
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
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #5#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 18))
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

(DEFUN |MFGRPH;~;2$;26| (|s| $)
  (PROG (|newObjs| |ob| |nextA| #1=#:G454 |x| #2=#:G453 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|MFGRPH;~;2$;26|))
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
                                  (QVELT |aoi| 2) |nextA| NIL)
                          . #3#)
                    (EXIT
                     (LETT |newObjs| (SPADCALL |newObjs| |ob| (QREFELT $ 18))
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;map;$LL2I$;27| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nv| |newNext| #1=#:G470 |n| |newY| #2=#:G460 |newX| #3=#:G459
         |newObj| |i| |oldObj| #4=#:G469 |oi| |oldObjs| |newObjs| #5=#:G468 |o|
         #6=#:G467)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|MFGRPH;map;$LL2I$;27|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 NIL NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 43)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 17)) . #7#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 24)) . #7#)
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
                                       (SPADCALL |m| |n| (QREFELT $ 17))
                                       (QREFELT $ 64))
                             . #7#)))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext| NIL) . #7#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;mapContra;$LL2I$;28| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nv| |newNext| |incoming| #1=#:G487 |n| |newY| #2=#:G476 |newX|
         #3=#:G475 |newObj| |i| |oldObj| #4=#:G486 |oi| |oldObjs| |newObjs|
         #5=#:G485 |o| #6=#:G484)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|MFGRPH;mapContra;$LL2I$;28|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 NIL NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 43)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 17)) . #7#)
                (LETT |newObj| (SPADCALL |newOb| |i| (QREFELT $ 24)) . #7#)
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
                            (SPADCALL |s| (SPADCALL |m| |n| (QREFELT $ 17))
                                      (QREFELT $ 83))
                            . #7#)
                      (EXIT
                       (LETT |newNext|
                             (SPADCALL |newNext| |incoming| (QREFELT $ 84))
                             . #7#)))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |nv| (VECTOR |newObj| |newX| |newY| |newNext| NIL) . #7#)
                (EXIT (SPADCALL |newObjs| |i| |nv| (QREFELT $ 81))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |MFGRPH;coAdjoint;$LU;29| (|s| |m| $)
  (PROG (|entry| #1=#:G504 |x| #2=#:G509 |ri| #3=#:G508 |mi| |retOpt| #4=#:G507
         |ret| #5=#:G506 |codomainSize| #6=#:G505 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|MFGRPH;coAdjoint;$LU;29|))
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
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                                    (QREFELT $ 29))
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

(DEFUN |MFGRPH;contraAdjoint;$LU;30| (|s| |m| $)
  (PROG (|entry| #1=#:G523 |x| #2=#:G528 |ri| #3=#:G527 |mi| |retOpt| #4=#:G526
         |ret| #5=#:G525 |codomainSize| #6=#:G524 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|MFGRPH;contraAdjoint;$LU;30|))
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
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 17))
                                    (QREFELT $ 29))
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

(DEFUN |MFGRPH;apply;$3Nni;31| (|s| |a| |m| $)
  (SPADCALL (QVELT (SPADCALL (QCAR |s|) |a| (QREFELT $ 43)) 3) |m|
            (QREFELT $ 17))) 

(DEFUN |MFGRPH;limit;$2NniL;32| (|s| |a| |m| $)
  (PROG (|ptr| #1=#:G539 |lp| #2=#:G540 |s1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ptr| |a| . #3=(|MFGRPH;limit;$2NniL;32|))
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

(DEFUN |MFGRPH;coerce;Pg$;33| (|pg| $)
  (SPADCALL (SPADCALL |pg| (QREFELT $ 100)) (QREFELT $ 38))) 

(DEFUN |MFGRPH;permIndex| (|entry| |lps2| $)
  (PROG (|resu| |e2| |i| |dimen|)
    (RETURN
     (SEQ (LETT |dimen| (LENGTH |lps2|) . #1=(|MFGRPH;permIndex|))
          (LETT |resu| 0 . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |dimen|) (GO G191)))
               (SEQ (LETT |e2| (SPADCALL |lps2| |i| (QREFELT $ 102)) . #1#)
                    (EXIT
                     (COND
                      ((SPADCALL |entry| |e2| (QREFELT $ 103))
                       (LETT |resu| |i| . #1#)))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |resu|))))) 

(DEFUN |MFGRPH;generateNewPerms| (|gens2| |stngs| |permutationNames| $)
  (PROG (|resstr| |resu| |foundNew| |p| |j| |i| |dimen|)
    (RETURN
     (SEQ (LETT |dimen| (LENGTH |gens2|) . #1=(|MFGRPH;generateNewPerms|))
          (LETT |resu| NIL . #1#) (LETT |resstr| NIL . #1#)
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |dimen|) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1 . #1#) G190
                      (COND ((|greater_SI| |j| |dimen|) (GO G191)))
                      (SEQ
                       (LETT |p|
                             (SPADCALL (SPADCALL |gens2| |i| (QREFELT $ 102))
                                       (SPADCALL |gens2| |j| (QREFELT $ 102))
                                       (QREFELT $ 104))
                             . #1#)
                       (LETT |foundNew|
                             (COND
                              ((OR (SPADCALL |p| |gens2| (QREFELT $ 105))
                                   (SPADCALL |p| |resu| (QREFELT $ 105)))
                               'NIL)
                              ('T 'T))
                             . #1#)
                       (EXIT
                        (COND
                         (|foundNew|
                          (SEQ
                           (LETT |resu| (SPADCALL |resu| |p| (QREFELT $ 106))
                                 . #1#)
                           (EXIT
                            (COND
                             (|permutationNames|
                              (LETT |resstr|
                                    (SPADCALL |resstr|
                                              (|mathObject2String| |p|)
                                              (QREFELT $ 108))
                                    . #1#))
                             ('T
                              (LETT |resstr|
                                    (SPADCALL |resstr|
                                              (STRCONC
                                               (SPADCALL |stngs| |i|
                                                         (QREFELT $ 109))
                                               (SPADCALL |stngs| |j|
                                                         (QREFELT $ 109)))
                                              (QREFELT $ 108))
                                    . #1#)))))))))
                      (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |resu| |resstr|)))))) 

(DEFUN |MFGRPH;generateName| (|n| $)
  (PROG (|ascii|)
    (RETURN
     (SEQ (LETT |ascii| 96 . #1=(|MFGRPH;generateName|))
          (COND ((SPADCALL |n| 8 (QREFELT $ 86)) (LETT |ascii| 97 . #1#)))
          (EXIT
           (SPADCALL (SPADCALL (+ |ascii| |n|) (QREFELT $ 111))
                     (QREFELT $ 112))))))) 

(DEFUN |MFGRPH;generateNames| (|n| $)
  (PROG (|ptr2| #1=#:G559)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (LIST "0"))
            ('T
             (PROGN
              (LETT #1# NIL . #2=(|MFGRPH;generateNames|))
              (SEQ (LETT |ptr2| 1 . #2#) G190
                   (COND ((|greater_SI| |ptr2| |n|) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #1# (CONS (|MFGRPH;generateName| |ptr2| $) #1#)
                           . #2#)))
                   (LETT |ptr2| (|inc_SI| |ptr2|) . #2#) (GO G190) G191
                   (EXIT (NREVERSE #1#)))))))))) 

(DEFUN |MFGRPH;generateNamesCycle| (|g| $)
  (PROG (|s2| #1=#:G564 |ptr2| #2=#:G563 |s1|)
    (RETURN
     (SEQ
      (LETT |s1| (|mathObject2String| (|spadConstant| $ 34))
            . #3=(|MFGRPH;generateNamesCycle|))
      (LETT |s2|
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |ptr2| NIL . #3#) (LETT #1# |g| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ptr2| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (|mathObject2String| |ptr2|) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (CONS |s1| |s2|)))))) 

(DEFUN |MFGRPH;toCayleyGraph;LBMg;39| (|permList| |permutationNames| $)
  (PROG (|gens| |i| #1=#:G581 |ct| |j| #2=#:G580 #3=#:G579 |dimen| |strngs|
         |elements| |idPerm| |idPos| |contin| |resu| |numGenerators|)
    (RETURN
     (SEQ (LETT |elements| |permList| . #4=(|MFGRPH;toCayleyGraph;LBMg;39|))
          (LETT |numGenerators| (LENGTH |permList|) . #4#)
          (LETT |strngs| (|MFGRPH;generateNames| (LENGTH |elements|) $) . #4#)
          (COND
           (|permutationNames|
            (LETT |strngs| (|MFGRPH;generateNamesCycle| |permList| $) . #4#)))
          (LETT |contin| 'T . #4#)
          (SEQ G190 (COND ((NULL |contin|) (GO G191)))
               (SEQ
                (LETT |resu|
                      (|MFGRPH;generateNewPerms| |elements| |strngs|
                       |permutationNames| $)
                      . #4#)
                (LETT |contin| (COND ((NULL (QCAR |resu|)) 'NIL) ('T 'T))
                      . #4#)
                (EXIT
                 (COND
                  (|contin|
                   (SEQ
                    (LETT |elements| (APPEND |elements| (QCAR |resu|)) . #4#)
                    (EXIT
                     (LETT |strngs| (APPEND |strngs| (QCDR |resu|))
                           . #4#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |idPos| (SPADCALL (ELT $ 114) |elements| (QREFELT $ 116))
                . #4#)
          (COND
           ((SPADCALL |idPos| 1 (QREFELT $ 117))
            (SEQ
             (LETT |idPerm| (SPADCALL |elements| |idPos| (QREFELT $ 102))
                   . #4#)
             (LETT |elements|
                   (CONS |idPerm|
                         (SPADCALL |elements| |idPos| (QREFELT $ 118)))
                   . #4#)
             (EXIT
              (LETT |strngs|
                    (CONS "i" (SPADCALL |strngs| |idPos| (QREFELT $ 119)))
                    . #4#)))))
          (LETT |dimen| (LENGTH |elements|) . #4#)
          (LETT |ct|
                (PROGN
                 (LETT #3# NIL . #4#)
                 (SEQ (LETT |i| 1 . #4#) G190
                      (COND ((|greater_SI| |i| |dimen|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #4#)
                                (SEQ (LETT |j| 1 . #4#) G190
                                     (COND
                                      ((|greater_SI| |j| |dimen|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (|MFGRPH;permIndex|
                                               (SPADCALL
                                                (SPADCALL |elements| |i|
                                                          (QREFELT $ 102))
                                                (SPADCALL |elements| |j|
                                                          (QREFELT $ 102))
                                                (QREFELT $ 104))
                                               |elements| $)
                                              #2#)
                                             . #4#)))
                                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |gens|
                (PROGN
                 (LETT #1# NIL . #4#)
                 (SEQ (LETT |i| 1 . #4#) G190
                      (COND ((|greater_SI| |i| |dimen|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (CDR (SPADCALL |ct| |i| (QREFELT $ 29)))
                                |numGenerators| (QREFELT $ 120))
                               #1#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                . #4#)
          (EXIT (SPADCALL |strngs| |gens| (QREFELT $ 122))))))) 

(DEFUN |MFGRPH;toCayleyGraph;PgMg;40| (|pg| $)
  (PROG (|perms|)
    (RETURN
     (SEQ
      (LETT |perms| (SPADCALL |pg| (QREFELT $ 124))
            |MFGRPH;toCayleyGraph;PgMg;40|)
      (EXIT (SPADCALL |perms| 'NIL (QREFELT $ 123))))))) 

(DEFUN |MFGRPH;toPermutation;$Pg;41| (|s| $)
  (PROG (|lp| |p| |imgs| #1=#:G601 |i| |preImgs| #2=#:G600 |cayleyTable| |j|
         #3=#:G599 #4=#:G598 |numCols| |numRows| |preTable| |newNext| #5=#:G596
         |obj| #6=#:G597 |oi| |objs|)
    (RETURN
     (SEQ (LETT |lp| NIL . #7=(|MFGRPH;toPermutation;$Pg;41|))
          (LETT |objs| (QCAR |s|) . #7#)
          (SEQ (LETT |oi| 1 . #7#) (LETT #6# (LENGTH |objs|) . #7#)
               (LETT |obj| NIL . #7#) (LETT #5# |objs| . #7#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |obj| (CAR #5#) . #7#) NIL)
                     (|greater_SI| |oi| #6#))
                 (GO G191)))
               (SEQ (LETT |newNext| (QVELT |obj| 3) . #7#)
                    (EXIT
                     (LETT |preTable|
                           (SPADCALL |preTable| |newNext| (QREFELT $ 126))
                           . #7#)))
               (LETT #5# (PROG1 (CDR #5#) (LETT |oi| (|inc_SI| |oi|) . #7#))
                     . #7#)
               (GO G190) G191 (EXIT NIL))
          (LETT |numRows| (LENGTH |preTable|) . #7#)
          (LETT |numCols| (SPADCALL (|SPADfirst| |preTable|) (QREFELT $ 47))
                . #7#)
          (LETT |cayleyTable|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |i| 1 . #7#) G190
                      (COND ((|greater_SI| |i| |numCols|) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #3# NIL . #7#)
                                (SEQ (LETT |j| 1 . #7#) G190
                                     (COND
                                      ((|greater_SI| |j| |numRows|) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL
                                               (SPADCALL |preTable| |j|
                                                         (QREFELT $ 29))
                                               |i| (QREFELT $ 17))
                                              #3#)
                                             . #7#)))
                                     (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                     G191 (EXIT (NREVERSE #3#))))
                               #4#)
                              . #7#)))
                      (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (LETT |preImgs|
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |p| 1 . #7#) G190
                      (COND ((|greater_SI| |p| |numRows|) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |p| #2#) . #7#)))
                      (LETT |p| (|inc_SI| |p|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #7#)
          (SEQ (LETT |i| 1 . #7#) (LETT #1# (LENGTH |cayleyTable|) . #7#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |imgs| (SPADCALL |cayleyTable| |i| (QREFELT $ 29)) . #7#)
                (LETT |p| (SPADCALL (LIST |preImgs| |imgs|) (QREFELT $ 128))
                      . #7#)
                (EXIT (LETT |lp| (SPADCALL |lp| |p| (QREFELT $ 130)) . #7#)))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |lp| (QREFELT $ 132))))))) 

(DEFUN |MultifunctionGraph| (#1=#:G602)
  (PROG ()
    (RETURN
     (PROG (#2=#:G603)
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
      (LETT $ (GETREFV 143) . #1#)
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
                                 (|:| |next| (|List| (|NonNegativeInteger|)))
                                 (|:| |map|
                                      (|List|
                                       (|List| (|NonNegativeInteger|)))))))))
      $)))) 

(MAKEPROP '|MultifunctionGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |MFGRPH;multifunctionGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15) (|:| |map| 28))
              (|List| 10) |MFGRPH;multifunctionGraph;L$;2|
              (|NonNegativeInteger|) (|Integer|) (|List| 13) (0 . |setelt|)
              (7 . |elt|) (13 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 19)
              (|Record| (|:| |name| 44) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 14) (|:| |yOffset| 14)
                        (|:| |map| 15))
              (|List| 21) |MFGRPH;multifunctionGraph;LL$;3| (19 . |elt|)
              (25 . |createX|) (31 . |createY|) (37 . |concat|) (|List| 15)
              (43 . |elt|) |MFGRPH;multifunctionGraph;LL$;4|
              (|Record| (|:| |preimage| 8) (|:| |image| 8)) (|Permutation| 6)
              (49 . |listRepresentation|) (54 . |One|) (58 . |position|)
              (64 . |concat|) (|List| 32) |MFGRPH;multifunctionGraph;L$;5|
              (|Boolean|) (70 . =) |MFGRPH;addObject!;$S$;6|
              |MFGRPH;addObject!;$R$;7| (76 . |elt|) (|String|)
              |MFGRPH;addArrow!;$S2Nni$;8| |MFGRPH;getVertices;$L;9| (82 . |#|)
              (87 . |concat|) |MFGRPH;getArrows;$L;10| |MFGRPH;initial;$;11|
              |MFGRPH;terminal;S$;12| |MFGRPH;cycleOpen;LS$;13|
              |MFGRPH;cycleClosed;LS$;14| |MFGRPH;unit;LS$;15|
              |MFGRPH;kgraph;LS$;16| (93 . |concat|) |MFGRPH;+;3$;17|
              |MFGRPH;merge;3$;18| (99 . ~=) (|List| $) (105 . |concat|)
              (|OutputForm|) (110 . |coerce|) (115 . |concat|)
              (121 . |diagramWidth|) (126 . |diagramHeight|) (|Product| 6 6)
              (131 . |construct|)
              (|Record| (|:| |value| 67) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 15) (|:| |map| 28))
              (|List| 69) (137 . |concat|) (|MultifunctionGraph| 67)
              (143 . |multifunctionGraph|) |MFGRPH;*;2$Mg;22|
              |MFGRPH;cartesian;2$Mg;23| (|Mapping| 6 6 6)
              |MFGRPH;closedTensor;2$M$;24| |MFGRPH;closedCartesian;2$M$;25|
              (148 . |position|) |MFGRPH;~;2$;26| (154 . |setelt|)
              |MFGRPH;map;$LL2I$;27| (161 . |nodeToNode|) (167 . |concat|)
              |MFGRPH;mapContra;$LL2I$;28| (173 . >) (179 . |setelt|)
              (186 . |max|) (|Union| 15 '"failed") |MFGRPH;coAdjoint;$LU;29|
              (192 . |min|) |MFGRPH;contraAdjoint;$LU;30|
              |MFGRPH;apply;$3Nni;31| (|List| 96) (198 . |loopsAtNode|)
              (|Loop|) (204 . |loop|) |MFGRPH;limit;$2NniL;32|
              (|PermutationGroup| 6) (209 . |coerce|) |MFGRPH;coerce;Pg$;33|
              (214 . |elt|) (220 . =) (226 . *) (232 . |member?|)
              (238 . |concat|) (|List| 44) (244 . |concat|) (250 . |elt|)
              (|Character|) (256 . |char|) (261 . |coerce|) (266 . |one?|)
              (271 . |one?|) (|Mapping| 39 32) (276 . |position|) (282 . >)
              (288 . |delete|) (294 . |delete|) (300 . |first|)
              (|MultifunctionGraph| 44) (306 . |multifunctionGraph|)
              |MFGRPH;toCayleyGraph;LBMg;39| (312 . |generators|)
              |MFGRPH;toCayleyGraph;PgMg;40| (317 . |concat|)
              (|Permutation| 13) (323 . |coercePreimagesImages|) (|List| 127)
              (328 . |concat|) (|PermutationGroup| 13)
              (334 . |permutationGroup|) |MFGRPH;toPermutation;$Pg;41| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 14) (|Matrix| 13)
              (|Tree| 14) (|List| 138) (|DirectedGraph| $) (|SingleInteger|)
              (|HashState|))
           '#(~= 339 ~ 345 |unit| 350 |toPermutation| 356 |toCayleyGraph| 361
              |terminal| 372 |subdiagramSvg| 377 |spanningTreeNode| 385
              |spanningTreeArrow| 391 |spanningForestNode| 397
              |spanningForestArrow| 402 |routeNodes| 407 |routeArrows| 414
              |outDegree| 421 |nodeToNode| 427 |nodeToArrow| 433 |nodeFromNode|
              439 |nodeFromArrow| 445 |multifunctionGraph| 451 |min| 478
              |merge| 489 |max| 495 |mapContra| 506 |map| 515 |looseEquals| 524
              |loopsNodes| 530 |loopsAtNode| 535 |loopsArrows| 541 |limit| 546
              |latex| 553 |laplacianMatrix| 558 |kgraph| 563 |isGreaterThan?|
              569 |isFunctional?| 576 |isFixPoint?| 581 |isDirected?| 587
              |isDirectSuccessor?| 591 |isAcyclic?| 598 |initial| 603
              |incidenceMatrix| 607 |inDegree| 612 |hashUpdate!| 618 |hash| 624
              |getVertices| 629 |getVertexIndex| 634 |getArrows| 640
              |getArrowIndex| 645 |flatten| 652 |distanceMatrix| 657 |distance|
              662 |diagramWidth| 669 |diagramSvg| 674 |diagramHeight| 681
              |deepDiagramSvg| 686 |cycleOpen| 693 |cycleClosed| 699 |createY|
              705 |createX| 711 |createWidth| 717 |contraAdjoint| 722 |coerce|
              728 |coAdjoint| 743 |closedTensor| 749 |closedCartesian| 756
              |cartesian| 763 |arrowsToNode| 769 |arrowsToArrow| 775
              |arrowsFromNode| 781 |arrowsFromArrow| 787 |arrowName| 793
              |apply| 800 |adjacencyMatrix| 807 |addObject!| 812 |addArrow!|
              824 = 849 + 855 * 861)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 62)
                           (|BasicType|))
                        (|makeByteWordVec2| 142
                                            '(3 15 13 0 14 13 16 2 15 13 0 14
                                              17 2 11 0 0 10 18 2 8 6 0 14 24 2
                                              0 13 13 13 25 2 0 13 13 13 26 2
                                              20 0 0 19 27 2 28 15 0 14 29 1 32
                                              31 0 33 0 32 0 34 2 8 14 6 0 35 2
                                              8 0 0 6 36 2 11 39 0 0 40 2 11 10
                                              0 14 43 1 15 13 0 47 2 22 0 0 21
                                              48 2 11 0 0 0 56 2 13 39 0 0 59 1
                                              44 0 60 61 1 44 62 0 63 2 15 0 0
                                              13 64 1 0 13 0 65 1 0 13 0 66 2
                                              67 0 6 6 68 2 70 0 0 69 71 1 72 0
                                              70 73 2 15 14 13 0 79 3 11 10 0
                                              14 10 81 2 0 15 0 13 83 2 15 0 0
                                              0 84 2 13 39 0 0 86 3 28 15 0 14
                                              15 87 2 0 13 0 15 88 2 0 13 0 15
                                              91 2 0 94 0 13 95 1 96 0 15 97 1
                                              99 37 0 100 2 37 32 0 14 102 2 32
                                              39 0 0 103 2 32 0 0 0 104 2 37 39
                                              32 0 105 2 37 0 0 32 106 2 107 0
                                              0 44 108 2 107 44 0 14 109 1 110
                                              0 14 111 1 44 0 110 112 1 13 39 0
                                              113 1 32 39 0 114 2 37 14 115 0
                                              116 2 14 39 0 0 117 2 37 0 0 14
                                              118 2 107 0 0 14 119 2 15 0 0 13
                                              120 2 121 0 107 28 122 1 99 37 0
                                              124 2 28 0 0 15 126 1 127 0 28
                                              128 2 129 0 0 127 130 1 131 0 129
                                              132 2 0 39 0 0 1 1 0 0 0 80 2 0 0
                                              8 44 54 1 0 131 0 133 1 0 121 99
                                              125 2 0 121 37 39 123 1 0 0 6 51
                                              4 0 134 135 0 39 39 1 2 0 138 0
                                              13 1 2 0 138 0 13 1 1 0 139 0 1 1
                                              0 139 0 1 3 0 15 0 13 13 1 3 0 15
                                              0 13 13 1 2 0 13 0 13 1 2 0 15 0
                                              13 83 2 0 15 0 13 1 2 0 15 0 13 1
                                              2 0 15 0 13 1 1 0 0 37 38 2 0 0
                                              20 22 23 2 0 0 8 28 30 1 0 0 11
                                              12 1 0 0 8 9 1 0 13 0 1 2 0 13 0
                                              15 91 2 0 0 0 0 58 2 0 13 0 15 88
                                              1 0 13 0 1 5 0 0 0 15 8 14 14 85
                                              5 0 0 0 15 8 14 14 82 2 0 39 0 0
                                              1 1 0 94 0 1 2 0 94 0 13 95 1 0
                                              94 0 1 3 0 96 0 13 13 98 1 0 44 0
                                              1 1 0 136 0 1 2 0 0 8 44 55 3 0
                                              39 0 13 13 1 1 0 39 0 1 2 0 39 0
                                              13 1 0 0 39 1 3 0 39 0 13 13 1 1
                                              0 39 0 1 0 0 0 50 1 0 136 0 1 2 0
                                              13 0 13 1 2 0 142 142 0 1 1 0 141
                                              0 1 1 0 20 0 46 2 0 13 0 6 1 1 0
                                              22 0 49 3 0 13 0 13 13 1 1 0 0
                                              140 1 1 0 136 0 1 3 0 14 0 13 13
                                              1 1 0 13 0 65 3 0 134 44 0 39 1 1
                                              0 13 0 66 3 0 134 44 0 39 1 2 0 0
                                              8 44 52 2 0 0 8 44 53 2 0 13 13
                                              13 26 2 0 13 13 13 25 1 0 13 13 1
                                              2 0 89 0 15 92 1 0 0 99 101 1 0
                                              62 0 1 1 0 62 0 1 2 0 89 0 15 90
                                              3 0 0 0 0 76 77 3 0 0 0 0 76 78 2
                                              0 72 0 0 75 2 0 15 0 13 1 2 0 15
                                              0 13 1 2 0 15 0 13 1 2 0 15 0 13
                                              1 3 0 44 0 13 13 1 3 0 13 0 13 13
                                              93 1 0 137 0 1 2 0 0 0 19 42 2 0
                                              0 0 6 41 4 0 0 0 44 6 6 1 4 0 0 0
                                              44 13 13 45 5 0 0 0 44 13 13 15 1
                                              2 0 39 0 0 1 2 0 0 0 0 57 2 0 72
                                              0 0 74)))))
           '|lookupComplete|)) 
