
(/VERSIONCHECK 2) 

(PUT '|MODRING;modulus;$Mod;1| '|SPADreplace| 'QCDR) 

(DEFUN |MODRING;modulus;$Mod;1| (|x| $) (QCDR |x|)) 

(PUT '|MODRING;coerce;$R;2| '|SPADreplace| 'QCAR) 

(DEFUN |MODRING;coerce;$R;2| (|x| $) (QCAR |x|)) 

(DEFUN |MODRING;coerce;I$;3| (|i| $)
  (CONS (SPADCALL |i| (QREFELT $ 15)) (|spadConstant| $ 18))) 

(DEFUN |MODRING;*;I2$;4| (|i| |x| $)
  (SPADCALL (SPADCALL |i| (QREFELT $ 19)) |x| (QREFELT $ 20))) 

(DEFUN |MODRING;coerce;$Of;5| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 23))) 

(DEFUN |MODRING;reduce;RMod$;6| (|a| |m| $)
  (CONS (SPADCALL |a| |m| (QREFELT $ 8)) |m|)) 

(DEFUN |MODRING;characteristic;Nni;7| ($) (SPADCALL (QREFELT $ 27))) 

(DEFUN |MODRING;Zero;$;8| ($)
  (CONS (|spadConstant| $ 17) (|spadConstant| $ 18))) 

(DEFUN |MODRING;One;$;9| ($) (CONS (|spadConstant| $ 29) (|spadConstant| $ 18))) 

(DEFUN |MODRING;zero?;$B;10| (|x| $) (SPADCALL (QCAR |x|) (QREFELT $ 32))) 

(DEFUN |MODRING;one?;$B;11| (|x| $)
  (SPADCALL (QCAR |x|) (|spadConstant| $ 29) (QREFELT $ 34))) 

(DEFUN |MODRING;newmodulo| (|m1| |m2| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |m1| |m2| (QREFELT $ 9)) |MODRING;newmodulo|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|error| "incompatible moduli"))
                 ('T (QCDR |r|)))))))) 

(DEFUN |MODRING;=;2$B;13| (|x| |y| $)
  (COND ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 34)) 'T)
        ((SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 36)) 'NIL)
        ('T
         (SPADCALL (QCAR (SPADCALL |x| |y| (QREFELT $ 37)))
                   (|spadConstant| $ 17) (QREFELT $ 34))))) 

(DEFUN |MODRING;+;3$;14| (|x| |y| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 39))
            (|MODRING;newmodulo| (QCDR |x|) (QCDR |y|) $) (QREFELT $ 25))) 

(DEFUN |MODRING;-;3$;15| (|x| |y| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 41))
            (|MODRING;newmodulo| (QCDR |x|) (QCDR |y|) $) (QREFELT $ 25))) 

(DEFUN |MODRING;-;2$;16| (|x| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QREFELT $ 42)) (QCDR |x|) (QREFELT $ 25))) 

(DEFUN |MODRING;*;3$;17| (|x| |y| $)
  (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 44))
            (|MODRING;newmodulo| (QCDR |x|) (QCDR |y|) $) (QREFELT $ 25))) 

