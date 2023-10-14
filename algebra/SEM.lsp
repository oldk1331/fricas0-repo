
(/VERSIONCHECK 2) 

(DEFUN |SEM;greater| (|r1| |r2| $)
  (COND ((NULL (QCAR |r1|)) 'NIL) ((NULL (QCAR |r2|)) 'T)
        ('T
         (SPADCALL (|SPADfirst| (QCAR |r2|)) (|SPADfirst| (QCAR |r1|))
                   (QREFELT $ 19))))) 

(PUT '|SEM;ncols;$Nni;2| '|SPADreplace| '(XLAM (A) (QVELT A 0))) 

(DEFUN |SEM;ncols;$Nni;2| (A $) (QVELT A 0)) 

(PUT '|SEM;nrows;$Nni;3| '|SPADreplace| '(XLAM (A) (QVELT A 1))) 

(DEFUN |SEM;nrows;$Nni;3| (A $) (QVELT A 1)) 

(DEFUN |SEM;allIndices;$L;4| (A $) (SPADCALL (QVELT A 2) (QREFELT $ 25))) 

(DEFUN |SEM;row;$IR;5| (A |i| $) (QAREF1O (QVELT A 3) |i| 1)) 

(DEFUN |SEM;setRow!;$IRV;6| (A |i| |r| $)
  (SEQ (QSETAREF1O (QVELT A 3) |i| |r| 1) (EXIT (SPADCALL (QREFELT $ 30))))) 

(DEFUN |SEM;setRow!;$ILLV;7| (A |i| |inds| |ents| $)
  (SEQ (QSETAREF1O (QVELT A 3) |i| (CONS |inds| |ents|) 1)
       (EXIT (SPADCALL (QREFELT $ 30))))) 

(DEFUN |SEM;new;LI$;8| (|inds| |n| $)
  (PROG (#1=#:G191 |i| #2=#:G192 #3=#:G188)
    (RETURN
     (SEQ
      (VECTOR (LENGTH |inds|)
              (PROG1 (LETT #3# |n| . #4=(|SEM;new;LI$;8|))
                (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
              |inds|
              (PROGN
               (LETT #2# (GETREFV |n|) . #4#)
               (SEQ (LETT |i| 1 . #4#) (LETT #1# 0 . #4#) G190
                    (COND ((|greater_SI| |i| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (SETELT #2# #1#
                              (CONS (CAR (QREFELT $ 14))
                                    (CDR (QREFELT $ 14))))))
                    (LETT #1#
                          (PROG1 (|inc_SI| #1#)
                            (LETT |i| (|inc_SI| |i|) . #4#))
                          . #4#)
                    (GO G190) G191 (EXIT NIL))
               #2#)))))) 

(DEFUN |SEM;elt;$ICD;9| (A |i| |c| $)
  (PROG (|pos| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) . #1=(|SEM;elt;$ICD;9|))
          (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT $ 35)) . #1#)
          (EXIT
           (COND ((< |pos| (QREFELT $ 11)) (|spadConstant| $ 36))
                 ('T (SPADCALL (QCDR |r|) |pos| (QREFELT $ 37))))))))) 

(DEFUN |SEM;setelt!;$ICDV;10| (A |i| |c| |d| $)
  (PROG (|j| #1=#:G200 |ind| |pos| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) . #2=(|SEM;setelt!;$ICDV;10|))
      (LETT |pos| (SPADCALL |c| (QCAR |r|) (QREFELT $ 35)) . #2#)
      (COND
       ((>= |pos| (QREFELT $ 11))
        (SPADCALL (QCDR |r|) |pos| |d| (QREFELT $ 39)))
       ('T
        (SEQ (LETT |j| (QREFELT $ 11) . #2#)
             (SEQ (LETT |ind| NIL . #2#) (LETT #1# (QCAR |r|) . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #2#) NIL)
                        (NULL (SPADCALL |c| |ind| (QREFELT $ 19))))
                    (GO G191)))
                  (SEQ (EXIT (LETT |j| (+ |j| 1) . #2#)))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (PROGN
              (RPLACA |r| (SPADCALL |c| (QCAR |r|) |j| (QREFELT $ 40)))
              (QCAR |r|))
             (EXIT
              (PROGN
               (RPLACD |r| (SPADCALL |d| (QCDR |r|) |j| (QREFELT $ 41)))
               (QCDR |r|))))))
      (QSETAREF1O (QVELT A 3) |i| |r| 1) (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;coerce;$M;11| (A $)
  (PROG (|ents| |inds| #1=#:G212 |ind| |j| #2=#:G211 |r| |i| AA)
    (RETURN
     (SEQ
      (COND
       ((ZEROP (QVELT A 0)) (|error| "cannot coerce matrix with zero columns"))
       ('T
        (SEQ
         (LETT AA (MAKE_MATRIX1 (QVELT A 1) (QVELT A 0) (|spadConstant| $ 36))
               . #3=(|SEM;coerce;$M;11|))
         (SEQ (LETT |i| 1 . #3#) (LETT |r| NIL . #3#)
              (LETT #2# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #3#) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                (GO G191)))
              (SEQ (LETT |inds| (QCAR |r|) . #3#)
                   (LETT |ents| (QCDR |r|) . #3#)
                   (EXIT
                    (SEQ (LETT |j| 1 . #3#) (LETT |ind| NIL . #3#)
                         (LETT #1# (QVELT A 2) . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |ind| (CAR #1#) . #3#) NIL)
                               (NULL (COND ((NULL |inds|) 'NIL) ('T 'T))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |ind| (|SPADfirst| |inds|)
                                       (QREFELT $ 46))
                             (SEQ
                              (QSETAREF2O AA |i| |j| (|SPADfirst| |ents|) 1 1)
                              (LETT |inds| (CDR |inds|) . #3#)
                              (EXIT (LETT |ents| (CDR |ents|) . #3#)))))))
                         (LETT #1#
                               (PROG1 (CDR #1#)
                                 (LETT |j| (|inc_SI| |j|) . #3#))
                               . #3#)
                         (GO G190) G191 (EXIT NIL))))
              (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                    . #3#)
              (GO G190) G191 (EXIT NIL))
         (EXIT AA)))))))) 

(DEFUN |SEM;coerce;$Of;12| (A $)
  (COND ((ZEROP (QVELT A 0)) (SPADCALL (|spadConstant| $ 36) (QREFELT $ 50)))
        ('T (SPADCALL (SPADCALL A (QREFELT $ 48)) (QREFELT $ 51))))) 

(DEFUN |SEM;copy;2$;13| (A $)
  (PROG (|r| #1=#:G220 |l| |resRows|)
    (RETURN
     (SEQ
      (LETT |resRows| (MAKEARR1 (QVELT A 1) (QREFELT $ 14))
            . #2=(|SEM;copy;2$;13|))
      (SEQ (LETT |l| 1 . #2#) (LETT #1# (QVELT A 1) . #2#) G190
           (COND ((|greater_SI| |l| #1#) (GO G191)))
           (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #2#)
                (EXIT
                 (QSETAREF1O |resRows| |l|
                             (CONS (SPADCALL (QCAR |r|) (QREFELT $ 25))
                                   (SPADCALL (QCDR |r|) (QREFELT $ 53)))
                             1)))
           (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT
       (VECTOR (QVELT A 0) (QVELT A 1) (SPADCALL (QVELT A 2) (QREFELT $ 25))
               |resRows|)))))) 

(DEFUN |SEM;elimZeroCols!;$V;14| (A $)
  (PROG (|newInds| #1=#:G225 |r|)
    (RETURN
     (SEQ (LETT |newInds| NIL . #2=(|SEM;elimZeroCols!;$V;14|))
          (SEQ (LETT |r| NIL . #2#)
               (LETT #1# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |newInds|
                       (SPADCALL
                        (SPADCALL (CONS #'|SEM;elimZeroCols!;$V;14!0| $)
                                  |newInds| (QCAR |r|) (QREFELT $ 56))
                        (QREFELT $ 57))
                       . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT A 2 |newInds|) (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;elimZeroCols!;$V;14!0| (|x| |y| $)
  (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;purge!;$MV;15| (A |crit| $)
  (PROG (|newEnts| |newInds| #1=#:G241 |c| #2=#:G242 |e| |r| #3=#:G240 |l|
         #4=#:G239)
    (RETURN
     (SEQ (LETT |newInds| NIL . #5=(|SEM;purge!;$MV;15|))
          (SEQ (LETT |c| NIL . #5#) (LETT #4# (QVELT A 2) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |c| |crit|))
                   (LETT |newInds| (CONS |c| |newInds|) . #5#)))))
               (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
          (LETT |newInds| (NREVERSE |newInds|) . #5#)
          (COND
           ((SPADCALL (LENGTH |newInds|) (LENGTH (QVELT A 2)) (QREFELT $ 59))
            (SEQ (QSETVELT A 2 |newInds|)
                 (EXIT
                  (SEQ (LETT |l| 1 . #5#) (LETT #3# (QVELT A 1) . #5#) G190
                       (COND ((|greater_SI| |l| #3#) (GO G191)))
                       (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #5#)
                            (LETT |newInds| NIL . #5#)
                            (LETT |newEnts| NIL . #5#)
                            (SEQ (LETT |e| NIL . #5#)
                                 (LETT #2# (QCDR |r|) . #5#)
                                 (LETT |c| NIL . #5#)
                                 (LETT #1# (QCAR |r|) . #5#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |c| (CAR #1#) . #5#) NIL)
                                       (ATOM #2#)
                                       (PROGN (LETT |e| (CAR #2#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |c| |crit|))
                                     (SEQ
                                      (LETT |newInds| (CONS |c| |newInds|)
                                            . #5#)
                                      (EXIT
                                       (LETT |newEnts| (CONS |e| |newEnts|)
                                             . #5#)))))))
                                 (LETT #1#
                                       (PROG1 (CDR #1#)
                                         (LETT #2# (CDR #2#) . #5#))
                                       . #5#)
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (QSETAREF1O (QVELT A 3) |l|
                                         (CONS (NREVERSE |newInds|)
                                               (NREVERSE |newEnts|))
                                         1)))
                       (LETT |l| (|inc_SI| |l|) . #5#) (GO G190) G191
                       (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;sortedPurge!;$MV;16| (A |crit| $)
  (PROG (|r| #1=#:G255 |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (|SPADfirst| (QVELT A 2)) |crit|)
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND ((NULL (QVELT A 2)) 'NIL)
                       ('T (SPADCALL (|SPADfirst| (QVELT A 2)) |crit|))))
                (GO G191)))
              (SEQ (EXIT (QSETVELT A 2 (CDR (QVELT A 2))))) NIL (GO G190) G191
              (EXIT NIL))
         (EXIT
          (SEQ (LETT |l| 1 . #2=(|SEM;sortedPurge!;$MV;16|))
               (LETT #1# (QVELT A 1) . #2#) G190
               (COND ((|greater_SI| |l| #1#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |l| 1) . #2#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL (QCAR |r|)) 'NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| (QCAR |r|))
                                             |crit|))))
                           (GO G191)))
                         (SEQ (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT
                               (PROGN
                                (RPLACD |r| (CDR (QCDR |r|)))
                                (QCDR |r|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (QSETAREF1O (QVELT A 3) |l| |r| 1)))
               (LETT |l| (|inc_SI| |l|) . #2#) (GO G190) G191 (EXIT NIL))))))
      (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;deleteRow!;$IV;17| (A |i| $)
  (PROG (#1=#:G265 |l| #2=#:G264 |resRows| |nr| #3=#:G256)
    (RETURN
     (SEQ
      (COND ((SPADCALL |i| (QVELT A 1) (QREFELT $ 63)) A)
            ('T
             (SEQ
              (LETT |nr|
                    (PROG1
                        (LETT #3# (- (QVELT A 1) 1)
                              . #4=(|SEM;deleteRow!;$IV;17|))
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #4#)
              (LETT |resRows| (MAKEARR1 |nr| (QREFELT $ 14)) . #4#)
              (SEQ (LETT |l| 1 . #4#) (LETT #2# (- |i| 1) . #4#) G190
                   (COND ((|greater_SI| |l| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1O |resRows| |l| (QAREF1O (QVELT A 3) |l| 1) 1)))
                   (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |l| (+ |i| 1) . #4#) (LETT #1# (QVELT A 1) . #4#) G190
                   (COND ((> |l| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1O |resRows| (- |l| 1)
                                 (QAREF1O (QVELT A 3) |l| 1) 1)))
                   (LETT |l| (+ |l| 1) . #4#) (GO G190) G191 (EXIT NIL))
              (QSETVELT A 1 |nr|) (QSETVELT A 3 |resRows|)
              (EXIT (SPADCALL (QREFELT $ 30)))))))))) 

(DEFUN |SEM;consRow!;$RV;18| (A |r| $)
  (PROG (|newInds| |newRows|)
    (RETURN
     (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
          (LETT |newRows| (CONS |r| (SPADCALL (QVELT A 3) (QREFELT $ 45)))
                . #1=(|SEM;consRow!;$RV;18|))
          (QSETVELT A 3 (SPADCALL |newRows| (QREFELT $ 65)))
          (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT $ 66))
                . #1#)
          (COND
           ((NULL (NULL |newInds|))
            (QSETVELT A 2
                      (SPADCALL (CONS #'|SEM;consRow!;$RV;18!0| $) (QVELT A 2)
                                (SPADCALL (CONS #'|SEM;consRow!;$RV;18!1| $)
                                          |newInds| (QREFELT $ 67))
                                (QREFELT $ 68)))))
          (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;consRow!;$RV;18!1| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;consRow!;$RV;18!0| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;appendRow!;$RV;19| (A |r| $)
  (PROG (|newInds| |newRows|)
    (RETURN
     (SEQ (QSETVELT A 1 (+ (QVELT A 1) 1))
          (LETT |newRows|
                (SPADCALL (SPADCALL (QVELT A 3) (QREFELT $ 45)) |r|
                          (QREFELT $ 70))
                . #1=(|SEM;appendRow!;$RV;19|))
          (QSETVELT A 3 (SPADCALL |newRows| (QREFELT $ 65)))
          (LETT |newInds| (SPADCALL (QCAR |r|) (QVELT A 2) (QREFELT $ 66))
                . #1#)
          (COND
           ((NULL (NULL |newInds|))
            (QSETVELT A 2
                      (SPADCALL (CONS #'|SEM;appendRow!;$RV;19!0| $)
                                (QVELT A 2)
                                (SPADCALL (CONS #'|SEM;appendRow!;$RV;19!1| $)
                                          |newInds| (QREFELT $ 67))
                                (QREFELT $ 68)))))
          (EXIT (SPADCALL (QREFELT $ 30))))))) 

(DEFUN |SEM;appendRow!;$RV;19!1| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;appendRow!;$RV;19!0| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;extract;$2I$;20| (A |i1| |i2| $)
  (PROG (|newInds| |i| |resRows| |nr| #1=#:G276)
    (RETURN
     (SEQ
      (LETT |nr|
            (PROG1 (LETT #1# (+ (- |i2| |i1|) 1) . #2=(|SEM;extract;$2I$;20|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |resRows| (MAKEARR1 |nr| (QREFELT $ 14)) . #2#)
      (LETT |newInds| NIL . #2#)
      (SEQ (LETT |i| |i1| . #2#) G190 (COND ((> |i| |i2|) (GO G191)))
           (SEQ
            (QSETAREF1O |resRows| (+ (- |i| |i1|) 1)
                        (SPADCALL A |i| (QREFELT $ 28)) 1)
            (EXIT
             (LETT |newInds|
                   (SPADCALL
                    (SPADCALL (CONS #'|SEM;extract;$2I$;20!0| $) |newInds|
                              (QCAR (SPADCALL A |i| (QREFELT $ 28)))
                              (QREFELT $ 68))
                    (QREFELT $ 57))
                   . #2#)))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR (QVELT A 0) |nr| |newInds| |resRows|)))))) 

(DEFUN |SEM;extract;$2I$;20!0| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;join;3$;21| (A1 A2 $)
  (PROG (#1=#:G296 |l| #2=#:G295 |newRows| |newNRows| |newInds|)
    (RETURN
     (SEQ
      (LETT |newInds|
            (SPADCALL
             (SPADCALL (CONS #'|SEM;join;3$;21!0| $) (QVELT A1 2) (QVELT A2 2)
                       (QREFELT $ 68))
             (QREFELT $ 57))
            . #3=(|SEM;join;3$;21|))
      (LETT |newNRows| (+ (QVELT A1 1) (QVELT A2 1)) . #3#)
      (LETT |newRows| (MAKEARR1 |newNRows| (QREFELT $ 14)) . #3#)
      (SEQ (LETT |l| 1 . #3#) (LETT #2# (QVELT A1 1) . #3#) G190
           (COND ((|greater_SI| |l| #2#) (GO G191)))
           (SEQ
            (EXIT (QSETAREF1O |newRows| |l| (QAREF1O (QVELT A1 3) |l| 1) 1)))
           (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |l| 1 . #3#) (LETT #1# (QVELT A2 1) . #3#) G190
           (COND ((|greater_SI| |l| #1#) (GO G191)))
           (SEQ
            (EXIT
             (QSETAREF1O |newRows| (+ (QVELT A1 1) |l|)
                         (QAREF1O (QVELT A2 3) |l| 1) 1)))
           (LETT |l| (|inc_SI| |l|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR (LENGTH |newInds|) |newNRows| |newInds| |newRows|)))))) 

(DEFUN |SEM;join;3$;21!0| (|x| |y| $) (SPADCALL |y| |x| (QREFELT $ 19))) 

(DEFUN |SEM;horizJoin;3$;22| (A1 A2 $)
  (PROG (|r2| |r1| #1=#:G302 |i| |res| |newInds|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QVELT A1 1) (QVELT A2 1) (QREFELT $ 59))
        (|error| "incompatible dimensions in horizJoin"))
       ('T
        (SEQ
         (LETT |newInds| (APPEND (QVELT A1 2) (QVELT A2 2))
               . #2=(|SEM;horizJoin;3$;22|))
         (LETT |res| (SPADCALL |newInds| (QVELT A1 1) (QREFELT $ 34)) . #2#)
         (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVELT A1 1) . #2#) G190
              (COND ((|greater_SI| |i| #1#) (GO G191)))
              (SEQ (LETT |r1| (SPADCALL A1 |i| (QREFELT $ 28)) . #2#)
                   (LETT |r2| (SPADCALL A2 |i| (QREFELT $ 28)) . #2#)
                   (EXIT
                    (SPADCALL |res| |i| (APPEND (QCAR |r1|) (QCAR |r2|))
                              (APPEND (QCDR |r1|) (QCDR |r2|))
                              (QREFELT $ 33))))
              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |SEM;horizSplit;$CR;23| (A |c| $)
  (PROG (|le| |li| |re| |ri| |r| #1=#:G319 |i| RA LA |linds| |rinds|)
    (RETURN
     (SEQ
      (LETT |rinds| (SPADCALL A (QREFELT $ 26)) . #2=(|SEM;horizSplit;$CR;23|))
      (LETT |linds| NIL . #2#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((NULL |rinds|) 'NIL)
                    ('T (SPADCALL (|SPADfirst| |rinds|) |c| (QREFELT $ 75)))))
             (GO G191)))
           (SEQ (LETT |linds| (CONS (|SPADfirst| |rinds|) |linds|) . #2#)
                (EXIT (LETT |rinds| (CDR |rinds|) . #2#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((NULL |linds|) (CONS (SPADCALL |linds| (QVELT A 1) (QREFELT $ 34)) A))
        (#3='T
         (SEQ (LETT |linds| (NREVERSE |linds|) . #2#)
              (EXIT
               (COND
                ((NULL |rinds|)
                 (CONS A (SPADCALL |rinds| (QVELT A 1) (QREFELT $ 34))))
                (#3#
                 (SEQ
                  (LETT LA (SPADCALL |linds| (QVELT A 1) (QREFELT $ 34)) . #2#)
                  (LETT RA (SPADCALL |rinds| (QVELT A 1) (QREFELT $ 34)) . #2#)
                  (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVELT A 1) . #2#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) . #2#)
                            (LETT |ri| (QCAR |r|) . #2#)
                            (LETT |re| (QCDR |r|) . #2#) (LETT |li| NIL . #2#)
                            (LETT |le| NIL . #2#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |ri|) 'NIL)
                                          ('T
                                           (SPADCALL (|SPADfirst| |ri|) |c|
                                                     (QREFELT $ 75)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |li| (CONS (|SPADfirst| |ri|) |li|)
                                        . #2#)
                                  (LETT |le| (CONS (|SPADfirst| |re|) |le|)
                                        . #2#)
                                  (LETT |ri| (CDR |ri|) . #2#)
                                  (EXIT (LETT |re| (CDR |re|) . #2#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((NULL (NULL |li|))
                              (SEQ (LETT |li| (NREVERSE |li|) . #2#)
                                   (LETT |le| (NREVERSE |le|) . #2#)
                                   (EXIT
                                    (SPADCALL LA |i| |li| |le|
                                              (QREFELT $ 33))))))
                            (EXIT
                             (COND
                              ((NULL (NULL |ri|))
                               (SPADCALL RA |i| |ri| |re| (QREFELT $ 33))))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (CONS LA RA)))))))))))))) 

(DEFUN |SEM;addRows| (|d1| |r1| |d2| |r2| $)
  (PROG (|resE| |resI| |lent2| |lind2| |sum| #1=#:G358 |c1| #2=#:G359 |e1|
         #3=#:G357 |e2| #4=#:G356 |lent1| #5=#:G355 #6=#:G354 #7=#:G353
         #8=#:G352 #9=#:G351 #10=#:G350)
    (RETURN
     (SEQ
      (COND
       ((NULL (QCAR |r1|))
        (COND ((SPADCALL |d2| (QREFELT $ 78)) |r2|)
              (#11='T
               (CONS (QCAR |r2|)
                     (PROGN
                      (LETT #10# NIL . #12=(|SEM;addRows|))
                      (SEQ (LETT |e2| NIL . #12#) (LETT #9# (QCDR |r2|) . #12#)
                           G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |e2| (CAR #9#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #10#
                                   (CONS (SPADCALL |d2| |e2| (QREFELT $ 79))
                                         #10#)
                                   . #12#)))
                           (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                           (EXIT (NREVERSE #10#))))))))
       ((NULL (QCAR |r2|))
        (COND ((SPADCALL |d1| (QREFELT $ 78)) |r1|)
              (#11#
               (CONS (QCAR |r1|)
                     (PROGN
                      (LETT #8# NIL . #12#)
                      (SEQ (LETT |e1| NIL . #12#) (LETT #7# (QCDR |r1|) . #12#)
                           G190
                           (COND
                            ((OR (ATOM #7#)
                                 (PROGN (LETT |e1| (CAR #7#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #8#
                                   (CONS (SPADCALL |d1| |e1| (QREFELT $ 79))
                                         #8#)
                                   . #12#)))
                           (LETT #7# (CDR #7#) . #12#) (GO G190) G191
                           (EXIT (NREVERSE #8#))))))))
       (#11#
        (SEQ (LETT |resI| NIL . #12#) (LETT |resE| NIL . #12#)
             (COND
              ((OR (QREFELT $ 15) (NULL (SPADCALL |d1| (QREFELT $ 78))))
               (LETT |lent1|
                     (PROGN
                      (LETT #6# NIL . #12#)
                      (SEQ (LETT |e1| NIL . #12#) (LETT #5# (QCDR |r1|) . #12#)
                           G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |e1| (CAR #5#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #6#
                                   (CONS (SPADCALL |d1| |e1| (QREFELT $ 79))
                                         #6#)
                                   . #12#)))
                           (LETT #5# (CDR #5#) . #12#) (GO G190) G191
                           (EXIT (NREVERSE #6#))))
                     . #12#))
              ('T (LETT |lent1| (QCDR |r1|) . #12#)))
             (COND
              ((OR (QREFELT $ 15) (NULL (SPADCALL |d2| (QREFELT $ 78))))
               (LETT |lent2|
                     (PROGN
                      (LETT #4# NIL . #12#)
                      (SEQ (LETT |e2| NIL . #12#) (LETT #3# (QCDR |r2|) . #12#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |e2| (CAR #3#) . #12#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS (SPADCALL |d2| |e2| (QREFELT $ 79))
                                         #4#)
                                   . #12#)))
                           (LETT #3# (CDR #3#) . #12#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #12#))
              ('T (LETT |lent2| (SPADCALL (QCDR |r2|) (QREFELT $ 53)) . #12#)))
             (LETT |lind2| (SPADCALL (QCAR |r2|) (QREFELT $ 25)) . #12#)
             (SEQ (LETT |e1| NIL . #12#) (LETT #2# |lent1| . #12#)
                  (LETT |c1| NIL . #12#) (LETT #1# (QCAR |r1|) . #12#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #12#) NIL)
                        (ATOM #2#) (PROGN (LETT |e1| (CAR #2#) . #12#) NIL))
                    (GO G191)))
                  (SEQ
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((NULL |lind2|) 'NIL)
                                 ('T
                                  (SPADCALL |c1| (|SPADfirst| |lind2|)
                                            (QREFELT $ 19)))))
                          (GO G191)))
                        (SEQ
                         (LETT |resI| (CONS (|SPADfirst| |lind2|) |resI|)
                               . #12#)
                         (LETT |resE| (CONS (|SPADfirst| |lent2|) |resE|)
                               . #12#)
                         (LETT |lind2| (CDR |lind2|) . #12#)
                         (EXIT (LETT |lent2| (CDR |lent2|) . #12#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND
                     ((OR (NULL |lind2|)
                          (NULL
                           (SPADCALL (|SPADfirst| |lind2|) |c1|
                                     (QREFELT $ 46))))
                      (SEQ (LETT |resI| (CONS |c1| |resI|) . #12#)
                           (EXIT (LETT |resE| (CONS |e1| |resE|) . #12#))))
                     ('T
                      (SEQ
                       (LETT |sum|
                             (SPADCALL |e1| (|SPADfirst| |lent2|)
                                       (QREFELT $ 80))
                             . #12#)
                       (COND
                        ((OR (QREFELT $ 15)
                             (NULL (SPADCALL |sum| (QREFELT $ 81))))
                         (SEQ (LETT |resI| (CONS |c1| |resI|) . #12#)
                              (EXIT
                               (LETT |resE| (CONS |sum| |resE|) . #12#)))))
                       (LETT |lind2| (CDR |lind2|) . #12#)
                       (EXIT (LETT |lent2| (CDR |lent2|) . #12#)))))))
                  (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #12#))
                        . #12#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |resI| (SPADCALL (NREVERSE |resI|) |lind2| (QREFELT $ 82))
                   . #12#)
             (LETT |resE| (SPADCALL (NREVERSE |resE|) |lent2| (QREFELT $ 83))
                   . #12#)
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |resE|) 'NIL)
                           ('T
                            (SPADCALL (|SPADfirst| |resE|) (QREFELT $ 81)))))
                    (GO G191)))
                  (SEQ (LETT |resI| (CDR |resI|) . #12#)
                       (EXIT (LETT |resE| (CDR |resE|) . #12#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (CONS |resI| |resE|))))))))) 

(DEFUN |SEM;pivot;$IR;25| (A |i| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL A |i| (QREFELT $ 28)) |SEM;pivot;$IR;25|)
          (EXIT
           (COND ((NULL (QCAR |r|)) (|error| "empty row"))
                 ('T
                  (CONS (|SPADfirst| (QCAR |r|))
                        (|SPADfirst| (QCDR |r|)))))))))) 

(DEFUN |SEM;pivots;$R;26| (A $)
  (PROG (|resE| |resI| #1=#:G369 |r|)
    (RETURN
     (SEQ (LETT |resI| NIL . #2=(|SEM;pivots;$R;26|)) (LETT |resE| NIL . #2#)
          (SEQ (LETT |r| NIL . #2#)
               (LETT #1# (SPADCALL (QVELT A 3) (QREFELT $ 45)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND ((NULL (QCAR |r|)) 'NIL) ('T 'T))
                   (SEQ
                    (LETT |resI| (CONS (|SPADfirst| (QCAR |r|)) |resI|) . #2#)
                    (EXIT
                     (LETT |resE| (CONS (|SPADfirst| (QCDR |r|)) |resE|)
                           . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS (NREVERSE |resI|) (NREVERSE |resE|))))))) 

(DEFUN |SEM;rowEchelon;$R;27| (AA $)
  (PROG (|rk| #1=#:G425 |l| #2=#:G424 |f| #3=#:G423 |r| |c| #4=#:G422 |j| |pr|
         |Pivs| |piv| |pivrow| |pivlen| |k| |len| #5=#:G421 |pivind| #6=#:G385
         |finished?| #7=#:G419 |i| #8=#:G420 |oldr| |sorted?| |newr| #9=#:G418
         #10=#:G417 |changed?| #11=#:G416 |LTr| #12=#:G413 #13=#:G415
         #14=#:G414 A)
    (RETURN
     (SEQ (LETT A (SPADCALL AA (QREFELT $ 54)) . #15=(|SEM;rowEchelon;$R;27|))
          (LETT |LTr|
                (SPADCALL
                 (PROGN
                  (LETT #14# (GETREFV #16=(QVELT A 1)) . #15#)
                  (SEQ (LETT |i| 1 . #15#) (LETT #13# #16# . #15#)
                       (LETT #12# 0 . #15#) G190
                       (COND ((|greater_SI| |i| #13#) (GO G191)))
                       (SEQ (EXIT (SETELT #14# #12# (|spadConstant| $ 12))))
                       (LETT #12#
                             (PROG1 (|inc_SI| #12#)
                               (LETT |i| (|inc_SI| |i|) . #15#))
                             . #15#)
                       (GO G190) G191 (EXIT NIL))
                  #14#)
                 (QREFELT $ 88))
                . #15#)
          (LETT |Pivs| NIL . #15#)
          (SEQ (LETT |i| 1 . #15#) (LETT #11# (QVELT A 1) . #15#) G190
               (COND ((|greater_SI| |i| #11#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #15#)
                    (LETT |changed?| 'NIL . #15#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL (QCDR |r|)) 'NIL)
                                  ('T
                                   (SPADCALL (|SPADfirst| (QCDR |r|))
                                             (QREFELT $ 81)))))
                           (GO G191)))
                         (SEQ (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                              (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                              (EXIT (LETT |changed?| 'T . #15#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
               (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
          (LETT |sorted?| 'NIL . #15#)
          (SEQ (LETT #10# NIL . #15#) G190 (COND (#10# (GO G191)))
               (SEQ (LETT |sorted?| 'T . #15#)
                    (LETT |oldr| (QAREF1O (QVELT A 3) 1 1) . #15#)
                    (EXIT
                     (SEQ (LETT |i| 2 . #15#) (LETT #9# (QVELT A 1) . #15#)
                          G190 (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1) . #15#)
                               (EXIT
                                (COND
                                 ((|SEM;greater| |newr| |oldr| $)
                                  (SEQ (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                       (QSETAREF1O (QVELT A 3) (- |i| 1) |newr|
                                                   1)
                                       (SPADCALL |LTr| (- |i| 1) |i|
                                                 (QREFELT $ 89))
                                       (EXIT (LETT |sorted?| 'NIL . #15#))))
                                 ('T (LETT |oldr| |newr| . #15#)))))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #10# |sorted?| . #15#) (GO G190) G191 (EXIT NIL))
          (LETT |finished?| 'NIL . #15#)
          (SEQ (LETT #8# NIL . #15#) (LETT |i| 1 . #15#)
               (LETT #7# (QVELT A 1) . #15#) G190
               (COND ((OR (|greater_SI| |i| #7#) #8#) (GO G191)))
               (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #15#)
                    (LETT |finished?| (NULL (QCAR |r|)) . #15#)
                    (EXIT
                     (COND
                      (|finished?|
                       (LETT |rk|
                             (PROG1 (LETT #6# (- |i| 1) . #15#)
                               (|check_subtype| (>= #6# 0)
                                                '(|NonNegativeInteger|) #6#))
                             . #15#))
                      ('T
                       (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)) . #15#)
                            (LETT |pivlen| (LENGTH (QCAR |r|)) . #15#)
                            (LETT |pivrow| |i| . #15#) (LETT |k| 0 . #15#)
                            (SEQ (LETT |j| (+ |i| 1) . #15#)
                                 (LETT #5# (QVELT A 1) . #15#) G190
                                 (COND
                                  ((OR (> |j| #5#)
                                       (NULL
                                        (COND
                                         ((NULL
                                           (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                          'NIL)
                                         ('T
                                          (SPADCALL |pivind|
                                                    (|SPADfirst|
                                                     (QCAR
                                                      (QAREF1O (QVELT A 3) |j|
                                                               1)))
                                                    (QREFELT $ 46))))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |len|
                                        (LENGTH
                                         (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                        . #15#)
                                  (LETT |k| (+ |k| 1) . #15#)
                                  (EXIT
                                   (COND
                                    ((< |len| |pivlen|)
                                     (SEQ (LETT |pivlen| |len| . #15#)
                                          (EXIT
                                           (LETT |pivrow| |j| . #15#)))))))
                                 (LETT |j| (+ |j| 1) . #15#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |piv|
                                  (|SPADfirst|
                                   (QCDR (QAREF1O (QVELT A 3) |pivrow| 1)))
                                  . #15#)
                            (LETT |Pivs| (CONS |piv| |Pivs|) . #15#)
                            (EXIT
                             (COND
                              ((SPADCALL |k| 0 (QREFELT $ 63))
                               (SEQ
                                (COND
                                 ((SPADCALL |pivrow| |i| (QREFELT $ 59))
                                  (SEQ
                                   (LETT |pr| (QAREF1O (QVELT A 3) |pivrow| 1)
                                         . #15#)
                                   (QSETAREF1O (QVELT A 3) |pivrow|
                                               (QAREF1O (QVELT A 3) |i| 1) 1)
                                   (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                                   (EXIT
                                    (SPADCALL |LTr| |i| |pivrow|
                                              (QREFELT $ 89))))))
                                (LETT |pr|
                                      (CONS (CAR (QAREF1O (QVELT A 3) |i| 1))
                                            (CDR (QAREF1O (QVELT A 3) |i| 1)))
                                      . #15#)
                                (PROGN
                                 (RPLACA |pr| (CDR (QCAR |pr|)))
                                 (QCAR |pr|))
                                (PROGN
                                 (RPLACD |pr| (CDR (QCDR |pr|)))
                                 (QCDR |pr|))
                                (EXIT
                                 (SEQ (LETT |j| (+ |i| 1) . #15#)
                                      (LETT #4# (+ |i| |k|) . #15#) G190
                                      (COND ((> |j| #4#) (GO G191)))
                                      (SEQ
                                       (LETT |r|
                                             (CONS
                                              (CAR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1))
                                              (CDR
                                               (QAREF1O (QVELT A 3) (+ |i| 1)
                                                        1)))
                                             . #15#)
                                       (LETT |c| (|SPADfirst| (QCDR |r|))
                                             . #15#)
                                       (PROGN
                                        (RPLACA |r| (CDR (QCAR |r|)))
                                        (QCAR |r|))
                                       (PROGN
                                        (RPLACD |r| (CDR (QCDR |r|)))
                                        (QCDR |r|))
                                       (LETT |r|
                                             (|SEM;addRows| |piv| |r|
                                              (SPADCALL |c| (QREFELT $ 90))
                                              |pr| $)
                                             . #15#)
                                       (SEQ (LETT |l| 1 . #15#)
                                            (LETT #3# (QVELT A 1) . #15#) G190
                                            (COND
                                             ((|greater_SI| |l| #3#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |f|
                                                   (SPADCALL
                                                    (SPADCALL |piv|
                                                              (QAREF2O |LTr|
                                                                       (+ |i|
                                                                          1)
                                                                       |l| 1 1)
                                                              (QREFELT $ 79))
                                                    (SPADCALL |c|
                                                              (QAREF2O |LTr|
                                                                       |i| |l|
                                                                       1 1)
                                                              (QREFELT $ 79))
                                                    (QREFELT $ 91))
                                                   . #15#)
                                             (EXIT
                                              (QSETAREF2O |LTr| (+ |i| 1) |l|
                                                          |f| 1 1)))
                                            (LETT |l| (|inc_SI| |l|) . #15#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ (LETT |l| (+ |i| 2) . #15#)
                                            (LETT #2#
                                                  (-
                                                   (+
                                                    (+
                                                     (SPADCALL 2 |i|
                                                               (QREFELT $ 93))
                                                     |k|)
                                                    1)
                                                   |j|)
                                                  . #15#)
                                            G190 (COND ((> |l| #2#) (GO G191)))
                                            (SEQ
                                             (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                         (QAREF1O (QVELT A 3)
                                                                  |l| 1)
                                                         1)
                                             (EXIT
                                              (SPADCALL |LTr| (- |l| 1) |l|
                                                        (QREFELT $ 89))))
                                            (LETT |l| (+ |l| 1) . #15#)
                                            (GO G190) G191 (EXIT NIL))
                                       (SEQ
                                        (LETT |l|
                                              (-
                                               (+
                                                (+
                                                 (SPADCALL 2 |i|
                                                           (QREFELT $ 93))
                                                 |k|)
                                                2)
                                               |j|)
                                              . #15#)
                                        (LETT #1# (QVELT A 1) . #15#) G190
                                        (COND
                                         ((OR (> |l| #1#)
                                              (NULL
                                               (|SEM;greater|
                                                (QAREF1O (QVELT A 3) |l| 1) |r|
                                                $)))
                                          (GO G191)))
                                        (SEQ
                                         (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                     (QAREF1O (QVELT A 3) |l|
                                                              1)
                                                     1)
                                         (EXIT
                                          (SPADCALL |LTr| (- |l| 1) |l|
                                                    (QREFELT $ 89))))
                                        (LETT |l| (+ |l| 1) . #15#) (GO G190)
                                        G191 (EXIT NIL))
                                       (EXIT
                                        (QSETAREF1O (QVELT A 3) (- |l| 1) |r|
                                                    1)))
                                      (LETT |j| (+ |j| 1) . #15#) (GO G190)
                                      G191 (EXIT NIL))))))))))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #8# |finished?| . #15#))
                     . #15#)
               (GO G190) G191 (EXIT NIL))
          (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1) . #15#)))
          (EXIT (VECTOR A |LTr| |Pivs| |rk|)))))) 

(DEFUN |SEM;setGcdMode;2S;28| (|s| $)
  (PROG (|tmp|)
    (RETURN
     (SEQ (LETT |tmp| (QREFELT $ 17) |SEM;setGcdMode;2S;28|)
          (COND
           ((OR (EQUAL |s| '|iterated|) (EQUAL |s| '|random|))
            (EXIT (SEQ (SETELT $ 17 |s|) (EXIT |tmp|)))))
          (EXIT (|error| "unknown gcd mode")))))) 

(DEFUN |SEM;randomGCD| (|le| $)
  (PROG (|l| |tmp| #1=#:G444 |e| |h| |g| #2=#:G443 |f|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((EQL (LENGTH |le|) 2)
         (SPADCALL (|SPADfirst| |le|) (SPADCALL |le| (QREFELT $ 98))
                   (QREFELT $ 99)))
        (#3='T
         (SEQ (LETT |f| (|SPADfirst| |le|) . #4=(|SEM;randomGCD|))
              (LETT |g| (SPADCALL |le| (QREFELT $ 98)) . #4#)
              (LETT |l| (CDR (CDR |le|)) . #4#)
              (SEQ G190
                   (COND ((NULL (COND ((NULL |l|) 'NIL) ('T 'T))) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 78))
                       (PROGN (LETT #2# (|spadConstant| $ 12) . #4#) (GO #2#)))
                      ('T
                       (SEQ
                        (LETT |f|
                              (SPADCALL |f|
                                        (SPADCALL (+ 1 (RANDOM 113))
                                                  (|SPADfirst| |l|)
                                                  (QREFELT $ 100))
                                        (QREFELT $ 80))
                              . #4#)
                        (LETT |l| (CDR |l|) . #4#)
                        (EXIT
                         (COND
                          ((NULL (NULL |l|))
                           (COND
                            ((SPADCALL (|SPADfirst| |l|) (QREFELT $ 78))
                             (PROGN
                              (LETT #2# (|spadConstant| $ 12) . #4#)
                              (GO #2#)))
                            ('T
                             (SEQ
                              (LETT |g|
                                    (SPADCALL |g|
                                              (SPADCALL (+ 1 (RANDOM 113))
                                                        (|SPADfirst| |l|)
                                                        (QREFELT $ 100))
                                              (QREFELT $ 80))
                                    . #4#)
                              (EXIT (LETT |l| (CDR |l|) . #4#)))))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |h| (SPADCALL |f| |g| (QREFELT $ 99)) . #4#)
              (LETT |l| (LIST |h|) . #4#)
              (SEQ (LETT |e| NIL . #4#) (LETT #1# |le| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |tmp| (SPADCALL |e| |h| (QREFELT $ 102)) . #4#)
                        (EXIT
                         (COND
                          ((QEQCAR |tmp| 1) (LETT |l| (CONS |e| |l|) . #4#)))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL (LENGTH |l|) 1) |h|)
                     (#3# (|SEM;randomGCD| |l| $))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SEM;iteratedGCD| (|le| $)
  (PROG (|l| |res|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL (|SPADfirst| |le|) (SPADCALL |le| (QREFELT $ 98))
                      (QREFELT $ 99))
            . #1=(|SEM;iteratedGCD|))
      (LETT |l| (CDR (CDR |le|)) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (COND ((OR (NULL |l|) (SPADCALL |res| (QREFELT $ 78))) 'NIL)
                    ('T 'T)))
             (GO G191)))
           (SEQ
            (LETT |res| (SPADCALL |res| (|SPADfirst| |l|) (QREFELT $ 99))
                  . #1#)
            (EXIT (LETT |l| (CDR |l|) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |res|))))) 

(DEFUN |SEM;makePrimitive| (|r| $)
  (PROG (|le| #1=#:G454 #2=#:G462 |e| #3=#:G461 |g|)
    (RETURN
     (SEQ (LETT |le| (QCDR |r|) . #4=(|SEM;makePrimitive|))
          (EXIT
           (COND
            ((EQL (LENGTH |le|) 1)
             (CONS (|SPADfirst| |le|)
                   (CONS (QCAR |r|) (LIST (|spadConstant| $ 12)))))
            (#5='T
             (SEQ
              (COND
               ((EQUAL (QREFELT $ 17) '|iterated|)
                (LETT |g| (|SEM;iteratedGCD| |le| $) . #4#))
               (#5# (LETT |g| (|SEM;randomGCD| |le| $) . #4#)))
              (EXIT
               (COND
                ((SPADCALL |g| (QREFELT $ 78))
                 (CONS (|spadConstant| $ 12) |r|))
                (#5#
                 (SEQ
                  (LETT |le|
                        (PROGN
                         (LETT #3# NIL . #4#)
                         (SEQ (LETT |e| NIL . #4#) (LETT #2# |le| . #4#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |e| (CAR #2#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |e| |g|
                                                           (QREFELT $ 102))
                                                 . #4#)
                                           (QCDR #1#)
                                         (|check_union| (QEQCAR #1# 0)
                                                        (QREFELT $ 7) #1#))
                                       #3#)
                                      . #4#)))
                              (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #4#)
                  (EXIT (CONS |g| (CONS (QCAR |r|) |le|))))))))))))))) 

(DEFUN |SEM;primitiveRowEchelon;$R;32| (AA $)
  (PROG (|rk| #1=#:G524 |l| #2=#:G523 |fd| #3=#:G522 |r| |c| #4=#:G521 |j| |pr|
         |Pivs| |piv| #5=#:G520 |q| |tmp| |pivrow| |pivlen| |k| |len| #6=#:G519
         |pivind| #7=#:G478 |finished?| #8=#:G517 |i| #9=#:G518 |oldr|
         |sorted?| |newr| #10=#:G516 #11=#:G515 |changed?| #12=#:G514 |LTr|
         #13=#:G511 #14=#:G513 #15=#:G512 A)
    (RETURN
     (SEQ
      (LETT A (SPADCALL AA (QREFELT $ 54))
            . #16=(|SEM;primitiveRowEchelon;$R;32|))
      (LETT |LTr|
            (SPADCALL
             (PROGN
              (LETT #15# (GETREFV #17=(QVELT A 1)) . #16#)
              (SEQ (LETT |i| 1 . #16#) (LETT #14# #17# . #16#)
                   (LETT #13# 0 . #16#) G190
                   (COND ((|greater_SI| |i| #14#) (GO G191)))
                   (SEQ (EXIT (SETELT #15# #13# (|spadConstant| $ 104))))
                   (LETT #13#
                         (PROG1 (|inc_SI| #13#)
                           (LETT |i| (|inc_SI| |i|) . #16#))
                         . #16#)
                   (GO G190) G191 (EXIT NIL))
              #15#)
             (QREFELT $ 107))
            . #16#)
      (LETT |Pivs| NIL . #16#)
      (SEQ (LETT |i| 1 . #16#) (LETT #12# (QVELT A 1) . #16#) G190
           (COND ((|greater_SI| |i| #12#) (GO G191)))
           (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #16#)
                (LETT |changed?| 'NIL . #16#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((NULL (QCDR |r|)) 'NIL)
                              ('T
                               (SPADCALL (|SPADfirst| (QCDR |r|))
                                         (QREFELT $ 81)))))
                       (GO G191)))
                     (SEQ (PROGN (RPLACD |r| (CDR (QCDR |r|))) (QCDR |r|))
                          (PROGN (RPLACA |r| (CDR (QCAR |r|))) (QCAR |r|))
                          (EXIT (LETT |changed?| 'T . #16#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (COND (|changed?| (QSETAREF1O (QVELT A 3) |i| |r| 1)))))
           (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191 (EXIT NIL))
      (LETT |sorted?| 'NIL . #16#)
      (SEQ (LETT #11# NIL . #16#) G190 (COND (#11# (GO G191)))
           (SEQ (LETT |sorted?| 'T . #16#)
                (LETT |oldr| (QAREF1O (QVELT A 3) 1 1) . #16#)
                (EXIT
                 (SEQ (LETT |i| 2 . #16#) (LETT #10# (QVELT A 1) . #16#) G190
                      (COND ((|greater_SI| |i| #10#) (GO G191)))
                      (SEQ (LETT |newr| (QAREF1O (QVELT A 3) |i| 1) . #16#)
                           (EXIT
                            (COND
                             ((|SEM;greater| |newr| |oldr| $)
                              (SEQ (QSETAREF1O (QVELT A 3) |i| |oldr| 1)
                                   (QSETAREF1O (QVELT A 3) (- |i| 1) |newr| 1)
                                   (SPADCALL |LTr| (- |i| 1) |i|
                                             (QREFELT $ 108))
                                   (EXIT (LETT |sorted?| 'NIL . #16#))))
                             ('T (LETT |oldr| |newr| . #16#)))))
                      (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191
                      (EXIT NIL))))
           (LETT #11# |sorted?| . #16#) (GO G190) G191 (EXIT NIL))
      (LETT |finished?| 'NIL . #16#)
      (SEQ (LETT #9# NIL . #16#) (LETT |i| 1 . #16#)
           (LETT #8# (QVELT A 1) . #16#) G190
           (COND ((OR (|greater_SI| |i| #8#) #9#) (GO G191)))
           (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #16#)
                (LETT |finished?| (NULL (QCAR |r|)) . #16#)
                (EXIT
                 (COND
                  (|finished?|
                   (LETT |rk|
                         (PROG1 (LETT #7# (- |i| 1) . #16#)
                           (|check_subtype| (>= #7# 0) '(|NonNegativeInteger|)
                                            #7#))
                         . #16#))
                  ('T
                   (SEQ (LETT |pivind| (|SPADfirst| (QCAR |r|)) . #16#)
                        (LETT |pivlen| (LENGTH (QCAR |r|)) . #16#)
                        (LETT |pivrow| |i| . #16#) (LETT |k| 0 . #16#)
                        (SEQ (LETT |j| (+ |i| 1) . #16#)
                             (LETT #6# (QVELT A 1) . #16#) G190
                             (COND
                              ((OR (> |j| #6#)
                                   (NULL
                                    (COND
                                     ((NULL (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                      'NIL)
                                     ('T
                                      (SPADCALL |pivind|
                                                (|SPADfirst|
                                                 (QCAR
                                                  (QAREF1O (QVELT A 3) |j| 1)))
                                                (QREFELT $ 46))))))
                               (GO G191)))
                             (SEQ
                              (LETT |len|
                                    (LENGTH (QCAR (QAREF1O (QVELT A 3) |j| 1)))
                                    . #16#)
                              (LETT |k| (+ |k| 1) . #16#)
                              (EXIT
                               (COND
                                ((< |len| |pivlen|)
                                 (SEQ (LETT |pivlen| |len| . #16#)
                                      (EXIT (LETT |pivrow| |j| . #16#)))))))
                             (LETT |j| (+ |j| 1) . #16#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |tmp|
                              (|SEM;makePrimitive|
                               (QAREF1O (QVELT A 3) |pivrow| 1) $)
                              . #16#)
                        (COND
                         ((NULL (SPADCALL (QCAR |tmp|) (QREFELT $ 78)))
                          (SEQ (QSETAREF1O (QVELT A 3) |pivrow| (QCDR |tmp|) 1)
                               (LETT |q|
                                     (SPADCALL (|spadConstant| $ 12)
                                               (QCAR |tmp|) (QREFELT $ 109))
                                     . #16#)
                               (EXIT
                                (SEQ (LETT |l| 1 . #16#)
                                     (LETT #5# (QVELT A 1) . #16#) G190
                                     (COND ((|greater_SI| |l| #5#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((COND
                                          ((SPADCALL
                                            (QAREF2O |LTr| |pivrow| |l| 1 1)
                                            (QREFELT $ 110))
                                           'NIL)
                                          ('T 'T))
                                         (QSETAREF2O |LTr| |pivrow| |l|
                                                     (SPADCALL |q|
                                                               (QAREF2O |LTr|
                                                                        |pivrow|
                                                                        |l| 1
                                                                        1)
                                                               (QREFELT $ 111))
                                                     1 1)))))
                                     (LETT |l| (|inc_SI| |l|) . #16#) (GO G190)
                                     G191 (EXIT NIL))))))
                        (LETT |piv|
                              (|SPADfirst|
                               (QCDR (QAREF1O (QVELT A 3) |pivrow| 1)))
                              . #16#)
                        (LETT |Pivs| (CONS |piv| |Pivs|) . #16#)
                        (EXIT
                         (COND
                          ((SPADCALL |k| 0 (QREFELT $ 63))
                           (SEQ
                            (COND
                             ((SPADCALL |pivrow| |i| (QREFELT $ 59))
                              (SEQ
                               (LETT |pr| (QAREF1O (QVELT A 3) |pivrow| 1)
                                     . #16#)
                               (QSETAREF1O (QVELT A 3) |pivrow|
                                           (QAREF1O (QVELT A 3) |i| 1) 1)
                               (QSETAREF1O (QVELT A 3) |i| |pr| 1)
                               (EXIT
                                (SPADCALL |LTr| |i| |pivrow|
                                          (QREFELT $ 108))))))
                            (LETT |pr|
                                  (CONS (CAR (QCDR |tmp|)) (CDR (QCDR |tmp|)))
                                  . #16#)
                            (PROGN (RPLACA |pr| (CDR (QCAR |pr|))) (QCAR |pr|))
                            (PROGN (RPLACD |pr| (CDR (QCDR |pr|))) (QCDR |pr|))
                            (EXIT
                             (SEQ (LETT |j| (+ |i| 1) . #16#)
                                  (LETT #4# (+ |i| |k|) . #16#) G190
                                  (COND ((> |j| #4#) (GO G191)))
                                  (SEQ
                                   (LETT |r|
                                         (CONS
                                          (CAR
                                           (QAREF1O (QVELT A 3) (+ |i| 1) 1))
                                          (CDR
                                           (QAREF1O (QVELT A 3) (+ |i| 1) 1)))
                                         . #16#)
                                   (LETT |c| (|SPADfirst| (QCDR |r|)) . #16#)
                                   (PROGN
                                    (RPLACA |r| (CDR (QCAR |r|)))
                                    (QCAR |r|))
                                   (PROGN
                                    (RPLACD |r| (CDR (QCDR |r|)))
                                    (QCDR |r|))
                                   (LETT |r|
                                         (|SEM;addRows| |piv| |r|
                                          (SPADCALL |c| (QREFELT $ 90)) |pr| $)
                                         . #16#)
                                   (SEQ (LETT |l| 1 . #16#)
                                        (LETT #3# (QVELT A 1) . #16#) G190
                                        (COND
                                         ((|greater_SI| |l| #3#) (GO G191)))
                                        (SEQ
                                         (LETT |fd|
                                               (SPADCALL
                                                (SPADCALL |piv|
                                                          (QAREF2O |LTr|
                                                                   (+ |i| 1)
                                                                   |l| 1 1)
                                                          (QREFELT $ 112))
                                                (SPADCALL |c|
                                                          (QAREF2O |LTr| |i|
                                                                   |l| 1 1)
                                                          (QREFELT $ 112))
                                                (QREFELT $ 113))
                                               . #16#)
                                         (EXIT
                                          (QSETAREF2O |LTr| (+ |i| 1) |l| |fd|
                                                      1 1)))
                                        (LETT |l| (|inc_SI| |l|) . #16#)
                                        (GO G190) G191 (EXIT NIL))
                                   (SEQ (LETT |l| (+ |i| 2) . #16#)
                                        (LETT #2#
                                              (-
                                               (+
                                                (+
                                                 (SPADCALL 2 |i|
                                                           (QREFELT $ 93))
                                                 |k|)
                                                1)
                                               |j|)
                                              . #16#)
                                        G190 (COND ((> |l| #2#) (GO G191)))
                                        (SEQ
                                         (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                     (QAREF1O (QVELT A 3) |l|
                                                              1)
                                                     1)
                                         (EXIT
                                          (SPADCALL |LTr| (- |l| 1) |l|
                                                    (QREFELT $ 108))))
                                        (LETT |l| (+ |l| 1) . #16#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ
                                    (LETT |l|
                                          (-
                                           (+
                                            (+ (SPADCALL 2 |i| (QREFELT $ 93))
                                               |k|)
                                            2)
                                           |j|)
                                          . #16#)
                                    (LETT #1# (QVELT A 1) . #16#) G190
                                    (COND
                                     ((OR (> |l| #1#)
                                          (NULL
                                           (|SEM;greater|
                                            (QAREF1O (QVELT A 3) |l| 1) |r|
                                            $)))
                                      (GO G191)))
                                    (SEQ
                                     (QSETAREF1O (QVELT A 3) (- |l| 1)
                                                 (QAREF1O (QVELT A 3) |l| 1) 1)
                                     (EXIT
                                      (SPADCALL |LTr| (- |l| 1) |l|
                                                (QREFELT $ 108))))
                                    (LETT |l| (+ |l| 1) . #16#) (GO G190) G191
                                    (EXIT NIL))
                                   (EXIT
                                    (QSETAREF1O (QVELT A 3) (- |l| 1) |r| 1)))
                                  (LETT |j| (+ |j| 1) . #16#) (GO G190) G191
                                  (EXIT NIL))))))))))))
           (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #9# |finished?| . #16#))
                 . #16#)
           (GO G190) G191 (EXIT NIL))
      (COND ((NULL |finished?|) (LETT |rk| (QVELT A 1) . #16#)))
      (EXIT (VECTOR A |LTr| |Pivs| |rk|)))))) 

(DEFUN |SEM;*;M2$;33| (|List| AA $)
  (PROG (|r| |k| |inds| #1=#:G545 |i| |tmp| #2=#:G544 |c| |res| |rlen| A)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (ANCOLS |List|) (QVELT AA 1) (QREFELT $ 59))
        (|error| "improper matrix dimensions"))
       ('T
        (SEQ (LETT A (SPADCALL AA (QREFELT $ 54)) . #3=(|SEM;*;M2$;33|))
             (LETT |rlen| (ANROWS |List|) . #3#)
             (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT $ 34)) . #3#)
             (SEQ (LETT |c| NIL . #3#) (LETT #2# (QVELT A 2) . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| $ 36)) . #3#)
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVELT A 1) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #3#)
                             (LETT |inds| (QCAR |r|) . #3#)
                             (EXIT
                              (COND
                               ((NULL (NULL |inds|))
                                (COND
                                 ((SPADCALL (|SPADfirst| |inds|) |c|
                                            (QREFELT $ 46))
                                  (SEQ
                                   (SEQ (LETT |k| 1 . #3#) G190
                                        (COND
                                         ((|greater_SI| |k| |rlen|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((COND
                                             ((SPADCALL
                                               (QAREF2O |List| |k| |i| 1 1)
                                               (QREFELT $ 81))
                                              'NIL)
                                             ('T 'T))
                                            (QSETAREF1O |tmp| |k|
                                                        (SPADCALL
                                                         (QAREF1O |tmp| |k| 1)
                                                         (SPADCALL
                                                          (QAREF2O |List| |k|
                                                                   |i| 1 1)
                                                          (|SPADfirst|
                                                           (QCDR |r|))
                                                          (QREFELT $ 79))
                                                         (QREFELT $ 80))
                                                        1)))))
                                        (LETT |k| (|inc_SI| |k|) . #3#)
                                        (GO G190) G191 (EXIT NIL))
                                   (PROGN
                                    (RPLACD |r| (CDR (QCDR |r|)))
                                    (QCDR |r|))
                                   (PROGN (RPLACA |r| (CDR |inds|)) (QCAR |r|))
                                   (EXIT
                                    (QSETAREF1O (QVELT A 3) |i| |r| 1)))))))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (SEQ (LETT |k| 1 . #3#) G190
                         (COND ((|greater_SI| |k| |rlen|) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND
                              ((SPADCALL (QAREF1O |tmp| |k| 1) (QREFELT $ 81))
                               'NIL)
                              ('T 'T))
                             (SEQ
                              (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1) . #3#)
                              (PROGN
                               (RPLACA |r| (CONS |c| (QCAR |r|)))
                               (QCAR |r|))
                              (PROGN
                               (RPLACD |r|
                                       (CONS (QAREF1O |tmp| |k| 1) (QCDR |r|)))
                               (QCDR |r|))
                              (EXIT
                               (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))))))
                         (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
             (SEQ (LETT |k| 1 . #3#) G190
                  (COND ((|greater_SI| |k| |rlen|) (GO G191)))
                  (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1) . #3#)
                       (PROGN (RPLACA |r| (NREVERSE (QCAR |r|))) (QCAR |r|))
                       (PROGN (RPLACD |r| (NREVERSE (QCDR |r|))) (QCDR |r|))
                       (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                  (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |res|)))))))) 

(DEFUN |SEM;mult| (|f| |d| $)
  (PROG (|tmp| |res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL (SPADCALL |f| (QREFELT $ 117)) |d| (QREFELT $ 79))
            . #1=(|SEM;mult|))
      (LETT |tmp|
            (SPADCALL |res| (SPADCALL |f| (QREFELT $ 118)) (QREFELT $ 102))
            . #1#)
      (EXIT
       (COND ((QEQCAR |tmp| 1) (|error| "cannot divide in mult"))
             ('T (QCDR |tmp|)))))))) 

(DEFUN |SEM;*;M2$;35| (|List| AA $)
  (PROG (|r| |k| |d| |inds| #1=#:G575 |i| |tmp| #2=#:G574 |c| |res| |rlen| A)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (ANCOLS |List|) (QVELT AA 1) (QREFELT $ 59))
        (|error| "improper matrix dimensions"))
       ('T
        (SEQ (LETT A (SPADCALL AA (QREFELT $ 54)) . #3=(|SEM;*;M2$;35|))
             (LETT |rlen| (ANROWS |List|) . #3#)
             (LETT |res| (SPADCALL (QVELT A 2) |rlen| (QREFELT $ 34)) . #3#)
             (SEQ (LETT |c| NIL . #3#) (LETT #2# (QVELT A 2) . #3#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (LETT |tmp| (MAKEARR1 |rlen| (|spadConstant| $ 119)) . #3#)
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVELT A 1) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ (LETT |r| (QAREF1O (QVELT A 3) |i| 1) . #3#)
                             (LETT |inds| (QCAR |r|) . #3#)
                             (EXIT
                              (COND
                               ((NULL (NULL |inds|))
                                (COND
                                 ((SPADCALL (|SPADfirst| |inds|) |c|
                                            (QREFELT $ 46))
                                  (SEQ
                                   (SEQ (LETT |k| 1 . #3#) G190
                                        (COND
                                         ((|greater_SI| |k| |rlen|) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((COND
                                             ((SPADCALL
                                               (QAREF2O |List| |k| |i| 1 1)
                                               (QREFELT $ 110))
                                              'NIL)
                                             ('T 'T))
                                            (QSETAREF1O |tmp| |k|
                                                        (SPADCALL
                                                         (QAREF1O |tmp| |k| 1)
                                                         (SPADCALL
                                                          (QAREF2O |List| |k|
                                                                   |i| 1 1)
                                                          (|SPADfirst|
                                                           (QCDR |r|))
                                                          (QREFELT $ 120))
                                                         (QREFELT $ 121))
                                                        1)))))
                                        (LETT |k| (|inc_SI| |k|) . #3#)
                                        (GO G190) G191 (EXIT NIL))
                                   (PROGN
                                    (RPLACD |r| (CDR (QCDR |r|)))
                                    (QCDR |r|))
                                   (PROGN (RPLACA |r| (CDR |inds|)) (QCAR |r|))
                                   (EXIT
                                    (QSETAREF1O (QVELT A 3) |i| |r| 1)))))))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (SEQ (LETT |k| 1 . #3#) G190
                         (COND ((|greater_SI| |k| |rlen|) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND
                              ((SPADCALL (QAREF1O |tmp| |k| 1) (QREFELT $ 110))
                               'NIL)
                              ('T 'T))
                             (SEQ
                              (LETT |d|
                                    (SPADCALL (QAREF1O |tmp| |k| 1)
                                              (QREFELT $ 123))
                                    . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |d| 1) (|error| "cannot divide in *"))
                                ('T
                                 (SEQ
                                  (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1)
                                        . #3#)
                                  (PROGN
                                   (RPLACA |r| (CONS |c| (QCAR |r|)))
                                   (QCAR |r|))
                                  (PROGN
                                   (RPLACD |r| (CONS (QCDR |d|) (QCDR |r|)))
                                   (QCDR |r|))
                                  (EXIT
                                   (QSETAREF1O (QVELT |res| 3) |k| |r|
                                               1)))))))))))
                         (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
             (SEQ (LETT |k| 1 . #3#) G190
                  (COND ((|greater_SI| |k| |rlen|) (GO G191)))
                  (SEQ (LETT |r| (QAREF1O (QVELT |res| 3) |k| 1) . #3#)
                       (PROGN (RPLACA |r| (NREVERSE (QCAR |r|))) (QCAR |r|))
                       (PROGN (RPLACD |r| (NREVERSE (QCDR |r|))) (QCDR |r|))
                       (EXIT (QSETAREF1O (QVELT |res| 3) |k| |r| 1)))
                  (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
             (EXIT |res|)))))))) 

(DECLAIM (NOTINLINE |SparseEchelonMatrix;|)) 

(DEFUN |SparseEchelonMatrix| (&REST #1=#:G577)
  (PROG ()
    (RETURN
     (PROG (#2=#:G578)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SparseEchelonMatrix|)
                                           '|domainEqualList|)
                . #3=(|SparseEchelonMatrix|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SparseEchelonMatrix;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|SparseEchelonMatrix|))))))))))) 

(DEFUN |SparseEchelonMatrix;| (|#1| |#2|)
  (PROG (|i| #1=#:G576 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #2=(|SparseEchelonMatrix|))
       (LETT DV$2 (|devaluate| |#2|) . #2#)
       (LETT |dv$| (LIST '|SparseEchelonMatrix| DV$1 DV$2) . #2#)
       (LETT $ (GETREFV 125) . #2#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (|HasCategory| |#2| '(|GcdDomain|))
                                           (|HasCategory| |#2|
                                                          '(|IntegralDomain|))))
                       . #2#))
       (|haddProp| |$ConstructorCache| '|SparseEchelonMatrix| (LIST DV$1 DV$2)
                   (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 11
                 (SPADCALL
                  (PROGN
                   (LETT #1# NIL . #2#)
                   (SEQ (LETT |i| 1 . #2#) G190
                        (COND ((|greater_SI| |i| 1) (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS |i| #1#) . #2#)))
                        (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (QREFELT $ 10)))
       (QSETREFV $ 13 (- (QREFELT $ 11) 1))
       (QSETREFV $ 14 (CONS NIL NIL))
       (QSETREFV $ 15 (|HasCategory| |#2| '(|lazyRepresentation|)))
       (QSETREFV $ 16 113)
       (QSETREFV $ 17 '|iterated|)
       (QSETREFV $ 20
                 (|Record| (|:| |NCols| (|NonNegativeInteger|))
                           (|:| |NRows| (|NonNegativeInteger|))
                           (|:| |AllInds| (|List| |#1|))
                           (|:| |Rows|
                                (|Vector|
                                 (|Record| (|:| |Indices| (|List| |#1|))
                                           (|:| |Entries| (|List| |#2|)))))))
       (COND
        ((|testBitVector| |pv$| 1)
         (PROGN
          (QSETREFV $ 97 (CONS (|dispatchFunction| |SEM;setGcdMode;2S;28|) $))
          (QSETREFV $ 115
                    (CONS (|dispatchFunction| |SEM;primitiveRowEchelon;$R;32|)
                          $)))))
       (COND
        ((|testBitVector| |pv$| 2)
         (PROGN
          (QSETREFV $ 124 (CONS (|dispatchFunction| |SEM;*;M2$;35|) $)))))
       $))))) 

(MAKEPROP '|SparseEchelonMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Integer|)
              (|List| 21) (0 . |minIndex|) '|minInd| (5 . |One|) '|offset|
              '|emptyRec| '|noChecks?| '|seed| '|GCDmode| (|Boolean|) (9 . <)
              '|Rep| (|NonNegativeInteger|) |SEM;ncols;$Nni;2|
              |SEM;nrows;$Nni;3| (|List| 6) (15 . |copy|) |SEM;allIndices;$L;4|
              (|Record| (|:| |Indices| 24) (|:| |Entries| 32)) |SEM;row;$IR;5|
              (|Void|) (20 . |void|) |SEM;setRow!;$IRV;6| (|List| 7)
              |SEM;setRow!;$ILLV;7| |SEM;new;LI$;8| (24 . |position|)
              (30 . |Zero|) (34 . |qelt|) |SEM;elt;$ICD;9| (40 . |qsetelt!|)
              (47 . |insert!|) (54 . |insert!|) |SEM;setelt!;$ICDV;10|
              (|List| 27) (|Vector| 27) (61 . |entries|) (66 . =) (|Matrix| 7)
              |SEM;coerce;$M;11| (|OutputForm|) (72 . |coerce|) (77 . |coerce|)
              |SEM;coerce;$Of;12| (82 . |copy|) |SEM;copy;2$;13|
              (|Mapping| 18 6 6) (87 . |merge!|) (94 . |removeDuplicates!|)
              |SEM;elimZeroCols!;$V;14| (99 . ~=) (|Mapping| 18 6)
              |SEM;purge!;$MV;15| |SEM;sortedPurge!;$MV;16| (105 . >)
              |SEM;deleteRow!;$IV;17| (111 . |construct|)
              (116 . |setDifference|) (122 . |sort!|) (128 . |merge|)
              |SEM;consRow!;$RV;18| (135 . |concat|) |SEM;appendRow!;$RV;19|
              |SEM;extract;$2I$;20| |SEM;join;3$;21| |SEM;horizJoin;3$;22|
              (141 . >) (|Record| (|:| |Left| $) (|:| |Right| $))
              |SEM;horizSplit;$CR;23| (147 . |one?|) (152 . *) (158 . +)
              (164 . |zero?|) (169 . |concat!|) (175 . |concat!|)
              (|Record| (|:| |Index| 6) (|:| |Entry| 7)) |SEM;pivot;$IR;25|
              |SEM;pivots;$R;26| (|Vector| 7) (181 . |diagonalMatrix|)
              (186 . |swapRows!|) (193 . -) (198 . -) (|PositiveInteger|)
              (204 . *)
              (|Record| (|:| |Ech| $) (|:| |Lt| 47) (|:| |Pivots| 32)
                        (|:| |Rank| 21))
              |SEM;rowEchelon;$R;27| (|Symbol|) (210 . |setGcdMode|)
              (215 . |second|) (220 . |gcd|) (226 . *) (|Union| $ '"failed")
              (232 . |exquo|) (|Fraction| 7) (238 . |One|) (|Vector| 103)
              (|Matrix| 103) (242 . |diagonalMatrix|) (247 . |swapRows!|)
              (254 . /) (260 . |zero?|) (265 . *) (271 . *) (277 . -)
              (|Record| (|:| |Ech| $) (|:| |Lt| 106) (|:| |Pivots| 32)
                        (|:| |Rank| 21))
              (283 . |primitiveRowEchelon|) |SEM;*;M2$;33| (288 . |numer|)
              (293 . |denom|) (298 . |Zero|) (302 . *) (308 . +)
              (|Union| 7 '"failed") (314 . |retractIfCan|) (319 . *))
           '#(|sortedPurge!| 325 |setelt!| 331 |setRow!| 339 |setGcdMode| 354
              |rowEchelon| 359 |row| 364 |purge!| 370 |primitiveRowEchelon| 376
              |pivots| 381 |pivot| 386 |nrows| 392 |new| 397 |ncols| 403 |join|
              408 |horizSplit| 414 |horizJoin| 420 |extract| 426 |elt| 433
              |elimZeroCols!| 440 |deleteRow!| 445 |copy| 451 |consRow!| 456
              |coerce| 462 |appendRow!| 472 |allIndices| 478 * 483)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|CoercibleTo| 49) (|shallowlyMutable|)
                           (|finiteAggregate|))
                        (|makeByteWordVec2| 124
                                            '(1 9 8 0 10 0 7 0 12 2 6 18 0 0 19
                                              1 24 0 0 25 0 29 0 30 2 24 8 6 0
                                              35 0 7 0 36 2 32 7 0 8 37 3 32 7
                                              0 8 7 39 3 24 0 6 0 8 40 3 32 0 7
                                              0 8 41 1 44 43 0 45 2 6 18 0 0 46
                                              1 7 49 0 50 1 47 49 0 51 1 32 0 0
                                              53 3 24 0 55 0 0 56 1 24 0 0 57 2
                                              21 18 0 0 59 2 8 18 0 0 63 1 44 0
                                              43 65 2 24 0 0 0 66 2 24 0 55 0
                                              67 3 24 0 55 0 0 68 2 43 0 0 27
                                              70 2 6 18 0 0 75 1 7 18 0 78 2 7
                                              0 0 0 79 2 7 0 0 0 80 1 7 18 0 81
                                              2 24 0 0 0 82 2 32 0 0 0 83 1 47
                                              0 87 88 3 47 0 0 8 8 89 1 7 0 0
                                              90 2 7 0 0 0 91 2 21 0 92 0 93 1
                                              0 96 96 97 1 32 7 0 98 2 7 0 0 0
                                              99 2 7 0 8 0 100 2 7 101 0 0 102
                                              0 103 0 104 1 106 0 105 107 3 106
                                              0 0 8 8 108 2 103 0 7 7 109 1 103
                                              18 0 110 2 103 0 0 0 111 2 103 0
                                              7 0 112 2 103 0 0 0 113 1 0 114 0
                                              115 1 103 7 0 117 1 103 7 0 118 0
                                              103 0 119 2 103 0 0 7 120 2 103 0
                                              0 0 121 1 103 122 0 123 2 0 0 106
                                              0 124 2 0 29 0 60 62 4 0 29 0 8 6
                                              7 42 4 0 29 0 8 24 32 33 3 0 29 0
                                              8 27 31 1 1 96 96 97 1 0 94 0 95
                                              2 0 27 0 8 28 2 0 29 0 60 61 1 1
                                              114 0 115 1 0 27 0 86 2 0 84 0 8
                                              85 1 0 21 0 23 2 0 0 24 8 34 1 0
                                              21 0 22 2 0 0 0 0 73 2 0 76 0 6
                                              77 2 0 0 0 0 74 3 0 0 0 8 8 72 3
                                              0 7 0 8 6 38 1 0 29 0 58 2 0 29 0
                                              8 64 1 0 0 0 54 2 0 29 0 27 69 1
                                              0 49 0 52 1 0 47 0 48 2 0 29 0 27
                                              71 1 0 24 0 26 2 2 0 106 0 124 2
                                              0 0 47 0 116)))))
           '|lookupComplete|)) 
