
(/VERSIONCHECK 2) 

(DEFUN |FNGRPH;functionGraph;L$;1| (|ob| $)
  (PROG (|objs| #1=#:G145 |x| #2=#:G144)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|FNGRPH;functionGraph;L$;1|))
             (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #2# (CONS (VECTOR |x| 0 0 0 NIL) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(PUT '|FNGRPH;functionGraph;L$;2| '|SPADreplace| 'LIST) 

(DEFUN |FNGRPH;functionGraph;L$;2| (|ob| $) (LIST |ob|)) 

(DEFUN |FNGRPH;functionGraph;LL$;3| (|ob| |ar| $)
  (PROG (|fobs| |fo| |f| #1=#:G169 |fn| |too| |fromo| #2=#:G168 |a| |arrs|
         #3=#:G167 |x| #4=#:G166)
    (RETURN
     (SEQ
      (LETT |arrs|
            (PROGN
             (LETT #4# NIL . #5=(|FNGRPH;functionGraph;LL$;3|))
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
                              (SPADCALL |arrs| |fn| (QREFELT $ 20)) NIL)
                      . #5#)
                (EXIT
                 (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 21)) . #5#)))
           (LETT |fn| (|inc_SI| |fn|) . #5#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |fobs|)))))) 

(DEFUN |FNGRPH;functionGraph;L$;4| (|perms| $)
  (PROG (|obs| |o| |n| #1=#:G182 |j| #2=#:G180 |vert| #3=#:G181 |i| |preim|
         |im| |lr| |perm|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (LENGTH |perms|) 1 (QREFELT $ 28))
        (|error| "functionGraph only needs one permutation")))
      (LETT |obs| NIL . #4=(|FNGRPH;functionGraph;L$;4|))
      (LETT |perm| (|SPADfirst| |perms|) . #4#)
      (LETT |lr| (SPADCALL |perm| (QREFELT $ 30)) . #4#)
      (LETT |im| (QCDR |lr|) . #4#) (LETT |preim| (QCAR |lr|) . #4#)
      (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |im|) . #4#)
           (LETT |vert| NIL . #4#) (LETT #2# |im| . #4#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |vert| (CAR #2#) . #4#) NIL)
                 (|greater_SI| |i| #3#))
             (GO G191)))
           (SEQ (LETT |n| 1 . #4#)
                (SEQ (LETT |j| 1 . #4#) (LETT #1# (LENGTH |preim|) . #4#) G190
                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |im| |i| (QREFELT $ 31))
                                   (SPADCALL |preim| |j| (QREFELT $ 31))
                                   (QREFELT $ 32))
                         (LETT |n| |j| . #4#)))))
                     (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |o|
                      (VECTOR |vert|
                              (SPADCALL (LENGTH |im|) |i| (QREFELT $ 33))
                              (SPADCALL (LENGTH |im|) |i| (QREFELT $ 34)) |n|
                              NIL)
                      . #4#)
                (EXIT (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)))
           (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #4#)) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |obs|)))))) 

(DEFUN |FNGRPH;addObject!;$S$;5| (|s| |n| $)
  (PROG (|obj| |obs|)
    (RETURN
     (SEQ (LETT |obs| (QCAR |s|) . #1=(|FNGRPH;addObject!;$S$;5|))
          (LETT |obj| (VECTOR |n| 0 0 (LENGTH |obs|) NIL) . #1#)
          (COND
           ((SPADCALL |obs| NIL (QREFELT $ 37))
            (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
           ('T
            (PROGN
             (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
             (QCAR |s|))))
          (EXIT |s|))))) 

(DEFUN |FNGRPH;addObject!;$R$;6| (|s| |n| $)
  (SEQ (|error| "this form of addObject! not supported in functionGraph")
       (EXIT (LIST NIL)))) 

(DEFUN |FNGRPH;addArrow!;$S2Nni$;7| (|s| |nm| |n1| |n2| $)
  (SEQ (QSETVELT (SPADCALL (QCAR |s|) |n1| (QREFELT $ 40)) 3 |n2|) (EXIT |s|))) 

(DEFUN |FNGRPH;getVertices;$L;8| (|s| $)
  (PROG (|res| |o| #1=#:G203 |soj|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|FNGRPH;getVertices;$L;8|))
          (SEQ (LETT |soj| NIL . #2#) (LETT #1# (QCAR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |soj| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |o|
                      (VECTOR (QVELT |soj| 0) (QVELT |soj| 1) (QVELT |soj| 2))
                      . #2#)
                (EXIT (LETT |res| (SPADCALL |res| |o| (QREFELT $ 43)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FNGRPH;getArrows;$L;9| (|s| $)
  (PROG (|res| |a| |soj| #1=#:G211 |sojn|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|FNGRPH;getArrows;$L;9|))
          (SEQ (LETT |sojn| 1 . #2#) (LETT #1# (LENGTH (QCAR |s|)) . #2#) G190
               (COND ((|greater_SI| |sojn| #1#) (GO G191)))
               (SEQ
                (LETT |soj| (SPADCALL (QCAR |s|) |sojn| (QREFELT $ 40)) . #2#)
                (LETT |a|
                      (VECTOR (STRINGIMAGE |sojn|) 0 |sojn| (QVELT |soj| 3) 0 0
                              (QVELT |soj| 4))
                      . #2#)
                (EXIT (LETT |res| (SPADCALL |res| |a| (QREFELT $ 45)) . #2#)))
               (LETT |sojn| (|inc_SI| |sojn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(PUT '|FNGRPH;initial;$;10| '|SPADreplace| '(XLAM NIL (LIST NIL))) 

(DEFUN |FNGRPH;initial;$;10| ($) (LIST NIL)) 

(DEFUN |FNGRPH;terminal;S$;11| (|a| $)
  (PROG (|o|)
    (RETURN
     (SEQ (LETT |o| (VECTOR |a| 0 0 1 NIL) |FNGRPH;terminal;S$;11|)
          (EXIT (LIST (LIST |o|))))))) 

(DEFUN |FNGRPH;cycleOpen;LS$;12| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G224 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|FNGRPH;cycleOpen;LS$;12|))
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
                                            (QREFELT $ 33))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  |n| NIL)
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |FNGRPH;cycleClosed;LS$;13| (|objs| |arrowName| $)
  (PROG (|obs| |o| |n| |ob| #1=#:G232 |obn|)
    (RETURN
     (SEQ (LETT |obs| NIL . #2=(|FNGRPH;cycleClosed;LS$;13|))
          (SEQ (LETT |obn| 1 . #2#) (LETT #1# (LENGTH |objs|) . #2#) G190
               (COND ((|greater_SI| |obn| #1#) (GO G191)))
               (SEQ (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 31)) . #2#)
                    (LETT |n| (+ |obn| 1) . #2#)
                    (COND ((EQL |obn| (LENGTH |objs|)) (LETT |n| 1 . #2#)))
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 33))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 34))
                                  |n| NIL)
                          . #2#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #2#)))
               (LETT |obn| (|inc_SI| |obn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |obs|)))))) 

(DEFUN |FNGRPH;unit;LS$;14| (|objs| |arrowName| $)
  (PROG (#1=#:G238 |x| #2=#:G237)
    (RETURN
     (SEQ
      (LETT |objs|
            (PROGN
             (LETT #2# NIL . #3=(|FNGRPH;unit;LS$;14|))
             (SEQ (LETT |x| 1 . #3#) (LETT #1# (LENGTH |objs|) . #3#) G190
                  (COND ((|greater_SI| |x| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (VECTOR (SPADCALL |objs| |x| (QREFELT $ 31)) 0 0 |x|
                                   NIL)
                           #2#)
                          . #3#)))
                  (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (LIST |objs|)))))) 

(DEFUN |FNGRPH;kgraph;LS$;15| (|objs| |arrowName| $)
  (SEQ (|error| "kgraph not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |FNGRPH;+;3$;16| (|a| |b| $)
  (PROG (|c| #1=#:G250 |x| #2=#:G249 |objs|)
    (RETURN
     (SEQ (LETT |objs| (QCAR |b|) . #3=(|FNGRPH;+;3$;16|))
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
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 40)) 0)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 40)) 1)
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 40)) 2)
                                (+ |x| (LENGTH (QCAR |a|)))
                                (QVELT (SPADCALL |objs| |x| (QREFELT $ 40)) 4))
                               #2#)
                              . #3#)))
                      (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (LIST (SPADCALL (QCAR |a|) |c| (QREFELT $ 53)))))))) 

(DEFUN |FNGRPH;merge;3$;17| (|a| |b| $)
  (SEQ (|error| "merge not valid in function graph") (EXIT (LIST NIL)))) 

(DEFUN |FNGRPH;indexProd| (|aObj| |a| |b| $)
  (PROG (|x| #1=#:G254)
    (RETURN
     (SEQ
      (LETT |x|
            (+ |a|
               (*
                (PROG1 (LETT #1# (- |b| 1) . #2=(|FNGRPH;indexProd|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                (LENGTH (QCAR |aObj|))))
            . #2#)
      (EXIT |x|))))) 

(DEFUN |FNGRPH;*;2$Fg;19| (|a| |b| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G269
         |boi| |ani| |ayi| |axi| |ai| #2=#:G268 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|FNGRPH;*;2$Fg;19|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 56)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 57)))
                                        |ayi|)
                                     . #3#)
                               (LETT |nextA|
                                     (|FNGRPH;indexProd| |b| |bni| |ani| $)
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| (QREFELT $ 59))
                                     . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 62))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 64))))))) 

(DEFUN |FNGRPH;closedTensor;2$M$;20| (|a| |b| |f| $)
  (PROG (|newObjs| |ob| |sp| |nextA| |y| |x| |bni| |byi| |bxi| |bi| #1=#:G279
         |boi| |ani| |ayi| |axi| |ai| #2=#:G278 |aoi|)
    (RETURN
     (SEQ (LETT |newObjs| NIL . #3=(|FNGRPH;closedTensor;2$M$;20|))
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
                                     (+ (* |bxi| (SPADCALL |a| (QREFELT $ 56)))
                                        |axi|)
                                     . #3#)
                               (LETT |y|
                                     (+ (* |byi| (SPADCALL |a| (QREFELT $ 57)))
                                        |ayi|)
                                     . #3#)
                               (LETT |nextA|
                                     (|FNGRPH;indexProd| |b| |bni| |ani| $)
                                     . #3#)
                               (LETT |sp| (SPADCALL |ai| |bi| |f|) . #3#)
                               (LETT |ob| (VECTOR |sp| |x| |y| |nextA| NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newObjs|
                                      (SPADCALL |newObjs| |ob| (QREFELT $ 21))
                                      . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |newObjs| (QREFELT $ 12))))))) 

(DEFUN |FNGRPH;map;$LL2I$;21| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nwob| #1=#:G297 |p| |nv| |newNext| |newY| #2=#:G285 |newX| #3=#:G284
         |newObj| |inext| |i| |oldObj| #4=#:G296 |oi| |oldObjs| |newObjs|
         #5=#:G295 |o| #6=#:G294)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|FNGRPH;map;$LL2I$;21|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 0 NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 40)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #7#)
                (LETT |inext| (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20))
                      . #7#)
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
                (LETT |newNext|
                      (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20)) . #7#)
                (LETT |nv|
                      (VECTOR |newObj| |newX| |newY| |newNext|
                              (QVELT |oldObj| 4))
                      . #7#)
                (EXIT
                 (COND
                  ((SPADCALL |i| |inext| (QREFELT $ 28))
                   (SPADCALL |newObjs| |i| |nv| (QREFELT $ 68))))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |p| 1 . #7#) (LETT #1# (LENGTH |newObjs|) . #7#) G190
           (COND ((|greater_SI| |p| #1#) (GO G191)))
           (SEQ (LETT |nwob| (SPADCALL |newObjs| |p| (QREFELT $ 40)) . #7#)
                (EXIT (COND ((< (QVELT |nwob| 3) 1) (QSETVELT |nwob| 3 |p|)))))
           (LETT |p| (|inc_SI| |p|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |FNGRPH;mapContra;$LL2I$;22| (|s| |m| |newOb| |offsetX| |offsetY| $)
  (PROG (|nwob| #1=#:G316 |p| |n| |newNext| |incoming| |newY| #2=#:G303 |newX|
         #3=#:G302 |newObj| |inext| |i| |oldObj| #4=#:G315 |oi| |oldObjs|
         |newObjs| #5=#:G314 |o| #6=#:G313)
    (RETURN
     (SEQ
      (LETT |newObjs|
            (PROGN
             (LETT #6# NIL . #7=(|FNGRPH;mapContra;$LL2I$;22|))
             (SEQ (LETT |o| NIL . #7#) (LETT #5# |newOb| . #7#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |o| (CAR #5#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT (LETT #6# (CONS (VECTOR |o| 0 0 0 NIL) #6#) . #7#)))
                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #6#))))
            . #7#)
      (LETT |oldObjs| (QCAR |s|) . #7#)
      (SEQ (LETT |oi| 1 . #7#) (LETT #4# (LENGTH |oldObjs|) . #7#) G190
           (COND ((|greater_SI| |oi| #4#) (GO G191)))
           (SEQ (LETT |oldObj| (SPADCALL |oldObjs| |oi| (QREFELT $ 40)) . #7#)
                (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 20)) . #7#)
                (LETT |inext| (SPADCALL |m| (QVELT |oldObj| 3) (QREFELT $ 20))
                      . #7#)
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
                (LETT |incoming| (SPADCALL |s| |oi| (QREFELT $ 70)) . #7#)
                (COND
                 ((SPADCALL (SPADCALL |incoming| (QREFELT $ 71)) 1
                            (QREFELT $ 28))
                  (|error| "not a FunctionGraph")))
                (LETT |newNext|
                      (SPADCALL |m| (|SPADfirst| |incoming|) (QREFELT $ 20))
                      . #7#)
                (LETT |n|
                      (VECTOR |newObj| |newX| |newY| |newNext|
                              (QVELT |oldObj| 4))
                      . #7#)
                (EXIT
                 (COND
                  ((SPADCALL |i| |inext| (QREFELT $ 28))
                   (SPADCALL |newObjs| |i| |n| (QREFELT $ 68))))))
           (LETT |oi| (|inc_SI| |oi|) . #7#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |p| 1 . #7#) (LETT #1# (LENGTH |newObjs|) . #7#) G190
           (COND ((|greater_SI| |p| #1#) (GO G191)))
           (SEQ (LETT |nwob| (SPADCALL |newObjs| |p| (QREFELT $ 40)) . #7#)
                (EXIT (COND ((< (QVELT |nwob| 3) 1) (QSETVELT |nwob| 3 |p|)))))
           (LETT |p| (|inc_SI| |p|) . #7#) (GO G190) G191 (EXIT NIL))
      (EXIT (LIST |newObjs|)))))) 

(DEFUN |FNGRPH;coAdjoint;$LU;23| (|s| |m| $)
  (PROG (|entry| #1=#:G333 |x| #2=#:G338 |ri| #3=#:G337 |mi| |retOpt| #4=#:G336
         |ret| #5=#:G335 |codomainSize| #6=#:G334 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|FNGRPH;coAdjoint;$LU;23|))
        (LETT |codomainSize| 0 . #7#)
        (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |mi| |codomainSize| (QREFELT $ 73))
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
        (SEQ (LETT |mi| 1 . #7#) (LETT #3# (SPADCALL |m| (QREFELT $ 71)) . #7#)
             G190 (COND ((|greater_SI| |mi| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                                    (QREFELT $ 75))
                          |mi| (QREFELT $ 76))
                         (QREFELT $ 77))))
             (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |entry| 1 . #7#)
        (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
               (GO G191)))
             (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 78)) . #7#)
                  (COND
                   ((EQL |x| 0)
                    (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                  (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                  (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
             (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ret|))))
      #1# (EXIT #1#))))) 

(DEFUN |FNGRPH;contraAdjoint;$LU;24| (|s| |m| $)
  (PROG (|entry| #1=#:G352 |x| #2=#:G357 |ri| #3=#:G356 |mi| |retOpt| #4=#:G355
         |ret| #5=#:G354 |codomainSize| #6=#:G353 |domainSize|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |domainSize| (LENGTH (QCAR |s|))
              . #7=(|FNGRPH;contraAdjoint;$LU;24|))
        (LETT |codomainSize| 0 . #7#)
        (SEQ (LETT |mi| NIL . #7#) (LETT #6# |m| . #7#) G190
             (COND
              ((OR (ATOM #6#) (PROGN (LETT |mi| (CAR #6#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |mi| |codomainSize| (QREFELT $ 73))
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
        (SEQ (LETT |mi| 1 . #7#) (LETT #3# (SPADCALL |m| (QREFELT $ 71)) . #7#)
             G190 (COND ((|greater_SI| |mi| #3#) (GO G191)))
             (SEQ
              (EXIT
               (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                         (SPADCALL
                          (SPADCALL |retOpt| (SPADCALL |m| |mi| (QREFELT $ 20))
                                    (QREFELT $ 75))
                          |mi| (QREFELT $ 76))
                         (QREFELT $ 77))))
             (LETT |mi| (|inc_SI| |mi|) . #7#) (GO G190) G191 (EXIT NIL))
        (LETT |entry| 1 . #7#)
        (SEQ (LETT |ri| NIL . #7#) (LETT #2# |retOpt| . #7#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |ri| (CAR #2#) . #7#) NIL))
               (GO G191)))
             (SEQ (LETT |x| (SPADCALL |s| |ri| (QREFELT $ 81)) . #7#)
                  (COND
                   ((EQL |x| 0)
                    (PROGN (LETT #1# (CONS 1 "failed") . #7#) (GO #1#))))
                  (SPADCALL |ret| |entry| |x| (QREFELT $ 16))
                  (EXIT (LETT |entry| (+ |entry| 1) . #7#)))
             (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ret|))))
      #1# (EXIT #1#))))) 

(DEFUN |FNGRPH;apply;$2Nni;25| (|s| |a| $)
  (QVELT (SPADCALL (QCAR |s|) |a| (QREFELT $ 40)) 3)) 

(DEFUN |FNGRPH;limit;$NniL;26| (|s| |a| $)
  (PROG (|ptr| #1=#:G368 |lp| #2=#:G369 |s1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ptr| |a| . #3=(|FNGRPH;limit;$NniL;26|))
            (SEQ (LETT |s1| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |s1| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |lp| (SPADCALL |s| |ptr| (QREFELT $ 85)) . #3#)
                      (COND
                       ((SPADCALL (LENGTH |lp|) 1 (QREFELT $ 73))
                        (|error| "limit: cant have >1 loop through node")))
                      (COND
                       ((EQL (LENGTH |lp|) 1)
                        (PROGN (LETT #1# (|SPADfirst| |lp|) . #3#) (GO #1#))))
                      (EXIT
                       (LETT |ptr| (SPADCALL |s| |ptr| (QREFELT $ 83)) . #3#)))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL NIL (QREFELT $ 87)))))
      #1# (EXIT #1#))))) 

(DEFUN |FunctionGraph| (#1=#:G370)
  (PROG ()
    (RETURN
     (PROG (#2=#:G371)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|FunctionGraph|)
                                           '|domainEqualList|)
                . #3=(|FunctionGraph|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|FunctionGraph;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|FunctionGraph|))))))))))) 

(DEFUN |FunctionGraph;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionGraph|))
      (LETT |dv$| (LIST '|FunctionGraph| DV$1) . #1#)
      (LETT $ (GETREFV 99) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|FunctionGraph| (LIST DV$1) (CONS 1 $))
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
                                 (|:| |next| (|NonNegativeInteger|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|))))))))
      $)))) 

(MAKEPROP '|FunctionGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              |FNGRPH;functionGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 13) (|:| |map| 15))
              (|List| 10) |FNGRPH;functionGraph;L$;2| (|NonNegativeInteger|)
              (|Integer|) (|List| 13) (0 . |setelt|)
              (|Record| (|:| |value| 6) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 17) (7 . |elt|) (13 . |elt|) (19 . |concat|)
              (|Record| (|:| |name| 41) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 14) (|:| |yOffset| 14)
                        (|:| |map| 15))
              (|List| 22) |FNGRPH;functionGraph;LL$;3| (|Permutation| 6)
              (25 . |One|) (|Boolean|) (29 . ~=)
              (|Record| (|:| |preimage| 8) (|:| |image| 8))
              (35 . |listRepresentation|) (40 . |elt|) (46 . =)
              (52 . |createX|) (58 . |createY|) (|List| 25)
              |FNGRPH;functionGraph;L$;4| (64 . =) |FNGRPH;addObject!;$S$;5|
              |FNGRPH;addObject!;$R$;6| (70 . |elt|) (|String|)
              |FNGRPH;addArrow!;$S2Nni$;7| (76 . |concat|)
              |FNGRPH;getVertices;$L;8| (82 . |concat|) |FNGRPH;getArrows;$L;9|
              |FNGRPH;initial;$;10| |FNGRPH;terminal;S$;11|
              |FNGRPH;cycleOpen;LS$;12| |FNGRPH;cycleClosed;LS$;13|
              |FNGRPH;unit;LS$;14| |FNGRPH;kgraph;LS$;15| (88 . |concat|)
              |FNGRPH;+;3$;16| |FNGRPH;merge;3$;17| (94 . |diagramWidth|)
              (99 . |diagramHeight|) (|Product| 6 6) (104 . |construct|)
              (|Record| (|:| |value| 58) (|:| |posX| 13) (|:| |posY| 13)
                        (|:| |next| 13) (|:| |map| 15))
              (|List| 60) (110 . |concat|) (|FunctionGraph| 58)
              (116 . |functionGraph|) |FNGRPH;*;2$Fg;19| (|Mapping| 6 6 6)
              |FNGRPH;closedTensor;2$M$;20| (121 . |setelt|)
              |FNGRPH;map;$LL2I$;21| (128 . |nodeToNode|) (134 . |#|)
              |FNGRPH;mapContra;$LL2I$;22| (139 . >) (|List| 15) (145 . |elt|)
              (151 . |concat|) (157 . |setelt|) (164 . |max|)
              (|Union| 15 '"failed") |FNGRPH;coAdjoint;$LU;23| (170 . |min|)
              |FNGRPH;contraAdjoint;$LU;24| |FNGRPH;apply;$2Nni;25| (|List| 86)
              (176 . |loopsAtNode|) (|Loop|) (182 . |loop|)
              |FNGRPH;limit;$NniL;26| (|Void|) (|Scene| (|SCartesian| '2))
              (|Matrix| 14) (|Matrix| 13) (|List| 94) (|Tree| 14)
              (|DirectedGraph| $) (|SingleInteger|) (|OutputForm|)
              (|HashState|))
           '#(~= 187 |unit| 193 |terminal| 199 |subdiagramSvg| 204
              |spanningTreeNode| 212 |spanningTreeArrow| 218
              |spanningForestNode| 224 |spanningForestArrow| 229 |routeNodes|
              234 |routeArrows| 241 |outDegree| 248 |nodeToNode| 254
              |nodeToArrow| 260 |nodeFromNode| 266 |nodeFromArrow| 272 |min|
              278 |merge| 289 |max| 295 |mapContra| 306 |map| 315 |looseEquals|
              324 |loopsNodes| 330 |loopsAtNode| 335 |loopsArrows| 341 |limit|
              346 |latex| 352 |laplacianMatrix| 357 |kgraph| 362
              |isGreaterThan?| 368 |isFunctional?| 375 |isFixPoint?| 380
              |isDirected?| 386 |isDirectSuccessor?| 390 |isAcyclic?| 397
              |initial| 402 |incidenceMatrix| 406 |inDegree| 411 |hashUpdate!|
              417 |hash| 423 |getVertices| 428 |getVertexIndex| 433 |getArrows|
              439 |getArrowIndex| 444 |functionGraph| 451 |flatten| 472
              |distanceMatrix| 477 |distance| 482 |diagramWidth| 489
              |diagramSvg| 494 |diagramHeight| 501 |deepDiagramSvg| 506
              |cycleOpen| 513 |cycleClosed| 519 |createY| 525 |createX| 531
              |createWidth| 537 |contraAdjoint| 542 |coerce| 548 |coAdjoint|
              558 |closedTensor| 564 |arrowsToNode| 571 |arrowsToArrow| 577
              |arrowsFromNode| 583 |arrowsFromArrow| 589 |arrowName| 595
              |apply| 602 |adjacencyMatrix| 608 |addObject!| 613 |addArrow!|
              625 = 650 + 656 * 662)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 97)
                           (|BasicType|))
                        (|makeByteWordVec2| 98
                                            '(3 15 13 0 14 13 16 2 18 17 0 14
                                              19 2 15 13 0 14 20 2 11 0 0 10 21
                                              0 25 0 26 2 13 27 0 0 28 1 25 29
                                              0 30 2 8 6 0 14 31 2 6 27 0 0 32
                                              2 0 13 13 13 33 2 0 13 13 13 34 2
                                              11 27 0 0 37 2 11 10 0 14 40 2 18
                                              0 0 17 43 2 23 0 0 22 45 2 11 0 0
                                              0 53 1 0 13 0 56 1 0 13 0 57 2 58
                                              0 6 6 59 2 61 0 0 60 62 1 63 0 61
                                              64 3 11 10 0 14 10 68 2 0 15 0 13
                                              70 1 15 13 0 71 2 13 27 0 0 73 2
                                              74 15 0 14 75 2 15 0 0 13 76 3 74
                                              15 0 14 15 77 2 0 13 0 15 78 2 0
                                              13 0 15 81 2 0 84 0 13 85 1 86 0
                                              15 87 2 0 27 0 0 1 2 0 0 8 41 51
                                              1 0 0 6 48 4 0 89 90 0 27 27 1 2
                                              0 94 0 13 1 2 0 94 0 13 1 1 0 93
                                              0 1 1 0 93 0 1 3 0 15 0 13 13 1 3
                                              0 15 0 13 13 1 2 0 13 0 13 1 2 0
                                              15 0 13 70 2 0 15 0 13 1 2 0 15 0
                                              13 1 2 0 15 0 13 1 1 0 13 0 1 2 0
                                              13 0 15 81 2 0 0 0 0 55 1 0 13 0
                                              1 2 0 13 0 15 78 5 0 0 0 15 8 14
                                              14 72 5 0 0 0 15 8 14 14 69 2 0
                                              27 0 0 1 1 0 84 0 1 2 0 84 0 13
                                              85 1 0 84 0 1 2 0 86 0 13 88 1 0
                                              41 0 1 1 0 91 0 1 2 0 0 8 41 52 3
                                              0 27 0 13 13 1 1 0 27 0 1 2 0 27
                                              0 13 1 0 0 27 1 3 0 27 0 13 13 1
                                              1 0 27 0 1 0 0 0 47 1 0 91 0 1 2
                                              0 13 0 13 1 2 0 98 98 0 1 1 0 96
                                              0 1 1 0 18 0 44 2 0 13 0 6 1 1 0
                                              23 0 46 3 0 13 0 13 13 1 1 0 0 35
                                              36 2 0 0 18 23 24 1 0 0 8 9 1 0 0
                                              11 12 1 0 0 95 1 1 0 91 0 1 3 0
                                              14 0 13 13 1 1 0 13 0 56 3 0 89
                                              41 0 27 1 1 0 13 0 57 3 0 89 41 0
                                              27 1 2 0 0 8 41 49 2 0 0 8 41 50
                                              2 0 13 13 13 34 2 0 13 13 13 33 1
                                              0 13 13 1 2 0 79 0 15 82 1 0 97 0
                                              1 1 0 97 0 1 2 0 79 0 15 80 3 0 0
                                              0 0 66 67 2 0 15 0 13 1 2 0 15 0
                                              13 1 2 0 15 0 13 1 2 0 15 0 13 1
                                              3 0 41 0 13 13 1 2 0 13 0 13 83 1
                                              0 92 0 1 2 0 0 0 17 39 2 0 0 0 6
                                              38 4 0 0 0 41 6 6 1 4 0 0 0 41 13
                                              13 42 5 0 0 0 41 13 13 15 1 2 0
                                              27 0 0 1 2 0 0 0 0 54 2 0 63 0 0
                                              65)))))
           '|lookupComplete|)) 
