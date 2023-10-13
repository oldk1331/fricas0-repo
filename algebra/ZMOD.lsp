
(/VERSIONCHECK 2) 

(DEFUN |ZMOD;size;Nni;1| ($) (QREFELT $ 6)) 

(DEFUN |ZMOD;characteristic;Nni;2| ($) (QREFELT $ 6)) 

(DEFUN |ZMOD;lookup;$Pi;3| (|x| $)
  (PROG (#1=#:G131)
    (RETURN
     (COND ((SPADCALL |x| (QREFELT $ 11)) (QREFELT $ 6))
           ('T
            (PROG1 (LETT #1# (SPADCALL |x| (QREFELT $ 13)) |ZMOD;lookup;$Pi;3|)
              (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))) 

(DEFUN |ZMOD;bloodyCompiler| (|n| $)
  (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 22))) 

(PUT '|ZMOD;convert;$I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |ZMOD;convert;$I;5| (|x| $) |x|) 

(DEFUN |ZMOD;coerce;$Of;6| (|x| $) (SPADCALL |x| (QREFELT $ 24))) 

(DEFUN |ZMOD;coerce;I$;7| (|n| $) (|ZMOD;bloodyCompiler| |n| $)) 

(PUT '|ZMOD;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |ZMOD;Zero;$;8| ($) 0) 

(PUT '|ZMOD;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |ZMOD;One;$;9| ($) 1) 

(PUT '|ZMOD;init;$;10| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |ZMOD;init;$;10| ($) 0) 

(DEFUN |ZMOD;nextItem;$U;11| (|n| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |n| (|spadConstant| $ 28) (QREFELT $ 30))
            |ZMOD;nextItem;$U;11|)
      (EXIT
       (COND
        ((SPADCALL |m| (|spadConstant| $ 27) (QREFELT $ 31)) (CONS 1 "failed"))
        ('T (CONS 0 |m|)))))))) 

(PUT '|ZMOD;=;2$B;12| '|SPADreplace| '|eql_SI|) 

(DEFUN |ZMOD;=;2$B;12| (|x| |y| $) (|eql_SI| |x| |y|)) 

(DEFUN |ZMOD;*;3$;13| (|x| |y| $) (|mulmod_SI| |x| |y| (QREFELT $ 21))) 

(DEFUN |ZMOD;*;I2$;14| (|n| |x| $)
  (|mulmod_SI| (|ZMOD;bloodyCompiler| |n| $) |x| (QREFELT $ 21))) 

(DEFUN |ZMOD;+;3$;15| (|x| |y| $) (|addmod_SI| |x| |y| (QREFELT $ 21))) 

(DEFUN |ZMOD;-;3$;16| (|x| |y| $) (|submod_SI| |x| |y| (QREFELT $ 21))) 

(DEFUN |ZMOD;random;$;17| ($) (RANDOM (QREFELT $ 21))) 

(DEFUN |ZMOD;index;Pi$;18| (|a| $)
  (SPADCALL (SPADCALL |a| (QREFELT $ 26)) (QREFELT $ 21) (QREFELT $ 38))) 

(DEFUN |ZMOD;-;2$;19| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 27))
        ('T (|sub_SI| (QREFELT $ 21) |x|)))) 

(DEFUN |ZMOD;^;$Nni$;20| (|x| |n| $)
  (COND
   ((< |n| (QREFELT $ 6))
    (SPADCALL |x| (SPADCALL |n| (QREFELT $ 26)) (QREFELT $ 21) (QREFELT $ 41)))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |x| (QREFELT $ 13)) |n| (QREFELT $ 6) (QREFELT $ 42))
     (QREFELT $ 26))))) 

(DEFUN |ZMOD;recip;$U;21| (|x| $)
  (PROG (|g| |c2| |c1| |#G24|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G24| (SPADCALL |x| (QREFELT $ 21) (QREFELT $ 45))
             . #1=(|ZMOD;recip;$U;21|))
       (LETT |c1| (QVELT |#G24| 0) . #1#)
       (LETT |c2| (QVELT |#G24| 1) . #1#)
       (LETT |g| (QVELT |#G24| 2) . #1#)
       |#G24|)
      (EXIT
       (COND
        ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 31))
         (CONS 0 (SPADCALL |c1| (QREFELT $ 21) (QREFELT $ 38))))
        ('T (CONS 1 "failed")))))))) 

(PUT '|ZMOD;convert;$I;22| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |ZMOD;convert;$I;22| (|x| $) |x|) 

(DEFUN |ZMOD;coerce;I$;23| (|n| $) (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 38))) 

(DEFUN |ZMOD;coerce;$Of;24| (|x| $) (SPADCALL |x| (QREFELT $ 24))) 

(PUT '|ZMOD;Zero;$;25| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |ZMOD;Zero;$;25| ($) 0) 

(PUT '|ZMOD;One;$;26| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |ZMOD;One;$;26| ($) 1) 

(PUT '|ZMOD;init;$;27| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |ZMOD;init;$;27| ($) 0) 

(DEFUN |ZMOD;nextItem;$U;28| (|n| $)
  (PROG (|m|)
    (RETURN
     (SEQ
      (LETT |m| (SPADCALL |n| (|spadConstant| $ 28) (QREFELT $ 30))
            |ZMOD;nextItem;$U;28|)
      (EXIT
       (COND
        ((SPADCALL |m| (|spadConstant| $ 27) (QREFELT $ 31)) (CONS 1 "failed"))
        ('T (CONS 0 |m|)))))))) 

(PUT '|ZMOD;=;2$B;29| '|SPADreplace| 'EQL) 

(DEFUN |ZMOD;=;2$B;29| (|x| |y| $) (EQL |x| |y|)) 

(DEFUN |ZMOD;*;3$;30| (|x| |y| $)
  (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 47))) 

(DEFUN |ZMOD;*;I2$;31| (|n| |x| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 38)) |x| (QREFELT $ 6)
            (QREFELT $ 47))) 

(DEFUN |ZMOD;+;3$;32| (|x| |y| $)
  (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 48))) 

(DEFUN |ZMOD;-;3$;33| (|x| |y| $)
  (SPADCALL |x| |y| (QREFELT $ 6) (QREFELT $ 49))) 

(DEFUN |ZMOD;random;$;34| ($) (RANDOM (QREFELT $ 6))) 

(DEFUN |ZMOD;index;Pi$;35| (|a| $) (SPADCALL |a| (QREFELT $ 6) (QREFELT $ 38))) 

(DEFUN |ZMOD;-;2$;36| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 11)) (|spadConstant| $ 27))
        ('T (- (QREFELT $ 6) |x|)))) 

(DEFUN |ZMOD;^;$Nni$;37| (|x| |n| $)
  (SPADCALL |x| |n| (QREFELT $ 6) (QREFELT $ 41))) 

(DEFUN |ZMOD;recip;$U;38| (|x| $)
  (PROG (|g| |c2| |c1| |#G44|)
    (RETURN
     (SEQ
      (PROGN
       (LETT |#G44| (SPADCALL |x| (QREFELT $ 6) (QREFELT $ 45))
             . #1=(|ZMOD;recip;$U;38|))
       (LETT |c1| (QVELT |#G44| 0) . #1#)
       (LETT |c2| (QVELT |#G44| 1) . #1#)
       (LETT |g| (QVELT |#G44| 2) . #1#)
       |#G44|)
      (EXIT
       (COND
        ((SPADCALL |g| (|spadConstant| $ 28) (QREFELT $ 31))
         (CONS 0 (SPADCALL |c1| (QREFELT $ 6) (QREFELT $ 38))))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |IntegerMod| (#1=#:G192)
  (PROG ()
    (RETURN
     (PROG (#2=#:G193)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|IntegerMod|)
                                           '|domainEqualList|)
                . #3=(|IntegerMod|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|IntegerMod;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|IntegerMod|))))))))))) 

(DEFUN |IntegerMod;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|IntegerMod|))
      (LETT |dv$| (LIST '|IntegerMod| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|IntegerMod| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 17 (SPADCALL |#1| MOST-POSITIVE-FIXNUM (QREFELT $ 16)))
      (COND
       ((QREFELT $ 17)
        (PROGN
         (QSETREFV $ 18 (|SingleInteger|))
         (QSETREFV $ 21 (SPADCALL |#1| (QREFELT $ 20)))
         NIL
         (QSETREFV $ 13 (CONS (|dispatchFunction| |ZMOD;convert;$I;5|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |ZMOD;coerce;$Of;6|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |ZMOD;coerce;I$;7|) $))
         (QSETREFV $ 27
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;Zero;$;8|) $ 27)))
         (QSETREFV $ 28
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;One;$;9|) $ 28)))
         (QSETREFV $ 29
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;init;$;10|) $ 29)))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |ZMOD;nextItem;$U;11|) $))
         (QSETREFV $ 31 (CONS (|dispatchFunction| |ZMOD;=;2$B;12|) $))
         (QSETREFV $ 34 (CONS (|dispatchFunction| |ZMOD;*;3$;13|) $))
         (QSETREFV $ 35 (CONS (|dispatchFunction| |ZMOD;*;I2$;14|) $))
         (QSETREFV $ 30 (CONS (|dispatchFunction| |ZMOD;+;3$;15|) $))
         (QSETREFV $ 36 (CONS (|dispatchFunction| |ZMOD;-;3$;16|) $))
         (QSETREFV $ 37 (CONS (|dispatchFunction| |ZMOD;random;$;17|) $))
         (QSETREFV $ 39 (CONS (|dispatchFunction| |ZMOD;index;Pi$;18|) $))
         (QSETREFV $ 40 (CONS (|dispatchFunction| |ZMOD;-;2$;19|) $))
         (QSETREFV $ 43 (CONS (|dispatchFunction| |ZMOD;^;$Nni$;20|) $))
         (QSETREFV $ 46 (CONS (|dispatchFunction| |ZMOD;recip;$U;21|) $))))
       ('T
        (PROGN
         (SETELT $ 18 (|Integer|))
         (QSETREFV $ 13 (CONS (|dispatchFunction| |ZMOD;convert;$I;22|) $))
         (QSETREFV $ 26 (CONS (|dispatchFunction| |ZMOD;coerce;I$;23|) $))
         (QSETREFV $ 25 (CONS (|dispatchFunction| |ZMOD;coerce;$Of;24|) $))
         (QSETREFV $ 27
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;Zero;$;25|) $ 27)))
         (QSETREFV $ 28
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;One;$;26|) $ 28)))
         (QSETREFV $ 29
                   (CONS #'|makeSpadConstant|
                         (LIST (|dispatchFunction| |ZMOD;init;$;27|) $ 29)))
         (QSETREFV $ 33 (CONS (|dispatchFunction| |ZMOD;nextItem;$U;28|) $))
         (QSETREFV $ 31 (CONS (|dispatchFunction| |ZMOD;=;2$B;29|) $))
         (QSETREFV $ 34 (CONS (|dispatchFunction| |ZMOD;*;3$;30|) $))
         (QSETREFV $ 35 (CONS (|dispatchFunction| |ZMOD;*;I2$;31|) $))
         (QSETREFV $ 30 (CONS (|dispatchFunction| |ZMOD;+;3$;32|) $))
         (QSETREFV $ 36 (CONS (|dispatchFunction| |ZMOD;-;3$;33|) $))
         (QSETREFV $ 37 (CONS (|dispatchFunction| |ZMOD;random;$;34|) $))
         (QSETREFV $ 39 (CONS (|dispatchFunction| |ZMOD;index;Pi$;35|) $))
         (QSETREFV $ 40 (CONS (|dispatchFunction| |ZMOD;-;2$;36|) $))
         (QSETREFV $ 43 (CONS (|dispatchFunction| |ZMOD;^;$Nni$;37|) $))
         (QSETREFV $ 46 (CONS (|dispatchFunction| |ZMOD;recip;$U;38|) $)))))
      $)))) 

(MAKEPROP '|IntegerMod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |ZMOD;size;Nni;1| |ZMOD;characteristic;Nni;2| (|Boolean|)
              (0 . |zero?|) (|Integer|) (5 . |convert|) (|PositiveInteger|)
              |ZMOD;lookup;$Pi;3| (10 . <=) '#:G128 '|Rep| (|SingleInteger|)
              (16 . |coerce|) '|q| (21 . |positiveRemainder|) (|OutputForm|)
              (27 . |coerce|) (32 . |coerce|) (37 . |coerce|) (42 . |Zero|)
              (46 . |One|) (50 . |init|) (54 . +) (60 . =)
              (|Union| $ '"failed") (66 . |nextItem|) (71 . *) (77 . *)
              (83 . -) (89 . |random|) (93 . |positiveRemainder|)
              (99 . |index|) (104 . -) (109 . |powmod|) (116 . |powmod|)
              (123 . ^)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (129 . |extendedEuclidean|) (135 . |recip|) (140 . |mulmod|)
              (147 . |addmod|) (154 . |submod|) (|InputForm|) (|List| $)
              (|String|))
           '#(~= 161 |zero?| 167 |subtractIfCan| 172 |size| 178 |sample| 182
              |recip| 186 |random| 191 |one?| 195 |nextItem| 200 |lookup| 205
              |latex| 210 |init| 215 |index| 219 |hash| 224 |enumerate| 229
              |convert| 233 |coerce| 243 |characteristic| 253 ^ 257 |Zero| 269
              |One| 273 = 277 - 283 + 294 * 300)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(NIL |Ring&| NIL NIL NIL NIL |AbelianGroup&| NIL NIL
                |AbelianMonoid&| |Monoid&| NIL NIL |Finite&| |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|CommutativeRing|) (|Ring|) (|BiModule| $$ $$) (|Rng|)
                 (|RightModule| $$) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|StepThrough|) (|Finite|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|SetCategory|)
                 (|ConvertibleTo| 12) (|ConvertibleTo| 50) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 23))
              (|makeByteWordVec2| 52
                                  '(1 0 10 0 11 1 0 12 0 13 2 12 10 0 0 16 1 19
                                    0 12 20 2 12 0 0 0 22 1 18 23 0 24 1 0 23 0
                                    25 1 0 0 12 26 0 0 0 27 0 0 0 28 0 0 0 29 2
                                    0 0 0 0 30 2 0 10 0 0 31 1 0 32 0 33 2 0 0
                                    0 0 34 2 0 0 12 0 35 2 0 0 0 0 36 0 0 0 37
                                    2 18 0 0 0 38 1 0 0 14 39 1 0 0 0 40 3 18 0
                                    0 0 0 41 3 12 0 0 0 0 42 2 0 0 0 7 43 2 18
                                    44 0 0 45 1 0 32 0 46 3 18 0 0 0 0 47 3 18
                                    0 0 0 0 48 3 18 0 0 0 0 49 2 0 10 0 0 1 1 0
                                    10 0 11 2 0 32 0 0 1 0 0 7 8 0 0 0 1 1 0 32
                                    0 46 0 0 0 37 1 0 10 0 1 1 0 32 0 33 1 0 14
                                    0 15 1 0 52 0 1 0 0 0 29 1 0 0 14 39 1 0 19
                                    0 1 0 0 51 1 1 0 50 0 1 1 0 12 0 13 1 0 0
                                    12 26 1 0 23 0 25 0 0 7 9 2 0 0 0 7 43 2 0
                                    0 0 14 1 0 0 0 27 0 0 0 28 2 0 10 0 0 31 1
                                    0 0 0 40 2 0 0 0 0 36 2 0 0 0 0 30 2 0 0 12
                                    0 35 2 0 0 0 0 34 2 0 0 7 0 1 2 0 0 14 0
                                    1)))))
           '|lookupComplete|)) 
