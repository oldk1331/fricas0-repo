
(SDEFUN |FGRPH-;getVertexIndex;ASNni;1|
        ((|s| A) (|o| S) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G170 NIL) (|i| NIL) (#2=#:G171 NIL) (|v| NIL)
          (|lv|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |lv| (SPADCALL |s| (QREFELT $ 10)))
                (SEQ (LETT |v| NIL) (LETT #2# |lv|) (LETT |i| 1) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QVELT |v| 0) |o| (QREFELT $ 12))
                         (PROGN (LETT #1# |i|) (GO #3=#:G169))))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #3# (EXIT #1#)))) 

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
         (SEQ (LETT |vl| (SPADCALL |s| (QREFELT $ 10)))
              (LETT |al| (SPADCALL |s| (QREFELT $ 22)))
              (LETT |res|
                    (SPADCALL (LENGTH |vl|) (LENGTH |al|) (QREFELT $ 24)))
              (LETT |ss| (COND ((SPADCALL (QREFELT $ 25)) -1) ('T 1)))
              (SEQ (LETT |j| 1) (LETT |ar| NIL) (LETT #1# |al|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (SPADCALL |res| (QVELT |ar| 2) |j| |ss| (QREFELT $ 27))
                        (EXIT
                         (SPADCALL |res| (QVELT |ar| 3) |j| 1 (QREFELT $ 27))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |j| (|inc_SI| |j|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FGRPH-;adjacencyMatrix;AM;5|
        ((|s| A) ($ |Matrix| (|NonNegativeInteger|)))
        (SPROG
         ((|m| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G190 NIL)
          (|u| NIL) (#2=#:G189 NIL) (#3=#:G188 NIL) (|v| NIL) (#4=#:G187 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 10))))
              (LETT |m|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |v| 1) (LETT #3# |n|) G190
                          (COND ((|greater_SI| |v| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |u| 1) (LETT #1# |n|) G190
                                         (COND
                                          ((|greater_SI| |u| #1#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (COND
                                                   ((SPADCALL |s| |u| |v|
                                                              (QREFELT $ 29))
                                                    1)
                                                   ('T 0))
                                                  #2#))))
                                         (LETT |u| (|inc_SI| |u|)) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   #4#))))
                          (LETT |v| (|inc_SI| |v|)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
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
                     (LETT #1# (SPADCALL |s| |i| (QREFELT $ 34)))
                     (GO #2=#:G193))))
                  (COND
                   ((SPADCALL |s| |i| |j| (QREFELT $ 29))
                    (PROGN (LETT #1# -1) (GO #2#))))
                  (EXIT 0)))
                #2# (EXIT #1#)))) 

(SDEFUN |FGRPH-;laplacianMatrix;AM;7| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G204 NIL) (|u| NIL)
          (#2=#:G203 NIL) (#3=#:G202 NIL) (|v| NIL) (#4=#:G201 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |v| 1)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10)))) G190
                      (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |u| 1)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10))))
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (|FGRPH-;laplacianEntry| |s| |u|
                                               |v| $)
                                              #2#))))
                                     (LETT |u| (|inc_SI| |u|)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |v| (|inc_SI| |v|)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;distanceMatrix;AM;8| ((|s| A) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|m| (|List| (|List| (|Integer|)))) (#1=#:G214 NIL) (|u| NIL)
          (#2=#:G213 NIL) (#3=#:G212 NIL) (|v| NIL) (#4=#:G211 NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |v| 1)
                      (LETT #3# (LENGTH (SPADCALL |s| (QREFELT $ 10)))) G190
                      (COND ((|greater_SI| |v| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |u| 1)
                                     (LETT #1#
                                           (LENGTH
                                            (SPADCALL |s| (QREFELT $ 10))))
                                     G190
                                     (COND ((|greater_SI| |u| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| |u| |v|
                                                        (QREFELT $ 38))
                                              #2#))))
                                     (LETT |u| (|inc_SI| |u|)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT |v| (|inc_SI| |v|)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (SPADCALL |m| (QREFELT $ 36)))))) 

(SDEFUN |FGRPH-;spanningTreeArrowRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |Reference| (|List| (|NonNegativeInteger|)))
         ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|))))
          (|visited1| (|List| (|NonNegativeInteger|))) (#1=#:G220 NIL)
          (|x| NIL) (|aa| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |aa| (SPADCALL |s| |i| (QREFELT $ 41))) (LETT |ch| NIL)
              (LETT |visited1| (SPADCALL |visited| (QREFELT $ 43)))
              (SEQ (LETT |x| NIL) (LETT #1# |aa|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |x| |visited1| (QREFELT $ 44))
                       (LETT |ch|
                             (SPADCALL |ch| (SPADCALL (- |x|) (QREFELT $ 46))
                                       (QREFELT $ 48))))
                      ('T
                       (SEQ
                        (LETT |visited1|
                              (SPADCALL |visited1| |x| (QREFELT $ 49)))
                        (SPADCALL |visited| |visited1| (QREFELT $ 50))
                        (EXIT
                         (LETT |ch|
                               (SPADCALL |ch|
                                         (|FGRPH-;spanningTreeArrowRecursive|
                                          |s| |x| |visited| $)
                                         (QREFELT $ 48)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |i| |ch| (QREFELT $ 52)))))) 

(SDEFUN |FGRPH-;spanningTreeArrow;ANniT;10|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeArrowRecursive| |s| |i|
         (SPADCALL (LIST |i|) (QREFELT $ 53)) $)) 

(SDEFUN |FGRPH-;spanningForestArrow;AL;11|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G226 NIL) (|i| NIL) (#2=#:G225 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 22)))) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |s| |i| (QREFELT $ 55)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;spanningTreeNodeRecursive|
        ((|s| A) (|i| |NonNegativeInteger|)
         (|visited| |Reference| (|List| (|NonNegativeInteger|)))
         ($ |Tree| (|Integer|)))
        (SPROG
         ((|ch| (|List| (|Tree| (|Integer|)))) (#1=#:G234 NIL) (|n| NIL)
          (#2=#:G235 NIL) (|flag| NIL)
          (|visited1| (|List| (|NonNegativeInteger|)))
          (|flags| (|List| (|Boolean|))) (#3=#:G233 NIL)
          (|oa| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |oa| (SPADCALL |s| |i| (QREFELT $ 57))) (LETT |ch| NIL)
              (LETT |flags| NIL)
              (LETT |visited1| (SPADCALL |visited| (QREFELT $ 43)))
              (SEQ (LETT |n| NIL) (LETT #3# |oa|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |n| |visited1| (QREFELT $ 44))
                       (LETT |flags| (SPADCALL |flags| NIL (QREFELT $ 59))))
                      ('T
                       (SEQ (LETT |flags| (SPADCALL |flags| 'T (QREFELT $ 59)))
                            (EXIT
                             (LETT |visited1|
                                   (SPADCALL |visited1| |n|
                                             (QREFELT $ 49)))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL |visited| |visited1| (QREFELT $ 50))
              (SEQ (LETT |flag| NIL) (LETT #2# |flags|) (LETT |n| NIL)
                   (LETT #1# |oa|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL) (ATOM #2#)
                         (PROGN (LETT |flag| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      (|flag|
                       (LETT |ch|
                             (SPADCALL |ch|
                                       (|FGRPH-;spanningTreeNodeRecursive| |s|
                                        |n| |visited| $)
                                       (QREFELT $ 48)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (SPADCALL |i| |ch| (QREFELT $ 52)))))) 

(SDEFUN |FGRPH-;spanningTreeNode;ANniT;13|
        ((|s| A) (|i| |NonNegativeInteger|) ($ |Tree| (|Integer|)))
        (|FGRPH-;spanningTreeNodeRecursive| |s| |i|
         (SPADCALL (LIST |i|) (QREFELT $ 53)) $)) 

(SDEFUN |FGRPH-;spanningForestNode;AL;14|
        ((|s| A) ($ |List| (|Tree| (|Integer|))))
        (SPROG ((#1=#:G241 NIL) (|i| NIL) (#2=#:G240 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1)
                      (LETT #1# (LENGTH (SPADCALL |s| (QREFELT $ 10)))) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |s| |i| (QREFELT $ 61)) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FGRPH-;loopsNodesRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G247 NIL) (#3=#:G253 NIL)
          (|x| NIL) (#4=#:G252 NIL) (#5=#:G244 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G242 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |c| (SPADCALL |t| (QREFELT $ 63)))
                (LETT |v| (SPADCALL |t| (QREFELT $ 64)))
                (COND
                 ((< |v| 0)
                  (SEQ
                   (LETT |v2|
                         (PROG1 (LETT #6# (- |v|))
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#)))
                   (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 65)))
                   (COND
                    ((< |i| 1)
                     (PROGN
                      (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))))
                      (GO #7=#:G251))))
                   (LETT |afterIndex|
                         (- (+ (SPADCALL |visited| (QREFELT $ 68)) 1) |i|))
                   (COND
                    ((< |afterIndex| 1)
                     (PROGN
                      (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))))
                      (GO #7#))))
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (LIST
                            (SPADCALL
                             (SPADCALL |visited|
                                       (PROG1 (LETT #5# |afterIndex|)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 69))
                             (QREFELT $ 67))))
                     (GO #7#))))))
                (LETT |res| NIL)
                (SEQ (LETT |x| NIL) (LETT #3# |c|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |ll|
                            (|FGRPH-;loopsNodesRecursive| |x|
                             (SPADCALL |visited|
                                       (PROG1 (LETT #2# |v|)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 49))
                             $))
                      (EXIT (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 71)))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #7# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsNodes;AL;16| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G257 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
         (SEQ (LETT |res| NIL) (LETT |sf| (SPADCALL |s| (QREFELT $ 72)))
              (SEQ (LETT |x| NIL) (LETT #1# |sf|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (|FGRPH-;loopsNodesRecursive| |x| NIL $)
                                     (QREFELT $ 71)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;loopsAtNode;ANniL;17|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|Loop|)))
        (SPROG ((|st| (|Tree| (|Integer|))))
               (SEQ (LETT |st| (SPADCALL |s| |a| (QREFELT $ 61)))
                    (EXIT
                     (SPADCALL (|FGRPH-;loopsNodesRecursive| |st| NIL $)
                               (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;loopsArrowsRecursive|
        ((|t| |Tree| (|Integer|)) (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|Loop|))))
        (SPROG
         ((|res| (|List| (|Loop|))) (|ll| #1#) (#2=#:G265 NIL) (#3=#:G271 NIL)
          (|x| NIL) (#4=#:G270 NIL) (#5=#:G262 NIL) (|afterIndex| (|Integer|))
          (|i| (|Integer|)) (|v2| (|NonNegativeInteger|)) (#6=#:G260 NIL)
          (|v| (|Integer|)) (|c| (|List| (|Tree| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |c| (SPADCALL |t| (QREFELT $ 63)))
                (LETT |v| (SPADCALL |t| (QREFELT $ 64)))
                (COND
                 ((< |v| 0)
                  (SEQ
                   (LETT |v2|
                         (PROG1 (LETT #6# (- |v|))
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#)))
                   (LETT |i| (SPADCALL |v2| |visited| (QREFELT $ 65)))
                   (COND
                    ((< |i| 1)
                     (PROGN
                      (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))))
                      (GO #7=#:G269))))
                   (LETT |afterIndex|
                         (- (+ (SPADCALL |visited| (QREFELT $ 68)) 1) |i|))
                   (COND
                    ((< |afterIndex| 1)
                     (PROGN
                      (LETT #4# (LIST (SPADCALL |visited| (QREFELT $ 67))))
                      (GO #7#))))
                   (EXIT
                    (PROGN
                     (LETT #4#
                           (LIST
                            (SPADCALL
                             (SPADCALL |visited|
                                       (PROG1 (LETT #5# |afterIndex|)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 69))
                             (QREFELT $ 67))))
                     (GO #7#))))))
                (LETT |res| NIL)
                (SEQ (LETT |x| NIL) (LETT #3# |c|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |ll|
                            (|FGRPH-;loopsArrowsRecursive| |x|
                             (SPADCALL |visited|
                                       (PROG1 (LETT #2# |v|)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 49))
                             $))
                      (EXIT (LETT |res| (SPADCALL |res| |ll| (QREFELT $ 71)))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #7# (EXIT #4#)))) 

(SDEFUN |FGRPH-;loopsArrows;AL;19| ((|s| A) ($ |List| (|Loop|)))
        (SPROG
         ((|res| (|List| (|Loop|))) (#1=#:G275 NIL) (|x| NIL)
          (|sf| (|List| (|Tree| (|Integer|)))))
         (SEQ (LETT |res| NIL) (LETT |sf| (SPADCALL |s| (QREFELT $ 76)))
              (SEQ (LETT |x| NIL) (LETT #1# |sf|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (|FGRPH-;loopsArrowsRecursive| |x| NIL $)
                                     (QREFELT $ 71)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT $ 73)))))) 

(SDEFUN |FGRPH-;isAcyclic?;AB;20| ((|s| A) ($ |Boolean|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 78)) NIL (QREFELT $ 79))) 

(SDEFUN |FGRPH-;isDirectSuccessor?;A2NniB;21|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G282 NIL) (#2=#:G283 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL)
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |b|)
                             (PROGN (LETT #1# 'T) (GO #3=#:G281))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;isFixPoint?;ANniB;22|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G289 NIL) (#2=#:G290 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL)
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (PROGN (LETT #1# 'T) (GO #3=#:G288))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;getArrowIndex;A3Nni;23|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G297 NIL) (#2=#:G298 NIL) (|arrn| NIL)
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
           (SEQ (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
                (SEQ (LETT |arrn| 1) (LETT #2# (LENGTH |arrs|)) G190
                     (COND ((|greater_SI| |arrn| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                              |a|)
                         (COND
                          ((EQL
                            (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            |b|)
                           (PROGN (LETT #1# |arrn|) (GO #3=#:G296))))))))
                     (LETT |arrn| (|inc_SI| |arrn|)) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;arrowName;A2NniS;24|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |String|))
        (SPROG ((#1=#:G304 NIL) (#2=#:G305 NIL) (|arr| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |arr| NIL)
                       (LETT #2# (SPADCALL |s| (QREFELT $ 22))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |arr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (QVELT |arr| 2) |a|)
                           (COND
                            ((EQL (QVELT |arr| 3) |b|)
                             (PROGN
                              (LETT #1# (QVELT |arr| 0))
                              (GO #3=#:G303))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT "?")))
                #3# (EXIT #1#)))) 

(SDEFUN |FGRPH-;inDegree;A2Nni;25|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G310 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0)
                    (SEQ (LETT |arr| NIL)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 3) |a|)
                             (LETT |count| (+ |count| 1))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;outDegree;A2Nni;26|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|count| (|NonNegativeInteger|)) (#1=#:G315 NIL) (|arr| NIL))
               (SEQ (LETT |count| 0)
                    (SEQ (LETT |arr| NIL)
                         (LETT #1# (SPADCALL |s| (QREFELT $ 22))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL (QVELT |arr| 2) |a|)
                             (LETT |count| (+ |count| 1))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |count|)))) 

(SDEFUN |FGRPH-;nodeFromNode;ANniL;27|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G320 NIL) (|arr| NIL))
         (SEQ (LETT |i| NIL)
              (SEQ (LETT |arr| NIL) (LETT #1# (SPADCALL |s| (QREFELT $ 22)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT |arr| 3) |v|)
                       (LETT |i|
                             (SPADCALL |i| (QVELT |arr| 2) (QREFELT $ 49)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;nodeToNode;ANniL;28|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G325 NIL) (|arr| NIL))
         (SEQ (LETT |i| NIL)
              (SEQ (LETT |arr| NIL) (LETT #1# (SPADCALL |s| (QREFELT $ 22)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT |arr| 2) |v|)
                       (LETT |i|
                             (SPADCALL |i| (QVELT |arr| 3) (QREFELT $ 49)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsFromNode;ANniL;29|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G331 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL) (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (SEQ (LETT |arrn| 1) (LETT #1# (LENGTH |arrs|)) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49)))))))
                   (LETT |arrn| (|inc_SI| |arrn|)) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToNode;ANniL;30|
        ((|s| A) (|v| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G337 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL) (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (SEQ (LETT |arrn| 1) (LETT #1# (LENGTH |arrs|)) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                            |v|)
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49)))))))
                   (LETT |arrn| (|inc_SI| |arrn|)) (GO G190) G191 (EXIT NIL))
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
         (SEQ (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 3)))))) 

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
         (SEQ (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (EXIT (LIST (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 2)))))) 

(SDEFUN |FGRPH-;arrowsFromArrow;ANniL;33|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G347 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL) (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (SEQ (LETT |arrn| 1) (LETT #1# (LENGTH |arrs|)) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 3)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 2))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49)))))))
                   (LETT |arrn| (|inc_SI| |arrn|)) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;arrowsToArrow;ANniL;34|
        ((|s| A) (|a| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|List| (|NonNegativeInteger|))) (#1=#:G353 NIL) (|arrn| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |i| NIL) (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
              (SEQ (LETT |arrn| 1) (LETT #1# (LENGTH |arrs|)) G190
                   (COND ((|greater_SI| |arrn| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (QVELT (SPADCALL |arrs| |arrn| (QREFELT $ 83)) 2)
                            (QVELT (SPADCALL |arrs| |a| (QREFELT $ 83)) 3))
                       (LETT |i| (SPADCALL |i| |arrn| (QREFELT $ 49)))))))
                   (LETT |arrn| (|inc_SI| |arrn|)) (GO G190) G191 (EXIT NIL))
              (EXIT |i|)))) 

(SDEFUN |FGRPH-;routeNodeRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G364 NIL) (|shortest| (|List| (|NonNegativeInteger|)))
          (|d| #1#) (#3=#:G365 NIL) (|arr| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 68))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 96))
              (PROGN (LETT #2# NIL) (GO #4=#:G363))))
            (LETT |shortest| NIL)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# (LIST |a|)) (GO #4#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT $ 29))
              (PROGN (LETT #2# (LIST |a| |b|)) (GO #4#))))
            (SEQ (LETT |arr| NIL) (LETT #3# (SPADCALL |s| (QREFELT $ 22))) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |d|
                            (|FGRPH-;routeNodeRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 49)) $))
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT $ 97))
                         (LETT |shortest| |d|))
                        ((SPADCALL |d| NIL (QREFELT $ 98))
                         (COND
                          ((< (SPADCALL |d| (QREFELT $ 68))
                              (SPADCALL |shortest| (QREFELT $ 68)))
                           (LETT |shortest| |d|)))))))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT $ 97))
              (PROGN (LETT #2# NIL) (GO #4#))))
            (EXIT (CONS |a| |shortest|))))
          #4# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeNodes;A2NniL;36|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;routeArrowRecursive|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G380 NIL)
          (|shortestFullPath| (|List| #3=(|NonNegativeInteger|)))
          (|shortest| (|List| #3#))
          (|fullPath| (|List| (|NonNegativeInteger|))) (|d| #1#) (|aa| #3#)
          (#4=#:G381 NIL) (|arr| NIL)
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
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 68))
                        (LENGTH (SPADCALL |s| (QREFELT $ 10))) (QREFELT $ 96))
              (PROGN (LETT #2# (LIST 0)) (GO #5=#:G379))))
            (LETT |shortest| (LIST 0))
            (COND ((EQL |a| |b|) (PROGN (LETT #2# NIL) (GO #5#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 100)))
            (COND
             ((SPADCALL |arrn| 0 (QREFELT $ 101))
              (PROGN (LETT #2# (LIST |arrn|)) (GO #5#))))
            (LETT |aa| 0) (LETT |shortestFullPath| (LIST 0))
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 22)))
            (SEQ (LETT |arr| NIL) (LETT #4# |arrs|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |arr| (CAR #4#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 29))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 100)))
                      (LETT |d|
                            (|FGRPH-;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 49)) $))
                      (LETT |fullPath| (CONS |aa| |d|))
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT $ 97))
                         (SEQ (LETT |shortest| |d|)
                              (EXIT (LETT |shortestFullPath| |fullPath|))))
                        ((SPADCALL |d| (LIST 0) (QREFELT $ 98))
                         (COND
                          ((< (SPADCALL |fullPath| (QREFELT $ 68))
                              (SPADCALL |shortestFullPath| (QREFELT $ 68)))
                           (SEQ (LETT |shortest| |d|)
                                (EXIT
                                 (LETT |shortestFullPath|
                                       |fullPath|)))))))))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT $ 97))
              (PROGN (LETT #2# (LIST 0)) (GO #5#))))
            (EXIT |shortestFullPath|)))
          #5# (EXIT #2#)))) 

(SDEFUN |FGRPH-;routeArrows;A2NniL;38|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (|FGRPH-;routeArrowRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |FGRPH-;isGreaterThan?;A2NniB;39|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Boolean|))
        (SPROG ((#1=#:G387 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                              NIL (QREFELT $ 97))
                    (PROGN (LETT #1# NIL) (GO #2=#:G386))))
                  (COND
                   ((SPADCALL (|FGRPH-;routeNodeRecursive| |s| |b| |a| NIL $)
                              NIL (QREFELT $ 98))
                    (PROGN (LETT #1# NIL) (GO #2#))))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ANni;40| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G397 NIL) (|fail| (|Boolean|)) (#2=#:G399 NIL) (|j| NIL)
          (#3=#:G398 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |ls| (SPADCALL |s| (QREFELT $ 10)))
                (SEQ (LETT |i| 1) (LETT #3# (LENGTH |ls|)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ (LETT |fail| NIL)
                          (SEQ (LETT |j| 1) (LETT #2# (LENGTH |ls|)) G190
                               (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |i| |j| (QREFELT $ 101))
                                   (COND
                                    ((NULL
                                      (SPADCALL |s| |j| |i| (QREFELT $ 104)))
                                     (LETT |fail| 'T)))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((NULL |fail|)
                             (PROGN (LETT #1# |i|) (GO #4=#:G396))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;max;ALNni;41|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G407 NIL) (|fail| (|Boolean|)) (#2=#:G409 NIL) (|j| NIL)
          (#3=#:G408 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL) (LETT #3# |sub|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ (LETT |fail| NIL)
                      (SEQ (LETT |j| NIL) (LETT #2# |sub|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |j| |i| (QREFELT $ 104)))
                                 (LETT |fail| 'T)))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i|) (GO #4=#:G406))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ANni;42| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G419 NIL) (|fail| (|Boolean|)) (#2=#:G421 NIL) (|j| NIL)
          (#3=#:G420 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |ls| (SPADCALL |s| (QREFELT $ 10)))
                (SEQ (LETT |i| 1) (LETT #3# (LENGTH |ls|)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ (LETT |fail| NIL)
                          (SEQ (LETT |j| 1) (LETT #2# (LENGTH |ls|)) G190
                               (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |i| |j| (QREFELT $ 101))
                                   (COND
                                    ((NULL
                                      (SPADCALL |s| |i| |j| (QREFELT $ 104)))
                                     (LETT |fail| 'T)))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((NULL |fail|)
                             (PROGN (LETT #1# |i|) (GO #4=#:G418))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;min;ALNni;43|
        ((|s| A) (|sub| |List| (|NonNegativeInteger|))
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G429 NIL) (|fail| (|Boolean|)) (#2=#:G431 NIL) (|j| NIL)
          (#3=#:G430 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| NIL) (LETT #3# |sub|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ (LETT |fail| NIL)
                      (SEQ (LETT |j| NIL) (LETT #2# |sub|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |j| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |i| |j| (QREFELT $ 101))
                               (COND
                                ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 104)))
                                 (LETT |fail| 'T)))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |fail|)
                         (PROGN (LETT #1# |i|) (GO #4=#:G428))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT 0)))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;distance;A2NniI;44|
        ((|s| A) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Integer|))
        (-
         (SPADCALL (|FGRPH-;routeNodeRecursive| |s| |a| |b| NIL $)
                   (QREFELT $ 68))
         1)) 

(SDEFUN |FGRPH-;isFunctional?;AB;45| ((|s| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G439 NIL) (#2=#:G443 NIL) (|x| NIL)
          (|fromI| (|NonNegativeInteger|)) (#3=#:G442 NIL) (|arr| NIL)
          (|counts| (|List| (|NonNegativeInteger|))) (#4=#:G441 NIL)
          (#5=#:G440 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |counts|
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |x| NIL) (LETT #4# (SPADCALL |s| (QREFELT $ 10)))
                        G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS 0 #5#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #5#)))))
            (SEQ (LETT |arr| NIL) (LETT #3# (SPADCALL |s| (QREFELT $ 22))) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |fromI| (QVELT |arr| 2))
                      (EXIT
                       (SPADCALL |counts| |fromI|
                                 (+ (SPADCALL |counts| |fromI| (QREFELT $ 110))
                                    1)
                                 (QREFELT $ 111))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |x| NIL) (LETT #2# |counts|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (EQL |x| 1))
                     (PROGN (LETT #1# NIL) (GO #6=#:G438))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createWidth;2Nni;46|
        ((|x| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G448 NIL) (|w| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |w| 1) G190
                       (COND ((|greater_SI| |w| 100) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((>= (* |w| |w|) |x|)
                           (PROGN (LETT #1# |w|) (GO #2=#:G447))))))
                       (LETT |w| (|inc_SI| |w|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 100)))
                #2# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createX;3Nni;47|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G456 NIL) (#2=#:G450 NIL)
          (|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|r| (|Union| (|NonNegativeInteger|) #3="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (SPADCALL |x| (QREFELT $ 114)))
                (LETT |r| (SPADCALL |n| 1 (QREFELT $ 116)))
                (LETT |d|
                      (DIVIDE2
                       (PROG2 (LETT #2# |r|)
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                         (|Union| (|NonNegativeInteger|) #3#)
                                         #2#))
                       |w|))
                (COND
                 ((ODDP (QCAR |d|))
                  (PROGN
                   (LETT #1#
                         (*
                          (PROG2
                              (LETT #2#
                                    (SPADCALL |w| (QCDR |d|) (QREFELT $ 116)))
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|NonNegativeInteger|)
                                            (|Union| (|NonNegativeInteger|)
                                                     #3#)
                                            #2#))
                          2))
                   (GO #4=#:G455))))
                (EXIT (* (+ (QCDR |d|) 1) 2))))
          #4# (EXIT #1#)))) 

(SDEFUN |FGRPH-;createY;3Nni;48|
        ((|x| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG
         ((|d|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#1=#:G458 NIL) (|r| (|Union| (|NonNegativeInteger|) #2="failed"))
          (|w| (|NonNegativeInteger|)))
         (SEQ (LETT |w| (SPADCALL |x| (QREFELT $ 114)))
              (LETT |r| (SPADCALL |n| 1 (QREFELT $ 116)))
              (LETT |d|
                    (DIVIDE2
                     (PROG2 (LETT #1# |r|)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|) #2#)
                                       #1#))
                     |w|))
              (EXIT (* (+ (QCAR |d|) 1) 2))))) 

(SDEFUN |FGRPH-;subdiagramSvg;SA2BV;49|
        ((|sc| |Scene| (|SCartesian| 2)) (|n| A) (|dispArrowName| |Boolean|)
         (|deep| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G490 NIL) (|s| (|String|))
          (|arrNode| (|Scene| (|SCartesian| 2))) (|offset| (|SCartesian| 2))
          (|tnode| #2=(|Scene| (|SCartesian| 2))) (|fnode| #2#)
          (|subArrNode| (|Scene| (|SCartesian| 2)))
          (|subToY| #3=(|DoubleFloat|)) (|subFromY| #3#) (|subToX| #3#)
          (|subFromX| #3#)
          (|innerObTo|
           #4=(|Record| (|:| |value| (|DirectedGraph| (|String|)))
                        (|:| |posX| (|NonNegativeInteger|))
                        (|:| |posY| (|NonNegativeInteger|))))
          (|innerObFrom| #4#) (#5=#:G495 NIL) (|subArrow| NIL) (#6=#:G496 NIL)
          (|subArrowN| NIL) (|mp| (|List| (|NonNegativeInteger|)))
          (|mt| #7=(|Scene| (|SCartesian| 2))) (|rema| (|Integer|))
          (|arrNumber| (|Integer|))
          (|arrIndex| (|List| (|NonNegativeInteger|)))
          (|midY| #8=(|NonNegativeInteger|)) (|midX| #8#)
          (|toY| #9=(|NonNegativeInteger|)) (#10=#:G479 NIL) (|fromY| #9#)
          (#11=#:G478 NIL) (|toX| #9#) (#12=#:G477 NIL) (|fromX| #9#)
          (#13=#:G476 NIL) (#14=#:G493 NIL) (|arrow| NIL) (#15=#:G494 NIL)
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
          (|subNd| (|DirectedGraph| (|String|))) (#16=#:G492 NIL) (|nd| NIL)
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
          (|indexNodes| (|List| S)) (#17=#:G491 NIL) (|i| NIL)
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
                            "black" (QREFELT $ 121)))
            (LETT |mt2|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "blue"
                            "blue" (QREFELT $ 121)))
            (LETT |mt3|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "orange"
                            "orange" (QREFELT $ 121)))
            (LETT |mt4|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "green"
                            "green" (QREFELT $ 121)))
            (LETT |mt5|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "brown"
                            "brown" (QREFELT $ 121)))
            (LETT |mt6|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "grey"
                            "grey" (QREFELT $ 121)))
            (LETT |mt7|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "red"
                            "red" (QREFELT $ 121)))
            (LETT |mt8|
                  (SPADCALL |sc| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) "purple"
                            "purple" (QREFELT $ 121)))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10))) (LETT |indexPointx| NIL)
            (LETT |indexPointy| NIL) (LETT |indexBounds| NIL)
            (LETT |indexNodes| NIL)
            (SEQ (LETT |i| NIL) (LETT #17# |ls|) G190
                 (COND
                  ((OR (ATOM #17#) (PROGN (LETT |i| (CAR #17#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexNodes|
                        (SPADCALL |indexNodes| (QVELT |i| 0) (QREFELT $ 123)))
                  (LETT |s| (|mathObject2String| (QVELT |i| 0)))
                  (LETT |x| (QVELT |i| 1)) (LETT |y| (QVELT |i| 2))
                  (LETT |indexPointx|
                        (SPADCALL |indexPointx| |x| (QREFELT $ 49)))
                  (LETT |indexPointy|
                        (SPADCALL |indexPointy| |y| (QREFELT $ 49)))
                  (EXIT
                   (COND
                    ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                     (SEQ (LETT |subgraph| (QVELT |i| 0))
                          (LETT |sh|
                                (VECTOR '|ellipse|
                                        (SPADCALL
                                         (SPADCALL |x| |y| (QREFELT $ 125))
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 128))
                                           (QREFELT $ 129))
                                          (SPADCALL
                                           (SPADCALL 7 -1 10 (QREFELT $ 128))
                                           (QREFELT $ 129))
                                          (QREFELT $ 130))
                                         (QREFELT $ 131))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 128))
                                          (QREFELT $ 129))
                                         (SPADCALL
                                          (SPADCALL 7 -1 10 (QREFELT $ 128))
                                          (QREFELT $ 129))
                                         (QREFELT $ 130))
                                        NIL))
                          (LETT |ellip| (SPADCALL |sc| |sh| (QREFELT $ 133)))
                          (LETT |tn|
                                (SPADCALL |sc| |subgraph| |x| |y|
                                          |dispArrowName| (QREFELT $ 135)))
                          (EXIT
                           (LETT |indexBounds|
                                 (SPADCALL |indexBounds| |ellip|
                                           (QREFELT $ 137))))))
                    ('T
                     (SEQ
                      (LETT |tn|
                            (SPADCALL |sc| |s| 32
                                      (SPADCALL |x| |y| (QREFELT $ 125))
                                      (QREFELT $ 138)))
                      (EXIT
                       (LETT |indexBounds|
                             (SPADCALL |indexBounds| |tn|
                                       (QREFELT $ 137)))))))))
                 (LETT #17# (CDR #17#)) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #1# (SPADCALL (QREFELT $ 141))) (GO #18=#:G489))))
            (LETT |innerOb| NIL)
            (COND
             (|deep|
              (COND
               ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                (SEQ (LETT |nd| NIL) (LETT #16# |indexNodes|) G190
                     (COND
                      ((OR (ATOM #16#) (PROGN (LETT |nd| (CAR #16#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |subNd| |nd|)
                          (LETT |innerObs| (SPADCALL |subNd| (QREFELT $ 144)))
                          (EXIT
                           (LETT |innerOb|
                                 (SPADCALL |innerOb| |innerObs|
                                           (QREFELT $ 148)))))
                     (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))))))
            (SEQ (LETT |arrn| 1) (LETT #15# (LENGTH |arrs|)) (LETT |arrow| NIL)
                 (LETT #14# |arrs|) G190
                 (COND
                  ((OR (ATOM #14#) (PROGN (LETT |arrow| (CAR #14#)) NIL)
                       (|greater_SI| |arrn| #15#))
                   (GO G191)))
                 (SEQ
                  (LETT |fromX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 2)
                                  (QREFELT $ 110)))
                  (LETT |toX|
                        (SPADCALL |indexPointx| (QVELT |arrow| 3)
                                  (QREFELT $ 110)))
                  (LETT |fromX|
                        (PROG1 (LETT #13# (+ |fromX| (QVELT |arrow| 4)))
                          (|check_subtype2| (>= #13# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #13#)))
                  (LETT |toX|
                        (PROG1 (LETT #12# (+ |toX| (QVELT |arrow| 4)))
                          (|check_subtype2| (>= #12# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #12#)))
                  (LETT |fromY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 2)
                                  (QREFELT $ 110)))
                  (LETT |toY|
                        (SPADCALL |indexPointy| (QVELT |arrow| 3)
                                  (QREFELT $ 110)))
                  (LETT |fromY|
                        (PROG1 (LETT #11# (+ |fromY| (QVELT |arrow| 5)))
                          (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #11#)))
                  (LETT |toY|
                        (PROG1 (LETT #10# (+ |toY| (QVELT |arrow| 5)))
                          (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #10#)))
                  (LETT |midX| (ASH (+ |toX| |fromX|) -1))
                  (LETT |midY| (ASH (+ |toY| |fromY|) -1))
                  (LETT |arrIndex|
                        (SPADCALL |n| (QVELT |arrow| 2) (QREFELT $ 149)))
                  (LETT |arrNumber|
                        (SPADCALL |arrn| |arrIndex| (QREFELT $ 65)))
                  (LETT |rema| (QCDR (DIVIDE2 |arrNumber| 8)))
                  (LETT |mt| |mt1|) (COND ((EQL |rema| 0) (LETT |mt| |mt1|)))
                  (COND ((EQL |rema| 1) (LETT |mt| |mt2|)))
                  (COND ((EQL |rema| 2) (LETT |mt| |mt3|)))
                  (COND ((EQL |rema| 3) (LETT |mt| |mt4|)))
                  (COND ((EQL |rema| 4) (LETT |mt| |mt5|)))
                  (COND ((EQL |rema| 5) (LETT |mt| |mt6|)))
                  (COND ((EQL |rema| 6) (LETT |mt| |mt7|)))
                  (COND ((EQL |rema| 7) (LETT |mt| |mt8|)))
                  (COND
                   (|deep|
                    (COND
                     ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                      (SEQ (LETT |mp| (QVELT |arrow| 6))
                           (EXIT
                            (SEQ (LETT |subArrowN| 1)
                                 (LETT #6# (SPADCALL |mp| (QREFELT $ 68)))
                                 (LETT |subArrow| NIL) (LETT #5# |mp|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |subArrow| (CAR #5#)) NIL)
                                       (|greater_SI| |subArrowN| #6#))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |innerObFrom|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 2)
                                                   (QREFELT $ 150))
                                         |subArrowN| (QREFELT $ 151)))
                                  (LETT |innerObTo|
                                        (SPADCALL
                                         (SPADCALL |innerOb| (QVELT |arrow| 3)
                                                   (QREFELT $ 150))
                                         |subArrow| (QREFELT $ 151)))
                                  (LETT |subFromX|
                                        (|add_DF|
                                         (FLOAT |fromX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129)))))
                                  (LETT |subToX|
                                        (|add_DF|
                                         (FLOAT |toX|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObFrom| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129)))))
                                  (LETT |subFromY|
                                        (|add_DF|
                                         (FLOAT |fromY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 1)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129)))))
                                  (LETT |subToY|
                                        (|add_DF|
                                         (FLOAT |toY|
                                                MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|mul_DF|
                                          (FLOAT (QVELT |innerObTo| 2)
                                                 MOST-POSITIVE-DOUBLE-FLOAT)
                                          (SPADCALL
                                           (SPADCALL 25 -2 10 (QREFELT $ 128))
                                           (QREFELT $ 129)))))
                                  (EXIT
                                   (LETT |subArrNode|
                                         (SPADCALL |mt|
                                                   (LIST
                                                    (LIST
                                                     (SPADCALL |subFromX|
                                                               |subFromY|
                                                               (QREFELT $ 152))
                                                     (SPADCALL |subToX|
                                                               |subToY|
                                                               (QREFELT $
                                                                        152))))
                                                   '|fixed|
                                                   (SPADCALL
                                                    (SPADCALL 1 -1 10
                                                              (QREFELT $ 128))
                                                    (QREFELT $ 129))
                                                   (QREFELT $ 155)))))
                                 (LETT #5#
                                       (PROG1 (CDR #5#)
                                         (LETT |subArrowN|
                                               (|inc_SI| |subArrowN|))))
                                 (GO G190) G191 (EXIT NIL))))))))
                  (EXIT
                   (COND
                    ((NULL |deep|)
                     (SEQ
                      (LETT |fnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 2)
                                      (QREFELT $ 156)))
                      (LETT |tnode|
                            (SPADCALL |indexBounds| (QVELT |arrow| 3)
                                      (QREFELT $ 156)))
                      (LETT |offset|
                            (SPADCALL (QVELT |arrow| 4) (QVELT |arrow| 5)
                                      (QREFELT $ 125)))
                      (COND
                       ((EQUAL (QREFELT $ 7) (|DirectedGraph| (|String|)))
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset| '|fixed|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 128))
                                         (QREFELT $ 129))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 158))))
                       ('T
                        (LETT |arrNode|
                              (SPADCALL |mt| |fnode| |tnode| |offset|
                                        '|proportional|
                                        (SPADCALL
                                         (SPADCALL 1 -1 10 (QREFELT $ 128))
                                         (QREFELT $ 129))
                                        (FLOAT
                                         (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                        (QREFELT $ 158)))))
                      (EXIT
                       (COND
                        (|dispArrowName|
                         (SEQ (LETT |s| (QVELT |arrow| 0))
                              (EXIT
                               (SPADCALL |mt| |s| 32
                                         (SPADCALL |midX| |midY|
                                                   (QREFELT $ 125))
                                         (QREFELT $ 138))))))))))))
                 (LETT #14# (PROG1 (CDR #14#) (LETT |arrn| (|inc_SI| |arrn|))))
                 (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #1# (SPADCALL (QREFELT $ 141))) (GO #18#)))))
          #18# (EXIT #1#)))) 

(SDEFUN |FGRPH-;diagramSvg;SABV;50|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 125))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 160)) 10)
                                    (QREFELT $ 125))
                          (QREFELT $ 162)))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 163)))
          (SPADCALL |sc| |n| |dispArrowName| NIL (QREFELT $ 164))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 165)))))) 

(SDEFUN |FGRPH-;diagramsSvg;SLBV;51|
        ((|fileName| |String|) (|ln| |List| A) (|dispArrowName| |Boolean|)
         ($ |Void|))
        (SPROG
         ((#1=#:G504 NIL) (|n| NIL) (|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))) (|dW| (|NonNegativeInteger|))
          (#2=#:G503 NIL))
         (SEQ (LETT |dW| 0)
              (SEQ (LETT |n| NIL) (LETT #2# |ln|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |n| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |dW|
                           (+ (+ |dW| (SPADCALL |n| (QREFELT $ 157))) 10))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |view|
                    (SPADCALL (SPADCALL 0 0 (QREFELT $ 125))
                              (SPADCALL |dW|
                                        (+
                                         (SPADCALL (|SPADfirst| |ln|)
                                                   (QREFELT $ 160))
                                         10)
                                        (QREFELT $ 125))
                              (QREFELT $ 162)))
              (LETT |sc| (SPADCALL |view| (QREFELT $ 163)))
              (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |sc| |n| |dispArrowName| NIL (QREFELT $ 164))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 165)))))) 

(SDEFUN |FGRPH-;deepDiagramSvg;SABV;52|
        ((|fileName| |String|) (|n| A) (|dispArrowName| |Boolean|) ($ |Void|))
        (SPROG
         ((|sc| (|Scene| (|SCartesian| 2)))
          (|view| (|SBoundary| (|SCartesian| 2))))
         (SEQ
          (LETT |view|
                (SPADCALL (SPADCALL 0 0 (QREFELT $ 125))
                          (SPADCALL (+ (SPADCALL |n| (QREFELT $ 157)) 10)
                                    (+ (SPADCALL |n| (QREFELT $ 160)) 10)
                                    (QREFELT $ 125))
                          (QREFELT $ 162)))
          (LETT |sc| (SPADCALL |view| (QREFELT $ 163)))
          (SPADCALL |sc| |n| |dispArrowName| 'T (QREFELT $ 164))
          (EXIT (SPADCALL |sc| |fileName| (QREFELT $ 165)))))) 

(SDEFUN |FGRPH-;diagramWidth;ANni;53| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxx| (|NonNegativeInteger|)) (#1=#:G511 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxx| 0) (LETT |ls| (SPADCALL |s| (QREFELT $ 10)))
              (SEQ (LETT |i| NIL) (LETT #1# |ls|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |i| 1) |maxx| (QREFELT $ 96))
                       (LETT |maxx| (QVELT |i| 1))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |maxx|)))) 

(SDEFUN |FGRPH-;diagramHeight;ANni;54| ((|s| A) ($ |NonNegativeInteger|))
        (SPROG
         ((|maxy| (|NonNegativeInteger|)) (#1=#:G516 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |maxy| 0) (LETT |ls| (SPADCALL |s| (QREFELT $ 10)))
              (SEQ (LETT |i| NIL) (LETT #1# |ls|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVELT |i| 2) |maxy| (QREFELT $ 96))
                       (LETT |maxy| (QVELT |i| 2))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |maxy|)))) 

(SDEFUN |FGRPH-;looseEquals;2AB;55| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G529 NIL) (#2=#:G530 NIL) (|i| NIL)
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
                        (LENGTH (SPADCALL |y| (QREFELT $ 10))) (QREFELT $ 101))
              (PROGN (LETT #1# NIL) (GO #4=#:G528))))
            (LETT |arx| (SPADCALL |x| (QREFELT $ 22)))
            (LETT |ary| (SPADCALL |y| (QREFELT $ 22)))
            (COND
             ((SPADCALL (LENGTH |arx|) (LENGTH |ary|) (QREFELT $ 101))
              (PROGN (LETT #1# NIL) (GO #4#))))
            (SEQ (LETT |i| 1) (LETT #2# (LENGTH |arx|)) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 83)) 2)
                              (QVELT (SPADCALL |ary| |i| (QREFELT $ 83)) 2)
                              (QREFELT $ 101))
                    (PROGN (LETT #1# NIL) (GO #4#))))
                  (EXIT
                   (COND
                    ((SPADCALL (QVELT (SPADCALL |arx| |i| (QREFELT $ 83)) 3)
                               (QVELT (SPADCALL |ary| |i| (QREFELT $ 83)) 3)
                               (QREFELT $ 101))
                     (PROGN (LETT #1# NIL) (GO #4#))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(PUT '|FGRPH-;hash;ASi;56| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |FGRPH-;hash;ASi;56| ((|s| A) ($ |SingleInteger|)) 0) 

(SDEFUN |FGRPH-;latex;AS;57| ((|n| A) ($ |String|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|String|)) (#1=#:G543 NIL) (|arrow| NIL)
          (|arrStr| (|String|)) (#2=#:G541 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#3=#:G542 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "") (LETT |ls| (SPADCALL |n| (QREFELT $ 10)))
                (SEQ (LETT |i| NIL) (LETT #3# |ls|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQUAL |s| "")
                         (LETT |s| (SPADCALL (QVELT |i| 0) (QREFELT $ 174))))
                        ('T
                         (LETT |s|
                               (SPADCALL
                                (LIST |s| ","
                                      (SPADCALL (QVELT |i| 0) (QREFELT $ 174)))
                                (QREFELT $ 175)))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s|) (GO #4=#:G540))))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s|) (GO #4#))))
                (LETT |s| (SPADCALL (LIST |s| "|") (QREFELT $ 175)))
                (LETT |fst| 'T) (LETT |arrStr| "->")
                (SEQ (LETT |arrow| NIL) (LETT #1# |arrs|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (COND ((NULL |fst|) (LETT |s| (STRCONC |s| ","))))
                          (LETT |s|
                                (SPADCALL
                                 (LIST |s| (QVELT |arrow| 0) ":"
                                       (SPADCALL
                                        (QVELT
                                         (SPADCALL |ls| (QVELT |arrow| 2)
                                                   (QREFELT $ 176))
                                         0)
                                        (QREFELT $ 174))
                                       |arrStr|
                                       (SPADCALL
                                        (QVELT
                                         (SPADCALL |ls| (QVELT |arrow| 3)
                                                   (QREFELT $ 176))
                                         0)
                                        (QREFELT $ 174)))
                                 (QREFELT $ 175)))
                          (EXIT (LETT |fst| 'NIL)))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))
          #4# (EXIT #2#)))) 

(SDEFUN |FGRPH-;=;2AB;58| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G552 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 10))
                              (SPADCALL |y| (QREFELT $ 10)) (QREFELT $ 178))
                    (PROGN (LETT #1# NIL) (GO #2=#:G551))))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT $ 22))
                              (SPADCALL |y| (QREFELT $ 22)) (QREFELT $ 179))
                    (PROGN (LETT #1# NIL) (GO #2#))))
                  (EXIT 'T)))
                #2# (EXIT #1#)))) 

(SDEFUN |FGRPH-;~=;2AB;59| ((|x| A) (|y| A) ($ |Boolean|))
        (NULL (SPADCALL |x| |y| (QREFELT $ 181)))) 

(SDEFUN |FGRPH-;coerceSubgraph| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G567 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G565 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G566 NIL) (|i| NIL)
          (|ls|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (EXIT
           (SEQ (LETT |s| (SPADCALL (QREFELT $ 184)))
                (LETT |ls| (SPADCALL |n| (QREFELT $ 10)))
                (SEQ (LETT |i| 1) (LETT #3# (LENGTH |ls|)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ (LETT |st| (SPADCALL |i| (QREFELT $ 185)))
                          (EXIT
                           (COND
                            ((SPADCALL |s| (SPADCALL (QREFELT $ 184))
                                       (QREFELT $ 186))
                             (LETT |s| |st|))
                            ('T
                             (LETT |s|
                                   (SPADCALL
                                    (LIST |s| (SPADCALL "," (QREFELT $ 187))
                                          |st|)
                                    (QREFELT $ 188)))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s|) (GO #4=#:G564))))
                (COND
                 ((SPADCALL |arrs| NIL (QREFELT $ 139))
                  (PROGN (LETT #2# |s|) (GO #4#))))
                (LETT |s|
                      (SPADCALL (LIST |s| (SPADCALL "|" (QREFELT $ 187)))
                                (QREFELT $ 188)))
                (LETT |fst| 'T) (LETT |arrStr| (SPADCALL "->" (QREFELT $ 187)))
                (SEQ (LETT |arrow| NIL) (LETT #1# |arrs|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |stFrom|
                            (SPADCALL (QVELT |arrow| 2) (QREFELT $ 185)))
                      (LETT |stTo|
                            (SPADCALL (QVELT |arrow| 3) (QREFELT $ 185)))
                      (COND
                       ((NULL |fst|)
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL "," (QREFELT $ 187))
                                        (QREFELT $ 189)))))
                      (LETT |s|
                            (SPADCALL
                             (LIST |s|
                                   (SPADCALL (QVELT |arrow| 0) (QREFELT $ 190))
                                   (SPADCALL ":" (QREFELT $ 187)) |stFrom|
                                   |arrStr| |stTo|)
                             (QREFELT $ 188)))
                      (EXIT (LETT |fst| 'NIL)))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))
          #4# (EXIT #2#)))) 

(SDEFUN |FGRPH-;coerce;AOf;61| ((|n| A) ($ |OutputForm|))
        (SPROG
         ((|fst| (|Boolean|)) (|s| (|OutputForm|)) (|stTo| (|OutputForm|))
          (|stFrom| (|OutputForm|)) (#1=#:G580 NIL) (|arrow| NIL)
          (|arrStr| (|OutputForm|)) (#2=#:G578 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|st| (|OutputForm|)) (#3=#:G579 NIL) (|i| NIL)
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
               (LETT #2# (|FGRPH-;coerceSubgraph| |n| $))
               (GO #4=#:G577))))
            (LETT |s| (SPADCALL (QREFELT $ 184)))
            (LETT |ls| (SPADCALL |n| (QREFELT $ 10)))
            (SEQ (LETT |i| NIL) (LETT #3# |ls|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ (LETT |st| (SPADCALL (QVELT |i| 0) (QREFELT $ 191)))
                      (EXIT
                       (COND
                        ((SPADCALL |s| (SPADCALL (QREFELT $ 184))
                                   (QREFELT $ 186))
                         (LETT |s| |st|))
                        ('T
                         (LETT |s|
                               (SPADCALL
                                (LIST |s| (SPADCALL "," (QREFELT $ 187)) |st|)
                                (QREFELT $ 188)))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (LETT |arrs| (SPADCALL |n| (QREFELT $ 22)))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s|) (GO #4#))))
            (COND
             ((SPADCALL |arrs| NIL (QREFELT $ 139))
              (PROGN (LETT #2# |s|) (GO #4#))))
            (LETT |s|
                  (SPADCALL (LIST |s| (SPADCALL "|" (QREFELT $ 187)))
                            (QREFELT $ 188)))
            (LETT |fst| 'T) (LETT |arrStr| (SPADCALL "->" (QREFELT $ 187)))
            (SEQ (LETT |arrow| NIL) (LETT #1# |arrs|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |arrow| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |stFrom|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 2) (QREFELT $ 176)) 0)
                         (QREFELT $ 191)))
                  (LETT |stTo|
                        (SPADCALL
                         (QVELT
                          (SPADCALL |ls| (QVELT |arrow| 3) (QREFELT $ 176)) 0)
                         (QREFELT $ 191)))
                  (COND
                   ((NULL |fst|)
                    (LETT |s|
                          (SPADCALL |s| (SPADCALL "," (QREFELT $ 187))
                                    (QREFELT $ 189)))))
                  (LETT |s|
                        (SPADCALL
                         (LIST |s| (SPADCALL (QVELT |arrow| 0) (QREFELT $ 190))
                               (SPADCALL ":" (QREFELT $ 187)) |stFrom| |arrStr|
                               |stTo|)
                         (QREFELT $ 188)))
                  (EXIT (LETT |fst| 'NIL)))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (EXIT |s|)))
          #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |FiniteGraph&;|)) 

(DEFUN |FiniteGraph&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteGraph&| DV$1 DV$2))
          (LETT $ (GETREFV 193))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (|Reference| 40) (84 . |deref|) (89 . |entry?|) (|Tree| 26)
              (95 . |tree|) (|List| 45) (100 . |concat|) (106 . |concat|)
              (112 . |setref|) (|List| $) (118 . |tree|) (124 . |ref|)
              |FGRPH-;spanningTreeArrow;ANniT;10| (129 . |spanningTreeArrow|)
              |FGRPH-;spanningForestArrow;AL;11| (135 . |nodeToNode|)
              (|List| 11) (141 . |concat|) |FGRPH-;spanningTreeNode;ANniT;13|
              (147 . |spanningTreeNode|) |FGRPH-;spanningForestNode;AL;14|
              (153 . |children|) (158 . |value|) (163 . |position|) (|Loop|)
              (169 . |loop|) (174 . |#|) (179 . |last|) (|List| 66)
              (185 . |concat|) (191 . |spanningForestNode|)
              (196 . |removeDuplicates|) |FGRPH-;loopsNodes;AL;16|
              |FGRPH-;loopsAtNode;ANniL;17| (201 . |spanningForestArrow|)
              |FGRPH-;loopsArrows;AL;19| (206 . |loopsNodes|) (211 . =)
              |FGRPH-;isAcyclic?;AB;20| |FGRPH-;isDirectSuccessor?;A2NniB;21|
              |FGRPH-;isFixPoint?;ANniB;22| (217 . |elt|)
              |FGRPH-;getArrowIndex;A3Nni;23| |FGRPH-;arrowName;A2NniS;24|
              |FGRPH-;inDegree;A2Nni;25| |FGRPH-;outDegree;A2Nni;26|
              |FGRPH-;nodeFromNode;ANniL;27| |FGRPH-;nodeToNode;ANniL;28|
              |FGRPH-;arrowsFromNode;ANniL;29| |FGRPH-;arrowsToNode;ANniL;30|
              |FGRPH-;nodeFromArrow;ANniL;31| |FGRPH-;nodeToArrow;ANniL;32|
              |FGRPH-;arrowsFromArrow;ANniL;33| |FGRPH-;arrowsToArrow;ANniL;34|
              (223 . >) (229 . =) (235 . ~=) |FGRPH-;routeNodes;A2NniL;36|
              (241 . |getArrowIndex|) (248 . ~=) |FGRPH-;routeArrows;A2NniL;38|
              |FGRPH-;isGreaterThan?;A2NniB;39| (254 . |isGreaterThan?|)
              |FGRPH-;max;ANni;40| |FGRPH-;max;ALNni;41| |FGRPH-;min;ANni;42|
              |FGRPH-;min;ALNni;43| |FGRPH-;distance;A2NniI;44| (261 . |elt|)
              (267 . |setelt!|) |FGRPH-;isFunctional?;AB;45|
              |FGRPH-;createWidth;2Nni;46| (274 . |createWidth|)
              (|Union| $ '"failed") (279 . |subtractIfCan|)
              |FGRPH-;createX;3Nni;47| |FGRPH-;createY;3Nni;48| (|DoubleFloat|)
              (|Scene| 124) (285 . |addSceneMaterial|) (|List| 7)
              (293 . |concat|) (|SCartesian| '2) (299 . |sipnt|)
              (|PositiveInteger|) (|Float|) (305 . |float|) (312 . |coerce|)
              (317 . |svec|) (323 . +)
              (|Record| (|:| |shptype| 154) (|:| |centre| 124) (|:| |size| 124)
                        (|:| |fill| 11))
              (329 . |addSceneShape|) (|DirectedGraph| 16)
              (335 . |addSceneGraph|) (|List| 120) (344 . |concat|)
              (350 . |addSceneText|) (358 . =) (|Void|) (364 . |void|)
              (|Record| (|:| |value| 16) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 142) (368 . |getVertices|)
              (|Record| (|:| |value| 134) (|:| |posX| 13) (|:| |posY| 13))
              (|List| 145) (|List| 146) (373 . |concat|) (379 . |arrowsToNode|)
              (385 . |elt|) (391 . |elt|) (397 . |spnt|) (|List| (|List| 124))
              (|Symbol|) (403 . |addSceneArrows|) (411 . |elt|)
              (417 . |diagramWidth|) (422 . |addSceneArrow|)
              |FGRPH-;subdiagramSvg;SA2BV;49| (433 . |diagramHeight|)
              (|SBoundary| 124) (438 . |boxBoundary|) (444 . |createSceneRoot|)
              (449 . |subdiagramSvg|) (457 . |writeSvg|)
              |FGRPH-;diagramSvg;SABV;50| |FGRPH-;diagramsSvg;SLBV;51|
              |FGRPH-;deepDiagramSvg;SABV;52| |FGRPH-;diagramWidth;ANni;53|
              |FGRPH-;diagramHeight;ANni;54| |FGRPH-;looseEquals;2AB;55|
              (|SingleInteger|) |FGRPH-;hash;ASi;56| (463 . |latex|)
              (468 . |concat|) (473 . |elt|) |FGRPH-;latex;AS;57| (479 . ~=)
              (485 . ~=) |FGRPH-;=;2AB;58| (491 . =) |FGRPH-;~=;2AB;59|
              (|OutputForm|) (497 . |empty|) (501 . |coerce|) (506 . =)
              (512 . |message|) (517 . |hconcat|) (522 . |hconcat|)
              (528 . |coerce|) (533 . |coerce|) |FGRPH-;coerce;AOf;61|)
           '#(~= 538 |subdiagramSvg| 544 |spanningTreeNode| 552
              |spanningTreeArrow| 558 |spanningForestNode| 564
              |spanningForestArrow| 569 |routeNodes| 574 |routeArrows| 581
              |outDegree| 588 |nodeToNode| 594 |nodeToArrow| 600 |nodeFromNode|
              606 |nodeFromArrow| 612 |min| 618 |max| 629 |looseEquals| 640
              |loopsNodes| 646 |loopsAtNode| 651 |loopsArrows| 657 |latex| 662
              |laplacianMatrix| 667 |isGreaterThan?| 672 |isFunctional?| 679
              |isFixPoint?| 684 |isDirected?| 690 |isDirectSuccessor?| 694
              |isAcyclic?| 701 |incidenceMatrix| 706 |inDegree| 711 |hash| 717
              |getVertexIndex| 722 |getArrowIndex| 728 |distanceMatrix| 735
              |distance| 740 |diagramsSvg| 747 |diagramWidth| 754 |diagramSvg|
              759 |diagramHeight| 766 |deepDiagramSvg| 771 |createY| 778
              |createX| 784 |createWidth| 790 |coerce| 795 |arrowsToNode| 800
              |arrowsToArrow| 806 |arrowsFromNode| 812 |arrowsFromArrow| 818
              |arrowName| 824 |adjacencyMatrix| 831 |addArrow!| 836 = 844)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|looseEquals| ((|Boolean|) |#1| |#1|)) T)
                                   '((|createY|
                                      ((|NonNegativeInteger|)
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createX|
                                      ((|NonNegativeInteger|)
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|createWidth|
                                      ((|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|diagramHeight|
                                      ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|diagramWidth|
                                      ((|NonNegativeInteger|) |#1|))
                                     T)
                                   '((|deepDiagramSvg|
                                      ((|Void|) (|String|) |#1| (|Boolean|)))
                                     T)
                                   '((|diagramsSvg|
                                      ((|Void|) (|String|) (|List| |#1|)
                                       (|Boolean|)))
                                     T)
                                   '((|diagramSvg|
                                      ((|Void|) (|String|) |#1| (|Boolean|)))
                                     T)
                                   '((|subdiagramSvg|
                                      ((|Void|) (|Scene| (|SCartesian| 2)) |#1|
                                       (|Boolean|) (|Boolean|)))
                                     T)
                                   '((|isDirected?| ((|Boolean|))) T)
                                   '((|isFunctional?| ((|Boolean|) |#1|)) T)
                                   '((|distanceMatrix|
                                      ((|Matrix| (|Integer|)) |#1|))
                                     T)
                                   '((|laplacianMatrix|
                                      ((|Matrix| (|Integer|)) |#1|))
                                     T)
                                   '((|adjacencyMatrix|
                                      ((|Matrix| (|NonNegativeInteger|)) |#1|))
                                     T)
                                   '((|incidenceMatrix|
                                      ((|Matrix| (|Integer|)) |#1|))
                                     T)
                                   '((|isAcyclic?| ((|Boolean|) |#1|)) T)
                                   '((|loopsArrows| ((|List| (|Loop|)) |#1|))
                                     T)
                                   '((|loopsAtNode|
                                      ((|List| (|Loop|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|loopsNodes| ((|List| (|Loop|)) |#1|)) T)
                                   '((|spanningForestNode|
                                      ((|List| (|Tree| (|Integer|))) |#1|))
                                     T)
                                   '((|spanningTreeNode|
                                      ((|Tree| (|Integer|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|spanningForestArrow|
                                      ((|List| (|Tree| (|Integer|))) |#1|))
                                     T)
                                   '((|spanningTreeArrow|
                                      ((|Tree| (|Integer|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|distance|
                                      ((|Integer|) |#1| (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|routeArrows|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|routeNodes|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|arrowsToArrow|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|arrowsFromArrow|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|nodeToArrow|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|nodeFromArrow|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|arrowsToNode|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|arrowsFromNode|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|nodeToNode|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|nodeFromNode|
                                      ((|List| (|NonNegativeInteger|)) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|outDegree|
                                      ((|NonNegativeInteger|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|inDegree|
                                      ((|NonNegativeInteger|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|getArrowIndex|
                                      ((|NonNegativeInteger|) |#1|
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|arrowName|
                                      ((|String|) |#1| (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|isFixPoint?|
                                      ((|Boolean|) |#1|
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|min|
                                      ((|NonNegativeInteger|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|min| ((|NonNegativeInteger|) |#1|)) T)
                                   '((|max|
                                      ((|NonNegativeInteger|) |#1|
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|max| ((|NonNegativeInteger|) |#1|)) T)
                                   '((|isGreaterThan?|
                                      ((|Boolean|) |#1| (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|isDirectSuccessor?|
                                      ((|Boolean|) |#1| (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|getVertexIndex|
                                      ((|NonNegativeInteger|) |#1| |#2|))
                                     T)
                                   '((|addArrow!|
                                      (|#1| |#1| (|String|) |#2| |#2|))
                                     T)
                                   '((|addArrow!|
                                      (|#1| |#1| (|String|)
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|addArrow!|
                                      (|#1| |#1| (|String|)
                                       (|NonNegativeInteger|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|addArrow!|
                                      (|#1| |#1|
                                       (|Record| (|:| |name| (|String|))
                                                 (|:| |arrType|
                                                      (|NonNegativeInteger|))
                                                 (|:| |fromOb|
                                                      (|NonNegativeInteger|))
                                                 (|:| |toOb|
                                                      (|NonNegativeInteger|))
                                                 (|:| |xOffset| (|Integer|))
                                                 (|:| |yOffset| (|Integer|))
                                                 (|:| |map|
                                                      (|List|
                                                       (|NonNegativeInteger|))))))
                                     T)
                                   '((|latex| ((|String|) |#1|)) T)
                                   '((|hash| ((|SingleInteger|) |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((= ((|Boolean|) |#1| |#1|)) T)
                                   '((~= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 192
                                            '(1 6 9 0 10 2 7 11 0 0 12 2 6 13 0
                                              7 15 4 6 0 0 16 13 13 17 1 6 21 0
                                              22 2 23 0 13 13 24 0 6 11 25 4 23
                                              26 0 26 26 26 27 3 6 11 0 13 13
                                              29 1 31 0 30 32 2 6 13 0 13 34 1
                                              23 0 35 36 3 6 26 0 13 13 38 2 6
                                              40 0 13 41 1 42 40 0 43 2 40 11
                                              13 0 44 1 45 0 26 46 2 47 0 0 45
                                              48 2 40 0 0 13 49 2 42 40 0 40 50
                                              2 45 0 26 51 52 1 42 0 40 53 2 6
                                              45 0 13 55 2 6 40 0 13 57 2 58 0
                                              0 11 59 2 6 45 0 13 61 1 45 51 0
                                              63 1 45 26 0 64 2 40 26 13 0 65 1
                                              66 0 40 67 1 40 13 0 68 2 40 0 0
                                              13 69 2 70 0 0 0 71 1 6 47 0 72 1
                                              70 0 0 73 1 6 47 0 76 1 6 70 0 78
                                              2 70 11 0 0 79 2 21 20 0 26 83 2
                                              13 11 0 0 96 2 40 11 0 0 97 2 40
                                              11 0 0 98 3 6 13 0 13 13 100 2 13
                                              11 0 0 101 3 6 11 0 13 13 104 2
                                              40 13 0 26 110 3 40 13 0 26 13
                                              111 1 6 13 13 114 2 13 115 0 0
                                              116 4 120 0 0 119 16 16 121 2 122
                                              0 0 7 123 2 124 0 26 26 125 3 127
                                              0 26 26 126 128 1 127 119 0 129 2
                                              124 0 119 119 130 2 124 0 0 0 131
                                              2 120 0 0 132 133 5 120 0 0 134
                                              13 13 11 135 2 136 0 0 120 137 4
                                              120 0 0 16 13 124 138 2 21 11 0 0
                                              139 0 140 0 141 1 134 143 0 144 2
                                              147 0 0 146 148 2 6 40 0 13 149 2
                                              147 146 0 26 150 2 146 145 0 26
                                              151 2 124 0 119 119 152 4 120 0 0
                                              153 154 119 155 2 136 120 0 26
                                              156 1 6 13 0 157 7 120 0 0 0 0
                                              124 154 119 119 158 1 6 13 0 160
                                              2 161 0 124 124 162 1 120 0 161
                                              163 4 6 140 120 0 11 11 164 2 120
                                              140 0 16 165 1 7 16 0 174 1 16 0
                                              51 175 2 9 8 0 26 176 2 9 11 0 0
                                              178 2 21 11 0 0 179 2 6 11 0 0
                                              181 0 183 0 184 1 13 183 0 185 2
                                              183 11 0 0 186 1 183 0 16 187 1
                                              183 0 51 188 2 183 0 0 0 189 1 16
                                              183 0 190 1 7 183 0 191 2 0 11 0
                                              0 182 4 0 140 120 0 11 11 159 2 0
                                              45 0 13 60 2 0 45 0 13 54 1 0 47
                                              0 62 1 0 47 0 56 3 0 40 0 13 13
                                              99 3 0 40 0 13 13 102 2 0 13 0 13
                                              87 2 0 40 0 13 89 2 0 40 0 13 93
                                              2 0 40 0 13 88 2 0 40 0 13 92 1 0
                                              13 0 107 2 0 13 0 40 108 2 0 13 0
                                              40 106 1 0 13 0 105 2 0 11 0 0
                                              171 1 0 70 0 74 2 0 70 0 13 75 1
                                              0 70 0 77 1 0 16 0 177 1 0 23 0
                                              37 3 0 11 0 13 13 103 1 0 11 0
                                              112 2 0 11 0 13 82 0 0 11 19 3 0
                                              11 0 13 13 81 1 0 11 0 80 1 0 23
                                              0 28 2 0 13 0 13 86 1 0 172 0 173
                                              2 0 13 0 7 14 3 0 13 0 13 13 84 1
                                              0 23 0 39 3 0 26 0 13 13 109 3 0
                                              140 16 51 11 167 1 0 13 0 169 3 0
                                              140 16 0 11 166 1 0 13 0 170 3 0
                                              140 16 0 11 168 2 0 13 13 13 118
                                              2 0 13 13 13 117 1 0 13 13 113 1
                                              0 183 0 192 2 0 40 0 13 91 2 0 40
                                              0 13 95 2 0 40 0 13 90 2 0 40 0
                                              13 94 3 0 16 0 13 13 85 1 0 31 0
                                              33 4 0 0 0 16 7 7 18 2 0 11 0 0
                                              180)))))
           '|lookupComplete|)) 
