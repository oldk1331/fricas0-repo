
(/VERSIONCHECK 2) 

(DEFUN |STAGG-;explicitlyFinite?;AB;1| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 9)) 'NIL) ('T 'T))) 

(DEFUN |STAGG-;possiblyInfinite?;AB;2| (|x| $) (SPADCALL |x| (QREFELT $ 9))) 

(DEFUN |STAGG-;first;ANniA;3| (|x| |n| $)
  (PROG (|i| #1=#:G126)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #1# NIL . #2=(|STAGG-;first;ANniA;3|))
        (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (LETT #1#
                     (CONS
                      (|STAGG-;c2| |x|
                       (LETT |x| (SPADCALL |x| (QREFELT $ 12)) . #2#) $)
                      #1#)
                     . #2#)))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
             (EXIT (NREVERSE #1#))))
       (QREFELT $ 14)))))) 

(DEFUN |STAGG-;c2| (|x| |r| $)
  (COND ((SPADCALL |x| (QREFELT $ 17)) (|error| "Index out of range"))
        ('T (SPADCALL |x| (QREFELT $ 18))))) 

(DEFUN |STAGG-;elt;AIS;5| (|x| |i| $)
  (PROG (#1=#:G130)
    (RETURN
     (SEQ
      (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 20)))
            . #2=(|STAGG-;elt;AIS;5|))
      (COND
       ((OR (< |i| 0)
            (SPADCALL
             (LETT |x|
                   (SPADCALL |x|
                             (PROG1 (LETT #1# |i| . #2#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 21))
                   . #2#)
             (QREFELT $ 17)))
        (EXIT (|error| "index out of range"))))
      (EXIT (SPADCALL |x| (QREFELT $ 18))))))) 

(DEFUN |STAGG-;elt;AUsA;6| (|x| |i| $)
  (PROG (#1=#:G139 #2=#:G138 |h| #3=#:G135 |l|)
    (RETURN
     (SEQ
      (LETT |l| (- (SPADCALL |i| (QREFELT $ 24)) (SPADCALL |x| (QREFELT $ 20)))
            . #4=(|STAGG-;elt;AUsA;6|))
      (EXIT
       (COND ((< |l| 0) (|error| "index out of range"))
             ((NULL (SPADCALL |i| (QREFELT $ 25)))
              (SPADCALL
               (SPADCALL |x|
                         (PROG1 (LETT #3# |l| . #4#)
                           (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                            #3#))
                         (QREFELT $ 21))
               (QREFELT $ 26)))
             ('T
              (SEQ
               (LETT |h|
                     (- (SPADCALL |i| (QREFELT $ 27))
                        (SPADCALL |x| (QREFELT $ 20)))
                     . #4#)
               (EXIT
                (COND ((< |h| |l|) (SPADCALL (QREFELT $ 28)))
                      ('T
                       (SPADCALL
                        (SPADCALL |x|
                                  (PROG1 (LETT #2# |l| . #4#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  (QREFELT $ 21))
                        (PROG1 (LETT #1# (+ (- |h| |l|) 1) . #4#)
                          (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                           #1#))
                        (QREFELT $ 29))))))))))))) 

(DEFUN |STAGG-;concat;3A;7| (|x| |y| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |y| (QREFELT $ 31))) 

(DEFUN |STAGG-;concat;LA;8| (|l| $)
  (PROG (|res| #1=#:G148 |x| |l1|)
    (RETURN
     (SEQ
      (COND ((NULL |l|) (SPADCALL (QREFELT $ 28)))
            ('T
             (SEQ (LETT |l1| (REVERSE |l|) . #2=(|STAGG-;concat;LA;8|))
                  (LETT |res| (SPADCALL (QREFELT $ 28)) . #2#)
                  (SEQ (LETT |x| NIL . #2#) (LETT #1# |l1| . #2#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 26)) |res|
                                         (QREFELT $ 31))
                               . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(DEFUN |STAGG-;map!;M2A;9| (|f| |l| $)
  (PROG (|y|)
    (RETURN
     (SEQ (LETT |y| |l| . #1=(|STAGG-;map!;M2A;9|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |l| (QREFELT $ 17)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ
                (SPADCALL |l| (SPADCALL (SPADCALL |l| (QREFELT $ 18)) |f|)
                          (QREFELT $ 35))
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 12)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |y|))))) 

(DEFUN |STAGG-;fill!;ASA;10| (|x| |s| $)
  (PROG (|y|)
    (RETURN
     (SEQ (LETT |y| |x| . #1=(|STAGG-;fill!;ASA;10|))
          (SEQ G190
               (COND
                ((NULL (COND ((SPADCALL |y| (QREFELT $ 17)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (SPADCALL |y| |s| (QREFELT $ 35))
                    (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 12)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |x|))))) 

(DEFUN |STAGG-;setelt;AI2S;11| (|x| |i| |s| $)
  (PROG (#1=#:G161)
    (RETURN
     (SEQ
      (LETT |i| (- |i| (SPADCALL |x| (QREFELT $ 20)))
            . #2=(|STAGG-;setelt;AI2S;11|))
      (COND
       ((OR (< |i| 0)
            (SPADCALL
             (LETT |x|
                   (SPADCALL |x|
                             (PROG1 (LETT #1# |i| . #2#)
                               (|check_subtype| (>= #1# 0)
                                                '(|NonNegativeInteger|) #1#))
                             (QREFELT $ 21))
                   . #2#)
             (QREFELT $ 17)))
        (EXIT (|error| "index out of range"))))
      (EXIT (SPADCALL |x| |s| (QREFELT $ 35))))))) 

(DEFUN |STAGG-;setelt;AUs2S;12| (|x| |i| |s| $)
  (PROG (|y| |z| #1=#:G168 #2=#:G167 |h| |l|)
    (RETURN
     (SEQ
      (LETT |l| (- (SPADCALL |i| (QREFELT $ 24)) (SPADCALL |x| (QREFELT $ 20)))
            . #3=(|STAGG-;setelt;AUs2S;12|))
      (EXIT
       (COND ((< |l| 0) (|error| "index out of range"))
             (#4='T
              (SEQ
               (LETT |h|
                     (COND
                      ((SPADCALL |i| (QREFELT $ 25))
                       (- (SPADCALL |i| (QREFELT $ 27))
                          (SPADCALL |x| (QREFELT $ 20))))
                      (#4# (SPADCALL |x| (QREFELT $ 40))))
                     . #3#)
               (EXIT
                (COND ((< |h| |l|) |s|)
                      (#4#
                       (SEQ
                        (LETT |y|
                              (SPADCALL |x|
                                        (PROG1 (LETT #2# |l| . #3#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        (QREFELT $ 21))
                              . #3#)
                        (LETT |z|
                              (SPADCALL |y|
                                        (PROG1
                                            (LETT #1# (+ (- |h| |l|) 1) . #3#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 21))
                              . #3#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((SPADCALL |y| |z| (QREFELT $ 41)) 'NIL)
                                      ('T 'T)))
                               (GO G191)))
                             (SEQ (SPADCALL |y| |s| (QREFELT $ 35))
                                  (EXIT
                                   (LETT |y| (SPADCALL |y| (QREFELT $ 12))
                                         . #3#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |s|))))))))))))) 

(DEFUN |STAGG-;concat!;3A;13| (|x| |y| $)
  (SEQ
   (COND ((SPADCALL |x| (QREFELT $ 17)) |y|)
         ('T
          (SEQ (SPADCALL (SPADCALL |x| (QREFELT $ 43)) |y| (QREFELT $ 44))
               (EXIT |x|)))))) 

(DECLAIM (NOTINLINE |StreamAggregate&;|)) 

(DEFUN |StreamAggregate&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|StreamAggregate&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|StreamAggregate&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 50) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|shallowlyMutable|))
        (PROGN
         (QSETREFV $ 32 (CONS (|dispatchFunction| |STAGG-;concat;3A;7|) $))
         (QSETREFV $ 34 (CONS (|dispatchFunction| |STAGG-;concat;LA;8|) $))
         (QSETREFV $ 37 (CONS (|dispatchFunction| |STAGG-;map!;M2A;9|) $))
         (QSETREFV $ 38 (CONS (|dispatchFunction| |STAGG-;fill!;ASA;10|) $))
         (QSETREFV $ 39 (CONS (|dispatchFunction| |STAGG-;setelt;AI2S;11|) $))
         (QSETREFV $ 42 (CONS (|dispatchFunction| |STAGG-;setelt;AUs2S;12|) $))
         (QSETREFV $ 45
                   (CONS (|dispatchFunction| |STAGG-;concat!;3A;13|) $)))))
      $)))) 

(MAKEPROP '|StreamAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (0 . |cyclic?|) |STAGG-;explicitlyFinite?;AB;1|
              |STAGG-;possiblyInfinite?;AB;2| (5 . |rest|) (|List| 7)
              (10 . |construct|) (|NonNegativeInteger|) |STAGG-;first;ANniA;3|
              (15 . |empty?|) (20 . |first|) (|Integer|) (25 . |minIndex|)
              (30 . |rest|) |STAGG-;elt;AIS;5| (|UniversalSegment| 19)
              (36 . |lo|) (41 . |hasHi|) (46 . |copy|) (51 . |hi|)
              (56 . |empty|) (60 . |first|) |STAGG-;elt;AUsA;6|
              (66 . |concat!|) (72 . |concat|) (|List| $) (78 . |concat|)
              (83 . |setfirst!|) (|Mapping| 7 7) (89 . |map!|) (95 . |fill!|)
              (101 . |setelt|) (108 . |maxIndex|) (113 . |eq?|)
              (119 . |setelt|) (126 . |tail|) (131 . |setrest!|)
              (137 . |concat!|) '"rest" '"last" '"first" '"value")
           '#(|setelt| 143 |possiblyInfinite?| 157 |map!| 162 |first| 168
              |fill!| 174 |explicitlyFinite?| 180 |elt| 185 |concat!| 197
              |concat| 203)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(1 6 8 0 9 1 6 0 0 12 1 6 0
                                                   13 14 1 6 8 0 17 1 6 7 0 18
                                                   1 6 19 0 20 2 6 0 0 15 21 1
                                                   23 19 0 24 1 23 8 0 25 1 6 0
                                                   0 26 1 23 19 0 27 0 6 0 28 2
                                                   6 0 0 15 29 2 6 0 0 0 31 2 0
                                                   0 0 0 32 1 0 0 33 34 2 6 7 0
                                                   7 35 2 0 0 36 0 37 2 0 0 0 7
                                                   38 3 0 7 0 19 7 39 1 6 19 0
                                                   40 2 6 8 0 0 41 3 0 7 0 23 7
                                                   42 1 6 0 0 43 2 6 0 0 0 44 2
                                                   0 0 0 0 45 3 0 7 0 19 7 39 3
                                                   0 7 0 23 7 42 1 0 8 0 11 2 0
                                                   0 36 0 37 2 0 0 0 15 16 2 0
                                                   0 0 7 38 1 0 8 0 10 2 0 7 0
                                                   19 22 2 0 0 0 23 30 2 0 0 0
                                                   0 45 1 0 0 33 34 2 0 0 0 0
                                                   32)))))
           '|lookupComplete|)) 
