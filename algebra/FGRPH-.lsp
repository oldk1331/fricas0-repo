
(SDEFUN |FGRPH-;getVertexIndex;ASNni;1|
        ((|s| A) (|o| S) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G170 NIL) (|i| NIL) (#2=#:G171 NIL) (|v| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |v| NIL . #3=(|FGRPH-;getVertexIndex;ASNni;1|))
                      (LETT #2# (SPADCALL |s| (QREFELT $ 10)) . #3#)
                      (LETT |i| 1 . #3#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |v| 0) |o| (QREFELT $ 12))
                          (PROGN (LETT #1# |i| . #3#) (GO #4=#:G169))))))
                      (LETT |i|
                            (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                            . #3#)
                      (GO G190) G191 (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;addArrow!;AS2SA;2|
        ((|s| A) (|aname| |String|) (|o1| S) (|o2| S) ($ A))
        (SPADCALL |s| |aname| (SPADCALL |s| |o1| (QREFELT $ 15))
                  (SPADCALL |s| |o2| (QREFELT $ 15)) (QREFELT $ 17))) 

(PUT '|FGRPH-;isDirected?;B;3| '|SPADreplace| '(XLAM NIL 'T)) 

(SDEFUN |FGRPH-;isDirected?;B;3| (($ |Boolean|)) 'T) 

(SDEFUN |FGRPH-;incidenceMatrix;AM;4| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G180 NIL) (|ar| NIL) (|j| NIL) (|ss| (|Integer|))
          (|res| (|Matrix| (|Integer|)))
          (|al|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|vl|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |vl| (SPADCALL |s| (QREFELT $ 10))
                . #2=(|FGRPH-;incidenceMatrix;AM;4|))
          (LETT |al| (SPADCALL |s| (QREFELT $ 22)) . #2#)
          (LETT |res| (SPADCALL (LENGTH |vl|) (LENGTH |al|) (QREFELT $ 24))
                . #2#)
          (LETT |ss| (COND ((SPADCALL (QREFELT $ 25)) -1) ('T 1)) . #2#)
          (SEQ (LETT |j| 1 . #2#) (LETT |ar| NIL . #2#) (LETT #1# |al| . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (SPADCALL |res| (QVELT |ar| 2) |j| |ss| (QREFELT $ 27))
                    (EXIT
                     (SPADCALL |res| (QVELT |ar| 3) |j| 1 (QREFELT $ 27))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|) . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FGRPH-;adjacencyMatrix;AM;5|
        ((|s| A) ($ |Matrix| (|NonNegativeInteger|)))
        (SPROG
         ((|m| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G190 NIL)
          (|u| NIL) (#2=#:G189 NIL) (#3=#:G188 NIL) (|v| NIL) (#4=#:G187 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 10)))
                . #5=(|FGRPH-;adjacencyMatrix;AM;5|))
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |v| 1 . #5#) (LETT #3# |n| . #5#) G190
                      (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#) (LETT #1# |n| . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
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
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 32)))))) 

(SDEFUN |FGRPH-;laplacianEntry|
        ((|s| A) (|i| |NonNegativeInteger|) (|j| |NonNegativeInteger|)
         ($ |Integer|))
        (SPROG ((#1=#:G194 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((EQL |i| |j|)
                    (PROGN
                     (LETT #1# (SPADCALL |s| |i| (QREFELT $ 34))
                           . #2=(|FGRPH-;laplacianEntry|))
                     (GO #3=#:G193))))
                  (COND
                   ((SPADCALL |s| |i| |j| (QREFELT $ 29))
                    (PROGN (LETT #1# -1 . #2#) (GO #3#))))
                  (EXIT 0)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;laplacianMatrix;AM;7| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G204 NIL) (|u| NIL)
          (#2=#:G203 NIL) (#3=#:G202 NIL) (|v| NIL) (#4=#:G201 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5=(|FGRPH-;laplacianMatrix;AM;7|))
                 (SEQ (LETT |v| 1 . #5#)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#)
                      G190 (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10)))
                                           . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (|FGRPH-;laplacianEntry| |s| |u|
                                               |v| $)
                                              #2#)
                                             . #5#)))
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;distanceMatrix;AM;8| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G214 NIL) (|u| NIL)
          (#2=#:G213 NIL) (#3=#:G212 NIL) (|v| NIL) (#4=#:G211 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL . #5=(|FGRPH-;distanceMatrix;AM;8|))
                 (SEQ (LETT |v| 1 . #5#)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #5#)
                      G190 (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |u| 1 . #5#)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10)))
                                           . #5#)
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| |u| |v|
                                                        (QREFELT $ 38))
                                              #2#)
                                             . #5#)))
                                     (LETT |u| (|inc_SI| |u|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |v| (|inc_SI| |v|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;spanningTreeArrowRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|)) ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|)))) (#1=#:G219 NIL) (|x| NIL)
          (|aa| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |aa| (SPADCALL |s| |i| (QREFELT $ 41))
                . #2=(|FGRPH-;spanningTreeArrowRecursive|))
          (LETT |ch| NIL . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |aa| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
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
          (EXIT (SPADCALL |i| |ch| (QREFELT $ 49)))))) 

(SDEFUN |FGRPH-;spanningTreeArrow;ANniT;10|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeArrowRecursive| |s| |i| (LIST |i|) $)) 

(SDEFUN |FGRPH-;spanningForestArrow;AL;11|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G225 NIL) (|i| NIL) (#2=#:G224 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FGRPH-;spanningForestArrow;AL;11|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 22))) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 51)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;spanningTreeNodeRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|)) ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|)))) (#1=#:G230 NIL) (|x| NIL)
          (|oa| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |oa| (SPADCALL |s| |i| (QREFELT $ 53))
                . #2=(|FGRPH-;spanningTreeNodeRecursive|))
          (LETT |ch| NIL . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# |oa| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
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
          (EXIT (SPADCALL |i| |ch| (QREFELT $ 49)))))) 

(SDEFUN |FGRPH-;spanningTreeNode;ANniT;13|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeNodeRecursive| |s| |i| (LIST |i|) $)) 

(SDEFUN |FGRPH-;spanningForestNode;AL;14|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G236 NIL) (|i| NIL) (#2=#:G235 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FGRPH-;spanningForestNode;AL;14|))
                 (SEQ (LETT |i| 1 . #3#)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 10))) . #3#)
                      G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| |i| (QREFELT $ 55)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;loopsNodesRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G242 NIL) (#3=#:G248 NIL)
          (|x| NIL) (#4=#:G247 NIL) (#5=#:G239 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G237 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |t| (QREFELT $ 57))
                  . #7=(|FGRPH-;loopsNodesRecursive|))
            (LETT |v| (SPADCALL |t| (QREFELT $ 58)) . #7#)
            (COND
             ((< |v| 0)
              (SEQ
               (LETT |v2|
                     (PROG1 (LETT #6# (- |v|) . #7#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #7#)
               (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 59)) . #7#)
               (COND
                ((< |i| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #7#)
                  (GO #8=#:G246))))
               (LETT |afterIndex|
                     (- (+ (SPADCALL |visited| (QREFELT $ 62)) 1) |i|) . #7#)
               (COND
                ((< |afterIndex| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #7#)
                  (GO #8#))))
               (EXIT
                (PROGN
                 (LETT #4#
                       (LIST
                        (SPADCALL
                         (SPADCALL |visited|
                                   (PROG1 (LETT #5# |afterIndex| . #7#)
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                   (QREFELT $ 63))
                         (QREFELT $ 61)))
                       . #7#)
                 (GO #8#))))))
            (LETT |res| NIL . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |c| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |ll|
                        (|FGRPH-;loopsNodesRecursive| |x|
                         (SPADCALL |visited|
                                   (PROG1 (LETT #2# |v| . #7#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 47))
                         $)
                        . #7#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 65)) . #7#)))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #8# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsNodes;AL;16| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G252 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
         (SEQ (LETT |res| NIL . #2=(|FGRPH-;loopsNodes;AL;16|))
              (LETT |sf| (SPADCALL |s| (QREFELT $ 66)) . #2#)
              (SEQ (LETT |x| NIL . #2#) (LETT #1# |sf| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (|FGRPH-;loopsNodesRecursive| |x| NIL $)
                                     (QREFELT $ 65))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 67)))))) 

(SDEFUN |FGRPH-;loopsAtNode;ANniL;17|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|Loop|)))
        (SPROG ((|st| (|Tree| (|Integer|))))
               (SEQ
                (LETT |st| (SPADCALL |s| |a| (QREFELT $ 55))
                      |FGRPH-;loopsAtNode;ANniL;17|)
                (EXIT
                 (SPADCALL (|FGRPH-;loopsNodesRecursive| |st| NIL $)
                           (QREFELT $ 67)))))) 

(SDEFUN |FGRPH-;loopsArrowsRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G260 NIL) (#3=#:G266 NIL)
          (|x| NIL) (#4=#:G265 NIL) (#5=#:G257 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G255 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |c| (SPADCALL |t| (QREFELT $ 57))
                  . #7=(|FGRPH-;loopsArrowsRecursive|))
            (LETT |v| (SPADCALL |t| (QREFELT $ 58)) . #7#)
            (COND
             ((< |v| 0)
              (SEQ
               (LETT |v2|
                     (PROG1 (LETT #6# (- |v|) . #7#)
                       (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #6#))
                     . #7#)
               (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 59)) . #7#)
               (COND
                ((< |i| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #7#)
                  (GO #8=#:G264))))
               (LETT |afterIndex|
                     (- (+ (SPADCALL |visited| (QREFELT $ 62)) 1) |i|) . #7#)
               (COND
                ((< |afterIndex| 1)
                 (PROGN
                  (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 61))) . #7#)
                  (GO #8#))))
               (EXIT
                (PROGN
                 (LETT #4#
                       (LIST
                        (SPADCALL
                         (SPADCALL |visited|
                                   (PROG1 (LETT #5# |afterIndex| . #7#)
                                     (|check_subtype2| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                   (QREFELT $ 63))
                         (QREFELT $ 61)))
                       . #7#)
                 (GO #8#))))))
            (LETT |res| NIL . #7#)
            (SEQ (LETT |x| NIL . #7#) (LETT #3# |c| . #7#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |ll|
                        (|FGRPH-;loopsArrowsRecursive| |x|
                         (SPADCALL |visited|
                                   (PROG1 (LETT #2# |v| . #7#)
                                     (|check_subtype2| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                   (QREFELT $ 47))
                         $)
                        . #7#)
                  (EXIT
                   (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 65)) . #7#)))
                 (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #8# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsArrows;AL;19| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G270 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
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
              (EXIT (SPADCALL |res| (QREFELT $ 67)))))) 

(SDEFUN |FGRPH-;isAcyclic?;AB;20| ((|s| A) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 72)) NIL (QREFELT $ 73))) 

(SDEFUN |FGRPH-;isDirectSuccessor?;A2NniB;21|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G277 NIL) (#2=#:G278 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |arr| NIL
                         . #3=(|FGRPH-;isDirectSuccessor?;A2NniB;21|))
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
                         (PROGN (LETT #1# 'T . #3#) (GO #4=#:G276))))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;isFixPoint?;ANniB;22|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G284 NIL) (#2=#:G285 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL . #3=(|FGRPH-;isFixPoint?;ANniB;22|))
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (PROGN (LETT #1# 'T . #3#) (GO #4=#:G283))))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;getArrowIndex;A3Nni;23|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G292 NIL) (#2=#:G293 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
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
                    ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2)
                          |a|)
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3)
                            |b|)
                       (PROGN (LETT #1# |arrn| . #3#) (GO #4=#:G291))))))))
                 (LETT |arrn| (|inc_SI| |arrn|) . #3#) (GO G190) G191
                 (EXIT NIL))
            (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;arrowName;A2NniS;24|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |String|))
        (SPROG ((#1=#:G299 NIL) (#2=#:G300 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL . #3=(|FGRPH-;arrowName;A2NniS;24|))
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22)) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |arr| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |b|)
                             (PROGN
                              (LETT #1# (QVELT |arr| 0) . #3#)
                              (GO #4=#:G298))))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT "?")))
                #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;inDegree;A2Nni;25|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G305 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0 . #2=(|FGRPH-;inDegree;A2Nni;25|))
                    (SEQ (LETT |arr| NIL . #2#)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (LETT |count| (+ |count| 1) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;outDegree;A2Nni;26|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G310 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0 . #2=(|FGRPH-;outDegree;A2Nni;26|))
                    (SEQ (LETT |arr| NIL . #2#)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22)) . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 2) |a|)
                             (LETT |count| (+ |count| 1) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;nodeFromNode;ANniL;27|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G315 NIL) (|arr| NIL))
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
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;nodeToNode;ANniL;28|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G320 NIL) (|arr| NIL))
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
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsFromNode;ANniL;29|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G326 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromNode;ANniL;29|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToNode;ANniL;30|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G332 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToNode;ANniL;30|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;nodeFromArrow;ANniL;31|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
                |FGRPH-;nodeFromArrow;ANniL;31|)
          (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 3)))))) 

(SDEFUN |FGRPH-;nodeToArrow;ANniL;32|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (LETT |arrs| (SPADCALL |s| (QREFELT $ 22))
                |FGRPH-;nodeToArrow;ANniL;32|)
          (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 2)))))) 

(SDEFUN |FGRPH-;arrowsFromArrow;ANniL;33|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G342 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsFromArrow;ANniL;33|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 3)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 2))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToArrow;ANniL;34|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G348 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL . #2=(|FGRPH-;arrowsToArrow;ANniL;34|))
              (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #2#)
              (SEQ (LETT |arrn| 1 . #2#) (LETT #1# (LENGTH |arrs|) . #2#) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 77)) 2)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 77)) 3))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 47))
                             . #2#)))))
                   (LETT |arrn| (|inc_SI| |arrn|) . #2#) (GO G190) G191
                   (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;routeNodeRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G359 NIL) (|shortest| (|List| (|NonNegativeInteger|)))
          (|d| #1#) (#3=#:G360 NIL) (|arr| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 62))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 90))
              (PROGN
               (LETT #2# NIL . #4=(|FGRPH-;routeNodeRecursive|))
               (GO #5=#:G358))))
            (LETT |shortest| NIL . #4#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# (LIST |a|) . #4#) (GO #5#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT $ 29))
              (PROGN (LETT #2# (LIST |a| |b|) . #4#) (GO #5#))))
            (SEQ (LETT |arr| NIL . #4#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 22)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |d|
                            (|FGRPH-;routeNodeRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 47)) $)
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT $ 91))
                         (LETT |shortest| |d| . #4#))
                        ((SPADCALL |d| NIL (QREFELT $ 92))
                         (COND
                          ((< (SPADCALL |d| (QREFELT $ 62))
                              (SPADCALL |shortest| (QREFELT $ 62)))
                           (LETT |shortest| |d| . #4#)))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT $ 91))
              (PROGN (LETT #2# NIL . #4#) (GO #5#))))
            (EXIT (CONS |a| |shortest|))))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeNodes;A2NniL;36|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;routeArrowRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G375 NIL)
          (|shortestFullPath| (|List| #3=(|NonNegativeInteger|)))
          (|shortest| (|List| #3#))
          (|fullPath| (|List| (|NonNegativeInteger|))) (|d| #1#) (|aa| #3#)
          (#4=#:G376 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arrn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 62))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 90))
              (PROGN
               (LETT #2# (LIST 0) . #5=(|FGRPH-;routeArrowRecursive|))
               (GO #6=#:G374))))
            (LETT |shortest| (LIST 0) . #5#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# NIL . #5#) (GO #6#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 94)) . #5#)
            (COND
             ((SPADCALL |arrn| 0 (QREFELT $ 95))
              (PROGN (LETT #2# (LIST |arrn|) . #5#) (GO #6#))))
            (LETT |aa| 0 . #5#) (LETT |shortestFullPath| (LIST 0) . #5#)
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)) . #5#)
            (SEQ (LETT |arr| NIL . #5#) (LETT #4# |arrs| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |arr| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 94))
                            . #5#)
                      (LETT |d|
                            (|FGRPH-;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 47)) $)
                            . #5#)
                      (LETT |fullPath| (CONS |aa| |d|) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT $ 91))
                         (SEQ (LETT |shortest| |d| . #5#)
                              (EXIT
                               (LETT |shortestFullPath| |fullPath| . #5#))))
                        ((SPADCALL |d| (LIST 0) (QREFELT $ 92))
                         (COND
                          ((< (SPADCALL |fullPath| (QREFELT $ 62))
                              (SPADCALL |shortestFullPath| (QREFELT $ 62)))
                           (SEQ (LETT |shortest| |d| . #5#)
                                (EXIT
                                 (LETT |shortestFullPath| |fullPath|
                                       . #5#)))))))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT $ 91))
              (PROGN (LETT #2# (LIST 0) . #5#) (GO #6#))))
            (EXIT |shortestFullPath|)))
          #6# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeArrows;A2NniL;38|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeArrowRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;isGreaterThan?;A2NniB;39|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G382 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                              NIL (QREFELT $ 91))
                    (PROGN
                     (LETT #1# NIL . #2=(|FGRPH-;isGreaterThan?;A2NniB;39|))
                     (GO #3=#:G381))))
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |b| |a| NIL $)
                              NIL (QREFELT $ 92))
                    (PROGN (LETT #1# NIL . #2#) (GO #3#))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ANni;40| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G392 NIL) (|fail| (|Boolean|)) (#2=#:G394 NIL) (|j| NIL)
          (#3=#:G393 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ls| (SPADCALL |s| (QREFELT $ 10))
                  . #4=(|FGRPH-;max;ANni;40|))
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#)
                           G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
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
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G391))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ALNni;41|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G402 NIL) (|fail| (|Boolean|)) (#2=#:G404 NIL) (|j| NIL)
          (#3=#:G403 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL . #4=(|FGRPH-;max;ALNni;41|))
                 (LETT #3# |sub| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 95))
                               (COND
                                ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 98)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G401))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ANni;42| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G414 NIL) (|fail| (|Boolean|)) (#2=#:G416 NIL) (|j| NIL)
          (#3=#:G415 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ls| (SPADCALL |s| (QREFELT $ 10))
                  . #4=(|FGRPH-;min;ANni;42|))
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| 1 . #4#) (LETT #2# (LENGTH |ls|) . #4#)
                           G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
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
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G413))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ALNni;43|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G424 NIL) (|fail| (|Boolean|)) (#2=#:G426 NIL) (|j| NIL)
          (#3=#:G425 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL . #4=(|FGRPH-;min;ALNni;43|))
                 (LETT #3# |sub| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fail| NIL . #4#)
                      (SEQ (LETT |j| NIL . #4#) (LETT #2# |sub| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |j| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 95))
                               (COND
                                ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 98)))
                                 (LETT |fail| 'T . #4#)))))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i| . #4#) (GO #5=#:G423))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;distance;A2NniI;44|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Integer|))
        (-
         (SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                   (QREFELT $ 62))
         1)) 

(SDEFUN |FGRPH-;isFunctional?;AB;45| ((|s| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G438 NIL) (|x| NIL)
          (|fromI| (|NonNegativeInteger|)) (#3=#:G437 NIL) (|arr| NIL)
          (|counts| (|List| (|NonNegativeInteger|))) (#4=#:G436 NIL)
          (#5=#:G435 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |counts|
                  (PROGN
                   (LETT #5# NIL . #6=(|FGRPH-;isFunctional?;AB;45|))
                   (SEQ (LETT |x| NIL . #6#)
                        (LETT #4# (SPADCALL |s| (QREFELT $ 10)) . #6#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |x| (CAR #4#) . #6#) NIL))
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
                                 (+ (SPADCALL |counts| |fromI| (QREFELT $ 104))
                                    1)
                                 (QREFELT $ 105))))
                 (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |x| NIL . #6#) (LETT #2# |counts| . #6#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (EQL |x| 1))
                     (PROGN (LETT #1# NIL . #6#) (GO #7=#:G433))))))
                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #7# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createWidth;2Nni;46|
        ((|x| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G443 NIL) (|w| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |w| 1 . #2=(|FGRPH-;createWidth;2Nni;46|)) G190
                       (COND ((|greater_SI| |w| 100) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((>= (* |w| |w|) |x|)
                           (PROGN (LETT #1# |w| . #2#) (GO #3=#:G442))))))
                       (LETT |w| (|inc_SI| |w|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT 100)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createX;3Nni;47|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G451 NIL) (#2=#:G445 NIL)
          (|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|r| (|Union| (|NonNegativeInteger|) #3="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (SPADCALL |x| (QREFELT $ 108))
                  . #4=(|FGRPH-;createX;3Nni;47|))
            (LETT |r| (SPADCALL |n| 1 (QREFELT $ 110)) . #4#)
            (LETT |d|
                  (DIVIDE2
                   (PROG2 (LETT #2# |r| . #4#)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                     (|Union| (|NonNegativeInteger|) #3#) #2#))
                   |w|)
                  . #4#)
            (COND
             ((ODDP (QCAR |d|))
              (PROGN
               (LETT #1#
                     (*
                      (PROG2
                          (LETT #2# (SPADCALL |w| (QCDR |d|) (QREFELT $ 110))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                        (|Union| (|NonNegativeInteger|) #3#)
                                        #2#))
                      2)
                     . #4#)
               (GO #5=#:G450))))
            (EXIT (* (+ (QCDR |d|) 1) 2))))
          #5# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createY;3Nni;48|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#1=#:G453 NIL) (|r| (|Union| (|NonNegativeInteger|) #2="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ
          (LETT |w| (SPADCALL |x| (QREFELT $ 108))
                . #3=(|FGRPH-;createY;3Nni;48|))
          (LETT |r| (SPADCALL |n| 1 (QREFELT $ 110)) . #3#)
          (LETT |d|
                (DIVIDE2
                 (PROG2 (LETT #1# |r| . #3#)
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                   (|Union| (|NonNegativeInteger|) #2#) #1#))
                 |w|)
                . #3#)
          (EXIT (* (+ (QCAR |d|) 1) 2))))) 

(SDEFUN |FGRPH-;subdiagramSvg;SA2BV;49|
        ((|sc| |Scene| (|SCartesian| 2)) (|n| A) (|dispArrowName| |Boolean|)
         (|deep| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G485 NIL) (|s| (|String|))
          (|arrNode| (|Scene| (|SCartesian| 2))) (|offset| (|SCartesian| 2))
          (|tnode| #2=(|Scene| (|SCartesian| 2))) (|fnode| #2#)
          (|subArrNode| (|Scene| (|SCartesian| 2)))
          (|subToY| #3=(|DoubleFloat|)) (|subFromY| #3#) (|subToX| #3#)
          (|subFromX| #3#)
          (|innerObTo|
           #4=(|Record| (|:| |value| (|DirectedGraph| (|String|)))
                        (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))))
          (|innerObFrom| #4#) (#5=#:G490 NIL) (|subArrow| NIL) (#6=#:G491 NIL)
          (|subArrowN| NIL) (|mp| (|List| (|NonNegativeInteger|)))
          (|mt| #7=(|Scene| (|SCartesian| 2))) (|rema| (|Integer|))
          (|arrNumber| (|Integer|))
          (|arrIndex| (|List| (|NonNegativeInteger|)))
          (|midY| #8=(|NonNegativeInteger|)) (|midX| #8#)
          (|toY| #9=(|NonNegativeInteger|)) (#10=#:G474 NIL) (|fromY| #9#)
          (#11=#:G473 NIL) (|toX| #9#) (#12=#:G472 NIL) (|fromX| #9#)
          (#13=#:G471 NIL) (#14=#:G488 NIL) (|arrow| NIL) (#15=#:G489 NIL)
          (|arrn| NIL)
          (|innerOb|
           (|List|
            (|List|
             (|Record| (|:| |value| (|DirectedGraph| (|String|)))
                       (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|))))))
          (|innerObs|
           (|List|
            (|Record| (|:| |value| (|DirectedGraph| (|String|)))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|subNd| (|DirectedGraph| (|String|))) (#16=#:G487 NIL) (|nd| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|indexBounds| (|List| (|Scene| (|SCartesian| 2))))
          (|tn| (|Scene| (|SCartesian| 2)))
          (|ellip| (|Scene| (|SCartesian| 2)))
          (|sh|
           (|Record| (|:| |shptype| (|Symbol|)) (|:| |centre| (|SCartesian| 2))
                     (|:| |size| (|SCartesian| 2)) (|:| |fill| (|Boolean|))))
          (|subgraph| (|DirectedGraph| (|String|)))
          (|indexPointy| (|List| (|NonNegativeInteger|)))
          (|indexPointx| (|List| (|NonNegativeInteger|)))
          (|y| (|NonNegativeInteger|)) (|x| (|NonNegativeInteger|))
          (|indexNodes| (|List| S)) (#17=#:G486 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|mt8| #7#) (|mt7| #7#) (|mt6| #7#) (|mt5| #7#) (|mt4| #7#)
          (|mt3| #7#) (|mt2| #7#) (|mt1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mt1|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "black"
                            "black" (QREFELT $ 115))
                  . #18=(|FGRPH-;subdiagramSvg;SA2BV;49|))
            (LETT |mt2|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                            "blue" (QREFELT $ 115))
                  . #18#)
            (LETT |mt3|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "orange"
                            "orange" (QREFELT $ 115))
                  . #18#)
            (LETT |mt4|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "green"
                            "green" (QREFELT $ 115))
                  . #18#)
            (LETT |mt5|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "brown"
                            "brown" (QREFELT $ 115))
                  . #18#)
            (LETT |mt6|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "grey"
                            "grey" (QREFELT $ 115))
                  . #18#)
            (LETT |mt7|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                            "red" (QREFELT $ 115))
                  . #18#)
            (LETT |mt8|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "purple"
                            "purple" (QREFELT $ 115))
                  . #18#)
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #18#)
            (LETT |indexPointx| NIL . #18#) (LETT |indexPointy| NIL . #18#)
            (LETT |indexBounds| NIL . #18#) (LETT |indexNodes| NIL . #18#)
            (SEQ (LETT |i| NIL . #18#) (LETT #17# |ls| . #18#) G190
                 (COND
                  ((OR (ATOM #17#) (PROGN (LETT |i| (CAR #17#) . #18#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexNodes|
                        (SPADCALL |indexNodes| (QVELT |i| 0) (QREFELT $ 117))
                        . #18#)
                  (LETT |s| (|mathObject2String| (QVELT |i| 0)) . #18#)
                  (LETT |x| (QVELT |i| 1) . #18#)
                  (LETT |y| (QVELT |i| 2) . #18#)
                  (LETT |indexPointx|
                        (SPADCALL |indexPointx| |x| (QREFELT $ 47)) . #18#)
                  (LETT |indexPointy|
                        (SPADCALL |indexPointy| |y| (QREFELT $ 47)) . #18#)
                  (EXIT
                   (COND
                    ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                     (SEQ (LETT |subgraph| (QVELT |i| 0) . #18#)
                          (LETT |sh|
                                (VECTOR '|ellipse|
                                        (SPADCALL
                                         (SPADCALL |x| |y| (QREFELT $ 119))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 122))
                                           (QREFELT $ 123))
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 122))
                                           (QREFELT $ 123))
                                          (QREFELT $ 124))
                                         (QREFELT $ 125))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 122))
                                          (QREFELT $ 123))
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 122))
                                          (QREFELT $ 123))
                                         (QREFELT $ 124))
                                        NIL)
                                . #18#)
                          (LETT |ellip| (SPADCALL |sc| |sh| (QREFELT $ 127))
                                . #18#)
                          (LETT |tn|
                                (SPADCALL |sc| |subgraph| |x| |y|
                                          |dispArrowName| (QREFELT $ 129))
                                . #18#)
                          (EXIT
                           (LETT |indexBounds|
                                 (SPADCALL |indexBounds| |ellip|
                                           (QREFELT $ 131))
                                 . #18#))))
                    ('T
                     (SEQ
                      (LETT |tn|
                            (SPADCALL |sc| |s| 32
                                      (SPADCALL |x| |y| (QREFELT $ 119))
                                      (QREFELT $ 132))
                            . #18#)
                      (EXIT
                       (LETT |indexBounds|
                             (SPADCALL |indexBounds| |tn| (QREFELT $ 131))
                             . #18#)))))))
                 (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #18#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 133))
              (PROGN
               (LETT #1# (SPADCALL (QREFELT $ 135)) . #18#)
               (GO #19=#:G484))))
            (LETT |innerOb| NIL . #18#)
            (COND
             (|deep|
              (COND
               ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                (SEQ (LETT |nd| NIL . #18#) (LETT #16# |indexNodes| . #18#)
                     G190
                     (COND
                      ((OR (ATOM #16#)
                           (PROGN (LETT |nd| (CAR #16#) . #18#) NIL))
                       (GO G191)))
                     (SEQ (LETT |subNd| |nd| . #18#)
                          (LETT |innerObs| (SPADCALL |subNd| (QREFELT $ 138))
                                . #18#)
                          (EXIT
                           (LETT |innerOb|
                                 (SPADCALL |innerOb| |innerObs|
                                           (QREFELT $ 142))
                                 . #18#)))
                     (LETT #16# (CDR #16#) . #18#) (GO G190) G191
                     (EXIT NIL))))))
            (SEQ (LETT |arrn| 1 . #18#) (LETT #15# (LENGTH |arrs|) . #18#)
                 (LETT |arrow| NIL . #18#) (LETT #14# |arrs| . #18#) G190
                 (COND
                  ((OR (ATOM #14#) (PROGN (LETT |arrow| (CAR #14#) . #18#) NIL)
                       (|greater_SI| |arrn| #15#))
                   (GO G191)))
                 (SEQ
                  (LETT |fromX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 2)
                                  (QREFELT $ 104))
                        . #18#)
                  (LETT |toX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 3)
                                  (QREFELT $ 104))
                        . #18#)
                  (LETT |fromX|
                        (PROG1 (LETT #13# (+ |fromX| (QVELT |arrow| 4)) . #18#)
                          (|check_subtype2| (>= #13# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #13#))
                        . #18#)
                  (LETT |toX|
                        (PROG1 (LETT #12# (+ |toX| (QVELT |arrow| 4)) . #18#)
                          (|check_subtype2| (>= #12# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #12#))
                        . #18#)
                  (LETT |fromY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 2)
                                  (QREFELT $ 104))
                        . #18#)
                  (LETT |toY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 3)
                                  (QREFELT $ 104))
                        . #18#)
                  (LETT |fromY|
                        (PROG1 (LETT #11# (+ |fromY| (QVELT |arrow| 5)) . #18#)
                          (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #11#))
                        . #18#)
                  (LETT |toY|
                        (PROG1 (LETT #10# (+ |toY| (QVELT |arrow| 5)) . #18#)
                          (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #10#))
                        . #18#)
                  (LETT |midX| (ASH (+ |toX| |fromX|) -1) . #18#)
                  (LETT |midY| (ASH (+ |toY| |fromY|) -1) . #18#)
                  (LETT |arrIndex|
                        (SPADCALL |n| (QVELT |arrow| 2) (QREFELT $ 143))
                        . #18#)
                  (LETT |arrNumber| (SPADCALL |arrn| |arrIndex| (QREFELT $ 59))
                        . #18#)
                  (LETT |rema| (QCDR (DIVIDE2 |arrNumber| 8)) . #18#)
                  (LETT |mt| |mt1| . #18#)
                  (COND ((EQL |rema| 0) (LETT |mt| |mt1| . #18#)))
                  (COND ((EQL |rema| 1) (LETT |mt| |mt2| . #18#)))
                  (COND ((EQL |rema| 2) (LETT |mt| |mt3| . #18#)))
                  (COND ((EQL |rema| 3) (LETT |mt| |mt4| . #18#)))
                  (COND ((EQL |rema| 4) (LETT |mt| |mt5| . #18#)))
                  (COND ((EQL |rema| 5) (LETT |mt| |mt6| . #18#)))
                  (COND ((EQL |rema| 6) (LETT |mt| |mt7| . #18#)))
                  (COND ((EQL |rema| 7) (LETT |mt| |mt8| . #18#)))
                  (COND
                   (|deep|
                    (COND
                     ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                      (SEQ (LETT |mp| (QVELT |arrow| 6) . #18#)
                           (EXIT
                            (SEQ (LETT |subArrowN| 1 . #18#)
                                 (LETT #6# (SPADCALL |mp| (QREFELT $ 62))
                                       . #18#)
                                 (LETT |subArrow| NIL . #18#)
                                 (LETT #5# |mp| . #18#) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN
                                        (LETT |subArrow| (CAR #5#) . #18#)
                                        NIL)
                                       (|greater_SI| |subArrowN| #6#))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |innerObFrom|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 2)
                                                   (QREFELT $ 144))
                                         |subArrowN| (QREFELT $ 145))
                                        . #18#)
                                  (LETT |innerObTo|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 3)
                                                   (QREFELT $ 144))
                                         |subArrow| (QREFELT $ 145))
                                        . #18#)
                                  (LETT |subFromX|
                                        (|add_DF|
                                         (FLOAT |fromX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 122))
                                           (QREFELT $ 123))))
                                        . #18#)
                                  (LETT |subToX|
                                        (|add_DF|
                                         (FLOAT |toX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 122))
                                           (QREFELT $ 123))))
                                        . #18#)
                                  (LETT |subFromY|
                                        (|add_DF|
                                         (FLOAT |fromY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 122))
                                           (QREFELT $ 123))))
                                        . #18#)
                                  (LETT |subToY|
                                        (|add_DF|
                                         (FLOAT |toY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 122))
                                           (QREFELT $ 123))))
                                        . #18#)
                                  (EXIT
                                   (LETT |subArrNode|
                                         (SPADCALL |mt|
                                                   (LIST
                                                    (LIST
                                                     (SPADCALL |subFromX|
                                                               |subFromY|
                                                               (QREFELT $ 146))
                                                     (SPADCALL |subToX|
                                                               |subToY|
                                                               (QREFELT $
                                                                        146))))
                                                   '|fixed|
                                                   (SPADCALL
                                                    (SPADCALL 1 -1 10
                                                              (QREFELT $ 122))
                                                    (QREFELT $ 123))
                                                   (QREFELT $ 149))
                                         . #18#)))
                                 (LETT #5#
                                       (PROG1 (CDR #5#)
                                         (LETT |subArrowN|
                                               (|inc_SI| |subArrowN|) . #18#))
                                       . #18#)
                                 (GO G190) G191 (EXIT NIL))))))))
                  (EXIT
                   (COND
                    ((NULL |deep|)
                     (SEQ
                      (LETT |fnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 2)
                                      (QREFELT $ 150))
                            . #18#)
                      (LETT |tnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 3)
                                      (QREFELT $ 150))
                            . #18#)
                      (LETT |offset|
                            (SPADCALL (QVELT |arrow| 4) (QVELT |arrow| 5)
                                      (QREFELT $ 119))
                            . #18#)
                      (COND
                       ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset| '|fixed|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 122))
                                         (QREFELT $ 123))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 151)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 152))
                              . #18#))
                       ('T
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset|
                                        '|proportional|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 122))
                                         (QREFELT $ 123))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 151)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 152))
                              . #18#)))
                      (EXIT
                       (COND
                        (|dispArrowName|
                         (SEQ (LETT |s| (QVELT |arrow| 0) . #18#)
                              (EXIT
                               (SPADCALL |mt| |s| 32
                                         (SPADCALL |midX| |midY|
                                                   (QREFELT $ 119))
                                         (QREFELT $ 132))))))))))))
                 (LETT #14#
                       (PROG1 (CDR #14#)
                         (LETT |arrn| (|inc_SI| |arrn|) . #18#))
                       . #18#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT
             (PROGN (LETT #1# (SPADCALL (QREFELT $ 135)) . #18#) (GO #19#)))))
          #19# (EXIT #1#)))) 

(SDEFUN |FGRPH-;diagramSvg;SABV;50|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 119))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 151)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 154)) 10)
                                    (QREFELT $ 119))
                          (QREFELT $ 156))
                . #1=(|FGRPH-;diagramSvg;SABV;50|))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 157)) . #1#)
          (SPADCALL |sc| |n| |dispArrowName| NIL (QREFELT $ 158))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 159)))))) 

(SDEFUN |FGRPH-;deepDiagramSvg;SABV;51|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 119))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 151)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 154)) 10)
                                    (QREFELT $ 119))
                          (QREFELT $ 156))
                . #1=(|FGRPH-;deepDiagramSvg;SABV;51|))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 157)) . #1#)
          (SPADCALL |sc| |n| |dispArrowName| 'T (QREFELT $ 158))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 159)))))) 

(SDEFUN |FGRPH-;diagramWidth;ANni;52| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxx| (|NonNegativeInteger|)) (#1=#:G500 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxx| 0 . #2=(|FGRPH-;diagramWidth;ANni;52|))
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
              (EXIT |maxx|)))) 

(SDEFUN |FGRPH-;diagramHeight;ANni;53| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxy| (|NonNegativeInteger|)) (#1=#:G505 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxy| 0 . #2=(|FGRPH-;diagramHeight;ANni;53|))
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
              (EXIT |maxy|)))) 

(SDEFUN |FGRPH-;looseEquals;2AB;54| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G518 NIL) (#2=#:G519 NIL) (|i| NIL)
          (|ary|
           #3=(|List|
               (|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arx| #3#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH (SPADCALL |x| (QREFELT $ 10)))
                        (LENGTH (SPADCALL |y| (QREFELT $ 10))) (QREFELT $ 95))
              (PROGN
               (LETT #1# NIL . #4=(|FGRPH-;looseEquals;2AB;54|))
               (GO #5=#:G517))))
            (LETT |arx| (SPADCALL |x| (QREFELT $ 22)) . #4#)
            (LETT |ary| (SPADCALL |y| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL (LENGTH |arx|) (LENGTH |ary|) (QREFELT $ 95))
              (PROGN (LETT #1# NIL . #4#) (GO #5#))))
            (SEQ (LETT |i| 1 . #4#) (LETT #2# (LENGTH |arx|) . #4#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 77)) 2)
                              (QVELT (SPADCALL |ary| |i| (QREFELT $ 77)) 2)
                              (QREFELT $ 95))
                    (PROGN (LETT #1# NIL . #4#) (GO #5#))))
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 77)) 3)
                               (QVELT (SPADCALL |ary| |i| (QREFELT $ 77)) 3)
                               (QREFELT $ 95))
                     (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(PUT '|FGRPH-;hash;ASi;55| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |FGRPH-;hash;ASi;55| ((|s| A) ($ |SingleInteger|)) 0) 

(SDEFUN |FGRPH-;latex;AS;56| ((|n| A) ($ |String|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|String|)) (#1=#:G532 NIL) (|arrow| NIL)
          (|arrStr| (|String|)) (#2=#:G530 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#3=#:G531 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "" . #4=(|FGRPH-;latex;AS;56|))
                (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
                (SEQ (LETT |i| NIL . #4#) (LETT #3# |ls| . #4#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQUAL |s| "")
                         (LETT |s| (SPADCALL (QVELT |i| 0) (QREFELT $ 167))
                               . #4#))
                        ('T
                         (LETT |s|
                               (SPADCALL
                                (LIST |s| ","
                                      (SPADCALL (QVELT |i| 0) (QREFELT $ 167)))
                                (QREFELT $ 168))
                               . #4#)))))
                     (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 133))
                  (PROGN (LETT #2# |s| . #4#) (GO #5=#:G529))))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 133))
                  (PROGN (LETT #2# |s| . #4#) (GO #5#))))
                (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 168)) . #4#)
                (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
                (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                       (GO G191)))
                     (SEQ
                      (COND ((NULL |fst|) (LETT |s| (STRCONC |s| ",") . #4#)))
                      (LETT |s|
                            (SPADCALL
                             (LIST |s| (QVELT |arrow| 0) ":"
                                   (SPADCALL
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 2)
                                               (QREFELT $ 169))
                                     0)
                                    (QREFELT $ 167))
                                   |arrStr|
                                   (SPADCALL
                                    (QVELT
                                     (SPADCALL |ls| (QVELT |arrow| 3)
                                               (QREFELT $ 169))
                                     0)
                                    (QREFELT $ 167)))
                             (QREFELT $ 168))
                            . #4#)
                      (EXIT (LETT |fst| 'NIL . #4#)))
                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;=;2AB;57| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G541 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 10))
                              (SPADCALL |y| (QREFELT $ 10)) (QREFELT $ 171))
                    (PROGN
                     (LETT #1# NIL . #2=(|FGRPH-;=;2AB;57|))
                     (GO #3=#:G540))))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 22))
                              (SPADCALL |y| (QREFELT $ 22)) (QREFELT $ 172))
                    (PROGN (LETT #1# NIL . #2#) (GO #3#))))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;~=;2AB;58| ((|x| A) (|y| A) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 174)))) 

(SDEFUN |FGRPH-;coerceSubgraph| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G556 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G554 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G555 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s| (SPADCALL (QREFELT $ 177))
                  . #4=(|FGRPH-;coerceSubgraph|))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (LENGTH |ls|) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |st| (SPADCALL |i| (QREFELT $ 178)) . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |s| (SPADCALL (QREFELT $ 177))
                                   (QREFELT $ 179))
                         (LETT |s| |st| . #4#))
                        ('T
                         (LETT |s|
                               (SPADCALL (LIST |s| "," |st|) (QREFELT $ 180))
                               . #4#)))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 133))
              (PROGN (LETT #2# |s| . #4#) (GO #5=#:G553))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 133))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 180)) . #4#)
            (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
            (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |stFrom| (SPADCALL (QVELT |arrow| 2) (QREFELT $ 178))
                        . #4#)
                  (LETT |stTo| (SPADCALL (QVELT |arrow| 3) (QREFELT $ 178))
                        . #4#)
                  (COND
                   ((NULL |fst|)
                    (LETT |s| (SPADCALL |s| "," (QREFELT $ 181)) . #4#)))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL (QVELT |arrow| 0) (QREFELT $ 182))
                               ":" |stFrom| |arrStr| |stTo|)
                         (QREFELT $ 180))
                        . #4#)
                  (EXIT (LETT |fst| 'NIL . #4#)))
                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;coerce;AOf;60| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G569 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G567 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G568 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
              (PROGN
               (LETT #2# (|FGRPH-;coerceSubgraph| |n| $)
                     . #4=(|FGRPH-;coerce;AOf;60|))
               (GO #5=#:G566))))
            (LETT |s| (SPADCALL (QREFELT $ 177)) . #4#)
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)) . #4#)
            (SEQ (LETT |i| NIL . #4#) (LETT #3# |ls| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |st| (SPADCALL (QVELT |i| 0) (QREFELT $ 183)) . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |s| (SPADCALL (QREFELT $ 177)) (QREFELT $ 179))
                     (LETT |s| |st| . #4#))
                    ('T
                     (LETT |s| (SPADCALL (LIST |s| "," |st|) (QREFELT $ 180))
                           . #4#)))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)) . #4#)
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 133))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 133))
              (PROGN (LETT #2# |s| . #4#) (GO #5#))))
            (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 180)) . #4#)
            (LETT |fst| 'T . #4#) (LETT |arrStr| "->" . #4#)
            (SEQ (LETT |arrow| NIL . #4#) (LETT #1# |arrs| . #4#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |stFrom|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 2) (QREFELT $ 169)) 0)
                         (QREFELT $ 183))
                        . #4#)
                  (LETT |stTo|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 3) (QREFELT $ 169)) 0)
                         (QREFELT $ 183))
                        . #4#)
                  (COND
                   ((NULL |fst|)
                    (LETT |s| (SPADCALL |s| "," (QREFELT $ 181)) . #4#)))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL (QVELT |arrow| 0) (QREFELT $ 182))
                               ":" |stFrom| |arrStr| |stTo|)
                         (QREFELT $ 180))
                        . #4#)
                  (EXIT (LETT |fst| 'NIL . #4#)))
                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
          #5# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |FiniteGraph&;|)) 

(DEFUN |FiniteGraph&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteGraph&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteGraph&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 185) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteGraph&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 7) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 8) (0 . |getVertices|) (|Boolean|) (5 . =)
              (|NonNegativeInteger|) |FGRPH-;getVertexIndex;ASNni;1|
              (11 . |getVertexIndex|) (|String|) (17 . |addArrow!|)
              |FGRPH-;addArrow!;AS2SA;2| |FGRPH-;isDirected?;B;3|
              (|Record| (|:| |name| 16) (|:| |arrType| 13) (|:| |fromOb| 13)
                        (|:| |toOb| 13) (|:| |xOffset| 26) (|:| |yOffset| 26)
                        (|:| |map| 40))
              (|List| 20) (25 . |getArrows|) (|Matrix| 26) (30 . |zero|)
              (36 . |isDirected?|) (|Integer|) (40 . |setelt!|)
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
              (245 . |setelt!|) |FGRPH-;isFunctional?;AB;45|
              |FGRPH-;createWidth;2Nni;46| (252 . |createWidth|)
              (|Union| $ '"failed") (257 . |subtractIfCan|)
              |FGRPH-;createX;3Nni;47| |FGRPH-;createY;3Nni;48| (|DoubleFloat|)
              (|Scene| 118) (263 . |addSceneMaterial|) (|List| 7)
              (271 . |concat|) (|SCartesian| '2) (277 . |sipnt|)
              (|PositiveInteger|) (|Float|) (283 . |float|) (290 . |coerce|)
              (295 . |svec|) (301 . +)
              (|Record| (|:| |shptype| 148) (|:| |centre| 118) (|:| |size| 118)
                        (|:| |fill| 11))
              (307 . |addSceneShape|) (|DirectedGraph| 16)
              (313 . |addSceneGraph|) (|List| 114) (322 . |concat|)
              (328 . |addSceneText|) (336 . =) (|Void|) (342 . |void|)
              (|Record| (|:| |value| 16) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 136) (346 . |getVertices|)
              (|Record| (|:| |value| 128) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 139) (|List| 140) (351 . |concat|) (357 . |arrowsToNode|)
              (363 . |elt|) (369 . |elt|) (375 . |spnt|) (|List| (|List| 118))
              (|Symbol|) (381 . |addSceneArrows|) (389 . |elt|)
              (395 . |diagramWidth|) (400 . |addSceneArrow|)
              |FGRPH-;subdiagramSvg;SA2BV;49| (411 . |diagramHeight|)
              (|SBoundary| 118) (416 . |boxBoundary|) (422 . |createSceneRoot|)
              (427 . |subdiagramSvg|) (435 . |writeSvg|)
              |FGRPH-;diagramSvg;SABV;50| |FGRPH-;deepDiagramSvg;SABV;51|
              |FGRPH-;diagramWidth;ANni;52| |FGRPH-;diagramHeight;ANni;53|
              |FGRPH-;looseEquals;2AB;54| (|SingleInteger|)
              |FGRPH-;hash;ASi;55| (441 . |latex|) (446 . |concat|)
              (451 . |elt|) |FGRPH-;latex;AS;56| (457 . ~=) (463 . ~=)
              |FGRPH-;=;2AB;57| (469 . =) |FGRPH-;~=;2AB;58| (|OutputForm|)
              (475 . |empty|) (479 . |coerce|) (484 . =) (490 . |hconcat|)
              (495 . |hconcat|) (501 . |coerce|) (506 . |coerce|)
              |FGRPH-;coerce;AOf;60|)
           '#(~= 511 |subdiagramSvg| 517 |spanningTreeNode| 525
              |spanningTreeArrow| 531 |spanningForestNode| 537
              |spanningForestArrow| 542 |routeNodes| 547 |routeArrows| 554
              |outDegree| 561 |nodeToNode| 567 |nodeToArrow| 573 |nodeFromNode|
              579 |nodeFromArrow| 585 |min| 591 |max| 602 |looseEquals| 613
              |loopsNodes| 619 |loopsAtNode| 624 |loopsArrows| 630 |latex| 635
              |laplacianMatrix| 640 |isGreaterThan?| 645 |isFunctional?| 652
              |isFixPoint?| 657 |isDirected?| 663 |isDirectSuccessor?| 667
              |isAcyclic?| 674 |incidenceMatrix| 679 |inDegree| 684 |hash| 690
              |getVertexIndex| 695 |getArrowIndex| 701 |distanceMatrix| 708
              |distance| 713 |diagramWidth| 720 |diagramSvg| 725
              |diagramHeight| 732 |deepDiagramSvg| 737 |createY| 744 |createX|
              750 |createWidth| 756 |coerce| 761 |arrowsToNode| 771
              |arrowsToArrow| 777 |arrowsFromNode| 783 |arrowsFromArrow| 789
              |arrowName| 795 |adjacencyMatrix| 802 |addArrow!| 807 = 815)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 184
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
                                                   13 108 2 13 109 0 0 110 4
                                                   114 0 0 113 16 16 115 2 116
                                                   0 0 7 117 2 118 0 26 26 119
                                                   3 121 0 26 26 120 122 1 121
                                                   113 0 123 2 118 0 113 113
                                                   124 2 118 0 0 0 125 2 114 0
                                                   0 126 127 5 114 0 0 128 13
                                                   13 11 129 2 130 0 0 114 131
                                                   4 114 0 0 16 13 118 132 2 21
                                                   11 0 0 133 0 134 0 135 1 128
                                                   137 0 138 2 141 0 0 140 142
                                                   2 6 40 0 13 143 2 141 140 0
                                                   26 144 2 140 139 0 26 145 2
                                                   118 0 113 113 146 4 114 0 0
                                                   147 148 113 149 2 130 114 0
                                                   26 150 1 6 13 0 151 7 114 0
                                                   0 0 0 118 148 113 113 152 1
                                                   6 13 0 154 2 155 0 118 118
                                                   156 1 114 0 155 157 4 6 134
                                                   114 0 11 11 158 2 114 134 0
                                                   16 159 1 7 16 0 167 1 16 0
                                                   48 168 2 9 8 0 26 169 2 9 11
                                                   0 0 171 2 21 11 0 0 172 2 6
                                                   11 0 0 174 0 176 0 177 1 13
                                                   176 0 178 2 176 11 0 0 179 1
                                                   176 0 48 180 2 176 0 0 0 181
                                                   1 16 176 0 182 1 7 176 0 183
                                                   2 0 11 0 0 175 4 0 134 114 0
                                                   11 11 153 2 0 43 0 13 54 2 0
                                                   43 0 13 50 1 0 45 0 56 1 0
                                                   45 0 52 3 0 40 0 13 13 93 3
                                                   0 40 0 13 13 96 2 0 13 0 13
                                                   81 2 0 40 0 13 83 2 0 40 0
                                                   13 87 2 0 40 0 13 82 2 0 40
                                                   0 13 86 1 0 13 0 101 2 0 13
                                                   0 40 102 2 0 13 0 40 100 1 0
                                                   13 0 99 2 0 11 0 0 164 1 0
                                                   64 0 68 2 0 64 0 13 69 1 0
                                                   64 0 71 1 0 16 0 170 1 0 23
                                                   0 37 3 0 11 0 13 13 97 1 0
                                                   11 0 106 2 0 11 0 13 76 0 0
                                                   11 19 3 0 11 0 13 13 75 1 0
                                                   11 0 74 1 0 23 0 28 2 0 13 0
                                                   13 80 1 0 165 0 166 2 0 13 0
                                                   7 14 3 0 13 0 13 13 78 1 0
                                                   23 0 39 3 0 26 0 13 13 103 1
                                                   0 13 0 162 3 0 134 16 0 11
                                                   160 1 0 13 0 163 3 0 134 16
                                                   0 11 161 2 0 13 13 13 112 2
                                                   0 13 13 13 111 1 0 13 13 107
                                                   1 0 176 0 184 1 0 176 0 184
                                                   2 0 40 0 13 85 2 0 40 0 13
                                                   89 2 0 40 0 13 84 2 0 40 0
                                                   13 88 3 0 16 0 13 13 79 1 0
                                                   31 0 33 4 0 0 0 16 7 7 18 2
                                                   0 11 0 0 173)))))
           '|lookupComplete|)) 
