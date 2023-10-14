
(/VERSIONCHECK 2) 

(DEFUN |DIRPROD;coerce;$V;1| (|z| $) (SPADCALL |z| (QREFELT $ 9))) 

(DEFUN |DIRPROD;coerce;R$;2| (|r| $) (MAKEARR1 (QREFELT $ 6) |r|)) 

(PUT '|DIRPROD;parts;$L;3| '|SPADreplace| 'VEC2LIST) 

(DEFUN |DIRPROD;parts;$L;3| (|x| $) (VEC2LIST |x|)) 

(DEFUN |DIRPROD;directProduct;V$;4| (|z| $)
  (COND
   ((SPADCALL |z| (QREFELT $ 6) (QREFELT $ 16)) (SPADCALL |z| (QREFELT $ 9)))
   ('T (|error| "Not of the correct length")))) 

(DEFUN |DIRPROD;same?| (|z| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR $ |z|)) |z| (QREFELT $ 23))))) 

(DEFUN |DIRPROD;same?!0| (|x| $$)
  (PROG (|z| $)
    (LETT |z| (QREFELT $$ 1) . #1=(|DIRPROD;same?|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |x| (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20))
                (QREFELT $ 21)))))) 

(DEFUN |DIRPROD;=;2$B;6| (|x| |y| $)
  (PROG (#1=#:G144 #2=#:G146 #3=#:G147 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |i| 0 . #4=(|DIRPROD;=;2$B;6|))
               (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;=;2$B;7| (|x| |y| $)
  (PROG (#1=#:G149 #2=#:G151 #3=#:G152 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |i| 0 . #4=(|DIRPROD;=;2$B;7|))
               (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;=;2$B;8| (|x| |y| $)
  (PROG (#1=#:G154 #2=#:G156 #3=#:G157 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |i| 1 . #4=(|DIRPROD;=;2$B;8|))
               (LETT #3# (QREFELT $ 6) . #4#) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                              (QREFELT $ 21)))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;retract;$R;9| (|z| $)
  (COND
   ((|DIRPROD;same?| |z| $)
    (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20)))
   ('T (|error| "Not retractable")))) 

(DEFUN |DIRPROD;retractIfCan;$U;10| (|z| $)
  (COND
   ((|DIRPROD;same?| |z| $)
    (CONS 0 (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20))))
   ('T (CONS 1 "failed")))) 

(DEFUN |DIRPROD;index;Pi$;11| (|n| $)
  (PROG (L #1=#:G169 |p| #2=#:G174 |i| #3=#:G168 N)
    (RETURN
     (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #4=(|DIRPROD;index;Pi$;11|))
          (LETT |p| (- |n| 1) . #4#)
          (LETT L
                (LIST
                 (SPADCALL
                  (PROG1 (LETT #3# (+ (REM |p| N) 1) . #4#)
                    (|check_subtype| (> #3# 0) '(|PositiveInteger|) #3#))
                  (QREFELT $ 30)))
                . #4#)
          (SEQ (LETT |i| 2 . #4#) (LETT #2# (QREFELT $ 6) . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |p| (QUOTIENT2 |p| N) . #4#)
                    (EXIT
                     (LETT L
                           (CONS
                            (SPADCALL
                             (PROG1 (LETT #1# (+ (REM |p| N) 1) . #4#)
                               (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                                #1#))
                             (QREFELT $ 30))
                            L)
                           . #4#)))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL L (QREFELT $ 31))))))) 

(DEFUN |DIRPROD;random;$;12| ($)
  (PROG (#1=#:G177 #2=#:G179 |i| #3=#:G178)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DIRPROD;random;$;12|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 33)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |DIRPROD;lookup;$Pi;13| (|x| $)
  (PROG (#1=#:G181 L #2=#:G184 |i| N)
    (RETURN
     (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #3=(|DIRPROD;lookup;$Pi;13|))
          (LETT L
                (- (SPADCALL (SPADCALL |x| 1 (QREFELT $ 20)) (QREFELT $ 36)) 1)
                . #3#)
          (SEQ (LETT |i| 2 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT L
                       (-
                        (+ (* L N)
                           (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                     (QREFELT $ 36)))
                        1)
                       . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROG1 (LETT #1# (+ L 1) . #3#)
             (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DEFUN |DIRPROD;+;3$;14| (|u| |v| $)
  (SPADCALL (ELT $ 38) |u| |v| (QREFELT $ 40))) 

(DEFUN |DIRPROD;Zero;$;15| ($) (SPADCALL (QREFELT $ 6) (QREFELT $ 42))) 

(DEFUN |DIRPROD;One;$;16| ($) (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 44))) 

(DEFUN |DIRPROD;*;$R$;17| (|u| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRPROD;*;$R$;17!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 47))))) 

(DEFUN |DIRPROD;*;$R$;17!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|DIRPROD;*;$R$;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 45)))))) 

(DEFUN |DIRPROD;*;R2$;18| (|r| |u| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRPROD;*;R2$;18!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 47))))) 

(DEFUN |DIRPROD;*;R2$;18!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|DIRPROD;*;R2$;18|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r| |x| (QREFELT $ 45)))))) 

(DEFUN |DIRPROD;*;3$;19| (|x| |y| $)
  (PROG (#1=#:G196 #2=#:G198 |i| #3=#:G197)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DIRPROD;*;3$;19|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                (SPADCALL |y| |i| (QREFELT $ 20))
                                (QREFELT $ 45)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |DIRPROD;subtractIfCan;2$U;20| (|u| |v| $)
  (PROG (#1=#:G208 |c| #2=#:G209 |i| |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 51))
              . #3=(|DIRPROD;subtractIfCan;2$U;20|))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (LETT |c|
                    (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                              (QREFELT $ 53))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |c| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |w|))))
      #1# (EXIT #1#))))) 

(DEFUN |DIRPROD;*;3$;21| (|u| |v| $)
  (SPADCALL (ELT $ 45) |u| |v| (QREFELT $ 40))) 

(DEFUN |DIRPROD;recip;$U;22| (|z| $)
  (PROG (#1=#:G222 |u| #2=#:G223 |i| |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 51))
              . #3=(|DIRPROD;recip;$U;22|))
        (SEQ (LETT |i| (SPADCALL |w| (QREFELT $ 19)) . #3#)
             (LETT #2# (SPADCALL |w| (QREFELT $ 55)) . #3#) G190
             (COND ((> |i| #2#) (GO G191)))
             (SEQ
              (LETT |u|
                    (SPADCALL (SPADCALL |z| |i| (QREFELT $ 56)) (QREFELT $ 57))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
             (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |w|))))
      #1# (EXIT #1#))))) 

(DEFUN |DIRPROD;unitVector;Pi$;23| (|i| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 51))
            |DIRPROD;unitVector;Pi$;23|)
      (SPADCALL |v| |i| (|spadConstant| $ 44) (QREFELT $ 59)) (EXIT |v|))))) 

(DEFUN |DIRPROD;<;2$B;24| (|x| |y| $)
  (PROG (#1=#:G226 #2=#:G230 |b| |a| #3=#:G231 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;24|))
             (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                  (LETT |b| (QREFELT |y| |i|) . #4#)
                  (EXIT
                   (COND
                    ((QLESSP |a| |b|) (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((QLESSP |b| |a|)
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#))
                                . #4#)
                          (GO #1#)))))
                      #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;<;2$B;25| (|x| |y| $)
  (PROG (#1=#:G232 #2=#:G236 |b| |a| #3=#:G237 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;25|))
             (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                  (LETT |b| (QREFELT |y| |i|) . #4#)
                  (EXIT
                   (COND
                    ((QLESSP |a| |b|) (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                    ('T
                     (SEQ
                      (EXIT
                       (COND
                        ((QLESSP |b| |a|)
                         (PROGN
                          (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#))
                                . #4#)
                          (GO #1#)))))
                      #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;<;2$B;26| (|x| |y| $)
  (PROG (#1=#:G238 #2=#:G242 #3=#:G243 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #4=(|DIRPROD;<;2$B;26|))
             (LETT #3# (QREFELT $ 6) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 56))
                           (SPADCALL |y| |i| (QREFELT $ 56)) (QREFELT $ 62))
                 (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 56))
                               (SPADCALL |y| |i| (QREFELT $ 56))
                               (QREFELT $ 63))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;sup;3$;27| (|x| |y| $)
  (SPADCALL (ELT $ 64) |x| |y| (QREFELT $ 40))) 

(DEFUN |DirectProduct| (&REST #1=#:G261)
  (PROG ()
    (RETURN
     (PROG (#2=#:G262)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DirectProduct|)
                                           '|domainEqualList|)
                . #3=(|DirectProduct|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|))))))))))) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G255 #2=#:G256 #3=#:G257 #4=#:G258 #5=#:G259 #6=#:G260 $
         |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|DirectProduct|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2) . #7#)
      (LETT $ (GETREFV 89) . #7#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST (|HasCategory| |#2| '(|Field|))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|))
                                               (LETT #6#
                                                     (|HasCategory| |#2|
                                                                    '(|OrderedRing|))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#)
                                               (|HasCategory| |#2| '(|Monoid|))
                                               (|HasCategory| |#2|
                                                              '(|unitsKnown|))
                                               (LETT #5#
                                                     (|HasCategory| |#2|
                                                                    '(|CommutativeRing|))
                                                     . #7#)
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|))
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                               (OR #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (|HasCategory| |#2| '(|Finite|))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitRingOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (LETT #4#
                                                     (|HasCategory| |#2|
                                                                    '(|DifferentialRing|))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))
                                               (|HasCategory| |#2|
                                                              '(|BasicType|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               (LIST
                                                                '|Evalable|
                                                                (|devaluate|
                                                                 |#2|)))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (AND #4#
                                                    (|HasCategory| |#2|
                                                                   '(|Ring|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|)))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|)))
                                               (LETT #3#
                                                     (|HasCategory| |#2|
                                                                    '(|AbelianSemiGroup|))
                                                     . #7#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|SetCategory|))))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|BasicType|))
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               '(|Monoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#
                                                (|HasCategory| |#2| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                (|HasCategory| |#2|
                                                               '(|Finite|))
                                                (|HasCategory| |#2|
                                                               '(|Monoid|))
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                #6#
                                                (|HasCategory| |#2| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|SetCategory|)))
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|LinearlyExplicitRingOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#2|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                #3#
                                                (|HasCategory| |#2|
                                                               '(|CancellationAbelianMonoid|))
                                                #5# #4#
                                                (|HasCategory| |#2| '(|Field|))
                                                (|HasCategory| |#2| '(|Ring|)))
                                               (|HasCategory| |#2|
                                                              '(|CoercibleTo|
                                                                (|OutputForm|)))
                                               (LETT #2#
                                                     (AND
                                                      (|HasCategory| |#2|
                                                                     '(|RetractableTo|
                                                                       (|Integer|)))
                                                      (|HasCategory| |#2|
                                                                     '(|SetCategory|)))
                                                     . #7#)
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                #2#)
                                               (OR #2#
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                               (LETT #1#
                                                     (AND
                                                      (|HasCategory| |#2|
                                                                     '(|RetractableTo|
                                                                       (|Fraction|
                                                                        (|Integer|))))
                                                      (|HasCategory| |#2|
                                                                     '(|SetCategory|)))
                                                     . #7#)
                                               (OR
                                                (|HasCategory| |#2|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                (LIST
                                                                 '|Evalable|
                                                                 (|devaluate|
                                                                  |#2|)))
                                                 (|HasCategory| |#2|
                                                                '(|SetCategory|)))
                                                #1# #2#
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianGroup|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|AbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|))
                                                 (|HasCategory| |#2|
                                                                '(|Field|))))
                                               (OR
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|LinearlyExplicitRingOver|
                                                                  (|Integer|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|PartialDifferentialRing|
                                                                  (|Symbol|)))
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|)))))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #3#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|CancellationAbelianMonoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #5#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #4#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Finite|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Monoid|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|)))
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 #6#)
                                                (AND
                                                 (|HasCategory| |#2|
                                                                '(|RetractableTo|
                                                                  (|Fraction|
                                                                   (|Integer|))))
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                                #1#)))
                      . #7#))
      (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 549755813888))
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 1099511627776))
      (AND (|HasCategory| |#2| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 2199023255552))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 4398046511104))
      (AND
       (OR
        (AND (|HasCategory| |#2| '(|BasicType|))
             (|HasCategory| $ '(|finiteAggregate|)))
        (|HasCategory| |#2| '(|SetCategory|)))
       (|augmentPredVector| $ 8796093022208))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|Vector| |#2|))
      (COND
       ((|testBitVector| |pv$| 18)
        (PROGN
         (COND
          ((|domainEqual| |#2| (|NonNegativeInteger|))
           (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;6|) $)))
          ((|domainEqual| |#2| (|Integer|))
           (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;7|) $)))
          ('T (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;8|) $))))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |DIRPROD;retract;$R;9|) $))
         (QSETREFV $ 27
                   (CONS (|dispatchFunction| |DIRPROD;retractIfCan;$U;10|)
                         $)))))
      (COND
       ((|testBitVector| |pv$| 12)
        (PROGN
         (QSETREFV $ 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi$;11|) $))
         (QSETREFV $ 34 (CONS (|dispatchFunction| |DIRPROD;random;$;12|) $))
         (QSETREFV $ 37
                   (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;13|) $)))))
      (COND
       ((|testBitVector| |pv$| 28)
        (QSETREFV $ 41 (CONS (|dispatchFunction| |DIRPROD;+;3$;14|) $))))
      (COND
       ((|HasCategory| |#2| '(|AbelianMonoid|))
        (QSETREFV $ 43
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |DIRPROD;Zero;$;15|) $
                              43)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 35
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |DIRPROD;One;$;16|) $ 35)))
         (QSETREFV $ 48 (CONS (|dispatchFunction| |DIRPROD;*;$R$;17|) $))
         (QSETREFV $ 49 (CONS (|dispatchFunction| |DIRPROD;*;R2$;18|) $))
         (QSETREFV $ 50 (CONS (|dispatchFunction| |DIRPROD;*;3$;19|) $)))))
      (COND
       ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;20|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 50 (CONS (|dispatchFunction| |DIRPROD;*;3$;21|) $))
         (QSETREFV $ 58 (CONS (|dispatchFunction| |DIRPROD;recip;$U;22|) $))
         (QSETREFV $ 60
                   (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;23|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|OrderedSet|))
        (COND
         ((|domainEqual| |#2| (|NonNegativeInteger|))
          (QSETREFV $ 61 (CONS (|dispatchFunction| |DIRPROD;<;2$B;24|) $)))
         ((|domainEqual| |#2| (|Integer|))
          (QSETREFV $ 61 (CONS (|dispatchFunction| |DIRPROD;<;2$B;25|) $)))
         ('T
          (QSETREFV $ 61 (CONS (|dispatchFunction| |DIRPROD;<;2$B;26|) $))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 65 (CONS (|dispatchFunction| |DIRPROD;sup;3$;27|) $))))
      $)))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;$V;1| |DIRPROD;coerce;R$;2|
              (|List| 7) |DIRPROD;parts;$L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V$;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |size|)
              (|PositiveInteger|) (54 . |index|) (59 . |vector|) (64 . |index|)
              (69 . |random|) (73 . |random|) (77 . |One|) (81 . |lookup|)
              (86 . |lookup|) (91 . +) (|Mapping| 7 7 7) (97 . |map|) (104 . +)
              (110 . |zero|) (115 . |Zero|) (119 . |One|) (123 . *)
              (|Mapping| 7 7) (129 . |map|) (135 . *) (141 . *) (147 . *)
              (153 . |Zero|) (|Union| $ '"failed") (157 . |subtractIfCan|)
              (163 . |subtractIfCan|) (169 . |maxIndex|) (174 . |qelt|)
              (180 . |recip|) (185 . |recip|) (190 . |setelt|)
              (197 . |unitVector|) (202 . <) (208 . <) (214 . >) (220 . |sup|)
              (226 . |sup|) (|Equation| 7) (|List| 66)
              (|Record| (|:| |mat| 71) (|:| |vec| (|Vector| 18))) (|Matrix| $)
              (|Vector| $) (|Matrix| 18) (|Symbol|) (|List| 72) (|List| 15)
              (|Union| 76 '#1="failed") (|Fraction| 18) (|Union| 18 '#1#)
              (|Void|) (|OutputForm|) (|CardinalNumber|) (|InputForm|)
              (|List| $) (|Matrix| 7) (|Record| (|:| |mat| 83) (|:| |vec| 5))
              (|HashState|) (|SingleInteger|) (|String|) (|List| 18))
           '#(~= 232 |zero?| 238 |unitVector| 243 |swap!| 248 |sup| 255
              |subtractIfCan| 261 |smaller?| 267 |size?| 273 |size| 279 |sign|
              283 |setelt| 288 |sample| 295 |retractIfCan| 299 |retract| 314
              |reducedSystem| 329 |recip| 351 |random| 356 |qsetelt!| 360
              |qelt| 367 |positive?| 373 |parts| 378 |one?| 383 |negative?| 388
              |more?| 393 |minIndex| 399 |min| 404 |members| 410 |member?| 415
              |maxIndex| 421 |max| 426 |map!| 432 |map| 438 |lookup| 444
              |less?| 449 |latex| 455 |indices| 460 |index?| 465 |index| 471
              |hashUpdate!| 476 |hash| 482 |first| 487 |fill!| 492 |every?| 498
              |eval| 504 |eq?| 530 |enumerate| 536 |entry?| 540 |entries| 546
              |empty?| 551 |empty| 556 |elt| 560 |dot| 573 |directProduct| 579
              |dimension| 584 |differentiate| 588 |count| 638 |copy| 650
              |convert| 655 |coerce| 660 |characteristic| 685 |any?| 689 |abs|
              695 ^ 700 |Zero| 712 |One| 716 D 720 >= 770 > 776 = 782 <= 788 <
              794 / 800 - 806 + 817 * 823 |#| 859)
           'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 1 8 2 2 10 4 8 2 13 14 15 9 3 4 8 17 9 2 5
                                  11 8 17 5 17 5 2 16 0 5 2 6 16 0 5 6 12 32 0
                                  0 29 31 18 0 0 0 0 29 38 5 7 8 12 30 18 39
                                  35))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |DifferentialExtension&|
                |Module&| |OrderedRing&| NIL NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL
                NIL NIL |AbelianGroup&| NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| NIL |Monoid&| |AbelianMonoid&|
                |HomogeneousAggregate&| NIL |SemiGroup&| |Finite&|
                |AbelianSemiGroup&| |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |FullyRetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|VectorSpace| 7) (|Algebra| 7)
                 (|FullyLinearlyExplicitRingOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7) (|OrderedRing|)
                 (|CommutativeRing|) (|LinearlyExplicitRingOver| 7)
                 (|LinearlyExplicitRingOver| 18) (|PartialDifferentialRing| 72)
                 (|DifferentialRing|) (|BiModule| 7 7)
                 (|OrderedAbelianMonoidSup|) (|OrderedAbelianGroup|)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 18 7)
                 (|OrderedSet|) (|SemiRng|) (|Monoid|) (|AbelianMonoid|)
                 (|HomogeneousAggregate| 7) (|Comparable|) (|SemiGroup|)
                 (|Finite|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 18 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 18 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 79) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 81)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 76)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 88
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 0 0 0 35 1 7 29 0 36 1 0 29 0 37 2 7
                                    0 0 0 38 3 8 0 39 0 0 40 2 0 0 0 0 41 1 5 0
                                    15 42 0 0 0 43 0 7 0 44 2 7 0 0 0 45 2 0 0
                                    46 0 47 2 0 0 0 7 48 2 0 0 7 0 49 2 0 0 0 0
                                    50 0 7 0 51 2 7 52 0 0 53 2 0 52 0 0 54 1 0
                                    18 0 55 2 0 7 0 18 56 1 7 52 0 57 1 0 52 0
                                    58 3 8 7 0 18 7 59 1 0 0 29 60 2 0 14 0 0
                                    61 2 7 14 0 0 62 2 7 14 0 0 63 2 7 0 0 0 64
                                    2 0 0 0 0 65 2 44 14 0 0 1 1 27 14 0 1 1 2
                                    0 29 60 3 43 78 0 18 18 1 2 3 0 0 0 65 2 26
                                    52 0 0 54 2 5 14 0 0 1 2 0 14 0 15 16 0 12
                                    15 1 1 4 18 0 1 3 43 7 0 18 7 1 0 0 0 1 1
                                    37 75 0 1 1 34 77 0 1 1 18 26 0 27 1 37 76
                                    0 1 1 34 18 0 1 1 18 7 0 25 2 22 68 69 70 1
                                    1 22 71 69 1 1 2 83 69 1 2 2 84 69 70 1 1 6
                                    52 0 58 0 12 0 34 3 43 7 0 18 7 1 2 0 7 0
                                    18 56 1 4 14 0 1 1 40 12 0 13 1 6 14 0 1 1
                                    4 14 0 1 2 0 14 0 15 1 1 21 18 0 19 2 5 0 0
                                    0 1 1 40 12 0 1 2 41 14 7 0 1 1 21 18 0 55
                                    2 5 0 0 0 1 2 43 0 46 0 1 2 0 0 46 0 47 1
                                    12 29 0 37 2 0 14 0 15 1 1 18 87 0 1 1 0 88
                                    0 1 2 0 14 18 0 1 1 12 0 29 32 2 18 85 85 0
                                    1 1 18 86 0 1 1 21 7 0 1 2 43 0 0 7 1 2 40
                                    14 22 0 23 3 20 0 0 12 12 1 2 20 0 0 66 1 3
                                    20 0 0 7 7 1 2 20 0 0 67 1 2 0 14 0 0 1 0
                                    12 82 1 2 42 14 7 0 1 1 0 12 0 1 1 0 14 0 1
                                    0 0 0 1 2 0 7 0 18 20 3 0 7 0 18 7 1 2 2 7
                                    0 0 1 1 0 0 5 17 0 1 80 1 2 23 0 0 15 1 1
                                    23 0 0 1 3 24 0 0 72 15 1 3 24 0 0 73 74 1
                                    2 24 0 0 73 1 2 24 0 0 72 1 2 2 0 0 46 1 3
                                    2 0 0 46 15 1 2 41 15 7 0 1 2 40 15 22 0 1
                                    1 0 0 0 1 1 12 81 0 1 1 37 0 76 1 1 36 0 18
                                    1 1 33 79 0 1 1 18 0 7 11 1 0 5 0 10 0 2 15
                                    1 2 40 14 22 0 1 1 4 0 0 1 2 6 0 0 29 1 2 6
                                    0 0 15 1 0 27 0 43 0 6 0 35 2 23 0 0 15 1 1
                                    23 0 0 1 3 24 0 0 72 15 1 3 24 0 0 73 74 1
                                    2 24 0 0 72 1 2 24 0 0 73 1 2 2 0 0 46 1 3
                                    2 0 0 46 15 1 2 5 14 0 0 1 2 5 14 0 0 1 2
                                    44 14 0 0 24 2 5 14 0 0 1 2 5 14 0 0 61 2 1
                                    0 0 7 1 2 25 0 0 0 1 1 25 0 0 1 2 28 0 0 0
                                    41 2 25 0 18 0 1 2 27 0 15 0 1 2 28 0 29 0
                                    1 2 6 0 7 0 49 2 6 0 0 7 48 2 6 0 0 0 50 1
                                    40 15 0 1)))))
           '|lookupComplete|)) 
