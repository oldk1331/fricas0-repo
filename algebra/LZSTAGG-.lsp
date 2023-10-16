
(SDEFUN |LZSTAGG-;=;2AB;1| ((|x| A) (|y| A) ($ |Boolean|))
        (SEQ
         (COND ((SPADCALL |x| |y| (QREFELT $ 9)) 'T)
               (#1='T
                (SEQ
                 (COND
                  ((SPADCALL |x| (QREFELT $ 10))
                   (COND
                    ((SPADCALL |y| (QREFELT $ 10))
                     (EXIT
                      (SPADCALL (SPADCALL |x| (QREFELT $ 12))
                                (SPADCALL |y| (QREFELT $ 12))
                                (QREFELT $ 13)))))))
                 (COND
                  ((SPADCALL |x| (QREFELT $ 14))
                   (COND
                    ((SPADCALL |y| (QREFELT $ 14))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT $ 15))
                                  (SPADCALL |y| (QREFELT $ 15)) (QREFELT $ 16))
                        (EQ (SPADCALL |x| (QREFELT $ 17))
                            (SPADCALL |y| (QREFELT $ 17))))
                       (#1# NIL)))))))
                 (EXIT NIL)))))) 

(SDEFUN |LZSTAGG-;less?;ANniB;2|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G215 NIL))
               (COND ((EQL |n| 0) NIL) ((SPADCALL |x| (QREFELT $ 19)) 'T)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1 (LETT #1# (- |n| 1))
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 21)))))) 

(SDEFUN |LZSTAGG-;more?;ANniB;3|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G218 NIL))
               (COND ((SPADCALL |x| (QREFELT $ 19)) NIL) ((EQL |n| 0) 'T)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1 (LETT #1# (- |n| 1))
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 23)))))) 

(SDEFUN |LZSTAGG-;size?;ANniB;4|
        ((|x| A) (|n| |NonNegativeInteger|) ($ |Boolean|))
        (SPROG ((#1=#:G221 NIL))
               (COND ((SPADCALL |x| (QREFELT $ 19)) (EQL |n| 0))
                     ((EQL |n| 0) NIL)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1 (LETT #1# (- |n| 1))
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 25)))))) 

