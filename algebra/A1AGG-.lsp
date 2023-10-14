
(SDEFUN |A1AGG-;parts;AL;1| ((|x| A) ($ |List| S))
        (SPROG ((#1=#:G145 NIL) (|i| NIL) (#2=#:G144 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|A1AGG-;parts;AL;1|))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT $ 9)) . #3#)
                      (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #3#) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| |i| (QREFELT $ 11)) #2#)
                              . #3#)))
                      (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |A1AGG-;sort!;M2A;2| ((|f| |Mapping| (|Boolean|) S S) (|a| A) ($ A))
        (SPADCALL |f| |a| (QREFELT $ 16))) 

(SDEFUN |A1AGG-;any?;MAB;3|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G154 NIL) (#2=#:G155 NIL) (#3=#:G156 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                           . #4=(|A1AGG-;any?;MAB;3|))
                     (LETT #3# (SPADCALL |a| (QREFELT $ 10)) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #5=#:G153))
                                . #4#)
                          (GO #6=#:G150))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;every?;MAB;4|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G161 NIL) (#2=#:G162 NIL) (#3=#:G163 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                           . #4=(|A1AGG-;every?;MAB;4|))
                     (LETT #3# (SPADCALL |a| (QREFELT $ 10)) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|))
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# 'NIL . #4#) (GO #5=#:G160))
                                . #4#)
                          (GO #6=#:G158))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;MAI;5|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Integer|))
        (SPROG ((#1=#:G168 NIL) (#2=#:G169 NIL) (#3=#:G170 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                           . #4=(|A1AGG-;position;MAI;5|))
                     (LETT #3# (SPADCALL |a| (QREFELT $ 10)) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# |i| . #4#) (GO #5=#:G167))
                                . #4#)
                          (GO #6=#:G165))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (- (SPADCALL |a| (QREFELT $ 9)) 1))))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;find;MAU;6|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |Union| S "failed"))
        (SPROG ((#1=#:G181 NIL) (#2=#:G182 NIL) (#3=#:G183 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                           . #4=(|A1AGG-;find;MAU;6|))
                     (LETT #3# (SPADCALL |a| (QREFELT $ 10)) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2#
                                       (CONS 0
                                             (SPADCALL |a| |i| (QREFELT $ 11)))
                                       . #4#)
                                 (GO #5=#:G180))
                                . #4#)
                          (GO #6=#:G175))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;count;MANni;7|
        ((|f| |Mapping| (|Boolean|) S) (|a| A) ($ |NonNegativeInteger|))
        (SPROG ((|n| (|NonNegativeInteger|)) (#1=#:G188 NIL) (|i| NIL))
               (SEQ (LETT |n| 0 . #2=(|A1AGG-;count;MANni;7|))
                    (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #2#)
                         (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #2#) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (LETT |n| (+ |n| 1) . #2#)))))
                         (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |A1AGG-;map!;M2A;8| ((|f| |Mapping| S S) (|a| A) ($ A))
        (SPROG ((#1=#:G193 NIL) (|i| NIL))
               (SEQ
                (SEQ
                 (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                       . #2=(|A1AGG-;map!;M2A;8|))
                 (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #2#) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SPADCALL |a| |i|
                             (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11)) |f|)
                             (QREFELT $ 27))))
                 (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(SDEFUN |A1AGG-;setelt!;AUs2S;9|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) (|x| S) ($ S))
        (SPROG ((|k| NIL) (|h| (|Integer|)) (|l| (|Integer|)))
               (SEQ
                (LETT |l| (SPADCALL |s| (QREFELT $ 31))
                      . #1=(|A1AGG-;setelt!;AUs2S;9|))
                (LETT |h|
                      (COND
                       ((SPADCALL |s| (QREFELT $ 32))
                        (SPADCALL |s| (QREFELT $ 33)))
                       ('T (SPADCALL |a| (QREFELT $ 10))))
                      . #1#)
                (COND
                 ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                      (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10))
                                (QREFELT $ 34)))
                  (EXIT (|error| "index out of range"))))
                (SEQ (LETT |k| |l| . #1#) G190 (COND ((> |k| |h|) (GO G191)))
                     (SEQ (EXIT (SPADCALL |a| |k| |x| (QREFELT $ 27))))
                     (LETT |k| (+ |k| 1) . #1#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |A1AGG-;reduce;MAS;10| ((|f| |Mapping| S S S) (|a| A) ($ S))
        (SPROG ((|r| (S)) (#1=#:G205 NIL) (|k| NIL) (|m| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT $ 36))
                  (|error| "cannot reduce an empty aggregate"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL |a|
                                   (LETT |m| (SPADCALL |a| (QREFELT $ 9))
                                         . #2=(|A1AGG-;reduce;MAS;10|))
                                   (QREFELT $ 11))
                         . #2#)
                   (SEQ (LETT |k| (+ |m| 1) . #2#)
                        (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #2#) G190
                        (COND ((> |k| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |r|
                                (SPADCALL |r| (SPADCALL |a| |k| (QREFELT $ 11))
                                          |f|)
                                . #2#)))
                        (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT |r|))))))) 

(SDEFUN |A1AGG-;reduce;MA2S;11|
        ((|f| |Mapping| S S S) (|a| A) (|identity| S) ($ S))
        (SPROG ((#1=#:G209 NIL) (|k| NIL))
               (SEQ
                (SEQ
                 (LETT |k| (SPADCALL |a| (QREFELT $ 9))
                       . #2=(|A1AGG-;reduce;MA2S;11|))
                 (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #2#) G190
                 (COND ((> |k| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |identity|
                         (SPADCALL |identity| (SPADCALL |a| |k| (QREFELT $ 11))
                                   |f|)
                         . #2#)))
                 (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;reduce;MA3S;12|
        ((|f| |Mapping| S S S) (|a| A) (|identity| S) (|absorber| S) ($ S))
        (SPROG ((#1=#:G213 NIL) (|k| NIL))
               (SEQ
                (SEQ
                 (LETT |k| (SPADCALL |a| (QREFELT $ 9))
                       . #2=(|A1AGG-;reduce;MA3S;12|))
                 (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #2#) G190
                 (COND
                  ((OR (> |k| #1#)
                       (NULL (SPADCALL |identity| |absorber| (QREFELT $ 40))))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |identity|
                         (SPADCALL |identity| (SPADCALL |a| |k| (QREFELT $ 11))
                                   |f|)
                         . #2#)))
                 (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |identity|)))) 

(SDEFUN |A1AGG-;stupidnew| ((|n| |NonNegativeInteger|) (|a| A) (|b| A) ($ A))
        (COND ((ZEROP |n|) (SPADCALL (QREFELT $ 42)))
              (#1='T
               (SPADCALL |n|
                         (COND
                          ((SPADCALL |a| (QREFELT $ 36))
                           (SPADCALL |b| (SPADCALL |b| (QREFELT $ 9))
                                     (QREFELT $ 11)))
                          (#1#
                           (SPADCALL |a| (SPADCALL |a| (QREFELT $ 9))
                                     (QREFELT $ 11))))
                         (QREFELT $ 43))))) 

(SDEFUN |A1AGG-;stupidget| ((|l| |List| A) ($ S))
        (SPROG ((#1=#:G221 NIL) (#2=#:G222 NIL) (#3=#:G223 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |a| NIL . #4=(|A1AGG-;stupidget|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |a| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |a| (QREFELT $ 36)))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (SPADCALL |a| (QREFELT $ 44))
                                           . #4#)
                                     (GO #5=#:G220))
                                    . #4#)
                              (GO #6=#:G218))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (|error| "Should not happen"))))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;map;M3A;15| ((|f| |Mapping| S S S) (|a| A) (|b| A) ($ A))
        (SPROG
         ((|i| NIL) (|j| NIL) (|c| (A)) (|l| (|NonNegativeInteger|))
          (#1=#:G224 NIL) (|n| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (LETT |m|
                (MAX (SPADCALL |a| (QREFELT $ 9)) (SPADCALL |b| (QREFELT $ 9)))
                . #2=(|A1AGG-;map;M3A;15|))
          (LETT |n|
                (MIN (SPADCALL |a| (QREFELT $ 10))
                     (SPADCALL |b| (QREFELT $ 10)))
                . #2#)
          (LETT |l|
                (PROG1 (LETT #1# (MAX 0 (+ (- |n| |m|) 1)) . #2#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |c| (|A1AGG-;stupidnew| |l| |a| |b| $) . #2#)
          (SEQ (LETT |j| |m| . #2#)
               (LETT |i| (SPADCALL |c| (QREFELT $ 9)) . #2#) G190
               (COND ((> |j| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |c| |i|
                           (SPADCALL (SPADCALL |a| |j| (QREFELT $ 11))
                                     (SPADCALL |b| |j| (QREFELT $ 11)) |f|)
                           (QREFELT $ 27))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #2#)) . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |c|)))) 

(SDEFUN |A1AGG-;merge;M3A;16|
        ((|f| |Mapping| (|Boolean|) S S) (|a| A) (|b| A) ($ A))
        (SPROG
         ((|k| NIL) (|j| #1=(|Integer|)) (|i| #1#) (|n| #2=(|Integer|))
          (|m| #2#) (|r| (A)))
         (SEQ
          (LETT |r|
                (|A1AGG-;stupidnew|
                 (+ (SPADCALL |a| (QREFELT $ 46))
                    (SPADCALL |b| (QREFELT $ 46)))
                 |a| |b| $)
                . #3=(|A1AGG-;merge;M3A;16|))
          (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #3#)
          (LETT |m| (SPADCALL |a| (QREFELT $ 10)) . #3#)
          (LETT |j| (SPADCALL |b| (QREFELT $ 9)) . #3#)
          (LETT |n| (SPADCALL |b| (QREFELT $ 10)) . #3#)
          (SEQ (LETT |k| (SPADCALL |r| (QREFELT $ 9)) . #3#) G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |m| (QREFELT $ 47))
                    (SPADCALL |j| |n| (QREFELT $ 47)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                             (SPADCALL |b| |j| (QREFELT $ 11)) |f|)
                   (SEQ
                    (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                              (QREFELT $ 27))
                    (EXIT (LETT |i| (+ |i| 1) . #3#))))
                  ('T
                   (SEQ
                    (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                              (QREFELT $ 27))
                    (EXIT (LETT |j| (+ |j| 1) . #3#)))))))
               (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| |i| . #3#) (LETT |k| |k| . #3#) G190
               (COND ((> |i| |m|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 48))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| |j| . #3#) (LETT |k| |k| . #3#) G190
               (COND ((> |j| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |r| |k| (SPADCALL |b| |j| (QREFELT $ 48))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |A1AGG-;elt;AUsA;17|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((|k| NIL) (|i| NIL) (|r| (A)) (#1=#:G239 NIL) (|h| (|Integer|))
          (|l| (|Integer|)))
         (SEQ
          (LETT |l| (SPADCALL |s| (QREFELT $ 31)) . #2=(|A1AGG-;elt;AUsA;17|))
          (LETT |h|
                (COND
                 ((SPADCALL |s| (QREFELT $ 32)) (SPADCALL |s| (QREFELT $ 33)))
                 ('T (SPADCALL |a| (QREFELT $ 10))))
                . #2#)
          (COND
           ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 34)))
            (EXIT (|error| "index out of range"))))
          (LETT |r|
                (|A1AGG-;stupidnew|
                 (PROG1 (LETT #1# (MAX 0 (+ (- |h| |l|) 1)) . #2#)
                   (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                 |a| |a| $)
                . #2#)
          (SEQ (LETT |i| |l| . #2#)
               (LETT |k| (SPADCALL |r| (QREFELT $ 9)) . #2#) G190
               (COND ((> |i| |h|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #2#)) . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |A1AGG-;insert;2AIA;18| ((|a| A) (|b| A) (|i| |Integer|) ($ A))
        (SPROG
         ((|k| NIL) (|j| NIL) (#1=#:G249 NIL) (#2=#:G248 NIL) (|y| (A))
          (|n| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (LETT |m| (SPADCALL |b| (QREFELT $ 9))
                . #3=(|A1AGG-;insert;2AIA;18|))
          (LETT |n| (SPADCALL |b| (QREFELT $ 10)) . #3#)
          (COND
           ((OR (< |i| |m|) (SPADCALL |i| |n| (QREFELT $ 34)))
            (EXIT (|error| "index out of range"))))
          (LETT |y|
                (|A1AGG-;stupidnew|
                 (+ (SPADCALL |a| (QREFELT $ 46))
                    (SPADCALL |b| (QREFELT $ 46)))
                 |a| |b| $)
                . #3#)
          (SEQ (LETT |j| |m| . #3#) (LETT #2# (- |i| 1) . #3#)
               (LETT |k| (SPADCALL |y| (QREFELT $ 9)) . #3#) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| (SPADCALL |a| (QREFELT $ 9)) . #3#)
               (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #3#)
               (LETT |k| |k| . #3#) G190 (COND ((> |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |k| (SPADCALL |a| |j| (QREFELT $ 11))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| |i| . #3#) (LETT |k| |k| . #3#) G190
               (COND ((> |j| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |y| |k| (SPADCALL |b| |j| (QREFELT $ 11))
                           (QREFELT $ 27))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |y|)))) 

(SDEFUN |A1AGG-;copy;2A;19| ((|x| A) ($ A))
        (SPROG ((#1=#:G253 NIL) (|i| NIL) (|j| NIL) (|y| (A)))
               (SEQ
                (LETT |y|
                      (|A1AGG-;stupidnew| (SPADCALL |x| (QREFELT $ 46)) |x| |x|
                       $)
                      . #2=(|A1AGG-;copy;2A;19|))
                (SEQ (LETT |j| (SPADCALL |y| (QREFELT $ 9)) . #2#)
                     (LETT |i| (SPADCALL |x| (QREFELT $ 9)) . #2#)
                     (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT $ 11))
                                 (QREFELT $ 27))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |y|)))) 

(SDEFUN |A1AGG-;copyInto!;2AIA;20| ((|y| A) (|x| A) (|s| |Integer|) ($ A))
        (SPROG ((#1=#:G259 NIL) (|i| NIL) (|j| NIL))
               (SEQ
                (COND
                 ((OR (< |s| (SPADCALL |y| (QREFELT $ 9)))
                      (SPADCALL (+ |s| (SPADCALL |x| (QREFELT $ 46)))
                                (+ (SPADCALL |y| (QREFELT $ 10)) 1)
                                (QREFELT $ 34)))
                  (|error| "index out of range"))
                 ('T
                  (SEQ
                   (SEQ (LETT |j| |s| . #2=(|A1AGG-;copyInto!;2AIA;20|))
                        (LETT |i| (SPADCALL |x| (QREFELT $ 9)) . #2#)
                        (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #2#) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |y| |j| (SPADCALL |x| |i| (QREFELT $ 11))
                                    (QREFELT $ 27))))
                        (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #2#))
                              . #2#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |y|))))))) 

(SDEFUN |A1AGG-;construct;LA;21| ((|l| |List| S) ($ A))
        (SPROG ((|i| NIL) (#1=#:G264 NIL) (|x| NIL) (|a| (A)))
               (SEQ
                (COND ((NULL |l|) (SPADCALL (QREFELT $ 42)))
                      ('T
                       (SEQ
                        (LETT |a|
                              (SPADCALL (LENGTH |l|) (|SPADfirst| |l|)
                                        (QREFELT $ 43))
                              . #2=(|A1AGG-;construct;LA;21|))
                        (SEQ (LETT |x| NIL . #2#) (LETT #1# |l| . #2#)
                             (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #2#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |a| |i| |x| (QREFELT $ 27))))
                             (LETT |i|
                                   (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #2#))
                                   . #2#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT |a|))))))) 

(SDEFUN |A1AGG-;delete;AUsA;22|
        ((|a| A) (|s| |UniversalSegment| (|Integer|)) ($ A))
        (SPROG
         ((|k| NIL) (#1=#:G275 NIL) (|i| NIL) (#2=#:G274 NIL) (|r| (A))
          (#3=#:G268 NIL) (|h| (|Integer|)) (|l| (|Integer|)))
         (SEQ
          (LETT |l| (SPADCALL |s| (QREFELT $ 31))
                . #4=(|A1AGG-;delete;AUsA;22|))
          (LETT |h|
                (COND
                 ((SPADCALL |s| (QREFELT $ 32)) (SPADCALL |s| (QREFELT $ 33)))
                 (#5='T (SPADCALL |a| (QREFELT $ 10))))
                . #4#)
          (COND
           ((OR (< |l| (SPADCALL |a| (QREFELT $ 9)))
                (SPADCALL |h| (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 34)))
            (EXIT (|error| "index out of range"))))
          (EXIT
           (COND ((< |h| |l|) (SPADCALL |a| (QREFELT $ 55)))
                 (#5#
                  (SEQ
                   (LETT |r|
                         (|A1AGG-;stupidnew|
                          (PROG1
                              (LETT #3#
                                    (-
                                     (+ (- (SPADCALL |a| (QREFELT $ 46)) |h|)
                                        |l|)
                                     1)
                                    . #4#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          |a| |a| $)
                         . #4#)
                   (SEQ (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #4#)
                        (LETT #2# (- |l| 1) . #4#)
                        (LETT |k| (SPADCALL |r| (QREFELT $ 9)) . #4#) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                                    (QREFELT $ 27))))
                        (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #4#))
                              . #4#)
                        (GO G190) G191 (EXIT NIL))
                   (SEQ (LETT |i| (+ |h| 1) . #4#)
                        (LETT #1# (SPADCALL |a| (QREFELT $ 10)) . #4#)
                        (LETT |k| |k| . #4#) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |r| |k| (SPADCALL |a| |i| (QREFELT $ 11))
                                    (QREFELT $ 27))))
                        (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #4#))
                              . #4#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |r|)))))))) 

(SDEFUN |A1AGG-;delete;AIA;23| ((|x| A) (|i| |Integer|) ($ A))
        (SPROG
         ((#1=#:G284 NIL) (|j| NIL) (#2=#:G283 NIL) (|y| (A)) (#3=#:G278 NIL))
         (SEQ
          (COND
           ((OR (< |i| (SPADCALL |x| (QREFELT $ 9)))
                (SPADCALL |i| (SPADCALL |x| (QREFELT $ 10)) (QREFELT $ 34)))
            (|error| "index out of range"))
           ('T
            (SEQ
             (LETT |y|
                   (|A1AGG-;stupidnew|
                    (PROG1
                        (LETT #3# (- (SPADCALL |x| (QREFELT $ 46)) 1)
                              . #4=(|A1AGG-;delete;AIA;23|))
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    |x| |x| $)
                   . #4#)
             (SEQ (LETT |j| (SPADCALL |x| (QREFELT $ 9)) . #4#)
                  (LETT #2# (- |i| 1) . #4#)
                  (LETT |i| (SPADCALL |y| (QREFELT $ 9)) . #4#) G190
                  (COND ((> |j| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT $ 11))
                              (QREFELT $ 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (SEQ (LETT |j| (+ |i| 1) . #4#)
                  (LETT #1# (SPADCALL |x| (QREFELT $ 10)) . #4#)
                  (LETT |i| |i| . #4#) G190 (COND ((> |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |y| |i| (SPADCALL |x| |j| (QREFELT $ 11))
                              (QREFELT $ 27))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT |y|))))))) 

(SDEFUN |A1AGG-;reverse!;2A;24| ((|x| A) ($ A))
        (SPROG ((#1=#:G288 NIL) (|i| NIL) (|n| (|Integer|)) (|m| (|Integer|)))
               (SEQ
                (LETT |m| (SPADCALL |x| (QREFELT $ 9))
                      . #2=(|A1AGG-;reverse!;2A;24|))
                (LETT |n| (SPADCALL |x| (QREFELT $ 10)) . #2#)
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (QUOTIENT2 (- |n| |m|) 2) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |x| (+ |m| |i|) (- |n| |i|) (QREFELT $ 59))))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |A1AGG-;concat;LA;25| ((|l| |List| A) ($ A))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G299 NIL) (|a| NIL) (|r| (A))
          (|n| #2=(|NonNegativeInteger|)) (#3=#:G290 NIL) (#4=#:G289 #2#)
          (#5=#:G291 #2#) (#6=#:G298 NIL))
         (SEQ
          (COND ((NULL |l|) (SPADCALL (QREFELT $ 42)))
                (#7='T
                 (SEQ
                  (LETT |n|
                        (PROGN
                         (LETT #3# NIL . #8=(|A1AGG-;concat;LA;25|))
                         (SEQ (LETT |a| NIL . #8#) (LETT #6# |l| . #8#) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |a| (CAR #6#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #5# (SPADCALL |a| (QREFELT $ 46)) . #8#)
                                 (COND (#3# (LETT #4# (+ #4# #5#) . #8#))
                                       ('T
                                        (PROGN
                                         (LETT #4# #5# . #8#)
                                         (LETT #3# 'T . #8#)))))))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#3# #4#) (#7# 0)))
                        . #8#)
                  (EXIT
                   (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 42)))
                         (#7#
                          (SEQ
                           (LETT |i|
                                 (SPADCALL
                                  (LETT |r|
                                        (SPADCALL |n|
                                                  (|A1AGG-;stupidget| |l| $)
                                                  (QREFELT $ 43))
                                        . #8#)
                                  (QREFELT $ 9))
                                 . #8#)
                           (SEQ (LETT |a| NIL . #8#) (LETT #1# |l| . #8#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ (SPADCALL |r| |a| |i| (QREFELT $ 61))
                                     (EXIT
                                      (LETT |i|
                                            (+ |i|
                                               (SPADCALL |a| (QREFELT $ 46)))
                                            . #8#)))
                                (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT |r|))))))))))) 

(SDEFUN |A1AGG-;sorted?;MAB;26|
        ((|f| |Mapping| (|Boolean|) S S) (|a| A) ($ |Boolean|))
        (SPROG ((#1=#:G304 NIL) (#2=#:G305 NIL) (#3=#:G306 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |a| (QREFELT $ 9))
                           . #4=(|A1AGG-;sorted?;MAB;26|))
                     (LETT #3# (- (SPADCALL |a| (QREFELT $ 10)) 1) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                                    (SPADCALL |a| (+ |i| 1) (QREFELT $ 11))
                                    |f|))
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# 'NIL . #4#) (GO #5=#:G303))
                                . #4#)
                          (GO #6=#:G301))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;concat;3A;27| ((|x| A) (|y| A) ($ A))
        (SPROG ((|i| (|Integer|)) (|z| (A)))
               (SEQ
                (LETT |z|
                      (|A1AGG-;stupidnew|
                       (+ (SPADCALL |x| (QREFELT $ 46))
                          (SPADCALL |y| (QREFELT $ 46)))
                       |x| |y| $)
                      . #1=(|A1AGG-;concat;3A;27|))
                (SPADCALL |z| |x| (LETT |i| (SPADCALL |z| (QREFELT $ 9)) . #1#)
                          (QREFELT $ 61))
                (SPADCALL |z| |y| (+ |i| (SPADCALL |x| (QREFELT $ 46)))
                          (QREFELT $ 61))
                (EXIT |z|)))) 

(SDEFUN |A1AGG-;coerce;AOf;28| ((|r| A) ($ |OutputForm|))
        (SPROG ((#1=#:G313 NIL) (|k| NIL) (#2=#:G312 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|A1AGG-;coerce;AOf;28|))
                   (SEQ (LETT |k| (SPADCALL |r| (QREFELT $ 9)) . #3#)
                        (LETT #1# (SPADCALL |r| (QREFELT $ 10)) . #3#) G190
                        (COND ((> |k| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (SPADCALL (SPADCALL |r| |k| (QREFELT $ 11))
                                           (QREFELT $ 67))
                                 #2#)
                                . #3#)))
                        (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 68))
                 (QREFELT $ 69))))) 

(SDEFUN |A1AGG-;=;2AB;29| ((|x| A) (|y| A) ($ |Boolean|))
        (SPROG ((#1=#:G319 NIL) (#2=#:G320 NIL) (#3=#:G321 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT $ 46))
                             (SPADCALL |y| (QREFELT $ 46)) (QREFELT $ 71))
                   'NIL)
                  ('T
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ
                       (LETT |i| (SPADCALL |x| (QREFELT $ 9))
                             . #4=(|A1AGG-;=;2AB;29|))
                       (LETT #3# (SPADCALL |x| (QREFELT $ 10)) . #4#) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |x| |i| (QREFELT $ 11))
                                      (SPADCALL |y| |i| (QREFELT $ 11))
                                      (QREFELT $ 72)))
                           (PROGN
                            (LETT #1#
                                  (PROGN (LETT #2# 'NIL . #4#) (GO #5=#:G318))
                                  . #4#)
                            (GO #6=#:G315))))))
                       (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                     #6# (EXIT #1#))
                    (EXIT 'T)))))
                #5# (EXIT #2#)))) 

(SDEFUN |A1AGG-;position;SA2I;30|
        ((|x| S) (|t| A) (|s| |Integer|) ($ |Integer|))
        (SPROG ((#1=#:G327 NIL) (#2=#:G328 NIL) (|k| NIL) (|n| (|Integer|)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |n| (SPADCALL |t| (QREFELT $ 10))
                        . #3=(|A1AGG-;position;SA2I;30|))
                  (COND
                   ((OR (< |s| (SPADCALL |t| (QREFELT $ 9)))
                        (SPADCALL |s| |n| (QREFELT $ 34)))
                    (EXIT (|error| "index out of range"))))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |k| |s| . #3#) G190
                         (COND ((> |k| |n|) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |t| |k| (QREFELT $ 11)) |x|
                                       (QREFELT $ 72))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# |k| . #3#) (GO #4=#:G326))
                                    . #3#)
                              (GO #5=#:G324))))))
                         (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (- (SPADCALL |t| (QREFELT $ 9)) 1))))
                #4# (EXIT #2#)))) 

(SDEFUN |A1AGG-;<;2AB;31| ((|a| A) (|b| A) ($ |Boolean|))
        (SPROG
         ((#1=#:G333 NIL) (#2=#:G334 NIL) (#3=#:G335 NIL) (|i| NIL)
          (#4=#:G336 NIL) (|j| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ
               (LETT |j| (SPADCALL |b| (QREFELT $ 9)) . #5=(|A1AGG-;<;2AB;31|))
               (LETT #4# (SPADCALL |b| (QREFELT $ 10)) . #5#)
               (LETT |i| (SPADCALL |a| (QREFELT $ 9)) . #5#)
               (LETT #3# (SPADCALL |a| (QREFELT $ 10)) . #5#) G190
               (COND ((OR (> |i| #3#) (> |j| #4#)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |a| |i| (QREFELT $ 11))
                             (SPADCALL |b| |j| (QREFELT $ 11)) (QREFELT $ 40))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2#
                                 (SPADCALL (SPADCALL |a| |i| (QREFELT $ 48))
                                           (SPADCALL |b| |j| (QREFELT $ 48))
                                           (QREFELT $ 75))
                                 . #5#)
                           (GO #6=#:G332))
                          . #5#)
                    (GO #7=#:G330))))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#)) . #5#)
               (GO G190) G191 (EXIT NIL)))
             #7# (EXIT #1#))
            (EXIT
             (< (SPADCALL |a| (QREFELT $ 46)) (SPADCALL |b| (QREFELT $ 46))))))
          #6# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |OneDimensionalArrayAggregate&;|)) 

(DEFUN |OneDimensionalArrayAggregate&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OneDimensionalArrayAggregate&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|OneDimensionalArrayAggregate&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (QSETREFV $ 41
                      (CONS (|dispatchFunction| |A1AGG-;reduce;MA3S;12|) $))))
          (COND
           ((|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|)))
            (QSETREFV $ 70
                      (CONS (|dispatchFunction| |A1AGG-;coerce;AOf;28|) $))))
          (COND
           ((|HasCategory| |#2| '(|SetCategory|))
            (PROGN
             (QSETREFV $ 73 (CONS (|dispatchFunction| |A1AGG-;=;2AB;29|) $))
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |A1AGG-;position;SA2I;30|)
                             $)))))
          (COND
           ((|HasCategory| |#2| '(|OrderedSet|))
            (QSETREFV $ 76 (CONS (|dispatchFunction| |A1AGG-;<;2AB;31|) $))))
          $))) 

(MAKEPROP '|OneDimensionalArrayAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (0 . |minIndex|) (5 . |maxIndex|) (10 . |qelt|) (|List| 7)
              |A1AGG-;parts;AL;1| (|Mapping| 18 7 7)
              (|FiniteLinearAggregateSort| 7 6) (16 . |quickSort|)
              |A1AGG-;sort!;M2A;2| (|Boolean|) (|Mapping| 18 7)
              |A1AGG-;any?;MAB;3| |A1AGG-;every?;MAB;4| |A1AGG-;position;MAI;5|
              (|Union| 7 '"failed") |A1AGG-;find;MAU;6| (|NonNegativeInteger|)
              |A1AGG-;count;MANni;7| (22 . |qsetelt!|) (|Mapping| 7 7)
              |A1AGG-;map!;M2A;8| (|UniversalSegment| 8) (29 . |lo|)
              (34 . |hasHi|) (39 . |hi|) (44 . >) |A1AGG-;setelt!;AUs2S;9|
              (50 . |empty?|) (|Mapping| 7 7 7) |A1AGG-;reduce;MAS;10|
              |A1AGG-;reduce;MA2S;11| (55 . ~=) (61 . |reduce|) (69 . |empty|)
              (73 . |new|) (79 . |first|) |A1AGG-;map;M3A;15| (84 . |#|)
              (89 . <=) (95 . |elt|) |A1AGG-;merge;M3A;16| |A1AGG-;elt;AUsA;17|
              |A1AGG-;insert;2AIA;18| |A1AGG-;copy;2A;19|
              |A1AGG-;copyInto!;2AIA;20| |A1AGG-;construct;LA;21|
              (101 . |copy|) |A1AGG-;delete;AUsA;22| |A1AGG-;delete;AIA;23|
              (|Void|) (106 . |swap!|) |A1AGG-;reverse!;2A;24|
              (113 . |copyInto!|) (|List| $) |A1AGG-;concat;LA;25|
              |A1AGG-;sorted?;MAB;26| |A1AGG-;concat;3A;27| (|OutputForm|)
              (120 . |coerce|) (125 . |commaSeparate|) (130 . |bracket|)
              (135 . |coerce|) (140 . ~=) (146 . =) (152 . =)
              (158 . |position|) (165 . <) (171 . <))
           '#(|sorted?| 177 |sort!| 183 |setelt!| 189 |reverse!| 196 |reduce|
              201 |position| 222 |parts| 235 |merge| 240 |map!| 247 |map| 253
              |insert| 260 |find| 267 |every?| 273 |elt| 279 |delete| 285
              |count| 297 |copyInto!| 303 |copy| 310 |construct| 315 |concat|
              320 |coerce| 331 |any?| 336 = 342 < 348)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 6 8 0 9 1 6 8 0 10 2 6 7 0
                                                   8 11 2 15 6 14 6 16 3 6 7 0
                                                   8 7 27 1 30 8 0 31 1 30 18 0
                                                   32 1 30 8 0 33 2 8 18 0 0 34
                                                   1 6 18 0 36 2 7 18 0 0 40 4
                                                   0 7 37 0 7 7 41 0 6 0 42 2 6
                                                   0 25 7 43 1 6 7 0 44 1 6 25
                                                   0 46 2 8 18 0 0 47 2 6 7 0 8
                                                   48 1 6 0 0 55 3 6 58 0 8 8
                                                   59 3 6 0 0 0 8 61 1 7 66 0
                                                   67 1 66 0 62 68 1 66 0 0 69
                                                   1 0 66 0 70 2 8 18 0 0 71 2
                                                   7 18 0 0 72 2 0 18 0 0 73 3
                                                   0 8 7 0 8 74 2 7 18 0 0 75 2
                                                   0 18 0 0 76 2 0 18 14 0 64 2
                                                   0 0 14 0 17 3 0 7 0 30 7 35
                                                   1 0 0 0 60 2 0 7 37 0 38 4 0
                                                   7 37 0 7 7 41 3 0 7 37 0 7
                                                   39 3 0 8 7 0 8 74 2 0 8 19 0
                                                   22 1 0 12 0 13 3 0 0 14 0 0
                                                   49 2 0 0 28 0 29 3 0 0 37 0
                                                   0 45 3 0 0 0 0 8 51 2 0 23
                                                   19 0 24 2 0 18 19 0 21 2 0 0
                                                   0 30 50 2 0 0 0 30 56 2 0 0
                                                   0 8 57 2 0 25 19 0 26 3 0 0
                                                   0 0 8 53 1 0 0 0 52 1 0 0 12
                                                   54 1 0 0 62 63 2 0 0 0 0 65
                                                   1 0 66 0 70 2 0 18 19 0 20 2
                                                   0 18 0 0 73 2 0 18 0 0
                                                   76)))))
           '|lookupComplete|)) 