(DEFUN |MODRING;exQuo;2$U;18| (|x| |y| $)
  (PROG (|r| |xm|)
    (RETURN
     (SEQ (LETT |xm| (QCDR |x|) . #1=(|MODRING;exQuo;2$U;18|))
          (COND
           ((SPADCALL |xm| (QCDR |y|) (QREFELT $ 45))
            (LETT |xm| (|MODRING;newmodulo| |xm| (QCDR |y|) $) . #1#)))
          (LETT |r| (SPADCALL (QCAR |x|) (QCAR |y|) |xm| (QREFELT $ 10)) . #1#)
          (EXIT
           (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (CONS (QCDR |r|) |xm|))))))))) 

(DEFUN |MODRING;recip;$U;19| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL (|spadConstant| $ 29) (QCAR |x|) (QCDR |x|)
                      (QREFELT $ 10))
            |MODRING;recip;$U;19|)
      (EXIT
       (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
             ('T (CONS 0 (CONS (QCDR |r|) (QCDR |x|)))))))))) 

(DEFUN |MODRING;inv;2$;20| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 48)) |MODRING;inv;2$;20|)
          (EXIT
           (COND ((QEQCAR |u| 1) (|error| "not invertible"))
                 ('T (QCDR |u|)))))))) 

(DEFUN |ModularRing| (&REST #1=#:G182)
  (PROG ()
    (RETURN
     (PROG (#2=#:G183)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ModularRing|)
                                           '|domainEqualList|)
                . #3=(|ModularRing|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ModularRing;|) #1#)
                (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|ModularRing|))))))))))) 

(DEFUN |ModularRing;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ModularRing|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|ModularRing| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ModularRing|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (|Record| (|:| |val| |#1|) (|:| |modulo| |#2|)))
      $)))) 

(MAKEPROP '|ModularRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep|
              |MODRING;modulus;$Mod;1| |MODRING;coerce;$R;2| (|Integer|)
              (0 . |coerce|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MODRING;Zero;$;8|) $))
              (5 . |Zero|) (9 . |Zero|) |MODRING;coerce;I$;3| |MODRING;*;3$;17|
              |MODRING;*;I2$;4| (|OutputForm|) (13 . |coerce|)
              |MODRING;coerce;$Of;5| |MODRING;reduce;RMod$;6|
              (|NonNegativeInteger|) (18 . |characteristic|)
              |MODRING;characteristic;Nni;7| (22 . |One|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MODRING;One;$;9|) $))
              (|Boolean|) (26 . |zero?|) |MODRING;zero?;$B;10| (31 . =)
              |MODRING;one?;$B;11| (37 . =) |MODRING;-;3$;15|
              |MODRING;=;2$B;13| (43 . +) |MODRING;+;3$;14| (49 . -) (55 . -)
              |MODRING;-;2$;16| (60 . *) (66 . ~=) (|Union| $ '"failed")
              |MODRING;exQuo;2$U;18| |MODRING;recip;$U;19| |MODRING;inv;2$;20|
              (|PositiveInteger|) (|String|) (|SingleInteger|))
           '#(~= 72 |zero?| 78 |subtractIfCan| 83 |sample| 89 |reduce| 93
              |recip| 99 |one?| 104 |modulus| 109 |latex| 114 |inv| 119 |hash|
              124 |exQuo| 129 |coerce| 135 |characteristic| 150 ^ 154 |Zero|
              166 |One| 170 = 174 - 180 + 191 * 197)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|Ring&| NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                     |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                     |SetCategory&| NIL |BasicType&| NIL)
                  (CONS
                   '#((|Ring|) (|Rng|) (|LeftModule| $$) (|AbelianGroup|)
                      (|CancellationAbelianMonoid|) (|SemiRing|)
                      (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                      (|BasicType|) (|CoercibleTo| 22))
                   (|makeByteWordVec2| 52
                                       '(1 6 0 14 15 0 6 0 17 0 7 0 18 1 6 22 0
                                         23 0 6 26 27 0 6 0 29 1 6 31 0 32 2 6
                                         31 0 0 34 2 7 31 0 0 36 2 6 0 0 0 39 2
                                         6 0 0 0 41 1 6 0 0 42 2 6 0 0 0 44 2 7
                                         31 0 0 45 2 0 31 0 0 1 1 0 31 0 33 2 0
                                         46 0 0 1 0 0 0 1 2 0 0 6 7 25 1 0 46 0
                                         48 1 0 31 0 35 1 0 7 0 12 1 0 51 0 1 1
                                         0 0 0 49 1 0 52 0 1 2 0 46 0 0 47 1 0
                                         6 0 13 1 0 0 14 19 1 0 22 0 24 0 0 26
                                         28 2 0 0 0 26 1 2 0 0 0 50 1 0 0 0 16
                                         0 0 0 30 2 0 31 0 0 38 2 0 0 0 0 37 1
                                         0 0 0 43 2 0 0 0 0 40 2 0 0 14 0 21 2
                                         0 0 0 0 20 2 0 0 26 0 1 2 0 0 50 0
                                         1)))))
           '|lookupComplete|)) 
