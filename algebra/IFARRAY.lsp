
(PUT '|IFARRAY;physicalLength;$Nni;1| '|SPADreplace|
     '(XLAM (|r|) (QVELT |r| 0))) 

(SDEFUN |IFARRAY;physicalLength;$Nni;1| ((|r| $) ($ |NonNegativeInteger|))
        (QVELT |r| 0)) 

(SDEFUN |IFARRAY;physicalLength!;$I$;2| ((|r| $) (|n| |Integer|) ($ $))
        (COND
         ((EQL (QVELT |r| 0) 0) (|error| "flexible array must be non-empty"))
         ('T (|IFARRAY;growWith| |r| |n| (QAREF1 (QVELT |r| 2) 0) $)))) 

(SDEFUN |IFARRAY;empty;$;3| (($ $)) (VECTOR 0 0 (MAKE-ARRAY 0))) 

(SDEFUN |IFARRAY;#;$Nni;4| ((|r| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G133 NIL))
               (PROG1 (LETT #1# (QVELT |r| 1) |IFARRAY;#;$Nni;4|)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |IFARRAY;fill!;$S$;5| ((|r| $) (|x| S) ($ $))
        (SEQ (SPADCALL (QVELT |r| 2) |x| (QREFELT $ 17)) (EXIT |r|))) 

(SDEFUN |IFARRAY;maxIndex;$I;6| ((|r| $) ($ |Integer|))
        (+ (- (QVELT |r| 1) 1) (QREFELT $ 7))) 

(SDEFUN |IFARRAY;minIndex;$I;7| ((|r| $) ($ |Integer|)) (QREFELT $ 7)) 

(SDEFUN |IFARRAY;new;NniS$;8| ((|n| |NonNegativeInteger|) (|a| S) ($ $))
        (VECTOR |n| |n| (MAKEARR1 |n| |a|))) 

(SDEFUN |IFARRAY;shrinkable;2B;9| ((|b| |Boolean|) ($ |Boolean|))
        (SPROG ((|oldval| (|Boolean|)))
               (SEQ (LETT |oldval| (QREFELT $ 9) |IFARRAY;shrinkable;2B;9|)
                    (SETELT $ 9 |b|) (EXIT |oldval|)))) 

(SDEFUN |IFARRAY;flexibleArray;L$;10| ((|l| |List| S) ($ $))
        (SPROG
         ((#1=#:G147 NIL) (|i| NIL) (#2=#:G148 NIL) (|y| NIL) (|a| ($))
          (|x| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #3=(|IFARRAY;flexibleArray;L$;10|))
              (EXIT
               (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
                     ('T
                      (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT $ 25)) . #3#)
                           (LETT |a| (SPADCALL |n| |x| (QREFELT $ 21)) . #3#)
                           (SEQ (LETT |y| NIL . #3#) (LETT #2# (CDR |l|) . #3#)
                                (LETT |i| (+ (QREFELT $ 7) 1) . #3#)
                                (LETT #1# (- (+ (QREFELT $ 7) |n|) 1) . #3#)
                                G190
                                (COND
                                 ((OR (> |i| #1#) (ATOM #2#)
                                      (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (SPADCALL |a| |i| |y| (QREFELT $ 26))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #2# (CDR #2#) . #3#))
                                      . #3#)
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |a|)))))))) 

(SDEFUN |IFARRAY;newa|
        ((|n| |NonNegativeInteger|) (|a| |PrimitiveArray| S)
         ($ |PrimitiveArray| S))
        (COND ((ZEROP |n|) (MAKE-ARRAY 0)) ('T (MAKEARR1 |n| (QAREF1 |a| 0))))) 

(SDEFUN |IFARRAY;growAdding| ((|r| $) (|b| |Integer|) (|s| $) ($ $))
        (COND ((EQL |b| 0) |r|)
              ((SPADCALL (SPADCALL |r| (QREFELT $ 15)) 0 (QREFELT $ 28))
               (|IFARRAY;growAndFill| |r| |b| (QAREF1 (QVELT |r| 2) 0) $))
              ((SPADCALL (SPADCALL |s| (QREFELT $ 15)) 0 (QREFELT $ 28))
               (|IFARRAY;growAndFill| |r| |b| (QAREF1 (QVELT |s| 2) 0) $))
              ('T (|error| "no default filler element")))) 

(SDEFUN |IFARRAY;growAndFill| ((|r| $) (|b| |Integer|) (|x| S) ($ $))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (COND
                 ((SPADCALL (QSETVELT |r| 1 (+ (QVELT |r| 1) |b|))
                            (QVELT |r| 0) (QREFELT $ 29))
                  |r|)
                 ('T
                  (SEQ
                   (LETT |n|
                         (+ (+ (QVELT |r| 0) (QUOTIENT2 (QVELT |r| 0) 2)) 1)
                         . #1=(|IFARRAY;growAndFill|))
                   (COND
                    ((SPADCALL (QVELT |r| 1) |n| (QREFELT $ 28))
                     (LETT |n| (QVELT |r| 1) . #1#)))
                   (EXIT (|IFARRAY;growWith| |r| |n| |x| $)))))))) 

(SDEFUN |IFARRAY;growWith| ((|r| $) (|n| |Integer|) (|x| S) ($ $))
        (SPROG
         ((#1=#:G165 NIL) (|k| NIL) (|a| (|PrimitiveArray| S))
          (|y| (|PrimitiveArray| S)) (#2=#:G160 NIL))
         (SEQ
          (LETT |y|
                (MAKEARR1
                 (PROG1 (LETT #2# |n| . #3=(|IFARRAY;growWith|))
                   (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #2#))
                 |x|)
                . #3#)
          (LETT |a| (QVELT |r| 2) . #3#)
          (SEQ (LETT |k| 0 . #3#) (LETT #1# (- (QVELT |r| 0) 1) . #3#) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (EXIT (QSETAREF1 |y| |k| (QAREF1 |a| |k|))))
               (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |r| 0 |n|) (QSETVELT |r| 2 |y|) (EXIT |r|)))) 

(SDEFUN |IFARRAY;shrink| ((|r| $) (|i| |Integer|) ($ $))
        (SPROG
         ((#1=#:G175 NIL) (|k| NIL) (|y| (|PrimitiveArray| S))
          (|a| (|PrimitiveArray| S)) (#2=#:G167 NIL) (|n| (|Integer|)))
         (SEQ (QSETVELT |r| 1 (- (QVELT |r| 1) |i|))
              (EXIT
               (COND
                ((MINUSP (LETT |n| (QVELT |r| 1) . #3=(|IFARRAY;shrink|)))
                 (|error| "internal bug in flexible array"))
                ((OR
                  (SPADCALL (+ (SPADCALL 2 |n| (QREFELT $ 31)) 2) (QVELT |r| 0)
                            (QREFELT $ 28))
                  (NULL (QREFELT $ 9)))
                 |r|)
                ('T
                 (SEQ
                  (COND
                   ((< |n| (QVELT |r| 1))
                    (|error|
                     "cannot shrink flexible array to indicated size")))
                  (EXIT
                   (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
                         ('T
                          (SEQ (QSETVELT |r| 0 |n|)
                               (LETT |y|
                                     (|IFARRAY;newa|
                                      (PROG1 (LETT #2# |n| . #3#)
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#))
                                      (LETT |a| (QVELT |r| 2) . #3#) $)
                                     . #3#)
                               (SEQ (LETT |k| 0 . #3#)
                                    (LETT #1# (- |n| 1) . #3#) G190
                                    (COND ((|greater_SI| |k| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF1 |y| |k| (QAREF1 |a| |k|))))
                                    (LETT |k| (|inc_SI| |k|) . #3#) (GO G190)
                                    G191 (EXIT NIL))
                               (QSETVELT |r| 2 |y|) (EXIT |r|)))))))))))) 

(SDEFUN |IFARRAY;copy;2$;16| ((|r| $) ($ $))
        (SPROG
         ((#1=#:G180 NIL) (|k| NIL) (|v| (|PrimitiveArray| S))
          (|a| (|PrimitiveArray| S)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (SPADCALL |r| (QREFELT $ 15)) . #2=(|IFARRAY;copy;2$;16|))
          (LETT |a| (QVELT |r| 2) . #2#)
          (LETT |v| (|IFARRAY;newa| |n| (LETT |a| (QVELT |r| 2) . #2#) $)
                . #2#)
          (SEQ (LETT |k| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (EXIT (QSETAREF1 |v| |k| (QAREF1 |a| |k|))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |n| |n| |v|))))) 

(SDEFUN |IFARRAY;elt;$IS;17| ((|r| $) (|i| |Integer|) ($ S))
        (COND
         ((OR (< |i| (QREFELT $ 7)) (>= |i| (+ (QVELT |r| 1) (QREFELT $ 7))))
          (|error| "index out of range"))
         ('T (QAREF1 (QVELT |r| 2) (- |i| (QREFELT $ 7)))))) 

(SDEFUN |IFARRAY;setelt!;$I2S;18| ((|r| $) (|i| |Integer|) (|x| S) ($ S))
        (COND
         ((OR (< |i| (QREFELT $ 7)) (>= |i| (+ (QVELT |r| 1) (QREFELT $ 7))))
          (|error| "index out of range"))
         ('T (QSETAREF1 (QVELT |r| 2) (- |i| (QREFELT $ 7)) |x|)))) 

(SDEFUN |IFARRAY;merge;M3$;19|
        ((|g| |Mapping| (|Boolean|) S S) (|a| $) (|b| $) ($ $))
        (SPADCALL |g| (SPADCALL |a| (QREFELT $ 32)) |b| (QREFELT $ 35))) 

(SDEFUN |IFARRAY;concat!;$S$;20| ((|r| $) (|x| S) ($ $))
        (SEQ (|IFARRAY;growAndFill| |r| 1 |x| $)
             (QSETAREF1 (QVELT |r| 2) (- (QVELT |r| 1) 1) |x|) (EXIT |r|))) 

(SDEFUN |IFARRAY;concat!;3$;21| ((|a| $) (|b| $) ($ $))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 38))
                  (LETT |b| (SPADCALL |b| (QREFELT $ 32))
                        . #1=(|IFARRAY;concat!;3$;21|))))
                (LETT |n| (SPADCALL |a| (QREFELT $ 15)) . #1#)
                (|IFARRAY;growAdding| |a| (SPADCALL |b| (QREFELT $ 15)) |b| $)
                (EXIT
                 (SPADCALL |a| |b| (+ |n| (QREFELT $ 7)) (QREFELT $ 39)))))) 

(SDEFUN |IFARRAY;remove!;M2$;22| ((|g| |Mapping| (|Boolean|) S) (|a| $) ($ $))
        (SPROG ((|k| (|Integer|)) (#1=#:G204 NIL) (|i| NIL))
               (SEQ (LETT |k| 0 . #2=(|IFARRAY;remove!;M2$;22|))
                    (SEQ (LETT |i| 0 . #2#)
                         (LETT #1#
                               (- (SPADCALL |a| (QREFELT $ 19)) (QREFELT $ 7))
                               . #2#)
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (SPADCALL |a| |i| (QREFELT $ 33)) |g|))
                             (SEQ
                              (SPADCALL |a| |k|
                                        (SPADCALL |a| |i| (QREFELT $ 33))
                                        (QREFELT $ 26))
                              (EXIT (LETT |k| (+ |k| 1) . #2#)))))))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (|IFARRAY;shrink| |a|
                      (- (SPADCALL |a| (QREFELT $ 15)) |k|) $))))) 

(SDEFUN |IFARRAY;delete!;$I$;23| ((|r| $) (|i1| |Integer|) ($ $))
        (SPROG ((#1=#:G210 NIL) (|k| NIL) (|i| (|Integer|)))
               (SEQ
                (LETT |i| (- |i1| (QREFELT $ 7))
                      . #2=(|IFARRAY;delete!;$I$;23|))
                (COND
                 ((OR (< |i| 0) (SPADCALL |i| (QVELT |r| 1) (QREFELT $ 28)))
                  (EXIT (|error| "index out of range"))))
                (SEQ (LETT |k| |i| . #2#) (LETT #1# (- (QVELT |r| 1) 2) . #2#)
                     G190 (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 (QVELT |r| 2) |k|
                                  (QAREF1 (QVELT |r| 2) (+ |k| 1)))))
                     (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (|IFARRAY;shrink| |r| 1 $))))) 

(SDEFUN |IFARRAY;delete!;$Us$;24|
        ((|r| $) (|i| |UniversalSegment| (|Integer|)) ($ $))
        (SPROG ((|j| NIL) (|k| NIL) (|h| #1=(|Integer|)) (|m| #1#) (|l| #1#))
               (SEQ
                (LETT |l| (- (SPADCALL |i| (QREFELT $ 45)) (QREFELT $ 7))
                      . #2=(|IFARRAY;delete!;$Us$;24|))
                (LETT |m| (- (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 7))
                      . #2#)
                (LETT |h|
                      (COND
                       ((SPADCALL |i| (QREFELT $ 46))
                        (- (SPADCALL |i| (QREFELT $ 47)) (QREFELT $ 7)))
                       ('T |m|))
                      . #2#)
                (COND
                 ((OR (< |l| 0) (SPADCALL |h| |m| (QREFELT $ 28)))
                  (EXIT (|error| "index out of range"))))
                (SEQ (LETT |k| (+ |h| 1) . #2#) (LETT |j| |l| . #2#) G190
                     (COND ((> |k| |m|) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 (QVELT |r| 2) |j|
                                  (QAREF1 (QVELT |r| 2) |k|))))
                     (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT (|IFARRAY;shrink| |r| (MAX 0 (+ (- |h| |l|) 1)) $))))) 

(SDEFUN |IFARRAY;insert!;S$I$;25| ((|x| S) (|r| $) (|i1| |Integer|) ($ $))
        (SPROG ((|k| NIL) (|n| (|Integer|)) (|i| (|Integer|)))
               (SEQ
                (LETT |i| (- |i1| (QREFELT $ 7))
                      . #1=(|IFARRAY;insert!;S$I$;25|))
                (LETT |n| (QVELT |r| 1) . #1#)
                (COND
                 ((OR (< |i| 0) (SPADCALL |i| |n| (QREFELT $ 28)))
                  (EXIT (|error| "index out of range"))))
                (|IFARRAY;growAndFill| |r| 1 |x| $)
                (SEQ (LETT |k| (- |n| 1) . #1#) G190
                     (COND ((< |k| |i|) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF1 (QVELT |r| 2) (+ |k| 1)
                                  (QAREF1 (QVELT |r| 2) |k|))))
                     (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
                (QSETAREF1 (QVELT |r| 2) |i| |x|) (EXIT |r|)))) 

(SDEFUN |IFARRAY;insert!;2$I$;26| ((|a| $) (|b| $) (|i1| |Integer|) ($ $))
        (SPROG
         ((|k| NIL) (|n| #1=(|NonNegativeInteger|)) (|m| #1#)
          (|i| (|Integer|)))
         (SEQ
          (LETT |i| (- |i1| (QREFELT $ 7)) . #2=(|IFARRAY;insert!;2$I$;26|))
          (COND
           ((SPADCALL |a| |b| (QREFELT $ 38))
            (LETT |b| (SPADCALL |b| (QREFELT $ 32)) . #2#)))
          (LETT |m| (SPADCALL |a| (QREFELT $ 15)) . #2#)
          (LETT |n| (SPADCALL |b| (QREFELT $ 15)) . #2#)
          (COND
           ((OR (< |i| 0) (SPADCALL |i| |n| (QREFELT $ 28)))
            (EXIT (|error| "index out of range"))))
          (|IFARRAY;growAdding| |b| |m| |a| $)
          (SEQ (LETT |k| (- |n| 1) . #2#) G190 (COND ((< |k| |i|) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |b| 2) (+ |m| |k|)
                            (QAREF1 (QVELT |b| 2) |k|))))
               (LETT |k| (+ |k| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (- |m| 1) . #2#) G190 (COND ((< |k| 0) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |b| 2) (+ |i| |k|)
                            (QAREF1 (QVELT |a| 2) |k|))))
               (LETT |k| (+ |k| -1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |b|)))) 

(SDEFUN |IFARRAY;merge!;M3$;27|
        ((|g| |Mapping| (|Boolean|) S S) (|a| $) (|b| $) ($ $))
        (SPROG
         ((|k| NIL) (#1=#:G236 NIL) (|j| #2=(|Integer|)) (|i| #2#)
          (|n| #3=(|NonNegativeInteger|)) (|m| #3#))
         (SEQ
          (LETT |m| (SPADCALL |a| (QREFELT $ 15))
                . #4=(|IFARRAY;merge!;M3$;27|))
          (LETT |n| (SPADCALL |b| (QREFELT $ 15)) . #4#)
          (|IFARRAY;growAdding| |a| |n| |b| $)
          (SEQ (LETT |j| (- (+ |m| |n|) 1) . #4#) (LETT |i| (- |m| 1) . #4#)
               G190 (COND ((< |i| 0) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |a| 2) |j| (QAREF1 (QVELT |a| 2) |i|))))
               (LETT |i| (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (LETT |i| |n| . #4#) (LETT |j| 0 . #4#)
          (SEQ (LETT |k| 0 . #4#) G190
               (COND
                ((NULL (COND ((< |i| (+ |n| |m|)) (< |j| |n|)) ('T 'NIL)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 (QVELT |a| 2) |i|)
                             (QAREF1 (QVELT |b| 2) |j|) |g|)
                   (SEQ
                    (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |a| 2) |i|))
                    (EXIT (LETT |i| (+ |i| 1) . #4#))))
                  ('T
                   (SEQ
                    (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |b| 2) |j|))
                    (EXIT (LETT |j| (+ |j| 1) . #4#)))))))
               (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |j| |j| . #4#) (LETT #1# (- |n| 1) . #4#)
               (LETT |k| |k| . #4#) G190 (COND ((> |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |b| 2) |j|))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |a|)))) 

(SDEFUN |IFARRAY;select!;M2$;28| ((|g| |Mapping| (|Boolean|) S) (|a| $) ($ $))
        (SPROG ((|k| (|Integer|)) (#1=#:G243 NIL) (|i| NIL))
               (SEQ (LETT |k| 0 . #2=(|IFARRAY;select!;M2$;28|))
                    (SEQ (LETT |i| 0 . #2#)
                         (LETT #1#
                               (- (SPADCALL |a| (QREFELT $ 19)) (QREFELT $ 7))
                               . #2#)
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QAREF1 (QVELT |a| 2) |i|) |g|)
                             (SEQ
                              (QSETAREF1 (QVELT |a| 2) |k|
                                         (QAREF1 (QVELT |a| 2) |i|))
                              (EXIT (LETT |k| (+ |k| 1) . #2#)))))))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (|IFARRAY;shrink| |a|
                      (- (SPADCALL |a| (QREFELT $ 15)) |k|) $))))) 

(SDEFUN |IFARRAY;removeDuplicates!;2$;29| ((|a| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (|nlim| #1=(|Integer|)) (|j| #1#) (#2=#:G252 NIL)
          (|k| NIL) (|nlim0| #1#) (|ct| (|NonNegativeInteger|)))
         (SEQ
          (LETT |ct| (SPADCALL |a| (QREFELT $ 15))
                . #3=(|IFARRAY;removeDuplicates!;2$;29|))
          (EXIT
           (COND ((< |ct| 2) |a|)
                 (#4='T
                  (SEQ (LETT |i| (QREFELT $ 7) . #3#)
                       (LETT |nlim| (+ (QREFELT $ 7) |ct|) . #3#)
                       (LETT |nlim0| |nlim| . #3#)
                       (SEQ G190 (COND ((NULL (< |i| |nlim|)) (GO G191)))
                            (SEQ (LETT |j| (+ |i| 1) . #3#)
                                 (SEQ (LETT |k| |j| . #3#)
                                      (LETT #2# (- |nlim| 1) . #3#) G190
                                      (COND ((> |k| #2#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |a| |k| (QREFELT $ 33))
                                           (SPADCALL |a| |i| (QREFELT $ 33))
                                           (QREFELT $ 52))
                                          (SEQ
                                           (SPADCALL |a| |j|
                                                     (SPADCALL |a| |k|
                                                               (QREFELT $ 33))
                                                     (QREFELT $ 26))
                                           (EXIT
                                            (LETT |j| (+ |j| 1) . #3#)))))))
                                      (LETT |k| (+ |k| 1) . #3#) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |nlim| |j| . #3#)
                                 (EXIT (LETT |i| (+ |i| 1) . #3#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((SPADCALL |nlim| |nlim0| (QREFELT $ 53))
                          (SPADCALL |a| (SPADCALL |i| (QREFELT $ 54))
                                    (QREFELT $ 48)))
                         (#4# |a|)))))))))) 

(SDEFUN |IFARRAY;removeRepeats!;2$;30| ((|a| $) ($ $))
        (SPROG
         ((|i| #1=(|Integer|)) (|t| (S)) (|j| (|Integer|)) (|s| (S))
          (|nlim| #1#) (|ct| (|NonNegativeInteger|)))
         (SEQ
          (LETT |ct| (SPADCALL |a| (QREFELT $ 15))
                . #2=(|IFARRAY;removeRepeats!;2$;30|))
          (EXIT
           (COND ((< |ct| 2) |a|)
                 (#3='T
                  (SEQ (LETT |j| (QREFELT $ 7) . #2#)
                       (LETT |nlim| (+ (QREFELT $ 7) |ct|) . #2#)
                       (LETT |t| (SPADCALL |a| |j| (QREFELT $ 33)) . #2#)
                       (LETT |i| (+ |j| 1) . #2#)
                       (SEQ G190 (COND ((NULL (< |i| |nlim|)) (GO G191)))
                            (SEQ
                             (LETT |s| (SPADCALL |a| |i| (QREFELT $ 33)) . #2#)
                             (COND
                              ((SPADCALL |s| |t| (QREFELT $ 52))
                               (SEQ (LETT |j| (+ |j| 1) . #2#)
                                    (EXIT
                                     (SPADCALL |a| |j| (LETT |t| |s| . #2#)
                                               (QREFELT $ 26))))))
                             (EXIT (LETT |i| (+ |i| 1) . #2#)))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((< (+ |j| 1) |nlim|)
                          (SPADCALL |a| (SPADCALL (+ |j| 1) (QREFELT $ 54))
                                    (QREFELT $ 48)))
                         (#3# |a|)))))))))) 

(DECLAIM (NOTINLINE |IndexedFlexibleArray;|)) 

(DEFUN |IndexedFlexibleArray| (&REST #1=#:G270)
  (SPROG NIL
         (PROG (#2=#:G271)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedFlexibleArray|)
                                               '|domainEqualList|)
                    . #3=(|IndexedFlexibleArray|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedFlexibleArray;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedFlexibleArray|)))))))))) 

(DEFUN |IndexedFlexibleArray;| (|#1| |#2|)
  (SPROG
   ((#1=#:G269 NIL) (|pv$| NIL) (#2=#:G265 NIL) (#3=#:G266 NIL) (#4=#:G267 NIL)
    ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedFlexibleArray|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT |dv$| (LIST '|IndexedFlexibleArray| DV$1 DV$2) . #5#)
    (LETT $ (GETREFV 70) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|))
                                              . #5#)
                                        (OR
                                         (|HasCategory| |#1| '(|OrderedSet|))
                                         #4#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #4#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          (|HasCategory| |#1| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#1|)))
                                          #4#))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              . #5#)
                                        (OR #3#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #4#)
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #5#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #4#))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|IndexedFlexibleArray| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #5#)
         (|augmentPredVector| $ 2048))
    (AND #4# #1# (|augmentPredVector| $ 4096))
    (AND #3# #1# (|augmentPredVector| $ 8192))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16384))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32768))
    (AND (OR (AND #3# #1#) #4#) (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|Record| (|:| |physLen| (|Integer|)) (|:| |logLen| (|Integer|))
                        (|:| |f| (|PrimitiveArray| |#1|))))
    (QSETREFV $ 9 'T)
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV $ 55
                 (CONS (|dispatchFunction| |IFARRAY;removeDuplicates!;2$;29|)
                       $))
       (QSETREFV $ 56
                 (CONS (|dispatchFunction| |IFARRAY;removeRepeats!;2$;30|)
                       $)))))
    $))) 

(MAKEPROP '|IndexedFlexibleArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              '|shrinkable?| (|NonNegativeInteger|)
              |IFARRAY;physicalLength;$Nni;1| (|Integer|)
              |IFARRAY;physicalLength!;$I$;2| |IFARRAY;empty;$;3|
              |IFARRAY;#;$Nni;4| (|PrimitiveArray| 6) (0 . |fill!|)
              |IFARRAY;fill!;$S$;5| |IFARRAY;maxIndex;$I;6|
              |IFARRAY;minIndex;$I;7| |IFARRAY;new;NniS$;8| (|Boolean|)
              |IFARRAY;shrinkable;2B;9| (|List| 6) (6 . |elt|)
              |IFARRAY;setelt!;$I2S;18| |IFARRAY;flexibleArray;L$;10| (12 . >)
              (18 . <=) (|PositiveInteger|) (24 . *) |IFARRAY;copy;2$;16|
              |IFARRAY;elt;$IS;17| (|Mapping| 22 6 6) |IFARRAY;merge!;M3$;27|
              |IFARRAY;merge;M3$;19| |IFARRAY;concat!;$S$;20| (30 . |eq?|)
              (36 . |copyInto!|) |IFARRAY;concat!;3$;21| (|Mapping| 22 6)
              |IFARRAY;remove!;M2$;22| |IFARRAY;delete!;$I$;23|
              (|UniversalSegment| 12) (43 . |lo|) (48 . |hasHi|) (53 . |hi|)
              |IFARRAY;delete!;$Us$;24| |IFARRAY;insert!;S$I$;25|
              |IFARRAY;insert!;2$I$;26| |IFARRAY;select!;M2$;28| (58 . ~=)
              (64 . ~=) (70 . SEGMENT) (75 . |removeDuplicates!|)
              (80 . |removeRepeats!|) (|Mapping| 6 6 6) (|Equation| 6)
              (|List| 58) (|Void|) (|Mapping| 6 6) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|String|) (|HashState|) (|List| $)
              (|Union| 6 '"failed") (|List| 12))
           '#(~= 85 |swap!| 91 |sorted?| 98 |sort!| 109 |sort| 120 |smaller?|
              131 |size?| 137 |shrinkable| 143 |setelt!| 148 |select!| 162
              |select| 168 |sample| 174 |reverse!| 178 |reverse| 183
              |removeRepeats!| 188 |removeDuplicates!| 193 |removeDuplicates|
              198 |remove!| 203 |remove| 215 |reduce| 227 |qsetelt!| 248 |qelt|
              255 |position| 261 |physicalLength!| 280 |physicalLength| 286
              |parts| 291 |new| 296 |more?| 302 |minIndex| 308 |min| 313
              |merge!| 319 |merge| 332 |members| 345 |member?| 350 |maxIndex|
              356 |max| 361 |map!| 367 |map| 373 |less?| 386 |latex| 392
              |insert!| 397 |insert| 411 |indices| 425 |index?| 430
              |hashUpdate!| 436 |hash| 442 |flexibleArray| 447 |first| 452
              |find| 457 |fill!| 463 |every?| 469 |eval| 475 |eq?| 501 |entry?|
              507 |entries| 513 |empty?| 518 |empty| 523 |elt| 527 |delete!|
              546 |delete| 558 |count| 570 |copyInto!| 582 |copy| 589 |convert|
              594 |construct| 599 |concat!| 604 |concat| 616 |coerce| 639
              |any?| 644 >= 650 > 656 = 662 <= 668 < 674 |#| 680)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11
                                  2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |ExtensibleLinearAggregate&| |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|LinearAggregate| 6)
                 (|IndexedAggregate| 12 6) (|Collection| 6) (|OrderedSet|)
                 (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 12 6) (|Evalable| 6) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 12 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 63)
                 (|BasicType|) (|CoercibleTo| 62) (|PartialOrder|))
              (|makeByteWordVec2| 69
                                  '(2 16 0 0 6 17 2 24 6 0 12 25 2 12 22 0 0 28
                                    2 12 22 0 0 29 2 12 0 30 0 31 2 0 22 0 0 38
                                    3 0 0 0 0 12 39 1 44 12 0 45 1 44 22 0 46 1
                                    44 12 0 47 2 6 22 0 0 52 2 12 22 0 0 53 1
                                    44 0 12 54 1 0 0 0 55 1 0 0 0 56 2 17 22 0
                                    0 1 3 15 60 0 12 12 1 1 2 22 0 1 2 0 22 34
                                    0 1 1 16 0 0 1 2 15 0 34 0 1 1 2 0 0 1 2 0
                                    0 34 0 1 2 2 22 0 0 1 2 0 22 0 10 1 1 0 22
                                    22 23 3 15 6 0 44 6 1 3 15 6 0 12 6 26 2 0
                                    0 41 0 51 2 12 0 41 0 1 0 0 0 1 1 15 0 0 1
                                    1 0 0 0 1 1 0 0 0 56 1 3 0 0 55 1 14 0 0 1
                                    2 3 0 6 0 1 2 0 0 41 0 42 2 14 0 6 0 1 2 12
                                    0 41 0 1 4 14 6 57 0 6 6 1 3 12 6 57 0 6 1
                                    2 12 6 57 0 1 3 15 6 0 12 6 1 2 0 6 0 12 1
                                    3 8 12 6 0 12 1 2 8 12 6 0 1 2 0 12 41 0 1
                                    2 0 0 0 12 13 1 0 10 0 11 1 12 24 0 1 2 0 0
                                    10 6 21 2 0 22 0 10 1 1 7 12 0 20 2 2 0 0 0
                                    1 2 2 0 0 0 1 3 0 0 34 0 0 35 2 2 0 0 0 1 3
                                    0 0 34 0 0 36 1 12 24 0 1 2 14 22 6 0 1 1 7
                                    12 0 19 2 2 0 0 0 1 2 15 0 61 0 1 3 0 0 57
                                    0 0 1 2 0 0 61 0 1 2 0 22 0 10 1 1 3 65 0 1
                                    3 0 0 0 0 12 50 3 0 0 6 0 12 49 3 0 0 6 0
                                    12 1 3 0 0 0 0 12 1 1 0 69 0 1 2 0 22 12 0
                                    1 2 3 66 66 0 1 1 3 64 0 1 1 0 0 24 27 1 7
                                    6 0 1 2 0 68 41 0 1 2 15 0 0 6 18 2 12 22
                                    41 0 1 3 5 0 0 6 6 1 3 5 0 0 24 24 1 2 5 0
                                    0 58 1 2 5 0 0 59 1 2 0 22 0 0 38 2 13 22 6
                                    0 1 1 0 24 0 1 1 0 22 0 1 0 0 0 14 2 0 0 0
                                    44 1 2 0 6 0 12 33 3 0 6 0 12 6 1 2 0 0 0
                                    44 48 2 0 0 0 12 43 2 0 0 0 12 1 2 0 0 0 44
                                    1 2 14 10 6 0 1 2 12 10 41 0 1 3 15 0 0 0
                                    12 39 1 0 0 0 32 1 1 63 0 1 1 0 0 24 1 2 0
                                    0 0 6 37 2 0 0 0 0 40 1 0 0 67 1 2 0 0 6 0
                                    1 2 0 0 0 0 1 2 0 0 0 6 1 1 10 62 0 1 2 12
                                    22 41 0 1 2 2 22 0 0 1 2 2 22 0 0 1 2 17 22
                                    0 0 1 2 2 22 0 0 1 2 2 22 0 0 1 1 12 10 0
                                    15)))))
           '|lookupComplete|)) 
