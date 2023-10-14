
(/VERSIONCHECK 2) 

(PUT '|ITAYLOR;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |ITAYLOR;stream| (|x| $) |x|) 

(PUT '|ITAYLOR;series;S$;2| '|SPADreplace| '(XLAM (|st|) |st|)) 

(DEFUN |ITAYLOR;series;S$;2| (|st| $) |st|) 

(DEFUN |ITAYLOR;Zero;$;3| ($) (SPADCALL (|spadConstant| $ 11) (QREFELT $ 13))) 

(DEFUN |ITAYLOR;One;$;4| ($) (SPADCALL (|spadConstant| $ 15) (QREFELT $ 13))) 

(DEFUN |ITAYLOR;=;2$B;5| (|x| |y| $)
  (PROG (|st| #1=#:G141 |i| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |st| (|ITAYLOR;stream| (SPADCALL |x| |y| (QREFELT $ 16)) $)
              . #2=(|ITAYLOR;=;2$B;5|))
        (LETT |n| |$streamCount| . #2#)
        (SEQ (LETT |i| 0 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |st| (QREFELT $ 18))
                 (PROGN (LETT #1# 'T . #2#) (GO #1#)))
                ((SPADCALL (SPADCALL |st| (QREFELT $ 19)) (|spadConstant| $ 11)
                           (QREFELT $ 20))
                 (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))
                ('T (LETT |st| (SPADCALL |st| (QREFELT $ 21)) . #2#)))))
             (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (SPADCALL |st| (QREFELT $ 18)))))
      #1# (EXIT #1#))))) 

(DEFUN |ITAYLOR;coefficients;$S;6| (|x| $) (|ITAYLOR;stream| |x| $)) 

(DEFUN |ITAYLOR;+;3$;7| (|x| |y| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) (|ITAYLOR;stream| |y| $) (QREFELT $ 24))) 

(DEFUN |ITAYLOR;-;3$;8| (|x| |y| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) (|ITAYLOR;stream| |y| $) (QREFELT $ 26))) 

(DEFUN |ITAYLOR;*;3$;9| (|x| |y| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) (|ITAYLOR;stream| |y| $) (QREFELT $ 27))) 

(DEFUN |ITAYLOR;-;2$;10| (|x| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) (QREFELT $ 29))) 

(DEFUN |ITAYLOR;*;I2$;11| (|i| |x| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 32)) (|ITAYLOR;stream| |x| $)
            (QREFELT $ 33))) 

(DEFUN |ITAYLOR;*;$I$;12| (|x| |i| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) (SPADCALL |i| (QREFELT $ 32))
            (QREFELT $ 35))) 

(DEFUN |ITAYLOR;*;Coef2$;13| (|c| |x| $)
  (SPADCALL |c| (|ITAYLOR;stream| |x| $) (QREFELT $ 33))) 

(DEFUN |ITAYLOR;*;$Coef$;14| (|x| |c| $)
  (SPADCALL (|ITAYLOR;stream| |x| $) |c| (QREFELT $ 35))) 

(DEFUN |ITAYLOR;recip;$U;15| (|x| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (SPADCALL (|ITAYLOR;stream| |x| $) (QREFELT $ 40))
            |ITAYLOR;recip;$U;15|)
      (EXIT
       (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |rec|) (QREFELT $ 9)))))))))) 

(DEFUN |ITAYLOR;exquo;2$U;16| (|x| |y| $)
  (PROG (|quot|)
    (RETURN
     (SEQ
      (LETT |quot|
            (SPADCALL (|ITAYLOR;stream| |x| $) (|ITAYLOR;stream| |y| $)
                      (QREFELT $ 43))
            |ITAYLOR;exquo;2$U;16|)
      (EXIT
       (COND ((QEQCAR |quot| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |quot|) (QREFELT $ 9)))))))))) 

