
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
  (PROG (#1=#:G142 #2=#:G144 #3=#:G145 |i|)
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
  (PROG (#1=#:G147 #2=#:G149 #3=#:G150 |i|)
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
  (PROG (#1=#:G152 #2=#:G154 #3=#:G155 |i|)
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
  (PROG (L #1=#:G167 |p| #2=#:G172 |i| #3=#:G166 N)
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
  (PROG (#1=#:G175 #2=#:G177 |i| #3=#:G176)
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
  (PROG (#1=#:G179 L #2=#:G182 |i| N)
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

(DEFUN |DIRPROD;hash;$Si;14| (|x| $)
  (PROG (L #1=#:G186 |i|)
    (RETURN
     (SEQ
      (LETT L (SPADCALL (SPADCALL |x| 1 (QREFELT $ 20)) (QREFELT $ 39))
            . #2=(|DIRPROD;hash;$Si;14|))
      (SEQ (LETT |i| 2 . #2#) (LETT #1# (QREFELT $ 6) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ
            (EXIT
             (LETT L
                   (|hashCombine| L
                                  (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                            (QREFELT $ 39)))
                   . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT L))))) 

(DEFUN |DIRPROD;+;3$;15| (|u| |v| $)
  (SPADCALL (ELT $ 41) |u| |v| (QREFELT $ 43))) 

(DEFUN |DIRPROD;Zero;$;16| ($) (SPADCALL (QREFELT $ 6) (QREFELT $ 45))) 

(DEFUN |DIRPROD;One;$;17| ($) (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))) 

(DEFUN |DIRPROD;*;$R$;18| (|u| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRPROD;*;$R$;18!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 50))))) 

(DEFUN |DIRPROD;*;$R$;18!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|DIRPROD;*;$R$;18|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| |r| (QREFELT $ 48)))))) 

(DEFUN |DIRPROD;*;R2$;19| (|r| |u| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRPROD;*;R2$;19!0| (VECTOR $ |r|)) |u|
               (QREFELT $ 50))))) 

(DEFUN |DIRPROD;*;R2$;19!0| (|x| $$)
  (PROG (|r| $)
    (LETT |r| (QREFELT $$ 1) . #1=(|DIRPROD;*;R2$;19|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |r| |x| (QREFELT $ 48)))))) 

(DEFUN |DIRPROD;*;3$;20| (|x| |y| $)
  (PROG (#1=#:G198 #2=#:G200 |i| #3=#:G199)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# (GETREFV #4=(QREFELT $ 6)) . #5=(|DIRPROD;*;3$;20|))
       (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#) (LETT #1# 0 . #5#) G190
            (COND ((|greater_SI| |i| #2#) (GO G191)))
            (SEQ
             (EXIT
              (SETELT #3# #1#
                      (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                (SPADCALL |y| |i| (QREFELT $ 20))
                                (QREFELT $ 48)))))
            (LETT #1# (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #5#))
                  . #5#)
            (GO G190) G191 (EXIT NIL))
       #3#))))) 

(DEFUN |DIRPROD;subtractIfCan;2$U;21| (|u| |v| $)
  (PROG (#1=#:G210 |c| #2=#:G211 |i| |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 54))
              . #3=(|DIRPROD;subtractIfCan;2$U;21|))
        (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
             (COND ((|greater_SI| |i| #2#) (GO G191)))
             (SEQ
              (LETT |c|
                    (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                              (QREFELT $ 56))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |c| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |w|))))
      #1# (EXIT #1#))))) 

(DEFUN |DIRPROD;*;3$;22| (|u| |v| $)
  (SPADCALL (ELT $ 48) |u| |v| (QREFELT $ 43))) 

(DEFUN |DIRPROD;recip;$U;23| (|z| $)
  (PROG (#1=#:G224 |u| #2=#:G225 |i| |w|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 54))
              . #3=(|DIRPROD;recip;$U;23|))
        (SEQ (LETT |i| (SPADCALL |w| (QREFELT $ 19)) . #3#)
             (LETT #2# (SPADCALL |w| (QREFELT $ 58)) . #3#) G190
             (COND ((> |i| #2#) (GO G191)))
             (SEQ
              (LETT |u|
                    (SPADCALL (SPADCALL |z| |i| (QREFELT $ 59)) (QREFELT $ 60))
                    . #3#)
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
             (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |w|))))
      #1# (EXIT #1#))))) 

(DEFUN |DIRPROD;unitVector;Pi$;24| (|i| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 54))
            |DIRPROD;unitVector;Pi$;24|)
      (SPADCALL |v| |i| (|spadConstant| $ 47) (QREFELT $ 62)) (EXIT |v|))))) 

(DEFUN |DIRPROD;<;2$B;25| (|x| |y| $)
  (PROG (#1=#:G228 #2=#:G232 |b| |a| #3=#:G233 |i|)
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
  (PROG (#1=#:G234 #2=#:G238 |b| |a| #3=#:G239 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;26|))
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

(DEFUN |DIRPROD;<;2$B;27| (|x| |y| $)
  (PROG (#1=#:G240 #2=#:G244 #3=#:G245 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 1 . #4=(|DIRPROD;<;2$B;27|))
             (LETT #3# (QREFELT $ 6) . #4#) G190
             (COND ((|greater_SI| |i| #3#) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 59))
                           (SPADCALL |y| |i| (QREFELT $ 59)) (QREFELT $ 65))
                 (PROGN (LETT #2# 'T . #4#) (GO #2#)))
                ('T
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 59))
                               (SPADCALL |y| |i| (QREFELT $ 59))
                               (QREFELT $ 66))
                     (PROGN
                      (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                      (GO #1#)))))
                  #1# (EXIT #1#))))))
             (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |DIRPROD;sup;3$;28| (|x| |y| $)
  (SPADCALL (ELT $ 67) |x| |y| (QREFELT $ 43))) 

(DEFUN |DirectProduct| (&REST #1=#:G263)
  (PROG ()
    (RETURN
     (PROG (#2=#:G264)
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
  (PROG (|pv$| #1=#:G257 #2=#:G258 #3=#:G259 #4=#:G260 #5=#:G261 #6=#:G262 $
         |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #7=(|DirectProduct|))
      (LETT DV$2 (|devaluate| |#2|) . #7#)
      (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2) . #7#)
      (LETT $ (GETREFV 90) . #7#)
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
           (|augmentPredVector| $ 137438953472))
      (AND (|HasCategory| |#2| '(|SetCategory|))
           (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 274877906944))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 549755813888))
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
         (QSETREFV $ 37 (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;13|) $))
         (QSETREFV $ 40 (CONS (|dispatchFunction| |DIRPROD;hash;$Si;14|) $)))))
      (COND
       ((|testBitVector| |pv$| 27)
        (QSETREFV $ 44 (CONS (|dispatchFunction| |DIRPROD;+;3$;15|) $))))
      (COND
       ((|HasCategory| |#2| '(|AbelianMonoid|))
        (QSETREFV $ 46
                  (CONS #'|makeSpadConstant|
                        (LIST (|dispatchFunction| |DIRPROD;Zero;$;16|) $
                              46)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 35
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |DIRPROD;One;$;17|) $ 35)))
         (QSETREFV $ 51 (CONS (|dispatchFunction| |DIRPROD;*;$R$;18|) $))
         (QSETREFV $ 52 (CONS (|dispatchFunction| |DIRPROD;*;R2$;19|) $))
         (QSETREFV $ 53 (CONS (|dispatchFunction| |DIRPROD;*;3$;20|) $)))))
      (COND
       ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
        (QSETREFV $ 57
                  (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;21|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 53 (CONS (|dispatchFunction| |DIRPROD;*;3$;22|) $))
         (QSETREFV $ 61 (CONS (|dispatchFunction| |DIRPROD;recip;$U;23|) $))
         (QSETREFV $ 63
                   (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;24|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|OrderedSet|))
        (COND
         ((|domainEqual| |#2| (|NonNegativeInteger|))
          (QSETREFV $ 64 (CONS (|dispatchFunction| |DIRPROD;<;2$B;25|) $)))
         ((|domainEqual| |#2| (|Integer|))
          (QSETREFV $ 64 (CONS (|dispatchFunction| |DIRPROD;<;2$B;26|) $)))
         ('T
          (QSETREFV $ 64 (CONS (|dispatchFunction| |DIRPROD;<;2$B;27|) $))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 68 (CONS (|dispatchFunction| |DIRPROD;sup;3$;28|) $))))
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
              (86 . |lookup|) (|SingleInteger|) (91 . |hash|) (96 . |hash|)
              (101 . +) (|Mapping| 7 7 7) (107 . |map|) (114 . +)
              (120 . |zero|) (125 . |Zero|) (129 . |One|) (133 . *)
              (|Mapping| 7 7) (139 . |map|) (145 . *) (151 . *) (157 . *)
              (163 . |Zero|) (|Union| $ '"failed") (167 . |subtractIfCan|)
              (173 . |subtractIfCan|) (179 . |maxIndex|) (184 . |qelt|)
              (190 . |recip|) (195 . |recip|) (200 . |setelt|)
              (207 . |unitVector|) (212 . <) (218 . <) (224 . >) (230 . |sup|)
              (236 . |sup|) (|List| 70) (|Equation| 7) (|Matrix| 18)
              (|Matrix| $) (|Record| (|:| |mat| 71) (|:| |vec| (|Vector| 18)))
              (|Vector| $) (|List| 77) (|List| 15) (|Symbol|)
              (|Union| 79 '#1="failed") (|Fraction| 18) (|Union| 18 '#1#)
              (|Void|) (|OutputForm|) (|CardinalNumber|) (|InputForm|)
              (|List| $) (|Matrix| 7) (|Record| (|:| |mat| 86) (|:| |vec| 5))
              (|String|) (|List| 18))
           '#(~= 242 |zero?| 248 |unitVector| 253 |swap!| 258 |sup| 265
              |subtractIfCan| 271 |smaller?| 277 |size?| 283 |size| 289 |sign|
              293 |setelt| 298 |sample| 305 |retractIfCan| 309 |retract| 324
              |reducedSystem| 339 |recip| 361 |random| 366 |qsetelt!| 370
              |qelt| 377 |positive?| 383 |parts| 388 |one?| 393 |negative?| 398
              |more?| 403 |minIndex| 409 |min| 414 |members| 420 |member?| 425
              |maxIndex| 431 |max| 436 |map!| 442 |map| 448 |lookup| 454
              |less?| 459 |latex| 465 |indices| 470 |index?| 475 |index| 481
              |hash| 486 |first| 491 |fill!| 496 |every?| 502 |eval| 508 |eq?|
              534 |enumerate| 540 |entry?| 544 |entries| 550 |empty?| 555
              |empty| 560 |elt| 564 |dot| 577 |directProduct| 583 |dimension|
              588 |differentiate| 592 |count| 642 |copy| 654 |convert| 659
              |coerce| 664 |characteristic| 689 |any?| 693 |abs| 699 ^ 704
              |Zero| 716 |One| 720 D 724 >= 774 > 780 = 786 <= 792 < 798 / 804
              - 810 + 821 * 827 |#| 863)
           'NIL
           (CONS
            (|makeByteWordVec2| 37
                                '(0 1 8 2 2 10 4 8 2 13 14 15 9 3 4 8 17 9 2 5
                                  11 8 17 5 17 5 2 16 0 5 2 6 16 0 5 6 12 30 0
                                  0 28 29 18 0 0 0 0 28 36 5 7 8 12 29 18 37
                                  33))
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
                 (|LinearlyExplicitRingOver| 18) (|PartialDifferentialRing| 77)
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
                 (|InnerEvalable| 7 7) (|CoercibleTo| 82) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 84)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 79)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 89
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 0 0 0 35 1 7 29 0 36 1 0 29 0 37 1 7
                                    38 0 39 1 0 38 0 40 2 7 0 0 0 41 3 8 0 42 0
                                    0 43 2 0 0 0 0 44 1 5 0 15 45 0 0 0 46 0 7
                                    0 47 2 7 0 0 0 48 2 0 0 49 0 50 2 0 0 0 7
                                    51 2 0 0 7 0 52 2 0 0 0 0 53 0 7 0 54 2 7
                                    55 0 0 56 2 0 55 0 0 57 1 0 18 0 58 2 0 7 0
                                    18 59 1 7 55 0 60 1 0 55 0 61 3 8 7 0 18 7
                                    62 1 0 0 29 63 2 0 14 0 0 64 2 7 14 0 0 65
                                    2 7 14 0 0 66 2 7 0 0 0 67 2 0 0 0 0 68 2
                                    18 14 0 0 1 1 26 14 0 1 1 2 0 29 63 3 40 81
                                    0 18 18 1 2 3 0 0 0 68 2 25 55 0 0 57 2 5
                                    14 0 0 1 2 0 14 0 15 16 0 12 15 1 1 4 18 0
                                    1 3 40 7 0 18 7 1 0 0 0 1 1 35 78 0 1 1 32
                                    80 0 1 1 18 26 0 27 1 35 79 0 1 1 32 18 0 1
                                    1 18 7 0 25 1 21 71 72 1 2 21 73 72 74 1 1
                                    2 86 72 1 2 2 87 72 74 1 1 6 55 0 61 0 12 0
                                    34 3 40 7 0 18 7 1 2 0 7 0 18 59 1 4 14 0 1
                                    1 38 12 0 13 1 6 14 0 1 1 4 14 0 1 2 0 14 0
                                    15 1 1 20 18 0 19 2 5 0 0 0 1 1 38 12 0 1 2
                                    39 14 7 0 1 1 20 18 0 58 2 5 0 0 0 1 2 40 0
                                    49 0 1 2 0 0 49 0 50 1 12 29 0 37 2 0 14 0
                                    15 1 1 18 88 0 1 1 0 89 0 1 2 0 14 18 0 1 1
                                    12 0 29 32 1 18 38 0 40 1 20 7 0 1 2 40 0 0
                                    7 1 2 38 14 22 0 23 3 19 0 0 12 12 1 3 19 0
                                    0 7 7 1 2 19 0 0 69 1 2 19 0 0 70 1 2 0 14
                                    0 0 1 0 12 85 1 2 39 14 7 0 1 1 0 12 0 1 1
                                    0 14 0 1 0 0 0 1 3 0 7 0 18 7 1 2 0 7 0 18
                                    20 2 2 7 0 0 1 1 0 0 5 17 0 1 83 1 2 22 0 0
                                    15 1 1 22 0 0 1 3 23 0 0 75 76 1 2 23 0 0
                                    75 1 3 23 0 0 77 15 1 2 23 0 0 77 1 3 2 0 0
                                    49 15 1 2 2 0 0 49 1 2 39 15 7 0 1 2 38 15
                                    22 0 1 1 0 0 0 1 1 12 84 0 1 1 35 0 79 1 1
                                    34 0 18 1 1 31 82 0 1 1 18 0 7 11 1 0 5 0
                                    10 0 2 15 1 2 38 14 22 0 1 1 4 0 0 1 2 6 0
                                    0 29 1 2 6 0 0 15 1 0 26 0 46 0 6 0 35 2 22
                                    0 0 15 1 1 22 0 0 1 3 23 0 0 75 76 1 2 23 0
                                    0 75 1 3 23 0 0 77 15 1 2 23 0 0 77 1 3 2 0
                                    0 49 15 1 2 2 0 0 49 1 2 5 14 0 0 1 2 5 14
                                    0 0 1 2 18 14 0 0 24 2 5 14 0 0 1 2 5 14 0
                                    0 64 2 1 0 0 7 1 1 24 0 0 1 2 24 0 0 0 1 2
                                    27 0 0 0 44 2 24 0 18 0 1 2 26 0 15 0 1 2
                                    27 0 29 0 1 2 6 0 7 0 52 2 6 0 0 0 53 2 6 0
                                    0 7 51 1 38 15 0 1)))))
           '|lookupComplete|)) 
