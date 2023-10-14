
(/VERSIONCHECK 2) 

(PUT '|DIRRING;per| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |DIRRING;per| (|f| $) |f|) 

(PUT '|DIRRING;rep| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |DIRRING;rep| (|a| $) |a|) 

(DEFUN |DIRRING;elt;$PiCoef;3| (|a| |n| $)
  (PROG (|f|)
    (RETURN
     (SEQ (LETT |f| (QCAR (|DIRRING;rep| |a| $)) |DIRRING;elt;$PiCoef;3|)
          (EXIT (SPADCALL |n| |f|)))))) 

(DEFUN |DIRRING;coerce;$M;4| (|a| $) (QCAR (|DIRRING;rep| |a| $))) 

(DEFUN |DIRRING;coerce;M$;5| (|f| $) (|DIRRING;per| (LIST |f|) $)) 

(DEFUN |DIRRING;coerce;$S;6| (|a| $)
  (PROG (|f|)
    (RETURN
     (SEQ (LETT |f| (QCAR (|DIRRING;rep| |a| $)) |DIRRING;coerce;$S;6|)
          (EXIT
           (SPADCALL (CONS #'|DIRRING;coerce;$S;6!0| |f|) (QREFELT $ 19)
                     (QREFELT $ 23))))))) 

(DEFUN |DIRRING;coerce;$S;6!0| (|n| |f|)
  (PROG (#1=#:G146)
    (RETURN
     (SPADCALL
      (PROG1 (LETT #1# |n| NIL)
        (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
      |f|)))) 

(DEFUN |DIRRING;coerce;S$;7| (|f| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRRING;coerce;S$;7!0| (VECTOR $ |f|))
               (QREFELT $ 12))))) 

(DEFUN |DIRRING;coerce;S$;7!0| (|n| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|DIRRING;coerce;S$;7|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |f| |n| (QREFELT $ 25)))))) 

(DEFUN |DIRRING;coerce;$Of;8| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 24)) (QREFELT $ 28))) 

(DEFUN |DIRRING;One;$;9| ($)
  (SPADCALL (CONS #'|DIRRING;One;$;9!0| $) (QREFELT $ 12))) 

(DEFUN |DIRRING;One;$;9!0| (|n| $)
  (COND ((SPADCALL |n| (QREFELT $ 31)) (|spadConstant| $ 14))
        ('T (|spadConstant| $ 32)))) 

(DEFUN |DIRRING;Zero;$;10| ($)
  (SPADCALL (CONS #'|DIRRING;Zero;$;10!0| $) (QREFELT $ 12))) 

(DEFUN |DIRRING;Zero;$;10!0| (|n| $) (|spadConstant| $ 32)) 

(DEFUN |DIRRING;zeta;$;11| ($)
  (SPADCALL (CONS #'|DIRRING;zeta;$;11!0| $) (QREFELT $ 12))) 

(DEFUN |DIRRING;zeta;$;11!0| (|n| $) (|spadConstant| $ 14)) 

(DEFUN |DIRRING;+;3$;12| (|f| |g| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRRING;+;3$;12!0| (VECTOR |g| $ |f|))
               (QREFELT $ 12))))) 

(DEFUN |DIRRING;+;3$;12!0| (|n| $$)
  (PROG (|f| $ |g|)
    (LETT |f| (QREFELT $$ 2) . #1=(|DIRRING;+;3$;12|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |f| |n| (QREFELT $ 9))
                (SPADCALL |g| |n| (QREFELT $ 9)) (QREFELT $ 35)))))) 

(DEFUN |DIRRING;-;2$;13| (|f| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRRING;-;2$;13!0| (VECTOR $ |f|)) (QREFELT $ 12))))) 

(DEFUN |DIRRING;-;2$;13!0| (|n| $$)
  (PROG (|f| $)
    (LETT |f| (QREFELT $$ 1) . #1=(|DIRRING;-;2$;13|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |f| |n| (QREFELT $ 9)) (QREFELT $ 37)))))) 

(DEFUN |DIRRING;*;I2$;14| (|a| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRRING;*;I2$;14!0| (VECTOR $ |f| |a|))
               (QREFELT $ 12))))) 

(DEFUN |DIRRING;*;I2$;14!0| (|n| $$)
  (PROG (|a| |f| $)
    (LETT |a| (QREFELT $$ 2) . #1=(|DIRRING;*;I2$;14|))
    (LETT |f| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |a| (SPADCALL |f| |n| (QREFELT $ 9)) (QREFELT $ 39)))))) 

(DEFUN |DIRRING;*;Coef2$;15| (|a| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|DIRRING;*;Coef2$;15!0| (VECTOR $ |f| |a|))
               (QREFELT $ 12))))) 

