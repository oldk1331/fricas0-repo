
(SDEFUN |SINT;writeOMSingleInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((|less_SI| |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 9))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 11))
                (SPADCALL |dev| (|minus_SI| |x|) (QREFELT $ 13))
                (EXIT (SPADCALL |dev| (QREFELT $ 14)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 13)))))) 

(SDEFUN |SINT;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 15))))
             (|SINT;writeOMSingleInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 16))))))) 

(PUT '|SINT;reducedSystem;MM;3| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |SINT;reducedSystem;MM;3| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(SDEFUN |SINT;coerce;$Of;4| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 23))) 

(PUT '|SINT;convert;$I;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;convert;$I;5| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|SINT;convert;$S;6| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |SINT;convert;$S;6| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |SINT;*;I2$;7| ((|i| |Integer|) (|y| $) ($ $))
        (|mul_SI| (SPADCALL |i| (QREFELT $ 27)) |y|)) 

(PUT '|SINT;Zero;$;8| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |SINT;Zero;$;8| (($ $)) 0) 

(PUT '|SINT;One;$;9| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |SINT;One;$;9| (($ $)) 1) 

(PUT '|SINT;base;$;10| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |SINT;base;$;10| (($ $)) 2) 

(PUT '|SINT;max;$;11| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(SDEFUN |SINT;max;$;11| (($ $)) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;12| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(SDEFUN |SINT;min;$;12| (($ $)) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;13| '|SPADreplace| '|eql_SI|) 

(SDEFUN |SINT;=;2$B;13| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;14| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;~;2$;14| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;15| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;not;2$;15| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;16| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;/\\;3$;16| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;17| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;\\/;3$;17| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;18| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;Not;2$;18| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;19| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;And;3$;19| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;20| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;Or;3$;20| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;21| '|SPADreplace| '|xor_SI|) 

(SDEFUN |SINT;xor;3$;21| ((|x| $) (|y| $) ($ $)) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;22| '|SPADreplace| '|less_SI|) 

(SDEFUN |SINT;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|)) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;23| '|SPADreplace| '|inc_SI|) 

(SDEFUN |SINT;inc;2$;23| ((|x| $) ($ $)) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;24| '|SPADreplace| '|dec_SI|) 

(SDEFUN |SINT;dec;2$;24| ((|x| $) ($ $)) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;25| '|SPADreplace| '|minus_SI|) 

(SDEFUN |SINT;-;2$;25| ((|x| $) ($ $)) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;26| '|SPADreplace| '|add_SI|) 

(SDEFUN |SINT;+;3$;26| ((|x| $) (|y| $) ($ $)) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;27| '|SPADreplace| '|sub_SI|) 

(SDEFUN |SINT;-;3$;27| ((|x| $) (|y| $) ($ $)) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;28| '|SPADreplace| '|mul_SI|) 

(SDEFUN |SINT;*;3$;28| ((|x| $) (|y| $) ($ $)) (|mul_SI| |x| |y|)) 

(SDEFUN |SINT;^;$Nni$;29| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (EXPT |x| |n|) (QREFELT $ 27))) 

(PUT '|SINT;quo;3$;30| '|SPADreplace| '|quo_SI|) 

(SDEFUN |SINT;quo;3$;30| ((|x| $) (|y| $) ($ $)) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;31| '|SPADreplace| '|rem_SI|) 

(SDEFUN |SINT;rem;3$;31| ((|x| $) (|y| $) ($ $)) (|rem_SI| |x| |y|)) 

(SDEFUN |SINT;divide;2$R;32|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;33| '|SPADreplace| 'GCD) 

(SDEFUN |SINT;gcd;3$;33| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;34| '|SPADreplace| '|abs_SI|) 

(SDEFUN |SINT;abs;2$;34| ((|x| $) ($ $)) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;35| '|SPADreplace| '|odd?_SI|) 

(SDEFUN |SINT;odd?;$B;35| ((|x| $) ($ |Boolean|)) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;36| '|SPADreplace| '|zero?_SI|) 

(SDEFUN |SINT;zero?;$B;36| ((|x| $) ($ |Boolean|)) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;37| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(SDEFUN |SINT;one?;$B;37| ((|x| $) ($ |Boolean|)) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;38| '|SPADreplace| '|max_SI|) 

(SDEFUN |SINT;max;3$;38| ((|x| $) (|y| $) ($ $)) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;39| '|SPADreplace| '|min_SI|) 

(SDEFUN |SINT;min;3$;39| ((|x| $) (|y| $) ($ $)) (|min_SI| |x| |y|)) 

(SDEFUN |SINT;hashUpdate!;Hs$Hs;40|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;41| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |SINT;length;2$;41| ((|x| $) ($ $)) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;42| '|SPADreplace| '|lshift_SI|) 

(SDEFUN |SINT;shift;3$;42| ((|x| $) (|n| $) ($ $)) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;43| '|SPADreplace| '|mulmod_SI|) 

(SDEFUN |SINT;mulmod;4$;43| ((|a| $) (|b| $) (|p| $) ($ $))
        (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;44| '|SPADreplace| '|addmod_SI|) 

(SDEFUN |SINT;addmod;4$;44| ((|a| $) (|b| $) (|p| $) ($ $))
        (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;45| '|SPADreplace| '|submod_SI|) 

(SDEFUN |SINT;submod;4$;45| ((|a| $) (|b| $) (|p| $) ($ $))
        (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;46| '|SPADreplace| '|negative?_SI|) 

(SDEFUN |SINT;negative?;$B;46| ((|x| $) ($ |Boolean|)) (|negative?_SI| |x|)) 

(PUT '|SINT;reducedSystem;MVR;47| '|SPADreplace| 'CONS) 

(SDEFUN |SINT;reducedSystem;MVR;47|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| #2=(|Integer|)))
          (|:| |vec| (|Vector| #2#))))
        (CONS |m| |v|)) 

(SDEFUN |SINT;positiveRemainder;3$;48| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;48|)
                (EXIT
                 (COND
                  ((|negative?_SI| |r|)
                   (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                         (#1='T (|add_SI| |r| |n|))))
                  (#1# |r|)))))) 

(PUT '|SINT;qconvert;I$;49| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;qconvert;I$;49| ((|x| |Integer|) ($ $)) |x|) 

(SDEFUN |SINT;coerce;I$;50| ((|x| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 76))
           (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
         (EXIT (|error| "integer too large to represent in a machine word")))) 

(SDEFUN |SINT;random;$;51| (($ $))
        (SEQ (SETELT $ 6 (REMAINDER (* 314159269 (QREFELT $ 6)) 2147483647))
             (EXIT (REMAINDER (QREFELT $ 6) 67108864)))) 

(PUT '|SINT;random;2$;52| '|SPADreplace| 'RANDOM) 

(SDEFUN |SINT;random;2$;52| ((|n| $) ($ $)) (RANDOM |n|)) 

(SDEFUN |SINT;unitNormal;$R;53|
        ((|x| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (COND ((|less_SI| |x| 0) (VECTOR -1 (|minus_SI| |x|) -1))
              ('T (VECTOR 1 |x| 1)))) 

(DECLAIM (NOTINLINE |SingleInteger;|)) 

(DEFUN |SingleInteger| ()
  (SPROG NIL
         (PROG (#1=#:G1862)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SingleInteger|)
                    . #2=(|SingleInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SingleInteger|
                             (LIST (CONS NIL (CONS 1 (|SingleInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SingleInteger|)))))))))) 

(DEFUN |SingleInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SingleInteger|) . #1=(|SingleInteger|))
          (LETT $ (GETREFV 102) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SingleInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 1)
          $))) 

(MAKEPROP '|SingleInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|seed| (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) |SINT;OMwrite;Omd$BV;2|
              (|Matrix| 12) (|Matrix| $) |SINT;reducedSystem;MM;3|
              (|OutputForm|) (33 . |coerce|) |SINT;coerce;$Of;4|
              |SINT;convert;$I;5| |SINT;convert;$S;6| (38 . |coerce|)
              |SINT;*;I2$;7|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;8|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;9|) $))
              |SINT;base;$;10| |SINT;max;$;11| |SINT;min;$;12| |SINT;=;2$B;13|
              |SINT;~;2$;14| |SINT;not;2$;15| |SINT;/\\;3$;16| |SINT;\\/;3$;17|
              |SINT;Not;2$;18| |SINT;And;3$;19| |SINT;Or;3$;20|
              |SINT;xor;3$;21| |SINT;<;2$B;22| |SINT;inc;2$;23|
              |SINT;dec;2$;24| |SINT;-;2$;25| |SINT;+;3$;26| |SINT;-;3$;27|
              |SINT;*;3$;28| (|NonNegativeInteger|) |SINT;^;$Nni$;29|
              |SINT;quo;3$;30| |SINT;rem;3$;31|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;32| |SINT;gcd;3$;33| |SINT;abs;2$;34|
              |SINT;odd?;$B;35| |SINT;zero?;$B;36| |SINT;one?;$B;37|
              |SINT;max;3$;38| |SINT;min;3$;39| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;40| |SINT;length;2$;41|
              |SINT;shift;3$;42| |SINT;mulmod;4$;43| |SINT;addmod;4$;44|
              |SINT;submod;4$;45| |SINT;negative?;$B;46|
              (|Record| (|:| |mat| 19) (|:| |vec| (|Vector| 12))) (|Vector| $)
              |SINT;reducedSystem;MVR;47| |SINT;positiveRemainder;3$;48|
              |SINT;qconvert;I$;49| (43 . <=) |SINT;coerce;I$;50|
              |SINT;random;$;51| |SINT;random;2$;52|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;53| (|Union| 83 '"failed") (|Fraction| 12)
              (|DoubleFloat|) (|Union| $ '"failed") (|Float|)
              (|PatternMatchResult| 12 $) (|Pattern| 12) (|InputForm|)
              (|Union| 12 '"failed") (|Union| 92 '"failed") (|List| $)
              (|Record| (|:| |coef| 92) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 94 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 49 ~ 55 |zero?| 60 |xor| 65 |unitNormal| 71 |unitCanonical| 76
              |unit?| 81 |symmetricRemainder| 86 |subtractIfCan| 92 |submod| 98
              |squareFreePart| 105 |squareFree| 110 |smaller?| 115 |sizeLess?|
              121 |sign| 127 |shift| 132 |sample| 138 |retractIfCan| 142
              |retract| 147 |rem| 152 |reducedSystem| 158 |recip| 169
              |rationalIfCan| 174 |rational?| 179 |rational| 184 |random| 189
              |quo| 198 |qconvert| 204 |principalIdeal| 209 |prime?| 214
              |powmod| 219 |positiveRemainder| 226 |positive?| 232
              |permutation| 237 |patternMatch| 243 |opposite?| 250 |one?| 256
              |odd?| 261 |not| 266 |nextItem| 271 |negative?| 276
              |multiEuclidean| 281 |mulmod| 287 |min| 294 |max| 304 |mask| 314
              |length| 319 |lcmCoef| 324 |lcm| 330 |latex| 341 |invmod| 346
              |init| 352 |inc| 356 |hashUpdate!| 361 |hash| 367 |gcdPolynomial|
              372 |gcd| 378 |factorial| 389 |factor| 394 |extendedEuclidean|
              399 |exquo| 412 |expressIdealMember| 418 |even?| 424
              |euclideanSize| 429 |divide| 434 |differentiate| 440 |dec| 451
              |copy| 456 |convert| 461 |coerce| 491 |characteristic| 511 |bit?|
              515 |binomial| 521 |base| 527 |associates?| 531 |annihilate?| 537
              |addmod| 543 |abs| 550 ^ 555 |\\/| 567 |Zero| 573 |Or| 577 |One|
              583 |OMwrite| 587 |Not| 611 D 616 |And| 627 >= 633 > 639 = 645 <=
              651 < 657 |/\\| 663 - 669 + 680 * 686)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |Logic&| NIL |SetCategory&| NIL NIL |OpenMath&| NIL NIL NIL NIL
                NIL NIL NIL NIL |RetractableTo&| NIL |PartialOrder&| NIL NIL
                NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitRingOver| 12) (|DifferentialRing|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 12)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|) (|Logic|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|ConvertibleTo| 10)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 86) (|ConvertibleTo| 84)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 88)
                 (|ConvertibleTo| 89) (|RetractableTo| 12) (|ConvertibleTo| 12)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 22))
              (|makeByteWordVec2| 101
                                  '(1 8 7 0 9 3 8 7 0 10 10 11 2 8 7 0 12 13 1
                                    8 7 0 14 1 8 7 0 15 1 8 7 0 16 1 12 22 0 23
                                    1 0 0 12 27 2 12 17 0 0 76 2 0 17 0 0 1 1 0
                                    0 0 35 1 0 17 0 59 2 0 0 0 0 42 1 0 80 0 81
                                    1 0 0 0 1 1 0 17 0 1 2 0 0 0 0 1 2 0 85 0 0
                                    1 3 0 0 0 0 0 69 1 0 0 0 1 1 0 97 0 1 2 0
                                    17 0 0 1 2 0 17 0 0 1 1 0 12 0 1 2 0 0 0 0
                                    66 0 0 0 1 1 0 90 0 1 1 0 12 0 1 2 0 0 0 0
                                    53 2 0 71 20 72 73 1 0 19 20 21 1 0 85 0 1
                                    1 0 82 0 1 1 0 17 0 1 1 0 83 0 1 1 0 0 0 79
                                    0 0 0 78 2 0 0 0 0 52 1 0 0 12 75 1 0 93 92
                                    1 1 0 17 0 1 3 0 0 0 0 0 1 2 0 0 0 0 74 1 0
                                    17 0 1 2 0 0 0 0 1 3 0 87 0 88 87 1 2 0 17
                                    0 0 1 1 0 17 0 60 1 0 17 0 58 1 0 0 0 36 1
                                    0 85 0 1 1 0 17 0 70 2 0 91 92 0 1 3 0 0 0
                                    0 0 67 0 0 0 33 2 0 0 0 0 62 0 0 0 32 2 0 0
                                    0 0 61 1 0 0 0 1 1 0 0 0 65 2 0 99 0 0 1 2
                                    0 0 0 0 1 1 0 0 92 1 1 0 10 0 1 2 0 0 0 0 1
                                    0 0 0 1 1 0 0 0 44 2 0 63 63 0 64 1 0 101 0
                                    1 2 0 98 98 98 1 2 0 0 0 0 56 1 0 0 92 1 1
                                    0 0 0 1 1 0 97 0 1 3 0 95 0 0 0 1 2 0 96 0
                                    0 1 2 0 85 0 0 1 2 0 91 92 0 1 1 0 17 0 1 1
                                    0 50 0 1 2 0 54 0 0 55 1 0 0 0 1 2 0 0 0 50
                                    1 1 0 0 0 45 1 0 0 0 1 1 0 10 0 26 1 0 84 0
                                    1 1 0 86 0 1 1 0 89 0 1 1 0 88 0 1 1 0 12 0
                                    25 1 0 0 12 77 1 0 0 0 1 1 0 0 12 77 1 0 22
                                    0 24 0 0 50 1 2 0 17 0 0 1 2 0 0 0 0 1 0 0
                                    0 31 2 0 17 0 0 1 2 0 17 0 0 1 3 0 0 0 0 0
                                    68 1 0 0 0 57 2 0 0 0 50 51 2 0 0 0 100 1 2
                                    0 0 0 0 38 0 0 0 29 2 0 0 0 0 41 0 0 0 30 3
                                    0 7 8 0 17 18 2 0 10 0 17 1 2 0 7 8 0 1 1 0
                                    10 0 1 1 0 0 0 39 1 0 0 0 1 2 0 0 0 50 1 2
                                    0 0 0 0 40 2 0 17 0 0 1 2 0 17 0 0 1 2 0 17
                                    0 0 34 2 0 17 0 0 1 2 0 17 0 0 43 2 0 0 0 0
                                    37 1 0 0 0 46 2 0 0 0 0 48 2 0 0 0 0 47 2 0
                                    0 12 0 28 2 0 0 0 0 49 2 0 0 50 0 1 2 0 0
                                    100 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