(DEFUN |ITAYLOR;^;$Nni$;17| (|x| |n| $)
  (PROG (#1=#:G171)
    (RETURN
     (COND ((EQL |n| 0) (|spadConstant| $ 14))
           ('T
            (SPADCALL |x|
                      (PROG1 (LETT #1# |n| |ITAYLOR;^;$Nni$;17|)
                        (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                      (QREFELT $ 47))))))) 

(DEFUN |ITAYLOR;characteristic;Nni;18| ($) (SPADCALL (QREFELT $ 50))) 

(PUT '|ITAYLOR;pole?;$B;19| '|SPADreplace| '(XLAM (|x|) 'NIL)) 

(DEFUN |ITAYLOR;pole?;$B;19| (|x| $) 'NIL) 

(DEFUN |ITAYLOR;iOrder| (|st| |n| |n0| $)
  (COND ((OR (EQL |n| |n0|) (SPADCALL |st| (QREFELT $ 18))) |n0|)
        ('T
         (COND
          ((SPADCALL (SPADCALL |st| (QREFELT $ 19)) (QREFELT $ 53))
           (|ITAYLOR;iOrder| (SPADCALL |st| (QREFELT $ 21)) (+ |n| 1) |n0| $))
          ('T |n|))))) 

(DEFUN |ITAYLOR;order;$2Nni;21| (|x| |n| $)
  (|ITAYLOR;iOrder| (|ITAYLOR;stream| |x| $) 0 |n| $)) 

(DEFUN |ITAYLOR;iOrder2| (|st| |n| $)
  (COND
   ((SPADCALL |st| (QREFELT $ 18))
    (|error| "order: series has infinite order"))
   ((SPADCALL (SPADCALL |st| (QREFELT $ 19)) (QREFELT $ 53))
    (|ITAYLOR;iOrder2| (SPADCALL |st| (QREFELT $ 21)) (+ |n| 1) $))
   ('T |n|))) 

(DEFUN |ITAYLOR;order;$Nni;23| (|x| $)
  (|ITAYLOR;iOrder2| (|ITAYLOR;stream| |x| $) 0 $)) 

(DEFUN |InnerTaylorSeries| (#1=#:G184)
  (PROG ()
    (RETURN
     (PROG (#2=#:G185)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|InnerTaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|InnerTaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|InnerTaylorSeries;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|InnerTaylorSeries|))))))))))) 

(DEFUN |InnerTaylorSeries;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerTaylorSeries|))
      (LETT |dv$| (LIST '|InnerTaylorSeries| DV$1) . #1#)
      (LETT $ (GETREFV 61) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|InnerTaylorSeries| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Stream| |#1|))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 44 (CONS (|dispatchFunction| |ITAYLOR;exquo;2$U;16|) $))))
      $)))) 

(MAKEPROP '|InnerTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Stream| 6)
              |ITAYLOR;series;S$;2|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ITAYLOR;Zero;$;3|) $))
              (0 . |Zero|) (|StreamTaylorSeriesOperations| 6) (4 . |coerce|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |ITAYLOR;One;$;4|) $))
              (9 . |One|) |ITAYLOR;-;3$;8| (|Boolean|) (13 . |empty?|)
              (18 . |frst|) (23 . ~=) (29 . |rst|) |ITAYLOR;=;2$B;5|
              |ITAYLOR;coefficients;$S;6| (34 . +) |ITAYLOR;+;3$;7| (40 . -)
              (46 . *) |ITAYLOR;*;3$;9| (52 . -) |ITAYLOR;-;2$;10| (|Integer|)
              (57 . |coerce|) (62 . *) |ITAYLOR;*;I2$;11| (68 . *)
              |ITAYLOR;*;$I$;12| |ITAYLOR;*;Coef2$;13| |ITAYLOR;*;$Coef$;14|
              (|Union| 8 '"failed") (74 . |recip|) (|Union| $ '"failed")
              |ITAYLOR;recip;$U;15| (79 . |exquo|) (85 . |exquo|)
              (|PositiveInteger|) (|RepeatedSquaring| $$) (91 . |expt|)
              (|NonNegativeInteger|) |ITAYLOR;^;$Nni$;17|
              (97 . |characteristic|) |ITAYLOR;characteristic;Nni;18|
              |ITAYLOR;pole?;$B;19| (101 . |zero?|) |ITAYLOR;order;$2Nni;21|
              |ITAYLOR;order;$Nni;23|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 106 |zero?| 112 |unitNormal| 117 |unitCanonical| 122 |unit?|
              127 |subtractIfCan| 132 |series| 138 |sample| 143 |recip| 147
              |pole?| 152 |order| 157 |one?| 168 |latex| 173 |hashUpdate!| 178
              |hash| 184 |exquo| 189 |coerce| 195 |coefficients| 210
              |characteristic| 215 |associates?| 219 ^ 225 |Zero| 237 |One| 241
              = 245 - 251 + 262 * 268)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 1 1 1 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1
                                  1))
            (CONS
             '#(NIL |Algebra&| NIL |Module&| |EntireRing&| |Ring&| NIL NIL NIL
                NIL |AbelianGroup&| NIL NIL |AbelianMonoid&| |Monoid&| NIL
                |SemiGroup&| |AbelianSemiGroup&| |SetCategory&| NIL
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|IntegralDomain|) (|Algebra| $$) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|Ring|) (|BiModule| $$ $$)
                 (|Rng|) (|LeftModule| $$) (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 60) (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 60
                                  '(0 6 0 11 1 12 8 6 13 0 6 0 15 1 7 17 0 18 1
                                    7 6 0 19 2 6 17 0 0 20 1 8 0 0 21 2 12 8 8
                                    8 24 2 12 8 8 8 26 2 12 8 8 8 27 1 12 8 8
                                    29 1 6 0 31 32 2 12 8 6 8 33 2 12 8 8 6 35
                                    1 12 39 8 40 2 12 39 8 8 43 2 0 41 0 0 44 2
                                    46 2 2 45 47 0 6 48 50 1 6 17 0 53 2 0 17 0
                                    0 1 1 0 17 0 1 1 1 56 0 1 1 1 0 0 1 1 1 17
                                    0 1 2 0 41 0 0 1 1 0 0 8 9 0 0 0 1 1 0 41 0
                                    42 1 0 17 0 52 2 0 48 0 48 54 1 0 48 0 55 1
                                    0 17 0 1 1 0 57 0 1 2 0 59 59 0 1 1 0 58 0
                                    1 2 1 41 0 0 44 1 1 0 0 1 1 0 0 31 1 1 0 60
                                    0 1 1 0 8 0 23 0 0 48 51 2 1 17 0 0 1 2 0 0
                                    0 48 49 2 0 0 0 45 1 0 0 0 10 0 0 0 14 2 0
                                    17 0 0 22 1 0 0 0 30 2 0 0 0 0 16 2 0 0 0 0
                                    25 2 0 0 0 6 38 2 0 0 0 31 36 2 0 0 6 0 37
                                    2 0 0 31 0 34 2 0 0 0 0 28 2 0 0 48 0 1 2 0
                                    0 45 0 1)))))
           '|lookupComplete|)) 