(DEFUN |DIRRING;*;Coef2$;15!0| (|n| $$)
  (PROG (|a| |f| $)
    (LETT |a| (QREFELT $$ 2) . #1=(|DIRRING;*;Coef2$;15|))
    (LETT |f| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL |a| (SPADCALL |f| |n| (QREFELT $ 9)) (QREFELT $ 41)))))) 

(DEFUN |DIRRING;*;3$;16| (|f| |g| $)
  (PROG (|conv|)
    (RETURN
     (SEQ
      (LETT |conv| (CONS #'|DIRRING;*;3$;16!0| (VECTOR |g| |f| $))
            |DIRRING;*;3$;16|)
      (EXIT (SPADCALL |conv| (QREFELT $ 12))))))) 

(DEFUN |DIRRING;*;3$;16!0| (|n| $$)
  (PROG ($ |f| |g|)
    (LETT $ (QREFELT $$ 2) . #1=(|DIRRING;*;3$;16|))
    (LETT |f| (QREFELT $$ 1) . #1#)
    (LETT |g| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G211 #3=#:G210 #4=#:G215 |d| #5=#:G214)
        (RETURN
         (SEQ
          (SPADCALL (ELT $ 35)
                    (PROGN
                     (LETT #5# NIL NIL)
                     (SEQ (LETT |d| NIL NIL)
                          (LETT #4# (SPADCALL |n| (QREFELT $ 45)) NIL) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |d| (CAR #4#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |f|
                                              (PROG1 (LETT #3# |d| NIL)
                                                (|check_subtype| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 #3#))
                                              (QREFELT $ 9))
                                    (SPADCALL |g|
                                              (PROG1
                                                  (LETT #2#
                                                        (SPADCALL |n| |d|
                                                                  (QREFELT $
                                                                           46))
                                                        NIL)
                                                (|check_subtype| (> #2# 0)
                                                                 '(|PositiveInteger|)
                                                                 #2#))
                                              (QREFELT $ 9))
                                    (QREFELT $ 41))
                                   #5#)
                                  NIL)))
                          (LETT #4# (CDR #4#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #5#))))
                    (|spadConstant| $ 32) (QREFELT $ 50))))))))) 

(DEFUN |DIRRING;unit?;$B;17| (|a| $)
  (COND
   ((QEQCAR (SPADCALL (SPADCALL |a| 1 (QREFELT $ 9)) (QREFELT $ 53)) 1) 'NIL)
   ('T 'T))) 

(DEFUN |DIRRING;qrecip| (|f| |f1inv| |n| $)
  (PROG (#1=#:G243 #2=#:G242 #3=#:G248 |d| #4=#:G247)
    (RETURN
     (SEQ
      (COND ((EQL |n| 1) |f1inv|)
            ('T
             (SPADCALL
              (SPADCALL |f1inv|
                        (SPADCALL (ELT $ 35)
                                  (PROGN
                                   (LETT #4# NIL . #5=(|DIRRING;qrecip|))
                                   (SEQ (LETT |d| NIL . #5#)
                                        (LETT #3#
                                              (CDR
                                               (SPADCALL |n| (QREFELT $ 45)))
                                              . #5#)
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |d| (CAR #3#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |f|
                                                            (PROG1
                                                                (LETT #2# |d|
                                                                      . #5#)
                                                              (|check_subtype|
                                                               (> #2# 0)
                                                               '(|PositiveInteger|)
                                                               #2#))
                                                            (QREFELT $ 9))
                                                  (|DIRRING;qrecip| |f| |f1inv|
                                                   (PROG1
                                                       (LETT #1#
                                                             (QUOTIENT2 |n|
                                                                        |d|)
                                                             . #5#)
                                                     (|check_subtype| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      #1#))
                                                   $)
                                                  (QREFELT $ 41))
                                                 #4#)
                                                . #5#)))
                                        (LETT #3# (CDR #3#) . #5#) (GO G190)
                                        G191 (EXIT (NREVERSE #4#))))
                                  (|spadConstant| $ 32) (QREFELT $ 50))
                        (QREFELT $ 41))
              (QREFELT $ 37)))))))) 

(DEFUN |DIRRING;recip;$U;19| (|f| $)
  (PROG (|mp| |f1inv|)
    (RETURN
     (SEQ
      (LETT |f1inv| (SPADCALL (SPADCALL |f| 1 (QREFELT $ 9)) (QREFELT $ 53))
            . #1=(|DIRRING;recip;$U;19|))
      (EXIT
       (COND ((QEQCAR |f1inv| 1) (CONS 1 "failed"))
             ('T
              (SEQ
               (LETT |mp|
                     (CONS #'|DIRRING;recip;$U;19!0| (VECTOR $ |f1inv| |f|))
                     . #1#)
               (EXIT (CONS 0 (SPADCALL |mp| (QREFELT $ 12)))))))))))) 

(DEFUN |DIRRING;recip;$U;19!0| (|n| $$)
  (PROG (|f| |f1inv| $)
    (LETT |f| (QREFELT $$ 2) . #1=(|DIRRING;recip;$U;19|))
    (LETT |f1inv| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|DIRRING;qrecip| |f| (QCDR |f1inv|) |n| $))))) 

(DEFUN |DIRRING;multiplicative?;$PiB;20| (|a| |n| $)
  (PROG (#1=#:G285 #2=#:G280 |rl| #3=#:G262 #4=#:G261 #5=#:G287 |f| #6=#:G286
         |fl| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 2 . #7=(|DIRRING;multiplicative?;$PiB;20|)) G190
             (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (LETT |fl|
                    (SPADCALL (SPADCALL |i| (QREFELT $ 57)) (QREFELT $ 61))
                    . #7#)
              (LETT |rl|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |f| NIL . #7#) (LETT #5# |fl| . #7#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL |a|
                                             (SPADCALL
                                              (PROG1
                                                  (LETT #4# (QCAR |f|) . #7#)
                                                (|check_subtype| (> #4# 0)
                                                                 '(|PositiveInteger|)
                                                                 #4#))
                                              (PROG1
                                                  (LETT #3# (QCDR |f|) . #7#)
                                                (|check_subtype| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 #3#))
                                              (QREFELT $ 62))
                                             (QREFELT $ 9))
                                   #6#)
                                  . #7#)))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #7#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL |a|
                            (PROG1 (LETT #2# |i| . #7#)
                              (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                               #2#))
                            (QREFELT $ 9))
                  (SPADCALL (ELT $ 41) |rl| (QREFELT $ 63)) (QREFELT $ 64))
                 (SEQ (SPADCALL (SPADCALL |i| (QREFELT $ 66)) (QREFELT $ 69))
                      (SPADCALL (SPADCALL |rl| (QREFELT $ 70)) (QREFELT $ 69))
                      (EXIT (PROGN (LETT #1# 'NIL . #7#) (GO #1#))))))))
             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |DIRRING;additive?;$PiB;21| (|a| |n| $)
  (PROG (#1=#:G313 #2=#:G308 |rl| #3=#:G290 #4=#:G289 #5=#:G315 |f| #6=#:G314
         |fl| |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |i| 2 . #7=(|DIRRING;additive?;$PiB;21|)) G190
             (COND ((|greater_SI| |i| |n|) (GO G191)))
             (SEQ
              (LETT |fl|
                    (SPADCALL (SPADCALL |i| (QREFELT $ 57)) (QREFELT $ 61))
                    . #7#)
              (LETT |rl|
                    (PROGN
                     (LETT #6# NIL . #7#)
                     (SEQ (LETT |f| NIL . #7#) (LETT #5# |fl| . #7#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |f| (CAR #5#) . #7#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL |a|
                                             (SPADCALL
                                              (PROG1
                                                  (LETT #4# (QCAR |f|) . #7#)
                                                (|check_subtype| (> #4# 0)
                                                                 '(|PositiveInteger|)
                                                                 #4#))
                                              (PROG1
                                                  (LETT #3# (QCDR |f|) . #7#)
                                                (|check_subtype| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 #3#))
                                              (QREFELT $ 62))
                                             (QREFELT $ 9))
                                   #6#)
                                  . #7#)))
                          (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #7#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL |a|
                            (PROG1 (LETT #2# |i| . #7#)
                              (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                               #2#))
                            (QREFELT $ 9))
                  (SPADCALL (ELT $ 35) |rl| (QREFELT $ 63)) (QREFELT $ 64))
                 (SEQ (SPADCALL (SPADCALL |i| (QREFELT $ 66)) (QREFELT $ 69))
                      (SPADCALL (SPADCALL |rl| (QREFELT $ 70)) (QREFELT $ 69))
                      (EXIT (PROGN (LETT #1# 'NIL . #7#) (GO #1#))))))))
             (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |DirichletRing| (#1=#:G317)
  (PROG ()
    (RETURN
     (PROG (#2=#:G318)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|DirichletRing|)
                                           '|domainEqualList|)
                . #3=(|DirichletRing|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|DirichletRing;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|DirichletRing|))))))))))) 

(DEFUN |DirichletRing;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DirichletRing|))
      (LETT |dv$| (LIST '|DirichletRing| DV$1) . #1#)
      (LETT $ (GETREFV 77) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|DirichletRing| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Record|
                 (|:| |function| (|Mapping| |#1| (|PositiveInteger|)))))
      (QSETREFV $ 19 (SPADCALL 1 (QREFELT $ 18)))
      $)))) 

(MAKEPROP '|DirichletRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|PositiveInteger|)
              |DIRRING;elt;$PiCoef;3| (|Mapping| 6 8) |DIRRING;coerce;$M;4|
              |DIRRING;coerce;M$;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DIRRING;One;$;9|) $))
              (0 . |One|) (|Stream| 16) (|Integer|)
              (|StreamTaylorSeriesOperations| 16) (4 . |integers|) '|indices|
              (|Stream| 6) (|Mapping| 6 16) (|StreamFunctions2| 16 6)
              (9 . |map|) |DIRRING;coerce;$S;6| (15 . |elt|)
              |DIRRING;coerce;S$;7| (|OutputForm|) (21 . |coerce|)
              |DIRRING;coerce;$Of;8| (|Boolean|) (26 . |one?|) (31 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DIRRING;Zero;$;10|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |DIRRING;zeta;$;11|) $))
              (35 . +) |DIRRING;+;3$;12| (41 . -) |DIRRING;-;2$;13| (46 . *)
              |DIRRING;*;I2$;14| (52 . *) |DIRRING;*;Coef2$;15| (|List| 16)
              (|IntegerNumberTheoryFunctions|) (58 . |divisors|) (63 . |quo|)
              (|Mapping| 6 6 6) (|List| 6) (|ListFunctions2| 6 6)
              (69 . |reduce|) |DIRRING;*;3$;16| (|Union| $ '"failed")
              (76 . |recip|) |DIRRING;unit?;$B;17| |DIRRING;recip;$U;19|
              (|Factored| $) (81 . |factor|)
              (|Record| (|:| |factor| 16) (|:| |exponent| 16)) (|List| 58)
              (|Factored| 16) (86 . |factors|) (91 . ^) (97 . |reduce|)
              (103 . ~=) (|NonNegativeInteger|) (109 . |coerce|) (|Void|)
              (|OutputPackage|) (114 . |output|) (119 . |coerce|)
              |DIRRING;multiplicative?;$PiB;20| |DIRRING;additive?;$PiB;21|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 124 |zeta| 130 |zero?| 134 |unitNormal| 139 |unitCanonical|
              144 |unit?| 149 |subtractIfCan| 154 |sample| 160 |recip| 164
              |one?| 169 |multiplicative?| 174 |latex| 180 |hashUpdate!| 185
              |hash| 191 |exquo| 196 |elt| 202 |coerce| 208 |characteristic|
              248 |associates?| 252 |additive?| 258 ^ 264 |Zero| 276 |One| 280
              = 284 - 290 + 301 * 307)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(1 1 1 1 1 1 1 0 1 1 0 0 1 1 1 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 1 1))
            (CONS
             '#(NIL |Algebra&| |Algebra&| |Module&| NIL |Module&| |EntireRing&|
                |Ring&| NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&|
                |SetCategory&| NIL NIL |BasicType&| NIL NIL NIL)
             (CONS
              '#((|IntegralDomain|) (|Algebra| 6) (|Algebra| $$) (|Module| 6)
                 (|CommutativeRing|) (|Module| $$) (|EntireRing|) (|Ring|)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|Rng|) (|LeftModule| $$)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|) (|SemiRing|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Eltable| 8 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 27)
                 (|CommutativeStar|) (|noZeroDivisors|))
              (|makeByteWordVec2| 76
                                  '(0 6 0 14 1 17 15 16 18 2 22 20 21 15 23 2
                                    20 6 0 16 25 1 20 27 0 28 1 8 30 0 31 0 6 0
                                    32 2 6 0 0 0 35 1 6 0 0 37 2 6 0 16 0 39 2
                                    6 0 0 0 41 1 44 43 16 45 2 16 0 0 0 46 3 49
                                    6 47 48 6 50 1 6 52 0 53 1 16 56 0 57 1 60
                                    59 0 61 2 8 0 0 8 62 2 48 6 47 0 63 2 6 30
                                    0 0 64 1 65 27 0 66 1 68 67 27 69 1 48 27 0
                                    70 2 0 30 0 0 1 0 0 0 34 1 0 30 0 1 1 1 73
                                    0 1 1 1 0 0 1 1 1 30 0 54 2 0 52 0 0 1 0 0
                                    0 1 1 0 52 0 55 1 0 30 0 1 2 0 30 0 8 71 1
                                    0 74 0 1 2 0 76 76 0 1 1 0 75 0 1 2 1 52 0
                                    0 1 2 0 6 0 8 9 1 1 0 6 1 1 1 0 0 1 1 0 0
                                    20 26 1 0 20 0 24 1 0 0 10 12 1 0 10 0 11 1
                                    0 0 16 1 1 0 27 0 29 0 0 65 1 2 1 30 0 0 1
                                    2 0 30 0 8 72 2 0 0 0 65 1 2 0 0 0 8 1 0 0
                                    0 33 0 0 0 13 2 0 30 0 0 1 2 0 0 0 0 1 1 0
                                    0 0 38 2 0 0 0 0 36 2 1 0 0 6 1 2 1 0 6 0
                                    42 2 0 0 0 0 51 2 0 0 16 0 40 2 0 0 65 0 1
                                    2 0 0 8 0 1)))))
           '|lookupComplete|)) 