(SDEFUN |LZSTAGG-;#;ANni;5| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G231 NIL) (|y| (A)) (#2=#:G232 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# |i|) (GO #3=#:G230)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "#: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                       (COND
                                        ((ODDP |i|)
                                         (LETT |x|
                                               (SPADCALL |x| (QREFELT $ 17)))))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |x| |y| (QREFELT $ 9))
                                          (PROGN
                                           (LETT #1#
                                                 (|error|
                                                  "#: infinite stream"))
                                           (GO #4=#:G225)))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;any?;MAB;6|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G242 NIL) (#2=#:G243 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL) (GO #3=#:G241)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "any?: infinite stream"))
                               ((SPADCALL (SPADCALL |y| (QREFELT $ 15)) |f|)
                                (PROGN (LETT #2# 'T) (GO #3#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                       (COND
                                        ((ODDP |i|)
                                         (LETT |x|
                                               (SPADCALL |x| (QREFELT $ 17)))))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |x| |y| (QREFELT $ 9))
                                          (PROGN
                                           (LETT #1#
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (GO #3#)))
                                           (GO #4=#:G234)))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;every?;MAB;7|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G252 NIL) (#2=#:G253 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# 'T) (GO #3=#:G251)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "every?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (SPADCALL |y| (QREFELT $ 15))
                                               |f|))
                                    (PROGN (LETT #2# NIL) (GO #3#)))
                                   ('T
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x|
                                             (SPADCALL |x| (QREFELT $ 17)))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (PROGN (LETT #2# 'T) (GO #3#)))
                                         (GO #4=#:G246)))))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;entries;AL;8| ((|x| A) ($ |List| S))
        (SPROG
         ((#1=#:G261 NIL) (|y| (A)) (|l| (|List| S)) (#2=#:G262 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x|) (LETT |l| NIL)
                (EXIT
                 (SEQ (LETT |i| 0) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN (LETT #2# (NREVERSE |l|)) (GO #3=#:G260)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |l|
                                   (CONS (SPADCALL |y| (QREFELT $ 15)) |l|))
                             (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                             (COND
                              ((ODDP |i|)
                               (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                             (EXIT
                              (COND
                               ((SPADCALL |x| |y| (QREFELT $ 9))
                                (PROGN
                                 (LETT #1# (|error| "infinite stream"))
                                 (GO #4=#:G255)))))))
                           #4# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;construct;LA;9| ((|l| |List| S) ($ A))
        (SPROG ((|res| (A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 34)))
                      ('T
                       (SEQ (LETT |l| (REVERSE |l|))
                            (LETT |res| (SPADCALL (QREFELT $ 34)))
                            (SEQ G190
                                 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                                 (SEQ
                                  (LETT |res|
                                        (SPADCALL (|SPADfirst| |l|) |res|
                                                  (QREFELT $ 35)))
                                  (EXIT (LETT |l| (CDR |l|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |res|))))))) 

(SDEFUN |LZSTAGG-;elt;AIS;10| ((|x| A) (|n| |Integer|) ($ S))
        (COND
         ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 19)))
          (|error| "elt: no such element"))
         ('T
          (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 15)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (- |n| 1)
                           (QREFELT $ 38))))))) 

(SDEFUN |LZSTAGG-;elt;AI2S;11| ((|x| A) (|n| |Integer|) (|s| S) ($ S))
        (COND ((OR (< |n| 1) (SPADCALL |x| (QREFELT $ 19))) |s|)
              ('T
               (COND ((EQL |n| 1) (SPADCALL |x| (QREFELT $ 15)))
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17)) (- |n| 1)
                                (QREFELT $ 38))))))) 

(SDEFUN |LZSTAGG-;indexx?| ((|n| |Integer|) (|x| A) ($ |Boolean|))
        (COND ((SPADCALL |x| (QREFELT $ 19)) NIL) ((EQL |n| 1) 'T)
              ('T
               (|LZSTAGG-;indexx?| (- |n| 1) (SPADCALL |x| (QREFELT $ 17)) $)))) 

(SDEFUN |LZSTAGG-;index?;IAB;13| ((|n| |Integer|) (|x| A) ($ |Boolean|))
        (COND ((< |n| 1) NIL) ('T (|LZSTAGG-;indexx?| |n| |x| $)))) 

(SDEFUN |LZSTAGG-;indices;AL;14| ((|x| A) ($ |List| (|Integer|)))
        (SPROG
         ((#1=#:G285 NIL) (|y| (A)) (|l| (|List| (|Integer|))) (#2=#:G286 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x|) (LETT |l| NIL)
                (EXIT
                 (SEQ (LETT |i| 1) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN (LETT #2# (NREVERSE |l|)) (GO #3=#:G284)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "indices: infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ (LETT |l| (CONS |i| |l|))
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 9))
                                    (PROGN
                                     (LETT #1#
                                           (|error|
                                            "indices: infinite stream"))
                                     (GO #4=#:G279)))))))
                           #4# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;maxIndex;AI;15| ((|x| A) ($ |Integer|))
        (SPROG ((#1=#:G295 NIL) (|y| (A)) (#2=#:G296 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 19))
                   (|error| "maxIndex: no maximal index for empty stream"))
                  ('T
                   (SEQ (LETT |y| (SPADCALL |x| (QREFELT $ 17)))
                        (EXIT
                         (SEQ (LETT |i| 1) G190 NIL
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |y| (QREFELT $ 27))
                                  (PROGN (LETT #2# |i|) (GO #3=#:G294)))
                                 ((SPADCALL |y| (QREFELT $ 28))
                                  (|error| "maxIndex: infinite stream"))
                                 ('T
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x|
                                             (SPADCALL |x| (QREFELT $ 17)))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (|error|
                                                "maxIndex: infinite stream"))
                                         (GO #4=#:G288)))))))
                                   #4# (EXIT #1#))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;minIndex;AI;16| ((|x| A) ($ |Integer|))
        (COND
         ((SPADCALL |x| (QREFELT $ 19))
          (|error| "minIndex: no minimal index for empty stream"))
         ('T 1))) 

(SDEFUN |LZSTAGG-;delete;AIA;17| ((|x| A) (|n| |Integer|) ($ A))
        (SPROG ((#1=#:G301 NIL) (#2=#:G300 NIL))
               (COND
                ((NULL (SPADCALL |n| |x| (QREFELT $ 46)))
                 (|error| "delete: index out of range"))
                ('T
                 (SPADCALL
                  (SPADCALL |x|
                            (PROG1 (LETT #2# (- |n| 1))
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT $ 47))
                  (SPADCALL |x|
                            (PROG1 (LETT #1# (+ (- |n| 1) 1))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 48))
                  (QREFELT $ 49)))))) 

(SDEFUN |LZSTAGG-;delete;AUsA;18|
        ((|x| A) (|seg| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G311 NIL) (#2=#:G307 NIL) (#3=#:G306 NIL) (|high| (|Integer|))
          (|low| (|Integer|)))
         (SEQ (LETT |low| (SPADCALL |seg| (QREFELT $ 52)))
              (EXIT
               (COND
                ((SPADCALL |seg| (QREFELT $ 53))
                 (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 54)))
                      (EXIT
                       (COND ((< |high| |low|) (SPADCALL |x| (QREFELT $ 55)))
                             (#4='T
                              (SEQ
                               (COND
                                ((SPADCALL |low| |x| (QREFELT $ 46))
                                 (COND
                                  ((NULL (SPADCALL |high| |x| (QREFELT $ 46)))
                                   (EXIT
                                    (|error|
                                     #5="delete: index out of range")))))
                                (#4# (EXIT (|error| #5#))))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |x|
                                           (PROG1 (LETT #3# (- |low| 1))
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 47))
                                 (SPADCALL |x|
                                           (PROG1 (LETT #2# (+ (- |high| 1) 1))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT $ 48))
                                 (QREFELT $ 49)))))))))
                ((NULL (SPADCALL |low| |x| (QREFELT $ 46)))
                 (|error| "delete: index out of range"))
                ('T
                 (SPADCALL |x|
                           (PROG1 (LETT #1# (- |low| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 47)))))))) 

(SDEFUN |LZSTAGG-;elt;AUsA;19|
        ((|x| A) (|seg| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G322 NIL) (#2=#:G318 NIL) (#3=#:G317 NIL) (|high| (|Integer|))
          (|low| (|Integer|)))
         (SEQ (LETT |low| (SPADCALL |seg| (QREFELT $ 52)))
              (EXIT
               (COND
                ((SPADCALL |seg| (QREFELT $ 53))
                 (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 54)))
                      (EXIT
                       (COND ((< |high| |low|) (SPADCALL (QREFELT $ 34)))
                             (#4='T
                              (SEQ
                               (COND
                                ((SPADCALL |low| |x| (QREFELT $ 46))
                                 (COND
                                  ((NULL (SPADCALL |high| |x| (QREFELT $ 46)))
                                   (EXIT
                                    (|error| #5="elt: index out of range")))))
                                (#4# (EXIT (|error| #5#))))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |x|
                                           (PROG1 (LETT #3# (- |low| 1))
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 48))
                                 (PROG1 (LETT #2# (+ (- |high| |low|) 1))
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 47)))))))))
                ((NULL (SPADCALL |low| |x| (QREFELT $ 46)))
                 (|error| "elt: index out of range"))
                ('T
                 (SPADCALL |x|
                           (PROG1 (LETT #1# (- |low| 1))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 48)))))))) 

(SDEFUN |LZSTAGG-;insert;SAIA;20| ((|s| S) (|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|nn| (|NonNegativeInteger|)) (#1=#:G327 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| |x| (QREFELT $ 46)))
                  (|error| "insert: index out of range"))
                 ('T
                  (SEQ
                   (LETT |nn|
                         (PROG1 (LETT #1# (- |n| 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#)))
                   (EXIT
                    (SPADCALL
                     (LIST (SPADCALL |x| |nn| (QREFELT $ 47))
                           (SPADCALL |s| (SPADCALL (QREFELT $ 34))
                                     (QREFELT $ 35))
                           (SPADCALL |x| |nn| (QREFELT $ 48)))
                     (QREFELT $ 59))))))))) 

(SDEFUN |LZSTAGG-;insert;2AIA;21| ((|y| A) (|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|nn| (|NonNegativeInteger|)) (#1=#:G331 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |n| |x| (QREFELT $ 46)))
                  (|error| "insert: index out of range"))
                 ('T
                  (SEQ
                   (LETT |nn|
                         (PROG1 (LETT #1# (- |n| 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#)))
                   (EXIT
                    (SPADCALL
                     (LIST (SPADCALL |x| |nn| (QREFELT $ 47)) |y|
                           (SPADCALL |x| |nn| (QREFELT $ 48)))
                     (QREFELT $ 59))))))))) 

(SDEFUN |LZSTAGG-;cycleElt| ((|x| A) ($ |Union| A "failed"))
        (SPADCALL |x| (QREFELT $ 64))) 

(SDEFUN |LZSTAGG-;cyclic?;AB;23| ((|x| A) ($ |Boolean|))
        (NULL (QEQCAR (|LZSTAGG-;cycleElt| |x| $) 1))) 

(SDEFUN |LZSTAGG-;child?;2AB;24| ((|x| A) (|y| A) ($ |Boolean|))
        (COND ((SPADCALL |y| (QREFELT $ 19)) (|error| "child: no children"))
              ('T (SPADCALL |x| (SPADCALL |y| (QREFELT $ 17)) (QREFELT $ 66))))) 

(SDEFUN |LZSTAGG-;children;AL;25| ((|x| A) ($ |List| A))
        (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "children: no children"))
              ('T (LIST (SPADCALL |x| (QREFELT $ 17)))))) 

(SDEFUN |LZSTAGG-;distance;2AI;26| ((|x| A) (|z| A) ($ |Integer|))
        (SPROG ((#1=#:G355 NIL) (|y| (A)) (#2=#:G356 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| |z| (QREFELT $ 9))
                                (PROGN (LETT #2# |i|) (GO #3=#:G354)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((OR (SPADCALL |y| (QREFELT $ 27))
                                        (SPADCALL |y| (QREFELT $ 28)))
                                    (|error|
                                     "distance: 2nd arg not a descendent of the 1st"))
                                   ('T
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x|
                                             (SPADCALL |x| (QREFELT $ 17)))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (|error|
                                                "distance: 2nd arg not a descendent of the 1st"))
                                         (GO #4=#:G350)))))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;node?;2AB;27| ((|z| A) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G364 NIL) (#2=#:G365 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |z| |y| (QREFELT $ 66))
                                (PROGN (LETT #2# 'T) (GO #3=#:G363)))
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL) (GO #3#)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "node?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                       (COND
                                        ((ODDP |i|)
                                         (LETT |x|
                                               (SPADCALL |x| (QREFELT $ 17)))))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |x| |y| (QREFELT $ 9))
                                          (PROGN
                                           (LETT #1#
                                                 (PROGN
                                                  (LETT #2# NIL)
                                                  (GO #3#)))
                                           (GO #4=#:G358)))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;nodes;AL;28| ((|x| A) ($ |List| A))
        (SPROG
         ((#1=#:G373 NIL) (|y| (A)) (|l| (|List| A)) (#2=#:G374 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x|) (LETT |l| NIL)
                (SEQ (LETT |i| 0) G190 NIL
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |y| (QREFELT $ 27))
                         (PROGN (LETT #2# (NREVERSE |l|)) (GO #3=#:G372)))
                        ((SPADCALL |y| (QREFELT $ 28))
                         (|error| "nodes: infinite stream"))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (CONS |y| |l|))
                                (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                (COND
                                 ((ODDP |i|)
                                  (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                                (EXIT
                                 (COND
                                  ((SPADCALL |x| |y| (QREFELT $ 9))
                                   (PROGN
                                    (LETT #1#
                                          (|error| "nodes: infinite stream"))
                                    (GO #4=#:G367)))))))
                          #4# (EXIT #1#))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))
          #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;leaves;AL;29| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G383 NIL) (|y| (A)) (#2=#:G384 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL) (GO #3=#:G382)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "leaves$Stream: infinite stream"))
                               ((SPADCALL |y| (QREFELT $ 72))
                                (PROGN
                                 (LETT #2#
                                       (LIST (SPADCALL |y| (QREFELT $ 73))))
                                 (GO #3#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                       (COND
                                        ((ODDP |i|)
                                         (LETT |x|
                                               (SPADCALL |x| (QREFELT $ 17)))))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |x| |y| (QREFELT $ 9))
                                          (PROGN
                                           (LETT #1#
                                                 (|error|
                                                  "leaves$Stream: infinite stream"))
                                           (GO #4=#:G376)))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;value;AS;30| ((|x| A) ($ S)) (SPADCALL |x| (QREFELT $ 75))) 

(SDEFUN |LZSTAGG-;computeCycleLength| ((|cycElt| A) ($ |NonNegativeInteger|))
        (SPADCALL |cycElt| (QREFELT $ 77))) 

(SDEFUN |LZSTAGG-;computeCycleEntry| ((|x| A) (|cycElt| A) ($ A))
        (SPADCALL |x| |cycElt| (QREFELT $ 78))) 

(SDEFUN |LZSTAGG-;cycleEntry;2A;33| ((|x| A) ($ A))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $))
                    (EXIT
                     (COND
                      ((QEQCAR |cycElt| 1)
                       (|error| "cycleEntry: non-cyclic stream"))
                      ('T
                       (|LZSTAGG-;computeCycleEntry| |x| (QCDR |cycElt|)
                        $))))))) 

(SDEFUN |LZSTAGG-;cycleLength;ANni;34| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $))
                    (EXIT
                     (COND
                      ((QEQCAR |cycElt| 1)
                       (|error| "cycleLength: non-cyclic stream"))
                      ('T
                       (|LZSTAGG-;computeCycleLength| (QCDR |cycElt|) $))))))) 

(SDEFUN |LZSTAGG-;cycleTail;2A;35| ((|x| A) ($ A))
        (SPROG
         ((|z| (A)) (|y| (A)) (#1=#:G407 NIL) (|cycElt| (|Union| A "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $))
                (EXIT
                 (COND
                  ((QEQCAR |cycElt| 1)
                   (|error| "cycleTail: non-cyclic stream"))
                  ('T
                   (SEQ
                    (LETT |y|
                          (LETT |x|
                                (|LZSTAGG-;computeCycleEntry| |x|
                                 (QCDR |cycElt|) $)))
                    (LETT |z| (SPADCALL |x| (QREFELT $ 17)))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |x| |z| (QREFELT $ 9))
                              (PROGN (LETT #1# |y|) (GO #2=#:G406)))
                             ('T
                              (SEQ (LETT |y| |z|)
                                   (EXIT
                                    (LETT |z|
                                          (SPADCALL |z| (QREFELT $ 17)))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |LZSTAGG-;elt;AfirstS;36| ((|x| A) (T5 "first") ($ S))
        (SPADCALL |x| (QREFELT $ 75))) 

(SDEFUN |LZSTAGG-;first;ANniA;37| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G410 NIL))
               (COND
                ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19)))
                 (SPADCALL (QREFELT $ 34)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                     (PROG1 (LETT #1# (- |n| 1))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 47))
                           (QREFELT $ 35)))))) 

(SDEFUN |LZSTAGG-;rest;2A;38| ((|x| A) ($ A))
        (COND
         ((SPADCALL |x| (QREFELT $ 19))
          (|error| "Can't take the rest of an empty stream."))
         ('T (SPADCALL |x| (QREFELT $ 17))))) 

(SDEFUN |LZSTAGG-;elt;ArestA;39| ((|x| A) (T6 "rest") ($ A))
        (SPADCALL |x| (QREFELT $ 86))) 

(SDEFUN |LZSTAGG-;rest;ANniA;40| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G417 NIL))
               (COND ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19))) |x|)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1 (LETT #1# (- |n| 1))
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 48)))))) 

(SDEFUN |LZSTAGG-;last;AS;41| ((|x| A) ($ S))
        (SPROG
         ((#1=#:G428 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G429 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "last: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x|)
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)))
                       (EXIT
                        (SEQ (LETT |i| 0) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN
                                  (LETT #2# (SPADCALL |y1| (QREFELT $ 15)))
                                  (GO #3=#:G427)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "last: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2|)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17)))
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x|
                                                          (QREFELT $ 17)))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "last: infinite stream"))
                                            (GO #4=#:G421)))))))
                                  #4# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;last;ANniA;42| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G430 NIL) (|m| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 91))
                  (|error| "last: infinite stream"))
                 (#2='T
                  (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 92)))
                       (EXIT
                        (COND
                         ((< |m| |n|) (|error| "last: index out of range"))
                         (#2#
                          (SPADCALL
                           (SPADCALL |x|
                                     (PROG1 (LETT #1# (- |m| |n|))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 48))
                           (QREFELT $ 55))))))))))) 

(SDEFUN |LZSTAGG-;elt;AlastS;43| ((|x| A) (T7 "last") ($ S))
        (SPADCALL |x| (QREFELT $ 94))) 

(SDEFUN |LZSTAGG-;tail;2A;44| ((|x| A) ($ A))
        (SPROG
         ((#1=#:G443 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G444 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "tail: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x|)
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)))
                       (EXIT
                        (SEQ (LETT |i| 0) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN (LETT #2# |y1|) (GO #3=#:G442)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "tail: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2|)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17)))
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x|
                                                          (QREFELT $ 17)))))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "tail: infinite stream"))
                                            (GO #4=#:G436)))))))
                                  #4# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;possiblyInfinite?;AB;45| ((|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G452 NIL) (#2=#:G453 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x|)
                      (EXIT
                       (SEQ (LETT |i| 0) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL) (GO #3=#:G451)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (PROGN (LETT #2# 'T) (GO #3#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17)))))
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN (LETT #2# 'T) (GO #3#)))
                                       (GO #4=#:G446)))))))
                                 #4# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))
                #3# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;explicitlyFinite?;AB;46| ((|x| A) ($ |Boolean|))
        (NULL (SPADCALL |x| (QREFELT $ 91)))) 

(SDEFUN |LZSTAGG-;extend;AIA;47| ((|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|y| (A)) (#1=#:G460 NIL) (|i| NIL))
               (SEQ (LETT |y| |x|)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND
                          ((OR (|greater_SI| |i| #1#)
                               (NULL (NULL (SPADCALL |y| (QREFELT $ 19)))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 17)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |LZSTAGG-;complete;2A;48| ((|x| A) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |x|)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 19))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 17)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(DECLAIM (NOTINLINE |LazyStreamAggregate&;|)) 

(DEFUN |LazyStreamAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|LazyStreamAggregate&| DV$1 DV$2))
          (LETT $ (GETREFV 103))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 18 (CONS (|dispatchFunction| |LZSTAGG-;=;2AB;1|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 67
                      (CONS (|dispatchFunction| |LZSTAGG-;child?;2AB;24|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 70
                      (CONS (|dispatchFunction| |LZSTAGG-;node?;2AB;27|) $))))
          (COND
           ((|HasCategory| |#1| '(|finiteAggregate|))
            (QSETREFV $ 93
                      (CONS (|dispatchFunction| |LZSTAGG-;last;ANniA;42|) $))))
          $))) 

(MAKEPROP '|LazyStreamAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |eq?|) (6 . |explicitlyFinite?|) (|List| 7) (11 . |entries|)
              (16 . =) (22 . |explicitEntries?|) (27 . |frst|) (32 . =)
              (38 . |rst|) (43 . =) (49 . |empty?|) (|NonNegativeInteger|)
              (54 . |less?|) |LZSTAGG-;less?;ANniB;2| (60 . |more?|)
              |LZSTAGG-;more?;ANniB;3| (66 . |size?|) |LZSTAGG-;size?;ANniB;4|
              (72 . |explicitlyEmpty?|) (77 . |lazy?|) |LZSTAGG-;#;ANni;5|
              (|Mapping| 8 7) |LZSTAGG-;any?;MAB;6| |LZSTAGG-;every?;MAB;7|
              |LZSTAGG-;entries;AL;8| (82 . |empty|) (86 . |concat|)
              |LZSTAGG-;construct;LA;9| (|Integer|) (92 . |elt|)
              |LZSTAGG-;elt;AIS;10| |LZSTAGG-;elt;AI2S;11|
              |LZSTAGG-;index?;IAB;13| (|List| 37) |LZSTAGG-;indices;AL;14|
              |LZSTAGG-;maxIndex;AI;15| |LZSTAGG-;minIndex;AI;16|
              (98 . |index?|) (104 . |first|) (110 . |rest|) (116 . |concat|)
              |LZSTAGG-;delete;AIA;17| (|UniversalSegment| 37) (122 . |low|)
              (127 . |hasHi|) (132 . |high|) (137 . |copy|)
              |LZSTAGG-;delete;AUsA;18| |LZSTAGG-;elt;AUsA;19| (|List| $)
              (142 . |concat|) |LZSTAGG-;insert;SAIA;20|
              |LZSTAGG-;insert;2AIA;21| (|Union| 6 '"failed")
              (|CyclicStreamTools| 7 6) (147 . |cycleElt|)
              |LZSTAGG-;cyclic?;AB;23| (152 . =) (158 . |child?|)
              |LZSTAGG-;children;AL;25| |LZSTAGG-;distance;2AI;26|
              (164 . |node?|) |LZSTAGG-;nodes;AL;28| (170 . |leaf?|)
              (175 . |value|) |LZSTAGG-;leaves;AL;29| (180 . |first|)
              |LZSTAGG-;value;AS;30| (185 . |computeCycleLength|)
              (190 . |computeCycleEntry|) |LZSTAGG-;cycleEntry;2A;33|
              |LZSTAGG-;cycleLength;ANni;34| |LZSTAGG-;cycleTail;2A;35|
              '"first" |LZSTAGG-;elt;AfirstS;36| |LZSTAGG-;first;ANniA;37|
              |LZSTAGG-;rest;2A;38| (196 . |rest|) '"rest"
              |LZSTAGG-;elt;ArestA;39| |LZSTAGG-;rest;ANniA;40|
              |LZSTAGG-;last;AS;41| (201 . |possiblyInfinite?|) (206 . |#|)
              (211 . |last|) (217 . |last|) '"last" |LZSTAGG-;elt;AlastS;43|
              |LZSTAGG-;tail;2A;44| |LZSTAGG-;possiblyInfinite?;AB;45|
              |LZSTAGG-;explicitlyFinite?;AB;46| |LZSTAGG-;extend;AIA;47|
              |LZSTAGG-;complete;2A;48| '"value")
           '#(|value| 222 |tail| 227 |size?| 232 |rest| 238 |possiblyInfinite?|
              249 |nodes| 254 |node?| 259 |more?| 265 |minIndex| 271 |maxIndex|
              276 |less?| 281 |leaves| 287 |last| 292 |insert| 303 |indices|
              317 |index?| 322 |first| 328 |extend| 334 |explicitlyFinite?| 340
              |every?| 345 |entries| 351 |elt| 356 |distance| 393 |delete| 399
              |cyclic?| 411 |cycleTail| 416 |cycleLength| 421 |cycleEntry| 426
              |construct| 431 |complete| 436 |children| 441 |child?| 446 |any?|
              452 = 458 |#| 464)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 101
                                                 '(2 6 8 0 0 9 1 6 8 0 10 1 6
                                                   11 0 12 2 11 8 0 0 13 1 6 8
                                                   0 14 1 6 7 0 15 2 7 8 0 0 16
                                                   1 6 0 0 17 2 0 8 0 0 18 1 6
                                                   8 0 19 2 6 8 0 20 21 2 6 8 0
                                                   20 23 2 6 8 0 20 25 1 6 8 0
                                                   27 1 6 8 0 28 0 6 0 34 2 6 0
                                                   7 0 35 2 6 7 0 37 38 2 6 8
                                                   37 0 46 2 6 0 0 20 47 2 6 0
                                                   0 20 48 2 6 0 0 0 49 1 51 37
                                                   0 52 1 51 8 0 53 1 51 37 0
                                                   54 1 6 0 0 55 1 6 0 58 59 1
                                                   63 62 6 64 2 6 8 0 0 66 2 0
                                                   8 0 0 67 2 0 8 0 0 70 1 6 8
                                                   0 72 1 6 7 0 73 1 6 7 0 75 1
                                                   63 20 6 77 2 63 6 6 6 78 1 6
                                                   0 0 86 1 6 8 0 91 1 6 20 0
                                                   92 2 0 0 0 20 93 1 6 7 0 94
                                                   1 0 7 0 76 1 0 0 0 97 2 0 8
                                                   0 20 26 2 0 0 0 20 89 1 0 0
                                                   0 85 1 0 8 0 98 1 0 58 0 71
                                                   2 0 8 0 0 70 2 0 8 0 20 24 1
                                                   0 37 0 45 1 0 37 0 44 2 0 8
                                                   0 20 22 1 0 11 0 74 2 0 0 0
                                                   20 93 1 0 7 0 90 3 0 0 0 0
                                                   37 61 3 0 0 7 0 37 60 1 0 42
                                                   0 43 2 0 8 37 0 41 2 0 0 0
                                                   20 84 2 0 0 0 37 100 1 0 8 0
                                                   99 2 0 8 30 0 32 1 0 11 0 33
                                                   3 0 7 0 37 7 40 2 0 7 0 37
                                                   39 2 0 0 0 51 57 2 0 7 0 95
                                                   96 2 0 0 0 87 88 2 0 7 0 82
                                                   83 2 0 37 0 0 69 2 0 0 0 37
                                                   50 2 0 0 0 51 56 1 0 8 0 65
                                                   1 0 0 0 81 1 0 20 0 80 1 0 0
                                                   0 79 1 0 0 11 36 1 0 0 0 101
                                                   1 0 58 0 68 2 0 8 0 0 67 2 0
                                                   8 30 0 31 2 0 8 0 0 18 1 0
                                                   20 0 29)))))
           '|lookupComplete|)) 
