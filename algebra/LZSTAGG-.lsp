
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
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;less?;ANniB;2|)
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
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;more?;ANniB;3|)
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
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;size?;ANniB;4|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 25)))))) 

(SDEFUN |LZSTAGG-;#;ANni;5| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G231 NIL) (|y| (A)) (#2=#:G232 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;#;ANni;5|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# |i| . #3#) (GO #4=#:G230)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "#: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1# (|error| "#: infinite stream")
                                             . #3#)
                                       (GO #5=#:G225)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;any?;MAB;6|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G242 NIL) (#2=#:G243 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;any?;MAB;6|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G241)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "any?: infinite stream"))
                               ((SPADCALL (SPADCALL |y| (QREFELT $ 15)) |f|)
                                (PROGN (LETT #2# 'T . #3#) (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# NIL . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G234)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;every?;MAB;7|
        ((|f| |Mapping| (|Boolean|) S) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G252 NIL) (#2=#:G253 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;every?;MAB;7|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# 'T . #3#) (GO #4=#:G251)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "every?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (SPADCALL |y| (QREFELT $ 15))
                                               |f|))
                                    (PROGN (LETT #2# NIL . #3#) (GO #4#)))
                                   ('T
                                    (SEQ
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                           . #3#)
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                             . #3#)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (PROGN
                                                (LETT #2# 'T . #3#)
                                                (GO #4#))
                                               . #3#)
                                         (GO #5=#:G246)))))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;entries;AL;8| ((|x| A) ($ |List| S))
        (SPROG
         ((#1=#:G261 NIL) (|y| (A)) (|l| (|List| S)) (#2=#:G262 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;entries;AL;8|))
                (LETT |l| NIL . #3#)
                (EXIT
                 (SEQ (LETT |i| 0 . #3#) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN
                           (LETT #2# (NREVERSE |l|) . #3#)
                           (GO #4=#:G260)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |l| (CONS (SPADCALL |y| (QREFELT $ 15)) |l|)
                                   . #3#)
                             (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                             (COND
                              ((ODDP |i|)
                               (LETT |x| (SPADCALL |x| (QREFELT $ 17)) . #3#)))
                             (EXIT
                              (COND
                               ((SPADCALL |x| |y| (QREFELT $ 9))
                                (PROGN
                                 (LETT #1# (|error| "infinite stream") . #3#)
                                 (GO #5=#:G255)))))))
                           #5# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;construct;LA;9| ((|l| |List| S) ($ A))
        (SPROG ((|res| (A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 34)))
                      ('T
                       (SEQ
                        (LETT |l| (REVERSE |l|)
                              . #1=(|LZSTAGG-;construct;LA;9|))
                        (LETT |res| (SPADCALL (QREFELT $ 34)) . #1#)
                        (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                             (SEQ
                              (LETT |res|
                                    (SPADCALL (|SPADfirst| |l|) |res|
                                              (QREFELT $ 35))
                                    . #1#)
                              (EXIT (LETT |l| (CDR |l|) . #1#)))
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
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;indices;AL;14|))
                (LETT |l| NIL . #3#)
                (EXIT
                 (SEQ (LETT |i| 1 . #3#) G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |y| (QREFELT $ 27))
                          (PROGN
                           (LETT #2# (NREVERSE |l|) . #3#)
                           (GO #4=#:G284)))
                         ((SPADCALL |y| (QREFELT $ 28))
                          (|error| "indices: infinite stream"))
                         ('T
                          (SEQ
                           (EXIT
                            (SEQ (LETT |l| (CONS |i| |l|) . #3#)
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                         . #3#)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 9))
                                    (PROGN
                                     (LETT #1#
                                           (|error| "indices: infinite stream")
                                           . #3#)
                                     (GO #5=#:G279)))))))
                           #5# (EXIT #1#))))))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;maxIndex;AI;15| ((|x| A) ($ |Integer|))
        (SPROG ((#1=#:G295 NIL) (|y| (A)) (#2=#:G296 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT $ 19))
                   (|error| "maxIndex: no maximal index for empty stream"))
                  ('T
                   (SEQ
                    (LETT |y| (SPADCALL |x| (QREFELT $ 17))
                          . #3=(|LZSTAGG-;maxIndex;AI;15|))
                    (EXIT
                     (SEQ (LETT |i| 1 . #3#) G190 NIL
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |y| (QREFELT $ 27))
                              (PROGN (LETT #2# |i| . #3#) (GO #4=#:G294)))
                             ((SPADCALL |y| (QREFELT $ 28))
                              (|error| "maxIndex: infinite stream"))
                             ('T
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                 (COND
                                  ((ODDP |i|)
                                   (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                         . #3#)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x| |y| (QREFELT $ 9))
                                    (PROGN
                                     (LETT #1#
                                           (|error|
                                            "maxIndex: infinite stream")
                                           . #3#)
                                     (GO #5=#:G288)))))))
                               #5# (EXIT #1#))))))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT NIL)))))))
                #4# (EXIT #2#)))) 

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
                            (PROG1
                                (LETT #2# (- |n| 1)
                                      . #3=(|LZSTAGG-;delete;AIA;17|))
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT $ 47))
                  (SPADCALL |x|
                            (PROG1 (LETT #1# (+ (- |n| 1) 1) . #3#)
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
         (SEQ
          (LETT |low| (SPADCALL |seg| (QREFELT $ 52))
                . #4=(|LZSTAGG-;delete;AUsA;18|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 53))
             (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 54)) . #4#)
                  (EXIT
                   (COND ((< |high| |low|) (SPADCALL |x| (QREFELT $ 55)))
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |low| |x| (QREFELT $ 46))
                             (COND
                              ((NULL (SPADCALL |high| |x| (QREFELT $ 46)))
                               (EXIT
                                (|error| #6="delete: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |x|
                                       (PROG1 (LETT #3# (- |low| 1) . #4#)
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       (QREFELT $ 47))
                             (SPADCALL |x|
                                       (PROG1
                                           (LETT #2# (+ (- |high| 1) 1) . #4#)
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #2#))
                                       (QREFELT $ 48))
                             (QREFELT $ 49)))))))))
            ((NULL (SPADCALL |low| |x| (QREFELT $ 46)))
             (|error| "delete: index out of range"))
            ('T
             (SPADCALL |x|
                       (PROG1 (LETT #1# (- |low| 1) . #4#)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       (QREFELT $ 47)))))))) 

(SDEFUN |LZSTAGG-;elt;AUsA;19|
        ((|x| A) (|seg| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((#1=#:G322 NIL) (#2=#:G318 NIL) (#3=#:G317 NIL) (|high| (|Integer|))
          (|low| (|Integer|)))
         (SEQ
          (LETT |low| (SPADCALL |seg| (QREFELT $ 52))
                . #4=(|LZSTAGG-;elt;AUsA;19|))
          (EXIT
           (COND
            ((SPADCALL |seg| (QREFELT $ 53))
             (SEQ (LETT |high| (SPADCALL |seg| (QREFELT $ 54)) . #4#)
                  (EXIT
                   (COND ((< |high| |low|) (SPADCALL (QREFELT $ 34)))
                         (#5='T
                          (SEQ
                           (COND
                            ((SPADCALL |low| |x| (QREFELT $ 46))
                             (COND
                              ((NULL (SPADCALL |high| |x| (QREFELT $ 46)))
                               (EXIT (|error| #6="elt: index out of range")))))
                            (#5# (EXIT (|error| #6#))))
                           (EXIT
                            (SPADCALL
                             (SPADCALL |x|
                                       (PROG1 (LETT #3# (- |low| 1) . #4#)
                                         (|check_subtype2| (>= #3# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #3#))
                                       (QREFELT $ 48))
                             (PROG1 (LETT #2# (+ (- |high| |low|) 1) . #4#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             (QREFELT $ 47)))))))))
            ((NULL (SPADCALL |low| |x| (QREFELT $ 46)))
             (|error| "elt: index out of range"))
            ('T
             (SPADCALL |x|
                       (PROG1 (LETT #1# (- |low| 1) . #4#)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
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
                         (PROG1
                             (LETT #1# (- |n| 1)
                                   . #2=(|LZSTAGG-;insert;SAIA;20|))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         . #2#)
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
                         (PROG1
                             (LETT #1# (- |n| 1)
                                   . #2=(|LZSTAGG-;insert;2AIA;21|))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         . #2#)
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
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;distance;2AI;26|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| |z| (QREFELT $ 9))
                                (PROGN (LETT #2# |i| . #3#) (GO #4=#:G354)))
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
                                     (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                           . #3#)
                                     (COND
                                      ((ODDP |i|)
                                       (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                             . #3#)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |x| |y| (QREFELT $ 9))
                                        (PROGN
                                         (LETT #1#
                                               (|error|
                                                "distance: 2nd arg not a descendent of the 1st")
                                               . #3#)
                                         (GO #5=#:G350)))))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;node?;2AB;27| ((|z| A) (|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G364 NIL) (#2=#:G365 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;node?;2AB;27|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |z| |y| (QREFELT $ 66))
                                (PROGN (LETT #2# 'T . #3#) (GO #4=#:G363)))
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4#)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "node?: infinite stream"))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# NIL . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G358)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;nodes;AL;28| ((|x| A) ($ |List| A))
        (SPROG
         ((#1=#:G373 NIL) (|y| (A)) (|l| (|List| A)) (#2=#:G374 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;nodes;AL;28|))
                (LETT |l| NIL . #3#)
                (SEQ (LETT |i| 0 . #3#) G190 NIL
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |y| (QREFELT $ 27))
                         (PROGN
                          (LETT #2# (NREVERSE |l|) . #3#)
                          (GO #4=#:G372)))
                        ((SPADCALL |y| (QREFELT $ 28))
                         (|error| "nodes: infinite stream"))
                        ('T
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (CONS |y| |l|) . #3#)
                                (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #3#)
                                (COND
                                 ((ODDP |i|)
                                  (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                        . #3#)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |x| |y| (QREFELT $ 9))
                                   (PROGN
                                    (LETT #1#
                                          (|error| "nodes: infinite stream")
                                          . #3#)
                                    (GO #5=#:G367)))))))
                          #5# (EXIT #1#))))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;leaf?;AB;29| ((|x| A) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 72)) (QREFELT $ 19))) 

(SDEFUN |LZSTAGG-;leaves;AL;30| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G384 NIL) (|y| (A)) (#2=#:G385 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;leaves;AL;30|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G383)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (|error| "leaves$Stream: infinite stream"))
                               ((SPADCALL |y| (QREFELT $ 74))
                                (PROGN
                                 (LETT #2# (LIST (SPADCALL |y| (QREFELT $ 75)))
                                       . #3#)
                                 (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (|error|
                                              "leaves$Stream: infinite stream")
                                             . #3#)
                                       (GO #5=#:G377)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;value;AS;31| ((|x| A) ($ S)) (SPADCALL |x| (QREFELT $ 77))) 

(SDEFUN |LZSTAGG-;computeCycleLength| ((|cycElt| A) ($ |NonNegativeInteger|))
        (SPADCALL |cycElt| (QREFELT $ 79))) 

(SDEFUN |LZSTAGG-;computeCycleEntry| ((|x| A) (|cycElt| A) ($ A))
        (SPADCALL |x| |cycElt| (QREFELT $ 80))) 

(SDEFUN |LZSTAGG-;cycleEntry;2A;34| ((|x| A) ($ A))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ
                (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                      |LZSTAGG-;cycleEntry;2A;34|)
                (EXIT
                 (COND
                  ((QEQCAR |cycElt| 1)
                   (|error| "cycleEntry: non-cyclic stream"))
                  ('T (|LZSTAGG-;computeCycleEntry| |x| (QCDR |cycElt|) $))))))) 

(SDEFUN |LZSTAGG-;cycleLength;ANni;35| ((|x| A) ($ |NonNegativeInteger|))
        (SPROG ((|cycElt| (|Union| A "failed")))
               (SEQ
                (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                      |LZSTAGG-;cycleLength;ANni;35|)
                (EXIT
                 (COND
                  ((QEQCAR |cycElt| 1)
                   (|error| "cycleLength: non-cyclic stream"))
                  ('T (|LZSTAGG-;computeCycleLength| (QCDR |cycElt|) $))))))) 

(SDEFUN |LZSTAGG-;cycleTail;2A;36| ((|x| A) ($ A))
        (SPROG
         ((|z| (A)) (|y| (A)) (#1=#:G408 NIL) (|cycElt| (|Union| A "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |cycElt| (|LZSTAGG-;cycleElt| |x| $)
                  . #2=(|LZSTAGG-;cycleTail;2A;36|))
            (EXIT
             (COND
              ((QEQCAR |cycElt| 1) (|error| "cycleTail: non-cyclic stream"))
              ('T
               (SEQ
                (LETT |y|
                      (LETT |x|
                            (|LZSTAGG-;computeCycleEntry| |x| (QCDR |cycElt|)
                             $)
                            . #2#)
                      . #2#)
                (LETT |z| (SPADCALL |x| (QREFELT $ 17)) . #2#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |x| |z| (QREFELT $ 9))
                          (PROGN (LETT #1# |y| . #2#) (GO #3=#:G407)))
                         ('T
                          (SEQ (LETT |y| |z| . #2#)
                               (EXIT
                                (LETT |z| (SPADCALL |z| (QREFELT $ 17))
                                      . #2#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LZSTAGG-;elt;AfirstS;37| ((|x| A) (T5 "first") ($ S))
        (SPADCALL |x| (QREFELT $ 77))) 

(SDEFUN |LZSTAGG-;first;ANniA;38| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G411 NIL))
               (COND
                ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19)))
                 (SPADCALL (QREFELT $ 34)))
                ('T
                 (SPADCALL (SPADCALL |x| (QREFELT $ 15))
                           (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                     (PROG1
                                         (LETT #1# (- |n| 1)
                                               |LZSTAGG-;first;ANniA;38|)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 47))
                           (QREFELT $ 35)))))) 

(SDEFUN |LZSTAGG-;rest;2A;39| ((|x| A) ($ A))
        (COND
         ((SPADCALL |x| (QREFELT $ 19))
          (|error| "Can't take the rest of an empty stream."))
         ('T (SPADCALL |x| (QREFELT $ 17))))) 

(SDEFUN |LZSTAGG-;elt;ArestA;40| ((|x| A) (T6 "rest") ($ A))
        (SPADCALL |x| (QREFELT $ 72))) 

(SDEFUN |LZSTAGG-;rest;ANniA;41| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G418 NIL))
               (COND ((OR (EQL |n| 0) (SPADCALL |x| (QREFELT $ 19))) |x|)
                     ('T
                      (SPADCALL (SPADCALL |x| (QREFELT $ 17))
                                (PROG1
                                    (LETT #1# (- |n| 1)
                                          |LZSTAGG-;rest;ANniA;41|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 48)))))) 

(SDEFUN |LZSTAGG-;last;AS;42| ((|x| A) ($ S))
        (SPROG
         ((#1=#:G429 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G430 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "last: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x| . #3=(|LZSTAGG-;last;AS;42|))
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                       (EXIT
                        (SEQ (LETT |i| 0 . #3#) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN
                                  (LETT #2# (SPADCALL |y1| (QREFELT $ 15))
                                        . #3#)
                                  (GO #4=#:G428)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "last: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2| . #3#)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17))
                                              . #3#)
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 17))
                                                . #3#)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "last: infinite stream")
                                                  . #3#)
                                            (GO #5=#:G422)))))))
                                  #5# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;last;ANniA;43| ((|x| A) (|n| |NonNegativeInteger|) ($ A))
        (SPROG ((#1=#:G431 NIL) (|m| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT $ 92))
                  (|error| "last: infinite stream"))
                 (#2='T
                  (SEQ
                   (LETT |m| (SPADCALL |x| (QREFELT $ 93))
                         . #3=(|LZSTAGG-;last;ANniA;43|))
                   (EXIT
                    (COND ((< |m| |n|) (|error| "last: index out of range"))
                          (#2#
                           (SPADCALL
                            (SPADCALL |x|
                                      (PROG1 (LETT #1# (- |m| |n|) . #3#)
                                        (|check_subtype2| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #1#))
                                      (QREFELT $ 48))
                            (QREFELT $ 55))))))))))) 

(SDEFUN |LZSTAGG-;elt;AlastS;44| ((|x| A) (T7 "last") ($ S))
        (SPADCALL |x| (QREFELT $ 95))) 

(SDEFUN |LZSTAGG-;tail;2A;45| ((|x| A) ($ A))
        (SPROG
         ((#1=#:G444 NIL) (|y2| (A)) (|y1| (A)) (#2=#:G445 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |x| (QREFELT $ 19)) (|error| "tail: empty stream"))
                 ('T
                  (SEQ (LETT |y1| |x| . #3=(|LZSTAGG-;tail;2A;45|))
                       (LETT |y2| (SPADCALL |x| (QREFELT $ 17)) . #3#)
                       (EXIT
                        (SEQ (LETT |i| 0 . #3#) G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |y2| (QREFELT $ 27))
                                 (PROGN (LETT #2# |y1| . #3#) (GO #4=#:G443)))
                                ((SPADCALL |y2| (QREFELT $ 28))
                                 (|error| "tail: infinite stream"))
                                ('T
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |y1| |y2| . #3#)
                                        (LETT |y2|
                                              (SPADCALL |y2| (QREFELT $ 17))
                                              . #3#)
                                        (COND
                                         ((ODDP |i|)
                                          (LETT |x|
                                                (SPADCALL |x| (QREFELT $ 17))
                                                . #3#)))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |x| |y2| (QREFELT $ 9))
                                           (PROGN
                                            (LETT #1#
                                                  (|error|
                                                   "tail: infinite stream")
                                                  . #3#)
                                            (GO #5=#:G437)))))))
                                  #5# (EXIT #1#))))))
                             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                             (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;possiblyInfinite?;AB;46| ((|x| A) ($ |Boolean|))
        (SPROG ((#1=#:G453 NIL) (#2=#:G454 NIL) (|y| (A)) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |y| |x| . #3=(|LZSTAGG-;possiblyInfinite?;AB;46|))
                      (EXIT
                       (SEQ (LETT |i| 0 . #3#) G190 NIL
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |y| (QREFELT $ 27))
                                (PROGN (LETT #2# NIL . #3#) (GO #4=#:G452)))
                               ((SPADCALL |y| (QREFELT $ 28))
                                (PROGN (LETT #2# 'T . #3#) (GO #4#)))
                               ('T
                                (SEQ
                                 (EXIT
                                  (SEQ
                                   (COND
                                    ((ODDP |i|)
                                     (LETT |x| (SPADCALL |x| (QREFELT $ 17))
                                           . #3#)))
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 17))
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |x| |y| (QREFELT $ 9))
                                      (PROGN
                                       (LETT #1#
                                             (PROGN
                                              (LETT #2# 'T . #3#)
                                              (GO #4#))
                                             . #3#)
                                       (GO #5=#:G447)))))))
                                 #5# (EXIT #1#))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL)))))
                #4# (EXIT #2#)))) 

(SDEFUN |LZSTAGG-;explicitlyFinite?;AB;47| ((|x| A) ($ |Boolean|))
        (NULL (SPADCALL |x| (QREFELT $ 92)))) 

(SDEFUN |LZSTAGG-;extend;AIA;48| ((|x| A) (|n| |Integer|) ($ A))
        (SPROG ((|y| (A)) (#1=#:G461 NIL) (|i| NIL))
               (SEQ (LETT |y| |x| . #2=(|LZSTAGG-;extend;AIA;48|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND
                          ((OR (|greater_SI| |i| #1#)
                               (NULL (NULL (SPADCALL |y| (QREFELT $ 19)))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |x|)))) 

(SDEFUN |LZSTAGG-;complete;2A;49| ((|x| A) ($ A))
        (SPROG ((|y| (A)))
               (SEQ (LETT |y| |x| . #1=(|LZSTAGG-;complete;2A;49|))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |y| (QREFELT $ 19))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |y| (SPADCALL |y| (QREFELT $ 17)) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |x|)))) 

(DECLAIM (NOTINLINE |LazyStreamAggregate&;|)) 

(DEFUN |LazyStreamAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LazyStreamAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|LazyStreamAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 104) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
            (QSETREFV $ 94
                      (CONS (|dispatchFunction| |LZSTAGG-;last;ANniA;43|) $))))
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
              (164 . |node?|) |LZSTAGG-;nodes;AL;28| (170 . |rest|)
              |LZSTAGG-;leaf?;AB;29| (175 . |leaf?|) (180 . |value|)
              |LZSTAGG-;leaves;AL;30| (185 . |first|) |LZSTAGG-;value;AS;31|
              (190 . |computeCycleLength|) (195 . |computeCycleEntry|)
              |LZSTAGG-;cycleEntry;2A;34| |LZSTAGG-;cycleLength;ANni;35|
              |LZSTAGG-;cycleTail;2A;36| '"first" |LZSTAGG-;elt;AfirstS;37|
              |LZSTAGG-;first;ANniA;38| |LZSTAGG-;rest;2A;39| '"rest"
              |LZSTAGG-;elt;ArestA;40| |LZSTAGG-;rest;ANniA;41|
              |LZSTAGG-;last;AS;42| (201 . |possiblyInfinite?|) (206 . |#|)
              (211 . |last|) (217 . |last|) '"last" |LZSTAGG-;elt;AlastS;44|
              |LZSTAGG-;tail;2A;45| |LZSTAGG-;possiblyInfinite?;AB;46|
              |LZSTAGG-;explicitlyFinite?;AB;47| |LZSTAGG-;extend;AIA;48|
              |LZSTAGG-;complete;2A;49| '"value")
           '#(|value| 222 |tail| 227 |size?| 232 |rest| 238 |possiblyInfinite?|
              249 |nodes| 254 |node?| 259 |more?| 265 |minIndex| 271 |maxIndex|
              276 |less?| 281 |leaves| 287 |leaf?| 292 |last| 297 |insert| 308
              |indices| 322 |index?| 327 |first| 333 |extend| 339
              |explicitlyFinite?| 345 |every?| 350 |entries| 356 |elt| 361
              |distance| 398 |delete| 404 |cyclic?| 416 |cycleTail| 421
              |cycleLength| 426 |cycleEntry| 431 |construct| 436 |complete| 441
              |children| 446 |child?| 451 |any?| 457 = 463 |#| 469)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 102
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
                                                   8 0 0 67 2 0 8 0 0 70 1 6 0
                                                   0 72 1 6 8 0 74 1 6 7 0 75 1
                                                   6 7 0 77 1 63 20 6 79 2 63 6
                                                   6 6 80 1 6 8 0 92 1 6 20 0
                                                   93 2 0 0 0 20 94 1 6 7 0 95
                                                   1 0 7 0 78 1 0 0 0 98 2 0 8
                                                   0 20 26 2 0 0 0 20 90 1 0 0
                                                   0 87 1 0 8 0 99 1 0 58 0 71
                                                   2 0 8 0 0 70 2 0 8 0 20 24 1
                                                   0 37 0 45 1 0 37 0 44 2 0 8
                                                   0 20 22 1 0 11 0 76 1 0 8 0
                                                   73 2 0 0 0 20 94 1 0 7 0 91
                                                   3 0 0 0 0 37 61 3 0 0 7 0 37
                                                   60 1 0 42 0 43 2 0 8 37 0 41
                                                   2 0 0 0 20 86 2 0 0 0 37 101
                                                   1 0 8 0 100 2 0 8 30 0 32 1
                                                   0 11 0 33 3 0 7 0 37 7 40 2
                                                   0 7 0 37 39 2 0 0 0 51 57 2
                                                   0 7 0 96 97 2 0 0 0 88 89 2
                                                   0 7 0 84 85 2 0 37 0 0 69 2
                                                   0 0 0 37 50 2 0 0 0 51 56 1
                                                   0 8 0 65 1 0 0 0 83 1 0 20 0
                                                   82 1 0 0 0 81 1 0 0 11 36 1
                                                   0 0 0 102 1 0 58 0 68 2 0 8
                                                   0 0 67 2 0 8 30 0 31 2 0 8 0
                                                   0 18 1 0 20 0 29)))))
           '|lookupComplete|)) 
