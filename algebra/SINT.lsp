
(/VERSIONCHECK 2) 

(DEFUN |SINT;writeOMSingleInt| (|dev| |x| $)
  (SEQ
   (COND
    ((|less_SI| |x| 0)
     (SEQ (SPADCALL |dev| (QREFELT $ 9))
          (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 11))
          (SPADCALL |dev| (|minus_SI| |x|) (QREFELT $ 13))
          (EXIT (SPADCALL |dev| (QREFELT $ 14)))))
    ('T (SPADCALL |dev| |x| (QREFELT $ 13)))))) 

(DEFUN |SINT;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|SINT;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 16)) (QREFELT $ 17))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 18)) (|SINT;writeOMSingleInt| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 19)) (SPADCALL |dev| (QREFELT $ 20))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |SINT;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|SINT;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 16)) (QREFELT $ 17))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
          (|SINT;writeOMSingleInt| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 19))))
          (SPADCALL |dev| (QREFELT $ 20))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |SINT;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 18)) (|SINT;writeOMSingleInt| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 19))))) 

(DEFUN |SINT;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
       (|SINT;writeOMSingleInt| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 19))))))) 

(PUT '|SINT;reducedSystem;MM;6| '|SPADreplace| '(XLAM (|m|) |m|)) 

(DEFUN |SINT;reducedSystem;MM;6| (|m| $) |m|) 

(DEFUN |SINT;coerce;$Of;7| (|x| $) (SPADCALL |x| (QREFELT $ 30))) 

(PUT '|SINT;convert;$I;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |SINT;convert;$I;8| (|x| $) |x|) 

(DEFUN |SINT;*;I2$;9| (|i| |y| $) (|mul_SI| (SPADCALL |i| (QREFELT $ 33)) |y|)) 

(PUT '|SINT;Zero;$;10| '|SPADreplace| '(XLAM NIL 0)) 

(DEFUN |SINT;Zero;$;10| ($) 0) 

(PUT '|SINT;One;$;11| '|SPADreplace| '(XLAM NIL 1)) 

(DEFUN |SINT;One;$;11| ($) 1) 

(PUT '|SINT;base;$;12| '|SPADreplace| '(XLAM NIL 2)) 

(DEFUN |SINT;base;$;12| ($) 2) 

(PUT '|SINT;max;$;13| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(DEFUN |SINT;max;$;13| ($) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;14| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(DEFUN |SINT;min;$;14| ($) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;15| '|SPADreplace| '|eql_SI|) 

(DEFUN |SINT;=;2$B;15| (|x| |y| $) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;16| '|SPADreplace| '|not_SI|) 

(DEFUN |SINT;~;2$;16| (|x| $) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;17| '|SPADreplace| '|not_SI|) 

(DEFUN |SINT;not;2$;17| (|x| $) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;18| '|SPADreplace| '|and_SI|) 

(DEFUN |SINT;/\\;3$;18| (|x| |y| $) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;19| '|SPADreplace| '|or_SI|) 

(DEFUN |SINT;\\/;3$;19| (|x| |y| $) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;20| '|SPADreplace| '|not_SI|) 

(DEFUN |SINT;Not;2$;20| (|x| $) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;21| '|SPADreplace| '|and_SI|) 

(DEFUN |SINT;And;3$;21| (|x| |y| $) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;22| '|SPADreplace| '|or_SI|) 

(DEFUN |SINT;Or;3$;22| (|x| |y| $) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;23| '|SPADreplace| '|xor_SI|) 

(DEFUN |SINT;xor;3$;23| (|x| |y| $) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;24| '|SPADreplace| '|less_SI|) 

(DEFUN |SINT;<;2$B;24| (|x| |y| $) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;25| '|SPADreplace| '|inc_SI|) 

(DEFUN |SINT;inc;2$;25| (|x| $) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;26| '|SPADreplace| '|dec_SI|) 

(DEFUN |SINT;dec;2$;26| (|x| $) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;27| '|SPADreplace| '|minus_SI|) 

(DEFUN |SINT;-;2$;27| (|x| $) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;28| '|SPADreplace| '|add_SI|) 

(DEFUN |SINT;+;3$;28| (|x| |y| $) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;29| '|SPADreplace| '|sub_SI|) 

(DEFUN |SINT;-;3$;29| (|x| |y| $) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;30| '|SPADreplace| '|mul_SI|) 

(DEFUN |SINT;*;3$;30| (|x| |y| $) (|mul_SI| |x| |y|)) 

(DEFUN |SINT;^;$Nni$;31| (|x| |n| $) (SPADCALL (EXPT |x| |n|) (QREFELT $ 33))) 

(PUT '|SINT;quo;3$;32| '|SPADreplace| '|quo_SI|) 

(DEFUN |SINT;quo;3$;32| (|x| |y| $) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;33| '|SPADreplace| '|rem_SI|) 

(DEFUN |SINT;rem;3$;33| (|x| |y| $) (|rem_SI| |x| |y|)) 

(DEFUN |SINT;divide;2$R;34| (|x| |y| $)
  (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;35| '|SPADreplace| 'GCD) 

(DEFUN |SINT;gcd;3$;35| (|x| |y| $) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;36| '|SPADreplace| '|abs_SI|) 

(DEFUN |SINT;abs;2$;36| (|x| $) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;37| '|SPADreplace| '|odd?_SI|) 

(DEFUN |SINT;odd?;$B;37| (|x| $) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;38| '|SPADreplace| '|zero?_SI|) 

(DEFUN |SINT;zero?;$B;38| (|x| $) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;39| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(DEFUN |SINT;one?;$B;39| (|x| $) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;40| '|SPADreplace| '|max_SI|) 

(DEFUN |SINT;max;3$;40| (|x| |y| $) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;41| '|SPADreplace| '|min_SI|) 

(DEFUN |SINT;min;3$;41| (|x| |y| $) (|min_SI| |x| |y|)) 

(DEFUN |SINT;hashUpdate!;Hs$Hs;42| (|hs| |s| $)
  (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;43| '|SPADreplace| 'INTEGER-LENGTH) 

(DEFUN |SINT;length;2$;43| (|x| $) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;44| '|SPADreplace| '|lshift_SI|) 

(DEFUN |SINT;shift;3$;44| (|x| |n| $) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;45| '|SPADreplace| '|mulmod_SI|) 

(DEFUN |SINT;mulmod;4$;45| (|a| |b| |p| $) (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;46| '|SPADreplace| '|addmod_SI|) 

(DEFUN |SINT;addmod;4$;46| (|a| |b| |p| $) (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;47| '|SPADreplace| '|submod_SI|) 

(DEFUN |SINT;submod;4$;47| (|a| |b| |p| $) (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;48| '|SPADreplace| '|negative?_SI|) 

(DEFUN |SINT;negative?;$B;48| (|x| $) (|negative?_SI| |x|)) 

(PUT '|SINT;reducedSystem;MVR;49| '|SPADreplace| 'CONS) 

(DEFUN |SINT;reducedSystem;MVR;49| (|m| |v| $) (CONS |m| |v|)) 

(DEFUN |SINT;positiveRemainder;3$;50| (|x| |n| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;50|)
          (EXIT
           (COND
            ((|negative?_SI| |r|)
             (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                   (#1='T (|add_SI| |r| |n|))))
            (#1# |r|))))))) 

(PUT '|SINT;qconvert;I$;51| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |SINT;qconvert;I$;51| (|x| $) |x|) 

(DEFUN |SINT;coerce;I$;52| (|x| $)
  (SEQ
   (COND
    ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 82))
     (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
   (EXIT (|error| "integer too large to represent in a machine word")))) 

(DEFUN |SINT;random;$;53| ($)
  (SEQ (SETELT $ 6 (REMAINDER (* 314159269 (QREFELT $ 6)) 2147483647))
       (EXIT (REMAINDER (QREFELT $ 6) 67108864)))) 

(PUT '|SINT;random;2$;54| '|SPADreplace| 'RANDOM) 

(DEFUN |SINT;random;2$;54| (|n| $) (RANDOM |n|)) 

(DEFUN |SINT;unitNormal;$R;55| (|x| $)
  (COND ((|less_SI| |x| 0) (VECTOR -1 (|minus_SI| |x|) -1))
        ('T (VECTOR 1 |x| 1)))) 

(DEFUN |SingleInteger| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G1899)
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
             ((NOT #1#) (HREM |$ConstructorCache| '|SingleInteger|))))))))))) 

(DEFUN |SingleInteger;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|SingleInteger|) . #1=(|SingleInteger|))
      (LETT $ (GETREFV 108) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SingleInteger| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 1)
      $)))) 

(MAKEPROP '|SingleInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|seed| (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (|OpenMathEncoding|)
              (23 . |OMencodingXML|) (27 . |OMopenString|) (33 . |OMputObject|)
              (38 . |OMputEndObject|) (43 . |OMclose|) |SINT;OMwrite;$S;2|
              (|Boolean|) |SINT;OMwrite;$BS;3| |SINT;OMwrite;Omd$V;4|
              |SINT;OMwrite;Omd$BV;5| (|Matrix| 12) (|Matrix| $)
              |SINT;reducedSystem;MM;6| (|OutputForm|) (48 . |coerce|)
              |SINT;coerce;$Of;7| |SINT;convert;$I;8| (53 . |coerce|)
              |SINT;*;I2$;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;10|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;11|) $))
              |SINT;base;$;12| |SINT;max;$;13| |SINT;min;$;14| |SINT;=;2$B;15|
              |SINT;~;2$;16| |SINT;not;2$;17| |SINT;/\\;3$;18| |SINT;\\/;3$;19|
              |SINT;Not;2$;20| |SINT;And;3$;21| |SINT;Or;3$;22|
              |SINT;xor;3$;23| |SINT;<;2$B;24| |SINT;inc;2$;25|
              |SINT;dec;2$;26| |SINT;-;2$;27| |SINT;+;3$;28| |SINT;-;3$;29|
              |SINT;*;3$;30| (|NonNegativeInteger|) |SINT;^;$Nni$;31|
              |SINT;quo;3$;32| |SINT;rem;3$;33|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;34| |SINT;gcd;3$;35| |SINT;abs;2$;36|
              |SINT;odd?;$B;37| |SINT;zero?;$B;38| |SINT;one?;$B;39|
              |SINT;max;3$;40| |SINT;min;3$;41| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;42| |SINT;length;2$;43|
              |SINT;shift;3$;44| |SINT;mulmod;4$;45| |SINT;addmod;4$;46|
              |SINT;submod;4$;47| |SINT;negative?;$B;48|
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 12))) (|Vector| $)
              |SINT;reducedSystem;MVR;49| |SINT;positiveRemainder;3$;50|
              |SINT;qconvert;I$;51| (58 . <=) |SINT;coerce;I$;52|
              |SINT;random;$;53| |SINT;random;2$;54|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;55| (|Union| 89 '"failed") (|Fraction| 12)
              (|DoubleFloat|) (|Union| $ '"failed") (|Float|)
              (|PatternMatchResult| 12 $) (|Pattern| 12) (|InputForm|)
              (|Union| 12 '"failed")
              (|Record| (|:| |coef| 98) (|:| |generator| $)) (|List| $)
              (|Union| 98 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 101 '"failed") (|Factored| $)
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 64 ~ 70 |zero?| 75 |xor| 80 |unitNormal| 86 |unitCanonical| 91
              |unit?| 96 |symmetricRemainder| 101 |subtractIfCan| 107 |submod|
              113 |squareFreePart| 120 |squareFree| 125 |smaller?| 130
              |sizeLess?| 136 |sign| 142 |shift| 147 |sample| 153
              |retractIfCan| 157 |retract| 162 |rem| 167 |reducedSystem| 173
              |recip| 184 |rationalIfCan| 189 |rational?| 194 |rational| 199
              |random| 204 |quo| 213 |qconvert| 219 |principalIdeal| 224
              |prime?| 229 |powmod| 234 |positiveRemainder| 241 |positive?| 247
              |permutation| 252 |patternMatch| 258 |one?| 265 |odd?| 270 |not|
              275 |nextItem| 280 |negative?| 285 |multiEuclidean| 290 |mulmod|
              296 |min| 303 |max| 313 |mask| 323 |length| 328 |lcmCoef| 333
              |lcm| 339 |latex| 350 |invmod| 355 |init| 361 |inc| 365
              |hashUpdate!| 370 |hash| 376 |gcdPolynomial| 381 |gcd| 387
              |factorial| 398 |factor| 403 |extendedEuclidean| 408 |exquo| 421
              |expressIdealMember| 427 |even?| 433 |euclideanSize| 438 |divide|
              443 |differentiate| 449 |dec| 460 |copy| 465 |convert| 470
              |coerce| 495 |characteristic| 515 |bit?| 519 |binomial| 525
              |base| 531 |associates?| 535 |addmod| 541 |abs| 548 ^ 553 |\\/|
              565 |Zero| 571 |Or| 575 |One| 581 |OMwrite| 585 |Not| 609 D 614
              |And| 625 >= 631 > 637 = 643 <= 649 < 655 |/\\| 661 - 667 + 678 *
              684)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL NIL
                |Algebra&| NIL NIL |DifferentialRing&| |OrderedRing&| NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |Logic&| NIL |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                NIL |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|Algebra| $$) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 12) (|DifferentialRing|)
                 (|OrderedRing|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 12)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|) (|Logic|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 92)
                 (|ConvertibleTo| 90) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 94) (|ConvertibleTo| 95) (|RetractableTo| 12)
                 (|ConvertibleTo| 12) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 29))
              (|makeByteWordVec2| 107
                                  '(1 8 7 0 9 3 8 7 0 10 10 11 2 8 7 0 12 13 1
                                    8 7 0 14 0 15 0 16 2 8 0 10 15 17 1 8 7 0
                                    18 1 8 7 0 19 1 8 7 0 20 1 12 29 0 30 1 0 0
                                    12 33 2 12 22 0 0 82 2 0 22 0 0 1 1 0 0 0
                                    41 1 0 22 0 65 2 0 0 0 0 48 1 0 86 0 87 1 0
                                    0 0 1 1 0 22 0 1 2 0 0 0 0 1 2 0 91 0 0 1 3
                                    0 0 0 0 0 75 1 0 0 0 1 1 0 103 0 1 2 0 22 0
                                    0 1 2 0 22 0 0 1 1 0 12 0 1 2 0 0 0 0 72 0
                                    0 0 1 1 0 96 0 1 1 0 12 0 1 2 0 0 0 0 59 2
                                    0 77 27 78 79 1 0 26 27 28 1 0 91 0 1 1 0
                                    88 0 1 1 0 22 0 1 1 0 89 0 1 1 0 0 0 85 0 0
                                    0 84 2 0 0 0 0 58 1 0 0 12 81 1 0 97 98 1 1
                                    0 22 0 1 3 0 0 0 0 0 1 2 0 0 0 0 80 1 0 22
                                    0 1 2 0 0 0 0 1 3 0 93 0 94 93 1 1 0 22 0
                                    66 1 0 22 0 64 1 0 0 0 42 1 0 91 0 1 1 0 22
                                    0 76 2 0 99 98 0 1 3 0 0 0 0 0 73 0 0 0 39
                                    2 0 0 0 0 68 0 0 0 38 2 0 0 0 0 67 1 0 0 0
                                    1 1 0 0 0 71 2 0 105 0 0 1 1 0 0 98 1 2 0 0
                                    0 0 1 1 0 10 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0
                                    0 50 2 0 69 69 0 70 1 0 107 0 1 2 0 104 104
                                    104 1 1 0 0 98 1 2 0 0 0 0 62 1 0 0 0 1 1 0
                                    103 0 1 2 0 100 0 0 1 3 0 102 0 0 0 1 2 0
                                    91 0 0 1 2 0 99 98 0 1 1 0 22 0 1 1 0 56 0
                                    1 2 0 60 0 0 61 1 0 0 0 1 2 0 0 0 56 1 1 0
                                    0 0 51 1 0 0 0 1 1 0 90 0 1 1 0 92 0 1 1 0
                                    95 0 1 1 0 94 0 1 1 0 12 0 32 1 0 0 12 83 1
                                    0 0 12 83 1 0 0 0 1 1 0 29 0 31 0 0 56 1 2
                                    0 22 0 0 1 2 0 0 0 0 1 0 0 0 37 2 0 22 0 0
                                    1 3 0 0 0 0 0 74 1 0 0 0 63 2 0 0 0 56 57 2
                                    0 0 0 106 1 2 0 0 0 0 44 0 0 0 35 2 0 0 0 0
                                    47 0 0 0 36 2 0 7 8 0 24 3 0 7 8 0 22 25 1
                                    0 10 0 21 2 0 10 0 22 23 1 0 0 0 45 1 0 0 0
                                    1 2 0 0 0 56 1 2 0 0 0 0 46 2 0 22 0 0 1 2
                                    0 22 0 0 1 2 0 22 0 0 40 2 0 22 0 0 1 2 0
                                    22 0 0 49 2 0 0 0 0 43 2 0 0 0 0 54 1 0 0 0
                                    52 2 0 0 0 0 53 2 0 0 12 0 34 2 0 0 0 0 55
                                    2 0 0 56 0 1 2 0 0 106 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
