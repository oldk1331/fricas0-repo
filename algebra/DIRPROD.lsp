
(SDEFUN |DIRPROD;coerce;$V;1| ((|z| $) ($ |Vector| R))
        (SPADCALL |z| (QREFELT $ 9))) 

(SDEFUN |DIRPROD;coerce;R$;2| ((|r| R) ($ $)) (MAKEARR1 (QREFELT $ 6) |r|)) 

(PUT '|DIRPROD;parts;$L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;$L;3| ((|x| $) ($ |List| R)) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V$;4| ((|z| |Vector| R) ($ $))
        (COND
         ((SPADCALL |z| (QREFELT $ 6) (QREFELT $ 16))
          (SPADCALL |z| (QREFELT $ 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| $) ($ |Boolean|))
        (SPROG NIL
               (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR $ |z|)) |z|
                         (QREFELT $ 23)))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z| $)
          (LETT |z| (QREFELT $$ 1) . #1=(|DIRPROD;same?|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19))
                                (QREFELT $ 20))
                      (QREFELT $ 21)))))) 

(SDEFUN |DIRPROD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G124 NIL) (#2=#:G125 NIL) (#3=#:G126 NIL) (|i| NIL))
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
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G123))
                                    . #4#)
                              (GO #6=#:G121))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G131 NIL) (#2=#:G132 NIL) (#3=#:G133 NIL) (|i| NIL))
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
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G130))
                                    . #4#)
                              (GO #6=#:G128))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G138 NIL) (#2=#:G139 NIL) (#3=#:G140 NIL) (|i| NIL))
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
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G137))
                                    . #4#)
                              (GO #6=#:G135))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;$R;9| ((|z| $) ($ R))
        (COND
         ((|DIRPROD;same?| |z| $)
          (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20)))
         ('T (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;$U;10| ((|z| $) ($ |Union| R "failed"))
        (COND
         ((|DIRPROD;same?| |z| $)
          (CONS 0 (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi$;11| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((L (|List| R)) (#1=#:G152 NIL) (|p| (|Integer|)) (#2=#:G157 NIL)
          (|i| NIL) (#3=#:G151 NIL) (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #4=(|DIRPROD;index;Pi$;11|))
              (LETT |p| (- |n| 1) . #4#)
              (LETT L
                    (LIST
                     (SPADCALL
                      (PROG1 (LETT #3# (+ (REM |p| N) 1) . #4#)
                        (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                          '(|Integer|) #3#))
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
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 30))
                                L)
                               . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL L (QREFELT $ 31)))))) 

(SDEFUN |DIRPROD;random;$;12| (($ $))
        (SPROG ((#1=#:G160 NIL) (#2=#:G162 NIL) (|i| NIL) (#3=#:G161 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6))
                       . #5=(|DIRPROD;random;$;12|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 33)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DIRPROD;lookup;$Pi;13| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G164 NIL) (L (|Integer|)) (#2=#:G167 NIL) (|i| NIL)
          (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #3=(|DIRPROD;lookup;$Pi;13|))
              (LETT L
                    (-
                     (SPADCALL (SPADCALL |x| 1 (QREFELT $ 20)) (QREFELT $ 35))
                     1)
                    . #3#)
              (SEQ (LETT |i| 2 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT L
                           (-
                            (+ (* L N)
                               (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                         (QREFELT $ 35)))
                            1)
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (+ L 1) . #3#)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))))) 

(SDEFUN |DIRPROD;Zero;$;14| (($ $)) (SPADCALL (QREFELT $ 6) (QREFELT $ 37))) 

(SDEFUN |DIRPROD;*;3$;15| ((|u| $) (|v| $) ($ $))
        (SPADCALL (ELT $ 39) |u| |v| (QREFELT $ 41))) 

(SDEFUN |DIRPROD;subtractIfCan;2$U;16| ((|u| $) (|v| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G182 NIL) (|c| (|Union| R "failed")) (#2=#:G183 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                  . #3=(|DIRPROD;subtractIfCan;2$U;16|))
            (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |c|
                        (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                  (QREFELT $ 45))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |c| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #4=#:G181)))
                    ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;One;$;17| (($ $))
        (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))) 

(SDEFUN |DIRPROD;recip;$U;18| ((|z| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G195 NIL) (|u| (|Union| R #1#)) (#3=#:G196 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))
                  . #4=(|DIRPROD;recip;$U;18|))
            (SEQ (LETT |i| (SPADCALL |w| (QREFELT $ 19)) . #4#)
                 (LETT #3# (SPADCALL |w| (QREFELT $ 49)) . #4#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (LETT |u|
                        (SPADCALL (SPADCALL |z| |i| (QREFELT $ 50))
                                  (QREFELT $ 51))
                        . #4#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #5=#:G194)))
                    ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                 (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;unitVector;Pi$;19| ((|i| |PositiveInteger|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ
                (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                      |DIRPROD;unitVector;Pi$;19|)
                (SPADCALL |v| |i| (|spadConstant| $ 47) (QREFELT $ 53))
                (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2$B;20| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G204 NIL) (#2=#:G205 NIL) (|b| (R)) (|a| (R)) (#3=#:G206 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;20|))
                 (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                      (LETT |b| (QREFELT |y| |i|) . #4#)
                      (EXIT
                       (COND
                        ((QLESSP |a| |b|)
                         (PROGN (LETT #2# 'T . #4#) (GO #5=#:G203)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((QLESSP |b| |a|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                    . #4#)
                              (GO #6=#:G199)))))
                          #6# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G212 NIL) (#2=#:G213 NIL) (|b| (R)) (|a| (R)) (#3=#:G214 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;21|))
                 (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                      (LETT |b| (QREFELT |y| |i|) . #4#)
                      (EXIT
                       (COND
                        ((QLESSP |a| |b|)
                         (PROGN (LETT #2# 'T . #4#) (GO #5=#:G211)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((QLESSP |b| |a|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                    . #4#)
                              (GO #6=#:G207)))))
                          #6# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G220 NIL) (#2=#:G221 NIL) (#3=#:G222 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1 . #4=(|DIRPROD;<;2$B;22|))
                       (LETT #3# (QREFELT $ 6) . #4#) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 50))
                                     (SPADCALL |y| |i| (QREFELT $ 50))
                                     (QREFELT $ 56))
                           (PROGN (LETT #2# 'T . #4#) (GO #5=#:G219)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 50))
                                         (SPADCALL |y| |i| (QREFELT $ 50))
                                         (QREFELT $ 57))
                               (PROGN
                                (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                      . #4#)
                                (GO #6=#:G215)))))
                            #6# (EXIT #1#))))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;sup;3$;23| ((|x| $) (|y| $) ($ $))
        (SPADCALL (ELT $ 58) |x| |y| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct| (&REST #1=#:G245)
  (SPROG NIL
         (PROG (#2=#:G246)
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
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G235 NIL) (#2=#:G236 NIL) (#3=#:G237 NIL) (#4=#:G238 NIL)
    (#5=#:G239 NIL) (#6=#:G240 NIL) (#7=#:G241 NIL) (#8=#:G242 NIL)
    (#9=#:G243 NIL) (#10=#:G244 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #11=(|DirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #11#)
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2) . #11#)
    (LETT $ (GETREFV 84) . #11#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2| '(|SemiRng|))
                                             (|HasCategory| |#2|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #10#
                                                   (|HasCategory| |#2|
                                                                  '(|OrderedRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#)
                                             (|HasCategory| |#2| '(|Ring|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (|HasCategory| |#2|
                                                            '(|unitsKnown|))
                                             (LETT #9#
                                                   (|HasCategory| |#2|
                                                                  '(|CommutativeRing|))
                                                   . #11#)
                                             (OR #9#
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (OR #9#
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                             (LETT #8#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|))
                                                   . #11#)
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #10#)
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #7#
                                                   (|HasCategory| |#2|
                                                                  '(|DifferentialRing|))
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #9# #7# #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #9# #7# #10#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (|HasCategory| |#2|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#2|)))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #7#
                                                  (|HasCategory| |#2|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #6#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianMonoid|))
                                                   . #11#)
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|Monoid|)))
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|SemiRng|)))
                                             (LETT #5#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianGroup|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#2|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #11#)
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              #6# #4#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              #4#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (LETT #3#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiGroup|))
                                                   . #11#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2| '(|Monoid|))
                                              #3#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6#
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #8#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #6# #4# #9# #7#
                                              (|HasCategory| |#2| '(|Field|))
                                              #8#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #10#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR #6#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
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
                                                   . #11#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|)))
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
                                                              '(|SemiRng|)))
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
                                                   . #11#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|))
                                                   (|HasCategory| |#2|
                                                                  '(|Ring|)))
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|)))
                                              (AND #6#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                              (AND #6#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #8#)
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
                                               #10#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|)))
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
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #11#))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 140737488355328))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #6#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (AND #5# (|HasCategory| |#2| '(|Field|)))
         (AND #5# (|HasCategory| |#2| '(|SemiRng|))) #4#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #5# (|HasCategory| |#2| '(|Field|)))
         (AND #5# (|HasCategory| |#2| '(|SemiRng|)))
         (|HasCategory| |#2| '(|Ring|))
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| $ 9007199254740992))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 19)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;6|) $)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;7|) $)))
        ('T (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;8|) $))))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |DIRPROD;retract;$R;9|) $))
       (QSETREFV $ 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;$U;10|) $)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV $ 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi$;11|) $))
       (QSETREFV $ 34 (CONS (|dispatchFunction| |DIRPROD;random;$;12|) $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;13|) $)))))
    (COND
     ((|testBitVector| |pv$| 26)
      (QSETREFV $ 38
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;Zero;$;14|) $ 38)))))
    (COND
     ((|testBitVector| |pv$| 35)
      (QSETREFV $ 42 (CONS (|dispatchFunction| |DIRPROD;*;3$;15|) $))))
    (COND
     ((|testBitVector| |pv$| 31)
      (QSETREFV $ 46
                (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;16|) $))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 48
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;One;$;17|) $ 48)))
       (QSETREFV $ 52 (CONS (|dispatchFunction| |DIRPROD;recip;$U;18|) $)))))
    (COND
     ((|testBitVector| |pv$| 26)
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;19|)
                        $))))))
    (COND
     ((|HasCategory| |#2| '(|OrderedSet|))
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;20|) $)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;21|) $)))
       ('T (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;22|) $))))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 59 (CONS (|dispatchFunction| |DIRPROD;sup;3$;23|) $))))
    $))) 

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
              (69 . |random|) (73 . |random|) (77 . |lookup|) (82 . |lookup|)
              (87 . |zero|) (92 . |Zero|) (96 . *) (|Mapping| 7 7 7)
              (102 . |map|) (109 . *) (115 . |Zero|) (|Union| $ '"failed")
              (119 . |subtractIfCan|) (125 . |subtractIfCan|) (131 . |One|)
              (135 . |One|) (139 . |maxIndex|) (144 . |qelt|) (150 . |recip|)
              (155 . |recip|) (160 . |setelt!|) (167 . |unitVector|) (172 . <)
              (178 . <) (184 . >) (190 . |sup|) (196 . |sup|) (|List| 61)
              (|Equation| 7) (|Matrix| 18) (|Matrix| $)
              (|Record| (|:| |mat| 62) (|:| |vec| (|Vector| 18))) (|Vector| $)
              (|Symbol|) (|List| 66) (|List| 15) (|Union| 70 '#1="failed")
              (|Fraction| 18) (|Union| 18 '#1#) (|Void|) (|Mapping| 7 7)
              (|OutputForm|) (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 79) (|:| |vec| 5)) (|Matrix| 7)
              (|SingleInteger|) (|String|) (|HashState|) (|List| 18))
           '#(~= 202 |zero?| 208 |unitVector| 213 |swap!| 218 |sup| 225
              |subtractIfCan| 231 |smaller?| 237 |size?| 243 |size| 249 |sign|
              253 |setelt!| 258 |sample| 265 |rightRecip| 269 |rightPower| 274
              |retractIfCan| 286 |retract| 301 |reducedSystem| 316 |recip| 338
              |random| 343 |qsetelt!| 347 |qelt| 354 |positive?| 360 |parts|
              365 |opposite?| 370 |one?| 376 |negative?| 381 |more?| 386
              |minIndex| 392 |min| 397 |members| 403 |member?| 408 |maxIndex|
              414 |max| 419 |map!| 425 |map| 431 |lookup| 437 |less?| 442
              |leftRecip| 448 |leftPower| 453 |latex| 465 |indices| 470
              |index?| 475 |index| 481 |hashUpdate!| 486 |hash| 492 |first| 497
              |fill!| 502 |every?| 508 |eval| 514 |eq?| 540 |enumerate| 546
              |entry?| 550 |entries| 556 |empty?| 561 |empty| 566 |elt| 570
              |dot| 583 |directProduct| 589 |dimension| 594 |differentiate| 598
              |count| 648 |copy| 660 |convert| 665 |commutator| 670 |coerce|
              676 |characteristic| 701 |associator| 705 |any?| 712
              |antiCommutator| 718 |annihilate?| 724 |abs| 730 ^ 735 |Zero| 747
              |One| 751 D 755 >= 805 > 811 = 817 <= 823 < 829 / 835 - 841 + 852
              * 858 |#| 894)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 4 6 6 4 9 9 6 14 15 16 18 1 6 18 11 2 10 3
                                  4 2 6 10 2 5 2 2 18 30 5 33 5 6 7 0 32 5 7 12
                                  37 17 0 13 37 34 0 0 36 39 19 0 0 0 0 36 46 5
                                  8 9 12 38 19 47 43))
            (CONS
             '#(|DirectProductCategory&| |OrderedRing&|
                |FullyLinearlyExplicitOver&| |DifferentialExtension&| NIL NIL
                |Algebra&| NIL NIL |PartialDifferentialRing&|
                |DifferentialRing&| NIL |VectorSpace&| NIL |Rng&| |Module&| NIL
                NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL NIL NIL
                |IndexedAggregate&| |AbelianMonoid&| |OrderedSet&|
                |MagmaWithUnit&| |Finite&| NIL |NonAssociativeSemiRng&|
                |HomogeneousAggregate&| NIL |Magma&| |AbelianSemiGroup&|
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&|
                |FullyRetractableTo&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|OrderedRing|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|CharacteristicZero|) (|CommutativeRing|) (|Algebra| 7)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 18)
                 (|PartialDifferentialRing| 66) (|DifferentialRing|) (|Ring|)
                 (|VectorSpace| 7) (|SemiRing|) (|Rng|) (|Module| 7)
                 (|SemiRng|) (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|IndexedAggregate| 18 7) (|AbelianMonoid|)
                 (|OrderedSet|) (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 18 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 18 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 74) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 76)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 70)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 83
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 1 7 29 0 35 1 0 29 0 36 1 5 0 15 37
                                    0 0 0 38 2 7 0 0 0 39 3 8 0 40 0 0 41 2 0 0
                                    0 0 42 0 7 0 43 2 7 44 0 0 45 2 0 44 0 0 46
                                    0 7 0 47 0 0 0 48 1 0 18 0 49 2 0 7 0 18 50
                                    1 7 44 0 51 1 0 44 0 52 3 8 7 0 18 7 53 1 0
                                    0 29 54 2 0 14 0 0 55 2 7 14 0 0 56 2 7 14
                                    0 0 57 2 7 0 0 0 58 2 0 0 0 0 59 2 54 14 0
                                    0 1 1 51 14 0 1 1 27 0 29 54 3 50 72 0 18
                                    18 1 2 3 0 0 0 59 2 52 44 0 0 46 2 13 14 0
                                    0 1 2 0 14 0 15 16 0 12 15 1 1 4 18 0 1 3
                                    50 7 0 18 7 1 0 0 0 1 1 7 44 0 1 2 7 0 0 15
                                    1 2 35 0 0 29 1 1 45 69 0 1 1 42 71 0 1 1
                                    19 26 0 27 1 45 70 0 1 1 42 18 0 1 1 19 7 0
                                    25 1 23 62 63 1 2 23 64 63 65 1 2 6 78 63
                                    65 1 1 6 79 63 1 1 7 44 0 52 0 12 0 34 3 50
                                    7 0 18 7 1 2 0 7 0 18 50 1 4 14 0 1 1 48 12
                                    0 13 2 51 14 0 0 1 1 7 14 0 1 1 4 14 0 1 2
                                    0 14 0 15 1 1 22 18 0 19 2 5 0 0 0 1 1 48
                                    12 0 1 2 49 14 7 0 1 1 22 18 0 49 2 5 0 0 0
                                    1 2 50 0 73 0 1 2 0 0 73 0 1 1 12 29 0 36 2
                                    0 14 0 15 1 1 7 44 0 1 2 7 0 0 15 1 2 35 0
                                    0 29 1 1 19 81 0 1 1 0 83 0 1 2 0 14 18 0 1
                                    1 12 0 29 32 2 19 82 82 0 1 1 19 80 0 1 1
                                    22 7 0 1 2 50 0 0 7 1 2 48 14 22 0 23 3 20
                                    0 0 7 7 1 3 20 0 0 12 12 1 2 20 0 0 60 1 2
                                    20 0 0 61 1 2 0 14 0 0 1 0 12 77 1 2 49 14
                                    7 0 1 1 0 12 0 1 1 0 14 0 1 0 0 0 1 2 0 7 0
                                    18 20 3 0 7 0 18 7 1 2 28 7 0 0 1 1 0 0 5
                                    17 0 1 75 1 2 24 0 0 15 1 1 24 0 0 1 3 25 0
                                    0 66 15 1 3 25 0 0 67 68 1 2 25 0 0 66 1 2
                                    25 0 0 67 1 3 6 0 0 73 15 1 2 6 0 0 73 1 2
                                    49 15 7 0 1 2 48 15 22 0 1 1 0 0 0 1 1 12
                                    76 0 1 2 6 0 0 0 1 1 45 0 70 1 1 44 0 18 1
                                    1 41 74 0 1 1 19 0 7 11 1 0 5 0 10 0 6 15 1
                                    3 6 0 0 0 0 1 2 48 14 22 0 1 2 2 0 0 0 1 2
                                    6 14 0 0 1 1 4 0 0 1 2 7 0 0 15 1 2 35 0 0
                                    29 1 0 51 0 38 0 7 0 48 2 24 0 0 15 1 1 24
                                    0 0 1 3 25 0 0 66 15 1 3 25 0 0 67 68 1 2
                                    25 0 0 66 1 2 25 0 0 67 1 3 6 0 0 73 15 1 2
                                    6 0 0 73 1 2 5 14 0 0 1 2 5 14 0 0 1 2 54
                                    14 0 0 24 2 5 14 0 0 1 2 5 14 0 0 55 2 1 0
                                    0 7 1 1 53 0 0 1 2 53 0 0 0 1 2 40 0 0 0 1
                                    2 53 0 18 0 1 2 51 0 15 0 1 2 40 0 29 0 1 2
                                    35 0 0 0 42 2 35 0 7 0 1 2 35 0 0 7 1 1 48
                                    15 0 1)))))
           '|lookupComplete|)) 
