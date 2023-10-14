
(/VERSIONCHECK 2) 

(PUT '|IFARRAY;physicalLength;$Nni;1| '|SPADreplace|
     '(XLAM (|r|) (QVELT |r| 0))) 

(DEFUN |IFARRAY;physicalLength;$Nni;1| (|r| $) (QVELT |r| 0)) 

(DEFUN |IFARRAY;physicalLength!;$I$;2| (|r| |n| $)
  (COND ((EQL (QVELT |r| 0) 0) (|error| "flexible array must be non-empty"))
        ('T (|IFARRAY;growWith| |r| |n| (QAREF1 (QVELT |r| 2) 0) $)))) 

(DEFUN |IFARRAY;empty;$;3| ($) (VECTOR 0 0 (MAKE-ARRAY 0))) 

(DEFUN |IFARRAY;#;$Nni;4| (|r| $)
  (PROG (#1=#:G156)
    (RETURN
     (PROG1 (LETT #1# (QVELT |r| 1) |IFARRAY;#;$Nni;4|)
       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))) 

(DEFUN |IFARRAY;fill!;$S$;5| (|r| |x| $)
  (SEQ (SPADCALL (QVELT |r| 2) |x| (QREFELT $ 17)) (EXIT |r|))) 

(DEFUN |IFARRAY;maxIndex;$I;6| (|r| $) (+ (- (QVELT |r| 1) 1) (QREFELT $ 7))) 

(DEFUN |IFARRAY;minIndex;$I;7| (|r| $) (QREFELT $ 7)) 

(DEFUN |IFARRAY;new;NniS$;8| (|n| |a| $) (VECTOR |n| |n| (MAKEARR1 |n| |a|))) 

(DEFUN |IFARRAY;shrinkable;2B;9| (|b| $)
  (PROG (|oldval|)
    (RETURN
     (SEQ (LETT |oldval| (QREFELT $ 9) |IFARRAY;shrinkable;2B;9|)
          (SETELT $ 9 |b|) (EXIT |oldval|))))) 

(DEFUN |IFARRAY;flexibleArray;L$;10| (|l| $)
  (PROG (#1=#:G170 |i| #2=#:G171 |y| |a| |x| |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #3=(|IFARRAY;flexibleArray;L$;10|))
          (EXIT
           (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
                 ('T
                  (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT $ 25)) . #3#)
                       (LETT |a| (SPADCALL |n| |x| (QREFELT $ 21)) . #3#)
                       (SEQ (LETT |y| NIL . #3#) (LETT #2# (CDR |l|) . #3#)
                            (LETT |i| (+ (QREFELT $ 7) 1) . #3#)
                            (LETT #1# (- (+ (QREFELT $ 7) |n|) 1) . #3#) G190
                            (COND
                             ((OR (> |i| #1#) (ATOM #2#)
                                  (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (SPADCALL |a| |i| |y| (QREFELT $ 26))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #3#))
                                  . #3#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |a|))))))))) 

(DEFUN |IFARRAY;newa| (|n| |a| $)
  (COND ((ZEROP |n|) (MAKE-ARRAY 0)) ('T (MAKEARR1 |n| (QAREF1 |a| 0))))) 

(DEFUN |IFARRAY;growAdding| (|r| |b| |s| $)
  (COND ((EQL |b| 0) |r|)
        ((SPADCALL (SPADCALL |r| (QREFELT $ 15)) 0 (QREFELT $ 28))
         (|IFARRAY;growAndFill| |r| |b| (QAREF1 (QVELT |r| 2) 0) $))
        ((SPADCALL (SPADCALL |s| (QREFELT $ 15)) 0 (QREFELT $ 28))
         (|IFARRAY;growAndFill| |r| |b| (QAREF1 (QVELT |s| 2) 0) $))
        ('T (|error| "no default filler element")))) 

(DEFUN |IFARRAY;growAndFill| (|r| |b| |x| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QSETVELT |r| 1 (+ (QVELT |r| 1) |b|)) (QVELT |r| 0)
                  (QREFELT $ 29))
        |r|)
       ('T
        (SEQ
         (LETT |n| (+ (+ (QVELT |r| 0) (QUOTIENT2 (QVELT |r| 0) 2)) 1)
               . #1=(|IFARRAY;growAndFill|))
         (COND
          ((SPADCALL (QVELT |r| 1) |n| (QREFELT $ 28))
           (LETT |n| (QVELT |r| 1) . #1#)))
         (EXIT (|IFARRAY;growWith| |r| |n| |x| $))))))))) 

(DEFUN |IFARRAY;growWith| (|r| |n| |x| $)
  (PROG (#1=#:G188 |k| |a| |y| #2=#:G183)
    (RETURN
     (SEQ
      (LETT |y|
            (MAKEARR1
             (PROG1 (LETT #2# |n| . #3=(|IFARRAY;growWith|))
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             |x|)
            . #3#)
      (LETT |a| (QVELT |r| 2) . #3#)
      (SEQ (LETT |k| 0 . #3#) (LETT #1# (- (QVELT |r| 0) 1) . #3#) G190
           (COND ((|greater_SI| |k| #1#) (GO G191)))
           (SEQ (EXIT (QSETAREF1 |y| |k| (QAREF1 |a| |k|))))
           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
      (QSETVELT |r| 0 |n|) (QSETVELT |r| 2 |y|) (EXIT |r|))))) 

(DEFUN |IFARRAY;shrink| (|r| |i| $)
  (PROG (#1=#:G198 |k| |y| |a| #2=#:G190 |n|)
    (RETURN
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
                (|error| "cannot shrink flexible array to indicated size")))
              (EXIT
               (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
                     ('T
                      (SEQ (QSETVELT |r| 0 |n|)
                           (LETT |y|
                                 (|IFARRAY;newa|
                                  (PROG1 (LETT #2# |n| . #3#)
                                    (|check_subtype| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     #2#))
                                  (LETT |a| (QVELT |r| 2) . #3#) $)
                                 . #3#)
                           (SEQ (LETT |k| 0 . #3#) (LETT #1# (- |n| 1) . #3#)
                                G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                (SEQ
                                 (EXIT (QSETAREF1 |y| |k| (QAREF1 |a| |k|))))
                                (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (QSETVELT |r| 2 |y|) (EXIT |r|))))))))))))) 

(DEFUN |IFARRAY;copy;2$;16| (|r| $)
  (PROG (#1=#:G203 |k| |v| |a| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 15)) . #2=(|IFARRAY;copy;2$;16|))
          (LETT |a| (QVELT |r| 2) . #2#)
          (LETT |v| (|IFARRAY;newa| |n| (LETT |a| (QVELT |r| 2) . #2#) $)
                . #2#)
          (SEQ (LETT |k| 0 . #2#) (LETT #1# (- |n| 1) . #2#) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (EXIT (QSETAREF1 |v| |k| (QAREF1 |a| |k|))))
               (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |n| |n| |v|)))))) 

(DEFUN |IFARRAY;elt;$IS;17| (|r| |i| $)
  (COND
   ((OR (< |i| (QREFELT $ 7)) (>= |i| (+ (QVELT |r| 1) (QREFELT $ 7))))
    (|error| "index out of range"))
   ('T (QAREF1 (QVELT |r| 2) (- |i| (QREFELT $ 7)))))) 

(DEFUN |IFARRAY;setelt;$I2S;18| (|r| |i| |x| $)
  (COND
   ((OR (< |i| (QREFELT $ 7)) (>= |i| (+ (QVELT |r| 1) (QREFELT $ 7))))
    (|error| "index out of range"))
   ('T (QSETAREF1 (QVELT |r| 2) (- |i| (QREFELT $ 7)) |x|)))) 

(DEFUN |IFARRAY;merge;M3$;19| (|g| |a| |b| $)
  (SPADCALL |g| (SPADCALL |a| (QREFELT $ 32)) |b| (QREFELT $ 35))) 

(DEFUN |IFARRAY;concat;S2$;20| (|x| |r| $)
  (SPADCALL |x| |r| (QREFELT $ 7) (QREFELT $ 37))) 

(DEFUN |IFARRAY;concat!;$S$;21| (|r| |x| $)
  (SEQ (|IFARRAY;growAndFill| |r| 1 |x| $)
       (QSETAREF1 (QVELT |r| 2) (- (QVELT |r| 1) 1) |x|) (EXIT |r|))) 

(DEFUN |IFARRAY;concat!;3$;22| (|a| |b| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| |b| (QREFELT $ 40))
        (LETT |b| (SPADCALL |b| (QREFELT $ 32))
              . #1=(|IFARRAY;concat!;3$;22|))))
      (LETT |n| (SPADCALL |a| (QREFELT $ 15)) . #1#)
      (|IFARRAY;growAdding| |a| (SPADCALL |b| (QREFELT $ 15)) |b| $)
      (EXIT (SPADCALL |a| |b| (+ |n| (QREFELT $ 7)) (QREFELT $ 41))))))) 

(DEFUN |IFARRAY;remove!;M2$;23| (|g| |a| $)
  (PROG (|k| #1=#:G228 |i|)
    (RETURN
     (SEQ (LETT |k| 0 . #2=(|IFARRAY;remove!;M2$;23|))
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (- (SPADCALL |a| (QREFELT $ 19)) (QREFELT $ 7)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL (SPADCALL |a| |i| (QREFELT $ 33)) |g|))
                   (SEQ
                    (SPADCALL |a| |k| (SPADCALL |a| |i| (QREFELT $ 33))
                              (QREFELT $ 26))
                    (EXIT (LETT |k| (+ |k| 1) . #2#)))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|IFARRAY;shrink| |a| (- (SPADCALL |a| (QREFELT $ 15)) |k|) $)))))) 

(DEFUN |IFARRAY;delete!;$I$;24| (|r| |i1| $)
  (PROG (#1=#:G234 |k| |i|)
    (RETURN
     (SEQ (LETT |i| (- |i1| (QREFELT $ 7)) . #2=(|IFARRAY;delete!;$I$;24|))
          (COND
           ((OR (< |i| 0) (SPADCALL |i| (QVELT |r| 1) (QREFELT $ 28)))
            (EXIT (|error| "index out of range"))))
          (SEQ (LETT |k| |i| . #2#) (LETT #1# (- (QVELT |r| 1) 2) . #2#) G190
               (COND ((> |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |r| 2) |k|
                            (QAREF1 (QVELT |r| 2) (+ |k| 1)))))
               (LETT |k| (+ |k| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (|IFARRAY;shrink| |r| 1 $)))))) 

(DEFUN |IFARRAY;delete!;$Us$;25| (|r| |i| $)
  (PROG (|j| |k| |h| |m| |l|)
    (RETURN
     (SEQ
      (LETT |l| (- (SPADCALL |i| (QREFELT $ 47)) (QREFELT $ 7))
            . #1=(|IFARRAY;delete!;$Us$;25|))
      (LETT |m| (- (SPADCALL |r| (QREFELT $ 19)) (QREFELT $ 7)) . #1#)
      (LETT |h|
            (COND
             ((SPADCALL |i| (QREFELT $ 48))
              (- (SPADCALL |i| (QREFELT $ 49)) (QREFELT $ 7)))
             ('T |m|))
            . #1#)
      (COND
       ((OR (< |l| 0) (SPADCALL |h| |m| (QREFELT $ 28)))
        (EXIT (|error| "index out of range"))))
      (SEQ (LETT |k| (+ |h| 1) . #1#) (LETT |j| |l| . #1#) G190
           (COND ((> |k| |m|) (GO G191)))
           (SEQ
            (EXIT (QSETAREF1 (QVELT |r| 2) |j| (QAREF1 (QVELT |r| 2) |k|))))
           (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1) . #1#)) . #1#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (|IFARRAY;shrink| |r| (MAX 0 (+ (- |h| |l|) 1)) $)))))) 

(DEFUN |IFARRAY;insert!;S$I$;26| (|x| |r| |i1| $)
  (PROG (|k| |n| |i|)
    (RETURN
     (SEQ (LETT |i| (- |i1| (QREFELT $ 7)) . #1=(|IFARRAY;insert!;S$I$;26|))
          (LETT |n| (QVELT |r| 1) . #1#)
          (COND
           ((OR (< |i| 0) (SPADCALL |i| |n| (QREFELT $ 28)))
            (EXIT (|error| "index out of range"))))
          (|IFARRAY;growAndFill| |r| 1 |x| $)
          (SEQ (LETT |k| (- |n| 1) . #1#) G190 (COND ((< |k| |i|) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |r| 2) (+ |k| 1)
                            (QAREF1 (QVELT |r| 2) |k|))))
               (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (QSETAREF1 (QVELT |r| 2) |i| |x|) (EXIT |r|))))) 

(DEFUN |IFARRAY;insert!;2$I$;27| (|a| |b| |i1| $)
  (PROG (|k| |n| |m| |i|)
    (RETURN
     (SEQ (LETT |i| (- |i1| (QREFELT $ 7)) . #1=(|IFARRAY;insert!;2$I$;27|))
          (COND
           ((SPADCALL |a| |b| (QREFELT $ 40))
            (LETT |b| (SPADCALL |b| (QREFELT $ 32)) . #1#)))
          (LETT |m| (SPADCALL |a| (QREFELT $ 15)) . #1#)
          (LETT |n| (SPADCALL |b| (QREFELT $ 15)) . #1#)
          (COND
           ((OR (< |i| 0) (SPADCALL |i| |n| (QREFELT $ 28)))
            (EXIT (|error| "index out of range"))))
          (|IFARRAY;growAdding| |b| |m| |a| $)
          (SEQ (LETT |k| (- |n| 1) . #1#) G190 (COND ((< |k| |i|) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |b| 2) (+ |m| |k|)
                            (QAREF1 (QVELT |b| 2) |k|))))
               (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (- |m| 1) . #1#) G190 (COND ((< |k| 0) (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 (QVELT |b| 2) (+ |i| |k|)
                            (QAREF1 (QVELT |a| 2) |k|))))
               (LETT |k| (+ |k| -1) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |b|))))) 

(DEFUN |IFARRAY;merge!;M3$;28| (|g| |a| |b| $)
  (PROG (|k| #1=#:G260 |j| |i| |n| |m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |a| (QREFELT $ 15)) . #2=(|IFARRAY;merge!;M3$;28|))
      (LETT |n| (SPADCALL |b| (QREFELT $ 15)) . #2#)
      (|IFARRAY;growAdding| |a| |n| |b| $)
      (SEQ (LETT |j| (- (+ |m| |n|) 1) . #2#) (LETT |i| (- |m| 1) . #2#) G190
           (COND ((< |i| 0) (GO G191)))
           (SEQ
            (EXIT (QSETAREF1 (QVELT |a| 2) |j| (QAREF1 (QVELT |a| 2) |i|))))
           (LETT |i| (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (LETT |i| |n| . #2#) (LETT |j| 0 . #2#)
      (SEQ (LETT |k| 0 . #2#) G190
           (COND
            ((NULL (COND ((< |i| (+ |n| |m|)) (< |j| |n|)) ('T 'NIL)))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (QAREF1 (QVELT |a| 2) |i|) (QAREF1 (QVELT |b| 2) |j|)
                         |g|)
               (SEQ (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |a| 2) |i|))
                    (EXIT (LETT |i| (+ |i| 1) . #2#))))
              ('T
               (SEQ (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |b| 2) |j|))
                    (EXIT (LETT |j| (+ |j| 1) . #2#)))))))
           (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |j| |j| . #2#) (LETT #1# (- |n| 1) . #2#) (LETT |k| |k| . #2#)
           G190 (COND ((> |j| #1#) (GO G191)))
           (SEQ
            (EXIT (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |b| 2) |j|))))
           (LETT |k| (PROG1 (+ |k| 1) (LETT |j| (+ |j| 1) . #2#)) . #2#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |a|))))) 

(DEFUN |IFARRAY;select!;M2$;29| (|g| |a| $)
  (PROG (|k| #1=#:G267 |i|)
    (RETURN
     (SEQ (LETT |k| 0 . #2=(|IFARRAY;select!;M2$;29|))
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (- (SPADCALL |a| (QREFELT $ 19)) (QREFELT $ 7)) . #2#)
               G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (QAREF1 (QVELT |a| 2) |i|) |g|)
                   (SEQ
                    (QSETAREF1 (QVELT |a| 2) |k| (QAREF1 (QVELT |a| 2) |i|))
                    (EXIT (LETT |k| (+ |k| 1) . #2#)))))))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|IFARRAY;shrink| |a| (- (SPADCALL |a| (QREFELT $ 15)) |k|) $)))))) 

(DEFUN |IFARRAY;removeDuplicates!;2$;30| (|a| $)
  (PROG (|i| |nlim| |j| #1=#:G276 |k| |nlim0| |ct|)
    (RETURN
     (SEQ
      (LETT |ct| (SPADCALL |a| (QREFELT $ 15))
            . #2=(|IFARRAY;removeDuplicates!;2$;30|))
      (EXIT
       (COND ((< |ct| 2) |a|)
             (#3='T
              (SEQ (LETT |i| (QREFELT $ 7) . #2#)
                   (LETT |nlim| (+ (QREFELT $ 7) |ct|) . #2#)
                   (LETT |nlim0| |nlim| . #2#)
                   (SEQ G190 (COND ((NULL (< |i| |nlim|)) (GO G191)))
                        (SEQ (LETT |j| (+ |i| 1) . #2#)
                             (SEQ (LETT |k| |j| . #2#)
                                  (LETT #1# (- |nlim| 1) . #2#) G190
                                  (COND ((> |k| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |a| |k| (QREFELT $ 33))
                                       (SPADCALL |a| |i| (QREFELT $ 33))
                                       (QREFELT $ 53))
                                      (SEQ
                                       (SPADCALL |a| |j|
                                                 (SPADCALL |a| |k|
                                                           (QREFELT $ 33))
                                                 (QREFELT $ 26))
                                       (EXIT (LETT |j| (+ |j| 1) . #2#)))))))
                                  (LETT |k| (+ |k| 1) . #2#) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |nlim| |j| . #2#)
                             (EXIT (LETT |i| (+ |i| 1) . #2#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND
                     ((SPADCALL |nlim| |nlim0| (QREFELT $ 54))
                      (SPADCALL |a| (SPADCALL |i| (QREFELT $ 55))
                                (QREFELT $ 50)))
                     (#3# |a|))))))))))) 

(DEFUN |IFARRAY;removeRepeats!;2$;31| (|a| $)
  (PROG (|i| |t| |j| |s| |nlim| |ct|)
    (RETURN
     (SEQ
      (LETT |ct| (SPADCALL |a| (QREFELT $ 15))
            . #1=(|IFARRAY;removeRepeats!;2$;31|))
      (EXIT
       (COND ((< |ct| 2) |a|)
             (#2='T
              (SEQ (LETT |j| (QREFELT $ 7) . #1#)
                   (LETT |nlim| (+ (QREFELT $ 7) |ct|) . #1#)
                   (LETT |t| (SPADCALL |a| |j| (QREFELT $ 33)) . #1#)
                   (LETT |i| (+ |j| 1) . #1#)
                   (SEQ G190 (COND ((NULL (< |i| |nlim|)) (GO G191)))
                        (SEQ (LETT |s| (SPADCALL |a| |i| (QREFELT $ 33)) . #1#)
                             (COND
                              ((SPADCALL |s| |t| (QREFELT $ 53))
                               (SEQ (LETT |j| (+ |j| 1) . #1#)
                                    (EXIT
                                     (SPADCALL |a| |j| (LETT |t| |s| . #1#)
                                               (QREFELT $ 26))))))
                             (EXIT (LETT |i| (+ |i| 1) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND
                     ((< (+ |j| 1) |nlim|)
                      (SPADCALL |a| (SPADCALL (+ |j| 1) (QREFELT $ 55))
                                (QREFELT $ 50)))
                     (#2# |a|))))))))))) 

(DEFUN |IndexedFlexibleArray| (&REST #1=#:G294)
  (PROG ()
    (RETURN
     (PROG (#2=#:G295)
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
              (HREM |$ConstructorCache| '|IndexedFlexibleArray|))))))))))) 

(DEFUN |IndexedFlexibleArray;| (|#1| |#2|)
  (PROG (#1=#:G293 |pv$| #2=#:G289 #3=#:G290 #4=#:G291 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #5=(|IndexedFlexibleArray|))
      (LETT DV$2 (|devaluate| |#2|) . #5#)
      (LETT |dv$| (LIST '|IndexedFlexibleArray| DV$1 DV$2) . #5#)
      (LETT $ (GETREFV 71) . #5#)
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
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
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
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 16384))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 32768))
      (AND (OR (AND #3# #1#) #4#) (|augmentPredVector| $ 65536))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|Record| (|:| |physLen| (|Integer|))
                          (|:| |logLen| (|Integer|))
                          (|:| |f| (|PrimitiveArray| |#1|))))
      (QSETREFV $ 9 'T)
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV $ 56
                   (CONS (|dispatchFunction| |IFARRAY;removeDuplicates!;2$;30|)
                         $))
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |IFARRAY;removeRepeats!;2$;31|)
                         $)))))
      $)))) 

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
              |IFARRAY;setelt;$I2S;18| |IFARRAY;flexibleArray;L$;10| (12 . >)
              (18 . <=) (|PositiveInteger|) (24 . *) |IFARRAY;copy;2$;16|
              |IFARRAY;elt;$IS;17| (|Mapping| 22 6 6) |IFARRAY;merge!;M3$;28|
              |IFARRAY;merge;M3$;19| |IFARRAY;insert!;S$I$;26|
              |IFARRAY;concat;S2$;20| |IFARRAY;concat!;$S$;21| (30 . |eq?|)
              (36 . |copyInto!|) |IFARRAY;concat!;3$;22| (|Mapping| 22 6)
              |IFARRAY;remove!;M2$;23| |IFARRAY;delete!;$I$;24|
              (|UniversalSegment| 12) (43 . |lo|) (48 . |hasHi|) (53 . |hi|)
              |IFARRAY;delete!;$Us$;25| |IFARRAY;insert!;2$I$;27|
              |IFARRAY;select!;M2$;29| (58 . ~=) (64 . ~=) (70 . SEGMENT)
              (75 . |removeDuplicates!|) (80 . |removeRepeats!|)
              (|Mapping| 6 6 6) (|Equation| 6) (|List| 59) (|Void|)
              (|Mapping| 6 6) (|OutputForm|) (|InputForm|) (|SingleInteger|)
              (|String|) (|HashState|) (|List| $) (|Union| 6 '"failed")
              (|List| 12))
           '#(~= 85 |swap!| 91 |sorted?| 98 |sort!| 109 |sort| 120 |smaller?|
              131 |size?| 137 |shrinkable| 143 |setelt| 148 |select!| 162
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
                 (|Eltable| 12 6) (|InnerEvalable| 6 6) (|ConvertibleTo| 64)
                 (|BasicType|) (|CoercibleTo| 63) (|PartialOrder|))
              (|makeByteWordVec2| 70
                                  '(2 16 0 0 6 17 2 24 6 0 12 25 2 12 22 0 0 28
                                    2 12 22 0 0 29 2 12 0 30 0 31 2 0 22 0 0 40
                                    3 0 0 0 0 12 41 1 46 12 0 47 1 46 22 0 48 1
                                    46 12 0 49 2 6 22 0 0 53 2 12 22 0 0 54 1
                                    46 0 12 55 1 0 0 0 56 1 0 0 0 57 2 17 22 0
                                    0 1 3 15 61 0 12 12 1 1 2 22 0 1 2 0 22 34
                                    0 1 1 16 0 0 1 2 15 0 34 0 1 1 2 0 0 1 2 0
                                    0 34 0 1 2 2 22 0 0 1 2 0 22 0 10 1 1 0 22
                                    22 23 3 15 6 0 46 6 1 3 15 6 0 12 6 26 2 0
                                    0 43 0 52 2 12 0 43 0 1 0 0 0 1 1 15 0 0 1
                                    1 0 0 0 1 1 0 0 0 57 1 3 0 0 56 1 14 0 0 1
                                    2 3 0 6 0 1 2 0 0 43 0 44 2 14 0 6 0 1 2 12
                                    0 43 0 1 4 14 6 58 0 6 6 1 3 12 6 58 0 6 1
                                    2 12 6 58 0 1 3 15 6 0 12 6 1 2 0 6 0 12 1
                                    3 8 12 6 0 12 1 2 8 12 6 0 1 2 0 12 43 0 1
                                    2 0 0 0 12 13 1 0 10 0 11 1 12 24 0 1 2 0 0
                                    10 6 21 2 0 22 0 10 1 1 7 12 0 20 2 2 0 0 0
                                    1 2 2 0 0 0 1 3 0 0 34 0 0 35 2 2 0 0 0 1 3
                                    0 0 34 0 0 36 1 12 24 0 1 2 14 22 6 0 1 1 7
                                    12 0 19 2 2 0 0 0 1 2 15 0 62 0 1 3 0 0 58
                                    0 0 1 2 0 0 62 0 1 2 0 22 0 10 1 1 3 66 0 1
                                    3 0 0 0 0 12 51 3 0 0 6 0 12 37 3 0 0 6 0
                                    12 1 3 0 0 0 0 12 1 1 0 70 0 1 2 0 22 12 0
                                    1 2 3 67 67 0 1 1 3 65 0 1 1 0 0 24 27 1 7
                                    6 0 1 2 0 69 43 0 1 2 15 0 0 6 18 2 12 22
                                    43 0 1 3 5 0 0 6 6 1 3 5 0 0 24 24 1 2 5 0
                                    0 59 1 2 5 0 0 60 1 2 0 22 0 0 40 2 13 22 6
                                    0 1 1 0 24 0 1 1 0 22 0 1 0 0 0 14 2 0 0 0
                                    46 1 2 0 6 0 12 33 3 0 6 0 12 6 1 2 0 0 0
                                    46 50 2 0 0 0 12 45 2 0 0 0 12 1 2 0 0 0 46
                                    1 2 14 10 6 0 1 2 12 10 43 0 1 3 15 0 0 0
                                    12 41 1 0 0 0 32 1 1 64 0 1 1 0 0 24 1 2 0
                                    0 0 6 39 2 0 0 0 0 42 1 0 0 68 1 2 0 0 6 0
                                    38 2 0 0 0 0 1 2 0 0 0 6 1 1 10 63 0 1 2 12
                                    22 43 0 1 2 2 22 0 0 1 2 2 22 0 0 1 2 17 22
                                    0 0 1 2 2 22 0 0 1 2 2 22 0 0 1 1 12 10 0
                                    15)))))
           '|lookupComplete|)) 
