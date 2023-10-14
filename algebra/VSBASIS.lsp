
(/VERSIONCHECK 2) 

(PUT '|VSBASIS;Zero;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |VSBASIS;Zero;$;1| ($) NIL) 

(PUT '|VSBASIS;coerce;$L;2| '|SPADreplace| '(XLAM (B) B)) 

(DEFUN |VSBASIS;coerce;$L;2| (B $) B) 

(DEFUN |VSBASIS;coerce;$Of;3| (B $)
  (PROG (|a2| |a1|)
    (RETURN
     (SEQ (LETT |a1| "VectorSpace " . #1=(|VSBASIS;coerce;$Of;3|))
          (LETT |a2| (SPADCALL B (QREFELT $ 11)) . #1#)
          (EXIT (SPADCALL |a1| |a2| (QREFELT $ 12))))))) 

(DEFUN |VSBASIS;column2matrix| (|Lv| $)
  (PROG (#1=#:G148 |k| #2=#:G149 |v| M |n|)
    (RETURN
     (SEQ
      (LETT |n| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
            . #3=(|VSBASIS;column2matrix|))
      (LETT M (MAKE_MATRIX1 |n| (LENGTH |Lv|) (|spadConstant| $ 18)) . #3#)
      (SEQ (LETT |v| NIL . #3#) (LETT #2# |Lv| . #3#) (LETT |k| 1 . #3#)
           (LETT #1# (LENGTH |Lv|) . #3#) G190
           (COND
            ((OR (|greater_SI| |k| #1#) (ATOM #2#)
                 (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |n| (QVSIZE |v|) (QREFELT $ 21))
               (|error|
                "Length of vectors in VectorSpaceBasis must have the same size"))
              ('T (SPADCALL M |k| |v| (QREFELT $ 23))))))
           (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT M))))) 

(DEFUN |VSBASIS;basis;L$;5| (|Lv| $)
  (COND ((EQL (LENGTH |Lv|) 0) (|spadConstant| $ 8))
        ('T (SPADCALL (|VSBASIS;column2matrix| |Lv| $) (QREFELT $ 24))))) 

(DEFUN |VSBASIS;columnSpace;M$;6| (M $) (SPADCALL M (QREFELT $ 24))) 

(DEFUN |VSBASIS;nullSpace;M$;7| (M $) (SPADCALL M (QREFELT $ 27))) 

(DEFUN |VSBASIS;sumBasis;2L$;8| (|Lv| |Lw| $)
  (SPADCALL (SPADCALL |Lv| |Lw| (QREFELT $ 29)) (QREFELT $ 25))) 

(DEFUN |VSBASIS;sumBasis;3$;9| (B1 B2 $)
  (SPADCALL (SPADCALL B1 B2 (QREFELT $ 29)) (QREFELT $ 25))) 

(DEFUN |VSBASIS;sumBasis;L$;10| (|LLv| $)
  (SPADCALL (SPADCALL |LLv| (QREFELT $ 33)) (QREFELT $ 25))) 

(DEFUN |VSBASIS;sumBasis;L$;11| (LB $)
  (SPADCALL (SPADCALL LB (QREFELT $ 36)) (QREFELT $ 25))) 

(DEFUN |VSBASIS;+;3$;12| (B1 B2 $) (SPADCALL B1 B2 (QREFELT $ 31))) 

(DEFUN |VSBASIS;subVector| (|v| |a| |b| $)
  (PROG (#1=#:G163 |k| |vv| #2=#:G159)
    (RETURN
     (SEQ
      (LETT |vv|
            (MAKEARR1
             (PROG1 (LETT #2# (+ (- |b| |a|) 1) . #3=(|VSBASIS;subVector|))
               (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
             (|spadConstant| $ 18))
            . #3#)
      (SEQ (LETT |k| 1 . #3#) (LETT #1# (+ (- |b| |a|) 1) . #3#) G190
           (COND ((|greater_SI| |k| #1#) (GO G191)))
           (SEQ
            (EXIT (QSETAREF1O |vv| |k| (QAREF1O |v| (- (+ |k| |a|) 1) 1) 1)))
           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |vv|))))) 

(DEFUN |VSBASIS;linearSum| (|t| |Lv| $)
  (PROG (#1=#:G171 |j| |t2| #2=#:G169 |k| #3=#:G170 |v2| |vv|)
    (RETURN
     (SEQ
      (LETT |vv|
            (MAKEARR1 (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                      (|spadConstant| $ 18))
            . #4=(|VSBASIS;linearSum|))
      (SEQ (LETT |v2| NIL . #4#) (LETT #3# |Lv| . #4#) (LETT |k| 1 . #4#)
           (LETT #2# (LENGTH |Lv|) . #4#) G190
           (COND
            ((OR (|greater_SI| |k| #2#) (ATOM #3#)
                 (PROGN (LETT |v2| (CAR #3#) . #4#) NIL))
             (GO G191)))
           (SEQ (LETT |t2| (SPADCALL |t| |k| (QREFELT $ 39)) . #4#)
                (EXIT
                 (SEQ (LETT |j| 1 . #4#) (LETT #1# (QVSIZE |vv|) . #4#) G190
                      (COND ((|greater_SI| |j| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |vv| |j|
                                  (SPADCALL (SPADCALL |vv| |j| (QREFELT $ 39))
                                            (SPADCALL |t2|
                                                      (SPADCALL |v2| |j|
                                                                (QREFELT $ 39))
                                                      (QREFELT $ 40))
                                            (QREFELT $ 41))
                                  (QREFELT $ 42))))
                      (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                      (EXIT NIL))))
           (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #3# (CDR #3#) . #4#)) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT |vv|))))) 

(DEFUN |VSBASIS;intBasis;2L$;15| (|Lv| |Lw| $)
  (SPADCALL (SPADCALL |Lv| (QREFELT $ 25)) (SPADCALL |Lw| (QREFELT $ 25))
            (QREFELT $ 43))) 

(DEFUN |VSBASIS;intBasis;3$;16| (B1 B2 $)
  (PROG (#1=#:G185 |cc| #2=#:G184 |LcoeffB1| #3=#:G183 |kv| #4=#:G182 |lker|
         |k| #5=#:G181 |v| #6=#:G180 |w| M |d2| |d1| |Lw| |Lv|)
    (RETURN
     (SEQ (LETT |Lv| B1 . #7=(|VSBASIS;intBasis;3$;16|)) (LETT |Lw| B2 . #7#)
          (COND ((OR (NULL |Lv|) (NULL |Lw|)) (EXIT (|spadConstant| $ 8))))
          (LETT |d1| (LENGTH |Lv|) . #7#) (LETT |d2| (LENGTH |Lw|) . #7#)
          (EXIT
           (COND
            ((SPADCALL (QVSIZE (|SPADfirst| |Lv|)) (QVSIZE (|SPADfirst| |Lw|))
                       (QREFELT $ 21))
             (|error| "vectors have not the same length in intBasis"))
            ('T
             (SEQ
              (LETT M
                    (MAKE_MATRIX1 (QVSIZE (|SPADfirst| |Lv|)) (+ |d1| |d2|)
                                  (|spadConstant| $ 18))
                    . #7#)
              (SEQ (LETT |w| NIL . #7#) (LETT #6# |Lw| . #7#)
                   (LETT |k| 1 . #7#) G190
                   (COND
                    ((OR (|greater_SI| |k| |d2|) (ATOM #6#)
                         (PROGN (LETT |w| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL M |k| |w| (QREFELT $ 23))))
                   (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #6# (CDR #6#) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |v| NIL . #7#) (LETT #5# |Lv| . #7#)
                   (LETT |k| 1 . #7#) G190
                   (COND
                    ((OR (|greater_SI| |k| |d1|) (ATOM #5#)
                         (PROGN (LETT |v| (CAR #5#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL M (+ |d2| |k|) |v| (QREFELT $ 23))))
                   (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #5# (CDR #5#) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |lker| (SPADCALL M (QREFELT $ 27)) . #7#)
              (LETT |LcoeffB1|
                    (PROGN
                     (LETT #4# NIL . #7#)
                     (SEQ (LETT |kv| NIL . #7#) (LETT #3# |lker| . #7#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |kv| (CAR #3#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (|VSBASIS;subVector| |kv| (+ |d2| 1)
                                    (+ |d2| |d1|) $)
                                   #4#)
                                  . #7#)))
                          (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #7#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #7#)
                (SEQ (LETT |cc| NIL . #7#) (LETT #1# |LcoeffB1| . #7#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |cc| (CAR #1#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (|VSBASIS;linearSum| |cc| |Lv| $) #2#)
                             . #7#)))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))))))))))) 

(DEFUN |VSBASIS;intBasis;L$;17| (LLB $)
  (PROG (|res| #1=#:G191 LB)
    (RETURN
     (SEQ
      (COND
       ((EQL (LENGTH LLB) 0) (|error| "intersect no subspace is impossible"))
       ((EQL (LENGTH LLB) 1)
        (SPADCALL (SPADCALL LLB 1 (QREFELT $ 45)) (QREFELT $ 25)))
       ('T
        (SEQ
         (LETT |res| (SPADCALL LLB 1 (QREFELT $ 45))
               . #2=(|VSBASIS;intBasis;L$;17|))
         (SEQ (LETT LB NIL . #2#) (LETT #1# (CDR LLB) . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT LB (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |res|
                      (SPADCALL |res| (SPADCALL LB (QREFELT $ 25))
                                (QREFELT $ 43))
                      . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |VSBASIS;intBasis;L$;18| (LLB $)
  (PROG (|res| #1=#:G197 LB)
    (RETURN
     (SEQ
      (COND
       ((EQL (SPADCALL LLB (QREFELT $ 48)) 0)
        (|error| "intersect no subspace is impossible"))
       ((EQL (SPADCALL LLB (QREFELT $ 48)) 1) (SPADCALL LLB 1 (QREFELT $ 49)))
       ('T
        (SEQ
         (LETT |res| (SPADCALL LLB 1 (QREFELT $ 49))
               . #2=(|VSBASIS;intBasis;L$;18|))
         (SEQ (LETT LB NIL . #2#)
              (LETT #1# (SPADCALL LLB (QREFELT $ 50)) . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT LB (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT (LETT |res| (SPADCALL |res| LB (QREFELT $ 43)) . #2#)))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT |res|)))))))) 

(DEFUN |VSBASIS;*;3$;19| (B1 B2 $) (SPADCALL B1 B2 (QREFELT $ 43))) 

(PUT '|VSBASIS;rank;$Nni;20| '|SPADreplace| 'LENGTH) 

(DEFUN |VSBASIS;rank;$Nni;20| (B $) (LENGTH B)) 

(DEFUN |VSBASIS;rank;LNni;21| (|Lv| $)
  (SPADCALL (SPADCALL |Lv| (QREFELT $ 25)) (QREFELT $ 53))) 

(DEFUN |VSBASIS;isBasis?;LB;22| (|Lv| $)
  (EQL (SPADCALL |Lv| (QREFELT $ 53)) (LENGTH |Lv|))) 

(DEFUN |VSBASIS;subspace?;2$B;23| (B1 B2 $)
  (EQL (SPADCALL B2 (QREFELT $ 53))
       (SPADCALL (SPADCALL B1 B2 (QREFELT $ 31)) (QREFELT $ 53)))) 

(DEFUN |VSBASIS;=;2$B;24| (B1 B2 $)
  (PROG (|rk|)
    (RETURN
     (SEQ
      (LETT |rk| (SPADCALL (SPADCALL B1 B2 (QREFELT $ 31)) (QREFELT $ 53))
            |VSBASIS;=;2$B;24|)
      (EXIT
       (COND
        ((EQL |rk| (SPADCALL B1 (QREFELT $ 53)))
         (EQL |rk| (SPADCALL B2 (QREFELT $ 53))))
        ('T 'NIL))))))) 

(DEFUN |VSBASIS;canonicalBasis;Nni$;25| (|n| $)
  (PROG (L |v| |k|)
    (RETURN
     (SEQ (LETT L NIL . #1=(|VSBASIS;canonicalBasis;Nni$;25|))
          (SEQ (LETT |k| 1 . #1#) G190
               (COND ((|greater_SI| |k| |n|) (GO G191)))
               (SEQ (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 18)) . #1#)
                    (SPADCALL |v| (- (+ |n| 1) |k|) (|spadConstant| $ 14)
                              (QREFELT $ 42))
                    (EXIT (LETT L (CONS |v| L) . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT L))))) 

(DEFUN |VSBASIS;complementSpace;L$;26| (|Lv| $)
  (PROG (|ind| RES #1=#:G217 |k| #2=#:G218 |v| #3=#:G216 |n| M |Lw| |bc| |dim|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |Lv| NIL (QREFELT $ 57))
        (|error|
         "Can't get vector length of an empty family for complementSpace"))
       ('T
        (SEQ
         (LETT |dim| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
               . #4=(|VSBASIS;complementSpace;L$;26|))
         (LETT |bc| (SPADCALL (SPADCALL |dim| (QREFELT $ 58)) (QREFELT $ 9))
               . #4#)
         (LETT |Lw| (SPADCALL |Lv| |bc| (QREFELT $ 29)) . #4#)
         (LETT M (SPADCALL (|VSBASIS;column2matrix| |Lw| $) (QREFELT $ 59))
               . #4#)
         (LETT |n| (LENGTH |Lv|) . #4#) (LETT |ind| 1 . #4#)
         (SEQ (LETT |v| NIL . #4#) (LETT #3# |Lw| . #4#) (LETT |k| 1 . #4#)
              G190
              (COND
               ((OR (|greater_SI| |k| |n|) (ATOM #3#)
                    (PROGN (LETT |v| (CAR #3#) . #4#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |ind| |dim| (QREFELT $ 60))
                  (COND
                   ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                              (|spadConstant| $ 18) (QREFELT $ 62))
                    (LETT |ind| (+ |ind| 1) . #4#)))))))
              (LETT |k| (PROG1 (|inc_SI| |k|) (LETT #3# (CDR #3#) . #4#))
                    . #4#)
              (GO G190) G191 (EXIT NIL))
         (LETT RES NIL . #4#)
         (SEQ (LETT |v| NIL . #4#) (LETT #2# |bc| . #4#)
              (LETT |k| (+ |n| 1) . #4#) (LETT #1# (+ |n| |dim|) . #4#) G190
              (COND
               ((OR (> |k| #1#) (ATOM #2#)
                    (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |ind| |dim| (QREFELT $ 60))
                  (COND
                   ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                              (|spadConstant| $ 18) (QREFELT $ 62))
                    (SEQ (LETT RES (CONS |v| RES) . #4#)
                         (EXIT (LETT |ind| (+ |ind| 1) . #4#)))))))))
              (LETT |k| (PROG1 (+ |k| 1) (LETT #2# (CDR #2#) . #4#)) . #4#)
              (GO G190) G191 (EXIT NIL))
         (EXIT (NREVERSE RES))))))))) 

(DEFUN |VSBASIS;complementSpace;LNni$;27| (|Lv| |n| $)
  (COND ((SPADCALL |Lv| NIL (QREFELT $ 57)) (SPADCALL |n| (QREFELT $ 58)))
        ((SPADCALL |n| (QVSIZE (SPADCALL |Lv| 1 (QREFELT $ 17)))
                   (QREFELT $ 21))
         (|error| "Inconsistant vector length in complementSpace"))
        ('T (SPADCALL |Lv| (QREFELT $ 64))))) 

(DEFUN |VSBASIS;complementSpace;2$;28| (B $)
  (PROG (|ind| RES #1=#:G226 |k| #2=#:G227 |v| |n| M |Lw| |bc| |dim|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL B (|spadConstant| $ 8) (QREFELT $ 57))
        (|error|
         "Can't get vector length of an empty basis for complement Space"))
       ('T
        (SEQ
         (LETT |dim| (QVSIZE (SPADCALL B 1 (QREFELT $ 17)))
               . #3=(|VSBASIS;complementSpace;2$;28|))
         (LETT |bc| (SPADCALL (SPADCALL |dim| (QREFELT $ 58)) (QREFELT $ 9))
               . #3#)
         (LETT |Lw| (SPADCALL (SPADCALL B (QREFELT $ 9)) |bc| (QREFELT $ 29))
               . #3#)
         (LETT M (SPADCALL (|VSBASIS;column2matrix| |Lw| $) (QREFELT $ 59))
               . #3#)
         (LETT |n| (LENGTH B) . #3#) (LETT |ind| (+ |n| 1) . #3#)
         (LETT RES NIL . #3#)
         (SEQ (LETT |v| NIL . #3#) (LETT #2# |bc| . #3#)
              (LETT |k| (+ |n| 1) . #3#) (LETT #1# (+ |n| |dim|) . #3#) G190
              (COND
               ((OR (> |k| #1#) (ATOM #2#)
                    (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |ind| |dim| (QREFELT $ 60))
                  (COND
                   ((SPADCALL (SPADCALL M |ind| |k| (QREFELT $ 61))
                              (|spadConstant| $ 18) (QREFELT $ 62))
                    (SEQ (LETT RES (CONS |v| RES) . #3#)
                         (EXIT (LETT |ind| (+ |ind| 1) . #3#)))))))))
              (LETT |k| (PROG1 (+ |k| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
              (GO G190) G191 (EXIT NIL))
         (EXIT (NREVERSE RES))))))))) 

(DEFUN |VSBASIS;complementSpace;$Nni$;29| (B |n| $)
  (COND ((SPADCALL B NIL (QREFELT $ 57)) (SPADCALL |n| (QREFELT $ 58)))
        ((SPADCALL |n| (QVSIZE (SPADCALL B 1 (QREFELT $ 17))) (QREFELT $ 21))
         (|error| "Inconsistant vector length in complementSpace"))
        ('T (SPADCALL B (QREFELT $ 64))))) 

(DEFUN |VSBASIS;member?;V$B;30| (|v| B $)
  (SPADCALL (|VSBASIS;column2matrix| B $) |v| (QREFELT $ 68))) 

(DEFUN |VSBASIS;coordinatesIfCan;V$U;31| (|v| B $)
  (SPADCALL (|VSBASIS;column2matrix| B $) |v| (QREFELT $ 71))) 

(DEFUN |VSBASIS;coordinates;V$V;32| (V B $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res| (SPADCALL (|VSBASIS;column2matrix| B $) V (QREFELT $ 71))
            |VSBASIS;coordinates;V$V;32|)
      (EXIT
       (COND ((QEQCAR |res| 1) (|error| "Vector not in the subspace"))
             ('T (QCDR |res|)))))))) 

(DECLAIM (NOTINLINE |VectorSpaceBasis;|)) 

(DEFUN |VectorSpaceBasis| (#1=#:G240)
  (PROG ()
    (RETURN
     (PROG (#2=#:G241)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|VectorSpaceBasis|)
                                           '|domainEqualList|)
                . #3=(|VectorSpaceBasis|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|VectorSpaceBasis;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|VectorSpaceBasis|))))))))))) 

(DEFUN |VectorSpaceBasis;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|VectorSpaceBasis|))
      (LETT |dv$| (LIST '|VectorSpaceBasis| DV$1) . #1#)
      (LETT $ (GETREFV 74) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|VectorSpaceBasis| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|List| (|Vector| |#1|)))
      $)))) 

(MAKEPROP '|VectorSpaceBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 15) (|local| |#1|) '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |VSBASIS;Zero;$;1|) $))
              |VSBASIS;coerce;$L;2| (|OutputForm|) (0 . |coerce|)
              (5 . |hconcat|) |VSBASIS;coerce;$Of;3| (11 . |One|) (|Vector| 6)
              (|Integer|) (15 . |elt|) (21 . |Zero|) (|Boolean|)
              (|NonNegativeInteger|) (25 . ~=) (|Matrix| 6) (31 . |setColumn!|)
              (38 . |columnSpace|) |VSBASIS;basis;L$;5|
              |VSBASIS;columnSpace;M$;6| (43 . |nullSpace|)
              |VSBASIS;nullSpace;M$;7| (48 . |concat|) |VSBASIS;sumBasis;2L$;8|
              |VSBASIS;sumBasis;3$;9| (|List| $) (54 . |concat|) (|List| 5)
              |VSBASIS;sumBasis;L$;10| (59 . |concat|) |VSBASIS;sumBasis;L$;11|
              |VSBASIS;+;3$;12| (64 . |elt|) (70 . *) (76 . +) (82 . |setelt|)
              |VSBASIS;intBasis;3$;16| |VSBASIS;intBasis;2L$;15| (89 . |elt|)
              |VSBASIS;intBasis;L$;17| (|List| $$) (95 . |#|) (100 . |elt|)
              (106 . |rest|) |VSBASIS;intBasis;L$;18| |VSBASIS;*;3$;19|
              |VSBASIS;rank;$Nni;20| |VSBASIS;rank;LNni;21|
              |VSBASIS;isBasis?;LB;22| |VSBASIS;subspace?;2$B;23|
              |VSBASIS;=;2$B;24| |VSBASIS;canonicalBasis;Nni$;25|
              (111 . |rowEchelon|) (116 . <=) (122 . |elt|) (129 . ~=)
              |VSBASIS;complementSpace;L$;26| |VSBASIS;complementSpace;2$;28|
              |VSBASIS;complementSpace;LNni$;27|
              |VSBASIS;complementSpace;$Nni$;29|
              (|LinearSystemMatrixPackage1| 6) (135 . |hasSolution?|)
              |VSBASIS;member?;V$B;30| (|Union| 15 '"failed")
              (141 . |particularSolution|) |VSBASIS;coordinatesIfCan;V$U;31|
              |VSBASIS;coordinates;V$V;32|)
           '#(|sumBasis| 147 |subspace?| 169 |rank| 175 |nullSpace| 185
              |member?| 190 |isBasis?| 196 |intBasis| 201 |coordinatesIfCan|
              223 |coordinates| 229 |complementSpace| 235 |columnSpace| 257
              |coerce| 262 |canonicalBasis| 272 |basis| 277 |Zero| 282 = 286 +
              292 * 298)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 73
                                                 '(1 5 10 0 11 2 10 0 0 0 12 0
                                                   6 0 14 2 7 15 0 16 17 0 6 0
                                                   18 2 20 19 0 0 21 3 22 0 0
                                                   16 15 23 1 22 5 0 24 1 22 5
                                                   0 27 2 5 0 0 0 29 1 5 0 32
                                                   33 1 7 0 32 36 2 15 6 0 16
                                                   39 2 6 0 0 0 40 2 6 0 0 0 41
                                                   3 15 6 0 16 6 42 2 34 5 0 16
                                                   45 1 47 20 0 48 2 47 2 0 16
                                                   49 1 47 0 0 50 1 22 0 0 59 2
                                                   20 19 0 0 60 3 22 6 0 16 16
                                                   61 2 6 19 0 0 62 2 67 19 22
                                                   15 68 2 67 70 22 15 71 2 0 0
                                                   5 5 30 2 0 0 0 0 31 1 0 0 32
                                                   37 1 0 0 34 35 2 0 19 0 0 56
                                                   1 0 20 0 53 1 0 20 5 54 1 0
                                                   0 22 28 2 0 19 15 0 69 1 0
                                                   19 5 55 2 0 0 5 5 44 2 0 0 0
                                                   0 43 1 0 0 34 46 1 0 0 32 51
                                                   2 0 70 15 0 72 2 0 15 15 0
                                                   73 2 0 0 0 20 66 1 0 0 0 64
                                                   2 0 0 5 20 65 1 0 0 5 63 1 0
                                                   0 22 26 1 0 10 0 13 1 0 5 0
                                                   9 1 0 0 20 58 1 0 0 5 25 0 0
                                                   0 8 2 0 19 0 0 57 2 0 0 0 0
                                                   38 2 0 0 0 0 52)))))
           '|lookupComplete|)) 
