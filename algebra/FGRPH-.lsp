
(/VERSIONCHECK 2) 

(DEFUN |FGRPH-;getVertexIndex;ASNni;1| (|s| |o| $)
  (PROG (#1=#:G189 |i| #2=#:G190 |v|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |v| NIL . #3=(|FGRPH-;getVertexIndex;ASNni;1|))
            (LETT #2# (SPADCALL |s| (QREFELT $ 10)) . #3#) (LETT |i| 1 . #3#)
            G190
            (COND
             ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (QVELT |v| 0) |o| (QREFELT $ 12))
                (PROGN (LETT #1# |i| . #3#) (GO #1#))))))
            (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#)) . #3#)
            (GO G190) G191 (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;addArrow!;AS2SA;2| (|s| |name| |o1| |o2| $)
  (SPADCALL |s| |name| (SPADCALL |s| |o1| (QREFELT $ 15))
            (SPADCALL |s| |o2| (QREFELT $ 15)) (QREFELT $ 17))) 

(PUT '|FGRPH-;isDirected?;B;3| '|SPADreplace| '(XLAM NIL 'T)) 

(DEFUN |FGRPH-;isDirected?;B;3| ($) 'T) 

(DEFUN |FGRPH-;incidenceMatrix;AM;4| (|s| $)
  (PROG (#1=#:G201 |ar| |j| |ss| |res| |al| |vl|)
    (RETURN
     (SEQ
      (LETT |vl| (SPADCALL |s| (QREFELT $ 10))
            . #2=(|FGRPH-;incidenceMatrix;AM;4|))
      (LETT |al| (SPADCALL |s| (QREFELT $ 22)) . #2#)
      (LETT |res| (SPADCALL (LENGTH |vl|) (LENGTH |al|) (QREFELT $ 24)) . #2#)
      (LETT |ss| (COND ((SPADCALL (QREFELT $ 25)) -1) ('T 1)) . #2#)
      (SEQ (LETT |j| 1 . #2#) (LETT |ar| NIL . #2#) (LETT #1# |al| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#) . #2#) NIL))
             (GO G191)))
           (SEQ (SPADCALL |res| (QVELT |ar| 2) |j| |ss| (QREFELT $ 27))
                (EXIT (SPADCALL |res| (QVELT |ar| 3) |j| 1 (QREFELT $ 27))))
           (LETT #1# (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |FGRPH-;adjacencyMatrix;AM;5| (|s| $)
  (PROG (|m| #1=#:G213 |u| #2=#:G212 #3=#:G211 |v| #4=#:G210)
    (RETURN
     (SEQ
      (LETT |m|
            (PROGN
             (LETT #4# NIL . #5=(|FGRPH-;adjacencyMatrix;AM;5|))
             (SEQ (LETT |v| 1 . #5#)
                  (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#) G190
                  (COND ((|greater_SI| |v| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |u| 1 . #5#)
                                 (LETT #1#
                                       (LENGTH (SPADCALL |s| (QREFELT $ 10)))
                                       . #5#)
                                 G190 (COND ((|greater_SI| |u| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (COND
                                           ((SPADCALL |s| |u| |v|
                                                      (QREFELT $ 29))
                                            1)
                                           ('T 0))
                                          #2#)
                                         . #5#)))
                                 (LETT |u| (|inc_SI| |u|) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           #4#)
                          . #5#)))
                  (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT (SPADCALL |m| (QREFELT $ 32))))))) 

(DEFUN |FGRPH-;laplacianEntry| (|s| |i| |j| $)
  (PROG (#1=#:G216)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQL |i| |j|)
          (PROGN
           (LETT #1# (SPADCALL |s| |i| (QREFELT $ 34))
                 . #2=(|FGRPH-;laplacianEntry|))
           (GO #1#))))
        (COND
         ((SPADCALL |s| |i| |j| (QREFELT $ 29))
          (PROGN (LETT #1# -1 . #2#) (GO #1#))))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;laplacianMatrix;AM;7| (|s| $)
  (PROG (|m| #1=#:G227 |u| #2=#:G226 #3=#:G225 |v| #4=#:G224)
    (RETURN
     (SEQ
      (LETT |m|
            (PROGN
             (LETT #4# NIL . #5=(|FGRPH-;laplacianMatrix;AM;7|))
             (SEQ (LETT |v| 1 . #5#)
                  (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#) G190
                  (COND ((|greater_SI| |v| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |u| 1 . #5#)
                                 (LETT #1#
                                       (LENGTH (SPADCALL |s| (QREFELT $ 10)))
                                       . #5#)
                                 G190 (COND ((|greater_SI| |u| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (|FGRPH-;laplacianEntry| |s| |u| |v|
                                           $)
                                          #2#)
                                         . #5#)))
                                 (LETT |u| (|inc_SI| |u|) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           #4#)
                          . #5#)))
                  (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT (SPADCALL |m| (QREFELT $ 36))))))) 

(DEFUN |FGRPH-;distanceMatrix;AM;8| (|s| $)
  (PROG (|m| #1=#:G238 |u| #2=#:G237 #3=#:G236 |v| #4=#:G235)
    (RETURN
     (SEQ
      (LETT |m|
            (PROGN
             (LETT #4# NIL . #5=(|FGRPH-;distanceMatrix;AM;8|))
             (SEQ (LETT |v| 1 . #5#)
                  (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#) G190
                  (COND ((|greater_SI| |v| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4#
                          (CONS
                           (PROGN
                            (LETT #2# NIL . #5#)
                            (SEQ (LETT |u| 1 . #5#)
                                 (LETT #1#
                                       (LENGTH (SPADCALL |s| (QREFELT $ 10)))
                                       . #5#)
                                 G190 (COND ((|greater_SI| |u| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL |s| |u| |v| (QREFELT $ 38))
                                          #2#)
                                         . #5#)))
                                 (LETT |u| (|inc_SI| |u|) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           #4#)
                          . #5#)))
                  (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (EXIT (SPADCALL |m| (QREFELT $ 36))))))) 

(DEFUN |FGRPH-;spanningTreeArrowRecursive| (|s| |i| |visited| $)
  (PROG (|ch| #1=#:G243 |x| |aa|)
    (RETURN
     (SEQ
      (LETT |aa| (SPADCALL |s| |i| (QREFELT $ 41))
            . #2=(|FGRPH-;spanningTreeArrowRecursive|))
      (LETT |ch| NIL . #2#)
      (SEQ (LETT |x| NIL . #2#) (LETT #1# |aa| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |x| |visited| (QREFELT $ 42))
               (LETT |ch|
                     (SPADCALL |ch| (SPADCALL (- |x|) (QREFELT $ 44))
                               (QREFELT $ 46))
                     . #2#))
              ('T
               (LETT |ch|
                     (SPADCALL |ch|
                               (|FGRPH-;spanningTreeArrowRecursive| |s| |x|
                                (SPADCALL |visited| |x| (QREFELT $ 47)) $)
                               (QREFELT $ 46))
                     . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |i| |ch| (QREFELT $ 49))))))) 

(DEFUN |FGRPH-;spanningTreeArrow;ANniT;10| (|s| |i| $)
  (|FGRPH-;spanningTreeArrowRecursive| |s| |i| (LIST |i|) $)) 

(DEFUN |FGRPH-;spanningForestArrow;AL;11| (|s| $)
  (PROG (#1=#:G250 |i| #2=#:G249)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|FGRPH-;spanningForestArrow;AL;11|))
       (SEQ (LETT |i| 1 . #3#)
            (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 22))) . #3#) G190
            (COND ((|greater_SI| |i| #1#) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 51)) #2#) . #3#)))
            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FGRPH-;spanningTreeNodeRecursive| (|s| |i| |visited| $)
  (PROG (|ch| #1=#:G255 |x| |oa|)
    (RETURN
     (SEQ
      (LETT |oa| (SPADCALL |s| |i| (QREFELT $ 53))
            . #2=(|FGRPH-;spanningTreeNodeRecursive|))
      (LETT |ch| NIL . #2#)
      (SEQ (LETT |x| NIL . #2#) (LETT #1# |oa| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |x| |visited| (QREFELT $ 42))
               (LETT |ch|
                     (SPADCALL |ch| (SPADCALL (- |x|) (QREFELT $ 44))
                               (QREFELT $ 46))
                     . #2#))
              ('T
               (LETT |ch|
                     (SPADCALL |ch|
                               (|FGRPH-;spanningTreeNodeRecursive| |s| |x|
                                (SPADCALL |visited| |x| (QREFELT $ 47)) $)
                               (QREFELT $ 46))
                     . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |i| |ch| (QREFELT $ 49))))))) 

(DEFUN |FGRPH-;spanningTreeNode;ANniT;13| (|s| |i| $)
  (|FGRPH-;spanningTreeNodeRecursive| |s| |i| (LIST |i|) $)) 

(DEFUN |FGRPH-;spanningForestNode;AL;14| (|s| $)
  (PROG (#1=#:G262 |i| #2=#:G261)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|FGRPH-;spanningForestNode;AL;14|))
       (SEQ (LETT |i| 1 . #3#)
            (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #3#) G190
            (COND ((|greater_SI| |i| #1#) (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 55)) #2#) . #3#)))
            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |FGRPH-;loopsNodesRecursive| (|t| |visited| $)
  (PROG (|res| |ll| #1=#:G268 #2=#:G273 |x| #3=#:G272 #4=#:G265 |afterIndex|
         |i| |v2| #5=#:G263 |v| |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c| (SPADCALL |t| (QREFELT $ 57))
              . #6=(|FGRPH-;loopsNodesRecursive|))
        (LETT |v| (SPADCALL |t| (QREFELT $ 58)) . #6#)
        (COND
         ((< |v| 0)
          (SEQ
           (LETT |v2|
                 (PROG1 (LETT #5# (- |v|) . #6#)
                   (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                 . #6#)
           (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 59)) . #6#)
           (COND
            ((< |i| 1)
             (PROGN
              (LETT #3# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #6#)
              (GO #3#))))
           (LETT |afterIndex| (- (+ (SPADCALL |visited| (QREFELT $ 62)) 1) |i|)
                 . #6#)
           (COND
            ((< |afterIndex| 1)
             (PROGN
              (LETT #3# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #6#)
              (GO #3#))))
           (EXIT
            (PROGN
             (LETT #3#
                   (LIST
                    (SPADCALL
                     (SPADCALL |visited|
                               (PROG1 (LETT #4# |afterIndex| . #6#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               (QREFELT $ 63))
                     (QREFELT $ 61)))
                   . #6#)
             (GO #3#))))))
        (LETT |res| NIL . #6#)
        (SEQ (LETT |x| NIL . #6#) (LETT #2# |c| . #6#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (LETT |ll|
                    (|FGRPH-;loopsNodesRecursive| |x|
                     (SPADCALL |visited|
                               (PROG1 (LETT #1# |v| . #6#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 47))
                     $)
                    . #6#)
              (EXIT (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 65)) . #6#)))
             (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
        (EXIT |res|)))
      #3# (EXIT #3#))))) 

(DEFUN |FGRPH-;loopsNodes;AL;16| (|s| $)
  (PROG (|res| #1=#:G277 |x| |sf|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|FGRPH-;loopsNodes;AL;16|))
          (LETT |sf| (SPADCALL |s| (QREFELT $ 66)) . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |sf| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res| (|FGRPH-;loopsNodesRecursive| |x| NIL $)
                                 (QREFELT $ 65))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 67))))))) 

(DEFUN |FGRPH-;loopsAtNode;ANniL;17| (|s| |a| $)
  (PROG (|st|)
    (RETURN
     (SEQ
      (LETT |st| (SPADCALL |s| |a| (QREFELT $ 55))
            |FGRPH-;loopsAtNode;ANniL;17|)
      (EXIT
       (SPADCALL (|FGRPH-;loopsNodesRecursive| |st| NIL $) (QREFELT $ 67))))))) 

(DEFUN |FGRPH-;loopsArrowsRecursive| (|t| |visited| $)
  (PROG (|res| |ll| #1=#:G285 #2=#:G290 |x| #3=#:G289 #4=#:G282 |afterIndex|
         |i| |v2| #5=#:G280 |v| |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |c| (SPADCALL |t| (QREFELT $ 57))
              . #6=(|FGRPH-;loopsArrowsRecursive|))
        (LETT |v| (SPADCALL |t| (QREFELT $ 58)) . #6#)
        (COND
         ((< |v| 0)
          (SEQ
           (LETT |v2|
                 (PROG1 (LETT #5# (- |v|) . #6#)
                   (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                 . #6#)
           (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 59)) . #6#)
           (COND
            ((< |i| 1)
             (PROGN
              (LETT #3# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #6#)
              (GO #3#))))
           (LETT |afterIndex| (- (+ (SPADCALL |visited| (QREFELT $ 62)) 1) |i|)
                 . #6#)
           (COND
            ((< |afterIndex| 1)
             (PROGN
              (LETT #3# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #6#)
              (GO #3#))))
           (EXIT
            (PROGN
             (LETT #3#
                   (LIST
                    (SPADCALL
                     (SPADCALL |visited|
                               (PROG1 (LETT #4# |afterIndex| . #6#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               (QREFELT $ 63))
                     (QREFELT $ 61)))
                   . #6#)
             (GO #3#))))))
        (LETT |res| NIL . #6#)
        (SEQ (LETT |x| NIL . #6#) (LETT #2# |c| . #6#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (LETT |ll|
                    (|FGRPH-;loopsArrowsRecursive| |x|
                     (SPADCALL |visited|
                               (PROG1 (LETT #1# |v| . #6#)
                                 (|check_subtype| (>= #1# 0)
                                                  '(|NonNegativeInteger|) #1#))
                               (QREFELT $ 47))
                     $)
                    . #6#)
              (EXIT (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 65)) . #6#)))
             (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
        (EXIT |res|)))
      #3# (EXIT #3#))))) 

(DEFUN |FGRPH-;loopsArrows;AL;19| (|s| $)
  (PROG (|res| #1=#:G294 |x| |sf|)
    (RETURN
     (SEQ (LETT |res| NIL . #2=(|FGRPH-;loopsArrows;AL;19|))
          (LETT |sf| (SPADCALL |s| (QREFELT $ 70)) . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |sf| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (|FGRPH-;loopsArrowsRecursive| |x| NIL $)
                                 (QREFELT $ 65))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |res| (QREFELT $ 67))))))) 

(DEFUN |FGRPH-;isAcyclic?;AB;20| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 72)) NIL (QREFELT $ 73))) 

(DEFUN |FGRPH-;isDirectSuccessor?;A2NniB;21| (|s| |a| |b| $)
  (PROG (#1=#:G301 #2=#:G302 |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |arr| NIL . #3=(|FGRPH-;isDirectSuccessor?;A2NniB;21|))
             (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQL (QVELT |arr| 2) |a|)
                 (COND
                  ((EQL (QVELT |arr| 3) |b|)
                   (PROGN (LETT #1# 'T . #3#) (GO #1#))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;isFixPoint?;ANniB;22| (|s| |a| $)
  (PROG (#1=#:G308 #2=#:G309 |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |arr| NIL . #3=(|FGRPH-;isFixPoint?;ANniB;22|))
             (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQL (QVELT |arr| 2) |a|)
                 (COND
                  ((EQL (QVELT |arr| 3) |a|)
                   (PROGN (LETT #1# 'T . #3#) (GO #1#))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;getArrowIndex;A3Nni;23| (|s| |a| |b| $)
  (PROG (#1=#:G316 #2=#:G317 |arrn| |arrs|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
              . #3=(|FGRPH-;getArrowIndex;A3Nni;23|))
        (SEQ (LETT |arrn| 1 . #3#) (LETT #2# (LENGTH |arrs|) . #3#) G190
             (COND ((|greater_SI| |arrn| #2#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2) |a|)
                 (COND
                  ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3) |b|)
                   (PROGN (LETT #1# |arrn| . #3#) (GO #1#))))))))
             (LETT |arrn| (|inc_SI| |arrn|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;arrowName;A2NniS;24| (|s| |a| |b| $)
  (PROG (#1=#:G323 #2=#:G324 |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |arr| NIL . #3=(|FGRPH-;arrowName;A2NniS;24|))
             (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQL (QVELT |arr| 2) |a|)
                 (COND
                  ((EQL (QVELT |arr| 3) |b|)
                   (PROGN (LETT #1# (QVELT |arr| 0) . #3#) (GO #1#))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT "?")))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;inDegree;A2Nni;25| (|s| |a| $)
  (PROG (|count| #1=#:G330 |arr|)
    (RETURN
     (SEQ (LETT |count| 0 . #2=(|FGRPH-;inDegree;A2Nni;25|))
          (SEQ (LETT |arr| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT |arr| 3) |a|)
                   (LETT |count| (+ |count| 1) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |count|))))) 

(DEFUN |FGRPH-;outDegree;A2Nni;26| (|s| |a| $)
  (PROG (|count| #1=#:G336 |arr|)
    (RETURN
     (SEQ (LETT |count| 0 . #2=(|FGRPH-;outDegree;A2Nni;26|))
          (SEQ (LETT |arr| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT |arr| 2) |a|)
                   (LETT |count| (+ |count| 1) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |count|))))) 

(DEFUN |FGRPH-;nodeFromNode;ANniL;27| (|s| |v| $)
  (PROG (|i| #1=#:G342 |arr|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;nodeFromNode;ANniL;27|))
          (SEQ (LETT |arr| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT |arr| 3) |v|)
                   (LETT |i| (SPADCALL |i| (QVELT |arr| 2) (QREFELT $ 47))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;nodeToNode;ANniL;28| (|s| |v| $)
  (PROG (|i| #1=#:G348 |arr|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;nodeToNode;ANniL;28|))
          (SEQ (LETT |arr| NIL . #2#)
               (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT |arr| 2) |v|)
                   (LETT |i| (SPADCALL |i| (QVELT |arr| 3) (QREFELT $ 47))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;arrowsFromNode;ANniL;29| (|s| |v| $)
  (PROG (|i| #1=#:G355 |arrn| |arrs|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromNode;ANniL;29|))
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
               (COND ((|greater_SI| |arrn| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3) |v|)
                   (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47)) . #2#)))))
               (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;arrowsToNode;ANniL;30| (|s| |v| $)
  (PROG (|i| #1=#:G362 |arrn| |arrs|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToNode;ANniL;30|))
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
               (COND ((|greater_SI| |arrn| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2) |v|)
                   (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47)) . #2#)))))
               (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;nodeFromArrow;ANniL;31| (|s| |a| $)
  (PROG (|arrs|)
    (RETURN
     (SEQ
      (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
            |FGRPH-;nodeFromArrow;ANniL;31|)
      (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 3))))))) 

(DEFUN |FGRPH-;nodeToArrow;ANniL;32| (|s| |a| $)
  (PROG (|arrs|)
    (RETURN
     (SEQ
      (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) |FGRPH-;nodeToArrow;ANniL;32|)
      (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 2))))))) 

(DEFUN |FGRPH-;arrowsFromArrow;ANniL;33| (|s| |a| $)
  (PROG (|i| #1=#:G375 |arrn| |arrs|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromArrow;ANniL;33|))
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
               (COND ((|greater_SI| |arrn| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3)
                        (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 2))
                   (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47)) . #2#)))))
               (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;arrowsToArrow;ANniL;34| (|s| |a| $)
  (PROG (|i| #1=#:G382 |arrn| |arrs|)
    (RETURN
     (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToArrow;ANniL;34|))
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
               (COND ((|greater_SI| |arrn| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2)
                        (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 3))
                   (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47)) . #2#)))))
               (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |i|))))) 

(DEFUN |FGRPH-;routeNodeRecursive| (|s| |a| |b| |visited| $)
  (PROG (#1=#:G394 |shortest| |d| #2=#:G395 |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |visited| (QREFELT $ 62))
                    (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 90))
          (PROGN (LETT #1# NIL . #3=(|FGRPH-;routeNodeRecursive|)) (GO #1#))))
        (LETT |shortest| NIL . #3#)
        (COND ((EQL |a| |b|) (PROGN (LETT #1# (LIST |a|) . #3#) (GO #1#))))
        (COND
         ((SPADCALL |s| |a| |b| (QREFELT $ 29))
          (PROGN (LETT #1# (LIST |a| |b|) . #3#) (GO #1#))))
        (SEQ (LETT |arr| NIL . #3#)
             (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                 (SEQ
                  (LETT |d|
                        (|FGRPH-;routeNodeRecursive| |s| (QVELT |arr| 2) |b|
                         (SPADCALL |visited| |a| (QREFELT $ 47)) $)
                        . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |shortest| NIL (QREFELT $ 91))
                     (LETT |shortest| |d| . #3#))
                    ((SPADCALL |d| NIL (QREFELT $ 92))
                     (COND
                      ((< (SPADCALL |d| (QREFELT $ 62))
                          (SPADCALL |shortest| (QREFELT $ 62)))
                       (LETT |shortest| |d| . #3#)))))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL |shortest| NIL (QREFELT $ 91))
          (PROGN (LETT #1# NIL . #3#) (GO #1#))))
        (EXIT (CONS |a| |shortest|))))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;routeNodes;A2NniL;36| (|s| |a| |b| $)
  (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)) 

(DEFUN |FGRPH-;routeArrowRecursive| (|s| |a| |b| |visited| $)
  (PROG (#1=#:G411 |shortestFullPath| |shortest| |fullPath| |d| |aa| #2=#:G412
         |arr| |arrs| |arrn|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |visited| (QREFELT $ 62))
                    (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 90))
          (PROGN
           (LETT #1# (LIST 0) . #3=(|FGRPH-;routeArrowRecursive|))
           (GO #1#))))
        (LETT |shortest| (LIST 0) . #3#)
        (COND ((EQL |a| |b|) (PROGN (LETT #1# NIL . #3#) (GO #1#))))
        (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 94)) . #3#)
        (COND
         ((SPADCALL |arrn| 0 (QREFELT $ 95))
          (PROGN (LETT #1# (LIST |arrn|) . #3#) (GO #1#))))
        (LETT |aa| 0 . #3#) (LETT |shortestFullPath| (LIST 0) . #3#)
        (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #3#)
        (SEQ (LETT |arr| NIL . #3#) (LETT #2# |arrs| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                 (SEQ
                  (LETT |aa| (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 94))
                        . #3#)
                  (LETT |d|
                        (|FGRPH-;routeArrowRecursive| |s| (QVELT |arr| 2) |b|
                         (SPADCALL |visited| |a| (QREFELT $ 47)) $)
                        . #3#)
                  (LETT |fullPath| (CONS |aa| |d|) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |shortest| (LIST 0) (QREFELT $ 91))
                     (SEQ (LETT |shortest| |d| . #3#)
                          (EXIT (LETT |shortestFullPath| |fullPath| . #3#))))
                    ((SPADCALL |d| (LIST 0) (QREFELT $ 92))
                     (COND
                      ((< (SPADCALL |fullPath| (QREFELT $ 62))
                          (SPADCALL |shortestFullPath| (QREFELT $ 62)))
                       (SEQ (LETT |shortest| |d| . #3#)
                            (EXIT
                             (LETT |shortestFullPath| |fullPath|
                                   . #3#)))))))))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (COND
         ((SPADCALL |shortest| (LIST 0) (QREFELT $ 91))
          (PROGN (LETT #1# (LIST 0) . #3#) (GO #1#))))
        (EXIT |shortestFullPath|)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;routeArrows;A2NniL;38| (|s| |a| |b| $)
  (|FGRPH-;routeArrowRecursive| |s| |a| |b| NIL $)) 

(DEFUN |FGRPH-;isGreaterThan?;A2NniB;39| (|s| |a| |b| $)
  (PROG (#1=#:G417)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $) NIL
                    (QREFELT $ 91))
          (PROGN
           (LETT #1# 'NIL . #2=(|FGRPH-;isGreaterThan?;A2NniB;39|))
           (GO #1#))))
        (COND
         ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |b| |a| NIL $) NIL
                    (QREFELT $ 92))
          (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;max;ANni;40| (|s| $)
  (PROG (#1=#:G427 |fail| #2=#:G429 |j| #3=#:G428 |i| |ls|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #4=(|FGRPH-;max;ANni;40|))
        (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ (LETT |fail| 'NIL . #4#)
                  (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#) G190
                       (COND ((|greater_SI| |j| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |i| |j| (QREFELT $ 95))
                           (COND
                            ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 98)))
                             (LETT |fail| 'T . #4#)))))))
                       (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |fail|) (PROGN (LETT #1# |i| . #4#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;max;ALNni;41| (|s| |sub| $)
  (PROG (#1=#:G436 |fail| #2=#:G438 |j| #3=#:G437 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| NIL . #4=(|FGRPH-;max;ALNni;41|)) (LETT #3# |sub| . #4#)
             G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ (LETT |fail| 'NIL . #4#)
                  (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |i| |j| (QREFELT $ 95))
                           (COND
                            ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 98)))
                             (LETT |fail| 'T . #4#)))))))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |fail|) (PROGN (LETT #1# |i| . #4#) (GO #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;min;ANni;42| (|s| $)
  (PROG (#1=#:G448 |fail| #2=#:G450 |j| #3=#:G449 |i| |ls|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #4=(|FGRPH-;min;ANni;42|))
        (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ (LETT |fail| 'NIL . #4#)
                  (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#) G190
                       (COND ((|greater_SI| |j| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |i| |j| (QREFELT $ 95))
                           (COND
                            ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 98)))
                             (LETT |fail| 'T . #4#)))))))
                       (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |fail|) (PROGN (LETT #1# |i| . #4#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;min;ALNni;43| (|s| |sub| $)
  (PROG (#1=#:G457 |fail| #2=#:G459 |j| #3=#:G458 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| NIL . #4=(|FGRPH-;min;ALNni;43|)) (LETT #3# |sub| . #4#)
             G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ (LETT |fail| 'NIL . #4#)
                  (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |i| |j| (QREFELT $ 95))
                           (COND
                            ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 98)))
                             (LETT |fail| 'T . #4#)))))))
                       (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |fail|) (PROGN (LETT #1# |i| . #4#) (GO #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;distance;A2NniI;44| (|s| |a| |b| $)
  (- (SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $) (QREFELT $ 62))
     1)) 

(DEFUN |FGRPH-;isFunctional?;AB;45| (|s| $)
  (PROG (#1=#:G468 #2=#:G472 |x| |fromI| #3=#:G471 |arr| |counts| #4=#:G470
         #5=#:G469)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |counts|
              (PROGN
               (LETT #5# NIL . #6=(|FGRPH-;isFunctional?;AB;45|))
               (SEQ (LETT |x| NIL . #6#)
                    (LETT #4# (SPADCALL |s| (QREFELT $ 10)) . #6#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #6#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #5# (CONS 0 #5#) . #6#)))
                    (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                    (EXIT (NREVERSE #5#))))
              . #6#)
        (SEQ (LETT |arr| NIL . #6#)
             (LETT #3# (SPADCALL |s| (QREFELT $ 22)) . #6#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #6#) NIL))
               (GO G191)))
             (SEQ (LETT |fromI| (QVELT |arr| 2) . #6#)
                  (EXIT
                   (SPADCALL |counts| |fromI|
                             (+ (SPADCALL |counts| |fromI| (QREFELT $ 104)) 1)
                             (QREFELT $ 105))))
             (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
        (SEQ (LETT |x| NIL . #6#) (LETT #2# |counts| . #6#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((NULL (EQL |x| 1)) (PROGN (LETT #1# 'NIL . #6#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;createWidth;2Nni;46| (|x| $)
  (PROG (#1=#:G476 |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |w| 1 . #2=(|FGRPH-;createWidth;2Nni;46|)) G190
             (COND ((|greater_SI| |w| 100) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((>= (* |w| |w|) |x|) (PROGN (LETT #1# |w| . #2#) (GO #1#))))))
             (LETT |w| (|inc_SI| |w|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT 100)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;createX;3Nni;47| (|x| |n| $)
  (PROG (#1=#:G483 #2=#:G478 |d| |r| |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |w| (SPADCALL |x| (QREFELT $ 108))
              . #3=(|FGRPH-;createX;3Nni;47|))
        (LETT |r| (SPADCALL |n| 1 (QREFELT $ 110)) . #3#)
        (LETT |d|
              (DIVIDE2
               (PROG2 (LETT #2# |r| . #3#)
                   (QCDR #2#)
                 (|check_union| (QEQCAR #2# 0) (|NonNegativeInteger|) #2#))
               |w|)
              . #3#)
        (COND
         ((ODDP (QCAR |d|))
          (PROGN
           (LETT #1#
                 (*
                  (PROG2
                      (LETT #2# (SPADCALL |w| (QCDR |d|) (QREFELT $ 110))
                            . #3#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (|NonNegativeInteger|) #2#))
                  2)
                 . #3#)
           (GO #1#))))
        (EXIT (* (+ (QCDR |d|) 1) 2))))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;createY;3Nni;48| (|x| |n| $)
  (PROG (|d| #1=#:G485 |r| |w|)
    (RETURN
     (SEQ
      (LETT |w| (SPADCALL |x| (QREFELT $ 108)) . #2=(|FGRPH-;createY;3Nni;48|))
      (LETT |r| (SPADCALL |n| 1 (QREFELT $ 110)) . #2#)
      (LETT |d|
            (DIVIDE2
             (PROG2 (LETT #1# |r| . #2#)
                 (QCDR #1#)
               (|check_union| (QEQCAR #1# 0) (|NonNegativeInteger|) #1#))
             |w|)
            . #2#)
      (EXIT (* (+ (QCAR |d|) 1) 2)))))) 

(DEFUN |FGRPH-;diagramSvg;SABV;49| (|fileName| |n| |dispArrowName| $)
  (PROG (|s| |mt| |rema| |arrNumber| |arrIndex| |midY| |midX| |toY| #1=#:G503
         |fromY| #2=#:G502 |toX| #3=#:G501 |fromX| #4=#:G500 #5=#:G511 |arrow|
         #6=#:G512 |arrn| #7=#:G509 |arrs| |lastPointy| |lastPointx| |y| |x|
         #8=#:G510 |i| |ls| |mt8| |mt7| |mt6| |mt5| |mt4| |mt3| |mt2| |mt1|
         |sc| |view|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |view|
              (CONS (SPADCALL 0 0 (QREFELT $ 114))
                    (SPADCALL (+ (SPADCALL |n| (QREFELT $ 115)) 10)
                              (+ (SPADCALL |n| (QREFELT $ 116)) 10)
                              (QREFELT $ 114)))
              . #9=(|FGRPH-;diagramSvg;SABV;49|))
        (LETT |sc| (SPADCALL |view| (QREFELT $ 119)) . #9#)
        (LETT |mt1|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "black"
                        "black" (QREFELT $ 121))
              . #9#)
        (LETT |mt2|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "blue" "blue"
                        (QREFELT $ 121))
              . #9#)
        (LETT |mt3|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "orange"
                        "orange" (QREFELT $ 121))
              . #9#)
        (LETT |mt4|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "green"
                        "green" (QREFELT $ 121))
              . #9#)
        (LETT |mt5|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "brown"
                        "brown" (QREFELT $ 121))
              . #9#)
        (LETT |mt6|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "grey" "grey"
                        (QREFELT $ 121))
              . #9#)
        (LETT |mt7|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "red" "red"
                        (QREFELT $ 121))
              . #9#)
        (LETT |mt8|
              (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "purple"
                        "purple" (QREFELT $ 121))
              . #9#)
        (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #9#)
        (LETT |lastPointx| NIL . #9#) (LETT |lastPointy| NIL . #9#)
        (SEQ (LETT |i| NIL . #9#) (LETT #8# |ls| . #9#) G190
             (COND
              ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#) . #9#) NIL))
               (GO G191)))
             (SEQ (LETT |s| (|mathObject2String| (QVELT |i| 0)) . #9#)
                  (LETT |x| (QVELT |i| 1) . #9#) (LETT |y| (QVELT |i| 2) . #9#)
                  (LETT |lastPointx| (SPADCALL |lastPointx| |x| (QREFELT $ 47))
                        . #9#)
                  (LETT |lastPointy| (SPADCALL |lastPointy| |y| (QREFELT $ 47))
                        . #9#)
                  (EXIT
                   (SPADCALL |sc| |s| 32 (SPADCALL |x| |y| (QREFELT $ 114))
                             (QREFELT $ 122))))
             (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
        (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #9#)
        (COND
         ((SPADCALL |arrs| NIL (QREFELT $ 123))
          (SEQ (SPADCALL |sc| |fileName| (QREFELT $ 125))
               (EXIT
                (PROGN
                 (LETT #7# (SPADCALL (QREFELT $ 126)) . #9#)
                 (GO #7#))))))
        (COND
         ((SPADCALL |arrs| NIL (QREFELT $ 123))
          (SEQ (SPADCALL |sc| |fileName| (QREFELT $ 125))
               (EXIT
                (PROGN
                 (LETT #7# (SPADCALL (QREFELT $ 126)) . #9#)
                 (GO #7#))))))
        (SEQ (LETT |arrn| 1 . #9#) (LETT #6# (LENGTH |arrs|) . #9#)
             (LETT |arrow| NIL . #9#) (LETT #5# |arrs| . #9#) G190
             (COND
              ((OR (ATOM #5#) (PROGN (LETT |arrow| (CAR #5#) . #9#) NIL)
                   (|greater_SI| |arrn| #6#))
               (GO G191)))
             (SEQ
              (LETT |fromX|
                    (SPADCALL |lastPointx| (QVELT |arrow| 2) (QREFELT $ 104))
                    . #9#)
              (LETT |toX|
                    (SPADCALL |lastPointx| (QVELT |arrow| 3) (QREFELT $ 104))
                    . #9#)
              (LETT |fromX|
                    (PROG1 (LETT #4# (+ |fromX| (QVELT |arrow| 4)) . #9#)
                      (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|) #4#))
                    . #9#)
              (LETT |toX|
                    (PROG1 (LETT #3# (+ |toX| (QVELT |arrow| 4)) . #9#)
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #9#)
              (LETT |fromY|
                    (SPADCALL |lastPointy| (QVELT |arrow| 2) (QREFELT $ 104))
                    . #9#)
              (LETT |toY|
                    (SPADCALL |lastPointy| (QVELT |arrow| 3) (QREFELT $ 104))
                    . #9#)
              (LETT |fromY|
                    (PROG1 (LETT #2# (+ |fromY| (QVELT |arrow| 5)) . #9#)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    . #9#)
              (LETT |toY|
                    (PROG1 (LETT #1# (+ |toY| (QVELT |arrow| 5)) . #9#)
                      (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                    . #9#)
              (LETT |midX| (ASH (+ |toX| |fromX|) -1) . #9#)
              (LETT |midY| (ASH (+ |toY| |fromY|) -1) . #9#)
              (LETT |arrIndex| (SPADCALL |n| (QVELT |arrow| 2) (QREFELT $ 127))
                    . #9#)
              (LETT |arrNumber| (SPADCALL |arrn| |arrIndex| (QREFELT $ 59))
                    . #9#)
              (LETT |rema| (QCDR (DIVIDE2 |arrNumber| 8)) . #9#)
              (LETT |mt| |mt1| . #9#)
              (COND ((EQL |rema| 0) (LETT |mt| |mt1| . #9#)))
              (COND ((EQL |rema| 1) (LETT |mt| |mt2| . #9#)))
              (COND ((EQL |rema| 2) (LETT |mt| |mt3| . #9#)))
              (COND ((EQL |rema| 3) (LETT |mt| |mt4| . #9#)))
              (COND ((EQL |rema| 4) (LETT |mt| |mt5| . #9#)))
              (COND ((EQL |rema| 5) (LETT |mt| |mt6| . #9#)))
              (COND ((EQL |rema| 6) (LETT |mt| |mt7| . #9#)))
              (COND ((EQL |rema| 7) (LETT |mt| |mt8| . #9#)))
              (SPADCALL |mt|
                        (LIST
                         (LIST (SPADCALL |fromX| |fromY| (QREFELT $ 114))
                               (SPADCALL |toX| |toY| (QREFELT $ 114))))
                        '|proportional|
                        (SPADCALL (SPADCALL 1 -1 10 (QREFELT $ 130))
                                  (QREFELT $ 131))
                        (QREFELT $ 134))
              (EXIT
               (COND
                (|dispArrowName|
                 (SEQ (LETT |s| (QVELT |arrow| 0) . #9#)
                      (EXIT
                       (SPADCALL |mt| |s| 32
                                 (SPADCALL |midX| |midY| (QREFELT $ 114))
                                 (QREFELT $ 122))))))))
             (LETT #5# (PROG1 (CDR #5#) (LETT |arrn| (|inc_SI| |arrn|) . #9#))
                   . #9#)
             (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 125)))))
      #7# (EXIT #7#))))) 

(DEFUN |FGRPH-;diagramWidth;ANni;50| (|s| $)
  (PROG (|maxx| #1=#:G518 |i| |ls|)
    (RETURN
     (SEQ (LETT |maxx| 0 . #2=(|FGRPH-;diagramWidth;ANni;50|))
          (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |ls| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 1) |maxx| (QREFELT $ 90))
                   (LETT |maxx| (QVELT |i| 1) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |maxx|))))) 

(DEFUN |FGRPH-;diagramHeight;ANni;51| (|s| $)
  (PROG (|maxy| #1=#:G524 |i| |ls|)
    (RETURN
     (SEQ (LETT |maxy| 0 . #2=(|FGRPH-;diagramHeight;ANni;51|))
          (LETT |ls| (SPADCALL |s| (QREFELT $ 10)) . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |ls| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QVELT |i| 2) |maxy| (QREFELT $ 90))
                   (LETT |maxy| (QVELT |i| 2) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |maxy|))))) 

(DEFUN |FGRPH-;toString;AS;52| (|n| $)
  (PROG (|fst| |s| #1=#:G535 |arrow| |arrStr| #2=#:G533 |arrs| #3=#:G534 |i|
         |ls|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |s| "" . #4=(|FGRPH-;toString;AS;52|))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
            (SEQ (LETT |i| NIL . #4#) (LETT #3# |ls| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL |s| "")
                     (LETT |s| (|mathObject2String| (QVELT |i| 0)) . #4#))
                    ('T
                     (LETT |s|
                           (SPADCALL
                            (LIST |s| "," (|mathObject2String| (QVELT |i| 0)))
                            (QREFELT $ 138))
                           . #4#)))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 123))
              (PROGN (LETT #2# |s| . #4#) (GO #2#))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 123))
              (PROGN (LETT #2# |s| . #4#) (GO #2#))))
            (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 138)) . #4#)
            (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
            (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (COND ((NULL |fst|) (LETT |s| (STRCONC |s| ",") . #4#)))
                      (LETT |s|
                            (SPADCALL
                             (LIST |s| (QVELT |arrow| 0) ":"
                                   (|mathObject2String|
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 2)
                                               (QREFELT $ 139))
                                     0))
                                   |arrStr|
                                   (|mathObject2String|
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 3)
                                               (QREFELT $ 139))
                                     0)))
                             (QREFELT $ 138))
                            . #4#)
                      (EXIT (LETT |fst| 'NIL . #4#)))
                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
      #2# (EXIT #2#))))) 

(DEFUN |FGRPH-;looseEquals;2AB;53| (|x| |y| $)
  (PROG (#1=#:G551 #2=#:G552 |i| |ary| |arx|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (LENGTH (SPADCALL |x| (QREFELT $ 10)))
                    (LENGTH (SPADCALL |y| (QREFELT $ 10))) (QREFELT $ 95))
          (PROGN (LETT #1# 'NIL . #3=(|FGRPH-;looseEquals;2AB;53|)) (GO #1#))))
        (LETT |arx| (SPADCALL |x| (QREFELT $ 22)) . #3#)
        (LETT |ary| (SPADCALL |y| (QREFELT $ 22)) . #3#)
        (COND
         ((SPADCALL (LENGTH |arx|) (LENGTH |ary|) (QREFELT $ 95))
          (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (LENGTH |arx|) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (COND
               ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 77)) 2)
                          (QVELT (SPADCALL |ary| |i| (QREFELT $ 77)) 2)
                          (QREFELT $ 95))
                (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))
              (EXIT
               (COND
                ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 77)) 3)
                           (QVELT (SPADCALL |ary| |i| (QREFELT $ 77)) 3)
                           (QREFELT $ 95))
                 (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(PUT '|FGRPH-;hash;ASi;54| '|SPADreplace| '(XLAM (|s|) 0)) 

(DEFUN |FGRPH-;hash;ASi;54| (|s| $) 0) 

(PUT '|FGRPH-;latex;AS;55| '|SPADreplace|
     '(XLAM (|s|) "\\mbox{\\bf Unimplemented}")) 

(DEFUN |FGRPH-;latex;AS;55| (|s| $) "\\mbox{\\bf Unimplemented}") 

(DEFUN |FGRPH-;=;2AB;56| (|x| |y| $)
  (PROG (#1=#:G562)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 10)) (SPADCALL |y| (QREFELT $ 10))
                    (QREFELT $ 145))
          (PROGN (LETT #1# 'NIL . #2=(|FGRPH-;=;2AB;56|)) (GO #1#))))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 22)) (SPADCALL |y| (QREFELT $ 22))
                    (QREFELT $ 146))
          (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |FGRPH-;~=;2AB;57| (|x| |y| $)
  (COND ((SPADCALL |x| |y| (QREFELT $ 148)) 'NIL) ('T 'T))) 

(DEFUN |FGRPH-;coerce;AOf;58| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 150)) (QREFELT $ 152))) 

(DEFUN |FiniteGraph&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteGraph&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FiniteGraph&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 154) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteGraph&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 7) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 8) (0 . |getVertices|) (|Boolean|) (5 . =)
              (|NonNegativeInteger|) |FGRPH-;getVertexIndex;ASNni;1|
              (11 . |getVertexIndex|) (|String|) (17 . |addArrow!|)
              |FGRPH-;addArrow!;AS2SA;2| |FGRPH-;isDirected?;B;3|
              (|Record| (|:| |name| 16) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 26) (|:| |yOffset| 26))
              (|List| 20) (25 . |getArrows|) (|Matrix| 26) (30 . |zero|)
              (36 . |isDirected?|) (|Integer|) (40 . |setelt|)
              |FGRPH-;incidenceMatrix;AM;4| (48 . |isDirectSuccessor?|)
              (|List| 40) (|Matrix| 13) (55 . |matrix|)
              |FGRPH-;adjacencyMatrix;AM;5| (60 . |inDegree|)
              (|List| (|List| 26)) (66 . |matrix|)
              |FGRPH-;laplacianMatrix;AM;7| (71 . |distance|)
              |FGRPH-;distanceMatrix;AM;8| (|List| 13) (78 . |arrowsToArrow|)
              (84 . |entry?|) (|Tree| 26) (90 . |tree|) (|List| 43)
              (95 . |concat|) (101 . |concat|) (|List| $) (107 . |tree|)
              |FGRPH-;spanningTreeArrow;ANniT;10| (113 . |spanningTreeArrow|)
              |FGRPH-;spanningForestArrow;AL;11| (119 . |nodeToNode|)
              |FGRPH-;spanningTreeNode;ANniT;13| (125 . |spanningTreeNode|)
              |FGRPH-;spanningForestNode;AL;14| (131 . |children|)
              (136 . |value|) (141 . |position|) (|Loop|) (147 . |loop|)
              (152 . |#|) (157 . |last|) (|List| 60) (163 . |concat|)
              (169 . |spanningForestNode|) (174 . |removeDuplicates|)
              |FGRPH-;loopsNodes;AL;16| |FGRPH-;loopsAtNode;ANniL;17|
              (179 . |spanningForestArrow|) |FGRPH-;loopsArrows;AL;19|
              (184 . |loopsNodes|) (189 . =) |FGRPH-;isAcyclic?;AB;20|
              |FGRPH-;isDirectSuccessor?;A2NniB;21|
              |FGRPH-;isFixPoint?;ANniB;22| (195 . |elt|)
              |FGRPH-;getArrowIndex;A3Nni;23| |FGRPH-;arrowName;A2NniS;24|
              |FGRPH-;inDegree;A2Nni;25| |FGRPH-;outDegree;A2Nni;26|
              |FGRPH-;nodeFromNode;ANniL;27| |FGRPH-;nodeToNode;ANniL;28|
              |FGRPH-;arrowsFromNode;ANniL;29| |FGRPH-;arrowsToNode;ANniL;30|
              |FGRPH-;nodeFromArrow;ANniL;31| |FGRPH-;nodeToArrow;ANniL;32|
              |FGRPH-;arrowsFromArrow;ANniL;33| |FGRPH-;arrowsToArrow;ANniL;34|
              (201 . >) (207 . =) (213 . ~=) |FGRPH-;routeNodes;A2NniL;36|
              (219 . |getArrowIndex|) (226 . ~=) |FGRPH-;routeArrows;A2NniL;38|
              |FGRPH-;isGreaterThan?;A2NniB;39| (232 . |isGreaterThan?|)
              |FGRPH-;max;ANni;40| |FGRPH-;max;ALNni;41| |FGRPH-;min;ANni;42|
              |FGRPH-;min;ALNni;43| |FGRPH-;distance;A2NniI;44| (239 . |elt|)
              (245 . |setelt|) |FGRPH-;isFunctional?;AB;45|
              |FGRPH-;createWidth;2Nni;46| (252 . |createWidth|)
              (|Union| $ '"failed") (257 . |subtractIfCan|)
              |FGRPH-;createX;3Nni;47| |FGRPH-;createY;3Nni;48|
              (|SCartesian| '2) (263 . |sipnt|) (269 . |diagramWidth|)
              (274 . |diagramHeight|)
              (|Record| (|:| |mins| 113) (|:| |maxs| 113)) (|Scene| 113)
              (279 . |createSceneRoot|) (|DoubleFloat|)
              (284 . |addSceneMaterial|) (292 . |addSceneText|) (300 . =)
              (|Void|) (306 . |writeSvg|) (312 . |void|) (316 . |arrowsToNode|)
              (|PositiveInteger|) (|Float|) (322 . |float|) (329 . |coerce|)
              (|List| (|List| 113)) (|Symbol|) (334 . |addSceneArrows|)
              |FGRPH-;diagramSvg;SABV;49| |FGRPH-;diagramWidth;ANni;50|
              |FGRPH-;diagramHeight;ANni;51| (342 . |concat|) (347 . |elt|)
              |FGRPH-;toString;AS;52| |FGRPH-;looseEquals;2AB;53|
              (|SingleInteger|) |FGRPH-;hash;ASi;54| |FGRPH-;latex;AS;55|
              (353 . ~=) (359 . ~=) |FGRPH-;=;2AB;56| (365 . =)
              |FGRPH-;~=;2AB;57| (371 . |toString|) (|OutputForm|)
              (376 . |coerce|) |FGRPH-;coerce;AOf;58|)
           '#(~= 381 |toString| 387 |spanningTreeNode| 392 |spanningTreeArrow|
              398 |spanningForestNode| 404 |spanningForestArrow| 409
              |routeNodes| 414 |routeArrows| 421 |outDegree| 428 |nodeToNode|
              434 |nodeToArrow| 440 |nodeFromNode| 446 |nodeFromArrow| 452
              |min| 458 |max| 469 |looseEquals| 480 |loopsNodes| 486
              |loopsAtNode| 491 |loopsArrows| 497 |latex| 502 |laplacianMatrix|
              507 |isGreaterThan?| 512 |isFunctional?| 519 |isFixPoint?| 524
              |isDirected?| 530 |isDirectSuccessor?| 534 |isAcyclic?| 541
              |incidenceMatrix| 546 |inDegree| 551 |hash| 557 |getVertexIndex|
              562 |getArrowIndex| 568 |distanceMatrix| 575 |distance| 580
              |diagramWidth| 587 |diagramSvg| 592 |diagramHeight| 599 |createY|
              604 |createX| 610 |createWidth| 616 |coerce| 621 |arrowsToNode|
              631 |arrowsToArrow| 637 |arrowsFromNode| 643 |arrowsFromArrow|
              649 |arrowName| 655 |adjacencyMatrix| 662 |addArrow!| 667 = 675)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 153
                                                 '(1 6 9 0 10 2 7 11 0 0 12 2 6
                                                   13 0 7 15 4 6 0 0 16 13 13
                                                   17 1 6 21 0 22 2 23 0 13 13
                                                   24 0 6 11 25 4 23 26 0 26 26
                                                   26 27 3 6 11 0 13 13 29 1 31
                                                   0 30 32 2 6 13 0 13 34 1 23
                                                   0 35 36 3 6 26 0 13 13 38 2
                                                   6 40 0 13 41 2 40 11 13 0 42
                                                   1 43 0 26 44 2 45 0 0 43 46
                                                   2 40 0 0 13 47 2 43 0 26 48
                                                   49 2 6 43 0 13 51 2 6 40 0
                                                   13 53 2 6 43 0 13 55 1 43 48
                                                   0 57 1 43 26 0 58 2 40 26 13
                                                   0 59 1 60 0 40 61 1 40 13 0
                                                   62 2 40 0 0 13 63 2 64 0 0 0
                                                   65 1 6 45 0 66 1 64 0 0 67 1
                                                   6 45 0 70 1 6 64 0 72 2 64
                                                   11 0 0 73 2 21 20 0 26 77 2
                                                   13 11 0 0 90 2 40 11 0 0 91
                                                   2 40 11 0 0 92 3 6 13 0 13
                                                   13 94 2 13 11 0 0 95 3 6 11
                                                   0 13 13 98 2 40 13 0 26 104
                                                   3 40 13 0 26 13 105 1 6 13
                                                   13 108 2 13 109 0 0 110 2
                                                   113 0 26 26 114 1 6 13 0 115
                                                   1 6 13 0 116 1 118 0 117 119
                                                   4 118 0 0 120 16 16 121 4
                                                   118 0 0 16 13 113 122 2 21
                                                   11 0 0 123 2 118 124 0 16
                                                   125 0 124 0 126 2 6 40 0 13
                                                   127 3 129 0 26 26 128 130 1
                                                   129 120 0 131 4 118 0 0 132
                                                   133 120 134 1 16 0 48 138 2
                                                   9 8 0 26 139 2 9 11 0 0 145
                                                   2 21 11 0 0 146 2 6 11 0 0
                                                   148 1 6 16 0 150 1 16 151 0
                                                   152 2 0 11 0 0 149 1 0 16 0
                                                   140 2 0 43 0 13 54 2 0 43 0
                                                   13 50 1 0 45 0 56 1 0 45 0
                                                   52 3 0 40 0 13 13 93 3 0 40
                                                   0 13 13 96 2 0 13 0 13 81 2
                                                   0 40 0 13 83 2 0 40 0 13 87
                                                   2 0 40 0 13 82 2 0 40 0 13
                                                   86 2 0 13 0 40 102 1 0 13 0
                                                   101 1 0 13 0 99 2 0 13 0 40
                                                   100 2 0 11 0 0 141 1 0 64 0
                                                   68 2 0 64 0 13 69 1 0 64 0
                                                   71 1 0 16 0 144 1 0 23 0 37
                                                   3 0 11 0 13 13 97 1 0 11 0
                                                   106 2 0 11 0 13 76 0 0 11 19
                                                   3 0 11 0 13 13 75 1 0 11 0
                                                   74 1 0 23 0 28 2 0 13 0 13
                                                   80 1 0 142 0 143 2 0 13 0 7
                                                   14 3 0 13 0 13 13 78 1 0 23
                                                   0 39 3 0 26 0 13 13 103 1 0
                                                   13 0 136 3 0 124 16 0 11 135
                                                   1 0 13 0 137 2 0 13 13 13
                                                   112 2 0 13 13 13 111 1 0 13
                                                   13 107 1 0 151 0 153 1 0 151
                                                   0 153 2 0 40 0 13 85 2 0 40
                                                   0 13 89 2 0 40 0 13 84 2 0
                                                   40 0 13 88 3 0 16 0 13 13 79
                                                   1 0 31 0 33 4 0 0 0 16 7 7
                                                   18 2 0 11 0 0 147)))))
           '|lookupComplete|)) 
