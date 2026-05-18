
(SDEFUN |DIRPROD;coerce;%V;1| ((|z| (%)) (% (|Vector| R)))
        (SPADCALL |z| (QREFELT % 9))) 

(SDEFUN |DIRPROD;coerce;R%;2| ((|r| (R)) (% (%))) (MAKEARR1 (QREFELT % 6) |r|)) 

(MAKEPROP '|DIRPROD;parts;%L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;%L;3| ((|x| (%)) (% (|List| R))) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V%;4| ((|z| (|Vector| R)) (% (%)))
        (COND
         ((SPADCALL |z| (QREFELT % 6) (QREFELT % 16))
          (SPADCALL |z| (QREFELT % 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| (%)) (% (|Boolean|)))
        (SPROG ((|z1| (R)))
               (SEQ
                (LETT |z1|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                                (QREFELT % 20)))
                (EXIT
                 (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR % |z1|)) |z|
                           (QREFELT % 23)))))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z1| %)
          (LETT |z1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |z1| (QREFELT % 21)))))) 

(SDEFUN |DIRPROD;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G20 NIL) (#2=#:G19 NIL) (#3=#:G18 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G17)))
                              (GO #5=#:G15))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G28 NIL) (#2=#:G27 NIL) (#3=#:G26 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G25)))
                              (GO #5=#:G23))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;8| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G36 NIL) (#2=#:G35 NIL) (#3=#:G34 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G33)))
                              (GO #5=#:G31))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;9| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G44 NIL) (#2=#:G43 NIL) (#3=#:G42 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 6)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                                        (QREFELT % 21)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G41)))
                              (GO #5=#:G39))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;%R;10| ((|z| (%)) (% (R)))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (SPADCALL |z| (SPADCALL |z| (QREFELT % 19)) (QREFELT % 20)))))))
         (EXIT (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;%U;11| ((|z| (%)) (% (|Union| R "failed")))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (CONS 0
                    (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                              (QREFELT % 20))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi%;12| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((N (|Integer|)) (#1=#:G57 NIL) (|i| NIL) (#2=#:G64 NIL)
          (|p| (|Integer|)) (#3=#:G59 NIL) (L (|List| R)))
         (SEQ
          (COND ((EQL (QREFELT % 6) 0) (SPADCALL (QREFELT % 28)))
                ('T
                 (SEQ (LETT N (SPADCALL (QREFELT % 29))) (LETT |p| (- |n| 1))
                      (LETT L
                            (LIST
                             (SPADCALL
                              (PROG1 (LETT #1# (+ (REM |p| N) 1))
                                (|check_subtype2| (> #1# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT % 31))))
                      (SEQ (LETT |i| 2) (LETT #2# (QREFELT % 6)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ (LETT |p| (|quotient_INT| |p| N))
                                (EXIT
                                 (LETT L
                                       (CONS
                                        (SPADCALL
                                         (PROG1 (LETT #3# (+ (REM |p| N) 1))
                                           (|check_subtype2| (> #3# 0)
                                                             '(|PositiveInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT % 31))
                                        L))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL L (QREFELT % 32))))))))) 

(SDEFUN |DIRPROD;random;%;13| ((% (%)))
        (SPROG ((#1=#:G69 NIL) (|i| NIL) (#2=#:G70 NIL) (#3=#:G68 NIL))
               (SEQ
                (PROGN
                 (LETT #1# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #1# #3# (SPADCALL (QREFELT % 34)))))
                      (LETT #3#
                            (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(SDEFUN |DIRPROD;lookup;%Pi;14| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((N (|Integer|)) (|i| NIL) (#1=#:G76 NIL) (L (|Integer|))
          (#2=#:G73 NIL))
         (SEQ
          (COND ((EQL (QREFELT % 6) 0) 1)
                ('T
                 (SEQ (LETT N (SPADCALL (QREFELT % 29)))
                      (LETT L
                            (-
                             (SPADCALL (SPADCALL |x| 1 (QREFELT % 20))
                                       (QREFELT % 36))
                             1))
                      (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 6)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT L
                                   (-
                                    (+ (* L N)
                                       (SPADCALL
                                        (SPADCALL |x| |i| (QREFELT % 20))
                                        (QREFELT % 36)))
                                    1))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROG1 (LETT #2# (+ L 1))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))))))))) 

(SDEFUN |DIRPROD;0;%;15| ((% (%))) (SPADCALL (QREFELT % 6) (QREFELT % 38))) 

(SDEFUN |DIRPROD;*;3%;16| ((|u| (%)) (|v| (%)) (% (%)))
        (SPADCALL (ELT % 40) |u| |v| (QREFELT % 42))) 

(SDEFUN |DIRPROD;subtractIfCan;2%U;17|
        ((|u| (%)) (|v| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|w| (%)) (|i| NIL) (#1=#:G93 NIL) (|c| (|Union| R "failed"))
          (#2=#:G92 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 45))
                (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                      (QREFELT % 47)))
                      (EXIT
                       (COND
                        ((QEQCAR |c| 1)
                         (PROGN (LETT #2# (CONS 1 "failed")) (GO #3=#:G91)))
                        ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;1;%;18| ((% (%)))
        (MAKEARR1 (QREFELT % 6) (|spadConstant| % 49))) 

(SDEFUN |DIRPROD;recip;%U;19| ((|z| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|w| (%)) (|i| NIL) (#2=#:G107 NIL) (|u| (|Union| R #1#))
          (#3=#:G106 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 51))
                (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (SPADCALL |z| |i| (QREFELT % 52))
                                      (QREFELT % 53)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #3# (CONS 1 "failed")) (GO #4=#:G105)))
                        ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #4# (EXIT #3#)))) 

(SDEFUN |DIRPROD;unitVector;Pi%;20| ((|i| (|PositiveInteger|)) (% (%)))
        (SPROG ((|v| (%)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT % 6) (|spadConstant| % 44)))
                    (SPADCALL |v| |i| (|spadConstant| % 49) (QREFELT % 55))
                    (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2%B;21| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G116 NIL) (|a| (R)) (|b| (R)) (#2=#:G115 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G114)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;22| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G123 NIL) (|a| (R)) (|b| (R)) (#2=#:G122 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G121)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G130 NIL) (|a| (R)) (|b| (R)) (#2=#:G129 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G128)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G137 NIL) (|a| (R)) (|b| (R)) (#2=#:G136 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((SPADCALL |a| |b| (QREFELT % 58))
                               (PROGN (LETT #2# 'T) (GO #3=#:G135)))
                              ((SPADCALL |b| |a| (QREFELT % 58))
                               (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;sup;3%;25| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (ELT % 59) |x| |y| (QREFELT % 42))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G160 NIL) (#2=#:G159 NIL)
    (#3=#:G158 NIL) (#4=#:G156 NIL) (#5=#:G157 NIL) (#6=#:G155 NIL)
    (#7=#:G154 NIL) (#8=#:G153 NIL) (#9=#:G152 NIL) (#10=#:G151 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2))
    (LETT % (GETREFV 85))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #1#)
                                        (|HasCategory| |#2| '(|unitsKnown|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #2#
                                              (|HasCategory| |#2| '(|Finite|)))
                                        (OR #2#
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #1#)
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #3# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #3# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SetCategory|))
                                        (|HasCategory| |#2| '(|Hashable|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #2# #1#)
                                        (AND #3#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #3#) #5#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #6#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (AND #6#
                                             (|HasCategory| |#2| '(|Monoid|)))
                                        (AND #6#
                                             (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #6# #7#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #7#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #6# #7#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #3# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|)))
                                        (OR
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
                                          #7#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
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
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #1#)
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
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (OR (|HasCategory| |#2| '(|Monoid|))
                                            #8#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #6# #7#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #3# #2#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #1# (|HasCategory| |#2| '(|Ring|)) #8#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #6#
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #7#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #3# #2#
                                         (|HasCategory| |#2| '(|Hashable|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #1# (|HasCategory| |#2| '(|Ring|)) #8#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR #6#
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
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
                                          #7#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #9#)
                                        (OR #9# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #10#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
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
                                         #5# #10# #9#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND #6#
                                              (|HasCategory| |#2| '(|Ring|)))
                                         (AND #6#
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|))))
                                        (OR
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
                                          #7#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
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
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #1#)
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
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #10#)))))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND #1# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #6#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #7#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|Hashable|)) (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 288230376151711744))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;6|) %)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;7|) %)))
        ((|domainEqual| |#2| (|PositiveInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;8|) %)))
        ('T (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;9|) %))))
       (QSETREFV % 25 (CONS (|dispatchFunction| |DIRPROD;retract;%R;10|) %))
       (QSETREFV % 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;%U;11|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV % 33 (CONS (|dispatchFunction| |DIRPROD;index;Pi%;12|) %))
       (QSETREFV % 35 (CONS (|dispatchFunction| |DIRPROD;random;%;13|) %))
       (QSETREFV % 37 (CONS (|dispatchFunction| |DIRPROD;lookup;%Pi;14|) %)))))
    (COND
     ((|testBitVector| |pv$| 31)
      (QSETREFV % 39
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;0;%;15|) % 39)))))
    (COND
     ((|testBitVector| |pv$| 39)
      (QSETREFV % 43 (CONS (|dispatchFunction| |DIRPROD;*;3%;16|) %))))
    (COND
     ((|testBitVector| |pv$| 35)
      (PROGN
       (QSETREFV % 45 (MAKEARR1 |#1| (|spadConstant| % 44)))
       (QSETREFV % 48
                 (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2%U;17|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (PROGN
       (QSETREFV % 50
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;1;%;18|) % 50)))
       (QSETREFV % 51 (MAKEARR1 |#1| (|spadConstant| % 49)))
       (QSETREFV % 54 (CONS (|dispatchFunction| |DIRPROD;recip;%U;19|) %)))))
    (COND
     ((|testBitVector| |pv$| 31)
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV % 56
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi%;20|)
                        %))))))
    (COND
     ((|testBitVector| |pv$| 3)
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;21|) %)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;22|) %)))
       ((|domainEqual| |#2| (|PositiveInteger|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;23|) %)))
       ('T (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;24|) %))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 60 (CONS (|dispatchFunction| |DIRPROD;sup;3%;25|) %))))
    %))) 

(DEFUN |DirectProduct| (&REST #1=#:G161)
  (SPROG NIL
         (PROG (#2=#:G162)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;%V;1| |DIRPROD;coerce;R%;2|
              (|List| 7) |DIRPROD;parts;%L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V%;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |empty|)
              (54 . |size|) (|PositiveInteger|) (58 . |index|) (63 . |vector|)
              (68 . |index|) (73 . |random|) (77 . |random|) (81 . |lookup|)
              (86 . |lookup|) (91 . |zero|) (96 . |0|) (100 . *)
              (|Mapping| 7 7 7) (106 . |map|) (113 . *) (119 . |0|) '|tmp0|
              (|Union| % '"failed") (123 . |subtractIfCan|)
              (129 . |subtractIfCan|) (135 . |1|) (139 . |1|) '|tmp1|
              (143 . |qelt|) (149 . |recip|) (154 . |recip|) (159 . |setelt!|)
              (166 . |unitVector|) (171 . <) (177 . <) (183 . |sup|)
              (189 . |sup|) (|Mapping| 7 7) (|List| 18) (|List| 64)
              (|Equation| 7) (|Matrix| 18) (|Matrix| %)
              (|Record| (|:| |mat| 65) (|:| |vec| (|Vector| 18))) (|Vector| %)
              (|List| 70) (|Symbol|) (|List| 15) (|Fraction| 18)
              (|Union| 72 '#1="failed") (|Union| 18 '#1#) (|Mapping| 14 7 7)
              (|Void|) (|OutputForm|) (|List| %) (|InputForm|)
              (|SingleInteger|) (|HashState|)
              (|Record| (|:| |mat| 83) (|:| |vec| 5)) (|Matrix| 7) (|String|))
           '#(~= 195 |zero?| 201 |unitVector| 206 |swap!| 211 |sup| 218
              |subtractIfCan| 224 |smaller?| 230 |size?| 236 |size| 242
              |setelt!| 246 |sample| 253 |rightRecip| 257 |rightPower| 262
              |retractIfCan| 274 |retract| 289 |reducedSystem| 304 |recip| 326
              |random| 331 |qsetelt!| 335 |qelt| 342 |plenaryPower| 348 |parts|
              354 |opposite?| 359 |one?| 365 |more?| 370 |minIndex| 376 |min|
              381 |members| 392 |member?| 397 |maxIndex| 403 |max| 408 |map!|
              425 |map| 431 |lookup| 437 |less?| 442 |leftRecip| 448
              |leftPower| 453 |latex| 465 |inf| 470 |indices| 476 |index?| 481
              |index| 487 |hashUpdate!| 492 |hash| 498 |first| 503 |fill!| 508
              |every?| 514 |eval| 520 |eq?| 546 |enumerate| 552 |entry?| 556
              |entries| 562 |empty?| 567 |empty| 572 |elt| 576 |dot| 589
              |directProduct| 595 |differentiate| 600 |count| 650 |copy| 662
              |convert| 667 |commutator| 672 |coerce| 678 |characteristic| 708
              |associator| 712 |any?| 719 |antiCommutator| 725 |annihilate?|
              731 ^ 737 D 749 >= 799 > 805 = 811 <= 817 < 823 |1| 829 |0| 833 -
              837 + 848 * 854 |#| 896)
           'NIL
           (CONS
            (|makeByteWordVec2| 51
                                '(0 9 6 16 15 6 6 18 18 6 6 9 9 6 6 8 29 9 11
                                  11 9 1 18 29 14 11 11 8 1 0 7 2 10 9 37 2 17
                                  41 12 10 36 4 0 19 38 41 13 0 20 47 51 19 42
                                  6 40 0 0 43 47 51 19 12 6 5 3 50 40 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |NonAssociativeSemiRng&|
                NIL |Finite&| |MagmaWithUnit&| |AbelianMonoid&| |OrderedSet&|
                |IndexedAggregate&| |FullyRetractableTo&| |AbelianSemiGroup&|
                |Magma&| NIL |HomogeneousAggregate&| |Hashable&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| NIL |Evalable&| |EltableAggregate&| |Aggregate&|
                |BasicType&| NIL NIL NIL NIL NIL NIL |PartialOrder&| NIL
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|DifferentialExtension| 7)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 70) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 18)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| 18) (|RightModule| 7)
                 (|LeftModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|Finite|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|OrderedSet|)
                 (|IndexedAggregate| 18 7) (|FullyRetractableTo| 7)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|HomogeneousAggregate| 7) (|Hashable|) (|RetractableTo| 18)
                 (|RetractableTo| 72) (|RetractableTo| 7) (|SetCategory|)
                 (|CommutativeStar|) (|Evalable| 7) (|EltableAggregate| 18 7)
                 (|Aggregate|) (|BasicType|) (|CoercibleFrom| 18)
                 (|CoercibleFrom| 72) (|CoercibleFrom| 7) (|ConvertibleTo| 79)
                 (|TwoSidedRecip|) (|unitsKnown|) (|PartialOrder|)
                 (|CoercibleTo| 77) (|InnerEvalable| 7 7) (|Eltable| 18 7)
                 (|CoercibleTo| (|Vector| 7)) (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 84
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 0 0 28 0 7
                                    15 29 1 7 0 30 31 1 8 0 12 32 1 0 0 30 33 0
                                    7 0 34 0 0 0 35 1 7 30 0 36 1 0 30 0 37 1 5
                                    0 15 38 0 0 0 39 2 7 0 0 0 40 3 8 0 41 0 0
                                    42 2 0 0 0 0 43 0 7 0 44 2 7 46 0 0 47 2 0
                                    46 0 0 48 0 7 0 49 0 0 0 50 2 0 7 0 18 52 1
                                    7 46 0 53 1 0 46 0 54 3 8 7 0 18 7 55 1 0 0
                                    30 56 2 0 14 0 0 57 2 7 14 0 0 58 2 7 0 0 0
                                    59 2 0 0 0 0 60 2 59 14 0 0 1 1 56 14 0 1 1
                                    32 0 30 56 3 55 76 0 18 18 1 2 1 0 0 0 60 2
                                    57 46 0 0 48 2 24 14 0 0 1 2 0 14 0 15 16 0
                                    12 15 1 3 55 7 0 18 7 1 0 0 0 1 1 10 46 0 1
                                    2 10 0 0 15 1 2 39 0 0 30 1 1 49 73 0 1 1
                                    46 74 0 1 1 19 26 0 27 1 49 72 0 1 1 46 18
                                    0 1 1 19 7 0 25 1 28 65 66 1 2 28 67 66 68
                                    1 2 9 82 66 68 1 1 9 83 66 1 1 10 46 0 54 0
                                    12 0 35 3 55 7 0 18 7 1 2 0 7 0 18 52 2 6 0
                                    0 30 1 1 52 12 0 13 2 56 14 0 0 1 1 10 14 0
                                    1 2 0 14 0 15 1 1 23 18 0 19 1 53 7 0 1 2 3
                                    0 0 0 1 1 52 12 0 1 2 54 14 7 0 1 1 23 18 0
                                    1 1 53 7 0 1 2 52 7 75 0 1 2 3 0 0 0 1 2 55
                                    0 61 0 1 2 0 0 61 0 1 1 12 30 0 37 2 0 14 0
                                    15 1 1 10 46 0 1 2 10 0 0 15 1 2 39 0 0 30
                                    1 1 19 84 0 1 2 1 0 0 0 1 1 0 62 0 1 2 0 14
                                    18 0 1 1 12 0 30 33 2 20 81 81 0 1 1 20 80
                                    0 1 1 23 7 0 1 2 55 0 0 7 1 2 52 14 22 0 23
                                    2 21 0 0 63 1 3 21 0 0 7 7 1 2 21 0 0 64 1
                                    3 21 0 0 12 12 1 2 0 14 0 0 1 0 12 78 1 2
                                    54 14 7 0 1 1 0 12 0 1 1 0 14 0 1 0 0 0 28
                                    2 0 7 0 18 20 3 0 7 0 18 7 1 2 33 7 0 0 1 1
                                    0 0 5 17 1 25 0 0 1 2 25 0 0 15 1 2 26 0 0
                                    69 1 2 26 0 0 70 1 3 26 0 0 69 71 1 3 26 0
                                    0 70 15 1 2 9 0 0 61 1 3 9 0 0 61 15 1 2 54
                                    15 7 0 1 2 52 15 22 0 1 1 0 0 0 1 1 12 79 0
                                    1 2 9 0 0 0 1 1 0 5 0 10 1 49 0 72 1 1 48 0
                                    18 1 1 45 77 0 1 1 6 0 0 1 1 19 0 7 11 0 9
                                    15 1 3 9 0 0 0 0 1 2 52 14 22 0 1 2 8 0 0 0
                                    1 2 9 14 0 0 1 2 10 0 0 15 1 2 39 0 0 30 1
                                    1 25 0 0 1 2 25 0 0 15 1 2 26 0 0 69 1 2 26
                                    0 0 70 1 3 26 0 0 69 71 1 3 26 0 0 70 15 1
                                    2 9 0 0 61 1 3 9 0 0 61 15 1 2 3 14 0 0 1 2
                                    3 14 0 0 1 2 59 14 0 0 24 2 3 14 0 0 1 2 3
                                    14 0 0 57 0 10 0 50 0 56 0 39 2 58 0 0 0 1
                                    1 58 0 0 1 2 44 0 0 0 1 2 28 0 0 18 1 2 58
                                    0 18 0 1 2 56 0 15 0 1 2 44 0 30 0 1 2 39 0
                                    7 0 1 2 39 0 0 7 1 2 39 0 0 0 43 1 52 15 0
                                    1)))))
           '|lookupComplete|)) 
